import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

#Запрос на ссылку от пользователя
#akvakraska.ru/stati/1734-chto-predstavlyayut-soboy-laminirovannye-dveri.html
# link = input(str('Link? '))
# http = str('http://')
# #print(http)
# link = http+link
#
# response = requests.get(link)
# print (response)
#
# text_page = response.content
# print (text_page)
#
# print('Сохранили исходный код страницы в файл :) ')
# with open('temp.txt', 'wb') as f:
#     text_for_file = response.content
#     f.write(text_for_file)

pars = []
with open('temp.txt', 'r') as f:
    pars = f.read()
    # print('Исходный текст файла: \n')
    # print(pars)

#Ищем: style="float:left;" />
regxp = '\b.*table.*table\b'
result = re.findall(regxp, pars)

print(result)