from flask import Flask, jsonify, request, Blueprint
from model.models import Huella as huellaModel, db
import json


class Huella():

    def index(self):
        return jsonify({'message': 'welcome'})

    def select_All_Huella(self):

        try:
            if request.method == 'GET':
                huella = huellaModel.query.join(Usuarios)
                print(huella)
            if not huella:
                return jsonify({'message': 'no hay roles'})
            else:
                # toUsers = [rol.getDatos() for rol in rol]
                return jsonify(json.loads(str(huella)))
        except Exception as e:
            return jsonify({'message': str(e)})

    def select_One_huella(self, id_Usuario):
        try:
            huella = huellaModel.query.filter_by(ID_USUARIO=id_Usuario).first()
            #usuario = UsuariosModel.query.get(id_Usuario)
            if not huella:
                return jsonify({'message': 'Rol no encontrado'})
            else:
                return jsonify(json.loads(str(huella)))
        except Exception as e:
            return jsonify({'mesage': str(e)})

    def create_huella():
        try:
            new_huella = huellaModel(request.json)
            db.session.add(new_huella)
            db.session.commit()
            return jsonify({'message': 'Huella guardada con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})

    def editar_huella(self, id_Huella):
        try:
            idHuella = huellaModel.query.get(id_Huella)
            if idHuella == None:
                return jsonify({'message': 'Rol not found'})
            else:
                huella = db.session.query(huellaModel).filter(
                    huellaModel.ID == id_Huella)
                huella.update(request.json)
                db.session.commit()
                return jsonify({'message': 'huella actualizada con exito'})
        except Exception as e:
            return jsonify({'message': str(e)})
