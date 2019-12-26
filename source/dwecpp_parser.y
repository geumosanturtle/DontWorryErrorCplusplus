%{
	#include <iostream>
	//#include <ctype>
	#include <cstdio>
	int yyerror(const char *);
	int yylex();
%}
%union{
	char* sval;
	int ival;
}
%token <ival> INTEGER <sval> STRING ID COUT ENDL CIN
%token SEMICOLON COMMA
%token COLONCOLON DOT ASSIGN PAS MAS TIMESAS DIVAS MODAS SIZE
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

%right UMINUS UPLUS
%start Program
/*
%%
Program		 :	FunctionList MainFunction
			 ;

FunctionList :	DeclList 
			 ;

MainFunction :	Int "main" LPAR Void RPAR LBR StatementList RBR

Decl	:	Type ID SEMICOLON
	 	|	Class SEMICOLON
		|	Function
	 	;

DeclList	:	Decl DeclList
		 	|
			;

Function	:	Type ID LPAR FormalList RPAR LBR StatementList RBR
			|	Method_External
			;

Method_External : Type ClassName COLONCOLON ID LPAR FormalList RPAR LBR StatementList RBR
				;

MethodDecl	:	Function MethodDecl
			|
			;

FormalList	:	
		    | 	Type ID FormalRest
			;

FormalRest	:	COMMA Type ID FormalRest	
			|
			;

StatementList	:	Statement StatementList
				|	{printf("asd");}
				;

Statement	:	Decl
	|	IF LPAR Exp RPAR LBR StatementList RBR
	|	WHILE LPAR Exp RPAR LBR StatementList RBR
	|	"cout" INJECT ID INJECT "endl" SEMICOLON
	|	"cin" EXTRACT ID SEMICOLON
	|	Exp SEMICOLON
	| 	RET Exp SEMICOLON
	;
 Class	:	Q_CLASS ClassName LBR ClassStatement RBR
	;
ClassDecl 	: 
		|	Decl ClassDecl 
		;
ClassName	:	ID
	;

ClassStatement	:	Access ClassDecl ClassStatement
	|	Access MethodDecl ClassStatement
	|
	;
	
Exp	:	INTEGER Op	{printf("\nExe1\n");}
	|	INTEGER Op1	{printf("\nExe2\n");}
	|	BOOL Op1	{printf("\nExe3\n");}
	|	LONOT Exp	{printf("\nExe4\n");}
	|	ID Op2		{printf("\nExe5\n");}
	|	THIS IDList	{printf("\nExe6\n");}
	|	ID IDList		{printf("\nExe7\n");}
	|	LPAR Exp RPAR	{printf("\nExe8\n");}
	|	Sign		{printf("\nExe9\n");}
	|	INTEGER		{printf("\nExe10\n");}
	|	BOOL		{printf("\nExe11\n");}
	|	ID		{printf("\nExe12\n");}
	;

IDList	:	DOT ID IDList
	|	DOT ID LPAR FormalList RPAR
	|	DOT SIZE LPAR RPAR
	|	COMMA ID IDList
	|
	;
Sign	:	MINUS INTEGER	{}	%prec UMINUS
	|	PLUS INTEGER	{}	%prec UPLUS
	;
Access	:	
	| 	PUBLIC COLON
	|	PRIVATE COLON
	;
Type	:	Int	{printf("Type");}
	|	String
	|	Intarr
	|	Stringarr
	|	Intlist
	|	Stringlist
	|	Void
	|   ClassName
	;


Op	:	PLUS Exp
	|	MINUS Exp
	|	TIMES Exp
	|	DIV Exp
	|	MOD Exp
	;	
Op1	: 	LOAND Exp
	|	LOOR Exp
	|	LESS Exp
	|	GREAT Exp
	|	GEQ Exp
	|	LEQ Exp
	|	EQUAL Exp
	;
Op2	:	ASSIGN Exp
	;

*/

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
		   	  | External_Method
			  ;

External_Method : Type ClassName COLONCOLON ID ID LPAR FormalList RPAR LBR StatementList RBR
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
			  | ClassName DOT ID LPAR Exp RPAR SEMICOLON
			  ;

DeclStatement : Decl SEMICOLON 
			  ;

/* Evaluate Expression */
/*
Operators	  : Arithmetics
			  | Assignments
			  | Logical
			  ;
Arithmetics   : PLUS | MINUS | TIMES | DIV | MOD;
Assignments	  : PLUSPLUS | MINUSMINUS | PAS | MAS | TIMESAS | DIVAS | MODAS;
Logical		  : NEQ | EQUAL | GREAT | LESS | GEQ | LEQ | LOAND | LOOR | LONOT; 
*/
Exp			  : INTEGER 
			  | STRING
			  | ID
			  |
			  ;

%%
int main() { yyparse(); return 0;}
int yyerror(const char *msg){ fputs(msg,stdout);}


