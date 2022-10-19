from flask import Flask, jsonify, request, Blueprint
from clases.Rol import Roles as rolesClases
from model.models import Roles, Usuarios


roles = Blueprint('roles', __name__)

instRolClass = rolesClases()

@roles.route('/roles')
def rol():
    return rolesClases.select_All_Rol(instRolClass)


@roles.route('/one_Rol/<idRol>')
def one_rol(idRol):
    return rolesClases.select_One_rol(instRolClass, idRol)


@roles.route('/create_rol', methods=['POST'])
def crear_rol():
    return rolesClases.create_rol()
