%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex(void);
%}

%token NUMBER EOL

%%

lines: /* empty */
      | lines line
      ;

line: expr EOL          { printf("Valid arithmetic expression\n"); }
     | error EOL         { printf("Invalid arithmetic expression\n"); }
     ;

expr: NUMBER
     | expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr '%' expr
     ;

%%

void yyerror(char *s) {
    // we will handle errors in the 'line' rule
}

int main(void) {
    printf("Enter arithmetic expressions (CTRL+D to exit):\n");
    yyparse();
    return 0;
}
