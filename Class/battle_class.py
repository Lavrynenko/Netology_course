'''
1. Создаем класс "Боец" с атрибутами: уровень жизни максимальный, уровень жизни минимальный
2. Создаем два других класса - боец 1 и боец 2, у каждого их которых имеются атрибут силы удара (генерируется рандомом)
3. Бойцы деруться между собой, нанося друг другу урон
4. Кто первый достигнул нулевого уровня жизни - проиграл
'''
import random
rounds = 1

class Fighter():
    health = 100
    dead_level = 0

class F1(Fighter):
    kick_level = random.randrange(1, 15)

class F2(Fighter):
    kick_level = random.randrange(1, 15)

f1 = F1()
f2 = F2()

print('Изначально:\nБоец 1 имеет здоровья:', Fighter.health, '\nБоец 2 имеет здоровья:', Fighter.health)
while f1.dead_level <= f1.health or f2.dead_level <= f2.health:
    print('\nРаунд:', rounds)
    print('Боец 1:', f2.health, 'жизни\nБоец 2:', f2.health, 'жизни')
    print('Боец 1 бьет Бойца 2 с силой:', f1.kick_level)
    f2.health = f2.health - f1.kick_level
    print('После удара у Бойца 2 осталось здоровья:', f2.health)
    if f2.health <= 0:
        break

    print('Боец 2 бьет Бойца 1 с силой:', f2.kick_level)
    f1.health = f1.health - f2.kick_level
    print('После удара у Бойца 1 осталось здоровья:', f1.health)
    if f1.health <= 0:
        break
    rounds = rounds + 1

if f1.health > f2.health:
    print('Победил Боец 1')
else:
    print('Победил Боец 2')