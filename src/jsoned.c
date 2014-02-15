#include <stdio.h>

extern FILE *yyin;
extern int yyparse(void);

int main(int argc, char *argv[])
{
	yyin = stdin;
	yyparse();
}
