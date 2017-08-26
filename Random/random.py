import random


def random_number():
    start_number = int(input('Введите начальное число: '))
    finish_number = int(input('Введите конечное число: '))
    print('Случайное число в диапазоне от', start_number, 'до', finish_number, ': ',
          random.randrange(start_number, finish_number))
    # random_number = random.randrange(start_number, finish_number)
    # print(random_number)


def genpass():
    serial = []
    digital = int(input('Сколько цифр должно быть в пароле?: '))
    number_table = random.sample('123456789012345678901234567890', digital)
    symbol_table = random.sample('AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz', digital)
    special_table = random.sample('~!@#$%^&*()_+}{":?><', digital)
    # print(''.join(symbol_table))
    # print(''.join(special_table))
    # print(''.join(number_table))
    full_table = random.sample('1234567890AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz~!@#$%^&*()_+}{":?><',
                               digital)
    # serial = serial.extend(symbol_table)
    # serial = serial.extend(special_table)
    # serial = serial.extend(number_table)
    # print(all_table)
    print(''.join(full_table))
    # print(full_table)


# list.append(x)	Добавляет элемент в конец списка
# list.extend(L) Расширяет список list, добавляя в конец все элементы списка L


# special_table = ('AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz')
# symbol_table = ('~!@#$%^&*()_+')


# print('Готовый цифровой пароль: \n')
# print(''.join(serial))

def select():
    var = int(input('Генерируем случайное число (1) или пароль (2) ?'))
    if var == 1:
        random_number()
    elif var == 2:
        genpass()


# var = int(input('1 или 2?'))
# if var == 1:
#   print('1')
# elif var == 2:
#   print('2')


# digital = int(input('Сколько чисел должно быть в пароле?: '))

# serial = []
# serial = random.sample('123456789012345678901234567890', digital)

# print('Готовый цифровой пароль: \n')
# print(''.join(serial))


select()