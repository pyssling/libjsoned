%{
	#include "declaration.h"
	#include "struct_parser.h"
%}

ALPHANUM       	[a-zA-Z_][a-zA-Z0-9_]*

%option noyywrap nounput batch noinput

%%

"char"		{
			yylval.val = TYPE_CHAR;
			return CHAR;
		}

"int"		{
			yylval.val = TYPE_INT;
			return INT;
		}

"struct"	{
			yylval.val = TYPE_STRUCT;
			return STRUCT;
		}

"short"		{
			yylval.val = SPEC_SHORT;
			return SHORT;
		}

"long"		{
			yylval.val = SPEC_LONG;
			return LONG;
		}

"unsigned"	{
			yylval.val = SPEC_UNSIGNED;
			return UNSIGNED;
		}

"signed"	{
			yylval.val = SPEC_SIGNED;
			return SIGNED;
		}

{ALPHANUM}     	{
			yylval.string = strdup(yytext);
			if (!yylval.string) {
				perror("Failed to tokenize");
			}
			return NAME;
		}

"{"		{
			return '{';
		}

"}"		{
			return '}';
		}

";"		{
			return ';';
		}

[ \t\n]+	/* Consume whitespace */
%%
