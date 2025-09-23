# Simple Syntax Checker in Python
# Checks for missing semicolons and very simple rules

def syntax_checker(code_lines):
    errors = []

    for i, line in enumerate(code_lines, start=1):
        line = line.strip()

        # Skip empty lines
        if not line:
            continue

        # Skip single-line comments
        if line.startswith("//"):
            continue

        # Skip multi-line comment start or end
        if line.startswith("/") or line.endswith("/"):
            continue

        # If line starts with print (for simplicity, we allow no semicolon)
        if line.startswith("print"):
            continue

        # Check if the line should end with semicolon
        if not line.endswith(";"):
            errors.append(f"Syntax Error: Missing semicolon at line {i}")

    return errors


# ---------- Example Run ----------
if __name__ == "__main__":
    # Example input (like in your question)
    code = [
        "int a = 5;",
        "int b = 10",
        "int c = a + b",
        'print("Value of c is: ", c);'
    ]

    # Run checker
    errs = syntax_checker(code)

    # Show output
    if errs:
        for e in errs:
            print(e)
    else:
        print("No Syntax Errors Found!")