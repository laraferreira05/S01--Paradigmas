// Parte composta (Composição)
class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

// Classe base (Contrato e Composição)
class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error("O método 'usarHabilidade()' deve ser implementado pelas subclasses.");
    }

    entrarEmCombate() {
        console.log(`Agente: ${this.codinome} | Pistola: ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

// Classes filhas (Herança e Sobrescrita)
class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return "Usa Fumaça para bloquear a visão inimiga.";
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return "Usa Flecha de Reconhecimento para revelar posições.";
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return "Usa Teleporte para entrar agressivamente no bombed site.";
    }
}

// Classe de Agregação
class Esquadrao {
    #agentes;

    constructor(nome, agentesIniciais = []) {
        this.nome = nome;
        this.#agentes = agentesIniciais;
    }

    iniciarPartida() {
        console.log(`\n=== ESQUADRÃO ${this.nome} INICIA A PARTIDA! ===`);
        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

const omen = new Controlador('Omen', 'Ghost');
const viper = new Controlador('Viper', 'Sheriff');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett', 'Ghost');

const esquadraoValorant = new Esquadrao('Alpha', [omen, viper, sova, jett]);
esquadraoValorant.iniciarPartida();

console.log('\nControladores Ativos no Esquadrão:');
esquadraoValorant.listarControladores().forEach(c => {
    console.log(`- ${c.codinome}`);
});
