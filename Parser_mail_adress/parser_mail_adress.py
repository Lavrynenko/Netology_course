import os
import re
import glob
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
print(directory_for_base)

#print(path)
os.chdir(path) #Переходим по указанному адресу
full_list = []
#Начинаем обработку файлов
for file in glob.glob('*.*'):
    print(file)
    #Открываем файл
    with open(file, 'r', encoding='utf8') as f:
        pars = f.read()
        reg = '[\w.-]+@[A-Za-z-]+\.[\w.]+'
        result = re.findall(reg, pars)
        #print(result)
        result = str(result)
        with open(directory_for_base, 'a', encoding='utf8') as f:
            f.write(result + '\n')

'''
Сделать подсчет количества файлов общих
Сколько файлов обработано, сколько осталось
Удалять проверенные файлы - да\нет

'''