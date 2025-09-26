# Hamming Code (7,4) – Encode, Detect & Correct

def hamming_encode(data):
    d = list(map(int, data))
    code = ['p1', 'p2', d[0], 'p3', d[1], d[2], d[3]]
    # Parity bits
    code[0] = code[2]^code[4]^code[6]
    code[1] = code[2]^code[5]^code[6]
    code[3] = code[4]^code[5]^code[6]
    return code

def hamming_detect_correct(code):
    p1 = code[0]^code[2]^code[4]^code[6]
    p2 = code[1]^code[2]^code[5]^code[6]
    p3 = code[3]^code[4]^code[5]^code[6]
    error_pos = p1*1 + p2*2 + p3*4
    if error_pos:
        print(f"Error detected at position: {error_pos}")
        code[error_pos-1] ^= 1
        print("Error corrected.")
    else:
        print("No error detected.")
    return code

# Example
data = "1011"
encoded = hamming_encode(data)
print("Original data:", data)
print("Encoded Hamming Code:", encoded)

# Introduce an error
received = encoded.copy()
received[4] ^= 1  # flip 5th bit
print("Received with error:", received)

# Detect & Correct
corrected = hamming_detect_correct(received)
print("Corrected Code:", corrected)
