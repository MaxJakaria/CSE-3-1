import numpy as np
import matplotlib.pyplot as plt

# -----------------------------
# Parameters
# -----------------------------
points = 1000   
t = np.linspace(0, 1, points)   # Time (1 second)

fm = 5   # Message frequency
fc = 50  # Carrier frequency

# -----------------------------
# Message and Carrier Signals
# -----------------------------
msg_sig = np.sin(2*np.pi*fm*t)
carr_sig = np.sin(2*np.pi*fc*t)

# -----------------------------
# Amplitude Modulation (AM)
# -----------------------------
am_sig = (0.5 + msg_sig) * carr_sig

# ------------------------------------
# Frequency & Phase Modulation (AM)
# fm_sig = sin(2π*fc*t + kf * ​∫m(t)dt)
# pm_sig = sin(2π*fc*t + kp * m(t))
# ------------------------------------
kf, kp = 150, 5
dt = t[0] - t[1]
samePart = 2*np.pi*fc*t

fm_sig = np.sin(samePart + kf * np.cumsum(msg_sig) * dt)
pm_sig = np.sin(samePart + kp * msg_sig)

# -----------------------------
# Plot results
# -----------------------------

titles = [
    'Message Signal',
    'Carrier Signal',
    'Amplitude Modulation (AM)',
    'Frequency Modulation (FM)',
    'Phase Modulation (PM)'
]

signals = [msg_sig, carr_sig, am_sig, fm_sig, pm_sig]

sz = len(titles)

plt.figure(figsize=(10,8))
for i in range(sz):
    plt.subplot(sz, 1, i+1)
    plt.title(titles[i])
    plt.plot(t, signals[i])
    plt.xticks(np.linspace(0, 1, fm*2+1))
    plt.yticks(np.linspace(-1.5, 1.5, 7))
    plt.grid(True)

plt.tight_layout()
plt.show()
