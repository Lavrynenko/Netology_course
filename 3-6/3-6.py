class Animal:
    word = None

    def say(self):
        if not self.word:
            raise NotImplementedError
        else:
            print(self.word)


    def fly(self):
        if not self.flying:
            raise NotImplementedError
        else:
            print(self.flying)


class Cattles(Animal):
    pass


class Birdies(Animal):
    pass


class Cattle(Cattles):
    word = 'Му-у-у-у-у!'
    flying = 'Умеют. Но только в мультике Тайна третьей планеты :) '

    def eat(self):
        print('Траву жует... Много')


class Goat(Cattles):
    word = 'М-э-э-э!'
    flying = 'Облом :( '

    def eat(self):
        print('Травку пощипал, и порядок!')


class Sheep(Cattles):
    word = 'Бэ-э-э-э'
    flying = 'Увы :( '

    def eat(self):
        print('Травку на зеленых лугах Шотландии')


class Pig(Cattles):
    word = 'Хрю-хрю'
    flying = 'Если бы свиньи могли летать - это был бы низколетящий бомбардировщик'

    def eat(self):
        print('Фигню какую-то ем. Свинья, фигли')


class Duck(Birdies):
    word = 'Кря-кря'
    flying = 'А как еще на нас охотники охотятся?'

    def eat(self):
        print('В воде фигню всякую ловлю и ем :(')


class Chicken(Birdies):
    word = 'Ку-ка-ре-ку!'
    flying = 'Жизнь придавит - летаю'

    def eat(self):
        print('С зернышка на зернышко перебиваюсь!')


class Goose(Birdies):
    word = 'Кря!'
    flying = 'Умею. Вон, с Нильсом недавно круто потусили'

    def eat(self):
        print('Кого поймаю, того и ем!')


def main():
    animals = {
        'Корова': Cattle(),
        'Коза': Goat(),
        'Овца': Sheep(),
        'Свинья': Pig(),
        'Утка': Duck(),
        'Цыпленок': Chicken(),
        'Гусь': Goose(),
    }

    print ('Ферма 2.0'.center(50))
    print ('У нас живут эти животные: {}'.format([x for x in animals]).center(50))

    user_input = input('Введите название животного:\n')
    animals = animals.get(user_input)
    print(animals)

    user_input_seccond = input('Что будем делать с животным? \n Варианты:\n say - заставить животное говорить \n '
                               'eat - узнать, что оно ест \n fly - узнать, умеет ли оно летать \n')

    if user_input_seccond == 'say':
        animals.say()
    if user_input_seccond == 'eat':
        animals.eat()
    if user_input_seccond == 'fly':
        animals.fly()


main()