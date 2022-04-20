//Area de codigo, importaciones y paquetes

import java.io.*;
%%
//Area de opciones y declaraciones
%class AnalizadorSintDesc
%type Yytoken
%line
%column

//Expresiones regulares
INI_PAR = \(
FIN_PAR = \)
OP_SUMA = \+
OP_RESTA = \-
OP_MULTIPLICACION = \*
OP_DIVISION = \/
LITERAL = \d+
SEMICOLON = \;

Space = " "+
Tab = \t+
Intro = \n+

%%
//Area de reglas y acciones
{INI_PAR} {
    System.out.println("[LEX] (abre parentesis, '"+yytext()+"')");
    return new Yytoken(yytext(),"LEFT_BRACKET",yyline,yycolumn);
}
{FIN_PAR} {
    System.out.println("[LEX] (cierra parentesis, '"+yytext()+"')");
    return new Yytoken(yytext(),"RIGHT_BRACKET",yyline,yycolumn);
}
{OP_SUMA} {
    System.out.println("[LEX] (operador, '"+yytext()+"')");
    return new Yytoken(yytext(),"PLUS",yyline,yycolumn);
}
{OP_RESTA} {
    System.out.println("[LEX] (operador, '"+yytext()+"')");
    return new Yytoken(yytext(),"MINUS",yyline,yycolumn);
}
{OP_MULTIPLICACION} {
    System.out.println("[LEX] (operador, '"+yytext()+"')");
    return new Yytoken(yytext(),"TIMES",yyline,yycolumn);
}
{OP_DIVISION} {
    System.out.println("[LEX] (operador, '"+yytext()+"')");
    return new Yytoken(yytext(),"DIV",yyline,yycolumn);
}
{LITERAL} {
    System.out.println("[LEX] (literal, '"+yytext()+"')");
    return new Yytoken(yytext(),"INTEGER",yyline,yycolumn);
}
{SEMICOLON} {
    System.out.println("[LEX] (fin sentencia, '"+yytext()+"')");
    return new Yytoken(yytext(),"SEMICOLON",yyline,yycolumn);
}

{Space} {
    System.out.print("");
}

{Tab} {
    System.out.print("");
}

{Intro} {
    System.out.print("");
}
