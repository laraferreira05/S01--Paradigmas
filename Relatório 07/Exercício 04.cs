using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public EntidadeCosmica(string nome, string origem)
    {
        this.Nome = nome;
        this.Origem = origem;
    }

    public virtual void Manifestar()
    {
        Console.Write($"\nEntidade: {Nome}");

        if (this.Origem != "Desconhecida")
        {
            Console.Write($" | Origem: {Origem}");
        }

        Console.WriteLine();
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome) { }
    public Profundo(string nome, string origem) : base(nome, origem) { }

    public override void Manifestar()
    {
        Console.WriteLine($"\n[Profundo Cosmico] {Nome} emergiu das profundezas do oceano!");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome) { }
    public MiGo(string nome, string origem) : base(nome, origem) { }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"--> {Nome} emite um zumbido estranho e manipula tecnologia alienigena.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n=== Catalogo do Pesquisador {Nome} ({_catalogo.Count} relatos) ===");
        
        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===");

        Profundo profundo = new Profundo("Dagon", "Abismo Marinho");
        MiGo migo = new MiGo("Habitante de Yuggoth", "Yuggoth");
        EntidadeCosmica generica = new EntidadeCosmica("A Cor que Caiu do Espaco");

        Pesquisador armitage = new Pesquisador("Henry Armitage");

        armitage.Catalogar(profundo);
        armitage.Catalogar(migo);
        armitage.Catalogar(generica);

        armitage.LerCatalogo();
    }
}
