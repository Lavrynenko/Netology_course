#Рисование Золотой спирали с помощью Turtles

import turtle
import time
turtle_window = turtle.Screen()
turtle.color('red')
turtle.speed(100)
radius = 1
while radius <= 1000:
    turtle.circle(radius, 90)
    radius = radius + radius
time.sleep(15)