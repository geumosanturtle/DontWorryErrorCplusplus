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
%token SEMICOLON
%token ASSIGN PAS MAS TIMESAS DIVAS MODAS
%token COMMA COLON
%token LOOR
%token LOAND
%token EQUAL NEQ
%token LESS LEQ GREAT GEQ
%token INJECT EXTRACT
%token PLUS MINUS
%token TIMES DIV MOD
%token LONOT PLUSPLUS MINUSMINUS
%token DOT
%token LPAR RPAR LBR RBR
%right UMINUS UPLUS
%%
Program		:	FunctionList
		;
FunctionList 	:	DeclList MainFunction
		;

MainFunction	:	Int "main" LPAR Void RPAR LBR StatementList RBR
Decl	:	Type ID SEMICOLON
	|
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
FormalList	:	Type ID	FormalRest
		|
		;
FormalRest	:	COMMA Type ID FormalRest
		|
		;

StatementList	:	Statement StatementList
	|
	;
Statement	:	Decl ASSIGN LBR ExpList RBR
	|	"if" LPAR Exp RPAR LBR StatementList RBR
	|	"while" LPAR Exp RPAR LBR StatementList RBR
	|	"cout" INJECT ID INJECT "endl" SEMICOLON
	|	"cin" EXTRACT ID SEMICOLON
	|	Exp
	| 	RET Exp
	;
Class	:	Q_CLASS ClassName LBR ClassStatement RBR
	;
ClassDecl 	: 
		|	Decl ClassDecl
		;
ClassName	:	ID
	;

ClassStatement	:	Access COLON ClassDecl MethodDecl ClassStatement
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
	| 	PUBLIC
	|	PRIVATE
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

ExpRest	:	COMMA Exp ExpRest
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


