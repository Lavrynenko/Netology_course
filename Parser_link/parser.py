#import requests
import requests
import re
import urllib

#Открываем файл со ссылкой на нужную страницу
f = open('link.txt','r', encoding='utf8')
link = f.readline()
print(link)

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link)
print (response.content)

#Сохраняем исходный код страницы во временный файл
f = open('temp.txt', 'wb')
text_for_file = response.content
f.write(text_for_file)
f.close()
print('Исходный код страницы сохранен в файл')

#Начинаем парсить по регулярному выражению
pattern = '(?<=photoUrl&quot;:&quot;)https://cdn\.inmyroom\.ru/uploads/photo[\w\W]*?\.jpg(?=&quot;}"\ data-component)'