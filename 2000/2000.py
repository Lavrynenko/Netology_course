import random

text = []
with open('2000full.txt', 'r', encoding='utf8') as f:
    for stroke in f:
        one_stroke = f.readline()
        print(one_stroke)
        text.append(one_stroke)

random.shuffle(text)
for i in text:
    print(i)
    with open('text_rand.txt', 'a', encoding='utf8') as f:
        f.write(i)