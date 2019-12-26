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
%token <ival> INTEGER
%token <sval> STRING
%token SIZE THIS
%token ID
%token BOOL
%token Q_CLASS
%token PRIVATE PUBLIC
%token Int String Intarr Stringarr Intlist Stringlist Void RET
%token LBR RBR COMMA SEMICOLON COLON
%token LOAND LOOR LONOT
%token LESS GREAT LEQ GEQ ASSIGN EQUAL
%token PLUS MINUS TIMES MOD DIV
%token INJECT EXTRACT
%token LPAR RPAR
%right UMINUS UPLUS
%%
Program		:	FunctionList
		;
FunctionList 	:	DeclList MainFunction
		;

MainFunction	:	Int "main" LPAR Void RPAR LBR StatementList RBR
Decl	:	Type ID ';'
	|
	;
DeclList	:	Decl DeclList
	|	Class DeclList
	|	Function DeclList
	|
	;
Function	:	Type ID LPAR FormalList RPAR LBR StatementList RBR
	;
ClassDecl 	: Class ';'
MethodDecl	:	Function MethodDecl
	|
	;
FormalList	:	Type ID	FormalRest
		|
		;
FormalRest	:	',' Type ID FormalRest
		|
		;

StatementList	:	Statement StatementList
	|
	;
Statement	:	Decl ASSIGN LBR ExpList RBR
	|	"if" LPAR Exp RPAR LBR StatementList RBR
	|	"while" LPAR Exp RPAR LBR StatementList RBR
	|	"cout" INJECT ID INJECT "endl" ';'
	|	"cin" EXTRACT ID ';'
	|	Exp
	| 	RET Exp
	;
Class	:	Q_CLASS ClassName LBR ClassStatement RBR
	;
ClassName	:	ID
	;

ClassStatement	:	Access ':' ClassDecl MethodDecl ClassStatement
	|
	;
	
Exp	:	INTEGER Op
	|	INTEGER Op1
	|	BOOL Op1
	|	LONOT Exp
	|	ID Op2
	|	THIS IDList
	|	ID IDList
	|	LPAR Exp RPAR
	|	Sign
	;

IDList	:	'.' ID IDList
	|	'.' ID LPAR FormalList RPAR
	|	'.' SIZE LPAR RPAR
	|	',' ID IDList
	|
	;
Sign	:	'-' INTEGER	{}	%prec UMINUS
	|	'+' INTEGER	{}	%prec UPLUS
	;
Access	:	PRIVATE | PUBLIC
	|
	;
Type	:	Int
	|	String
	|	Intarr
	|	Stringarr
	|	Intlist
	|	Stringlist
	|	Void
	;

ExpList	:	Exp ExpRest
	;

ExpRest	:	',' Exp ExpRest
	|
	;

Op	:	PLUS Exp Op
	|	MINUS Exp Op
	|	TIMES Exp Op
	|	DIV Exp Op
	|	MOD Exp Op
	|
	;	
Op1	: 	LOAND Exp Op1
	|	LOOR Exp Op1
	|	LESS Exp Op1
	|	GREAT Exp Op1
	|	GEQ Exp Op1
	|	LEQ Exp Op1
	|	EQUAL Exp Op1
	|
	;
Op2	:	ASSIGN Exp
	;

%%
int main() { yyparse(); return 0;}
int yyerror(const char *msg){ fputs(msg,stdout);}



