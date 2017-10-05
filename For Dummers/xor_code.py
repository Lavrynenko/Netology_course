'''

Написать функцию XOR_cipher, принимающая 2 аргумента: строку, которую нужно зашифровать, и ключ шифрования, которая
возвращает строку, зашифрованную путем применения функции XOR (^) над символами строки с ключом. Написать также функцию
XOR_uncipher, которая по зашифрованной строке и ключу восстанавливает исходную строку.

'''
#text = str(input('Введите текст, который нужно зашифровать: '))
#secret_key = str(input('Введите секретное слово-ключ: '))

#symbol = []
symbol = str(input('Symbol: '))
#print(ord(symbol))
#print(symbol)
symbol_list = []
for i in symbol:
    # print('Код символа "', i, '" = ', ord(i))
    # print('Обратная кодировка: ')
    # print('Код символа "', ord(i), '" равен = ', i)
    # print('\n')
    symbol_list.append(ord(i))
print('Введенный текст в виде списка в кодах: ', symbol_list)

#Собираем из списка по кодам
fynal_list = []
for i in symbol_list:
    #print(chr(i))
    fynal_list.append(chr(i))
#print(fynal_list)
print(''.join(fynal_list))

#chr(x) - Возвращает односимвольную строку, код символа которой равен x.
#list.append(x)	Добавляет элемент в конец списка
