%{
#include "y.tab.h"
void yyerror(char *);
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[+\-*/%] { return yytext[0]; }
.      { yyerror("invalid character"); }

%%

int yywrap() {
    return 1;
}
