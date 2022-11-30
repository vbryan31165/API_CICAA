
from jwt import encode, decode
from jwt import exceptions
from datetime import datetime, timedelta
from flask import jsonify
from model.Usuario import Usuarios as usuariosModel
secret = 'xXcicaaXx'


def token(userbd):
    token = encode({'ID_USUARIO': userbd["ID_USUARIO"], 'CEDULA': userbd["CEDULA"], 'NOMBRES': userbd["NOMBRES"], 'APELLIDOS': userbd["APELLIDOS"], 'CORREO': userbd["CORREO"], 'ROL': userbd["ROL"], 'exp': datetime.utcnow(
    ) + timedelta(minutes=60)}, secret, algorithm="HS256")
    return token


def expire_date(days: int):
    now = datetime.now()
    new_date = now + timedelta(days)
    return new_date


def write_token(data: dict):
    token = encode(payload={**data, "exp": expire_date(2)},
                   key=secret, algorithm="HS256")
    return token.encode("UTF-8")


def validate_token(token, output=False):
    try:
        if output:
            return decode(token, key=secret, algorithms="HS256")
        decode(token, key=secret, algorithms="HS256")
    except exceptions.DecodeError:
        response = jsonify("message", "Invalid token")
        response.status_code = 400
        return response
    except exceptions.ExpiredSignatureError:
        response = jsonify("message", "Token expired")
        response.status_code = 400
        return response
