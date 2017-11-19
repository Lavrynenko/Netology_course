'''
1. Получаем список всех блогов
2. Открываем блог, получаем его статус
3. Если блог живой - сохраняем имя в список "Жив", если удален - в список "Удален"
'''
import requests

# with open('link_to_blogs.txt', 'r', encoding='utf8') as f:
#     for blog in f:
#         print(blog)
#         r = requests.get(blog)
#         print(blog + r.status_code)

r = requests.get('https://lavrynenko.wordpress.com')
print(r.headers)


# #r = requests.get('https://﻿abamevap.wordpress.com')
# r = requests.get('https://lavrynenko.wordpress.com')
# #print(r.status_code)
# print(r.headers)
# header = []
# header = r.headers
# print(header)







# with open('link_to_blogs.txt', 'r', encoding='utf8') as f:
#     for blog in f:
#         print(blog)
#         blogs = 'https://lavrynenko.wordpress.com'
#         r = requests.get(blog)
#         print(r.status_code)




       # link = 'https://' + blog.strip()
       # print(link)
       # with open('link_to_blogs.txt', 'a', encoding='utf8') as f:
       #     f.write(link + '\n')


        # r = requests.get('https://' + blog)




        # link = blog.strip() + ('.wordpress.com') #strip() - обрезает лишние пробелы и символ переноса строки
        # print(link)
        # with open('blog_to_link.txt', 'a', encoding='utf8') as f:
        #     f.write(link + '\n')

        #r = requests.get(link)
        # print(r.status_code)
        # print(r.headers['content-type'])


    # r = requests.get(link)
    # print(r.status_code)


    # with open('text_rand.txt', 'a', encoding='utf8') as f:
    #     f.write(i)

#
# r = requests.get('https://api.github.com', auth=(user, password))
#
# print (r.status_code)
# print (r.headers['content-type'])
#
#
# sity_list = []
# f = open('final.txt', 'r', encoding='utf8')
# for i in f:
#     sity = f.readline()
#     sity_list.append(sity)