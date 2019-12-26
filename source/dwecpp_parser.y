%{
	#include <iostream>
	#include <cctype>
	#include <cstdint>
	#include <cstdio>
	#include <vector>
	#include <algorithm>
	#include "symtable.h"
	using namespace std;	
	int yyerror(const char *);
	int yylex();
	extern int lineno;
	vector<symboltable*> sym_tbl;
	symboltable *global = new symboltable;
	symboltable *current_scope = global;
	vector<short> scopeidx;
    vector<_type> tmp;
	bool is_private;

%}
%union{
	char* sval;
	int ival;
	short tval;
	class symboltable *symval;
	class symbol_table_entry *steval;
	class _type *tcval;
}
%type <symval> Function 
%type <symval> Class
%type <strval> Statement 
%type <strval> StatementList
%type <strval> Decl
%type <strval> DeclList 
%type <sval> ClassName
%type <tval> Type 
%type <tcval> FormalList
%token <ival> INTEGER <sval> STRING 
%token <sval> ID 
%token COUT ENDL CIN
%token SEMICOLON COMMA
%token DOT ASSIGN PAS MAS TIMESAS DIVAS MODAS SIZE
%token PLUS MINUS DIV MOD TIMES INJECT EXTRACT EQUAL NEQ LEQ GEQ LESS GREAT LOAND LOOR LONOT
%token PLUSPLUS MINUSMINUS 
%token BOOL Q_CLASS 
%token ELSE 
%token FALSE <tval>Int String Intarr Stringarr Intlist Stringlist IF
%token PRIVATE PUBLIC RET COLON
%token THIS
%token TRUE 
%token <tval> Void 
%token WHILE
%token LBR RBR 
%token LPAR RPAR

%nonassoc NONE_ELSE_IF


%right ASSIGN PAS MAS DIVAS MODAS TIMESAS
%left LOOR
%left LOAND
%left EQUAL NEQ
%left GEQ LESS GREAT LEQ
%left PLUS MINUS
%left TIMES DIV MOD 
%right LONOT
%left LPAR RPAR
%right UMINUS UPLUS

%start Program

%%

Program : ProcedureList
		 ;

ProcedureList : DeclList
			  ;

DeclList      : DeclStatement DeclList
			  | Function DeclList
			  |
			  ;

Decl		  : Type ID 
				{ 	_type t;
					if (is_private) t = _type($1,PRIVATE); 
					else t = _type($1);
					const char * scopename = nullptr;
					if (current_scope != global) scopename = "local";
					else scopename = "global";
					current_scope->insert($2, t._typename().c_str(), scopename, lineno);
					cout << " : Included in Symbol table." << endl;
				} 
			  | Class
			  ;
/* Function and External Definition of Methods for Classes */

Function	  : Type ID LPAR FormalList RPAR LBR StatementList RBR	
		 		{ $$ = new symboltable;
				  symboltable* p = $$, *s_tmp = current_scope;
				  size_t _argc = tmp.size();
				  for (size_t i = 0; i< _argc; i++){
					$4[i] = tmp[i];
				  }
				  _function ft;
				  if(is_private ) ft = _function(PRIVATE, $1, _argc, $4); 
				  else ft = _function(PUBLIC,$1, _argc, $4); 
				  const char * scopename = nullptr;
				  if (current_scope != global) scopename = "local";
				  else scopename = "global";
				  current_scope->insert($2,ft._typename().c_str(), scopename,lineno);
				  current_scope = p;
				  cout << " :  Detected... at " << lineno << "and Included at Symbol table." << endl;
				  current_scope = s_tmp;  
				}
			  ;


/* Argument and Mutiple Variables */
FormalList 		: Type ID FormalRest 
			 	  {
					 _type t($1);
					 tmp.push_back(t);
					 current_scope->insert($2,t._typename().c_str(), "local", lineno);
					 $$ = new _type[tmp.size()];
				  }
			 	| 
				;

FormalRest		: COMMA Type ID FormalRest
				  {
					 _type t($2);
					tmp.push_back(t);
					current_scope->insert($3,t._typename().c_str(), "local", lineno);
				  } 
				|
				;

/* Type Elements */
Type		  : Int 	{$$ = $1;} 
	  		  | String  {$$ = $1;}
			  | Intarr  {$$ = $1;}
		  	  | Stringarr {$$ = $1;}
			  | Intlist {$$ = $1;}
			  | Stringlist  {$$ = $1;}
			  | ClassName {$$= 0;}
			  | Void {$$=$1;}
			  ;

Class		  : Q_CLASS ClassName LBR ClassElementList RBR  
		 		{ $$ = new symboltable;
				  symboltable* p = $$; 
				  current_scope = p;
				  global->insert($2,"class", "global",lineno);
				  cout << " :  Detected... at " << lineno << "and Included at Symbol table." << endl; 
				  sym_tbl.push_back(p);
				  current_scope = global; 
				}
		 	  ;

ClassName	  : ID  {$$ = $1; cout << $1 << endl;} 
			
			  ;

ACCESS		  : PRIVATE  { is_private = true; } 
		  	  | PUBLIC  {is_private = false; }
			  ;

/* Field and Method Elements */
ClassElement  : ACCESS COLON DeclList
			  ;

ClassElementList : ClassElement ClassElementList
				 |
				 ;

/* Statemant */

StatementList : Statement StatementList
			  | 
			  ;

Statement	  : DeclStatement
			  | Exp SEMICOLON
			  | IF LPAR Exp RPAR LBR StatementList RBR %prec NONE_ELSE_IF
			  | IF LPAR Exp RPAR LBR StatementList RBR ELSE LBR StatementList RBR 
		 	  | WHILE LPAR Exp RPAR LBR StatementList RBR
		  	  |	COUT INJECT Exp INJECT ENDL SEMICOLON
			  |	CIN EXTRACT Exp SEMICOLON
			  | RET Exp SEMICOLON
			  | ClassName DOT ID LPAR ExpList RPAR SEMICOLON
			  | SEMICOLON	
			  ;

DeclStatement : Decl SEMICOLON 
			  ;

/* Evaluate Expression */

ExpList 	  : Exp ExpRest
		   	  |
			  ;

ExpRest		  : COMMA Exp ExpRest
		  	  |
			  ; 


BOOLEAN 	  : TRUE
		 	  | FALSE
			  ;

Exp			  : Exp PLUS Exp | Exp MINUS Exp | Exp TIMES Exp
			  | Exp DIV Exp
			  | Exp MOD Exp
			  | Exp EQUAL Exp
 			  | Exp NEQ Exp
			  | Exp LESS Exp
		      | Exp GREAT Exp
			  | Exp LEQ Exp
 			  | Exp GEQ Exp
		      | Exp LOAND Exp
			  | Exp LOOR Exp
			  | LONOT Exp
			  | MINUS Exp %prec UMINUS
/*		 	  | PLUSPLUS Exp
			  | Exp PLUSPLUS
			  | MINUSMINUS Exp
			  | Exp MINUSMINUS */  
			  | Exp PAS Exp
			  | Exp MAS Exp
			  | Exp TIMESAS Exp
			  | Exp DIVAS Exp
			  | Exp MODAS Exp 
			  | Exp ASSIGN Exp
			  | LPAR Exp RPAR
			  | BOOLEAN
		  	  | INTEGER
			  | STRING
			  | ID
			  |
			  ;


%%
int main() { sym_tbl.push_back(global); yyparse(); return 0;}
int yyerror(const char *msg){ cout << msg << endl; return -1;}


