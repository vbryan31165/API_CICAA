from flask import Flask, jsonify, request, Blueprint
from model.models import Roles as RolesModel, db
import json


class Roles():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_Rol(self):

        try:
            if request.method == 'GET':
                rol = RolesModel.query.all()
                print(rol)
            if not rol:
                return jsonify({'message': 'no hay roles'})
            else:
                # toUsers = [rol.getDatos() for rol in rol]
                return jsonify(json.loads(str(rol)))
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_One_rol(self, rol):
        rol = RolesModel.query.filter_by(ID_ROL=rol).first()
        #usuario = UsuariosModel.query.get(id_Usuario)
        print("usuarios", rol)
        if not rol:
            return jsonify({'message': 'Rol no encontrado'})
        else:
            return jsonify(RolesModel.getDatos(rol))

    def create_rol():
        try:
            new_rol = RolesModel(request.json)
            db.session.add(new_rol)
            db.session.commit()
            return jsonify({'message': 'Rol guardado con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def editar_rol(self, id_Usuario):
        usuario = RolesModel.query.get(id_Usuario)
        if not usuario:
            return jsonify({'message': 'Usuario not found'})
        else:
            # UsuariosModel.USUARIO = request.json["USUARIO"]
            RolesModel.CORREO = request.json["CORREO"]
            RolesModel.CEDULA = request.json["CEDULA"]
            db.session.commit()
            return jsonify({'message': 'Usuario actualizado con exito'})
