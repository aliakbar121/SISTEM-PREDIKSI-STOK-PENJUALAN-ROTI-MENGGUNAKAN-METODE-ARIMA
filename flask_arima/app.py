from flask import Flask, render_template, request, redirect, url_for, flash
from sklearn.metrics import mean_absolute_error, mean_squared_error
import pandas as pd
from datetime import datetime, timedelta
import numpy as np
import mysql.connector
import warnings
from models.arima_utils import make_stationary, train_arima_model, predict_future
from confiq import db_confiq

warnings.filterwarnings("ignore")

app = Flask(__name__)

app.secret_key = 'lulus'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

def get_db_connection():
    """Membuat dan mengembalikan koneksi ke database."""
    try:
        conn = mysql.connector.connect(**db_confiq.DB_CONFIG)
        return conn
    except mysql.connector.Error as err:
        raise Exception(f"Tidak dapat terhubung ke database: {err}") from err

@app.route('/', methods=['GET'])
def home():
    return redirect(url_for('upload_file'))

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    error = None
    if request.method == 'POST':
        if 'file' not in request.files or not request.files['file'].filename:
            flash("Tidak ada file yang dipilih. Silakan pilih file Excel untuk diunggah.", "warning")
            return redirect(request.url)

        file = request.files['file']
        if file and file.filename.endswith('.xlsx'):
            try:
                # 1. Baca dan proses dataset BARU dari file Excel
                df_new = pd.read_excel(file)
                
                required_columns = {'tanggal', 'jenis roti', 'jumlah terjual', 'hari'}
                if not required_columns.issubset(df_new.columns):
                    raise ValueError("File Excel harus mengandung kolom: 'tanggal', 'jenis roti', 'jumlah terjual', dan 'hari'.")

                df_new = df_new[list(required_columns)]
                df_new.rename(columns={'jumlah terjual': 'jumlah_terjual'}, inplace=True)

                df_new['tanggal'] = pd.to_datetime(df_new['tanggal'], errors='coerce')
                df_new['jumlah_terjual'] = pd.to_numeric(df_new['jumlah_terjual'], errors='coerce')
                df_new.dropna(subset=['tanggal', 'jumlah_terjual'], inplace=True)
                
                # 2. Ambil data LAMA dari database dan bersihkan
                conn = get_db_connection()
                query = "SELECT id, tanggal, jumlah_terjual FROM penjualan ORDER BY tanggal"
                df_old = pd.read_sql(query, conn)
                conn.close()
                if not df_old.empty:
                    df_old['tanggal'] = pd.to_datetime(df_old['tanggal'], errors='coerce')
                    df_old['jumlah_terjual'] = pd.to_numeric(df_old['jumlah_terjual'], errors='coerce')
                    df_old.dropna(subset=['tanggal', 'jumlah_terjual'], inplace=True)

                # 3. GABUNGKAN dataset untuk pemodelan
                ts_old = df_old[['tanggal', 'jumlah_terjual']] if not df_old.empty else pd.DataFrame(columns=['tanggal', 'jumlah_terjual'])
                ts_new = df_new[['tanggal', 'jumlah_terjual']]
                
                ts_combined = pd.concat([ts_old, ts_new], ignore_index=True)
                ts_combined.drop_duplicates(subset=['tanggal'], keep='last', inplace=True)
                
                ts_combined['jumlah_terjual'] = ts_combined['jumlah_terjual'].astype(float)
                
                ts_combined.set_index('tanggal', inplace=True)
                ts_combined.sort_index(inplace=True)

                if ts_combined.empty or ts_combined['jumlah_terjual'].isnull().any():
                    raise ValueError("Data gabungan kosong atau mengandung nilai null setelah diproses.")

                # 4. Latih model dan buat prediksi
                df_stationary = make_stationary(ts_combined['jumlah_terjual'])
                model = train_arima_model(df_stationary)
                
                forecast = predict_future(model, steps=30)
                future_values = forecast.tolist()
                last_date = ts_combined.index[-1]
                future_dates = pd.date_range(start=last_date + timedelta(days=1), periods=30)

                # 5. Simpan data BARU dan hasil PREDIKSI ke database
                conn = get_db_connection()
                cursor = conn.cursor()

                for _, row in df_new.iterrows():
                    cursor.execute("""
                        INSERT INTO penjualan (tanggal, jumlah_terjual, jenis_roti, hari)
                        VALUES (%s, %s, %s, %s)
                        ON DUPLICATE KEY UPDATE
                            jumlah_terjual = VALUES(jumlah_terjual),
                            jenis_roti = VALUES(jenis_roti),
                            hari = VALUES(hari)
                    """, (row['tanggal'].date(), float(row['jumlah_terjual']), row['jenis roti'], row['hari']))
                
                cursor.execute("TRUNCATE TABLE prediksi")

                for date, value in zip(future_dates, future_values):
                    cursor.execute("""
                        INSERT INTO prediksi (tanggal, prediksi)
                        VALUES (%s, %s)
                    """, (date.strftime('%Y-%m-%d'), value))

                conn.commit()
                cursor.close()
                conn.close()
                
                flash("File berhasil diunggah dan prediksi telah diperbarui.", "success")
                return redirect(url_for('show_prediction'))

            except Exception as e:
                error = f"Terjadi kesalahan saat memproses file: {str(e)}"

        else:
            error = "Format file tidak valid. Silakan unggah file Excel (.xlsx)"

    return render_template('upload.html', error=error)

