'''
1. Получаем список всех блогов
2. Открываем блог, получаем его статус, парсим по ключевым моментам
3. Если блог живой - сохраняем имя в список "Жив", если удален - в список "Удален"
'''
import requests

with open('link_to_blogs.txt', 'r', encoding='utf8') as f:
    for blog in f:
        print(blog)
        r = requests.get(blog)
        print(r.status_code)

# r = requests.get('https://lavrynenko.wordpress.com')
# print(r.headers)
