%{
#include "y.tab.h"
%}

%%
"or"    { return OR; }
"and"   { return AND; }
"not"   { return NOT; }
"true"  { return TRUE; }
"false" { return FALSE; }
"("     { return '('; }
")"     { return ')'; }
\n      { return 0; }  /* Fin de línea, devuelve 0 para indicar el final del análisis. */
.       { /* Ignorar cualquier otro carácter no reconocido. */ }
%%

int yywrap() {
    return 1;  /* Indica el final del análisis. */
}