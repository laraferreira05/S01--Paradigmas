use std::io::{self, Write};

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    if (palpite - numero_secreto).abs() <= 5 {
        return true;
    }

    return false;
}

fn main() {
    let numero_secreto: i32 = 20;

    loop {
        print!("Digite seu palpite: ");
        io::stdout()
            .flush()
            .expect("Falha ao descarregar a tela");

        let mut entrada = String::new();

        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler a entrada");

        let palpite: i32 = entrada
            .trim()
            .parse()
            .expect("Digite um numero valido");

        if acertou_o_alvo(palpite, numero_secreto) {
            let distancia = (palpite - numero_secreto).abs();

            println!(
                "Voce acertou! Ficou a apenas {} unidades do numero secreto!",
                distancia
            );

            break;
        } else {
            println!("Você passou longe! Tente novamente.");
        }
    }
}
