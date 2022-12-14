from flask import Flask, jsonify, request, Blueprint
from model.Log_Ingresos import LogIngresos as logingresosModel, db
from model.Usuario import Usuarios as usuariosModel
from sqlalchemy import func, case
from utils.fecha_Aleatoria import fecha_random, usuario_salon_estado_ramdom
import json


class LogIngresos():

    def select_all_log(self):
        datalog = []
        logs = db.session.query(usuariosModel.NOMBRES, usuariosModel.APELLIDOS, logingresosModel.FECHA, logingresosModel.ID_SALON).join(
            logingresosModel, logingresosModel.ID_USUARIO == usuariosModel.ID_USUARIO).order_by(logingresosModel.FECHA.desc()).limit(10).all()
        datalog = [{'NOMBRES': i.NOMBRES, 'APELLIDOS': i.APELLIDOS,
                    'FECHA': str(i.FECHA), 'SALON': str(i.ID_SALON)}for i in logs]
        return jsonify(datalog)

    def select_All_log_month(self):
        try:
            if request.method == 'GET':
                logAsistencias = db.session.query(func.monthname(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.monthname(logingresosModel.FECHA)).order_by(logingresosModel.FECHA).filter(logingresosModel.ESTADO).all()
                logInasistencia = db.session.query(func.monthname(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.monthname(logingresosModel.FECHA)).order_by(logingresosModel.FECHA).filter(logingresosModel.ESTADO == 0).all()
                dataAsistencia = {i[0]: i[1] for i in logAsistencias}
                dataInasistencias = {i[0]: i[1] for i in logInasistencia}
                return jsonify(dataInasistencias, dataAsistencia)
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_All_log_days(self):
        try:
            if request.method == 'GET':
                logDiasAsistencias = db.session.query(func.weekday(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.weekday(logingresosModel.FECHA)).filter(logingresosModel.ESTADO == 0).all()
                logDiasInasistencias = db.session.query(func.weekday(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.weekday(logingresosModel.FECHA)).filter(logingresosModel.ESTADO == 1).all()
                dataLog = []
                dataLog.append(dict(logDiasAsistencias))
                dataLog.append(dict(logDiasInasistencias))
                return jsonify(dataLog)
        except Exception as e:
            return jsonify({'message': str(e)})

    def create_log():
        try:
            fechar = fecha_random()
            data = usuario_salon_estado_ramdom()
            fecha = {
                'FECHA': fechar,
                'ID_USUARIO': data[0],
                'ID_SALON': data[1],
                'ESTADO': data[2]
            }
            new_log = logingresosModel(fecha)
            db.session.add(new_log)
            db.session.commit()
            return jsonify({'message': 'Registro guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def insert_log_huella():
        try:
            new_log = logingresosModel(request.json)
            db.session.add(new_log)
            db.session.commit()
            return jsonify({'message': 'Log guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})
