// Cálculo de la densidad de comentarios clásicos (/*..*/)

%%
%class analisisLexicoEstados
%standalone
%line
%states BLOQUE_JAVA
%states BLOQUE_PHP
%states BLOQUE_STRING_JAVA
%states BLOQUE_STRING_PHP

//Expresiones regulares
IF = (if )
ELSE = (else )
ELSEIF = (elseif )
IDENTIFICADOR = [a-zA-Z_]\w*
INI_PAR = (\()
FIN_PAR = (\))
INI_LLA = (\{)
FIN_LLA = (\})
OP_MAYOR = (>)
OP_MENOR = (<)
OP_MAYORIGUAL = (>=)
OP_MENORIGUAL = (<=)
OP_ASIGNAR = (\=)
OP_IGUAL = (==)
PUNTO = (\.)
COMA = (,)
PUNTOYCOMA = (;)
OP_SUMA = (\+)
OP_RESTA = (\-)
OP_MULTIPLICACION = (\*)
OP_DIVISION = (\/)
OP_AND = (&&)
OP_OR = (\|\|)
OP_NOT = (\!)
TYPE = (\ int|float|double|\ char|String|boolean|\ void)
TEXT = \w+
LITERAL = \d+

Finlinea = \n|\r|\r\n
Blanco = {Finlinea}|[ \t\f]
Espacio = " "+

%%
// Detecta cambios de estado entre bloques de Java y PHP
<YYINITIAL> "BeginJava" {System.out.println("JAVA_INI"); yybegin(BLOQUE_JAVA);}
<YYINITIAL> "BeginPHP" {System.out.println("PHP_INI"); yybegin(BLOQUE_PHP);}
<BLOQUE_JAVA> "EndJava" {System.out.println("JAVA_FIN"); yybegin(YYINITIAL);}
<BLOQUE_PHP> "EndPHP" {System.out.println("PHP_FIN"); yybegin(YYINITIAL);}

// Detecta los caracteres especiales
//  =============== BLOQUE JAVA ===============
<BLOQUE_JAVA> {IF} {System.out.println("JAVA_IF");}
<BLOQUE_JAVA> {ELSE} {System.out.println("JAVA_ELSE");}
<BLOQUE_JAVA> {INI_PAR} {System.out.println("JAVA_INI_PAR");}
<BLOQUE_JAVA> {FIN_PAR} {System.out.println("JAVA_FIN_PAR");}
<BLOQUE_JAVA> {INI_LLA} {System.out.println("JAVA_INI_LLA");}
<BLOQUE_JAVA> {FIN_LLA} {System.out.println("JAVA_FIN_LLA");}
<BLOQUE_JAVA> {OP_MAYOR} {System.out.println("JAVA_OP_MAYOR");}
<BLOQUE_JAVA> {OP_MENOR} {System.out.println("JAVA_OP_MENOR");}
<BLOQUE_JAVA> {OP_MAYORIGUAL} {System.out.println("JAVA_OP_MAYORIGUAL");}
<BLOQUE_JAVA> {OP_MENORIGUAL} {System.out.println("JAVA_OP_MENORIGUAL");}
<BLOQUE_JAVA> {OP_ASIGNAR} {System.out.println("JAVA_OP_ASIGNAR");}
<BLOQUE_JAVA> {OP_IGUAL} {System.out.println("JAVA_OP_IGUAL");}
<BLOQUE_JAVA> {PUNTO} {System.out.println("JAVA_PUNTO");}
<BLOQUE_JAVA> {COMA} {System.out.println("JAVA_COMA");}
<BLOQUE_JAVA> {PUNTOYCOMA} {System.out.println("JAVA_PUNTOYCOMA");}
<BLOQUE_JAVA> {OP_SUMA} {System.out.println("JAVA_OP_SUMA");}
<BLOQUE_JAVA> {OP_RESTA} {System.out.println("JAVA_OP_RESTA");}
<BLOQUE_JAVA> {OP_MULTIPLICACION} {System.out.println("JAVA_OP_MULTIPLICACION");}
<BLOQUE_JAVA> {OP_DIVISION} {System.out.println("JAVA_OP_DIVISION");}
<BLOQUE_JAVA> {OP_AND} {System.out.println("JAVA_OP_AND");}
<BLOQUE_JAVA> {OP_OR} {System.out.println("JAVA_OP_OR");}
<BLOQUE_JAVA> {OP_NOT} {System.out.println("JAVA_OP_NOT");}
<BLOQUE_JAVA> {TYPE} {System.out.println("JAVA_TYPE");}
<BLOQUE_JAVA> \$[a-zA-Z_]\w* {System.out.println("ERROR JAVA: NO PUEDE HABER UNA VARIABLE QUE COMIENCE POR '$' "+"("+yytext()+")");}
<BLOQUE_JAVA> {IDENTIFICADOR} {System.out.println("JAVA_ID"+"("+yytext()+")");}
<BLOQUE_JAVA> \" {System.out.println("JAVA_CAD_INI"); yybegin(BLOQUE_STRING_JAVA);}
<BLOQUE_JAVA> {LITERAL} {System.out.println("JAVA_LITERAL"+"("+yytext()+")");}

