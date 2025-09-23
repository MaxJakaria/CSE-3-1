# Simple Symbol Table Implementation in Python
# Supports: Insertion, Deletion, Lookup, Display

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


# ----------- Example Demo -----------
if __name__ == "__main__":
    st = SymbolTable()

    # Predefined identifiers (like given in question)
    st.insert("x", "int", "Global")
    st.insert("y", "float", "Global")
    st.insert("func", "void", "Global")
    st.insert("main", "int", "Global")

    st.display()

    # Deletion Example
    st.delete("y")
    st.display()

    # Lookup Example
    st.lookup("func")
    st.lookup("z")  # not exists