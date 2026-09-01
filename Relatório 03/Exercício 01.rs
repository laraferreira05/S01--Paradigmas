use std::io::{self, Write};

fn validar_placa(placa: &str) -> bool {

    if placa.len() < 7 {
        return false;
    }

    let qtd_maiusculas = placa
        .chars()
        .filter(|c| c.is_ascii_uppercase())
        .count();


    if qtd_maiusculas < 4 {
        return false;
    }

    let qtd_numeros = placa
        .chars()
        .filter(|c| c.is_numeric())
        .count();

    if qtd_numeros < 2 {
        return false;
    }

    true
}

fn main() {
    loop {
        print!("Digite a placa do veiculo: ");
        io::stdout()
            .flush()
            .expect("Falha ao descarregar a tela");

        let mut entrada = String::new();

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler a entrada");

        let placa_limpa = entrada.trim();

        if validar_placa(placa_limpa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Tente novamente!\n");
        }
    }
}
