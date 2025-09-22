def rk4(f, x0, y0, h, x_end):
    x, y = x0, y0

    while x < x_end:
        k1 = h * f(x, y)
        k2 = h * f(x + h/2, y + k1/2)
        k3 = h * f(x + h/2, y + k2/2)
        k4 = h * f(x + h, y + k3)
        y = y + 1/6 * (k1 + k2 + k3 + k4)
        x += h
        
    return y

result = rk4(lambda x, y: x + y, 0, 1, 0.1, 0.5)
print(f'Result: {result:.5f}')