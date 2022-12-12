from utils.db import db
import json


class Permisos(db.Model):
    ID_PERMISO = db.Column(db.Integer, primary_key=True)
    PERMISO = db.Column(db.Integer)
    ID_USUARIO = db.Column(db.Integer)
    ID_SALON = db.Column(db.Integer)

    def __init__(self, payload):
        # self.ID_PERMISO = payload['ID_PERMISO'],
        self.PERMISO = payload['PERMISO'],
        # self.ID_USUARIO= payload['ID_USUARIO'],
        self.ID_SALON = payload['ID_SALON']

    def __repr__(self) -> str:
        columnas = {
            "ID_PERMISO": self.ID_PERMISO,
            "PERMISO": self.PERMISO,
            "ID_USUARIO": self.ID_USUARIO,
            "ID_SALON": self.ID_SALON
        }
        return json.dumps(columnas)
