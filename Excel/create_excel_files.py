import openpyxl
import random

quantity_files = int(input('Сколько файлов нужно создать?: '))
start_number_files = 1
column_name_a = 'A'
column_name_b = 'B'
sheet_name = 'Sheet'
goods = ['Компьютер', 'Калькулятор', 'Вентилятор', 'Принтер', 'МФУ', 'Телефон', 'Письменный стол', 'Газета', 'Наушники', 'Сумка', 'Документы', 'Термопаста']

#Начинаем создавать файлы и забивать их информацией
while start_number_files <= quantity_files:
    file_ext = '.xlsx'
    #file_name = start_number
    start_number_files = str(start_number_files)
    file_name = start_number_files + file_ext
    wb = openpyxl.Workbook()
    wb.create_sheet(sheet_name)
    worksheet = wb[sheet_name]
    worksheet['A1'] = 'Наименование товара'
    worksheet['B1'] = 'Стоимость товара'

    start_cell = 2  # начальный номер строки
    for good in goods:
        #Начинаем заполнять ячейки товарами
        start_cell = str(start_cell)
        cell_to_write = column_name_a + start_cell
        worksheet[cell_to_write] = good

        #Начинаем заполнять стоимость товаров
        cell_to_write = column_name_b + start_cell
        worksheet[cell_to_write] = random.randrange(1, 100)

        start_cell = int(start_cell)
        start_cell = start_cell + 1

        wb.save(file_name)

    start_number_files = int(start_number_files)
    start_number_files = start_number_files + 1