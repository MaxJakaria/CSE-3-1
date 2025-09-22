def EulersModified(f, x, y, h, x_end):
    while x < x_end:
        y += h/2 * (f(x, y) + f(x + h, y + h*f(x,y)))
        x += h
    return y

result = EulersModified(lambda x, y: x + y, 0, 1, 0.1, 0.5)
print(f'Result : {result:.5f}')