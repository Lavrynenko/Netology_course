'''

http://cv.goldenpages.ua/
Парсер Желтых страниц по разделам.

1. Запрашиваем ссылку на интересующий раздел
2. Грузим страницу
3. Получаем исходный код страницы
4. Парсим ссылки на значния на странице, ссылки собираем в список
5. Каждый пункт в списке - делаем запрос по ссылке, собираем данные, сохраняем в словарь
6. Ищем переход на следующую страницу. Если есть - переходим, возврат к пункту 4, если нет - выход
'''

import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

link_to_section = str(input('Введите ссылку на интересующий раздел: '))
link_to_section = link_to_section.replace(link_to_section[-1],'')
print(link_to_section)

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link_to_section)

#Сохраняем исходный код страницы во временный файл
#with open('temp.txt', 'wb', encoding='utf8') as f:
f = open('temp.txt', 'wb')
text_for_file = response.content
f.write(text_for_file)
f.close()
print('Исходный код страницы сохранен в файл')

#Начинаем парсить по регулярному выражению
pars = []
with open('temp.txt', 'r', encoding='utf8') as f:
    pars = f.read()

#regxp = r'\"(.*)"'
#regxp = '\"(\/detail.*)\"'
result = []
regxp = '\"(\/detail.+)(?<!#map)\"'
result = re.findall(regxp, pars)
print(result)

print('Link: ')
for link in result:
    # f = open('temp.txt', 'w', encoding='utf8')
    print(link)
    with open('link_temp.txt', 'a') as f:
        f.write(link + str('\n'))


#print(result)

# with open('temp.txt', 'w', encoding='utf8') as f:
#     f.write(result)


#Начинаем собирать информацию по собранным ссылкам