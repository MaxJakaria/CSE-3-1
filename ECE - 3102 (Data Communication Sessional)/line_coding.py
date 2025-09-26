import numpy as np
import matplotlib.pyplot as plt

# Bit sequence
data = '1010010'
bits = list(map(int, data))
bit_size = len(bits)

points = 1000
half = points//2

# Time vector
t = np.linspace(0, len(bits), len(bits)*points)

# Polar NRZ encoding
nrz = []
for bit in bits:
    if bit == 1:
        nrz.extend([1]*points)
    else:
        nrz.extend([-1]*points)

# NRZ-I encoding
nrzi = []
last_level = -1  # Initial level
for bit in bits:
    if bit == 1:
        last_level *= -1  # Invert on 1
    nrzi.extend([last_level]*points)

# RZ encoding
rz = []
for bit in bits:
    if bit == 1:
        rz.extend([1]*half + [0]*half) # half 1, half 0
    else:
        rz.extend([-1]*half + [0]*half) # half -1, half 0

# Manchester encoding
manchester = []
for bit in bits:
    if bit == 1:
        manchester.extend([1]*half + [-1]*half) # half 1, half -1
    else:
        manchester.extend([-1]*half + [1]*half) # half -1, half 1

# Plot
plt.figure(figsize=(10, 8))

title = ['NRZ', 'NRZ-I', 'RZ', 'Manchester']
encodes = [nrz, nrzi, rz, manchester]

for i in range(len(title)):
    plt.subplot(bit_size, 1, i+1)
    plt.title(title[i])
    plt.plot(t, encodes[i])
    plt.xticks(np.linspace(0, bit_size, bit_size+1))
    plt.ylim(-1.5, 1.5)
    plt.grid(True)

plt.tight_layout()
plt.show()

