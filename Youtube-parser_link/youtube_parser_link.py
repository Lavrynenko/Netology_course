"""
Парсит ссылки на видео с определенного канала и сохраняет видео в папку
В перспективе - будет сохранять все видео с требуемого канала на Youtube
"""
import re
from pytube import YouTube
from pprint import pprint
import urllib
import urllib.request
from urllib.request import urlopen

def select():
    selector = int(input('Сохраняем одно видео (1) или все видео с канала (2): '))
    if selector == 1:
        save_video()
    elif selector == 2:
        print('Сорян, пока в стадии доработки')
        #save_channel()

def save_channel():
    print('Сохраняем все видео с канала. Пока функционал в доработке :)')

def save_video():
    link = str(input('Введите ссылку на видео: '))
    save_link = input('Куда сохранять видео?: ')
    regxp = '[\w-]+[\w:]'
    result = re.findall(regxp, save_link)
    final_link = '\\\\'.join(result)
    #print('link: ', final_link)
    # print('Сохраняем видео в', final_link)
    yt = YouTube(link)
    format_video = yt.get_videos()
    print('Видео доступно в следующих форматах: \n')
    print(format_video)
    format_len = len(format_video)
    i = 1
    #format_list = {}
    for formats in format_video:
        print(i, ':', formats)
        i = i + 1
    #print(yt.get_videos()) #доступные форматы видео
    #print(yt.filename) #получаем название видео
    #format_video = yt.filter()
    #print(format_video)
    #print(yt.filter('mp4')[-1])
    #video = yt.get('mp4', '720p')
    # video.download(final_link)
    #print('Загрузка началась... ')
    #video.download(final_link)

    #print('Загрузка закончена. Файл доступен в папке: ', save_link)

select()

#list_numbers = [['1', '1'],['1', '2'],['2', '3']]
