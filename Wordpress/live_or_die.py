'''
1. Получаем список всех блогов
2. Открываем блог, получаем его заголовок, смотрим состояние
3. Если блог живой - сохраняем имя в файл "Жив", если удален - в файл "Удален"
'''
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
        # print(blog)
        blog = str(blog.strip())
        # print(blog)
        lll = protocol + blog + domain
        #print(lll)
        full_list.append(lll)
#print('Выводим полный список ссылок: \n')
#print(full_list)
#print('А теперь проверка: \n')
for page_link in full_list:
    random_time = random.randrange(1, 5)
    print('Отдыхаем', random_time, 'секунд... ')
    time.sleep(random_time)
    response = requests.get(page_link, headers={'User-Agent': UserAgent().chrome})
    html = requests.get(page_link)
    html = response.content
    soup = BeautifulSoup(html, 'html.parser')
    title = soup.html.head.title
#print(title)

    for i in title:
        #print(i)
        if i == 'WordPress.com':
            print(page_link, 'мертв :(')
            with open('die_blogs.txt', 'a', encoding='utf8') as f:
                f.write(page_link + '\n')
        elif i != 'Wordpress.com':
            print(page_link, 'жив!')
            with open('live_blogs.txt', 'a', encoding='utf8') as f:
                f.write(page_link + ' \n')



    # title = str(title)
    # title_len = len(title)
    # print(title, title_len)
    # for i in title:
    #     titles = []
    #     titles.append(i)
    #     print(titles)



#    print('Заголовок: ', soup.html.head.title)



#     print(blog, ': ', response.headers)
#     headers = str(r.headers)
#     with open('statistics.txt', 'a', encoding='utf8') as f:
#         f.write(headers + '\n \n \n')
#
#
#
# response = requests.get(page_link, headers={'User-Agent': UserAgent().chrome})
# #print(response) # Что отвечает сервер
#
# html = requests.get(page_link)
#
# # r = requests.get(blog)
# # print(blog, ': ', r.headers)
# html = response.content
# #html[:1000]
#
# soup = BeautifulSoup(html,'html.parser')
# #print(soup)
#
# print('Заголовок: ', soup.html.head.title)


#
# '''
# Пример поиска по списку:
#
# mass = ['11', '12', '13', '14', '15']
# x = str(input('Введите Х: '))
# for i in mass:
#   if i == x:
#     print('Ok!')
#     break
#   else:
#     print('No!')
#     break
#
# '''