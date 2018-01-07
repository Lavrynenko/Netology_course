import re
import random

#Открываем файл с базой городов
with open('vk.txt', 'r', encoding='utf8') as f:
    file = f.read()
    print(file)
    print('Вывод списка городов без цифр: \n')
    regxp = '\s->\s([\D-]+)'
    result = re.findall(regxp, file)

#Создаем цикл, который будет выводить города по-отдельности и записывать в файл
for sity in result:
    print(sity)
    resultfile = open('final.txt', 'a', encoding='utf8')
    resultfile.write(sity)

#Выведем общее количество городов в списке
print('Всего городов: ', len(result))

sity_list = []
f = open('final.txt', 'r', encoding='utf8')
for i in f:
    sity = f.readline()
    sity_list.append(sity)

print('Clear: ', sity_list)
print(len(sity_list))
random.shuffle(sity_list)
print('Sity:\n')
print(sity_list)

'''
list.append(x) - добавить элемент в конец списка


Перемешать список
import random
list = [1,2,3,4,5,6,7]
random.shuffle(list)
print (list) 
'''