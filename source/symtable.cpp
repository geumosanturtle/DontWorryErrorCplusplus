#include "symtable.h"
using namespace std;

int main() {
	symboltable st;
	string check;
	cout << "============ symbol table ==============\n" ;

	if ( st.insert("if","local","keyword",4))
			cout << " - success!" << endl;
	else
			cout << " Error!! Symbol Table Fault!" << endl;

	// insert 'number'
    if (st.insert("number", "global", "variable", 2))
        cout << " -successfully\n";
    else
        cout << "Failed to insert\n";

    // find 'if'
    check = st.find("if");
    if (check != "-1")
        cout << "Identifier Is present\n";
    else
        cout << "Identifier Not Present\n";

    // delete 'if'
    if (st.remove("if"))
        cout << "if Identifier is deleted\n";
    else
        cout << "Failed to delete\n";
	    // modify 'number'
    if (st.modify("number", "global", "variable", 3))
        cout << "Number Identifier updated\n";

    // find and print 'number'
    check = st.find("number");
    if (check != "-1")
        cout << "Identifier Is present\n";
    else
        cout << "Identifier Not Present\n"; 
	return 0;
}
