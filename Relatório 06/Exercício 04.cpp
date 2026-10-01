
#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Hobbit {
protected:
    string nome;

public:
    Hobbit(string n) : nome(n) {}

    virtual ~Hobbit() {}

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }
};

class Jardineiro : public Hobbit {
public:
    Jardineiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {
public:
    Cozinheiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {
public:
    Fazendeiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " esta colhendo vegetais e hortaliças em suas terras!" << endl;
    }
};

int main() {
    vector<Hobbit*> hobbits;

    hobbits.push_back(new Jardineiro("Jorge"));
    hobbits.push_back(new Cozinheiro("Alfredo"));
    hobbits.push_back(new Fazendeiro("Joao"));

    cout << " Atividades na Comarca " << endl;

    for (Hobbit* h : hobbits) {
        h->fazerAtividade();
    }

    for (Hobbit* h : hobbits) {
        delete h;
    }

    return 0;
}
