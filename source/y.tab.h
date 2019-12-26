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
    SIZE = 260,
    THIS = 261,
    ID = 262,
    BOOL = 263,
    Q_CLASS = 264,
    PRIVATE = 265,
    PUBLIC = 266,
    Int = 267,
    String = 268,
    Intarr = 269,
    Stringarr = 270,
    Intlist = 271,
    Stringlist = 272,
    Void = 273,
    RET = 274,
    LBR = 275,
    RBR = 276,
    COMMA = 277,
    SEMICOLON = 278,
    COLON = 279,
    LOAND = 280,
    LOOR = 281,
    LONOT = 282,
    LESS = 283,
    GREAT = 284,
    LEQ = 285,
    GEQ = 286,
    ASSIGN = 287,
    EQUAL = 288,
    PLUS = 289,
    MINUS = 290,
    TIMES = 291,
    MOD = 292,
    DIV = 293,
    INJECT = 294,
    EXTRACT = 295,
    LPAR = 296,
    RPAR = 297,
    UMINUS = 298,
    UPLUS = 299
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define STRING 259
#define SIZE 260
#define THIS 261
#define ID 262
#define BOOL 263
#define Q_CLASS 264
#define PRIVATE 265
#define PUBLIC 266
#define Int 267
#define String 268
#define Intarr 269
#define Stringarr 270
#define Intlist 271
#define Stringlist 272
#define Void 273
#define RET 274
#define LBR 275
#define RBR 276
#define COMMA 277
#define SEMICOLON 278
#define COLON 279
#define LOAND 280
#define LOOR 281
#define LONOT 282
#define LESS 283
#define GREAT 284
#define LEQ 285
#define GEQ 286
#define ASSIGN 287
#define EQUAL 288
#define PLUS 289
#define MINUS 290
#define TIMES 291
#define MOD 292
#define DIV 293
#define INJECT 294
#define EXTRACT 295
#define LPAR 296
#define RPAR 297
#define UMINUS 298
#define UPLUS 299

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "project.y" /* yacc.c:1909  */

	char* sval;
	int ival;

#line 147 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
