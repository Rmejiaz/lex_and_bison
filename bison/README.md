## Analizador de expresiones booleanas 

Programa en Bison que recibe expresiones booleanas como
entrada y produce el valor verdadero de las expresiones. Todo esto según lo indicado por la siguiente gramática para las expresiones booleanas:

bexpr &rarr; bexpr or bterm | bterm

bterm &rarr; bterm and bfactor | bfactor

bfactor &rarr; not bfactor | ( bexpr ) | true | false


## Guía de uso

Una vez clonado el repositorio y estando ubicado en esta misma dirección, deben seguirse los siguiente pasos:


1. Compilar el archivo de Yacc, con Bison o directamente con Yacc:

```bash
$ bison -d boolean_analyzer.y
```

2. Compilar el archivo de lex:

```bash
$ flex lexer.l
```

3. Compilar los respectivos archivos generados en los pasos anteriores, con un compilador de C:

```bash
$ gcc lex.yy.c boolean_parser.tab.c -o boolean_parser -lfl
```

4. Una vez se han ejecutado todos los pasos anteriores, se debe tener un archivo ejectuable con nombre `boolean_parser`, el cual basta ejecutar para utilizar el analizador booleano.

```bash
$ ./boolean_parser
```
