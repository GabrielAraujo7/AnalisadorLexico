import java.io.*;

public class Main {
    public static void main(String[] stmtss) throws Exception {
        Reader reader = new BufferedReader(new FileReader("input.txt"));
        AnalisadorLexico scanner = new AnalisadorLexico(reader);
        Parser parser = new Parser(scanner);
       
    try {
        parser.parse();
        System.out.println("Análise sintática concluída com sucesso!");
    } catch (Exception e) {
        System.err.println("Erro durante a análise sintática:");
        e.printStackTrace();
}
}

}
