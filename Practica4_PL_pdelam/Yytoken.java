public class Yytoken {
    public String lexema;
    public String typeToken;
    public int line;
    public int column;

    public Yytoken(String lexema, String typeToken, int line, int column) {
        this.lexema = lexema;
        this.typeToken = typeToken;
        this.line = line;
        this.column = column;
    }

    public void errorMatch() {
        System.out.println("[PARSER] Encontrado token de tipo " + typeToken + " (línea " + line + ", columna " + column + ")\n"+
                "Se esperaba un token de tipo "+typeToken);
    }

    public String getTypeToken() {
        return typeToken;
    }

    public String getLexema() {
        return lexema;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }
}
