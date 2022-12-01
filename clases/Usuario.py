import datetime
from flask import Flask, jsonify, request, Blueprint
from model.Usuario import Usuarios as usuariosModel
from model.Roles import Roles as rolesModel
from model.Permisos import Permisos as permisosModel
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
                         "APELLIDOS": i.APELLIDOS, "ID_ROL": i.ID_ROL, "CORREO": i.CORREO} for i in usuarios]
                return jsonify(((data)))
        except Exception as e:
            return jsonify({"message": str(e)})

    def select_Permisos(self):
        try:
            if request.method == "GET":
                data = []
                permisos = db.session.query(permisosModel.ID_PERMISO, permisosModel.ID_USUARIO, permisosModel.ID_SALON, usuariosModel.NOMBRES, usuariosModel.ID_ROL, usuariosModel.APELLIDOS, permisosModel.PERMISO).join(
                    permisosModel, permisosModel.ID_USUARIO == usuariosModel.ID_USUARIO).all()
                if len(permisos) == 0:
                    return jsonify({'message': 'No hay permisos'})
                else:
                    data = [{'ID_PERMISO': i.ID_PERMISO, 'ID_USUARIO': i.ID_USUARIO, 'ID_SALON': i.ID_SALON, 'NOMBRES': i.NOMBRES,
                             'APELLIDOS': i.APELLIDOS} for i in permisos]
                    return data
        except Exception as e:
            return jsonify({"message": str(e)})

    def select_Permisos_Usuario(self, id_usuario):
        try:
            data = []
            permiso = db.session.query(permisosModel.ID_PERMISO, permisosModel.PERMISO, permisosModel.ID_SALON, usuariosModel.NOMBRES, usuariosModel.APELLIDOS).join(
                permisosModel, permisosModel.ID_USUARIO == usuariosModel.ID_USUARIO).filter(permisosModel.ID_USUARIO == id_usuario).all()

            print(permiso)
            if permiso == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                data = [{'ID_PERMISO': str(i.ID_PERMISO), 'NOMBRES': i.NOMBRES,
                         'APELLIDOS': i.APELLIDOS, 'ID_SALON': str(i.ID_SALON), 'PERMISO': str(i.PERMISO)}for i in permiso]
                return jsonify(data)
        except Exception as e:
            return jsonify({"message": str(e)})

    def select_One_Permiso(self, id_permiso):
        try:
            data = []
            permiso = db.session.query(permisosModel.ID_PERMISO, permisosModel.PERMISO, permisosModel.ID_SALON, usuariosModel.NOMBRES, usuariosModel.APELLIDOS).join(
                permisosModel, permisosModel.ID_USUARIO == usuariosModel.ID_USUARIO).filter(permisosModel.ID_PERMISO == id_permiso).all()

            print(permiso)
            if permiso == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                data = [{'ID_PERMISO': str(i.ID_PERMISO), 'NOMBRES': i.NOMBRES,
                         'APELLIDOS': i.APELLIDOS, 'ID_SALON': str(i.ID_SALON), 'PERMISO': str(i.PERMISO)}for i in permiso]
                return jsonify(data)
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

    def update_permiso(self):
        try:

            permiso=request.json
            print(permiso)
            idPermiso = permisosModel.query.get(permiso['ID_PERMISO'])

            print("id aquiiiiiiiiiiiiiii ->")
            print(idPermiso)

            if idPermiso == None:
                return jsonify({'message': 'Permiso no encontrado'})
            else:
                idPermiso.PERMISO=permiso['PERMISO']
                idPermiso.ID_SALON=permiso['ID_SALON']
                db.session.add(idPermiso)
                db.session.commit()
                # permisobd = db.session.query(permisosModel).filter(
                #     permisosModel.ID_PERMISO == idPermiso['ID_PERMISO'])
                # permisobd.update(request.json)
                # db.session.commit()
                return jsonify({'message': 'Permiso actualizado con exito'})
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
            test = ["ROL", "ID_USUARIO", "CEDULA",
                    "NOMBRES", "APELLIDOS", "CORREO"]

            userbd = db.session.query(rolesModel.ROL, usuariosModel.ID_USUARIO, usuariosModel.CEDULA, usuariosModel.NOMBRES, usuariosModel.APELLIDOS, usuariosModel.CORREO).join(
                rolesModel, rolesModel.ID_ROL == usuariosModel.ID_ROL).filter(usuariosModel.CORREO == data["CORREO"], usuariosModel.CONTRASENA == data["CONTRASENA"]).first()
            if userbd != None:
                data_dict = {test[i]: userbd[i] for i in range(0, len(userbd))}
                token = jwt_token(data_dict)
                return jsonify({'codigo': 'ok', 'message': "Usuario validado correctamente", 'token': token})
            else:
                return jsonify({'codigo': 'Error', 'message': "Usuario o contraseña incorrecto"})
        except Exception as e:
            return jsonify({'message': str(e)})
