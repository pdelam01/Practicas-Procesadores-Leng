
import java.util.Scanner;
import java.util.regex.*;

public class Mainregexp {
	public static void main(String[] args) {
		
		/*
		 * Explicación de las expresiones regulares empleadas:
		 * 
		 * DNI_NIE: siguiendo las instrucciones de cómo el DNI y NIE se forman, explicadas en el guión de la práctica, la expresión regular tiene 
		 * 			por una parte la expresión para identificar DNI y en por otra (separada por el simbolo | "OR") la del NIE. Esto es:
		 * 				- DNI: primero 8 números del 0 al 9, seguido de 1 letra, que excluye I,Ñ,O,U.
		 * 				- NIE: primero una letra entre X,Y,Z, luego 7 cifras del 0-9 y por último 1 letra excluyendo las anteriores mencionadas.
		 * 
		 * 
		 * FLOAT: 	la expresión comienza con un símbolo "-" o "+" o nada, seguido de una cifra 0-9 (podremos encontar 0 o más, pues en caso de solo 
		 * 			ver un "." se supone a la izquierda hay un 0), el símbolo ".", luego la letra e o E seguido de la posibilidad de encontrar 
		 * 			un signo - (todo este bloque puede o no aparecer) y finalmente otra/s cifra/s (que pueden o no estar).
		 * h
		 * 
		 * DOMINIO:	tratando de unir ambos dos RFCs descritos, nos encontramos con la siguiente expresión regular que los aglutina: 
		 * 			en primer lugar y tras un "." solo podemos encontranos con una letra (mayúscula o minúscula). Luego, pueden aparaecer 1 o ningún
		 * 			caracer alfanumérico, junto con un "-" (se supone se permite que puedan aparecer varios "-" seguidos. Estos caracteres podrán 
		 * 			aparecer un mínimo de 0 y máximo de 61 veces (pues las etiquetas tienen un límite de 63 veces y hay que restar a esto la posibilidad
		 * 			de encontrar 1 al inicio y otra tras esta)... Le sigue un punto y la repetición de esta cadena, pudiendo así poner tantas veces se 
		 * 			desee.
		 * 
		 * 
		 * EMAIL:	comenzamos encontrando cualquier caracter menos el "@", apareciendo estos 1 o más veces. Luego debemos de visualizar un único @ y 
		 * 			de nuevo cualquier caracter menos este. Finalmente a esto le sigue un "." y caracteres alfanumericos (tras el punto debemos 
		 * 			encontrar como mínimo 1 letra o cifra numérica).
		 * 
		 * 
		 * IDENTIFICADOR: al principio solo poder encontrar letras o el símbolo "_", no un número. Tras este inicio podemos ver cualquier caracter 
		 * 				  alfanumérico o "_" (se pueden observar 0 o más veces).
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
	    	System.out.println("- Introduzca una cadena de caracteres y esta será asignada - ");
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
					System.out.println("\n¡Hasta pronto! ");
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
