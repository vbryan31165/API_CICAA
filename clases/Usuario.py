import datetime
from flask import Flask, jsonify, request, Blueprint
from model.Usuario import Usuarios as usuariosModel
from model.Roles import Roles as rolesModel
import json
from utils.db import db
from utils.jwt_funciones import token as jwt_token
import jwt


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
                usuarios = usuariosModel.query.filter_by(ID_ROL=2).all()
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
            # print("aqui dadta ------------")
            # print(data["CORREO"])
            test = ["ROL", "ID_USUARIO", "CEDULA",
                    "NOMBRES", "APELLIDOS", "CORREO"]
            dict = {}
            cont = 0

            userbd = db.session.query(rolesModel.ROL, usuariosModel.ID_USUARIO, usuariosModel.CEDULA, usuariosModel.NOMBRES, usuariosModel.APELLIDOS, usuariosModel.CORREO).join(
                rolesModel, rolesModel.ID_ROL == usuariosModel.ID_ROL).filter(usuariosModel.CORREO == data["CORREO"], usuariosModel.CONTRASENA == data["CONTRASENA"]).first()
            # print("aqui consulta --------->")
            # print(userbd)
            # for i in userbd:
            #     dict[test[cont]] = i
            #     cont += 1
            # cont = 0

            # # print(userbd1[1].ROL)
            # print("aquiiiiiiiiiiiiiiiii")
            # print(data_dict)
            # print(dict)
            # userbd = db.session.query(usuariosModel).filter(
            #     usuariosModel.CORREO == data["CORREO"], usuariosModel.CONTRASENA == data["CONTRASENA"]).first()
            # print(dict)
            if userbd != None:
                data_dict = {test[i]: userbd[i] for i in range(0, len(userbd))}
                token = jwt_token(data_dict)
                return jsonify({'message': "ok", 'token': token})
            else:
                return jsonify({'message': "Error usuario no encontrado, Volver a intentar"})
        except Exception as e:
            return jsonify({'message': str(e)})
