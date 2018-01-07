var = int(input('1: Ru - Eng\n2: Eng - Ru\n'))

if var == 1:
    print('Конвертация из метрической в неметрическую')
    convertation = int(input('Что считаем: \n 1. Температура\n 2. Вес\n 3. Длина\n 4. Объем\n 5. Скорость\n '))
    # Считаем температуру
    if convertation == 1:
        temperature = int(input(' 1. Цельсий -> Фаренгейт\n 2. Цельсий -> Кельвин\n'))
        if temperature == 1:
            value_temperature = float(input('Сколько градусов по Цельсию? :\n'))
            print(value_temperature, 'градусов по Цельсию составляют', round((((9/5) * value_temperature +32)), 2),\
            'градусов по Фаренгейту')
        elif temperature == 2:
            value_temperature = float(input('Сколько градусов по Цельсию? :\n'))
            print(value_temperature, 'градусов по Цельсию составляют', round((value_temperature + 273.15), 2),\
            'градусов по Кельвину')

    # Считаем вес
    elif convertation == 2:
        massa = int(input(' 1. Килограммы -> фунты\n 2. Граммы -> унции \n'))
        if massa == 1:
            value_massa = float(input('Сколько килограмм? :\n'))
            print(value_massa, 'килограмм составляют', round((value_massa * 2.20462), 2), 'фунтов')
        elif massa == 2:
            value_massa = float(input('Сколько грамм? :\n'))
            print(value_massa, 'грамм составляют', round((value_massa * 0.035274), 2), 'унций')

    # Считаем длину
    elif convertation == 3:
        dlina == int(input(' 1. Километры -> мили\n 2. Метры -> Ярды\n 3. Метры -> футы\n 4. Сантиметры -> дюймы\
        \n 5. Миллиметры -> дюймы \n'))
        if dlina == 1:
            value_dlina = float(input('Сколько километров? :\n'))
            print(value_dlina, 'километров составляют', round((value_dlina * 1.60934), 2),'миль')
        elif dlina == 2:
            value_dlina = float(input('Сколько метров? :\n'))
            print(value_dlina,'метров составляют', round((value_dlina * 1.09361), 2), 'ярдов')
        elif dlina == 3:
            value_dlina = float(input('Сколько метров? :\n'))
            print(value_dlina,'метров составляют', round((value_dlina / 0.3048), 2), 'футов')
        elif dlina == 4:
            value_dlina = float(input('Сколько сантиметров? :\n'))
            print(value_dlina,'сантиметров составляют', round((value_dlina * 2.5400013716), 2), 'дюймов')
        elif dlina == 5:
            value_dlina = float(input('Сколько милиметров? :\n'))
            print(value_dlina,'миллиметров составляет', round((value_dlina / 0.0393701), 2) ,'дюймов')

    # Считаем объем
    elif convertation == 4:
        space = int(input(' 1.Литры -> галлоны\n 2. Литры -> пинты\n')
        if space == 1:
            value_space = float(input('Сколько литров? :'))
            print(value_space,'литров составляет', round((value_space / 3.785411784), 2), 'галлонов')
        elif value_space == 2:
            value_space = float('Сколько литров? :\n')
            print(value_space, 'литров составляет', round((value_space / 0.56826125), 2), 'пинт')


elif var == 2:
    print('Конвертация из неметрической в метрическую')
    convertation = int(input('Что считаем: \n 1. Температура\n 2. Вес\n 3. Длина\n 4. Объем\n 5. Скорость\n '))
    if convertation == 1:
        convertation == int(input(' 1. Фаренгейт - Цельсий\n 2. Кельвин - Цельсий\n'))
        if convertation == 1:
            farengheith == float(input('Сколько градусов по Фаренгейту? :\n'))
            print(farengheith, 'градусов по Фаренгейту составляют', (5/9) * farengheith - 32, 'градусов по Цельсию')
        elif convertation == 2:
            kelvin = float(input('Сколько градусов по Кельвину? :\n'))
            print(kelvin, 'градусов по Кельвину составляет', kelvin - 273.15, 'градусов по Цельсию')


