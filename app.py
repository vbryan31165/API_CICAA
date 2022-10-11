from flask import Flask, jsonify, request
from model.models import db
from routes.routes import users
from clases.Usuario import Usuario

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root@localhost/bdcerradura'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)
app.register_blueprint(users)

if __name__=="__main__":
    app.run(debug=True)
