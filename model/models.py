from flask_sqlalchemy import SQLAlchemy
import json

db = SQLAlchemy()


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

    # def getDatos(self):
    #     return {
    #         'ID_USUARIO': self.ID_USUARIO,
    #         'CEDULA': self.CEDULA,
    #         'NOMBRES': self.NOMBRES,
    #         'APELLIDOS': self.APELLIDOS,
    #         'CORREO': self.CORREO,
    #         'USUARIO': self.USUARIO,
    #         'CONTRASENA': self.CONTRASENA,
    #         'ID_ROL': self.ID_ROL,
    #         'ESTADO': self.ESTADO,
    #     }
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


class Roles(db.Model):
    ID_ROL = db.Column(db.Integer, primary_key=True)
    ROL = db.Column(db.String(255), nullable=False)
    ESTADO = db.Column(db.Integer, nullable=False, default=1)
    FECHA_CREACION = db.Column(db.TIMESTAMP)

    def __init__(self, payload):
        self.ROL = payload['ROL']
        self.ESTADO = 1
        # self.FECHA_CREACION = FECHA_CREACION

    # def getDatos(self):
    #     return {
    #         'ID_ROL': self.ID_ROL,
    #         'ROL': self.ROL,
    #         'ESTADO': self.ESTADO,
    #         # 'FECHA_CREACION': self.FECHA_CREACION,
    #     }
    def __repr__(self) -> str:
        columnas = {
            "ID_ROL": self.ID_ROL,
            "ROL": self.ROL,
            "ESTADO": self.ESTADO,
        }
        return json.dumps(columnas)


class Huella(db.Model):
    ID = db.Column(db.Integer, primary_key=True)
    ID_USUARIO = db.Column(db.Integer)
    # añadir tipo de dato datatime y valor por defecto
    FECHA_CREACION = db.Column(db.TIMESTAMP)
    FECHA_MODIFICACION = db.Column(db.TIMESTAMP)
    ESTADO = db.Column(db.Integer, nullable=False, default=1)

    def getDatos(self):
        return {
            'ID': self.ID,
            'ID_USUARIO': self.ID_USUARIO,
            'FECHA_CREACION': self.FECHA_CREACION,
            'FECHA_MODIFICACION': self.FECHA_MODIFICACION,
            'ESTADO': self.ESTADO
        }


class Log_Ingresos(db.Model):
    ID = db.Column(db.Integer, primary_key=True)
    ID_USUARIO = db.Column(db.Integer)
    # añadir tipo de dato datatime y valor por defecto
    FECHA = db.Column(db.TIMESTAMP)

    def getDatos(self):
        return {
            'ID': self.ID,
            'ID_USUARIO': self.ID_USUARIO,
            'FECHA': self.FECHA
        }
