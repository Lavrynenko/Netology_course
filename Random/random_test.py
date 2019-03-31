import re
import random

final_massive = []

#text_massive = str('Привет |пипл!,народ!,коллеги!,чат!,класс!| А вы |знаете,слышали,вкурсе| - что |случилось,произошло,было,возникло| в нашем городе |позавчера?,вчера?,утром?,вобед?|')
max_text = int(input('Сколько предложений генерировать: '))
min_text = 0

while min_text <= max_text:
    with open('text_for_work.txt', 'r', encoding='utf-8') as text_from_file:
        #text_massive = text_from_file.read())
        text_massive = str(text_from_file.read())
    # #Важно - любое предложение должно начинаться с Заглавной буквы! Иначе не разделим текст на предложения :(
        print(text_massive)
        ok = []
        for text in re.split('\. |! |\? ', text_massive):
            if text[0].isupper():
                print('Имеется предложение:\n', text, '\n')
                #Делим предложение по словам:
                text = text.split(' ')
                for slovo in text:
                    print(slovo)
                    regxp = '\|([^|]+)\|'
                    #slovo = slovo.replace('', '')
                    result = re.findall(regxp, slovo)
                    result = str(result)
                    result = result.replace('[', '').replace(']', '').replace('\'', '|')
                    #ok.append(slovo)
                    if slovo != result:
                        ok.append(slovo)
                    elif slovo == result:
                        print('Нашли! Теперь выбираем вариант слова:\n')
                        slovo = slovo.split(',')
                        random_number = random.randrange(0, len(slovo))
                        slovo = slovo[random_number]
                        slovo = slovo.replace('|', '')
                        print(slovo)
                        ok.append(slovo)

                #print('В итоге имеем:\n', ok)
                print((' '.join(ok)))
                #print(type(ok))
                #ok = str(ok)
                #print(type(ok))
                #print(ok)
                final_massive.append(ok)

        #print('Финал:', ''.join(final_massive))
        with open('text_for_mail.txt', 'a', encoding='utf-8') as f:
            ok = str(ok).replace('[', '').replace('\'', '').replace(']', '').replace(',', '')
            f.write(ok + '\n \n')
    min_text = min_text + 1