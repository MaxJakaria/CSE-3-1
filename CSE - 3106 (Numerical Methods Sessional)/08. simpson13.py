def simpson_13(f, a, b, n):
    if n % 2 != 0:
        raise ValueError("n must be even")
    h = (b - a) / n
    s = f(a) + f(b)
    for i in range(1, n):
        s += 4*f(a + i*h) if i % 2 != 0 else 2*f(a + i*h)
    return (h/3) * s

result = simpson_13(lambda x: x**2, 0, 1, 10)
print("Simpson 1/3 Result:", result)
