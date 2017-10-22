piramide = []
stage = 0
text = str('#')

rl = str(input('Строим пирамиду. \n - Выравнивание по левому краю (вариант 1) - нажмите 1 \n'
               ' - Выравнивание по левому краю (вариант 2) - нажмите 2 \n - По правому краю - нажмите 3 \n'
               ' - По центру - нажмите 4 \n - По центру (вариант 2) - нажмите 5 ?: '))

quantity = int(input('Количество ярусов в пирамиде?: '))

if rl == '1':
    while stage < quantity:
        piramide.append(text)
        print(text.ljust(quantity))
        stage = stage + 1
        text = text + '#'

if rl == '2':
    pyramide = []
    # print(quantity)
    stage = 0
    while stage < quantity:
        lattice = '#'
        pyramide.append(lattice)
        stage = stage + 1
        print(''.join(pyramide))

elif rl == '3':
    while stage < quantity:
        piramide.append(text)
        print(text.rjust(quantity))
        stage = stage + 1
        text = text + '#'

elif rl == '4':
    while stage < quantity:
        piramide.append(text)
        print(text.center(quantity * 2))
        stage = stage + 1
        text = text + '##'

elif rl == '5':
    text = '##'
    while stage < quantity:
        piramide.append(text)
        print(text.center(quantity * 2))
        stage = stage + 1
        text = text + '##'
