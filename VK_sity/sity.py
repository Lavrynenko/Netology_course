import re

#Открываем файл с базой городов
with open('cities_vk.txt', 'r', encoding='utf8') as f:
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