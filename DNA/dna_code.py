dna_code = str(input('Введите последовательность кода ДНК: \n'))
print('Введен ДНК-код: ', dna_code)
dna_code = dna_code.lower()
dna_a = int(0)
dna_g = int(0)
dna_c = int(0)
dna_t = int(0)
for symbol in dna_code:
    if symbol == 'a':
        dna_a = dna_a + 1
    elif symbol == 'g':
        dna_g = dna_g + 1
    elif symbol == 'c':
        dna_c = dna_c + 1
    elif symbol == 't':
        dna_t = dna_t + 1
print('Во введенном коде: \n Аденина: ', dna_a, '\n Гуанина: ', dna_g, '\n Цитозина: ', dna_c, '\n Тимина: ', dna_t)