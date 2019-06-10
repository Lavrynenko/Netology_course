#Programm for resize pictures here: http://lavrynenko.com/wp-content/uploads/2019/01/magick.exe
import ftplib
import os
import sys
import subprocess
import time
from termcolor import colored

def autorization():
    host = str(input('Host?: ')) #FTP
    ftp_user = str(input('User?: ')) #Login
    ftp_password = str(input('Password?: ')) #Password

    #После чего каждую переменную подключим к авторизации:
    print('Попытка соединения с FTP-сервером', host)
    print('Login:', ftp_user)
    print('Password:', ftp_password)

    ftp = ftplib.FTP(host, ftp_user, ftp_password)
    welcome_text = ftp.getwelcome()
    print(welcome_text, '\n')  # Вывели на экран Welcome-сообщение сервера
    directory_list = ftp.nlst()  # загоняем в переменную list список содержимого директории
    directory_listing = []
    catalog_or(ftp)

def catalog_or(ftp):
    print('Создаем список каталогов: \n')
    data = []
    ftp.dir(data.append)
    data.sort()
    for line in data:
        if line[0] == str('d'):
            print(line)
        else:
            None
    menu(ftp)

def menu(ftp):
    menu_directory = int(input('\n 1 - Выбрать каталог для работы\n 2 - Выйти вверх\n 3 - Работать в текущем каталоге\n >>> '))
    if menu_directory == 1:
        down(ftp)
    elif menu_directory == 2:
        up(ftp)
    elif menu_directory == 3:
        work(ftp)

def up(ftp):
    print('Выходим вверх')
    ftp.sendcmd('cdup')
    #menu(ftp, directory_listening)
    catalog_or(ftp)

def down(ftp):
    work_directory = str(input('Введите название каталога\n >>> '))
    print('Входим в каталог:', work_directory)
    ftp.cwd(work_directory)
    catalog_or(ftp)

def work(ftp):
    print('Работаем!')
    print('sys.argv[0] =', sys.argv[0])
    pathname = os.path.dirname(sys.argv[0])
    print('Скрипт находится:', pathname)
    print('Полный путь к скрипту:', os.path.abspath(pathname))

    data = []
    ftp.dir(data.append)
    data.sort()
    print('В каталоге имеется:')
    directory_list = ftp.nlst()  # загоняем в переменную list полный список содержимого директории
    print('Структура информации на сервере:\n', directory_list)

    file_list = [] #список только файлов
    directory_listing = [] #список только каталогов
    for director in directory_list:
        try:
            ftp.cwd(director)
            directory_listing.append(director)
            ftp.sendcmd('cdup')
        except:
            ftplib.error_perm: 550
    print('Каталоги:', directory_listing)
    file_list = list(set(directory_list) - set(directory_listing))
    print('Только файлы:', file_list, '\n')
    optimization_size = int(0)

    for file in file_list:
        file_extention = file.split('.')[-1]

        if file_extention == 'jpg':
            print('Файл:\n', file, colored('расширение: jpg', 'green'))
            print(colored('Загружаем файл', 'yellow'))
            with open(file, 'wb') as local_file:
                ftp.retrbinary('retr ' + file, local_file.write)
                print(file, colored('успешно загружен с FTP', 'green'))

            orig_file = 'orig_' + file
            os.rename(file, orig_file)
            subprocess.run('{} {} {} {} {}'.format('magick.exe', orig_file, '-quality', '50', file))
            print(file, colored('успешно обработан', 'green'))

            with open(file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + file, file_to_upload)
                print(file, colored('успешно загружен на FTP', 'green'))

            with open(orig_file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + orig_file, file_to_upload)
                print(orig_file, colored('успешно загружен на FTP', 'green'))

            file_size = os.path.getsize(file)
            orig_file_size = os.path.getsize(orig_file)
            print('\n Файл', file, 'занимал', orig_file_size, 'kb, а теперь занимает', file_size, 'kb.')
            optimization_size = optimization_size + (orig_file_size - file_size)
            os.remove(orig_file)
            print(orig_file, colored('удален из локального хранилища', 'yellow'))
            os.remove(file)
            print(file, colored('удален из локального хранилища', 'yellow'))
            print('Обработка файла завершена.')
            print('   ')

        elif file_extention == 'png':
            print('Файл:\n', file, colored('расширение: png', 'green'))
            print(colored('Загружаем файл', 'yellow'))
            with open(file, 'wb') as local_file:
                ftp.retrbinary('retr ' + file, local_file.write)
                print(file, colored('успешно загружен с FTP', 'green'))

            orig_file = 'orig_' + file
            os.rename(file, orig_file)
            subprocess.run('{} {} {} {} {}'.format('magick.exe', orig_file, '-quality', '91', file))
            print(file, colored('успешно обработан', 'green'))

            with open(file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + file, file_to_upload)
                print(file, colored('успешно загружен на FTP', 'green'))

            with open(orig_file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + orig_file, file_to_upload)
                print(orig_file, colored('успешно загружен на FTP', 'green'))

            file_size = os.path.getsize(file)
            orig_file_size = os.path.getsize(orig_file)
            print('\n Файл', file, 'занимал', orig_file_size, 'kb, а теперь занимает', file_size, 'kb.')
            optimization_size = optimization_size + (orig_file_size - file_size)
            print(' Экономим:', orig_file_size - file_size, 'kb\n')

            os.remove(orig_file)
            print(orig_file, colored('удален из локального хранилища', 'yellow'))
            os.remove(file)
            print(file, colored('удален из локального хранилища', 'yellow'))
            print('Обработка файла завершена.')
            print('   ')

        elif file_extention != 'png' or 'jpg':
            print(file,'\n')
            print(file, colored(' - другое расширение', 'red'))
            print('   ')

    print(colored('Итого сжали:'))
    print(optimization_size, 'kB')
    print('\033[92m' + 'Все сделано!')

def index():
    autorization()

index()