import time
import random
import requests
from fake_useragent import UserAgent # для генерации поддельного запроса на сервер
from bs4 import BeautifulSoup # Для обработки получаемых данных
import os

full_list = []
protocol = str('https://')
domain = str('.wordpress.com')

with open('blog.txt', 'r', encoding='utf8') as f:
    for blog in f:
        blog = str(blog.strip())
        full_list.append(blog)

while len(full_list) > 0:
    full_link = protocol + full_list[0] + domain
    print('Проверяем блог: ', full_link) #получили ссылку

    response = requests.get(full_link, headers={'User-Agent': UserAgent().chrome})
    html = requests.get(full_link)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')
    title = soup.html.head.title

    for i in title:
        if i == 'WordPress.com':
            print(full_link, 'мертв :(')
            with open('die_blogs.txt', 'a', encoding='utf8') as f:
                f.write(full_link + '\n')
        elif i != 'Wordpress.com':
            print(full_link, 'жив!')
            with open('live_blogs.txt', 'a', encoding='utf8') as f:
                f.write(full_link + ' \n')

    del full_list[0] #Удаляем проверенный адрес с нулевой позиции в списке
    os.remove('blog.txt') #Удалили файл с адресами блогов

    for name_blog in full_list:
        with open('blog.txt', 'a', encoding='utf8') as f:
            f.write(name_blog + ' \n')

    random_time = random.randrange(5, 30)
    print('Отдыхаем', random_time, 'секунд... ')
    time.sleep(random_time)

