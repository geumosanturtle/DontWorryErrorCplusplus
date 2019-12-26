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
%token <ival> INTEGER <sval> STRING ID
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

%right UMINUS UPLUS
%%
Program		:  FunctionList MainFunction
		;
FunctionList 	:	DeclList 
			  |
		;

MainFunction	:	Int "main" LPAR Void RPAR LBR StatementList RBR
Decl	:	Type ID SEMICOLON
	;

DeclList	:	Decl DeclList
	|	Class DeclList
	|	Function DeclList
	|
	;
Function	:	Type ID LPAR FormalList RPAR LBR StatementList RBR
	;
MethodDecl	:	Function MethodDecl
	|
	;
FormalList	:	Type ID FormalRest
		|
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


%%
int main() { yyparse(); return 0;}
int yyerror(const char *msg){ fputs(msg,stdout);}


