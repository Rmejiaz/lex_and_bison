%{
#include <stdio.h>
#include <string.h>
%}

%%
[a-zA-Z]+    {
    if (strchr("aeiouAEIOU", yytext[0]) != NULL) {
        fprintf(yyout, "%say ", yytext);
    } else {
        fprintf(yyout, "%s%cay ", yytext + 1, yytext[0]);
    }
}

[ \t\n]+    { fprintf(yyout, "%s", yytext); }
.           { fprintf(yyout, "%c", yytext[0]); }
%%

int main()
{
    extern FILE *yyin, *yyout;

    yyin = fopen("Input.txt", "r");
    yyout = fopen("Output.txt", "w");

    yyrestart(yyin);
    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}
