'''
1. Получаем список всех блогов
2. Открываем блог, получаем его статус, парсим по ключевым моментам
3. Если блог живой - сохраняем имя в список "Жив", если удален - в список "Удален"
'''
import requests
full_list = []

protocol = str('https://')
domain = str('.wordpress.com')
with open('blog.txt', 'r', encoding='utf8') as f:
    for blog in f:
        # print(blog)
        blog = str(blog.strip())
        # print(blog)
        lll = protocol + blog + domain
        print(lll)
        full_list.append(lll)
#print('Выводим полный список ссылок: \n')
#print(full_list)
print('А теперь проверка: \n')
for blog in full_list:
    r = requests.get(blog)
    print(blog, ': ', r.headers)
    headers = str(r.headers)
    with open('statistics.txt', 'a', encoding='utf8') as f:
        f.write(headers + '\n \n \n')
