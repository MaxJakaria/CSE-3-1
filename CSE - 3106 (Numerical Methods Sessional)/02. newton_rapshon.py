from sympy import symbols, diff, lambdify

def newton_rapshon(f, x0):
    # Define variable
    x = symbols('x')

    # Convert lambda to SymPy expression
    f = f(x)

    # Differentiate function
    df = diff(f, x)

    # Convert SymPy expressions to numerical functions
    f = lambdify(x, f, 'numpy')
    df = lambdify(x, df, 'numpy')

    x = x0
    while abs(f(x)) > 0.001:
        if df(x) == 0:
            ValueError("Derivative is zero. Cannot continue.")
        x = x - (f(x) / df(x))

    return x

root = newton_rapshon(lambda x: x**3 - x - 2, 10)
print(f'Newton Rapshon root: {root}')
