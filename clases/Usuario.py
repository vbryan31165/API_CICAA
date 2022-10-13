from flask import Flask, jsonify, request, Blueprint
from model.models import Usuarios as UsuariosModel, db
from model.models import Roles


class Usuario():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_Users(self):

        if request.method == 'GET':
            usuarios = UsuariosModel.query.all()
        if not usuarios:
            return jsonify({'message': 'no hay usuarios'})
        else:
            toUsers = [usuario.getDatos() for usuario in usuarios]
        return jsonify(toUsers)

    def select_One_User(self, id_Usuario):
        print("entro a funcion buscar un usuario")
        usuario = UsuariosModel.query.filter_by(ID_USUARIO=id_Usuario).first()
        #usuario = UsuariosModel.query.get(id_Usuario)
        print("usuarios", usuario)
        if not usuario:
            return jsonify({'message': 'Usuario not found'})
        else:
            return jsonify(UsuariosModel.getDatos(usuario))

    def create_usuario():
        cedula = request.json["cedula"]
        nombres = request.json["nombres"]
        apellidos = request.json["apellidos"]
        correo = request.json["correo"]
        usuario = request.json["usuario"]
        contrasena = request.json["contrasena"]
        id_rol = request.json["id_rol"]
        new_user = UsuariosModel(
            cedula, nombres, apellidos, correo, usuario, contrasena, id_rol)
        db.session.add(new_user)
        db.session.commit()
        return jsonify({'message': 'usuario guardado con exito'})

    def editar_usuario(self, id_Usuario):
        usuario = UsuariosModel.query.get(id_Usuario)
        if not usuario:
            return jsonify({'message': 'Usuario not found'})
        else:
            # UsuariosModel.USUARIO = request.json["USUARIO"]
            UsuariosModel.CORREO = request.json["CORREO"]
            UsuariosModel.CEDULA = request.json["CEDULA"]
            db.session.commit()
            return jsonify({'message': 'Usuario actualizado con exito'})