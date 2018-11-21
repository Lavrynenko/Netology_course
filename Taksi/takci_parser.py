'''
Парсер работает до страницы, на которой не находит:
<div class="page__content-section typical">

Если находит - парсим

т.е. логика такая:
1. Открываем ссылку
2. Смотрим исходный код страницы - если находим <div class="page__content-section typical"> - парсим информацию в файл
3. Если не находим - конец программы

'''

import requests
from fake_useragent import UserAgent #для генерации поддельного запроса на сервер
from bs4 import BeautifulSoup #Для обработки получаемых данных
import re #Для парсинга информации

#Получаем номер страницы, которую будем обрабатывать
with open('number_page.txt', encoding='utf-8') as f:
    page = f.readline()
    # page = 1 #Начальная страница - потом перепрописать что бы данные из файла брались

while True:
    page = str(page)
    link = 'http://mtdi.mosreg.ru/deyatelnost/celevye-programmy/taksi1/proverka-razresheniya-na-rabotu-taksi?region=ALL&page='
    link_to_page = link + page
    print('Открываем страницу:', link_to_page)

    response = requests.get(link_to_page, headers={'User-Agent': UserAgent().chrome})
    print(response)
    html = requests.get(link_to_page)
    html = response.content
    print('Получен исходный код страницы:\n', html)

    #Начинаем парсить - есть вообще информация на странице или нет? Если да - работаем дальше, если нет - остановка
    html = str(html)
    page_content_regular = 'page__content-section typical'
    page_content_result = re.findall(page_content_regular, html)
    print(page_content_result)
    print(type(page_content_result))
    page_content_result_len = len(page_content_result)
    if page_content_result_len == 0:
        print('Страница без информации, программа остановлена')
        print('Последняя обработанная страница: ', link_to_page)
        with open('log.txt', 'a', encoding='utf-8') as f_log:
            f_log.write('Finish: ' + link_to_page)
        break
    else:
        print('Страница с информацией - работаем далее.')

        #Начинаем парсить информацию:
        '''
        - Дата выдачи
        - Регистрационный номер
        - Перевозчик
        - ОГРН / ОГРНИП
        - ИНН
        - Марка автомобиля
        - Модель автомобиля
        - Номерной знак
        - Год выпуска автомобиля
        - Серия и номер бланка разрешения
        - Полное наименование ЮЛ или ИП
        - Срок действия разрешения
        - Статус
        - Регион выдачи разрешения
        '''
        # Начинаем парсить дату выдачи свидетельства
        # permissionDate_regular = 'permissionDate\W+\d+.\d+.\d+'
        # permissionDate_result = re.findall(permissionDate_regular, html)
        # print(permissionDate_result)
        # permissionDate_list = []
        # for permissionDate in permissionDate_result:
        #     permissionDate = permissionDate.replace('permissionDate":"', '')
        #     print(permissionDate)
        #     permissionDate_list.append(permissionDate)

        # # Начинаем парсить регистрационный номер свидетельства
        # regNumber_regular = 'regNumber\W+\d+'
        # regNumber_result = re.findall(regNumber_regular, html)
        # print(regNumber_result)
        # regNumber_list = []
        # for regNumber in regNumber_result:
        #     regNumber = regNumber.replace('regNumber":', '')
        #     print(regNumber)  # Получили номер разрешения в чистом виде
        #     regNumber_list.append(regNumber)

        # # Начинаем парсить ОГРН/ОГРНИП
        # ogrn_regular = 'ogrn\W+\d+.\d+.\d+'
        # ogrn_result = re.findall(ogrn_regular, html)
        # print(ogrn_result)
        # ogrn_list = []
        # for ogrn in ogrn_result:
        #     ogrn = ogrn.replace('ogrn":"', '')
        #     ogrn_list.append(ogrn)

        # # Начинаем парсить ИНН
        # inn_regular = 'inn\W+\d+.\d+.\d+'
        # inn_result = re.findall(inn_regular, html)
        # print(inn_result)
        # inn_list = []
        # for inn in inn_list:
        #     inn = inn.replace('inn":"', '')
        #     inn_list.append(inn)

        # Начинаем парсить марку автомобиля
        brand_regular = 'brand\":\"([^"]+)\"'
        brand_result = re.findall(brand_regular, html)
        #print(brand_result)
        brand_list = []
        for brand in brand_result:
            brand = brand.replace('brand":"', '').replace('\\u0410', 'А').replace('\\u0430', 'а')\
                .replace('\\u0411', 'Б').replace('\\u0431','б').replace('\\u0412', 'В').replace('\\u0432', 'в')\
                .replace('\\u0413', 'Г').replace('\\u0433', 'г').replace('\\u0414', 'Д').replace('\\u0434', 'д')\
                .replace('\\u0415', 'Е').replace('\\u0435', 'е').replace('\\u0401', 'Ё').replace('\\u0451', 'ё')\
                .replace('\\u0416', 'Ж').replace('\\u0436', 'ж').replace('\\u0417', 'З').replace('\\u0437', 'з')\
                .replace('\\u0418', 'И').replace('\\u0438', 'и').replace('\\u0419', 'Й').replace('\\u0439', 'й')\
                .replace('\\u041a', 'К').replace('\\u043a', 'к').replace('\\u041b', 'Л').replace('\\u043b', 'л')\
                .replace('\\u041c', 'М').replace('\\u043c', 'м').replace('\\u041d', 'Н').replace('\\u043d', 'н')\
                .replace('\\u041e', 'О').replace('\\u043e', 'о').replace('\\u041f', 'П').replace('\\u043f', 'п')\
                .replace('\\u0420', 'Р').replace('\\u0440', 'р').replace('\\u0421', 'С').replace('\\u0441', 'с')\
                .replace('\\u0422', 'Т').replace('\\u0442', 'т').replace('\\u0423', 'У').replace('\\u0443', 'у')\
                .replace('\\u0424', 'Ф').replace('\\u0444', 'ф').replace('\\u0425', 'Х').replace('\\u0445', 'х')\
                .replace('\\u0426', 'Ц').replace('\\u0446', 'ц').replace('\\u0427', 'Ч').replace('\\u0447', 'ч')\
                .replace('\\u0428', 'Ш').replace('\\u0448', 'ш').replace('\\u0429', 'Щ').replace('\\u0449', 'щ')\
                .replace('\\u042a', 'Ъ').replace('\\u044a', 'ъ').replace('\\u042b', 'Ы').replace('\\u044b', 'ы')\
                .replace('\\u042c', 'Ь').replace('\\u044c', 'ь').replace('\\u042d', 'Э').replace('\\u044d', 'э')\
                .replace('\\u042e', 'Ю').replace('\\u044e', 'ю').replace('\\u042f', 'Я').replace('\\u044f', 'я')

            brand = brand.replace('\\', '')
            brand_list.append(brand)

            #print(brand)
            #brand_list.append(brand)

        # Начинаем парсить модель автомобиля
        model_regular = 'model\":\"([^"]+)\"'
        model_result = re.findall(model_regular, html)
        #print(model_result)
        model_list = []
        for model in model_result:
            model = model.replace('colour":"', '').replace('\\u0410', 'А').replace('\\u0430', 'а') \
                .replace('\\u0411', 'Б').replace('\\u0431', 'б').replace('\\u0412', 'В').replace('\\u0432', 'в') \
                .replace('\\u0413', 'Г').replace('\\u0433', 'г').replace('\\u0414', 'Д').replace('\\u0434', 'д') \
                .replace('\\u0415', 'Е').replace('\\u0435', 'е').replace('\\u0401', 'Ё').replace('\\u0451', 'ё') \
                .replace('\\u0416', 'Ж').replace('\\u0436', 'ж').replace('\\u0417', 'З').replace('\\u0437', 'з') \
                .replace('\\u0418', 'И').replace('\\u0438', 'и').replace('\\u0419', 'Й').replace('\\u0439', 'й') \
                .replace('\\u041a', 'К').replace('\\u043a', 'к').replace('\\u041b', 'Л').replace('\\u043b', 'л') \
                .replace('\\u041c', 'М').replace('\\u043c', 'м').replace('\\u041d', 'Н').replace('\\u043d', 'н') \
                .replace('\\u041e', 'О').replace('\\u043e', 'о').replace('\\u041f', 'П').replace('\\u043f', 'п') \
                .replace('\\u0420', 'Р').replace('\\u0440', 'р').replace('\\u0421', 'С').replace('\\u0441', 'с') \
                .replace('\\u0422', 'Т').replace('\\u0442', 'т').replace('\\u0423', 'У').replace('\\u0443', 'у') \
                .replace('\\u0424', 'Ф').replace('\\u0444', 'ф').replace('\\u0425', 'Х').replace('\\u0445', 'х') \
                .replace('\\u0426', 'Ц').replace('\\u0446', 'ц').replace('\\u0427', 'Ч').replace('\\u0447', 'ч') \
                .replace('\\u0428', 'Ш').replace('\\u0448', 'ш').replace('\\u0429', 'Щ').replace('\\u0449', 'щ') \
                .replace('\\u042a', 'Ъ').replace('\\u044a', 'ъ').replace('\\u042b', 'Ы').replace('\\u044b', 'ы') \
                .replace('\\u042c', 'Ь').replace('\\u044c', 'ь').replace('\\u042d', 'Э').replace('\\u044d', 'э') \
                .replace('\\u042e', 'Ю').replace('\\u044e', 'ю').replace('\\u042f', 'Я').replace('\\u044f', 'я')

            model = model.replace('\\', '')
            model_list.append(model)

            #model = model.replace('model":"', '')
            #print(model)
            #model_list.append(model)

        # Начинаем парсить цвет автомобиля
        colour_regular = 'colour\":\"([^"]+)\"'
        colour_result = re.findall(colour_regular, html)
        #print(colour_result)
        colour_list = []
        for colour in colour_result:
            colour = colour.replace('colour":"', '').replace('\\u0410', 'А').replace('\\u0430', 'а')\
                .replace('\\u0411', 'Б').replace('\\u0431','б').replace('\\u0412', 'В').replace('\\u0432', 'в')\
                .replace('\\u0413', 'Г').replace('\\u0433', 'г').replace('\\u0414', 'Д').replace('\\u0434', 'д')\
                .replace('\\u0415', 'Е').replace('\\u0435', 'е').replace('\\u0401', 'Ё').replace('\\u0451', 'ё')\
                .replace('\\u0416', 'Ж').replace('\\u0436', 'ж').replace('\\u0417', 'З').replace('\\u0437', 'з')\
                .replace('\\u0418', 'И').replace('\\u0438', 'и').replace('\\u0419', 'Й').replace('\\u0439', 'й')\
                .replace('\\u041a', 'К').replace('\\u043a', 'к').replace('\\u041b', 'Л').replace('\\u043b', 'л')\
                .replace('\\u041c', 'М').replace('\\u043c', 'м').replace('\\u041d', 'Н').replace('\\u043d', 'н')\
                .replace('\\u041e', 'О').replace('\\u043e', 'о').replace('\\u041f', 'П').replace('\\u043f', 'п')\
                .replace('\\u0420', 'Р').replace('\\u0440', 'р').replace('\\u0421', 'С').replace('\\u0441', 'с')\
                .replace('\\u0422', 'Т').replace('\\u0442', 'т').replace('\\u0423', 'У').replace('\\u0443', 'у')\
                .replace('\\u0424', 'Ф').replace('\\u0444', 'ф').replace('\\u0425', 'Х').replace('\\u0445', 'х')\
                .replace('\\u0426', 'Ц').replace('\\u0446', 'ц').replace('\\u0427', 'Ч').replace('\\u0447', 'ч')\
                .replace('\\u0428', 'Ш').replace('\\u0448', 'ш').replace('\\u0429', 'Щ').replace('\\u0449', 'щ')\
                .replace('\\u042a', 'Ъ').replace('\\u044a', 'ъ').replace('\\u042b', 'Ы').replace('\\u044b', 'ы')\
                .replace('\\u042c', 'Ь').replace('\\u044c', 'ь').replace('\\u042d', 'Э').replace('\\u044d', 'э')\
                .replace('\\u042e', 'Ю').replace('\\u044e', 'ю').replace('\\u042f', 'Я').replace('\\u044f', 'я')

            colour = colour.replace('\\', '')
            colour_list.append(colour)

        # # Начинаем парсить номер автомобиля
        # gosNumber_regular = 'gosNumber\":\"\\\\\\\\\w+\\\\\\\\\w+'
        # gosNumber_result = re.findall(gosNumber_regular, html)
        # print(gosNumber_result)
        # gosNumber_list = []
        # for gosNumber in gosNumber_result:
        #     gosNumber = gosNumber.replace('gosNumber":"', '').replace('\\', '\'')
        #     print(gosNumber)
        #     gosNumber_list.append(gosNumber)

        # Начинаем парсить год выпуска автомобиля
        releaseYear_regular = 'releaseYear\":\"\d+'
        releaseYear_result = re.findall(releaseYear_regular, html)
        #print(releaseYear_result)
        releaseYear_list = []
        for releaseYear in releaseYear_result:
            releaseYear = releaseYear.replace('releaseYear":"', '')
            #print(releaseYear)
            releaseYear_list.append(releaseYear)

        # # Начинаем парсить серию и номер бланка разрешения
        # form_regular = 'form\":\"([^"]+)\"'
        # form_result = re.findall(form_regular, html)
        # print('\n \n \n \n', form_result, '\n \n \n \n')
        # form_list = []
        # for form in form_list:
        #     form = form.replace('form":"', '')
        #     print('Номер бланка:', form)
        #     form_list.append(form)

        # # Полное наименование ЮЛ или ИП
        # name_regular = 'name\":\"([^"]+)\"'
        # name_result = re.findall(name_regular, html)
        # print(name_result)
        # name_list = []
        # for name in name_result:
        #     name = name.replace('name":"', '')
        #     name_list.append(name)

        # # Начинаем парсить срок действия разрешения
        # expireDate_regular = 'expireDate\W+\d+.\d+.\d+'
        # expireDate_result = re.findall(expireDate_regular, html)
        # print(expireDate_result)
        # expireDate_list = []
        # for expireDate in expireDate_list:
        #     expireDate = expireDate.replace('expareDate":"', '')
        #     expireDate_list.append(expireDate)

        # # Начинаем парсить статус разрешения
        # full_status_regular = 'full_status\":\"([^"]+)\"'
        # full_status_result = re.findall(full_status_regular, html)
        # print(full_status_result)
        # full_status_list = []
        # for full_status in full_status_list:
        #     full_status = full_status.replace('full_status":"', '')
        #     full_status_list.append(full_status)

        # # Начинаем парсить регион разрешения
        # regionName_regular = 'regionName\":\"([^"]+)\"'
        # regionName_result = re.findall(regionName_regular, html)
        # print(regionName_result)
        # regionName_list = []
        # for regionName in regionName_result:
        #     regionName = regionName.replace('', '')
        #     print(regionName)
        #     regionName_list.append(regionName)

        # print('Дата выдачи разрешения:\n Количество:', len(permissionDate_list), permissionDate_list)
        # print('Регистрационный номер:\n Количество:', len(regNumber_list), regNumber_list)
        # print('ОГРН:\n Количество:', len(ogrn_list), ogrn_list)
        # print('ИНН:\n Количество:', len(inn_list), inn_list)
        print('Марка автомобиля\n Количество:', len(brand_list), brand_list)
        print('Модель автомобиля:\n Количество:', len(model_list), model_list)
        print('Цвет автомобиля:\n Количество:', len(colour_list), colour_list)
        # print('Гос.номер автомобиля:\n Количество:', len(gosNumber_list), gosNumber_list)
        print('Год выпуска автомобиля:\n Количество:', len(releaseYear_list), releaseYear_list)
        # print('Серия и номер бланка разрешения:\n Количество:', len(form_list), form_list)
        # print('Полное название ИП или ЮЛ:\n Количество:', len(name_list), name_list)
        # print('Срок действия разрешения:\n Количество:', len(expireDate_list), expireDate_list)
        # print('Статус разрешения:\n Количество:', len(full_status_list), full_status_list)
        # print('Регион разрешения:\n Количество:', len(regionName_list), regionName_list)

        list_min = 1
        while list_min <= 10:
            with open('result.txt', 'a', encoding='utf8') as result_file:
                print(brand_list[0], ':', model_list[0], ':', releaseYear_list[0], ':', colour_list[0])
                car = brand_list[0], ':', model_list[0], ':', releaseYear_list[0], ':', colour_list[0]
                car = str(car).replace('(', '').replace(')', '').replace('\'', '').replace(',', '')
                print('Машина:', car)
                result_file.write(car + '\n')
                # for_write_2 = model_list[0] + ':'
                # for_write_3 = releaseYear_list[0] + ':'
                # for_write_4 = colour_list[0] + ':'

                del brand_list[0]
                del model_list[0]
                del releaseYear_list[0]
                del colour_list[0]

            list_min = list_min + 1

    with open('number_page.txt', 'w', encoding='utf8') as f_number_page:
        f_number_page.write(page)

    page = int(page)
    page = page + 1