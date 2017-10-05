'''
Сохранялка видео с Инстаграм
https://www.instagram.com/p/BZ29uCuFtu8/?taken-by=dior

<video class="_l6uaz" playsinline="" poster=
"https://instagram.fiev4-1.fna.fbcdn.net/t51.2885-15/e15/22159514_126946101296820_6166316016092577792_n.jpg"
preload="none" src="https://instagram.fiev4-1.fna.fbcdn.net/t50.2886-16/22244005_748945478622689_2292981420408176640_n.mp4"
type="video/mp4"></video>


http([^"]+)mp4
'''
from urllib import request
import urllib.request
import re
import requests
import sys

link_to_video = str(input('Введите ссылку на видео: '))
link_to_video = link_to_video.replace(link_to_video[-1],'')

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link_to_video)
name_video = 'video.mp4'

text_for_parser = response.content
text_for_parser = str(text_for_parser)

regxp =  '(http[^"]+mp4)'
result = []
result = re.findall(regxp, text_for_parser)

print('Начинаем закачку видео... ')
request.urlretrieve(result[0], name_video)
print('Видео загружено')