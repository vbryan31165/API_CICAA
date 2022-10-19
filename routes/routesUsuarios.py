from flask import Flask, jsonify, request, Blueprint
from clases.Usuario import Usuario as usuarioClases
from model.models import Roles, Usuarios

users = Blueprint('users', __name__)

roles = Blueprint('roles', __name__)

instUserClass = usuarioClases()


@users.route('/')
def index():
    return usuarioClases.index(instUserClass)


@users.route('/usuarios')
def usuarios():
    return usuarioClases.select_All_Users(instUserClass)


@users.route('/one_Usuario/<idUsuario>')
def one_Usuario(idUsuario):
    return usuarioClases.select_One_User(instUserClass, idUsuario)


@users.route('/crear_usuario', methods=['POST'])
def crearUsuario():
    return usuarioClases.create_usuario()


@users.route('/editar/<idUsuario>', methods=['PUT'])
def uptdae_user(idUsuario):
    return usuarioClases.update_usuario(instUserClass, idUsuario)


@users.route('/eliminar/<idUsuario>', methods=['POST'])
def eliminarUsuario(idUsuario):
    return usuarioClases.delete_user(instUserClass,idUsuario)
