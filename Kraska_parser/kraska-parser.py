import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

#Запрос на ссылку от пользователя
link = input(str('Введите ссылку на страницу: '))

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link)

#Сохраняем исходный код страницы во временный файл
f = open('temp.txt', 'wb')
text_for_file = response.content
f.write(text_for_file)
f.close()
print('Исходный код страницы сохранен в файл')

#Начинаем парсить по регулярному выражению
pars = []
with open('temp.txt', 'r', encoding='utf8') as f:
    pars = f.read()
regxp = '(?<=photoUrl&quot;:&quot;)(https:\/\/cdn\.inmyroom\.ru\/uploads\/photo.*?\.jpg)(?=&quot;}\"><noscript)'
result = re.findall(regxp, pars)

result = list(result)
