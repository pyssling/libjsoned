%{
	#include <stdio.h>
	#include "declaration.h"
	
	#define YYDEBUG 1

	int yydebug = 0;

	int yylex(void);

	void yyerror(char const *s)
	{
		fprintf (stderr, "%s\n", s);
	}
%}

%union {
	int val;
	char *string;
	struct declaration *decl;
};

%token <string> NAME
%token <val> STRUCT CHAR INT SHORT LONG SIGNED UNSIGNED
%type <val> type specifier specifiers
%type <decl> declaration simple_declaration struct declarations
%%

struct : STRUCT NAME '{' declarations '}' ';'
{
	$$ = new_declaration(STRUCT, $2);
	$$->children = $4;
	printf("struct %s\n", $2);
};

declarations : declaration | declaration declarations
{
	$$ = $1;
	$$->next = $2;
}

declaration : struct | simple_declaration

simple_declaration : specifiers type NAME ';'
{
	$$ = new_declaration($1 | $2, $3);
	printf("simple declaration of %s\n", $3);
}

type : CHAR | INT


specifiers : specifier
{

}
| specifier specifiers
{
	$$ = $1 | $2;
}

specifier : SHORT | LONG | SIGNED | UNSIGNED | /* empty rule: */
{
	$$ = 0;
}
	
