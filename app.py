import os

from flask import Flask
from flask_restful import Api
from flask_cors import CORS
from resources.guitar import Guitar, GuitarList

app = Flask(__name__)
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL','sqlite:///data.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'EiEiO'
api = Api(app)

#Guitar entrypoints
api.add_resource(Guitar, '/guitar/<int:guitar_id>')
api.add_resource(GuitarList, '/guitars')

if __name__ == '__main__':
    from db import db
    db.init_app(app)
    app.run(port=8080, debug=True)