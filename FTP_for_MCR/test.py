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



# directory_name = str(input('Введите имя создаваемого каталога: '))
# ftp.mkd(directory_name)
# print('Каталог ', directory_name,' создан')
#
# ftp.cwd(directory_name) #Перешли в каталог, который создали
#
# list = []
# list = ftp.nlst() #Сформировали список всего, что содержится в каталоге
# print('Создан каталог и он совершенно пустой... ')
# print(list)
#
# f = open('c:\\Users\\oleks\\Downloads\\MCR\\ok\\ll ok\\06ae187a847728d81bfbf4effb6d2d7a.jpg', 'rb')
# ftp.storbinary('STOR 06ae187a847728d81bfbf4effb6d2d7a.jpg', f)#скопировали файл
# list = ftp.nlst() #Сформировали список всего, что в каталоге
# print('А теперь в каталоге есть файл: ')
# print(list)
# time.sleep(3)


ftp.cwd('y')
list = ftp.nlst()
print(list)



filename = str('06ae187a847728d81bfbf4effb6d2d7a.jpg')
for i in list:
    if i == filename:
        print('Есть такой файл! Переименовываем: ')
        ftp.rename('06ae187a847728d81bfbf4effb6d2d7a.jpg', '06ae187a847728d81bfbf4effb6d2d7a.jpg_orig')
        list = ftp.nlst()
        print(list)
    else:
        print('Нет такого файла!')
        ftp.rename('06ae187a847728d81bfbf4effb6d2d7a.jpg_orig', '06ae187a847728d81bfbf4effb6d2d7a.jpg')
        list = ftp.nlst()
        print(list)

#Открываем файл и читаем построчно ссылки на файлы, что бы потом парсить
with open('link_to_pictures.txt', 'r', encoding='utf8') as f:
    for line in f:
        print(line)
        # quality = int(f.readline())
        # i = 0
        # while i <= quality:
        # f.readline()
        # i = i + 1