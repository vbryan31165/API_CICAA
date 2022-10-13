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


@users.route('/one_Usuario/<idUsuario>')
def one_Usuario(idUsuario):
    return usuarioClases.select_One_User(instUserClass,idUsuario)


@users.route('/crear_usuario', methods=['POST'])
def crearUsuario():
    # username = request.json["username"]
    # password = request.json["password"]
    # correo = request.json["correo"]
    # pNombre = request.json["pNombre"]
    # sNombre = request.json["sNombre"]
    # pApellido = request.json["pApellido"]
    # sApellido = request.json["sApellido"]
    # numeroId = request.json["numeroId"]
    # new_usuario = Usuarios(username, password, correo,
    #                        pNombre, sNombre, pApellido, sApellido, numeroId)
    # db.session.add(new_usuario)
    # db.session.commit()
    # return jsonify({'message': 'usuario guardado con exito'})
    return usuarioClases.create_usuario();


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
