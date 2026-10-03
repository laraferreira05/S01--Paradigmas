using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public int Circulo { get; private set; }

    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto, int circulo)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        this.Circulo = circulo;

        Console.WriteLine($"[Convocação] {Nome} do povo {Povo} foi convocado para defender o Círculo {Circulo}!");
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.Write($"\nCombatente: {Nome} | Povo: {Povo} | Posto: {Posto} | Círculo: {Circulo}");

        if (this.Armamento != "Desarmado")
        {
            Console.Write($" | Armamento: {Armamento}");
        }

        Console.WriteLine();
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor legolas = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro", 1);
        legolas.Equipar("Arco dos Galadhrim");

        CombatenteDeGondor Pippin = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela", 7);

        CombatenteDeGondor boromir = new CombatenteDeGondor("Boromir", "Homens", "Capitão", 1);
        boromir.Equipar("Espada de Gondor");

        legolas.ApresentarUnidade();
        Pippin.ApresentarUnidade();
        boromir.ApresentarUnidade();

    }
}
