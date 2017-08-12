import datetime
#У тебя есть секунды, минуты, часы и тебе надо вывести 00:00:00

now = datetime.datetime.now()
print('Выводим текущую дату и время в полном виде:', now)
print('Текущий час: %d' % now.hour)
print('Текущая минута: %d' % now.minute)
print('Текущая секунда: %d' % now.second)
print('И теперь выведем время с двоеточиями: {}:{}:{}'. format(now.hour, now.minute, now.second))