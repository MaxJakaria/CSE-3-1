def simpson_38(f, a, b, n):
    if n % 3 != 0:
        raise ValueError("n must be a multiple of 3")
    h = (b - a) / n
    s = f(a) + f(b)
    for i in range(1, n):
        s += 3*f(a + i*h) if i % 3 != 0 else 2*f(a + i*h)
    return (3*h/8) * s

result = simpson_38(lambda x: x**2, 0, 1, 12)
print("Simpson 3/8 Result:", result)
