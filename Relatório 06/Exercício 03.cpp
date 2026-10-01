#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
protected:
    string nome; 

public:
    MembroInatel(string n) : nome(n) {}
    virtual ~MembroInatel() {}
    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }
};
class Aluno : public MembroInatel {
private:
    string curso;

public:
    Aluno(string n, string c) : MembroInatel(n), curso(c) {}

   
    void seApresentar() override {
        cout << "Meu nome e " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};


class Professor : public MembroInatel {
private:
    string disciplina;

public:
    Professor(string n, string d) : MembroInatel(n), disciplina(d) {}
    void seApresentar() override {
        cout << "Meu nome e " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    Aluno aluno1("Lara", "Engenharia de Software");
    Professor prof1("Ruan", "Paradigmas");
    cout << "=== Apresentacoes ===" << endl;
    aluno1.seApresentar();
    prof1.seApresentar();

    return 0;
}
