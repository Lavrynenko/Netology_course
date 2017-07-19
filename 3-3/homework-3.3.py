import requests
import os.path

def directory_exist():
    result = 'Result'

    if os.path.exists(result) is False:
        os.mkdir('Result')

def get_translations(API, URL, text, from_lang, to_lang):
    params = dict(
        key=API,
        text=text,
        lang='{}-{}'.format(from_lang, to_lang)
    )
    response = requests.get(url=URL, params=params)
    return response

def resp_status(resp):
    if resp.status_code == 200:
        print('Ответ {}. Все готово!'.format(resp.status_code))
    else:
        print('Ответ {}! Возникли ошибки :('.format(resp.status_code))

def main():
    API = 'trnsl.1.1.20141123T002340Z.2611ecba0f781c6c.b69c51344c53ff99342f75f37c25d9b23f7cb69f'
    URL = 'https://translate.yandex.net/api/v1.5/tr.json/translate'

    directory_exist()

    from_lang = input('Что переводим?\n de - немецкий\n es - Испанский\n fr - французский')
    if from_lang == 'de':
        from_lang = 'de'
        lang_file = 'DE.txt'
    elif from_lang == 'es':
        from_lang = 'es'
        lang_file = 'ES.txt'
    elif from_lang == 'fr':
        from_lang = 'fr'
        lang_file = 'FR.txt'

    with open(os.path.join(os.getcwd(), 'Source', lang_file), 'r') as text:
        text = text.read()

    to_lang = input('Введите направление перевода\nru - русский\nen - английский\n')

    resp = get_translations(API, URL, text, from_lang, to_lang)

    response_text = resp.json()

    resp_status(resp)

    with open(os.path.join(os.getcwd(), 'Result', from_lang + '-to-' + to_lang + '.txt'), 'w') as f:
        for i in response_text['text']:
            f.write(i)

main()