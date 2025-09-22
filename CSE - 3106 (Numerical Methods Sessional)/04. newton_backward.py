x = [1, 2, 3]
y = [5, 10, 15]

s = float(input('Enter search value: '))

h = x[1] - x[0]
n = len(x)
u = (s - x[-1]) / h  # note: x[-1] is the last x value
result = y[-1]       # start from last y
mult = 1

# Backward differences
for i in range(1, n):
    for j in range(n-1, i-1, -1):  # calculate backward differences
        y[j] = y[j] - y[j-1]
    
    mult *= (u + i - 1) / i        # backward factorial part
    result += mult * y[-1]         # always take last updated difference

print(f'For x = {s}, result = {result}')
