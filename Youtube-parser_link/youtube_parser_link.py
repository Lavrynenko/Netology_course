"""
Парсит ссылки на видео с определенного канала и сохраняет видео в папку
1. Открываем страницу канала (вводит пользователь)
2. Парсим все ссылки на видео
3. Сохраняем всем видео с канала

http://san-tit.blogspot.com/2017/02/youtube.html

https://www.youtube.com/watch?v=I5ZBr3-3lPc
"""

from pytube import YouTube
from pprint import pprint

link = str(input('Введите ссылку на видео: '))
yt = YouTube(link)

print(yt.get_videos()) #доступные форматы видео
print(yt.filename) #получаем название видео
#
# yt.set_filename('Dancing Scene from Pulp Fiction')
#
# print(yt.filter('flv'))
print(yt.filter('mp4')[-1])
# print(yt.filter(resolution='480p'))
#
#video = yt.get('mp4', '720p')
video = yt.get('mp4', '720p')
#
# print(yt.videos)
#
#video = yt.get('mp4')
#video.download('/download/')
video.download('c:\Users\oleks\Desktop\Git\Netology\Youtube-parser_link\download')