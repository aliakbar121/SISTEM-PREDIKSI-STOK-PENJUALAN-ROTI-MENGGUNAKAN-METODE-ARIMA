-- prediksi.sql
CREATE TABLE IF NOT EXISTS prediksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    prediksi FLOAT NOT NULL,
    UNIQUE (tanggal)
);