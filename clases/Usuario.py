from flask import Flask, jsonify, request, Blueprint
from model.models import Usuarios as UsuariosModel, db
import json


class Usuario():

    def index(self):
        try:
            return jsonify({'message': 'welcome'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_All_Users(self):
        try:
            if request.method == 'GET':
                usuarios = UsuariosModel.query.all()
            if not usuarios:
                return jsonify({'message': 'no hay usuarios'})
            else:
                return jsonify(json.loads(str(usuarios)))
        except Exception as e:
            return jsonify({"message": str(e)})

    def select_One_User(self, id_Usuario):
        try:
            usuario = UsuariosModel.query.filter_by(
                ID_USUARIO=id_Usuario).first()
            if usuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                return jsonify(json.loads(str(usuario)))
        except Exception as e:
            return jsonify({"message": str(e)})

    def create_usuario():
        try:
            new_user = UsuariosModel(request.json)
            db.session.add(new_user)
            db.session.commit()
            return jsonify({'message': 'usuario guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def update_usuario(self, id_Usuario):
        try:
            idUsuario = UsuariosModel.query.get(id_Usuario)

            if idUsuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                usuario = db.session.query(UsuariosModel).filter(
                    UsuariosModel.ID_USUARIO == id_Usuario)
                usuario.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario actualizado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def delete_user(self, id_Usuario):
        try:
            idUsuario = UsuariosModel.query.get(id_Usuario)

            if idUsuario == None:
                return jsonify({'message': 'Usuario not found'})
            else:
                usuario = db.session.query(UsuariosModel).filter(
                    UsuariosModel.ID_USUARIO == id_Usuario)
                usuario.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario eliminado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})
