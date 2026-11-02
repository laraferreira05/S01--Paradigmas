
abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome); // repassa o nome para o construtor do pai
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Olá, sou o mago " + getNome() + " e meu feitiço principal é " + feitico + ".");
    }
}


class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou " + getNome() + ", o demônio do fogo que faz o castelo andar!");
    }
}

// Classe Principal (Main)
public class Main {
    public static void main(String[] args) {
       
        Morador morador1 = new Mago("Howl", "Chama Negra");
        Morador morador2 = new DemonioDoFogo("Calcifer");

        morador1.apresentar();
        morador2.apresentar();

        // Tentar instanciar a classe abstrata diretamente gera erro de compilação:
        // Morador erroMorador = new Morador("Teste"); 
    }
}
