file = 'test.html'
with open(file, 'r', encoding='utf8') as f:
    for stroke in f:
        stroke = stroke.replace('<', '&lt;').replace('>', '&gt;')
        #print(stroke)
        with open('new.html', 'a', encoding='utf8') as f:
            f.write(stroke)
print('Все готово!')