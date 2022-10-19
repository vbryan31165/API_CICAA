from flask import Flask, jsonify, request
from model.models import db
from routes.routesUsuarios import users
from routes.routesRoles import roles
from clases.Usuario import Usuario


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root@localhost/bdcerradura'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)
app.register_blueprint(users)
app.register_blueprint(roles)

if __name__ == "__main__":
    app.run(debug=True)
