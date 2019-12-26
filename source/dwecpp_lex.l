%{
   
   #include <cstdio>
   #include <cstdlib>
   #include <string>
   #include <cstring>
   #include "parser.h"

   using namespace std;
   int lineno = 1;
   extern "C" int yywrap();
   const string str_itoa(const int32_t x){
		char *s = new char[11];
		sprintf(s, "%d", x);
		return string(s);
	}
%}

StringInput	([^";:])|(\\.)
Integer		[0-9]+
Identifier	[A-Za-z_][A-Za-z0-9_]*
Whitespace  [\t\f\v ]+
Newline		[\n\r]
%%
Newline		{lineno++;}
Whitespace	{;}

Integer		{ yylval.ival = atoi(yytext); printf("INT(%s)",yytext); return INTEGER;}

"\""{StringInput}*"\"" { printf("STRING_VALUE(%s)", yytext); yylval.sval = new char[strlen(yytext)+1]; strcpy(yylval.sval, yytext); yylval.sval[strlen(yytext)] = 0; return STRING; }


"int"				 	{printf("INT "); yylval.tval = Int; return Int;} 
"string"				{printf("STR "); yylval.tval = String; return String;}
"intarr"				{printf("INTARR "); yylval.tval = Intarr; return Intarr;}
"stringarr"				{printf("STRARR "); yylval.tval = Stringarr; return Stringarr; }
"intlist"				{printf("INTLIST "); yylval.tval = Intlist; return Intlist; }
"strlist"				{printf("STRLIST "); yylval.tval = Stringlist; return Stringlist; }
"void"					{printf("VOID"); yylval.tval = Void; return Void;}


"class"					{ printf("CLASS "); return Q_CLASS; }
"return"				{ printf("RETN ");  return RET; }
"if"				{printf("IF "); return IF;}
"else"				{printf("ELSE "); return ELSE;}
"while"				{printf("WHILE "); return WHILE;}

"private"				{ return PRIVATE; }
"public"				{ return PUBLIC;  }
"cout" {return COUT;}
"cin" {return CIN;}
"endl" {return ENDL;}

"&&"   { return LOAND;}
"||"   { return LOOR; }
"!"	   { return LONOT;}


"<"   { return LESS ; }
">"   { return GREAT; }
"<="  { return LEQ  ; }
">="  { return GEQ  ; }
"=="  { return EQUAL; }
"!="  { return NEQ;   }

"-"   { return MINUS; }
"*"   { return TIMES; }

"<<"  { return INJECT ; }
">>"  { return EXTRACT; }

"+"	  { return PLUS;  }
"++"  { return PLUSPLUS;}
"--"  { return MINUSMINUS;}
"+="  { return PAS;}
"-="  { return MAS;}
"*="  { return TIMESAS;}
"/="  { return DIVAS;}
"%="  { return MODAS;}
"%"   { return MOD ;  }
"/"   { return DIV ;  }
"="   { printf("="); return ASSIGN;}

"{"   { return LBR ;}
"}"   { return RBR ;}
"("   {  return LPAR;}
")"	  {  return RPAR;}
","   {	return COMMA; }
";"   {return SEMICOLON;}
":"	  { return COLON;}
"."	{return DOT;}
{Identifier}  { printf("ID(%s)", yytext); yylval.sval = new char[strlen(yytext)+1](); strcpy(yylval.sval, yytext); return ID; }

%%
int yywrap() {return 1;}

