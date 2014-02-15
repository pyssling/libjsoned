%{
	#include "struct_parser.h"
%}

ALPHANUM       	[a-zA-Z_][a-zA-Z0-9_]*

%option noyywrap nounput batch noinput

%%

{ALPHANUM}     	{
			return NAME;
		}


%%
