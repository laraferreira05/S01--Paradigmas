use std::io::{self, Write};

fn imprimir_terminados_em(digito: i32,limite_inferior: i32, limite_superior: i32) {

    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {

    print!("Digite o digito final desejado (0 a 9): ");
    io::stdout().flush().unwrap();
    let mut ent1 = String::new();
    io::stdin().read_line(&mut ent1).unwrap();
    let numero: i32 = ent1.trim().parse().unwrap_or(0);

    print!("Digite o limite inferior: ");
    io::stdout().flush().unwrap();
    let mut ent2 = String::new();
    io::stdin().read_line(&mut ent2).unwrap();
    let inferior: i32 = ent2.trim().parse().unwrap_or(0);

    print!("Digite o limite superior: ");
    io::stdout().flush().unwrap();
    let mut ent3 = String::new();
    io::stdin().read_line(&mut ent3).unwrap();
    let superior: i32 = ent3.trim().parse().unwrap_or(0);


    println!("---Numeros no intervalo terminados em {} --- ",numero);
    imprimir_terminados_em(numero, inferior, superior);
 
}
