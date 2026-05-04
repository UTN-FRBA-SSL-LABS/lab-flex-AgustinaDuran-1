%{
#include <stdio.h>
%}

%pointer
%option noyywrap

%%
 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*                 { printf("constante octal: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]                 { }

 /* Constante decimal: empieza con un dígito del 1-9, seguido de cero o más dígitos [0-9] */
[1-9][0-9]*             { printf("constante decimal: %s\n", yytext); }

 /* Constante hexadecimal: empieza con 0x o 0X, seguido de uno o más dígitos hexadecimales */
0[xX][0-9a-fA-F]+       { printf("constante hexadecimal: %s\n", yytext); }

 /* Identificador: empieza con letra o _, seguido de letras, dígitos o _ */
[a-zA-Z_][a-zA-Z0-9_]*  { printf("identificador: %s\n", yytext); }

 /* Comodín: cualquier carácter no reconocido por las reglas anteriores */
.                       { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
