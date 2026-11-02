import java.util.HashMap;


interface Sobrenatural {
    void manifestar();
}


class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O alienígena " + nome + " desce da nave e ativa a sua tecnologia avançada!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O espírito Youkai " + nome + " aparece flutuando e assusta os investigadores!");
    }
}


class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    // Regista o ser associado a uma string (o local)
    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    // Investiga o local usando o HashMap (.get)
    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println("Local '" + local + "': Está tranquilo, nenhum vestígio sobrenatural.");
        } else {
            System.out.println("Local '" + local + "': Sinais detetados!");
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        // Criando um alienígena e um espírito youkai
        Sobrenatural alien = new Alienigena("Serpentina Espacial");
        Sobrenatural youkai = new EspiritoYoukai("Vovó Turbo");

        // Criando o mapa de avistamentos
        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        // Registando os seres em locais específicos
        mapa.registrar("Túnel Abandonado", alien);
        mapa.registrar("Ponte Velha", youkai);

        // Investigando dois locais registados e um terceiro não registado
        mapa.investigar("Túnel Abandonado");
        mapa.investigar("Ponte Velha");
        mapa.investigar("Supermercado Central"); // Local não registado (retorna null)
    }
}
