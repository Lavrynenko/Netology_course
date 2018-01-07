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
        dlina = int(input(' 1. Километры -> мили\n 2. Метры -> Ярды\n 3. Метры -> футы\n 4. Сантиметры -> дюймы\
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
        space = int(input(' 1. Литры -> галлоны\n 2. Литры -> пинты\n'))
        if space == 1:
            value_space = float(input('Сколько литров? : '))
            print(value_space,'литров составляет', round((value_space / 3.785411784), 2), 'галлонов')
        elif space == 2:
            value_space = float(input('Сколько литров? :\n'))
            print(value_space, 'литров составляет', round((value_space / 0.56826125), 2), 'пинт')
    elif convertation == 5:
        speed = float(input(' Сколько километров в час? : '))
        print(speed, 'километров в час составляет ', round((speed / 1.60934), 2), 'миль в час')


elif var == 2:
    print('Конвертация из неметрической в метрическую')
    convertation = int(input('Что считаем: \n 1. Температура\n 2. Вес\n 3. Длина\n 4. Объем\n 5. Скорость\n '))

    # Считаем температуру
    if convertation == 1:
        temperature = int(input(' 1. Фаренгейт -> Цельсий\n 2. Кельвин -> Цельсий\n'))
        if convertation == 1:
            value_temperature = float(input('Сколько градусов по Фаренгейту? :\n'))
            print(value_temperature, 'градусов по Фаренгейту = ', round(((5/9) * value_temperature - 32), 2), ' по Цельсию')
        elif convertation == 2:
            value_temperature = float(input('Сколько градусов по Кельвину? :\n'))
            print(value_temperature, 'градусов по Кельвину = ', value_temperature - 273.15, ' по Цельсию')

    # Считаем вес
    if convertation == 2:
        massa = int(input(' 1. Фунты - килограммы\n 2. Унции - граммы\n'))
        if massa == 1:
            value_massa = float(input('Сколько фунтов? :\n'))
            print(value_massa, 'фунтов составляет', round((value_massa * 0.453592), 2),'килограмм')
        elif massa == 2:
            value_massa = float(input('Сколько унций? :\n'))
            print(value_massa, 'унций составляет', round((value_massa * 28.3), 2),'граммов')

    # Считаем длину
    if convertation == 3:
        dlina = int(input(' 1. Мили -> километры\n 2. Ярды -> метры\n 3. Футы -> метры\n 4. Дюймы -> сантиметры\n'))
        if dlina == 1:
            value_dlina = float(input('Сколько миль? :\n'))
            print(value_dlina, 'миль =', round((value_dlina / 0.621371), 2), 'километров')
        elif dlina == 2:
            value_dlina = float(input('Сколько ярдов? :\n'))
            print(value_dlina, 'ярдов =', round((value_dlina / 0.9144), 2), 'метров')
        elif dlina == 3:
            value_dlina = float(input('Сколько футов? :\n'))
            print(value_dlina, 'футов =', round((value_dlina / 3.28084), 2), 'метров')
        elif dlina == 4:
            value_dlina = float(input('Сколько дюймов? :\n'))
            print(value_dlina, 'дюймов =', round((value_dlina / 0.393701), 2), 'сантиметров')

    # Считаем объем
    if convertation == 4:
        space = int(input(' 1. Галлоны -> литры\n 2. Пинты -> литры\n'))
        if space == 1:
            value_space = float(input('Сколько галлонов? : \n'))
            print(value_space,'галлонов =', round((value_space * 3.785411784), 2), 'литров')
        if space == 2:
            value_space = float(input('Сколько пинт? : \n'))
            print(value_space, 'пинт =', round((value_space * 0.473176473), 2), 'литров')

    # Считаем скорость
    if convertation == 5:
        speed = float(input('Сколько миль в час? :\n'))
        print(speed,'миль в час =', round((speed * 1.60934), 2),'километров')