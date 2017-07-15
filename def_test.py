def sum(x, y):
    z = x + y
    return (z)

def min(q, w, e):
    r = q - w - e
    return (r)

print ('Выводим сумму: ')
x = int(input('x: '))
y = int(input('y: '))
print (sum (x, y))

print ('Выводим разность:')
q = int(input('q: '))
w = int(input('w: '))
e = int(input('e: '))

print (min(q, w, e))