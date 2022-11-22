from utils.db import db
import json


class Huella(db.Model):
    ID = db.Column(db.Integer, primary_key=True)
    ID_USUARIO = db.Column(db.Integer)
    FECHA_CREACION = db.Column(db.TIMESTAMP)
    FECHA_MODIFICACION = db.Column(db.TIMESTAMP)
    ESTADO = db.Column(db.Integer, nullable=False, default=1)

    def __init__(self, payload):
        self.ID = payload['CEDULA']
        self.ID_USUARIO = payload['ID_USUARIO'],
        self.FECHA_CREACION = payload['FECHA_CREACION'],
        self.ESTADO = payload['ESTADO']

    def __repr__(self) -> str:
        columnas = {
            "ID": self.ID,
            "ID_USUARIO": self.ID_USUARIO,
            # "FECHA_CREACION": self.FECHA_CREACION,
            # "FECHA_MODIFICACION": self.FECHA_MODIFICACION,
            "ESTADO": self.ESTADO
        }
        return json.dumps(columnas)
