'''
Примитивный телефонный справочник для разбирательства в словарях
'''

import pickle
import json
import os

phone_base = {}

# def add_record():
#     print('Добавляем данные в базу: ')
#     phone_base['Имя'] = str(input('Введите имя: '))
#     phone_base['Фамилия'] = str(input('Введите фамилию: '))
#     phone_base['Телефонный номер'] = str(input('Введите телефонный номер: '))
#     print(phone_base)
#     with open('base.json', 'a') as f:
#         json.dump(phone_base, f)
#
# def search_in_base():
#     print('Ищем пользователя: ')
#     print('Будем искать по: \n имени (1)\n фамилии (2)\n номеру телефона? ')

# add_record()

print('Добавляем данные в базу: ')
phone_base['Имя'] = input('Введите имя: ')
phone_base['Фамилия'] = input('Введите фамилию: ')
#phone_base['Телефонный номер'] = str(input('Введите телефонный номер: '))
print(phone_base)

with open('base.json', 'a') as f:
    json.dump(phone_base, f)
    print('Записали данные... ')

with open('base.json') as f:
    load_file = json.load(f, strict=False)
    print('Читаем данные \n')
    print(load_file)