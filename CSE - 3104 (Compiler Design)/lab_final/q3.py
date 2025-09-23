# Symbol Table implementation with insert, delete, lookup

class SymbolTable:
    def __init__(self):
        self.table = {}  # dictionary to store identifiers

    # Insert new identifier
    def insert(self, name, dtype, scope="Global"):
        if name in self.table:
            print(f"Error: '{name}' already exists!")
        else:
            self.table[name] = {"type": dtype, "scope": scope}
            print(f"Inserted: {name}")

    # Delete identifier
    def delete(self, name):
        if name in self.table:
            del self.table[name]
            print(f"Deleted: {name}")
        else:
            print(f"Error: '{name}' not found!")

    # Lookup identifier
    def lookup(self, name):
        if name in self.table:
            print("Identifier found in Symbol Table:")
            print(f"Name: {name}, Type: {self.table[name]['type']}, Scope: {self.table[name]['scope']}")
        else:
            print(f"Error: '{name}' not found!")

    # Display the whole table
    def display(self):
        print("\n--- Symbol Table ---")
        print("Name\tType\tScope")
        for name, info in self.table.items():
            print(f"{name}\t{info['type']}\t{info['scope']}")
        print("--------------------\n")


# ----------- Example Run -----------
st = SymbolTable()

st.insert("a", "int", "global")
st.insert("b", "float", "local")
st.insert("sum", "function", "global")

st.display()

st.lookup("a")
st.delete("b")
st.display()
