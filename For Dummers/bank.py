'''

Пользователь делает вклад в размере a рублей сроком на years лет под 10% годовых (каждый год размер его вклада
увеличивается на 10%. Эти деньги прибавляются к сумме вклада, и на них в следующем году тоже будут проценты).

Написать функцию bank, принимающая аргументы a и years, и возвращающую сумму, которая будет на счету пользователя.
'''
money_start = int(input('Начальная сумма вклада?: '))
term_of_deposit = int(input('На какой срок вклад?: '))
percent = int(input('Какой процент на вклад ежегодно?: '))
i = 1
while i <= term_of_deposit:
    interest_amount = money_start / 100 * percent
    #amount_with_interest = money_start + interest_amount
    money_start = money_start + interest_amount
    print('В', i,'год на вклад в размере', round(money_start, 1),'набежит', round(interest_amount, 1),'денег. Общая сумма после', i, \
          'года составит', round(money_start, 1),'денег')
    i = i + 1
print('Итого будет: ', round(money_start, 1)) #Выводим окончательную сумму