def trapezoidal(f, a, b, n):
    h = (b - a) / n
    s = f(a) + f(b)
    for i in range(1, n):
        s += 2 * f(a + i * h)
    return (h / 2) * s

result = trapezoidal(lambda x: x**2, 0, 1, 10)
print("Trapezoidal Result:", result)
