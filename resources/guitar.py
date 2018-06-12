from flask_restful import Resource, reqparse
from models.guitar import GuitarModel

class Guitar(Resource):

    def get(self, name):
        guitar = GuitarModel.find_by_name(name)
        if guitar:
            return guitar.json()
        return {'error_message': 'Guitar not found'}, 404

    def post(self, name):
        if GuitarModel.find_by_name(name):
            return {'error_message': "A guitar with name '{}' already exists.".format(name)}, 400

        guitar = GuitarModel(name)

        try:
            guitar.save_to_db()
        except:
            return {"error_message": "An error occurred creating the guitar."}, 500

        return guitar.json(), 201

    def delete(self, name):
        guitar = GuitarModel.find_by_name(name)
        guitar_id = guitar.id
        if guitar:
            guitar.delete_from_db()
            return {'success_message': 'Guitar deleted'}
        else:
            return {'error_message': 'error'}

class GuitarList(Resource):
    def get(self,):
        return {'guitars': list(map(lambda x: x.json(), GuitarModel.query.all()))}