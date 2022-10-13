from ast import Return
from flask import Flask, jsonify, request, Blueprint
from clases.Usuario import Usuario as usuarioClases
from clases.Rol import Roles as rolesClases
from model.models import Roles, Usuarios

users = Blueprint('users', __name__)

roles=Blueprint('roles', __name__)

instUserClass = usuarioClases()
instRolClass = rolesClases()


@users.route('/')
def index():
    return usuarioClases.index(instUserClass)


@users.route('/usuarios')
def usuarios():
    return usuarioClases.select_All_Users(instUserClass)


@users.route('/one_Usuario/<idUsuario>')
def one_Usuario(idUsuario):
    return usuarioClases.select_One_User(instUserClass,idUsuario)


@users.route('/crear_usuario', methods=['POST'])
def crearUsuario():
    return usuarioClases.create_usuario()


@users.route('/editar/<idUsuario>', methods=['PUT'])
def editarUsuario(idUsuario):
    # usuario = Usuarios.query.get(idUsuario)
    # if not usuario:
    #     return jsonify({'message': 'Usuario not found'})
    # else:
    #     usuario.username = request.json["username"]
    #     usuario.password = request.json["password"]
    #     usuario.correo = request.json["correo"]
    #     usuario.pNombre = request.json["pNombre"]
    #     usuario.sNombre = request.json["sNombre"]
    #     usuario.pApellido = request.json["pApellido"]
    #     usuario.sApellido = request.json["sApellido"]
    #     usuario.numeroId = request.json["numeroId"]
    #     db.session.commit()
    #     return jsonify({'message': 'Usuario actualizado con exito'})
        return usuarioClases.editar_usuario(instUserClass,idUsuario)


@users.route('/eliminar/<idUsuario>', methods=['DELETE'])
def eliminarUsuario(idUsuario):
    usuario = Usuarios.query.get(idUsuario)
    if not usuario:
        return jsonify({'message': 'Usuario not found'})
    else:
        db.session.delete(usuario)
        db.session.commit()
        return jsonify({'message': 'Usuario eliminado con exito'})


@users.route('/roles')
def rol():
    return rolesClases.select_All_Rol(instUserClass)

@users.route('/one_Rol/<idRol>')
def one_rol(idRol):
    return rolesClases.select_One_rol(instUserClass,idRol)

@users.route('/create_rol',methods=['POST'])
def crear_rol():
    return rolesClases.create_rol()