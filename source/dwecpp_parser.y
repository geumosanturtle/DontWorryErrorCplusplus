%{
	#include <iostream>
	#include <cctype>
	#include <cstdio>
	#include <vector>
	#include "symtable.h"
	using namespace std;	
	int yyerror(const char *);
	int yylex();
	vector<symboltable*> sym_tbl;
	symboltable global;
	sym_tbl.push_back(&global);
%}
%union{
	char* sval;
	int ival;
}
%token <ival> INTEGER <sval> STRING ID COUT ENDL CIN
%token SEMICOLON COMMA
%token DOT ASSIGN PAS MAS TIMESAS DIVAS MODAS SIZE
%token PLUS MINUS DIV MOD TIMES INJECT EXTRACT EQUAL NEQ LEQ GEQ LESS GREAT LOAND LOOR LONOT
%token PLUSPLUS MINUSMINUS 
%token BOOL Q_CLASS 
%token ELSE 
%token FALSE Int String Intarr Stringarr Intlist Stringlist IF
%token PRIVATE PUBLIC RET COLON
%token THIS
%token TRUE 
%token Void WHILE
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
			  | Class
			  ;
/* Function and External Definition of Methods for Classes */

Function	  : Type ID LPAR FormalList RPAR LBR StatementList RBR
			  ;


/* Argument and Mutiple Variables */
FormalList 		: Type ID FormalRest
			 	|
				;

FormalRest		: COMMA Type ID FormalRest
				|
				;

/* Type Elements */
Type		  : Int 
	  		  | String 
			  | Intarr 
		  	  | Stringarr 
			  | Intlist 
			  | Stringlist 
			  | ClassName
			  | Void
			  ;

Class		  : Q_CLASS ClassName LBR ClassElementList RBR
		 	  ;

ClassName	  : ID
			  ;

ACCESS		  : PRIVATE 
		  	  | PUBLIC 
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
int main() { yyparse(); return 0;}
int yyerror(const char *msg){ cout << msg << endl; return -1;}


