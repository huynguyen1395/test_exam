import requests
import json


def get_request(url, params, headers):
    response = requests.get(url, params=params, headers=headers)
    return response


def post_request(url, data, headers):
    if data is not None:
        data = json.dumps(data)
    response = requests.post(url, data=data, headers=headers)
    return response


def delete_request(url, headers):
    response = requests.delete(url, headers=headers)
    return response

