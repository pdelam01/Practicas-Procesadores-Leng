//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class ejercicio1
%standalone

Digito = [0-9]
Numero = {Digito}*


%%
//Area de reglas y acciones

{Numero} * {
	if(Integer.parseInt(yytext())%2==0){ 
		System.out.print("NUM_PAR");
	}else{ 
		System.out.print("NUM_IMPAR");
	}
}