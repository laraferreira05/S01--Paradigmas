#include <iostream>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {

    float total = 1.0;
    for(int i = 0; i < tamanho; i++) {
        total = total * probabilidades[i];
    }
    return total;
}

int main() {

    int N;
    float P[100];
    cout << "Digite a quantidade de componentes do sistema: "<< endl;
    cin >> N;


    for(int i = 0; i < N;i++){
        cout <<"Digite a probabilidade do componente: " << i+1 << endl;
        cin >> P[i];
    }

    
    float resultado = calcular_confiabilidade_sistema(P, N);
    cout << "Confiabilidade total do sistema: " << resultado << "  (" << resultado * 100  << "%)" << endl;

   
    return 0;
}
