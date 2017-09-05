import re
from pytube import YouTube
from pprint import pprint
import urllib
import urllib.request
from urllib.request import urlopen

#link = 'https://www.youtube.com/watch?v=yrNsvQ4VMKw'
link = 'https://www.youtube.com/watch?v=I5ZBr3-3lPc'
#link_to_save = str('c:\\Users\\oleks\\Downloads\\ ')

save_link = input('Куда сохранять видео?: ')
regxp = '[\w-]+[\w:]'
result = re.findall(regxp, save_link)
final_link = '\\\\'.join(result)

# link = str(input('Введите ссылку на видео: '))
#     save_link = input('Куда сохранять видео?: ')
regxp = '[\w-]+[\w:]'
result = re.findall(regxp, save_link)
final_link = '\\\\'.join(result)
#print('link: ', final_link)
# print('Сохраняем видео в', final_link)
yt = YouTube(link)
format_video = yt.get_videos()
#print('Видео доступно в следующих форматах: \n')
#print(format_video)
format_len = len(format_video)
i = 1
format_list = {}
for formats in format_video:
    #print(i, ':', formats)
    format_list[i] = formats
    i = i + 1

    # distionary = {}
    # print(distionary)
    # distionary['Имя'] = str(input('Введите имя: '))
    # distionary['Фамилия'] = str(input('Введите фамилию: '))
    # distionary['Возраст'] = int(input('Введите возраст: '))
    # print(distionary)

#print('Печатаем словарь целиком: ', format_list)
#print(type(format_list))

#print('Печатаем значения словаря: \n', format_list.items())
#print('Печатаем ключи словаря: \n', format_list.keys())
print('Видео доступно в следующих форматах:\n')

for key in format_list:
    print('%s -> %s' % (key, format_list[key]))

format_for_save = int(input('В каком формате сохраняем? : '))
print(format_for_save)

print(format_list.get(format_for_save))
select = (format_list.get(format_for_save))
print('Пользователь выбрал:', select)
select = str(select)

#А теперь попробуем сохранить все с параметрами

#dict.get(key[, default]) - возвращает значение ключа, но если его нет, не бросает исключение, а возвращает default (по умолчанию None).

# for i in stroka:
#     if i in d.keys():
#         print(d[i], end='')


# items() — возвращает список значений;
# iteriyems() — возвращает итератор;
# keys() — возвращает список ключей;

    #print(yt.get_videos()) #доступные форматы видео
    #print(yt.filename) #получаем название видео
    #format_video = yt.filter()
    #print(format_video)
    #print(yt.filter('mp4')[-1])
#print(yt.filter(select))
    #video = yt.get('mp4', '720p')
#video = yt.get(select)

#Как подставлять выбор из словаря? Разобраться

#Регулярка для парсинка разрешения из выбранного пункта: \(\.(.+)\)

regxp_for_select= '\(\.(.+)\)'
result_select = re.findall(regxp_for_select, select)
#
print('В итоге выбранный формат: ',result_select)
#
# #video = yt.get('mp4')
# result_select = ('', result_select,'')
# # video = yt.get(select)
# video = yt.get('mp4')
# # video.download("'",result_select,"'")
# video.download(select)

    #video.download(final_link)
    #print('Загрузка началась... ')
    #video.download(final_link)

    #print('Загрузка закончена. Файл доступен в папке: ', save_link)

# print(yt.filter('mp4')[-1])
# video = yt.get('mp4', '720p')
# video.download(final_link)
# print('Загрузка началась... ')
# video.download(final_link)

#print('Вывод фильтра', yt.filter('mp4')[-1])
# video = yt.get('mp4', '360p') - нужно и рабочая версия
select_select = str('mp4')
print('Select_select: ',select_select)
select_select = str(result_select)
print('новый Select_Select: ', )

select = str(result_select)
print('Что такое Select: ',result_select)

video = yt.get(select_select, '360p')

# video = yt.get('mp4', '720p')
# # video.download(final_link)
# print('Загрузка началась... ')
# video.download(final_link)

#video = yt.get(result_select) #Тестируем ссылки и переменные
print('Загрузка началась... ')
video.download(final_link)
print('Загрузка закончена. Файл доступен в папке: ', save_link)