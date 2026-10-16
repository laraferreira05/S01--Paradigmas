class HeroiOverwatch:
    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> usou uma habilidade suprema genérica.")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"<{self.codinome}> ativou a suprema de Tanque: bloqueando dano massivo para a equipe!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"<{self.codinome}> ativou a suprema de Suporte: concedendo invulnerabilidade geral!")

    def curar_equipe(self):
        print(f"<{self.codinome}> está curando os aliados ao redor.")


if __name__ == "__main__":
    heroi_base = HeroiOverwatch("Soldado Genérico", "Dano")
    tanque = HeroiTanque("Reinhardt", "Tanque")
    suporte = HeroiSuporte("Mercy", "Suporte")

    time: list[HeroiOverwatch] = [heroi_base, tanque, suporte]

    for heroi in time:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
        print("-" * 30)
