%{
    /* definiciones de las constantes de manifiesto*/
    LT, LE, EQ, NE, GT, GE,
    IF, THEN, ELSE, ID, NUMERO, OPREL 
%}

/* definiciones regulares */
delim [ \t\n]
ws {delim}+
letra {A−Za−z]
digito [0−9]
id {letra}({letra}|{digito})*
numero {digito}+(\.{digito}+)?(E[+−]?(digito)+)?

%%

{ws} {/* no hay accion y no hay retorno */}
if {return(IF);};
then {return(THEN);};
else {return(ELSE);};
id {yylval = (int) instalarID(); return(ID);};
numero {yylval = (int) instalarNum(); return(NUMERO);};
"<" {yylval = LT; return(OPREL);};
"<=" {yylval = LE; return(OPREL);};
"=" {yylval = EQ; return(OPREL);};
"<>" {yylval = NE; return(OPREL);};
">" {yylval = GT; return(OPREL);};
">=" {yylval = GE; return(OPREL);};

%%

int instalarID() {/* funcion para instalar el lexema en
la tabla de sı́ mbolos y devolver un
apuntador a esto; yytext apunta al
primer caracter y yylent es
la longitud */
}
int instalarNum() {/* similar a instalarID, pero coloca las
constantes numericas en una tabla separada */
}