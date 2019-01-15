import ftplib
import os
import sys
import subprocess

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
    print(welcome_text)  # Вывели на экран Welcome-сообщение сервера
    directory_list = ftp.nlst()  # загоняем в переменную list список содержимого директории
    print('Структура информации на сервере:\n')
    for directory in directory_list:
        print(directory)
    print('\nСоздаем список каталогов\n')
    directory_listing = []
    catalog_or(ftp, directory_listing)

def catalog_or(ftp, directory_listing):
    directory_list = ftp.nlst()  # загоняем в переменную list список содержимого директории
    print('Структура информации на сервере:\n')
    for directory in directory_list:
        print(directory)
    print('\nСоздаем список каталогов\n')
    directory_listing = []
    for director in directory_list:
        try:
            ftp.cwd(director)
            directory_listing.append(director)
            ftp.sendcmd('cdup')
        except:
            ftplib.error_perm: 550

    directory_listing = '\\'.join(directory_listing)
    print('На сервере имеются следующие каталоги:\n', directory_listing, '\n')
    menu(ftp, directory_listing)

def menu(ftp, directory_listing):
    menu_directory = int(input(' 1 - Выбрать каталог для работы\n 2 - Выйти вверх\n 3 - Работать в текущем каталоге\n >>> '))
    if menu_directory == 1:
        down(ftp, directory_listing)
    elif menu_directory == 2:
        up(ftp, directory_listing)
    elif menu_directory == 3:
        work(ftp, directory_listing)

def up(ftp, directory_listening):
    print('Выходим вверх')
    ftp.sendcmd('cdup')
    #menu(ftp, directory_listening)
    catalog_or(ftp, directory_listening)

def down(ftp, directory_listening):
    print('Войти в каталог \n')
    work_directory = str(input('Введите название каталога\n >>> '))
    print('Входим в каталог:', work_directory)
    ftp.cwd(work_directory)
    print(ftp.nlst())
    catalog_or(ftp, directory_listening)

def work(ftp, directory_listening):
    print('Работаем!')

    # Определяем место, где находится сам код программы
    print('sys.argv[0] =', sys.argv[0])
    pathname = os.path.dirname(sys.argv[0])
    print('Скрипт находится:', pathname)
    print('Полный путь к скрипту:', os.path.abspath(pathname))

    #Получаем список всего содержимого в папке на сервере
    directory_list = ftp.nlst()  # загоняем в переменную list полный список содержимого директории
    print('Структура информации на сервере:\n', directory_list)

    #Формируем список только файлов
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

    #Определяем расширение файла
    for file in file_list:
        #file_size = ftp.size(file)
        file_extention = file.split('.')[-1]

        if file_extention == 'jpg':
            print(file, ' = jpg')
            print('Загружаем файл', file, 'c FTP')
            with open(file, 'wb') as local_file:
                ftp.retrbinary('retr ' + file, local_file.write)
                print(file, 'загружен')

            orig_file = 'orig_' + file
            os.rename(file, orig_file)
            subprocess.run('{} {} {} {} {}'.format('magick.exe', orig_file, '-quality', '50', file))
            print(file, 'обработан')

            #А теперь загоняем на FTP обработанный файл + оригинальный
            with open(file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + file, file_to_upload)
                print(file, 'успешно загружен на FTP')

            with open(orig_file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + orig_file, file_to_upload)
                print(orig_file, 'успешно загружен на FTP')

            file_size = os.path.getsize(file)
            orig_file_size = os.path.getsize(orig_file)
            print('\n Файл', file, 'занимал', orig_file_size, 'kb, а теперь занимает', file_size, 'kb.')
            print(' Экономим:', orig_file_size - file_size, 'kb\n')

            #Убираем файлы на компьютере
            os.remove(orig_file)
            print(orig_file, 'удален')
            os.remove(file)
            print(file, 'удален\n')

        elif file_extention == 'png':
            print(file, ' = png')
            print('Загружаем файл', file, 'c FTP')
            with open(file, 'wb') as local_file:
                ftp.retrbinary('retr ' + file, local_file.write)
                print(file, 'загружен')

            orig_file = 'orig_' + file
            os.rename(file, orig_file)
            subprocess.run('{} {} {} {} {}'.format('magick.exe', orig_file, '-quality', '91', file))
            print(file, 'обработан')

            #А теперь загоняем на FTP обработанный файл + оригинальный
            with open(file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + file, file_to_upload)
                print(file, 'успешно загружен на FTP')

            with open(orig_file, 'rb') as file_to_upload:
                ftp.storbinary('stor ' + orig_file, file_to_upload)
                print(orig_file, 'успешно загружен на FTP')

            file_size = os.path.getsize(file)
            orig_file_size = os.path.getsize(orig_file)
            print('\n Файл', file, 'занимал', orig_file_size, 'kb, а теперь занимает', file_size, 'kb.')
            print(' Экономим:', orig_file_size - file_size, 'kb\n')

            #Убираем файлы на компьютере
            os.remove(orig_file)
            print(orig_file, 'удален')
            os.remove(file)
            print(file, 'удален\n')
        elif file_extention != 'png' or 'jpg':
            print(file, ' = другое расширение\n')

def index():
    autorization()

index()