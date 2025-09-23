import re

def lexical_analyzer(code):
    # One regex handles both //... and /* ... */
    pattern = re.compile(r"//.*|/\*.*?\*/", re.DOTALL)

    # Extract comments
    comments = pattern.findall(code)

    # Remove comments from code
    code_without_comments = pattern.sub("", code)

    print("Tokens (excluding comments):")
    print(code_without_comments.strip())

    print("\nComments:")
    for c in comments:
        print(c)


# -------- Example Run --------
code = """int a = 5; // single-line comment
int b = 10;
/* multi-line
   comment */
int c = a + b;"""

lexical_analyzer(code)
