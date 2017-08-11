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
#print (pars)
regxp = '(?<=photoUrl&quot;:&quot;)(https:\/\/cdn\.inmyroom\.ru\/uploads\/photo.*?\.jpg)(?=&quot;}\"><noscript)'
result = re.findall(regxp, pars)
#print (result)

result = list(result)
#print ('Вывод строк')
#print (result[2])
counter = 1
for link in result:
    print(link)
    url = link
    img = urllib.request.urlopen(url).read()
    out = open("counter.jpg", "wb")
    out.write(img)
    out.close
    counter = counter + 1

    out = open("img.jpg", "wb")


    # for x in result:
    #   print (x)
    # url = x
    # img = urllib.request.urlopen(url).read()
    # out = open(x,',','jpg', 'wb')
    # out.write(img)
    # out.close


# # print (result.split(,))
# #print (result(str.partition(', ')))
#
# f = open('fulllink.txt', 'w')
# f.write(result)
# f.close()
# print('Ссылки сохранены в файл')
#
# with open('fulllink.txt','r') as f:
#     for link in f:
#         link = list()
#         print(f)


    # def get_dishes():
    #     dishes_all = dict()
    #     with open('menu.txt', 'r') as f:
    #         for line in f:
    #             dishes_value = list()
    #             dishes = line.strip()
    #             ingridient_count = int(f.readline().strip())
    #             for _ in range(ingridient_count):  # _ одноразовая переменная
    #                 ingredient = f.readline().strip().split(" | ")
    #                 i = {"ingridient_name": ingredient[0], "quantity": int(ingredient[1]), "measure": ingredient[2]}
    #                 dishes_value.append(i)
    #             f.readline()
    #             dishes_all.update({dishes: dishes_value})






#Тестим
# result = list(result)
# for x in result:
#   print (x)
  # url = x
  # img = urllib.request.urlopen(url).read()
  # out = open(x,',','jpg', 'wb')
  # out.write(img)
  # out.close


#stream = urlopen(url)

#Кусок для сохранения фотографий по ссылкам
# url = 'https://cdn.inmyroom.ru/uploads/photo/file/cf/cf01/original_cf016769-0086-4a61-8303-143ebe95879f.jpg'
# img = urllib.request.urlopen(url).read()
# out = open("img.jpg", "wb")
# out.write(img)
# out.close