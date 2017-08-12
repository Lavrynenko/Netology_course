#import requests
import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

#Запрос на ссылку от пользователя
link = input(str('Введите ссылку на файл: '))

#Открываем файл со ссылкой на нужную страницу
# f = open('link.txt','r', encoding='utf8')
# link = f.readline()
#print(link)

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
counter = int(1)
for link in result:
    print(link)
    url = link
    img = urllib.request.urlopen(url).read()
    filename = "counter_{}.jpg".format(counter)
    out = open(filename, "wb")
    out.write(img)
    out.close
    counter = counter + 1