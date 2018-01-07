import time

# исходные данные
documents = [
    {"type": "passport", "number": "2207 876234", "name": "Василий Гупкин"},
    {"type": "invoice", "number": "11-2", "name": "Геннадий Покемонов"},
    {"type": "insurance", "number": "10006", "name": "Аристарх Павлов"}
]  # Каталог документов

directories = {
    '1': ['2207 876234', '11-2'],
    '2': ['10006'],
    '3': []}  # Перечень полок, на которых хранятся документы


# Подпрограмма вывода имени владельца по номеру документа - готово
def print_master_documents():
    document_number = str(input('Введите номер документа:'))
    print('Ищем... ')
    for document in documents:
        if document_number == document['number']:
            time.sleep(2)
            print('Нашли:', document_number)
            print(('{0}.{1}').format(document['number'], document['name']))
            print('\n')


# Подпрограмма вывода списка всех документов - готово
def print_all_documents():
    for document in documents:
        document_type = document['type']
        document_number = document['number']
        name = document['name']
        print(document_type, '"', document_number, '"', '"', name, '"')
    print('Вывели все документы\n')


# Подпрограмма определения номера полки по номеру документа - готово
def print_number():
    document_number = str(input('Введите номер документа, который нужно найти:'))
    for directory_keys in directories:
        for directory_values in directories[directory_keys]:
            if (document_number == directory_values):
                print('Документ {0} находится на полке {1}'.format(directory_values, directory_keys))
                print('\n')


# Подпрограмма добавления нового документа в каталог и перечень полок - готово
def add_documents():
    document_number = str(input('Введите номер документа:'))
    document_type = str(input('Введите тип документа:'))
    document_master = str(input('Введите имя владельца документа:'))
    document_shelf = str(input('Введите номер полки, куда будет добавлен документ:'))
    full_add_documents = {'type': document_type, 'number': document_number, 'name': document_master}
    directories[document_shelf].append(document_number)
    documents.append(full_add_documents)
    print('Нужно было добавить', document_type, ', принадлежащий', document_master, 'с номером', document_number,
          'на полку', document_shelf, '. Делаем... \n')
    time.sleep(2)
    print('Документ добавлен\n')
    print(documents)


# Подпрограмма удаления документа из каталога и перечня полок по его номеру - писец
def del_documents():
    del_documents_number = str(input('Введите номер документа, который нужно удалить: '))
    print(
        'Тут, насколько я понимаю - нужно: \n 1. Определить, на какой полке находится нужный документ. 2. Удалить его из documents, а потом из directories. Прошу подсказку... Спасибо!')


# Подпрограмма добавления новой полки в перечень - готово
def add_shelf():
    add_new_shelf = str(input('Добавляем новую полку? Да\Нет: '))
    if add_new_shelf == 'Да':
        shelf_count = str(len(directories) + 1)
        print('Сейчас количество полок: ', len(directories))
        print('Добавляем новую полку №: ', shelf_count)
        directories[shelf_count] = []
        print('Новый список полок выглядит так:\n')
        print(directories)


# Подпрограмма перемещения документа по номеру с текущей полки на целевую - писец
def move_document():
    move_document_number = str(input('Введите номер документа, который нужно переместить:'))
    target_document_shelf = str(input('На какую полку нужно перенести этот документ?:'))
    print(
        'Насколько я понимаю логику - по номеру находим полку, на которой находится документ. После этого создаем документ с номером move_document_number на новой полке, и удаляем его на старой. Но я уже совершенно потерялся, как это сделать... прошу подсказать :) Спасибо!')


def question():
    print('Какую операцию делаем?:\n')
    print(' - Вывод имени владельца по номеру документа: p.\n')
    print(' - Вывод списка всех документов: нажмите l.\n')
    print(' - Вывод номера полки по номеру документа: нажмите s.\n')
    print(' - Добавление нового документа в каталог и перечень полок: нажмите a.\n')
    print(' - Удаление документа из каталога и перечня полок по его номеру: нажмите d.\n')
    print(' - Перемещение документа по номеру с текущей полки на целевую: нажмите m.\n')
    print(' - Добавление новой полки в перечень: нажмите as.\n')
    print('Для выхода нажмите x')
    return


while True:
    question()
    print('>>')
    work = input()
    if (work == 'x'):  # Ветка выхода из программы
        break;
    elif work == 'p':  # Ветка вывода владельца по номеру документа
        print('Выводим владельца по номеру документа')
        print_master_documents()
    elif work == 'l':  # Ветка вывода списка всех документов
        print('Ветка вывода списка всех документов')
        print_all_documents()
    elif work == 's':  # Ветка вывода номера полки по номеру документа
        print('Выводим номер полки по номеру документа')
        print_number()
    elif work == 'a':  # Ветка добавления нового документа в каталог и перечень полок
        print('Добавляем новый документ в каталог и перечень полок')
        add_documents()
    elif work == 'd':  # Ветка удаления документа из каталога и перечня полок по его номеру
        print('Удаление документа из каталога и перечня полок по его номеру')
        del_documents()
    elif work == 'm':  # Ветка перемещения документа по номеру с текущей полки на целевую
        print('Будем пробовать перенести документ по номеру с текущей полки на целевую')
        move_document()
    elif work == 'as':  # Ветка добавления новой полки в перечень
        print('Добавляем новую полку в перечень')
        add_shelf()