from flask import Flask, jsonify, request, Blueprint
from model.models import Usuarios as UsuariosModel

class Usuario():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_all_users(self):
        user = UsuariosModel()
        usuarios = UsuariosModel.query.all()
        print(usuarios)
        toUsers = [UsuariosModel.getDatos(user) for user in usuarios]
        print(toUsers)
        return jsonify(toUsers)

    def select_one_user(self, id_Usuario):
        user = UsuariosModel()
        print("entro a funcion buscar un usuario")
        #usuario = UsuariosModel.query.filter_by(ID_USUARIO=id_Usuario).first()
        usuario = UsuariosModel.query.get(id_Usuario)
        if not usuario:
            return jsonify({'message': 'Usuario not found'})
        else:
            return jsonify(UsuariosModel.getDatos())
