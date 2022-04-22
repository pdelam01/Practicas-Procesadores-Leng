import java.io.FileInputStream;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.util.Objects;
import java.util.Scanner;

public class Parser {

    private AnalizadorSintDesc aLex;
    private static Yytoken currentToken;

    public Parser(AnalizadorSintDesc aLex) {
        this.aLex = aLex;
    }

    public static void main(String[] args) throws Exception {
        StringBuilder str = new StringBuilder();
        InputStream stream = new FileInputStream(args[0]);
        Scanner scan = new Scanner(stream);

        while(scan.hasNextLine()){
            str.append(scan.nextLine()).append("\n");
        }

        Reader read = new StringReader(str.toString());
        AnalizadorSintDesc aLexer = new AnalizadorSintDesc(read);

        Parser parser = new Parser(aLexer);

        parser.nextToken();
        do{
            parser.S();
        }while(!currentToken.getTypeToken().equals("EOF"));

    }



    /**
     * Gramática limpia:
     *
     * S -> E;
     * E -> T E'
     * E' -> + T E' | - T E' | λ
     * T -> F T'
     * T' -> * F T' | / F T' | λ
     * F -> (E) | int
     *
     */

    public void S() throws Exception {
        E();
        if (currentToken.getTypeToken().equals("SEMICOLON")) {
            match("SEMICOLON");
        }
    }

    public void E() throws Exception {
        T();
        EPrima();
    }

    public void EPrima() throws Exception {
        if (currentToken.getTypeToken().equals("PLUS")) {
            match("PLUS");
            T();
            EPrima();
        } else if (currentToken.getTypeToken().equals("MINUS")) {
            match("MINUS");
            T();
            EPrima();
        }//epsilon

    }

    public void T() throws Exception {
        F();
        TPrima();
    }

    public void TPrima() throws Exception {
        if (currentToken.getTypeToken().equals("TIMES")) {
            match("TIMES");
            F();
            TPrima();
        } else if (currentToken.getTypeToken().equals("DIV")) {
            match("DIV");
            F();
            TPrima();
        }//epsilon

    }

    public void F() throws Exception {
        if (currentToken.getTypeToken().equals("LEFT_BRACKET")) {
            match("LEFT_BRACKET");
            E();
            match("RIGHT_BRACKET");
        } else {
            match("INTEGER");
        }
    }

    public void nextToken() throws Exception {
        currentToken = aLex.yylex();
        if(currentToken == null){
            currentToken = new Yytoken("EOF", "EOF",0,0);
        }
    }

    public void match(String token) throws Exception {
        if (currentToken.getTypeToken().equals(token)) {
            System.out.println("[Parser] ("+currentToken.getTypeToken()+", " + currentToken.getLexema()+") OK");
            nextToken();
        } else {
            currentToken.errorMatch(token);
            System.exit(-1);
        }
    }

}
