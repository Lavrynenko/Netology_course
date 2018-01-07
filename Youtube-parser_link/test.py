import re
import requests
import urllib.request
from urllib.request import urlopen
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
import time, random

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
