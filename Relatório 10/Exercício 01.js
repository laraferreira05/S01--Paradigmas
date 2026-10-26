class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }
    get vida (){
        return this.#vida;
    }
    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
    }

    // Método de ataque genérico
    atacar(alvo) {
        console.log(`${this.apelido} atacou ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }

}
class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial); // fixa o tipo como 'Água'
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Pistola d'Água em ${alvo.apelido}!`);
        alvo.sofrerDano(20); // Squirtle causa 20 de dano
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial); // fixa o tipo como 'Planta'
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Cipó em ${alvo.apelido}!`);
        alvo.sofrerDano(15); // Bulbasaur causa 15 de dano
    }
}
// Instanciação (Bulbasaur deve começar com 30 de vida, e o Squirtle com a vida que escolheres)
const meuSquirtle = new Squirtle('Squirtry', 50);
const meuBulbasaur = new Bulbasaur('Bulby', 30);

// Bulbasaur ataca o Squirtle uma vez
meuBulbasaur.atacar(meuSquirtle);

// Squirtle ataca o Bulbasaur duas vezes
meuSquirtle.atacar(meuBulbasaur);
meuSquirtle.atacar(meuBulbasaur);

// Imprimir a vida usando o getter
console.log(`Vida final Squirtle: ${meuSquirtle.vida}`);
console.log(`Vida final Bulbasaur: ${meuBulbasaur.vida}`);
