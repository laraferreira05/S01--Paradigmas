import java.util.ArrayList;


abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    // Método abstrato para retornar a receita nas subclasses
    public abstract String receita();
}


class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fervido com ervas da masmorra até engrossar.";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Assada lentamente na brasa para retirar o grito paralisante.";
    }
}


class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}


class Cozinheiro {
    private String nome;
    private Panela panela; // Composição: a panela pertence e nasce com o cozinheiro
    private ArrayList<Monstro> ingredientes; // Agregação: armazena monstros criados fora

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela); // Criação interna (Composição)
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        this.ingredientes.add(monstro); // Recebe um monstro pronto (Agregação)
    }

    public void servirBanquete() {
        System.out.println("=== BANQUETE DA MASMORRA ===");
        System.out.println("Cozinheiro: " + nome + " | Panela de: " + panela.getMaterial());
        System.out.println("Ingredientes preparados:");
        
        for (Monstro m : ingredientes) {
            System.out.println("- " + m.getNome() + ": " + m.receita());
        }
    }
}

// --- MAIN ---
public class Main {
    public static void main(String[] args) {
        // Criando os monstros externamente (Agregação)
        Monstro slime = new Slime("Slime Gelatinoso");
        Monstro mandragora = new Mandragora("Mandrágora Gritos");

        // Criando o cozinheiro (que cria a panela internamente por Composição)
        Cozinheiro senshi = new Cozinheiro("Senshi", "Ferro Batido");

        // Adicionando os monstros criados à lista do cozinheiro
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        // Servindo o banquete
        senshi.servirBanquete();
    }
}

/* EXPLICAÇÃO DOS RELACIONAMENTOS:
   - Composição: A classe Panela é instanciada diretamente dentro do construtor 
     da classe Cozinheiro (this.panela = new Panela(...)). Ela nasce junto com 
     o cozinheiro e depende dele para existir.
   - Agregação: Os Monstros (Slime e Mandragora) são criados de forma totalmente 
     independente fora do cozinheiro e apenas passam a ser referenciados na lista 
     de ingredientes através do método adicionarIngrediente().
*/
