%{
#include "parser.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULTIPLY; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[a-zA-Z]+   { yylval.str = strdup(yytext); return IDENTIFIER; }
[ \t\n]     ; /* Ignore whitespace and newline */
.           { fprintf(stderr, "Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
