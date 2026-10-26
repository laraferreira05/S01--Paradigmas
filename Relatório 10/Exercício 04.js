// Classe base (Contrato simulado via erro)
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} desfere um ataque básico de aura contra ${alvo.nome}.`);
    }
}

// Classes filhas (Herança e Polimorfismo)
class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Intensificador) usa um soco ultra-potente de Ko em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Transmutador) transforma sua aura em eletricidade e choca ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} (Materializador) invoca uma arma de Nen e ataca ${alvo.nome}!`);
    }
}

// Classe Aranha
class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

// Trupe Fantasma (Agregação: recebe aranhas já criadas)
class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhasIniciais = []) {
        this.cidade = cidade;
        this.#aranhas = aranhasIniciais;
    }

    revelarAranhas() {
        console.log(`\n--- Trupe Fantasma avistada em ${this.cidade} ---`);
        this.#aranhas.forEach(aranha => {
            console.log(`Membro #${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}

const feitan = new Aranha('Feitan Portor', 2);
const shalnark = new Aranha('Shalnark', 6);

const trupe = new TrupeFantasma('Yorknew City', [feitan, shalnark]);
trupe.revelarAranhas();

// Buscando a Aranha de número 2 usando .find()
const alvoEncontrado = trupe.buscarAranha(2);

// Array de Usuários de Nen diferentes
const hunters = [
    new Intensificador('Gon Freecss'),
    new Transmutador('Killua Zoldyck'),
    new Materializador('Kurapika')
];

console.log('\n--- Ataque dos Hunters ---');
hunters.forEach(hunter => {
    hunter.atacar(alvoEncontrado);
});
