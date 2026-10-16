class Persona:
    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} ({self.arcano})")


class Aliado:
    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome


class Lider:
    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")  # Composição: a Persona nasce dentro do líder
        self._equipe = []  # Agregação: lista que vai guardar referências de aliados criados fora

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"Aliado {aliado.codinome} ({aliado.nome}) recrutado para a equipe.")

    def infiltrar(self, palacio: str):
        print(f"\nInfiltrando no Palácio de {palacio}!")
        self.persona.invocar()
        print("Equipe Phantom Thieves:")
        for membro in self._equipe:
            print(f"- Codinome: {membro.codinome} | Nome Real: {membro.nome}")


if __name__ == "__main__":
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")

    # Composição: A Persona (Arsène) é criada diretamente dentro do __init__ do Lider,
    # significando que ela pertence exclusivamente a ele e não existe sem o líder.
    # Agregação: Os Aliados (Ryuji e Ann) são criados fora da classe Lider e apenas
    # adicionados à lista _equipe, existindo de forma independente do líder.
