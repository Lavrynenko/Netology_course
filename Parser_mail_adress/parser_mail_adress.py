import os
import re
import glob
import time
from os import listdir
from os.path import isfile
from os.path import join as joinpath

#Запрашиваем адрес рабочей папки, вводим его в переменную path
path = str(input('Где находятся исходные файлы? : \n'))

#Обрабатываем введенную ссылку для получения стандартного стиля с двумя слешами
regxp = '[\w-]+[\w:]'
result = re.findall(regxp, path) #Разбиваем введенный адрес на составляющие без обратного слеша
path = '\\\\'.join(result) #Добавляем двойной слеш после каждой папки (под формат Python)

file_for = str(input('В какую папку будем сохранять полученные результаты? :\n'))
regxp = '[\w-]+[\w:]'
file_for_result = re.findall(regxp, path)  # Разбиваем введенный адрес на составляющие без обратного слеша
file_for_result = '\\\\'.join(file_for_result)  # Добавляем двойной слеш после каждой папки (под формат Python)

mail_list = str(input('Как назовем файл для результатов? :\n'))
directory_for_base = file_for_result + mail_list
print('Сохраняем все в файл: ', mail_list)

delete_files = int(input('Обработанные файлы удаляем? 1 - да, 2 - нет: \n'))
if delete_files == 1: #Ветка с удалением обработанных файлов
    os.chdir(path)  # Переходим по указанному адресу
    print('Считаем количество файлов для обработки... \n')

    all_files = len([name for name in os.listdir('.') if os.path.isfile(name)])  # Считаем количество файлов
    print('Предстоит обработать файлов: ', all_files)
    time.sleep(3)

    for file in glob.glob('*.*'):
        print(file)
        print('Предстоит обработать файлов: ', all_files)
        with open(file, 'r', encoding='utf8') as f:
            pars = f.read()
            reg = '[\w.-]+@[A-Za-z-]+\.[\w.]+'
            result = re.findall(reg, pars)
            print(result)
            result = str(result)
            result = result.split()
            print('В итоге получили: ', result)
            print(len(result))
            print('А теперь попробуем очистить: \n')
            finallist = []
            for i in result:
                mailadress = i.replace('[', '').replace(']', '').replace('"', '').replace(',', '').replace('\'', '')
                #string.replace("condition1", "").replace("condition2", "text")
                with open(directory_for_base, 'a', encoding='utf8') as f:
                    f.write(mailadress + '\n')
                    all_files = all_files - 1
        os.remove(file)
    clearlist = []
    with open(directory_for_base, 'r', encoding='utf8') as f:
        for line in f:
            mailadress = f.readline()
            clearlist.append(mailadress)
            print('Что получили из файла насыпью без чистки на дубли: ')
            print(clearlist)
            clearlist = list(set(clearlist))
            print('Что получили после чистки на дубли: ')
            print(clearlist)
        for i in clearlist:
            with open('ok_base.txt', 'a', encoding='utf8') as f:
                f.write(i)
    print('Все!')

elif delete_files == 2: #Ветка без удаления обработанных файлов
    # print(path)
    os.chdir(path)  # Переходим по указанному адресу
    print('Считаем количество файлов для обработки... \n')

    all_files = len([name for name in os.listdir('.') if os.path.isfile(name)])  # Считаем количество файлов
    print('Предстоит обработать файлов: ', all_files)
    time.sleep(3)

    for file in glob.glob('*.*'):
        print(file)
        print('Предстоит обработать файлов: ', all_files)
        # Открываем файл
        with open(file, 'r', encoding='utf8') as f:
            pars = f.read()
            reg = '[\w.-]+@[A-Za-z-]+\.[\w.]+'
            result = re.findall(reg, pars)
            # print(result)
            print(result)
            result = str(result)
            result = result.split()
            print('В итоге получили: ', result)
            print(len(result))
            print('А теперь попробуем очистить: \n')
            finallist = []
            for i in result:
                # for_replase = str(i)
                # mailadress = for_replase.replace('"[]', '!')
                #mailadress = i.replace('[', '!')
                mailadress = i.replace('[', '').replace(']', '').replace('"', '').replace(',', '').replace('\'', '')
                #string.replace("condition1", "").replace("condition2", "text")
                with open(directory_for_base, 'a', encoding='utf8') as f:
                    f.write(mailadress + '\n')
        all_files = all_files - 1

    clearlist = []
    with open(directory_for_base, 'r', encoding='utf8') as f:
        for line in f:
            mailadress = f.readline()
            clearlist.append(mailadress)
            print('Что получили из файла насыпью без чистки на дубли: ')
            print(clearlist)
            clearlist = list(set(clearlist))
            print('Что получили после чистки на дубли: ')
            print(clearlist)
        for i in clearlist:
            with open('ok_base.txt', 'a', encoding='utf8') as f:
                f.write(i)
    print('Все!')