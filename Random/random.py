import random

def random_number():
  start_number = int(input('Введите начальное число: '))
  finish_number = int(input('Введите конечное число: '))
  print('Случайное число в диапазоне от', start_number, 'до', finish_number,': ', random.randrange(start_number, finish_number))
  # random_number = random.randrange(start_number, finish_number)
  # print(random_number)

def genpass():
  digital = int(input('Сколько цифр должно быть в пароле?: '))
  key = str(input('Использовать символы для генерации пароля? (Y/n): '))
  key = key.lower()
  special_key = str(input('Использовать специальные символы для генерации пароля? (Y/n): '))
  special_key = special_key.lower()
  number_table = random.simple('1234567890', digital)
  print(number_table)


digital = int(input('Сколько чисел должно быть в пароле?: '))

serial = []
serial = random.sample('123456789012345678901234567890', digital)
print('Готовый цифровой пароль: \n')
print(''.join(serial))


genpass()