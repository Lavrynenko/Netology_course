import sys, shutil, os, ftplib
import random
# host = 'mcr-clinic.ru'
# ftp_user = 'bitrix'
# ftp_password = 'bitrix555'
# ftp = ftplib.FTP(host, ftp_user, ftp_password)
host = str(input('Host?: '))
ftp_user = str(input('FTP user?: '))
ftp_password = str(input('Password?: '))
ftp = ftplib.FTP(host, ftp_user, ftp_password)
#ftp.retrlines('LIST')
#ftp.cwd(путь) #Изменяем рабочий каталог
directory_name = str(input('Введите имя создаваемого каталога: '))
ftp.mkd(directory_name)
print('Каталог ', directory_name,' создан')
#ftp.retrlines('LIST') #Выводим список содержимого каталога
#print('Выводим список с содержимым каталога: ', ftp.dir())#Составляем список с содержимым каталога
#print('Выводим строку с текущим рабочим каталогом: ', ftp.pwd())#Строка с текущим рабочим каталогом на сервере
'''
1. Создать некоторое количество каталогом со случайными именами
2. Записать в каждый каталог какой-то файл
'''
#
# finish_number = int(input('Сколько каталогов нужно создать? : '))
# i = int(0)
# while i < finish_number:
#     ftp.mkd('Dir' + str(i))
#     print('Каталог Dir', i, ' создан')
#     i = i + 1
#     #print('Случайное число в диапазоне от', start_number, 'до', finish_number, ': ',
#     #random.randrange(start_number, finish_number))

list = []
list = ftp.nlst() #Сформировали список всего, что содержится в каталоге
print(list)
ftp.cwd(directory_name) #Перешли в каталог, который создали
print(ftp.nlst()) #Показали содержимое каталога
f = open('c:\\Users\\oleks\\Downloads\\MCR\\ok\\ll ok\\06ae187a847728d81bfbf4effb6d2d7a.jpg', 'rb')
ftp.storbinary('STOR 06ae187a847728d81bfbf4effb6d2d7a.jpg', f)#скопировали файл
list = ftp.nlst() #Сформировали список всего, что в каталоге
filename = str('06ae187a847728d81bfbf4effb6d2d7a.jpg')
for i in list:
    if i == filename:
        print('Есть такой файл!')
    else:
        print('Нет такого файла!')


f = open('c:\\Users\\oleks\\Downloads\\MCR\\ok\\ll ok\\06ae187a847728d81bfbf4effb6d2d7a.jpg', 'rb')
'''Открыли файл, который нужно будет копировать на FTP
'''
ftp.storbinary('STOR 06ae187a847728d81bfbf4effb6d2d7a.jpg', f) #Копируем файл на заданный адрес - STOR -
# обязательно перед именем
'''
Проверка наличия элемента в списке: 
mass = ['11', '12', '13', '14', '15']
x = str(input('Введите Х: '))
for i in mass:
  if i == x:
    print('Ok!')
    break
  else:
    print('No!')
    break

т.е. формируем список всех файлов в нужном каталоге: если файл есть - переименовываем, копируем туда с компа облегченный,
если файла нет - переходим к следующему каталогу

'''



#ftp.storbinary("STOR ftptest.txt", myfile)
# import ftplib
#
# host = "ftp.ex.ru"
# ftp_user = "root"
# ftp_password = "python"
# filename = "picture.png"
#
# con = ftplib.FTP(host, ftp_user, ftp_password)
# # Открываем файл для передачи в бинарном режиме
# f = open(filename, "rb")
# # Передаем файл на сервер
# send = con.storbinary("STOR " + filename, f)
# # Закрываем FTP соединение
# con.close