@app.route('/delete_after_id', methods=['POST'])
def delete_after_id():
    """Menghapus data penjualan setelah ID tertentu."""
    target_id = request.form.get('target_id')

    if not target_id or not target_id.isdigit():
        flash("Harap masukkan ID yang valid.", "danger")
        return redirect(url_for('show_prediction'))

    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        cursor.execute("DELETE FROM penjualan WHERE id > %s", (int(target_id),))
        deleted_count = cursor.rowcount 

        cursor.execute("TRUNCATE TABLE prediksi")
        
        conn.commit()
        cursor.close()
        conn.close()
        
        flash(f"Berhasil menghapus {deleted_count} baris data setelah ID {target_id}. Prediksi lama juga telah dihapus.", "success")
        
    except Exception as e:
        flash(f"Gagal menghapus data: {str(e)}", "danger")
        
    return redirect(url_for('upload_file'))

@app.route('/delete_data', methods=['POST'])
def delete_all_data():
    """Menghapus SEMUA data dari tabel 'penjualan' dan 'prediksi'."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        cursor.execute("TRUNCATE TABLE penjualan")
        cursor.execute("TRUNCATE TABLE prediksi")
        
        conn.commit()
        cursor.close()
        conn.close()
        
        flash("Semua data penjualan dan prediksi telah berhasil dihapus.", "success")
        
    except Exception as e:
        flash(f"Gagal menghapus data: {str(e)}", "danger")
        
    return redirect(url_for('upload_file'))


@app.route('/prediction')
def show_prediction():
    try:
        conn = get_db_connection()

        query_history = "SELECT tanggal, jumlah_terjual FROM penjualan ORDER BY tanggal"
        df_history = pd.read_sql(query_history, conn)
        
        mae, mse = None, None
        historical_dates, train_data_chart, test_actual_chart, test_predictions_chart = [], [], [], []

        if not df_history.empty and len(df_history) > 10:
            df_history['tanggal'] = pd.to_datetime(df_history['tanggal'])
            df_history.set_index('tanggal', inplace=True)
            
            split_index = int(len(df_history) * 0.8)
            train_data, test_data = df_history.iloc[:split_index], df_history.iloc[split_index:]

            if not train_data.empty and not test_data.empty:
                train_stationary = make_stationary(train_data['jumlah_terjual'])
                model_for_test = train_arima_model(train_stationary)
                
                test_forecast = predict_future(model_for_test, steps=len(test_data))

                actual_values = test_data['jumlah_terjual'].values
                mae = mean_absolute_error(actual_values, test_forecast)
                mse = mean_squared_error(actual_values, test_forecast)

                # 1. Siapkan data untuk garis 'Data Train' (Biru)
                train_data_chart = train_data['jumlah_terjual'].tolist() + [None] * len(test_data)
                
                # 2. Siapkan data untuk garis 'Data Test' (Hijau)
                test_actual_chart = [None] * len(train_data) + test_data['jumlah_terjual'].tolist()

                # 3. Siapkan data untuk garis 'Prediksi ARIMA' (Merah)
                test_predictions_chart = [None] * len(train_data) + test_forecast.tolist()

                # 4. Siapkan label tanggal untuk sumbu X
                historical_dates = df_history.index.strftime('%Y-%m-%d').tolist()
        
        query_future = "SELECT tanggal, prediksi FROM prediksi ORDER BY tanggal"
        df_pred = pd.read_sql(query_future, conn)
        conn.close()

        future_dates, future_values = [], []
        if not df_pred.empty:
            df_pred['tanggal'] = pd.to_datetime(df_pred['tanggal'])
            future_dates = df_pred['tanggal'].dt.strftime('%Y-%m-%d').tolist()
            future_values = df_pred['prediksi'].tolist()

        return render_template(
            'prediction.html',
            # Variabel baru untuk grafik evaluasi
            historical_dates=historical_dates,
            train_data_chart=train_data_chart,
            test_actual_chart=test_actual_chart,
            test_predictions_chart=test_predictions_chart,
            # Variabel lama tetap ada
            future_dates=future_dates,
            future_values=future_values,
            mae=mae,
            mse=mse,
            current_year=datetime.now().year,
            error=None
        )
    except Exception as e:
        error = f"Tidak dapat mengambil data prediksi: {str(e)}"
        return render_template('prediction.html', error=error, current_year=datetime.now().year)

if __name__ == '__main__':
    app.run(debug=True)

