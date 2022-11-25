from flask import Flask, jsonify, request, Blueprint
from model.Log_Ingresos import LogIngresos as logingresosModel, db
from sqlalchemy import func, case
from utils.fecha_Aleatoria import fecha_random, usuario_salon_estado_ramdom
import json


class LogIngresos():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_log(self):

        try:
            if request.method == 'GET':
                # data = {}
                cont = 0
                logAsistencias = db.session.query(func.monthname(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.monthname(logingresosModel.FECHA)).order_by(logingresosModel.FECHA).filter(logingresosModel.ESTADO).all()

                print((logAsistencias))

                logInasistencia = db.session.query(func.monthname(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.monthname(logingresosModel.FECHA)).order_by(logingresosModel.FECHA).filter(logingresosModel.ESTADO == 0).all()
                # print(log)

                # for i in log:
                #     dict[campos[cont]] = i
                #     cont += 1

                # print("aqui dict ------>")
                # print(dict)

                dataAsistencia = {i[0]: i[1] for i in logAsistencias}
                dataInasistencias = {i[0]: i[1] for i in logInasistencia}
                # for i in log:
                #     data[i[0]] = i[1];

                print("ACAAA ", dataAsistencia)
                print("aca 2 ------->", dataInasistencias)
            if not dataAsistencia:
                return jsonify({'message': 'no hay roles'})
            else:
                print("aquiiiiiiiiiiiiiiiiiiiiiiii")
                return jsonify(dataAsistencia, dataInasistencias)
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_All_log_days(self):
        try:
            if request.method == 'GET':
                dias=['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo']

                logDiasAsistencias = db.session.query(func.weekday(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.weekday(logingresosModel.FECHA)).filter(logingresosModel.ESTADO==0).all()
                
                logDiasInasistencias = db.session.query(func.weekday(logingresosModel.FECHA), func.count(
                    "*")).group_by(func.weekday(logingresosModel.FECHA)).filter(logingresosModel.ESTADO==1).all()

                print("log_dias.--------------->", (logDiasInasistencias))

                dataAsistencia = {dias[i]: logDiasAsistencias[i][1] for i in range(0, len(logDiasAsistencias))}

                dataInasistencia = {dias[i]: logDiasInasistencias[i][1] for i in range(0, len(logDiasInasistencias))}

                print("log_dias_dataaaaaaaaa.--------------->", (dataInasistencia))

            if not dataAsistencia:
                return jsonify({'message': 'no hay roles'})
            else:
                return jsonify((dataAsistencia, dataInasistencia))
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_One_rol(self, rol):
        try:
            rol = logingresosModel.query.filter_by(ID_ROL=rol).first()
            if not rol:
                return jsonify({'message': 'Rol no encontrado'})
            else:
                return jsonify(json.loads(str(rol)))
        except Exception as e:
            return jsonify({'mesage': str(e)})

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
            print(new_log)
            db.session.add(new_log)
            print("añadio")
            db.session.commit()
            return jsonify({'message': 'Registro guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def create_log_huella():
        try:
            new_log = logingresosModel(request.json)
            db.session.add(new_log)
            db.session.commit()
            return jsonify({'message': 'usuario guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def editar_rol(self, id_Rol):
        try:
            idRol = logingresosModel.query.get(id_Rol)
            if idRol == None:
                return jsonify({'message': 'Rol not found'})
            else:
                rol = db.session.query(logingresosModel).filter(
                    logingresosModel.ID_ROL == id_Rol)
                rol.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario actualizado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})
