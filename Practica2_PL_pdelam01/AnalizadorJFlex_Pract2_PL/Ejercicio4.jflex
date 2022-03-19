//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class ejercicio4
%standalone

Comentario = (\/\/)([^\n\r]+) //NO empieza por \n (linea nueva) y \r (retorno de carro). \ matches a "/"
Espacio = [\s]+
Tabulacion = [\t]+


%%
//Area de reglas y acciones
{Comentario} {
	System.out.print("");
}
{Espacio} {
	System.out.print(" ");
}
{Tabulacion} {
	System.out.print("\t");
}