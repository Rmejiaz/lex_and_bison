%{
#include <stdio.h>
#include <stdbool.h>
%}

%token OR AND NOT TRUE FALSE
%left OR
%left AND
%right NOT

bool resultado;
%%



bexpr: bexpr OR bterm   { $$ = ($1 || $3) }
     | bterm            { $$ = $1; }
     ;

bterm: bterm AND bfactor { $$ = $1 && $3; }
     | bfactor           { $$ = $1; }
     ;

bfactor: NOT bfactor    { $$ = !$2; }
       | '(' bexpr ')'  { $$ = $2; }
       | TRUE            { $$ = true; }
       | FALSE           { $$ = false; }
       ;

%%

int yylex();
int yyparse();

void yyerror(const char* msg) {
    fprintf(stderr, "%s\n", msg);
}

int main() {
    yyparse();
    printf("Result: %s\n", resultado ? "true" : "false");
    return 0;
}