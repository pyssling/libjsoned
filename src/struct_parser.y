%{
	#include <stdio.h>
	#define YYSTYPE char const *
	#define YYDEBUG 1

	int yylex(void);

	void yyerror(char const *s)
	{
		fprintf (stderr, "%s\n", s);
	}
%}
     
%token NAME

%%
     
prog: NAME 
	{
		printf("NAME\n");
	}
;
