from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo: str):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome: str, modelo_deck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_deck)  # Composição

    def executar_invasao(self):
        print(f"Netrunner {self.nome} usando o cyberdeck {self.cyberdeck.modelo} está quebrando o gelo (ICE) de um servidor.")


class DroneDeVigilancia(IUnidadeDeRede):
    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} está interceptando o sinal da rede.")


class CelulaHacker:
    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros  # Agregação

    def iniciar_ataque(self):
        print(f"\nIniciando ataque da célula hacker: {self.nome}")
        for membro in self.membros:
            membro.executar_invasao()


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Militech Berserk")
    drone = DroneDeVigilancia("DRN-09")

    celula = CelulaHacker("Maelstrom Hackers", [netrunner, drone])
    celula.iniciar_ataque()

