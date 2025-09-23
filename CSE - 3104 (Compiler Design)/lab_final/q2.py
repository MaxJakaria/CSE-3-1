# Simple Syntax Checker for missing semicolons


def syntax_checker(code):
    lines = code.strip().split("\n")
    for line_no, line in enumerate(lines, start=1):
        line = line.strip()
        # Skip empty lines and print statements
        if not line or line.startswith("print"):
            continue
        # Check if statement ends with ";"
        if not line.endswith(";"):
            print(f"Syntax Error: Missing semicolon at line {line_no}")


# ----------- Example Run -----------
code = """int a = 5
int b = 10;
int c = a + b
print("Value of c is", c);"""

syntax_checker(code)
