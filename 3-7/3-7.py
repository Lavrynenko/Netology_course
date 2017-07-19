import requests
from pprint import pprint
from urllib.parse import urlencode

AUTHORIZE_URL = 'https://oauth.yandex.ru/authorize'
APP_ID = 'dddb0d53541744728ea24c6a13e1c7a4'

auth_data = {
    'response_type': 'token',
    'client_id': APP_ID,
}

#token = 'AQAAAAAMsazAAARuVznCO90NcEWCq8xEXAcp0sA'
# print('?'.join((AUTHORIZE_URL, urlencode(auth_data))))
token = 'AQAAAAAMsazAAARuVznCO90NcEWCq8xEXAcp0sA'

class MetrikaBase:
    API_MANAGEMENTE_URL = 'https://api-metrika.yandex.ru/management/v1/'
    API_STAT_URL = 'https://api-metrika.yandex.ru/stat/v1/'
    token = None

    def __init__(self, token):
        self.token = token

    def get_headers(self):
        return {
            'Authorization': 'OAuth {}'.format(self.token),
            'Content-Type': 'application/json'
        }

class YandexMetrika(MetrikaBase):
    def get_counters(self):  # получаем номер счетчика: 45353346
        headers = self.get_headers()
        r = requests.get(self.API_MANAGEMENTE_URL + 'counters', headers=headers)
        all_counters = [counter['id'] for counter in r.json()['counters']]

        return [
            Counter(self.token, all_counters[0])
        ]

class Counter(MetrikaBase):
    def __init__(self, token, counter_id):
        self.counter_id = counter_id
        super().__init__(token)

    def get_visits(self):
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,
            'metrics': 'ym:s:visitsPerDay',
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]

    def get_pageviews(self):
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,
            'metrics': 'ym:pv:pageviewsPerDay'
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]

    def get_users(self):
        headers = self.get_headers()
        params = {
            'ids': self.counter_id,
            'metrics': 'ym:pv:users',
            'date1': 'today',
            'date2': 'today',
        }
        r = requests.get(self.API_STAT_URL + 'data', params, headers=headers)
        return r.json()['data'][0]['metrics'][0]

def main():
    metrika = YandexMetrika(token)
    counters = metrika.get_counters()
    # print(counters)

    for counter_id in counters:
        pprint("Количество визитов - {}".format(round(counter_id.get_visits(), 2)))
        pprint("Количество просмотров - {}".format(round(counter_id.get_pageviews(), 2)))
        pprint("Количество посетителей - {}".format(round(counter_id.get_users(), 2)))

main()