%{
#include <stdio.h>
#include <stdbool.h>
%}


%token OR AND NOT TRUE FALSE IZQ DER
%left OR
%left AND
%right NOT

%%

program: bexpr   { printf("Result: %s\n", $1 ? "true" : "false"); }

bexpr: bexpr OR bterm   { $$ = $1 || $3; }
     | bterm            { $$ =  $1 ; }
     ;

bterm: bterm AND bfactor { $$ = $1 && $3; }
     | bfactor          { $$ = $1; }
     ;

bfactor: NOT bfactor    { $$ = !$2; }
       | IZQ bexpr DER  { $$ = $2; }
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
