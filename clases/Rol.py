from flask import Flask, jsonify, request, Blueprint
from model.models import Roles as RolesModel, db



class Roles():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_Rol(self):

        if request.method == 'GET':
            rol = RolesModel.query.all()
        if not rol:
            return jsonify({'message': 'no hay roles'})
        else:
            toUsers = [rol.getDatos() for rol in rol]
        return jsonify(toUsers)

    def select_One_rol(self, rol):
        rol = RolesModel.query.filter_by(ID_ROL=rol).first()
        #usuario = UsuariosModel.query.get(id_Usuario)
        print("usuarios", rol)
        if not rol:
            return jsonify({'message': 'Rol no encontrado'})
        else:
            return jsonify(RolesModel.getDatos(rol))

    def create_rol():
        rol = request.json["rol"]
        new_rol = RolesModel(rol)
        db.session.add(new_rol)
        db.session.commit()
        return jsonify({'message': 'Rol guardado con exito'})

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