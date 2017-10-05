import re
import requests
import urllib.request
from urllib.request import urlopen
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
import time, random

'''

1. Запрашиваем ссылку на Youtube-канал
2. Запрашиваем количество видео, которое нужно сохранить с канала
3. Запрашиваем папку, куда сохранять все видео
3. Пролистываем канал 1 раз. 
4. Считаем видео. Если больше или равно заданному в пункте 2 - формируем список ссылок, сохраняем каждую в указанную
папку. 
5. Если меньше, чем указано в пункте 2 - возвращаемся на пункт 3. 

'''
#Запрашиваем ссылку на Youtube-канал
link_to_channel = str(input('Введите ссылку на Youtube-канал: '))
link_to_channel = link_to_channel.replace(link_to_channel[-1],'')
print(link_to_channel)

#Запрашиваем количество роликов, которые нужно сохранить с канала
number_of_videos = int(input('Сколько роликов нужно сохранить с канала? '))
print(number_of_videos)

#Запрашиваем адрес папки, куда будем сохранять видео
save_video_address = input('Куда сохранять видео?: ')
regxp = '[\w-]+[\w:]'
save_video_address_result = re.findall(regxp, save_video_address)
save_video_address_fynal = '\\\\'.join(save_video_address_result)

driver = webdriver.Firefox() #Подключаем Selenium
link_to_videos = str('/videos')
full_link_to_channel = link_to_channel + link_to_videos
driver.get(full_link_to_channel) #Открываем ссылку на Youtube-канал в браузере

#Начинаем листать страницу
number_of_pages = 1
while number_of_pages < 10:
    print('Делаем', number_of_pages, 'проход...')
    element = driver.find_element_by_tag_name('html')
    element.send_keys(Keys.END)
    time.sleep(10)
    element.send_keys(Keys.PAGE_UP)
    number_of_pages = number_of_pages + 1

# link = full.link_to_channel.replace(full.link_to_channel[-1],'')
# response = requests.get(link)
# time.sleep(5)
#
# element.send_keys(Keys.END)
# time.sleep(10)
#
# element.send_keys(Keys.PAGE_UP)
#
# element.send_keys(Keys.END)
# time.sleep(10)
#
# element.send_keys(Keys.END)
# time.sleep(10)
#
# element.send_keys(Keys.END)
# time.sleep(10)
#
# element.send_keys(Keys.END)
# time.sleep(10)

#
# #Считаем, сколько видео сейчас на странице?
# f = open('temp.txt', 'wb')

response = requests.get(link_to_channel)
text_for_file = response.content

f = open('temp.txt', 'wb')
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



#
# #Начинаем парсить по регулярному выражению
# pars = []
# with open('temp.txt', 'r', encoding='utf8') as f:
#     pars = f.read()
# regxp = '(accessible-description)'
# result = re.findall(regxp, pars)
#
# result_list = []
#
# for item in result:
#     print(item)
#     result_list.append(item)
#
# print(result_list)
# print(len(result_list))


# number_of_passes = int(input('Сколько страниц вниз?: '))
# print(number_of_passes)

#driver.get('https://en.wikipedia.org/wiki/Main_Page')
# element = driver.find_element_by_tag_name('html')
# i = 1
# while i <= number_of_passes:
#     element.send_keys(Keys.END)
#     time.sleep(5)
#     print(i)
#     i = i + 1
# print('Все')

#Сколько видео сохранять? Запрос на поштучное сохранение. Если меньше - то делаем ветку и выводим, что столько нет
'''
т.е. запрашиваем - сколько видео нужно сохранить с канала? Грузим страницу на один проход вниз. Смотрим - сколько 
сейчас видео? Если меньше видео - делаем еще проход вниз. Считаем количество видео. Если есть нужное количество - 
начинаем сохранение. Если меньше - еще проход вниз. 

Парсим: accessible-description

или вот это: 

<a id="thumbnail" class="yt-simple-endpoint inline-block style-scope ytd-thumbnail" tabindex="-1" href="https://www.youtube.com/watch?v=_sV0S8qWSy0">

<a id="thumbnail" class="yt-simple-endpoint inline-block style-scope ytd-thumbnail" tabindex="-1" href="https://www.youtube.com/watch?v=oHmBf4ExtZk">


Скорее даже это: 

<img id="img" class="style-scope yt-img-shadow" width="210"

Хрен. Попробовать через кнопку "Воспроизвести все" - вываливается список всего видео на канале - может будет легче парсить? Нет.
Ищем вариант дальше... 


'''