import datetime
from flask import Flask, jsonify, request, Blueprint
from model.Usuario import Usuarios as usuariosModel
import json
from utils.db import db
import jwt


key = 'lnf1ern0xsex'


class Usuario():

    def index(self):
        try:
            return jsonify({'message': 'welcome'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_All_Users(self):
        try:
            if request.method == 'GET':
                data = []
                usuarios = usuariosModel.query.filter_by(ID_ROL=3).all()
            if len(usuarios) == 0:
                return jsonify({'message': 'no hay usuarios'})
            else:
                data = [{"ID_USUARIO": i.ID_USUARIO, "CEDULA": i.CEDULA, "NOMBRES": i.NOMBRES,
                         "APELLIDOS": i.APELLIDOS, "ID_ROL": i.ID_ROL} for i in usuarios]
                return jsonify(((data)))
        except Exception as e:
            return jsonify({"message": str(e)})

    def select_One_User(self, id_Usuario):
        try:
            usuario = usuariosModel.query.filter_by(
                ID_USUARIO=id_Usuario).first()
            if usuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                return jsonify(json.loads(str(usuario)))
        except Exception as e:
            return jsonify({"message": str(e)})

    def create_usuario():
        try:
            new_user = usuariosModel(request.json)
            db.session.add(new_user)
            db.session.commit()
            return jsonify({'message': 'usuario guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def update_usuario(self, id_Usuario):
        try:
            idUsuario = usuariosModel.query.get(id_Usuario)

            if idUsuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                usuario = db.session.query(usuariosModel).filter(
                    usuariosModel.ID_USUARIO == id_Usuario)
                usuario.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario actualizado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def delete_user(self, id_Usuario):
        try:
            idUsuario = usuariosModel.query.get(id_Usuario)

            if idUsuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                usuario = db.session.query(usuariosModel).filter(
                    usuariosModel.ID_USUARIO == id_Usuario)
                usuario.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario eliminado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def login(data):
        try:

            userbd = db.session.query(usuariosModel).filter(
                usuariosModel.CORREO == data["CORREO"], usuariosModel.CONTRASENA == data["CONTRASENA"]).first()
            if userbd != None:

                token = jwt.encode({'public_id': userbd.ID_USUARIO, 'exp': datetime.datetime.utcnow(
                ) + datetime.timedelta(minutes=45)}, key, algorithm="HS256")
                return jsonify({'message': "ok",
                                'userId': userbd.ID_USUARIO,
                                'rol': userbd.ID_ROL,
                                'token': token,
                                'name': userbd.USUARIO
                                })
            else:
                return jsonify({'message': "fail"})
        except Exception as e:
            return jsonify({'message': str(e)})

    def informacionPerfil(data):
        try:

            userbd = db.session.query(usuariosModel).filter(
                usuariosModel.ID_USUARIO == data["ID_USUARIO"]).first()
            if userbd != None:
                return jsonify({
                    'NOMBRES': userbd.NOMBRES,
                    'APELLIDOS': userbd.APELLIDOS,
                    'CORREO': userbd.CORREO,
                    'ID_ROL': userbd.ID_ROL
                })
            else:
                return jsonify({'message': "!!!Error!!! no se ha encontrado el usuario"})
        except Exception as e:
            return jsonify({'message': str(e)})
