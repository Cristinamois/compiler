%{
#include <stdio.h>
#include "symbole_table.h"
extern int yylex();
extern int yylineno;
void yyerror(const char *msg);
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN IDENTIFIER ASSIGN
%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

assignment: IDENTIFIER ASSIGN expression { add_variable($1, $3); }
            ;


calculation: expression { printf("Result: %d\n", $1); }
           ;

expression: expression PLUS expression { $$ = $1 + $3; }
          | expression MINUS expression { $$ = $1 - $3; }
          | expression MULTIPLY expression { $$ = $1 * $3; }
          | expression DIVIDE expression { $$ = $1 / $3; }
          | IDENTIFIER {$$ = get_variable_value($1); }
          | NUMBER { $$ = $1; }
          | LPAREN expression RPAREN { $$ = $2; }
          ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Parser error: %s\n", msg);
}

int main() {
    yyparse();
    return 0;
}
