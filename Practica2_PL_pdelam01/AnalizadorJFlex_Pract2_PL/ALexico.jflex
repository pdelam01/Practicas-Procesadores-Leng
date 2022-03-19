//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class ejercicio1
%standalone

Digito = [0-9]
Numero = {Digito}{Digito}*


%%
//Area de reglas y acciones
[aeiou] {System.out.print(yytext().toUpperCase());}