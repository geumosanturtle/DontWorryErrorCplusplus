%{
   
   #include <cstdio>
   #include <cstdlib>
   #include <string>
   #include "parser.h"

   using namespace std;

   extern "C" int yywrap();
   const string str_itoa(const int32_t x){
		char *s = new char[11];
		sprintf(s, "%d", x);
		return string(s);
	}
%}

StringInput	([^"])|(\\.)
Integer		[0-9]+
Identifier	[A-Za-z_][A-Za-z0-9_]*
Whitespace  [\t\f\v ]+
Newline		[\n\r]+
%%
Newline		{;}
Whitespace	{;}

Integer		{ printf("INT(%s)",yytext); }

"\""{StringInput}*"\"" { printf("STRING_VALUE(%s)", yytext); return STRING; }


"int"				 	{printf("INT "); return Int;} 
"string"				{printf("STR "); return String;}
"intarr"				{printf("INTARR "); return Intarr;}
"stringarr"				{printf("STRARR "); return Stringarr; }
"intlist"				{printf("INTLIST "); return Intlist; }
"strlist"				{printf("STRLIST "); return Stringlist; }
"void"					{printf("VOID");	return Void;}


"class"					{ return Q_CLASS; }
"return"				{ return RET; }


"private"				{ return PRIVATE; }
"public"				{ return PUBLIC;  }


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
"="   { return ASSIGN;}

"{"   { return LBR ;}
"}"   { return RBR ;}
"("   { return LPAR;}
")"	  { return RPAR;}
","   {	return COMMA; }
";"   {return SEMICOLON;}
":"	  { return COLON;}
"."	{return DOT;}
{Identifier}  { printf("ID(%s)", yytext); return ID; }

%%
int yywrap() {return 1;}
//int main(){
//   yylex();
//   return 0;
//}

