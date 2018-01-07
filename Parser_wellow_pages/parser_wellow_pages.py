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

fullsite = 'http://cv.goldenpages.ua/'

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

print(len(result))
print('Без дублей: ', result)

'''
Нужно пропарсить готовый список еще раз - убрать #map и прочее!!!!
А потом убираем дубли! 

'''

#Парсим map и прочее уже по готовому
# result = []
# regxp = ''
# result = re.findall(regxp, result)

result2 = set(list(result)) #убираем дубли из списка

print('Убрали дубли: \n')
#Сохранили все ссылки без дублей в файл
for link in result2:
    # f = open('temp.txt', 'w', encoding='utf8')
    print(link)
    with open('link_temp.txt', 'a') as f:
        f.write(link + str('\n'))

f = open('link_temp.txt')
print('Читаем файл построчно: \n')
for line in f:
    #print(line)
    #Открываем ссылку, получаем исходный код, обрабатываем:
    print('Открываем ссылку: \n')
    response = requests.get(str(fullsite) + line)
    print(response.content)
#print(result)
    f = open('temporary.txt', 'a')
    content_to_save = response.content
    content_to_save = str(content_to_save)
    f.write(content_to_save)

    #Проблема с кодировкой в открываемых страницах!!!! Разобраться!


# with open('temp.txt', 'w', encoding='utf8') as f:
#     f.write(result)


#Начинаем собирать информацию по собранным ссылкам