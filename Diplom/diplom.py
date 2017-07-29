from pprint import pprint
import requests
import time

token = ''

def get_keys():  # получаем параметры для авторизации
    AUTHORIZE_URL = "https://oauth.vk.com/authorize"
    VERSION = "5.67"

    return AUTHORIZE_URL, VERSION


def groups_our_user():  # получаем номера групп пользователя за которым следим
    AUTHORIZE_URL, VERSION = get_keys()
    params = {
        'access_token': token,
        'v': VERSION,
        'user_id': '5030613',
        'count': 1,  # выбираем количество
    }
    response = requests.get('https://api.vk.com/method/groups.get', params)
    all_groups = response.json()['response']['items']

    return all_groups


def get_friends_our_user():  # получаем друзей пользователя
    AUTHORIZE_URL, VERSION= get_keys()
    params = {
        'access_token': token,
        'v': VERSION,
        'user_id': '5030613',
        'count': 1,  # выбираем количество
        'fields': 'screen_name',
    }
    response = requests.get('https://api.vk.com/method/friends.get', params)
    friends_our_user = response.json()['response']['items']

    return friends_our_user


def get_all_groups_on_user_friends():  # получаем группы друзей пользователя
    AUTHORIZE_URL, VERSION = get_keys()
    our_user_friends = get_friends_our_user()

    all_groups_on_user_friends = dict()
    try:
        for i in our_user_friends:
            params = {
                'access_token': token,
                'v': VERSION,
                'user_id': i['id'],
                'extended': 1,
                'fields': 'members_count',
            }
            response = requests.get('https://api.vk.com/method/groups.get', params)
            all_groups_on_user_friends.update({"{} {} {}".format(str(i['id']), i['first_name'], i['last_name']):
                                                   response.json()['response']['items']})
            time.sleep(3)
    except KeyError:
        pass

    return all_groups_on_user_friends


def main():
    our_user_group = groups_our_user()
    get_friends_our_user()
    all_groups_on_user = get_all_groups_on_user_friends()


    all_groups = list()
    for k, v in all_groups_on_user.items():
        for i in v:
            if i['id'] not in our_user_group:
                try:
                    result = {'name': i['name'], 'gid': i['id'], 'member_count': i['members_count']}
                    all_groups.append(result)
                except:
                    pass
    pprint(all_groups)


main()