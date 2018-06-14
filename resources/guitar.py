from flask_restful import Resource, reqparse
from models.guitar import GuitarModel

class Guitar(Resource):
    parser = reqparse.RequestParser()
    
    parser.add_argument('name',
        type=str,
        required=True,
        help="This field cannot be left blank!"
    )

    def get(self, guitar_id):
        guitar = GuitarModel.find_by_id(guitar_id)
        if guitar:
            return guitar.json()
        return {'error_message': 'Guitar not found'}, 404

    def delete(self, name):
        guitar = GuitarModel.find_by_name(name)
        guitar_id = guitar.id
        if guitar:
            guitar.delete_from_db()
            return {'success_message': 'Guitar deleted'}
        else:
            return {'error_message': 'error'}

class GuitarCreate(Resource):
    def post(self):
        data = Guitar.parser.parse_args()

        guitar = GuitarModel(data['name'])

        try:
            guitar.save_to_db()
        except:
            return {"error_message": "An error occurred creating the guitar."}, 500

        return transport.json(), 201

class GuitarList(Resource):
    def get(self,):
        return {'guitars': list(map(lambda x: x.json(), GuitarModel.query.all()))}