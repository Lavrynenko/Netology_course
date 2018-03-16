import requests
from fake_useragent import UserAgent # для генерации поддельного запроса на сервер
from bs4 import BeautifulSoup # Для обработки получаемых данных
import re

link_to_proxylist = 'https://hidemy.name/ru/proxy-list/'
response = requests.get(link_to_proxylist, headers={'User-Agent': UserAgent().chrome})
print(response)

html = requests.get(link_to_proxylist)
html = response.content

soup = BeautifulSoup(html,'html.parser') #Подключаем Суп, парсим полностью код страницы

proxy_server = soup.findAll('td', attrs = {'class':'tdl'})
print(proxy_server) #Вывели полный список всех проксей

#Начинаем парсить адреса прокси-серверов

proxy_server = str(proxy_server)
regxp = '>(.*?)</td>'
result_proxy = re.findall(regxp, proxy_server)
print(result_proxy)
print(len(result_proxy))

#Начинаем парсить номера портов
html = str(html)
regxp = '>(\d+)<'
result_ip = re.findall(regxp, html)

#Обрезаем лишнее
del result_ip[len(result_proxy):]
print(result_ip)
print(len(result_ip))
#final = []

i = 0
while i < len(result_proxy):
    ip_port = (result_proxy[0], ':', result_ip[0])
    del result_proxy[0]
    del result_ip[0]
    #print(ip_port)
    ip_port = ''.join(ip_port)
    print(ip_port)
    i = i + 1
    with open('proxy_list.txt', 'a', encoding='utf8') as f:
        f.write(ip_port + '\n')