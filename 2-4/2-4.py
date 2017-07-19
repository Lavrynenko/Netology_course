import glob
import os.path
from pprint import pprint

def get_a_list():
    migrations = 'Migrations'
    files = glob.glob(os.path.join(migrations, "*.sql"))
    return files

def main():
    all_names_files = get_a_list()
    while True:
        all_results = list()
        questions = input("Введите поисковый запрос: ").lower()
        for file in all_names_files:
            with open(file, 'r') as f:
                line = f.read().lower()
                if questions in line:
                    all_results.append(file)

        all_names_files = all_results

        if len(all_results) == 0:  # если после цикла получаем нуль, запускаем функцию заново
            print("К сожалению, ничего не найдено.Поиск начинается заново.")
            main()
        else:
            pprint(all_results)
            pprint("Всего найдено: {} файлов в all_results".format(len(all_results)))

main()