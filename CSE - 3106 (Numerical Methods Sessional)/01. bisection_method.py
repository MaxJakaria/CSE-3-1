def bisection(f, a, b):
    if f(a) * f(b) > 0:
        raise ValueError("The signs of f(a) and f(b) must be different.")
        
    c = (a + b) / 2
    
    while abs(f(c)) > 0.0001:
        c = (a + b) / 2

        if f(a) * f(c) < 0:
            b = c
        else:
            a = c
    return c

root = bisection(lambda x: x**3 - x - 2, 1, 2)
print("Bisection Root:", root)

