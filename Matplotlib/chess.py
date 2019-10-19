import matplotlib.pyplot as plt

chessboard = 64
cell = 1
summa = 0
summa_list = []
while cell <= chessboard:
    print(cell, 'клетка:', 2** cell, 'зернышка. Вес риса:', (2** cell) * 0.0186)
    #print('Вес зерна в клетке', cell, 'составляет', round((2** cell)*0.0186, 2), 'грамм')
    summa_list.append(2** cell)
    cell = cell + 1
for cell in summa_list:
    cell = cell + cell
print('Общее количество зерен:', cell)
print('Общий вес зерна составит:', (cell*0.0186)/1000000, 'тонн')

#А теперь - график! :)
plt.title('График роста количества зерна') #Заголовок графика
plt.xlabel('Шахматные клетки') #Легенда оси X
plt.ylabel('Количества зерна в единицах')  #Легенда оси Y
plt.plot(summa_list, color='red', linestyle='solid', label='Динамика роста количества зерен') #Выводим график,
# который состоит из списка summa_list, цвет графика - красный, сплошная линия, метка графика
plt.legend(loc = 'upper left') #Указываем распложение легенды
plt.show() #Выводим все на экран