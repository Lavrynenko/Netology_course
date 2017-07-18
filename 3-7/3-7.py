import requests
from pprint import pprint
from urllib.parse import urlencode

# формируем запрос на авторизацию на яше
AUTHORIZE_URL = 'https://oauth.yandex.ru/authorize'
APP_ID = 'b81f08e9171d4f77afed65ffd6dc8044'

auth_data = {
    'response_type': 'token',
    'client_id': APP_ID,
}

# print('?'.join((AUTHORIZE_URL, urlencode(auth_data))))  # переходим по полученной ссылки и кликаем "разрешить"
token = ''

class MetrikaBase:
    API_MANAGEMENTE_URL = 'https://api-metrika.yandex.ru/management/v1/'  # URL для управленческих запросов к API
    API_STAT_URL = 'https://api-metrika.yandex.ru/stat/v1/'  # URL для отчетов из API
    token = None

    def __init__(self, token):  # принимает при инициализации класса обязательные параметры
        self.token = token

    def get_headers(self):  # получаем заголовки для авторизации
        return {
            'Authorization': 'OAuth {}'.format(self.token),
            'Content-Type': 'application/json'
        }


class YandexMetrika(MetrikaBase):
    def get_counters(self):  # получаем номер счетчика
        headers = self.get_headers()
        r = requests.get(self.API_MANAGEMENTE_URL + 'counters', headers=headers)
        all_counters = [counter['id'] for counter in r.json()['counters']]  # получаем id-счетчиков. нам нужен 27322844

        return [
            Counter(self.token, all_counters[0])
        ]
        # return [
        #     Counter(self.token, counter['id']) for counter in r.json()['counters']
        # ]

        # Counter(self.token, all_counters[0]) for counter in r.json()['counters']

class Counter(MetrikaBase):
    def __init__(self, token, counter_id):
        self.counter_id = counter_id
        super().__init__(token)


    def get_visits(self):  # получаем количество хостов
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,  # обращаемся к id-счетчика при инициализации
            'metrics': 'ym:s:visitsPerDay',
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]  # получаем количество хостов

    def get_pageviews(self):  # получаем количество хостов
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,  # обращаемся к id-счетчика при инициализации
            'metrics': 'ym:pv:pageviewsPerDay'
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]  # получаем количество просмотров


    def get_users(self):  # получаем количество хостов
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,  # обращаемся к id-счетчика при инициализации
            'metrics': 'ym:pv:users',
            'date1': 'today',
            'date2': 'today',
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]  # получаем количество посетителей

def main():
    metrika = YandexMetrika(token)  # авторизируемся на сайте и получаем добро на работу с API
    counters = metrika.get_counters()
    # print(counters)

    for counter_id in counters:
        # pprint("Для счетчика {} - количество посетителей {}".format(counter_id, counter_id.get_visits()))
        pprint("Количество визитов - {}".format(round(counter_id.get_visits(), 2)))
        pprint("Количество просмотров - {}".format(round(counter_id.get_pageviews(), 2)))
        pprint("Количество посетителей - {}".format(round(counter_id.get_users(), 2)))

main()