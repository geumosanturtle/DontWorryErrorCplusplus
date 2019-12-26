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
    COUT = 261,
    ENDL = 262,
    CIN = 263,
    SEMICOLON = 264,
    COMMA = 265,
    DOT = 266,
    ASSIGN = 267,
    PAS = 268,
    MAS = 269,
    TIMESAS = 270,
    DIVAS = 271,
    MODAS = 272,
    SIZE = 273,
    PLUS = 274,
    MINUS = 275,
    DIV = 276,
    MOD = 277,
    TIMES = 278,
    INJECT = 279,
    EXTRACT = 280,
    EQUAL = 281,
    NEQ = 282,
    LEQ = 283,
    GEQ = 284,
    LESS = 285,
    GREAT = 286,
    LOAND = 287,
    LOOR = 288,
    LONOT = 289,
    PLUSPLUS = 290,
    MINUSMINUS = 291,
    BOOL = 292,
    Q_CLASS = 293,
    ELSE = 294,
    FALSE = 295,
    Int = 296,
    String = 297,
    Intarr = 298,
    Stringarr = 299,
    Intlist = 300,
    Stringlist = 301,
    IF = 302,
    PRIVATE = 303,
    PUBLIC = 304,
    RET = 305,
    COLON = 306,
    THIS = 307,
    TRUE = 308,
    Void = 309,
    WHILE = 310,
    LBR = 311,
    RBR = 312,
    LPAR = 313,
    RPAR = 314,
    NONE_ELSE_IF = 315,
    UMINUS = 316,
    UPLUS = 317
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define STRING 259
#define ID 260
#define COUT 261
#define ENDL 262
#define CIN 263
#define SEMICOLON 264
#define COMMA 265
#define DOT 266
#define ASSIGN 267
#define PAS 268
#define MAS 269
#define TIMESAS 270
#define DIVAS 271
#define MODAS 272
#define SIZE 273
#define PLUS 274
#define MINUS 275
#define DIV 276
#define MOD 277
#define TIMES 278
#define INJECT 279
#define EXTRACT 280
#define EQUAL 281
#define NEQ 282
#define LEQ 283
#define GEQ 284
#define LESS 285
#define GREAT 286
#define LOAND 287
#define LOOR 288
#define LONOT 289
#define PLUSPLUS 290
#define MINUSMINUS 291
#define BOOL 292
#define Q_CLASS 293
#define ELSE 294
#define FALSE 295
#define Int 296
#define String 297
#define Intarr 298
#define Stringarr 299
#define Intlist 300
#define Stringlist 301
#define IF 302
#define PRIVATE 303
#define PUBLIC 304
#define RET 305
#define COLON 306
#define THIS 307
#define TRUE 308
#define Void 309
#define WHILE 310
#define LBR 311
#define RBR 312
#define LPAR 313
#define RPAR 314
#define NONE_ELSE_IF 315
#define UMINUS 316
#define UPLUS 317

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "dwecpp_parser.y" /* yacc.c:1909  */

	char* sval;
	int ival;

#line 183 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
