%{
#include <stdio.h>
extern int yylex();
extern int yylineno;
void yyerror(const char *msg);
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE
%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

calculation: expression { printf("Result: %d\n", $1); }
           ;

expression: expression PLUS expression { $$ = $1 + $3; }
          | expression MINUS expression { $$ = $1 - $3; }
          | expression MULTIPLY expression { $$ = $1 * $3; }
          | expression DIVIDE expression { $$ = $1 / $3; }
          | NUMBER { $$ = $1; }
          ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Parser error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}
