import numpy as np
import matplotlib.pyplot as plt

# -----------------------------
# Input Data
# -----------------------------
data = '10110100'
bits = list(map(int, data))
sz = len(bits)

# -----------------------------
# Parameters
# -----------------------------
points = 1000   # points per bit
t = np.linspace(0, 1, points)

# Frequencies
f0, f1 = 5, 10  # FSK: 0 → f0, 1 → f1
fc = 5          # Carrier frequency (ASK/PSK)

# -----------------------------
# Modulated Signals
# -----------------------------
ask_sig, fsk_sig, psk_sig = [], [], []

for bit in bits:
    if bit == 1:
        ask_sig.extend(np.sin(2*np.pi*fc*t))        # ASK = carrier ON
        fsk_sig.extend(np.sin(2*np.pi*f1*t))        # FSK = high freq
        psk_sig.extend(np.sin(2*np.pi*fc*t))        # PSK = carrier normal
    else:
        ask_sig.extend(np.zeros(points))            # ASK = no carrier
        fsk_sig.extend(np.sin(2*np.pi*f0*t))        # FSK = low freq
        psk_sig.extend(np.sin(2*np.pi*fc*t + np.pi)) # PSK = 180° phase shift

# -----------------------------
# Time axis for full signal
# -----------------------------
t = np.linspace(0, sz, sz*points)

# -----------------------------
# Plot Results
# -----------------------------
plt.figure(figsize=(10,7))
titles = [
    'ASK (Amplitude Shift Keying)', 
    'FSK (Frequency Shift Keying)', 
    'PSK (Phase Shift Keying)'
]
signals = [ask_sig, fsk_sig, psk_sig]

for i in range(len(titles)):
    plt.subplot(3, 1, i+1)
    plt.title(titles[i])
    plt.plot(t, signals[i])
    plt.ylim(-1.5, 1.5)
    plt.grid(True)

plt.tight_layout()
plt.show()
