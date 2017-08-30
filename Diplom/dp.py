from pprint import pprint
import requests
import time
import json

"""
Основная проблема в Вашей работе это то, что Вы в параметрах к запросу пишите
'count': 50, Тем самым ограничивая список людей в группе. Из-за этого возникают ошибки. Если этот параметр убрать будет лучше. 
2. Вторая проблема это повторяющийся params во всех запросах, хотя он отличается только user_id. 
3. В функции get_all_groups_on_user_friends условие лишние if all_groups:
и в try достаточно обернуть только 

response = requests.get('https://api.vk.com/method/groups.get', params)

171691064 - ID - юзера

"""




token = '5dfd6b0dee902310df772082421968f4c06443abecbc082a8440cb18910a56daca73ac8d04b25154a1128'
VERSION = '5.67'

def groups_our_user():
    params = {
        'access_token': token,
        'v': VERSION,
        'user_id': 171691064,
        # 'count': 50,
    }

    response = requests.get('https://api.vk.com/method/groups.get', params)
    all_groups = response.json()['response']['items']
    print('.')
    print(all_groups)

    return all_groups


def get_friends_our_user():
    params = {
        'access_token': token,
        'v': VERSION,
        'user_id': 171691064,
        'count': 50,
        'fields': 'screen_name',
    }
    response = requests.get('https://api.vk.com/method/friends.get', params)
    friends_our_user = response.json()['response']['items']
    print('.')

    return friends_our_user


def get_all_groups_on_user_friends(all_groups=''):
    our_user_friends = get_friends_our_user()

    all_groups_on_user_friends = list()
    try:
        if all_groups:
            all_groups_name_and_count = list()
            for i in all_groups:
                params = {
                    'access_token': token,
                    'v': VERSION,
                    'user_id': i,
                    'extended': 1,
                    'fields': 'members_count',
                    'count': 50
                }
                response = requests.get('https://api.vk.com/method/groups.get', params)
                all_groups_name_and_count.extend(response.json()['response']['items'])
                print('.')
                time.sleep(1)

                return all_groups_name_and_count

        else:

            for i in our_user_friends:
                params = {
                    'access_token': token,
                    'v': VERSION,
                    'user_id': i['id'],
                    'extended': 0,
                    'count': 50
                }
                response = requests.get('https://api.vk.com/method/groups.get', params)
                all_groups_on_user_friends.extend(response.json()['response']['items'])
                print('.')
                time.sleep(0.4)

    except KeyError:
        for i in our_user_friends:
            params = {
                'access_token': token,
                'v': VERSION,
                'user_id': i['id'],
                'extended': 0,
                # 'fields': 'members_count',
                'count': 1
            }
            response = requests.get('https://api.vk.com/method/groups.get', params)
            print('.')
            time.sleep(0.4)

    return all_groups_on_user_friends


def main():
#   id()
    our_user_group = groups_our_user()
    all_groups_on_user = get_all_groups_on_user_friends()

    all_groups_on_user_friends_without_user_groups = list()
    for i in our_user_group:
        if i not in all_groups_on_user:
            all_groups_on_user_friends_without_user_groups.append(i)

    result_groups = get_all_groups_on_user_friends(all_groups_on_user_friends_without_user_groups)

    all_groups = list()
    for i in result_groups:
        result = {'name': i['name'], 'gid': i['id'], 'member_count': i['members_count']}

        all_groups.append(result)

    with open('groups.json', 'w', encoding='utf8') as f:
        json.dump(all_groups, f, indent=2, ensure_ascii=False)
        print('Вся информация в файле groups.json!')

if __name__ == '__main__':
    main()
