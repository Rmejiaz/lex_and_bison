%{
#include <stdio.h>
#include <stdbool.h>
%}

%token OR AND NOT TRUE FALSE
%left OR
%left AND
%right NOT

%%

bexpr: bexpr OR bterm   { printf("Result: %s\n", $1 || $3 ? "true" : "false"); }
     | bterm            { printf("Result: %s\n", $1 ? "true" : "false"); }
     ;

bterm: bterm AND bfactor { $$ = $1 && $3; }
     | bfactor          { $$ = $1; }
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
    return 0;
}
