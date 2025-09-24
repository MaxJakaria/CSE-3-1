import re

# -------------------------------
# Lexical Analyzer for C++ (Simple)
# -------------------------------

# Token patterns (regular expressions)
token_patterns = [
    ("NUMBER", r"\d+"),  # Numbers (e.g., 123)
    ("IDENTIFIER", r"[A-Za-z_]\w*"),  # Identifiers (variables, function names)
    ("OPERATOR", r"==|!=|<=|>=|[+\-*/=<>]"),  # Operators (single & double char)
    ("SEMICOLON", r";"),  # Semicolon
    ("LPAREN", r"\("),  # (
    ("RPAREN", r"\)"),  # )
    ("LBRACE", r"\{"),  # {
    ("RBRACE", r"\}"),  # }
    ("SKIP", r"[ \t\n]+"),  # Skip spaces, tabs, newlines
    ("MISMATCH", r"."),  # Any other character (error)
]

# Basic C++ keywords
keywords = {"int", "float", "if", "else", "while", "for", "return"}

# Combine patterns into a single regex
master_pattern = "|".join(f"(?P<{name}>{pattern})" for name, pattern in token_patterns)
# -----------------------------------------------
# parts = []
# for name, pattern in token_patterns:
#     group = "(?P<" + name + ">" + pattern + ")"
#     parts.append(group)
# master_pattern = "|".join(parts)
# -----------------------------------------------


def lexer(source_code):
    """Convert source code into a list of tokens."""
    tokens = []
    for match in re.finditer(master_pattern, source_code):
        kind = match.lastgroup
        value = match.group()

        if kind == "SKIP":
            continue
        if kind == "MISMATCH":
            raise RuntimeError(f"Unexpected character: {value!r}")
        if kind == "IDENTIFIER" and value in keywords:
            kind = "KEYWORD"

        tokens.append((kind, value))
    return tokens



# -------------------------------
# Example usage
# -------------------------------
if __name__ == "__main__":
    code = """
    int main() {
        int x = 10;
        if (x >= 5) {
            x = x + 1;
        }
        return x;
    }
    """

    # Run the lexer
    token_list = lexer(code)

    # Print tokens
    for token in token_list:
        print(token)
