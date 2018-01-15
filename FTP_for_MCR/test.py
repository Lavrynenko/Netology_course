import sys, shutil, os, ftplib
import random
import time

host = str(input('Host?: '))
ftp_user = str(input('FTP user?: '))
ftp_password = str(input('Password?: '))
ftp = ftplib.FTP(host, ftp_user, ftp_password)

'''
\w+.\w*$  - регулярное выражение для поиска названия файла в ссылке в стиле *.jpg 
'''

text = ftp.getwelcome() # кладем в переменную приветственное сообщение с FTP-сервера
print(text) # Выводим сообщение на экран

ftp.cwd('y') # заходим в директорию y
list = ftp.nlst() # загоняем в переменную list список содержимого директории
print(list) # выводим содержимое на экран
catalog_name = str(input('Name catalog?: \n'))
ftp.mkd(catalog_name) # Создаем каталог
ftp.cwd(catalog_name) # Заходим в созданный каталог
#Грузим в него файл - разобраться как!!!

#Выгружаем на локальынй компьютер файл - разобраться, как!!!!

#ftp.rmd('New') # Удаляем каталог

size = ftp.size('ResizeImages.exe')
print('File: ', size, 'kb')



# filename = str('06ae187a847728d81bfbf4effb6d2d7a.jpg')
# for i in list:
#     if i == filename:
#         print('Есть такой файл! Переименовываем: ')
#         ftp.rename('06ae187a847728d81bfbf4effb6d2d7a.jpg', '06ae187a847728d81bfbf4effb6d2d7a.jpg_orig')
#         list = ftp.nlst()
#         print(list)
#     else:
#         print('Нет такого файла!')
#         ftp.rename('06ae187a847728d81bfbf4effb6d2d7a.jpg_orig', '06ae187a847728d81bfbf4effb6d2d7a.jpg')
#         list = ftp.nlst()
#         print(list)
#
# #Открываем файл и читаем построчно ссылки на файлы, что бы потом парсить
# with open('link_to_pictures.txt', 'r', encoding='utf8') as f:
#     for line in f:
#         print(line)
#         # quality = int(f.readline())
#         # i = 0
#         # while i <= quality:
#         # f.readline()
#         # i = i + 1