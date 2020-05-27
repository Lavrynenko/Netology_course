'''
Простейший парсер слов для названий брендов
Заметил, что многие производители стремяться назвать свои товары в стиле "Про100 качество" и прочее - т.е.
там, где есть возможность заменить буквы, созвучные с названием цифры - это делается.
Написал примитивный парсер, который проверяет каждое слово на буквосочетание "Сто", и если встречае его -
отправляет это слово в отдельный файл

'''

import re

min = 1
regxp = '\сто'
with open('russian.txt', 'r', encoding='utf8') as f:
    for stroke in f:
        one_stroke = f.readline()
        #print(one_stroke)
        answer = re.findall(regxp, one_stroke)
        if answer:
            print(one_stroke, ':', answer)
            with open('100.txt', 'a', encoding='utf8') as file:
                file.write(answer + '\n')
        else:
            None
        min = min + 1
print(min)
