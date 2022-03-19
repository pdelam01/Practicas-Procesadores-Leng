//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class ejercicio2
%standalone

Letra = [aeiouAEIOU]
Palabra = {Letra}{Letra}*

%%
//Area de reglas y acciones

{Palabra} * {
	switch (yytext()) {
		case "a": {
			System.out.print("1");
			break;
		}
		case "e": {
			System.out.print("2");
			break;
		}
		case "i": {
			System.out.print("3");
			break;
		}
		case "o": {
			System.out.print("4");
			break;
		}
		case "u": {
			System.out.print("5");
			break;
		}
		case "A": {
			System.out.print("3");
			break;
		}
		case "E": {
			System.out.print("6");
			break;
		}
		case "I": {
			System.out.print("9");
			break;
		}
		case "O": {
			System.out.print("12");
			break;
		}
		case "U": {
			System.out.print("15");
			break;
		}
		default:
			System.out.print(yytext());
		}
}