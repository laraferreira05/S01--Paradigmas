using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nível {Nivel}) entrou em campo! ---");
        Console.WriteLine($"{Especie} usou Investida!");
    }
}

public class TipoPlanta : Pokemon
{
    public string GolpeEspecial { get; set; }

    public TipoPlanta(string especie, int nivel, string golpeEspecial) : base(especie, nivel)
    {
        this.GolpeEspecial = golpeEspecial;
    }

    public override void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nível {Nivel}) [Tipo Planta] entrou em campo! ---");
        Console.WriteLine($"{Especie} usou {GolpeEspecial}!");
    }
}

public class TipoEletrico : Pokemon
{
    public int Voltagem { get; private set; }

    public TipoEletrico(string especie, int nivel, int voltagem) : base(especie, nivel)
    {
        this.Voltagem = voltagem;
    }

    public override void EntrarEmCampo()
    {
        base.EntrarEmCampo();
        Console.WriteLine($"{Especie} disparou uma descarga elétrica de {Voltagem}V!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibição Pokémon ===");

        List<Pokemon> campoDeBatalha = new List<Pokemon>();

        campoDeBatalha.Add(new TipoPlanta("Sceptile", 36, "Lâmina de Folha"));
        campoDeBatalha.Add(new TipoEletrico("Jolteon", 40, 100000));
        campoDeBatalha.Add(new Pokemon("Eevee", 15));

        Console.WriteLine($"\nTotal de Pokémon em campo: {campoDeBatalha.Count}");

        foreach (var pokemon in campoDeBatalha)
        {
            pokemon.EntrarEmCampo();
        }
    }
}
