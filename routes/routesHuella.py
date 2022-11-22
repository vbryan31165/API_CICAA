from flask import Flask, jsonify, request, Blueprint
from clases.huella import Huella as huellaModel

huella = Blueprint('huella', __name__)

instHuellaClass = huellaModel()


@huella.route('/huella')
def rol():
    return huellaModel.select_All_Huella(instHuellaClass)


@huella.route('/one_Rol/<idRol>')
def one_rol(idRol):
    return huellaModel.select_One_rol(instHuellaClass, idRol)


@huella.route('/create_rol', methods=['POST'])
def crear_rol():
    return huellaModel.create_rol()


@huella.route('/edit_rol/<idRol>', methods=['PUT'])
def edit_rol(idRol):
    return huellaModel.editar_rol(instHuellaClass, idRol)
