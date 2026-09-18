#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    void setNome(string n) {
        nome = n;
    }

    string getNome() {
        return nome;
    }

    void setArcana(string a) {
        arcana = a;
    }

    string getArcana() {
        return arcana;
    }

    void setRank(int r) {
        rank = r;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    LinkSocial link;

    link.setNome("Ryuji Sakamoto");
    link.setArcana("Chariot");
    link.setRank(1);

    cout << "=== DADOS INICIAIS DO LINK SOCIAL ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl << endl;

    link.subirRank();

    cout << "=== DADOS APOS SUBIR DE RANK ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Novo Rank: " << link.getRank() << endl;

    return 0;
}
