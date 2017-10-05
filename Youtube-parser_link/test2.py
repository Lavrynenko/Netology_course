import requests
import re
import urllib
import time
#import urlopen
import urllib.request
import urllib.request
from urllib.request import urlopen

link = str(input('Введите ссылку на канал: '))

link = link.replace(link[-1],'')

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
regxp = '(accessible-description)'
result = re.findall(regxp, pars)

result_list = []

for item in result:
    print(item)
    result_list.append(item)

print(result_list)
print(len(result_list))

# result_list = []
# result_list.append(result)
# #print(result)
# print(result_list)
# print(len(result_list))

# <img alt="" width="196" data-ytimg="1"
# span class="accessible-description


