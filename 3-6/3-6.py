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
    word = 'mooooooooooooooo'
    flying = 'Я не умею летать'

    def eat(self):
        print('Я ем людей!')


class Goat(Cattles):
    word = 'beeeeeeeeeeeeeeee'
    flying = 'Я не умею летать'

    def eat(self):
        print('Я ем травушку-муравушку!')


class Sheep(Cattles):
    word = 'Sheep says beee?'
    flying = 'Я не умею летать'

    def eat(self):
        print('Я ем марсиан!')


class Pig(Cattles):
    word = 'Pig says hryu =)'
    flying = 'Я не умею летать'

    def eat(self):
        print('Я ем гусей!')


class Duck(Birdies):
    word = 'You can eat the duck'
    flying = 'Я умею летать'

    def eat(self):
        print('Я ем хлеб!')


class Chicken(Birdies):
    word = 'Chicken says kukareku'
    flying = 'Я умею летать'

    def eat(self):
        print('Я ем зерно!')


class Goose(Birdies):
    word = 'Goose says krya-krya'
    flying = 'Я умею летать'

    def eat(self):
        print('Я ем рестлеров!')


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

    user_input_seccond = input('Что будем делать с животным? \n Примеры команд:\n say - что говорит животное \n '
                               'eat - что ест жЫвотное \n fly - умеет ли летать \n')

    if user_input_seccond == 'say':
        animals.say()
    if user_input_seccond == 'eat':
        animals.eat()
    if user_input_seccond == 'fly':
        animals.fly()


main()