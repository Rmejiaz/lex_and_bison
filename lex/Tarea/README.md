## Traducir a Pig latín.

Programa en Lex que convierte un archivo a “Pig latín”. En específico, un archivo es una secuencia de palabras (grupos de letras) separadas por
espacio en blanco. Cada vez que se encuentra con una palabra se realizan las siguientes acciones:

1.  Si la primera letra es una consonante, se desplaza hasta el final de la palabra y después se agrega ay.

2. Si la primera letra es una vocal, sólo se agrega ay al final de la palabra.

Todos los caracteres que no sean letras se copian intactos a la salida.

## Guía de uso

Una vez clonado el repositorio y estando ubicado en esta misma dirección, deben seguirse los siguiente pasos:


1. Compilar el código de lex.

```bash
$ lex piglatin.l
```

Al realizar esta acción, se genera el archivo `lex.yy.c`

2. Compilar, con un compilador de C, el archivo `lex.yy.c`. En un sistema linux, el comando sería el siguiente:

```bash
$ gcc lex.yy.c -o output -lfl 
```

Al ejecutar este comando debe crearse un tercer archivo, esta vez un ejectubable, en este caso llamado `output`.

3. Finalmente, se puede utiliar el ejecutable `output`, el cual es nuestro analizador léxico. La entrada debe estar en un archivo llamado `Input.txt`, y la salida queda en un archivo llamado `Output.txt`. Para utilizar el programa, basta con utilizar el ejecutable de la sigueinte forma:

```bash
$ ./output
```





