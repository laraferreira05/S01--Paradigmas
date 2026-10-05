using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"[Grimorio] Feitiço Favorito: {FeiticoFavorito}");
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"Companheiro: {Nome} | Funcao: {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }

    public Grimorio GrimorioProprio { get; private set; }

    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.GrimorioProprio = new Grimorio();
        this._companheiros = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo da Maga {Nome} ({_companheiros.Count} companheiros):");
        foreach (var comp in _companheiros)
        {
            comp.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== O Grimorio de Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.GrimorioProprio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.GrimorioProprio.Abrir();
    }
}
