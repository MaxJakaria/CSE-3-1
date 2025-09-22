x, y, z = 0.0, 0.0, 0.0

while True:
    x_new = (7 + y) / 2          # From 2x - y = 7      → x = (7 + y)/2
    y_new = (1 + x + z) / 2      # From -x + 2y - z = 1 → y = (1 + x + z)/2
    z_new = (1 + y) / 2          # From -y + 2z = 1     → z = (1 + y)/2

    # Maximum change
    e = max(abs(x_new - x), abs(y_new - y), abs(z_new - z))

    # Update old values
    x, y, z = x_new, y_new, z_new

    if e < 0.001:
        break

print(f"X: {x:.5f}, Y: {y:.5f}, Z: {z:.5f}")
