#ifndef _SYMBTABLE_H
#define _SYMBTABLE_H
#include <vector>
#include <cstdint>
#include <iostream>
#include <string>
using namespace std;


class symbol_table_entry {
	private:
		string name;
		string type;
		string scope;
		int32_t lineNo;
		symbol_table_entry *ref = nullptr;
	public:
		symbol_table_entry(const char* _name, const char* _type, const char *_scope, int32_t _lineno, symbol_table_entry *_ref)
				:name(string(_name)),type(string(_type)), scope(_scope), lineNo(_lineno), ref(_ref){}
		friend ostream& operator<< (ostream& os, symbol_table_entry &e){
			os << e.lineNo << ' ' << e.name << ' ' << e.type << ' ' << e.scope;
			if (e.ref)  os << " [" << e.ref -> name << "]";
			return os;
		}
		void setref(symbol_table_entry *newref) { this->ref = newref; }
		void setname (const char *newname) { this->name = string(newname);}
		void settype (const char *newtype) { this->type = string(newtype);}
		void setscope (const char *newscope) { this->scope = string(newscope);}
		void setlineno ( const int32_t newlineno) { this->lineNo = newlineno;}
		symbol_table_entry *getref() { return this->ref;}
		const string& getscope(){ return this->scope; }
	    const string& getname() { return this->name; }	
};

typedef symbol_table_entry* steptr;

class symboltable {
	private:
		vector<steptr> symlist;
	public:
		symboltable() { this->symlist.reserve(100); }
		const int hashfunc(const string &X) {
			int result = 0;
			size_t listlength = symlist.size();
			if (listlength < 100) listlength = 100;

			for ( size_t i = 0; i< X.size(); i++ )
				result += static_cast<int>(X[i]);
			return (result % listlength);
			}
	const bool insert(
		const char *_identifier,
		const char* _type, 
		const char * _scope, 
		const int32_t lineno ) {
			string id = string(_identifier);
			size_t index = hashfunc(id);
			steptr new_entry = new symbol_table_entry(_identifier, _type, _scope, lineno, nullptr);
			if (symlist[index] == nullptr){
				symlist[index] = new_entry;
				cout << "[+]" << id << " inserted";
				return true;
				}
			else {
				steptr start = symlist[index];
				while(start->getref() != nullptr){
					start = start->getref();
					}
				start->setref(new_entry);
				cout << "[+]" << id << " inserted";
				return true;
				}
			return false;
		}

	const string find(const char* id){
			string _id = string(id);
			size_t index = hashfunc(id);
			steptr start = symlist[index];

			if (!start) return "-1";
			while (start){
				   if (start->getname() == _id) {
					    cout << (*start);
						return start->getscope();
				 		}
		   			start = start->getref();
			 	}
			return "-1";
			}
	const bool remove(const char *_id){
		string id = string(_id);
		int index = hashfunc(id); 
    	steptr tmp = symlist[index]; 
    	steptr par = symlist[index]; 
  
    // no identifier is present at that index 
    if (tmp == nullptr) { 
        return false; 
    } 
    // only one identifier is present 
    if (tmp->getname() == id && tmp->getref() == nullptr) { 
        tmp->setref(nullptr); 
        delete tmp; 
        return true; 
    } 
  
    while (tmp->getname() != id && tmp->getref() != nullptr) { 
        par = tmp; 
        tmp = tmp->getref(); 
    } 
    if (tmp->getname() == id && tmp->getref() != nullptr) { 
        par->setref(tmp->getref()); 
        tmp->setref(nullptr); 
        delete tmp; 
        return true; 
    } 
  
    // delete at the end 
    else { 
        par->setref(nullptr); 
        tmp->setref(nullptr); 
        delete tmp; 
        return true; 
    } 
    return false;
	}

	const bool modify(const char *_id, const char *_newscope, const char *_newtype, const int32_t l) {
		string id = string(_id);
		size_t index = hashfunc(id);
		steptr start = symlist[index];

		if (start == nullptr){
			return false;
		}
		while ( start != nullptr ) {
			if ( start->getname() == id ){
				start->setname(_id);
				start->setscope(_newscope);
			    start->settype(_newtype);
			    start->setlineno(l);
				return true;
				}
				start = start->getref();
			}
		return false;
		}		

};




#endif
