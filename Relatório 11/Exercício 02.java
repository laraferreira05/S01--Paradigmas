import java.util.ArrayList;


class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9; // Aplica 10% de desconto
    }
}


class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        System.out.println("=== CARDÁPIO DO CAFÉ LEBLANC ===");
        for (ItemDoCardapio item : cardapio) {
            System.out.println("- " + item.getNome() + " | Preço Final: R$ " + item.precoFinal());
        }
    }
}

//Classe Principal (Main)
public class Main {
    public static void main(String[] args) {
        
        ItemDoCardapio cafe = new ItemDoCardapio("Café Coado", 8.0);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da Casa", 25.0);
        ComboLeblanc combo = new ComboLeblanc("Combo Especial", 30.0);

       
        CafeLeblanc meuCafe = new CafeLeblanc();
        meuCafe.adicionar(cafe);
        meuCafe.adicionar(curry);
        meuCafe.adicionar(combo);

        meuCafe.mostrarCardapio();
    }
}