//  =============== BLOQUE PHP ===============
<BLOQUE_PHP> {IF} {System.out.println("PHP_IF");}
<BLOQUE_PHP> {ELSE} {System.out.println("PHP_ELSE");}
<BLOQUE_PHP> {ELSEIF} {System.out.println("PHP_ELSEIF");}
<BLOQUE_PHP> {INI_PAR} {System.out.println("PHP_INI_PAR");}
<BLOQUE_PHP> {FIN_PAR} {System.out.println("PHP_FIN_PAR");}
<BLOQUE_PHP> {INI_LLA} {System.out.println("PHP_INI_LLA");}
<BLOQUE_PHP> {FIN_LLA} {System.out.println("PHP_FIN_LLA");}
<BLOQUE_PHP> {OP_MAYOR} {System.out.println("PHP_OP_MAYOR");}
<BLOQUE_PHP> {OP_MENOR} {System.out.println("PHP_OP_MENOR");}
<BLOQUE_PHP> {OP_MAYORIGUAL} {System.out.println("PHP_OP_MAYORIGUAL");}
<BLOQUE_PHP> {OP_MENORIGUAL} {System.out.println("PHP_OP_MENORIGUAL");}
<BLOQUE_PHP> {OP_ASIGNAR} {System.out.println("PHP_OP_ASIGNAR");}
<BLOQUE_PHP> {OP_IGUAL} {System.out.println("PHP_OP_IGUAL");}
<BLOQUE_PHP> {PUNTO} {System.out.println("PHP_PUNTO");}
<BLOQUE_PHP> {COMA} {System.out.println("PHP_COMA");}
<BLOQUE_PHP> {PUNTOYCOMA} {System.out.println("PHP_PUNTOYCOMA");}
<BLOQUE_PHP> {OP_SUMA} {System.out.println("PHP_OP_SUMA");}
<BLOQUE_PHP> {OP_RESTA} {System.out.println("PHP_OP_RESTA");}
<BLOQUE_PHP> {OP_MULTIPLICACION} {System.out.println("PHP_OP_MULTIPLICACION");}
<BLOQUE_PHP> {OP_DIVISION} {System.out.println("PHP_OP_DIVISION");}
<BLOQUE_PHP> {OP_AND} {System.out.println("PHP_OP_AND");}
<BLOQUE_PHP> {OP_OR} {System.out.println("PHP_OP_OR");}
<BLOQUE_PHP> {OP_NOT} {System.out.println("PHP_OP_NOT");}
<BLOQUE_PHP> {TYPE} {System.out.println("PHP_TYPE");}
<BLOQUE_PHP> \$ {System.out.print("");}
<BLOQUE_PHP> {IDENTIFICADOR} {System.out.println("PHP_ID"+"("+yytext()+")");}
<BLOQUE_PHP> \" {System.out.println("PHP_CAD_INI"); yybegin(BLOQUE_STRING_PHP);}
<BLOQUE_PHP> {LITERAL} {System.out.println("PHP_LITERAL"+"("+yytext()+")");}

//  =============== BLOQUE STRING ===============
<BLOQUE_STRING_JAVA> {TEXT} {System.out.print("");}
<BLOQUE_STRING_JAVA> {PUNTOYCOMA} {System.out.println("ERROR JAVA: NO PUEDE HABER UN ';' ANTES DE ACABAR LA CADENA");}
<BLOQUE_STRING_JAVA> \" {System.out.println("JAVA_CAD_FIN"); yybegin(BLOQUE_JAVA);}

<BLOQUE_STRING_PHP> {TEXT} {System.out.print("");}
<BLOQUE_STRING_PHP> {PUNTOYCOMA} {System.out.println("ERROR PHP: NO PUEDE HABER UN ';' ANTES DE ACABAR LA CADENA");}
<BLOQUE_STRING_PHP> \" {System.out.println("PHP_CAD_FIN"); yybegin(BLOQUE_PHP);}

{Blanco} {
    System.out.print("");
}

{Espacio} {
    System.out.print("");
}