from flask_sqlalchemy import SQLAlchemy
import json
from utils.db import db


class Usuarios(db.Model):
    ID_USUARIO = db.Column(db.Integer, primary_key=True)
    CEDULA = db.Column(db.String(255), nullable=False)
    NOMBRES = db.Column(db.String(255), nullable=False)
    APELLIDOS = db.Column(db.String(255), nullable=False)
    CORREO = db.Column(db.String(255), nullable=False)
    USUARIO = db.Column(db.String(255), nullable=True)
    CONTRASENA = db.Column(db.String(255), nullable=False)
    ID_ROL = db.Column(db.Integer, nullable=False)
    ESTADO = db.Column(db.Integer, unique=True, nullable=False)
    FECHA_CREACION = db.Column(db.TIMESTAMP)

    def __init__(self, payload):
        self.CEDULA = payload['CEDULA']
        self.NOMBRES = payload['NOMBRES']
        self.APELLIDOS = payload['APELLIDOS']
        self.CORREO = payload['CORREO']
        self.USUARIO = payload['USUARIO']
        self.CONTRASENA = payload['CONTRASENA']
        self.ID_ROL = payload['ID_ROL']
        self.ESTADO = 1

    def __repr__(self) -> str:
        columnas = {
            "ID_USUARIO": self.ID_USUARIO,
            "CEDULA": self.CEDULA,
            "NOMBRES": self.NOMBRES,
            "APELLIDOS": self.APELLIDOS,
            "CORREO": self.CORREO,
            "USUARIO": self.USUARIO,
            "CONTRASENA": self.CONTRASENA,
            "ID_ROL": self.ID_ROL,
            "ESTADO": self.ESTADO,
        }
        return json.dumps(columnas)
