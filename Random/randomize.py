'''
Программа, которая по выбору может:
- генерировать случайное число в заданном диапазоне
- генерировать пароль заданной длинны (только цифровой, цифры + символы, или цифры + символы + специальные символы
'''

import random

def random_number():
    start_number = int(input('Введите начальное число: '))
    finish_number = int(input('Введите конечное число: '))
    print('Случайное число в диапазоне от', start_number, 'до', finish_number, ': ',
          random.randrange(start_number, finish_number))

def genpass():
    serial = []
    digital = int(input('Сколько цифр должно быть в пароле?: '))
    counter = 1
    symbol = bool(input('Нужно использовать символы в генерации пароля? Да - напишите что-то, Нет - просто кликните \
Enter: '))
    if symbol == True:
        counter = counter + 1
    special_symbol = bool(input('Нужно использовать специальные символы в генерации пароля? Да - напишите что-то, Нет \
- просто кликните Enter: '))
    if special_symbol == True:
        counter = counter + 1
    if counter == 1:
        password = random.sample('123456789012345678901234567890', digital)
        print(''.join(password))
    elif counter == 2:
        password = random.sample('123456789012345678901234567890AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz', \
digital)
        print(''.join(password))
    elif counter == 3:
        password = random.sample('123456789012345678901234567890123456789012345678901234567890AaBbCcDdEeFfGgHhIiJjKkL\
lMmNnOoPpQqRrSsTtUuVvWwXxYyZz~!@#$%^&*()_+}{":?><', digital)
        print(''.join(password))

def main():
    var = int(input('Генерируем случайное число (1) или пароль (2) ? '))
    if var == 1:
        random_number()
    elif var == 2:
        genpass()

main()