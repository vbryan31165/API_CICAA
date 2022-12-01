from flask import Flask, jsonify, request, Blueprint
from clases.Usuario import Usuario as usuarioClases


users = Blueprint('users', __name__)
instUserClass = usuarioClases()


@users.route('/')
def index():
    return usuarioClases.index(instUserClass)


@users.route('/usuarios')
def usuarios():
    return usuarioClases.select_All_Users(instUserClass)


@users.route('/one_permiso/<id_permiso>')
def one_Usuario(id_permiso):
    return usuarioClases.select_One_Permiso(instUserClass, id_permiso)


@users.route('/crear_usuario', methods=['POST'])
def crearUsuario():
    return usuarioClases.create_usuario()


@users.route('/permisos_usuario/<idUsuario>', methods=['GET'])
def permisos_Usuario(idUsuario):
    return usuarioClases.select_Permisos_Usuario(instUserClass, idUsuario)

@users.route('/editar_permiso', methods=['PUT'])
def uptdae_user():
    return usuarioClases.update_permiso(instUserClass)


@users.route('/eliminar/<idUsuario>', methods=['POST'])
def eliminarUsuario(idUsuario):
    return usuarioClases.delete_user(instUserClass, idUsuario)


@users.route('/login', methods=['POST'])
def login():
    data = request.json
    return usuarioClases.login(data)


@users.route('/perfil', methods=['POST'])
def informacionPerfil():
    data = request.json
    return usuarioClases.informacionPerfil(data)


@users.route('/permisos', methods=['GET'])
def permisos():
    return usuarioClases.select_Permisos(instUserClass)
