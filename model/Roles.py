from utils.db import db
import json

class Roles(db.Model):
    ID_ROL = db.Column(db.Integer, primary_key=True)
    ROL = db.Column(db.String(255), nullable=False)
    ESTADO = db.Column(db.Integer, nullable=False, default=1)
    FECHA_CREACION = db.Column(db.TIMESTAMP)

    def __init__(self, payload):
        self.ROL = payload['ROL']
        self.ESTADO = 1
        # self.FECHA_CREACION = FECHA_CREACION

    def __repr__(self) -> str:
        columnas = {
            "ID_ROL": self.ID_ROL,
            "ROL": self.ROL,
            "ESTADO": self.ESTADO,
        }
        return json.dumps(columnas)