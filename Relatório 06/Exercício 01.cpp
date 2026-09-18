#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << "A banda '" << nome << "' esta duelando contra a banda '" << rival.nome << "'!" << endl;
        rival.energia -= potenciaSom;
    }
};

int main() {
    Banda banda1;
    Banda banda2;

    banda1.nome = "Iron Maiden";
    banda1.integrantes = 6;
    banda1.potenciaSom = 35.5;
    banda1.energia = 100;

    banda2.nome = "Metallica";
    banda2.integrantes = 4;
    banda2.potenciaSom = 40.0;
    banda2.energia = 100;

    cout << "=== STATUS INICIAL ===" << endl;
    cout << banda1.nome << " - Energia: " << banda1.energia << endl;
    cout << banda2.nome << " - Energia: " << banda2.energia << endl << endl;

    cout << "=== O DUELO COMECOU! ===" << endl;
    banda1.duelar(banda2);

    cout << "\n=== STATUS APOS O DUELO ===" << endl;
    cout << banda1.nome << " - Energia: " << banda1.energia << endl;
    cout << banda2.nome << " - Energia restante: " << banda2.energia << endl;

    return 0;
}
