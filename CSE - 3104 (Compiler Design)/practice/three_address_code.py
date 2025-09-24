# precedence function
def precedence(op):
    if op in '+-':
        return 1
    if op in '*/':
        return 2
    return 0

# infix → postfix
def infix_to_postfix(exp):
    stack = []
    postfix = ""
    for ch in exp:
        if ch.isalnum():
            postfix += ch
        elif ch == '(':
            stack.append(ch)
        elif ch == ')':
            while stack and stack[-1] != '(':
                postfix += stack.pop()
            stack.pop()
        else:
            while stack and precedence(ch) <= precedence(stack[-1]):
                postfix += stack.pop()
            stack.append(ch)
    while stack:
        postfix += stack.pop()
    return postfix

# postfix → TAC
def postfix_to_TAC(postfix):
    stack = []
    temp_count = 1
    tac = []
    for ch in postfix:
        if ch.isalnum():
            stack.append(ch)
        else:
            op1 = stack.pop()
            op2 = stack.pop()
            temp = f"t{temp_count}"
            tac.append(f"{temp} = {op2} {ch} {op1}")
            stack.append(temp)
            temp_count += 1
    return tac

# main
if __name__ == "__main__":
    expr = input("Enter infix expression: ")
    postfix = infix_to_postfix(expr)
    tac = postfix_to_TAC(postfix)

    print("\nPostfix Expression:", postfix)
    print("\nThree Address Code:")
    for line in tac:
        print(line)