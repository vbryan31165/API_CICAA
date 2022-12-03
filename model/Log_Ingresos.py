import datetime
from utils.db import db
import json
from sqlalchemy.sql import func


class LogIngresos(db.Model):
    ID = db.Column(db.Integer, primary_key=True)
    ID_USUARIO = db.Column(db.Integer)
    FECHA = db.Column(db.TIMESTAMP,server_default=func.now())
    ID_SALON = db.Column(db.Integer)
    ESTADO = db.Column(db.Integer, default=0)

    def __init__(self, payload):
        self.ID_USUARIO = payload['ID_USUARIO'],
        # self.FECHA = payload['FECHA'],
        self.ID_SALON = payload['ID_SALON'],
        self.ESTADO = payload['ESTADO']

    def __repr__(self) -> str:
        columnas = {
            "ID": self.ID,
            "ID_USUARIO": self.ID_USUARIO,
            "FECHA": str(self.FECHA)
        }
        return json.dumps(columnas)
