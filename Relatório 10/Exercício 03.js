// Classe simples para a ficha (composição)
class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de Perigo: ${this.nivelDePerigo}`;
    }
}

// Diário (Composição: a ficha nasce e é guardada dentro dele)
class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {
        const novaFicha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(novaFicha);
    }

    exibirFichas() {
        console.log(`\n--- Diário Misterioso nº ${this.numero} ---`);
        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

// Classe simples de Funcionário
class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

// Cabana do Mistério (Agregação: os funcionários já existem fora dela)
class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- Cabana do Mistério (Dono: ${this.dono}) ---`);
        this.#funcionarios.forEach(f => {
            console.log(`Funcionário: ${f.nome} | Cargo: ${f.cargo}`);
        });
    }
}

const meuDiario = new DiarioMisterioso(3);
meuDiario.anotar('Gnomo de Jardim', 2);
meuDiario.anotar('Homem-Minotauro', 5);
meuDiario.exibirFichas();

const dipper = new Funcionario('Dipper Pines', 'Investigador de Mistérios');
const mabel = new Funcionario('Mabel Pines', 'Atendente de Souvenirs');

const cabana = new CabanaDoMisterio('Stan Pines');
cabana.contratar(dipper);
cabana.contratar(mabel);
cabana.abrirAsPortas();
