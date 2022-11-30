from flask import Flask, jsonify, request, Blueprint
from model.Roles import Roles as rolesModel, db
import json


class Roles():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_Rol(self):
        try:
            if request.method == 'GET':
                rol = rolesModel.query.all()
            if not rol:
                return jsonify({'message': 'no hay roles'})
            else:
                return jsonify(json.loads(str(rol)))
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_One_rol(self, rol):
        try:
            rol = rolesModel.query.filter_by(ID_ROL=rol).first()
            if not rol:
                return jsonify({'message': 'Rol no encontrado'})
            else:
                return jsonify(json.loads(str(rol)))
        except Exception as e:
            return jsonify({'mesage': str(e)})

    def create_rol():
        try:
            new_rol = rolesModel(request.json)
            db.session.add(new_rol)
            db.session.commit()
            return jsonify({'message': 'Rol guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def editar_rol(self, id_Rol):
        try:
            idRol = rolesModel.query.get(id_Rol)
            if idRol == None:
                return jsonify({'message': 'Rol not found'})
            else:
                rol = db.session.query(rolesModel).filter(
                    rolesModel.ID_ROL == id_Rol)
                rol.update(request.json)
                db.session.commit()
                return jsonify({'message': 'Usuario actualizado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})
