//Area de codigo, importaciones y paquetes

import java.io.*;
import java.util.Locale;
import java.time.Month;
import java.time.format.TextStyle;
%%
//Area de opciones y declaraciones
%class ejercicio5
%standalone


%%
//Area de reglas y acciones ||| Nos evitamos un switch con esto
[:digit:]* {
    int numMes = Integer.parseInt(yytext());
    if(numMes>0 && numMes<=12) {
        Locale locale = new Locale("es", "ES");
        Month mes = Month.of(numMes);
        String mesNombre = mes.getDisplayName(TextStyle.FULL,locale); 
        System.out.print(mesNombre);
    }else{
    	 System.out.print(yytext());
    }
}