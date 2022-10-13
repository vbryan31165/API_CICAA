from flask_sqlalchemy import SQLAlchemy

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
    FECHA_CREACION = db.Column(db.Integer, nullable=False, default=1)

    def __init__(self, ID_USUARIO, CEDULA, NOMBRES, APELLIDOS, CORREO, USUARIO, CONTRASENA):
        self.ID_USUARIO = ID_USUARIO
        self.CEDULA = CEDULA
        self.NOMBRES = NOMBRES
        self.APELLIDOS = APELLIDOS
        self.CORREO = CORREO
        self.USUARIO = USUARIO
        self.CONTRASENA = CONTRASENA
        self.ID_ROL = 3
        self.ESTADO = 1

    def getDatos(self):
        return {
            'ID_USUARIO': self.ID_USUARIO,
            'CEDULA': self.CEDULA,
            'NOMBRES': self.NOMBRES,
            'APELLIDOS': self.APELLIDOS,
            'CORREO': self.CORREO,
            'USUARIO': self.USUARIO,
            'CONTRASENA': self.CONTRASENA,
            'ID_ROL': self.ID_ROL,
            'ESTADO': self.ESTADO,
            'FECHA_CREACION': self.FECHA_CREACION,
        }


class Roles(db.Model):
    ID_ROL = db.Column(db.Integer, primary_key=True)
    ROL = db.Column(db.String(255), nullable=False)
    ESTADO = db.Column(db.String(255), nullable=False)
    FECHA_CREACION = db.Column(db.Integer, nullable=False, default=1)

    def __init__(self, ID_ROL,ROL,ESTADO,FECHA_CREACION):
        self.ID_ROL = ID_ROL
        self.ROL = ROL
        self.ESTADO = 1
        self.FECHA_CREACION = FECHA_CREACION

    def getDatos(self):
        return {
            'ID_ROL': self.ID_ROL,
            'ROL': self.ROL,
            'ESTADO': self.ESTADO,
            'FECHA_CREACION': self.FECHA_CREACION,
        }