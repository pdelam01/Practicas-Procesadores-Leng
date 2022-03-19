//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class ejercicio3
%standalone
%line

Digito = [0-9]
Numero = {Digito}{Digito}*
Letra = [a-zA-Z]
Palabra = {Letra}{Letra}*


%%
//Area de reglas y acciones
{Palabra} {
	System.out.print(yytext().toUpperCase());
}
{Numero} {
	System.out.print(Integer.parseInt(yytext())*(yyline+1));
}