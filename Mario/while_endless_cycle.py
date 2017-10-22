'''
Пример бесконечного цикла, который запрашивает некое число, но не больше введенного.
'''

while True:
  maximum = int(10)
  quantity = int(input('Введите число: '))
  if maximum < quantity:
    print ('Неправильно, повторите! ')
  else:
    print('Ok! ')
    break