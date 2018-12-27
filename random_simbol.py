import random
text_fynal = []

texts = str(input('Введите предложение: \n >>> '))
texts = texts.split()

for text in texts:
    text_list = []
    for simbol in text:
        text_list.append(simbol)

    first_simbol = text_list[0]
    last_simbol = text_list[len(text_list) - 1]

    del text_list[0]
    del text_list[len(text_list) - 1]

    random.shuffle(text_list)
    text_list = ''.join(text_list)
    ok_text = first_simbol + text_list + last_simbol
    text_fynal.append(ok_text)

print(' '.join(text_fynal))