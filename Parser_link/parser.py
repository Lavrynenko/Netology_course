#import requests
import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

#Открываем файл со ссылкой на нужную страницу
f = open('link.txt','r', encoding='utf8')
link = f.readline()
#print(link)

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link)
#print (response.content)

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
print (pars)
regxp = '(?<=photoUrl&quot;:&quot;)(https:\/\/cdn\.inmyroom\.ru\/uploads\/photo.*?\.jpg)(?=&quot;}\"><noscript)'
result = re.findall(regxp, pars)
print (result)

result = str(result)
f = open('fulllink.txt', 'w')
f.write(result)
f.close()

#stream = urlopen(url)

url = 'https://cdn.inmyroom.ru/uploads/photo/file/cf/cf01/original_cf016769-0086-4a61-8303-143ebe95879f.jpg'
img = urllib.request.urlopen(url).read()
out = open("img.jpg", "wb")
out.write(img)
out.close