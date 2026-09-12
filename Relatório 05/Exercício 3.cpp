#include <iostream>
using namespace std;

int main() {
    float cap;
    float peso = 0.0;
    int op = 0; 

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> cap;

    while(op != 4) {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> op; 

        if(op == 1) {
            cout << "Carga atual: " << peso << "/" << cap << endl;
            cout << "Espaco Disponivel: " << cap - peso << " kg" << endl;
        }
        else 
         if(op == 2) {

        float pacote;
        cout << "Digite o peso do pacote a ser carregado (kg): " << endl;
        cin >> pacote;

        if((peso + pacote) > cap){
            cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
        }else{
            peso = peso + pacote;
            cout << "Pacote adicionado com sucesso!" << endl;
          }
        } 
        else
         if(op == 3) {
            float pacote;
            cout << "Digite o peso do pacote a ser removido (kg): " << endl;
            cin >> pacote;
            if((peso - pacote) < 0){
            cout << "Alerta: Peso minimo de decolagem excedido! Operacao cancelada." << endl;
        }else{
            peso = peso - pacote;
            cout << "Pacote removido com sucesso!" << endl;
         }
        }
    }

    return 0;
}
