import glob
import os.path
from pprint import pprint

def get_a_list():
    migrations = 'Migrations'
    files = glob.glob(os.path.join(migrations, "*.sql"))
    return files

def main():
    all_names_files = get_a_list()
    # while True:
    #     all_results = list()
    #     questions = input("Какой файл ищем?\n >>> ")
    #     questions = questions.lower()
    #     for file in all_names_files:
    #         with open(file, 'r') as f:
    #             line = f.read()
    #             if questions in line:
    #                 all_results.append(file)
    #     all_names_files = all_results
    #     pprint(all_results)
    #     pprint("Всего найдено: {} файлов в all_results".format(len(all_results)))

#Как просили - вроде должно работать
    while True:
        all_results = list()
        questions = input("Введите поисковый запрос\n").lower()
        for file in all_names_files:
            with open(file, 'r') as f:
                line = f.read().lower()
                if questions in line:
                    all_results.append(file)

        if len(all_results) == 0:
            print("К сожалению, ничего не найдено.Поиск начинается заново.")
            main()

main()