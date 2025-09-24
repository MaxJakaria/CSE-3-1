# Simple Syntax Checker in Python
# Checks for missing semicolons and very simple rules

def syntax_checker(code):
    errors = []

    # Split the code into lines
    lines = code.strip().split("\n")

    for i, line in enumerate(lines, start=1):
        line = line.strip()

        # Skip single-line comments
        if line.startswith("//"):
            continue

        # Skip multi-line comment start or end
        if line.startswith("/") or line.endswith("/"):
            continue

        # Skip print statements
        if line.startswith("print"):
            continue

        # Check if line should end with semicolon
        if not line.endswith(";"):
            errors.append(f"Syntax Error: Missing semicolon at line {i}: '{line}'")

    return errors


# ---------- Example Run ----------
if __name__ == "__main__":
    code = """
        int a = 5
        int b = 10;
        int c = a + b
        print("Value of c is", c);
    """

    errs = syntax_checker(code)

    if errs:
        for e in errs:
            print(e)
    else:
        print("No Syntax Errors Found!")