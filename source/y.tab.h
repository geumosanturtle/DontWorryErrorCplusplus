/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER = 258,
    STRING = 259,
    ID = 260,
    SEMICOLON = 261,
    COMMA = 262,
    COLONCOLON = 263,
    DOT = 264,
    ASSIGN = 265,
    PAS = 266,
    MAS = 267,
    TIMESAS = 268,
    DIVAS = 269,
    MODAS = 270,
    SIZE = 271,
    PLUS = 272,
    MINUS = 273,
    DIV = 274,
    MOD = 275,
    TIMES = 276,
    INJECT = 277,
    EXTRACT = 278,
    EQUAL = 279,
    NEQ = 280,
    LEQ = 281,
    GEQ = 282,
    LESS = 283,
    GREAT = 284,
    LOAND = 285,
    LOOR = 286,
    LONOT = 287,
    PLUSPLUS = 288,
    MINUSMINUS = 289,
    BOOL = 290,
    Q_CLASS = 291,
    ELSE = 292,
    FALSE = 293,
    Int = 294,
    String = 295,
    Intarr = 296,
    Stringarr = 297,
    Intlist = 298,
    Stringlist = 299,
    IF = 300,
    PRIVATE = 301,
    PUBLIC = 302,
    RET = 303,
    COLON = 304,
    THIS = 305,
    TRUE = 306,
    Void = 307,
    WHILE = 308,
    LBR = 309,
    RBR = 310,
    LPAR = 311,
    RPAR = 312,
    UMINUS = 313,
    UPLUS = 314
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define STRING 259
#define ID 260
#define SEMICOLON 261
#define COMMA 262
#define COLONCOLON 263
#define DOT 264
#define ASSIGN 265
#define PAS 266
#define MAS 267
#define TIMESAS 268
#define DIVAS 269
#define MODAS 270
#define SIZE 271
#define PLUS 272
#define MINUS 273
#define DIV 274
#define MOD 275
#define TIMES 276
#define INJECT 277
#define EXTRACT 278
#define EQUAL 279
#define NEQ 280
#define LEQ 281
#define GEQ 282
#define LESS 283
#define GREAT 284
#define LOAND 285
#define LOOR 286
#define LONOT 287
#define PLUSPLUS 288
#define MINUSMINUS 289
#define BOOL 290
#define Q_CLASS 291
#define ELSE 292
#define FALSE 293
#define Int 294
#define String 295
#define Intarr 296
#define Stringarr 297
#define Intlist 298
#define Stringlist 299
#define IF 300
#define PRIVATE 301
#define PUBLIC 302
#define RET 303
#define COLON 304
#define THIS 305
#define TRUE 306
#define Void 307
#define WHILE 308
#define LBR 309
#define RBR 310
#define LPAR 311
#define RPAR 312
#define UMINUS 313
#define UPLUS 314

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "dwecpp_parser.y" /* yacc.c:1909  */

	char* sval;
	int ival;

#line 177 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
