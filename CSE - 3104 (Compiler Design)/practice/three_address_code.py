# Three Address Code (3AC) Generator in Python

# Function to convert infix → postfix
def infix_to_postfix(expr):
    precedence = {'+':1, '-':1, '*':2, '/':2, '^':3}
    output = []
    stack = []
    operators = set(['+', '-', '*', '/', '^'])
    
    for token in expr:
        if token.isalnum():   # operand
            output.append(token)
        elif token in operators:
            while stack and stack[-1] != '(' and precedence[stack[-1]] >= precedence[token]:
                output.append(stack.pop())
            stack.append(token)
        elif token == '(':
            stack.append(token)
        elif token == ')':
            while stack and stack[-1] != '(':
                output.append(stack.pop())
            stack.pop()
    while stack:
        output.append(stack.pop())
    return output


# Function to generate 3-address code from postfix
def generate_TAC(postfix):
    stack = []
    code = []
    temp_count = 1
    
    for token in postfix:
        if token.isalnum():
            stack.append(token)
        else:  # operator
            op2 = stack.pop()
            op1 = stack.pop()
            temp = f"t{temp_count}"
            temp_count += 1
            code.append(f"{temp} = {op1} {token} {op2}")
            stack.append(temp)
    
    return code


# ---------- Example Run ----------
if __name__ == "__main__":
    expr = "(a+b)*c-d"   # you can change input expression here
    print("Input Expression:", expr)

    postfix = infix_to_postfix(expr)
    code = generate_TAC(postfix)

    print("\nThree Address Code:")
    for line in code:
        print(line)