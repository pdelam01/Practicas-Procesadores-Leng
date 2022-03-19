
import java.util.Scanner;
import java.util.regex.*;

public class Mainregexp {
	public static void main(String[] args) {
		
		/*
		 * Explicaci�n de las expresiones regulares empleadas:
		 * 
		 * DNI_NIE: siguiendo las instrucciones de c�mo el DNI y NIE se forman, explicadas en el gui�n de la pr�ctica, la expresi�n regular tiene 
		 * 			por una parte la expresi�n para identificar DNI y en por otra (separada por el simbolo | "OR") la del NIE. Esto es:
		 * 				- DNI: primero 8 n�meros del 0 al 9, seguido de 1 letra, que excluye I,�,O,U.
		 * 				- NIE: primero una letra entre X,Y,Z, luego 7 cifras del 0-9 y por �ltimo 1 letra excluyendo las anteriores mencionadas.
		 * 
		 * 
		 * FLOAT: 	la expresi�n comienza con un s�mbolo "-" o "+" o nada, seguido de una cifra 0-9 (podremos encontar 0 o m�s, pues en caso de solo 
		 * 			ver un "." se supone a la izquierda hay un 0), el s�mbolo ".", luego la letra e o E seguido de la posibilidad de encontrar 
		 * 			un signo - (todo este bloque puede o no aparecer) y finalmente otra/s cifra/s (que pueden o no estar).
		 * h
		 * 
		 * DOMINIO:	tratando de unir ambos dos RFCs descritos, nos encontramos con la siguiente expresi�n regular que los aglutina: 
		 * 			en primer lugar y tras un "." solo podemos encontranos con una letra (may�scula o min�scula). Luego, pueden aparaecer 1 o ning�n
		 * 			caracer alfanum�rico, junto con un "-" (se supone se permite que puedan aparecer varios "-" seguidos. Estos caracteres podr�n 
		 * 			aparecer un m�nimo de 0 y m�ximo de 61 veces (pues las etiquetas tienen un l�mite de 63 veces y hay que restar a esto la posibilidad
		 * 			de encontrar 1 al inicio y otra tras esta)... Le sigue un punto y la repetici�n de esta cadena, pudiendo as� poner tantas veces se 
		 * 			desee.
		 * 
		 * 
		 * EMAIL:	comenzamos encontrando cualquier caracter menos el "@", apareciendo estos 1 o m�s veces. Luego debemos de visualizar un �nico @ y 
		 * 			de nuevo cualquier caracter menos este. Finalmente a esto le sigue un "." y caracteres alfanumericos (tras el punto debemos 
		 * 			encontrar como m�nimo 1 letra o cifra num�rica).
		 * 
		 * 
		 * IDENTIFICADOR: al principio solo poder encontrar letras o el s�mbolo "_", no un n�mero. Tras este inicio podemos ver cualquier caracter 
		 * 				  alfanum�rico o "_" (se pueden observar 0 o m�s veces).
		 */
		

		Pattern dniRegex = Pattern.compile("^([0-9]{8}[A-HJ-NP-TV-Z])|([XYZ][0-9]{7}[A-HJ-NP-TV-Z])$");
	    Pattern floatRegex = Pattern.compile("^[-+]?[\\d]*[.][\\d]+([eE][-]?)?[\\d]*$");
	    Pattern domRegex = Pattern.compile("^[A-Za-z]([A-Za-z0-9-]{0,61}[A-Za-z0-9]+)?(\\.[A-Za-z]([A-Za-z0-9-]{0,61}[A-Za-z0-9]+)?)+$"); 
	    Pattern emailRegex = Pattern.compile("^[^@]+@[^@]+\\.[\\w]+$");
	    Pattern identRegex = Pattern.compile("^[a-zA-Z_]\\w*$");
	    
	    try (Scanner sc = new Scanner(System.in)) {
			
	    	String cadenaLeida = "";
	    	System.out.println("------------------------------------------------------------ ");
	    	System.out.println("------------ Expresiones regulares, Practica 1 ------------- ");
	    	System.out.println("- Introduzca una cadena de caracteres y esta ser� asignada - ");
	    	System.out.println("--------- Para abandonar el programa escriba EXIT ---------- ");
	    	System.out.println("------------------------------------------------------------ \n\n");
	    	
	    	while (true) {
	    		System.out.println("Por favor, introduzca una cadena de caracteres: ");
				cadenaLeida = sc.nextLine();
				
				
				boolean cumpleDni = dniRegex.matcher(cadenaLeida).matches();
				boolean cumpleFloat = floatRegex.matcher(cadenaLeida).matches();
				boolean cumpleDom = domRegex.matcher(cadenaLeida).matches();
				boolean cumpleMail = emailRegex.matcher(cadenaLeida).matches();
				boolean cumpleIdent = identRegex.matcher(cadenaLeida).matches();
				
				if(cadenaLeida.equals("EXIT")) {
					System.out.println("\n�Hasta pronto! ");
					break;
				}
				
				if(cumpleDni) {
				   System.out.println("DNI_NIE \n");
				}else if(cumpleFloat) {
					 System.out.println("FLOAT \n");
				}else if(cumpleDom) {
					System.out.println("DOMINIO \n");
				}else if(cumpleMail) {
					System.out.println("EMAIL \n");
				}else if(cumpleIdent) {
					System.out.println("IDENTIFICADOR \n");
				}else {
					System.out.println("Cadena de caracteres no identificada \n");
				}
			}
		}
	}
}
