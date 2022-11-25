from flask import Flask, jsonify, request, Blueprint
from clases.Log_Ingresos import LogIngresos as logIngresosClases


log_ingresos = Blueprint('log_ingresos', __name__)

instLogIngresos = logIngresosClases()


@log_ingresos.route('/log_ingresos')
def rol():
    return logIngresosClases.select_All_log(instLogIngresos)


@log_ingresos.route('/log_ingresos_days')
def rol_days():
    return logIngresosClases.select_All_log_days(instLogIngresos)


@log_ingresos.route('/one_Rol/<idRol>')
def one_rol(idRol):
    return logIngresosClases.select_One_rol(instLogIngresos, idRol)


@log_ingresos.route('/create_log_ingresos', methods=['POST'])
def crear_rol():
    return logIngresosClases.create_log_huella()


@log_ingresos.route('/edit_rol/<idRol>', methods=['PUT'])
def edit_rol(idRol):
    return logIngresosClases.editar_rol(instLogIngresos, idRol)
