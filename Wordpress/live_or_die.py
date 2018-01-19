import time
import random
import requests
from fake_useragent import UserAgent # для генерации поддельного запроса на сервер
from bs4 import BeautifulSoup # Для обработки получаемых данных

full_list = []
protocol = str('https://')
domain = str('.wordpress.com')
with open('blog.txt', 'r', encoding='utf8') as f:
    for blog in f:
        blog = str(blog.strip())
        lll = protocol + blog + domain
        full_list.append(lll)

for page_link in full_list:
    random_time = random.randrange(1, 5)
    print('Отдыхаем', random_time, 'секунд... ')
    time.sleep(random_time)
    response = requests.get(page_link, headers={'User-Agent': UserAgent().chrome})
    html = requests.get(page_link)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')
    title = soup.html.head.title

    for i in title:
        if i == 'WordPress.com':
            print(page_link, 'мертв :(')
            with open('die_blogs.txt', 'a', encoding='utf8') as f:
                f.write(page_link + '\n')
        elif i != 'Wordpress.com':
            print(page_link, 'жив!')
            with open('live_blogs.txt', 'a', encoding='utf8') as f:
                f.write(page_link + ' \n')