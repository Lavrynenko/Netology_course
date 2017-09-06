import re
from pytube import YouTube
from pprint import pprint
import urllib
import urllib.request
from urllib.request import urlopen

link = str(input('Введите ссылку на видео: '))
save_link = input('Куда сохранять видео?: ')
regxp = '[\w-]+[\w:]'
result = re.findall(regxp, save_link) #Разбиваем адрес, куда сохраняем видео на составляющие без обратного слеша
final_link = '\\\\'.join(result) #Добавляем двойной слеш после каждой папки (под формат Python)

yt = YouTube(link)

format_video = yt.get_videos()
format_len = len(format_video)

i = 1
format_list = {}
for formats in format_video:
    format_list[i] = formats
    i = i + 1

print('Видео доступно в следующих форматах:\n')
for key in format_list:
    print('%s -> %s' % (key, format_list[key]))

format_for_save = int(input('В каком формате сохраняем? : '))

select = (format_list.get(format_for_save))
print('Вы выбрали: ', select)
select = str(select)

regxp_for_select = '\(\.(.+)\)' #Парсим формат видео
regxp_for_px = '\w+\d+\wp' #Парсим разрешение видео

result_select = re.findall(regxp_for_select, select)[0]
result_px = re.findall(regxp_for_px, select)[0]
select_select = str('mp4')
select_pixel = str('144p')

select_select = result_select
select_pixel = result_px
video = yt.get(select_select, select_pixel)

print('Загрузка началась... ')
video.download(final_link)
print('Загрузка закончена. Файл доступен в папке: ', save_link)