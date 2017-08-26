"""
1. Запрашиваем ссылку на статью
2. Исходный текст по ссылке сохраняем в файл
3. Файл парсим, что бы убрать лишние символы
4. Готовый текст сохраняем в файл

"""
import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

#Запрашиваем линк на статью

#Запрос на ссылку от пользователя
link = input(str('Введите ссылку на страницу: '))
sourse = ('http://')
link = sourse + link
print(link)
response = requests.get(link)


#Парсим все от <span class="highslide-caption"> до <div style="clear: both; height:10px;"></div></div>

# link = input(str('Link? '))
# http = str('http://')
# #print(http)
# link = http+link


f = open('temp.txt', 'wb')
text_for_file = response.content
f.write(text_for_file)
f.close()
print('Исходный код страницы сохранен в файл')


# pars = []
# with open('temp.txt', 'r') as f:
#     pars = f.read()
#     # print('Исходный текст файла: \n')
#     # print(pars)
#
# #Ищем: style="float:left;" />
# regxp = '\b.*table.*table\b'
# result = re.findall(regxp, pars)
#
# print(result)