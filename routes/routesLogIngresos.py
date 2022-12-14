from flask import Flask, jsonify, request, Blueprint
from clases.Log_Ingresos import LogIngresos as logIngresosClases


log_ingresos = Blueprint('log_ingresos', __name__)

instLogIngresos = logIngresosClases()


@log_ingresos.route('/ingresos')
def ingresos():
    return logIngresosClases.select_all_log(instLogIngresos)


@log_ingresos.route('/log_ingresos_month')
def rol():
    return logIngresosClases.select_All_log_month(instLogIngresos)


@log_ingresos.route('/log_ingresos_days')
def rol_days():
    return logIngresosClases.select_All_log_days(instLogIngresos)


@log_ingresos.route('/create_log_ingresos', methods=['GET'])
def crear_rol():
    return logIngresosClases.create_log()


@log_ingresos.route('/log_huella')
def log():
    return logIngresosClases.create_log()
