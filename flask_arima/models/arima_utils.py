# models/arima_utils.py

import pandas as pd
from statsmodels.tsa.arima.model import ARIMA
from statsmodels.tsa.stattools import adfuller
import numpy as np

def make_stationary(data):
    result = adfuller(data)
    print(f"ADF p-value: {result[1]}")
    if result[1] > 0.05:
        data = data.diff().dropna()
    return data

def train_arima_model(train_data, order=(3, 0, 4)):
    model = ARIMA(train_data, order=order)
    model_fit = model.fit()
    return model_fit

def predict_future(model, steps=30):
    forecast = model.get_forecast(steps=steps)
    predicted_mean = forecast.predicted_mean
    return predicted_mean