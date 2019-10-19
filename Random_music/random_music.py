import glob
import os
import re
import random
from shutil import copyfile
import time

path = str(input('Где находится вся музыка? : \n'))

#Обрабатываем введенную ссылку для получения стандартного стиля с двумя слешами
regxp = '[\w-]+[\w:]'
path = re.findall(regxp, path) #Разбиваем введенный адрес на составляющие без обратного слеша
path = '\\\\'.join(path) #Добавляем двойной слеш после каждой папки (под формат Python)

result_path = str(input('В какую папку будем сохранять полученные результаты? :\n'))
regxp = '[\w-]+[\w:]'
result_path = re.findall(regxp, result_path)  # Разбиваем введенный адрес на составляющие без обратного слеша
result_path = '\\\\'.join(result_path)  # Добавляем двойной слеш после каждой папки (под формат Python)

os.chdir(result_path)
print('В конечной папке имеется файлов: ', len(glob.glob('*.mp3')))
deleting_all_mp3 = int(input('Очистить конечную папку (1 - да|2 - нет)?: '))
if deleting_all_mp3 == 1:
    os.chdir(result_path)
    delete_list = glob.glob('*.mp3')
    for file in delete_list:
        os.remove(file)
    print('Конечная папка очищена... \n')

    os.chdir(path)
    all_mp3 = glob.glob('*.mp3')
    quantity = int(input('Сколько песен нужно отобрать?: '))
    print('Обрабатываем папку:', path)
    print('Сохраняем в папку:', result_path)
    print('Берем песен:', quantity)
    print('Имеется песен:', len(all_mp3))
    if quantity > len(all_mp3):
        print('Песен меньше, чем нужно выбрать :( ')
    else:
        print('Работаем! \n')
        start_quantity = 1
        while start_quantity <= quantity:
            track_number = random.randrange(1, len(all_mp3))
            print('Выбрана песня:', track_number)
            track = all_mp3[track_number]
            print(track)
            file_for_copy = path + '\\' + track
            file_to_copy = result_path + '\\' + track
            copyfile(file_for_copy, file_to_copy)
            time.sleep(2)
            print('Песня скопирована... \n \n')
            start_quantity = start_quantity + 1

elif deleting_all_mp3 == 2:
    os.chdir(path)
    all_mp3 = glob.glob('*.mp3')
    quantity = int(input('Сколько песен нужно отобрать?: '))
    print('Обрабатываем папку:', path)
    print('Сохраняем в папку:', result_path)
    print('Берем песен:', quantity)
    print('Имеется песен:', len(all_mp3))
    if quantity > len(all_mp3):
        print('Песен меньше, чем нужно выбрать :( ')
    else:
        print('Работаем! \n')
        start_quantity = 1
        while start_quantity <= quantity:
            track_number = random.randrange(1, len(all_mp3))
            print('Выбрана песня:', track_number)
            track = all_mp3[track_number]
            print(track)
            file_for_copy = path + '\\' + track
            file_to_copy = result_path + '\\' + track
            copyfile(file_for_copy, file_to_copy)
            time.sleep(2)
            print('Песня скопирована... \n \n')
            start_quantity = start_quantity + 1

print('Все! :)')