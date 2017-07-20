from pprint import pprint
from urllib.parse import urlencode
import requests
import time

def get_keys():
    AUTHORIZE_URL = 'https://oauth.vk.com/authorize'
    VERSION = '5.65'
    APP_ID = 6075681
    return AUTHORIZE_URL, VERSION, APP_ID

def authorize():
    AUTHORIZE_URL, VERSION, APP_ID = get_keys()
    auth_data = {
        'client_id': APP_ID,
        'response_type': 'token',
        'scope': 'friends',
        'v': VERSION,
    }
    token = ''
    return token

def access_to_my_friends():
    AUTHORIZE_URL, VERSION, APP_ID = get_keys()
    params = {
        'access_token': authorize(),
        'v': VERSION,
        'user_id': '',
        'count': 10,
    }
    response = requests.get('https://api.vk.com/method/friends.get', params)
    all_my_friends = response.json()['response']['items']
    return all_my_friends

def main():
    AUTHORIZE_URL, VERSION, APP_ID = get_keys()
    all_my_friends2 = list()
    for i in access_to_my_friends():
        params = {
            'access_token': authorize(),
            'v': VERSION,
            'user_id': i,
        }
        response2 = requests.get('https://api.vk.com/method/friends.get', params)
        all_my_friends2.extend(response2.json()['response']['items'])
        time.sleep(2)

    mutual_friends = set(access_to_my_friends()) & set(x for x in all_my_friends2)
    print('Общие друзья: ', mutual_friends)

main()