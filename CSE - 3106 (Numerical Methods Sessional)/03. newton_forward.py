x = [1, 2, 3]
y = [5, 10, 15]

s = float(input('Enter search value: '))

h = x[1] - x[0]
u = (s - x[0]) / h
result = y[0]
mult = 1

n = len(x)

for i in range(1, n): # range for max diff
    for j in range(n - i): # update y on each diff
        y[j] = y[j + 1] - y[j]
    
    mult *= (u - i + 1) / i # fact part(before diff)
    result += mult * y[0] 

print(f'For x = {s}, result = {result}')