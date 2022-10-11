from flask import Flask, jsonify, request, Blueprint
from model.models import Usuarios as UsuariosModel
from clases.Usuario import Usuario

users = Blueprint('users', __name__)

user = Usuario()


@users.route('/')
def index():
    return Usuario.index(user)
    # return jsonify({'message': 'welcome'})


@users.route('/usuarios')
def usuarios():
    return Usuario.select_all_users(user)
    # usuarios = Usuarios.query.all()
    # toUsers = [usuario.getDatos() for usuario in usuarios]
    # return jsonify(toUsers)


@users.route('/oneUsuario/<string:id_Usuario>', methods=['GET'])
def one_Usuario(id_Usuario):
    # print(id_Usuario)
    # id=id_Usuario
    # print("hugo",id)
    #usuario = Usuarios.query.filter_by(idUsuario=idUsuario).first()
    data=Usuario.select_one_user(id_Usuario)
    # print(data)
    return data
    # usuario = Usuario.query.get(UsuariosModel)
    # if not usuario:
    #     return jsonify({'message': 'Usuario not found'})
    # else:
    #     return jsonify(usuario.getDatos())


@users.route('/usuarios', methods=['POST'])
def crearUsuario():
    username = request.json["username"]
    password = request.json["password"]
    correo = request.json["correo"]
    pNombre = request.json["pNombre"]
    sNombre = request.json["sNombre"]
    pApellido = request.json["pApellido"]
    sApellido = request.json["sApellido"]
    numeroId = request.json["numeroId"]
    new_usuario = Usuarios(username, password, correo,
                           pNombre, sNombre, pApellido, sApellido, numeroId)
    db.session.add(new_usuario)
    db.session.commit()
    return jsonify({'message': 'usuario guardado con exito'})


@users.route('/editar/<idUsuario>', methods=['PUT'])
def editarUsuario(idUsuario):
    usuario = Usuarios.query.get(idUsuario)
    if not usuario:
        return jsonify({'message': 'Usuario not found'})
    else:
        usuario.username = request.json["username"]
        usuario.password = request.json["password"]
        usuario.correo = request.json["correo"]
        usuario.pNombre = request.json["pNombre"]
        usuario.sNombre = request.json["sNombre"]
        usuario.pApellido = request.json["pApellido"]
        usuario.sApellido = request.json["sApellido"]
        usuario.numeroId = request.json["numeroId"]
        db.session.commit()
        return jsonify({'message': 'Usuario actualizado con exito'})


@users.route('/eliminar/<idUsuario>', methods=['DELETE'])
def eliminarUsuario(idUsuario):
    usuario = Usuarios.query.get(idUsuario)
    if not usuario:
        return jsonify({'message': 'Usuario not found'})
    else:
        db.session.delete(usuario)
        db.session.commit()
        return jsonify({'message': 'Usuario eliminado con exito'})
