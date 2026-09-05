package main

import "fmt"

func gerarEscalaPlantao(n int) {
	fmt.Println("\n--- Escala de Plantao Tecnico ---")
	
	dia := 1
	for i := 1; i <= n; i++ {
		fmt.Printf("Plantao %d: Dia %d do mes\n", i, dia)
		dia += 4
	}
}

func main() {
	var plantao int

	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scan(&plantao)

	gerarEscalaPlantao(plantao)
}
