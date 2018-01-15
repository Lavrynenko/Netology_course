'''
Примитивненькая панель управления FTP на основе ftplib и if-elif
'''
import ftplib #Подключили библиотеку

# Авторизация пользователя и указание хоста
ftp_host = str(input('Host? : ')) # Загоняем в переменную адрес хоста
ftp_user = str(input('User? : ')) # Загоняем в переменную пользователя
ftp_password = str(input('Pass? : ')) # Загоняем в переменную пароль

ftp = ftplib.FTP(ftp_host, ftp_user, ftp_password) # создали переменную на базе "Хост+пользователь+пароль"
while True:
    options_for_action = int(input('Что делаем? \n 1. Создать файл\n 2. Создать папку\n 3. Удалить файл \n 4. Удалить'\
                               ' папку \n 5. Перейти в папку\n 6. Получить содержимое директории \n'\
                               ' 7. Создать каталог\n 8. Удалить каталог\n 9. 10. Загрузить файл на FTP\n'\
                               ' 11. Удалить файл\n 12. Получить размер файла\n 13. Сохранить файл С FTP-сервера\n  >> '))

    if options_for_action == 1:
        print('СОЗДАНИЕ ФАЙЛА\n')

    elif options_for_action == 2:
        print('СОЗДАНИЕ ПАПКИ\n')
        name_directory = str(input('Введите имя папки: \n'))
        ftp.mkd(name_directory)
        print('Папка', name_directory, 'создана')
    elif options_for_action == 3:
        print('УДАЛЕНИЕ ФАЙЛА\n')
        list_files = ftp.nlst()
        print('Имеются следующие файлы: \n', list_files)
        delete_files = str(input('Введите имя удаляемого файла: \n'))
        ftp.delete(delete_files)
        print('Файл', delete_files, 'удален!\n')
    elif options_for_action == 4:
        print('УДАЛЕНИЕ ПАПКИ\n')
        list_directory = ftp.dir()
        print('Имеются следующие папки: \n', list_directory)
        delete_directories = str(input('Какую папку удаляем? :\n'))
        ftp.rmd(delete_directories)
        print('Папка', delete_directories, 'удалена!')
    elif options_for_action == 5:
        print('Переход в папку\n')
        directory = ftp.dir()
        print('Список папок: \n', directory)
        directory_enter = str(input('В какую папку заходим? :\n'))
        ftp.cwd(directory_enter)
        print('В папке', directory_enter, 'имеются следующие файлы: \n')
    elif options_for_action == 6:
        print('Просмотр содержимого папки\n')

    #
    #
    # elif options_for_action == 7:
    #
    # elif options_for_action == 8:
    #
    # elif options_for_action == 9:
    #
    # elif options_for_action == 10:
    #
    # elif options_for_action == 11:
    #
    elif options_for_action == 12:
        print('Получить размер файла\n')
        name_file = str(input('Введите имя файла, размер которого нужно получить: \n'))


    elif options_for_action == 13:
        print('Сохранить файл с FTP-сервера\n')