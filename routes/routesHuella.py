from flask import Flask, jsonify, request, Blueprint
from clases.Rol import Roles as rolesClases
from model.models import Roles, Usuarios, Huella


huella = Blueprint('huella', __name__)

instRolClass = rolesClases()


@huella.route('/huella')
def rol():
    return rolesClases.select_All_Rol(instRolClass)


@huella.route('/one_Rol/<idRol>')
def one_rol(idRol):
    return rolesClases.select_One_rol(instRolClass, idRol)


@huella.route('/create_rol', methods=['POST'])
def crear_rol():
    return rolesClases.create_rol()


@huella.route('/edit_rol/<idRol>', methods=['PUT'])
def edit_rol(idRol):
    return rolesClases.editar_rol(instRolClass, idRol)
