//Area de codigo, importaciones y paquetes
import java_cup.runtime.*;
import java.io.*;
%%

//Area de opciones y declaraciones
%class AnalizadorSintAsc
%line
%column
%unicode
%cup

//Expresiones regulares
INI_PAR = \(
FIN_PAR = \)
OP_SUMA = \+
OP_RESTA = \-
OP_MULTIPLICACION = \*
OP_DIVISION = \/
OP_ELEVADO = \^
OP_RAIZ = sqrt
REAL = [-+]?[\d]*[.][\d]+([eE][-]?)?[\d]*
SEMICOLON = \;

Space = " "+
Tab = \t+
Intro = \n+

%%
//Area de reglas y acciones
{INI_PAR} {
    System.out.println("[LEX] (abre parentesis, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.LEFT_BRACKET, yyline , yycolumn);
}
{FIN_PAR} {
    System.out.println("[LEX] (cierra parentesis, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.RIGHT_BRACKET, yyline , yycolumn);
}
{OP_SUMA} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.PLUS, yyline , yycolumn);
}
{OP_RESTA} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.MINUS, yyline , yycolumn);
}
{OP_MULTIPLICACION} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.TIMES, yyline , yycolumn);
}
{OP_DIVISION} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.DIV, yyline , yycolumn);
}
{REAL} {
    System.out.println("[LEX] (real, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.REAL, yyline, yycolumn, new Double(yytext()));
}
{SEMICOLON} {
    System.out.println("[LEX] (fin sentencia, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.SEMICOLON, yyline , yycolumn);
}
{OP_ELEVADO} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.POW, yyline , yycolumn);
}
{OP_RAIZ} {
    System.out.println("[LEX] (operador, '"+yytext()+"')"+ " linea: "+(yyline+1)+" columna: "+(yycolumn+1));
    return new Symbol(sym.SQRT, yyline , yycolumn);
}

[ \t\r\n]+ {;}
. { System.out.println("[LEX] Error léxico "+yytext()+"-"); }