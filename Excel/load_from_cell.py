import openpyxl

path = 'тут вводите путь к файлу' #Какой файл читаем?
workbook = openpyxl.load_workbook(path) #Собственно - читаем сам файл
sheets_list = workbook.sheetnames #Получаем список всех листов в книге
sheet_active = workbook[sheets_list[0]] #Делаем активным самый первый лист в книге
from_cell = sheet_active['A2'].value #Получаем значение ячейки А2 (например :) )
print(from_cell) #Выводим это значение на экран