import numpy as np
import matplotlib.pyplot as plt

# Bit sequence
data = '001010010'
bits = list(map(int, data))
bit_size = len(bits)

points = 1000
half = points // 2

# Time vector
t = np.linspace(0, len(bits), len(bits) * points)

# Polar NRZ encoding
nrz = []
for bit in bits:
    if bit == 1:
        nrz.extend([1] * points)
    else:
        nrz.extend([-1] * points)

# NRZ-I encoding
nrzi = []
last_level = -1  # Initial level
for bit in bits:
    if bit == 1:
        last_level *= -1  # Invert on 1
    nrzi.extend([last_level] * points)

# RZ encoding
rz = []
for bit in bits:
    if bit == 1:
        rz.extend([1] * half + [0] * half)  # half 1, half 0
    else:
        rz.extend([-1] * half + [0] * half)  # half -1, half 0

# Manchester encoding
manchester = []
for bit in bits:
    if bit == 1:
        manchester.extend([1] * half + [-1] * half)  # half 1, half -1
    else:
        manchester.extend([-1] * half + [1] * half)  # half -1, half 1

# Unipolar encoding
unipolar = []
for bit in bits:
    if bit == 1:
        unipolar.extend([1] * points)  # 1 → +1
    else:
        unipolar.extend([0] * points)  # 0 → 0

# Differential Manchester encoding
diff_manchester = []
last_level = 1  # start with high
for bit in bits:
    if bit == 0:
        # Transition at start
        last_level *= -1
        diff_manchester.extend([last_level] * half)
        last_level *= -1
        diff_manchester.extend([last_level] * half)
    else:  # bit == 1
        # No transition at start, only mid-bit
        diff_manchester.extend([last_level] * half)
        last_level *= -1
        diff_manchester.extend([last_level] * half)

# Plot
plt.figure(figsize=(10, 12))

title = ['Unipolar', 'NRZ-L', 'NRZ-I', 'RZ', 'Manchester', 'Diff Manchester']
encodes = [unipolar, nrz, nrzi, rz, manchester, diff_manchester]

for i in range(len(title)):
    plt.subplot(len(title), 1, i + 1)
    plt.title(title[i])
    plt.plot(t, encodes[i])
    plt.xticks(np.linspace(0, bit_size, bit_size + 1))
    plt.ylim(-1.5, 1.5)
    plt.grid(True)

plt.tight_layout()
plt.show()
