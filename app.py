from flask import Flask, jsonify, request
from utils.db import db
from routes.routesUsuarios import users
from routes.routesRoles import roles
from routes.routesHuella import huella
from routes.routesLogIngresos import log_ingresos
from flask_cors import CORS


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root@localhost/bdcerradura'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
CORS(app)
db.init_app(app)


app.register_blueprint(users)
app.register_blueprint(roles)
app.register_blueprint(huella)
app.register_blueprint(log_ingresos)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
