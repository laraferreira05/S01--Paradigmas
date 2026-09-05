package main

import "fmt"

func main() {
	var n1, n2, n3 int

	fmt.Print("\nDigite as vendas do 1º trimestre: ")
	fmt.Scan(&n1)

	fmt.Print("\nDigite as vendas do 2º trimestre: ")
	fmt.Scan(&n2)

	fmt.Print("\nDigite as vendas do 3º trimestre: ")
	fmt.Scan(&n3)

	soma := n1 + n2 + n3

	fmt.Println("\nTotal de vendas:", soma)

	switch {
	case soma >= 250:
		fmt.Println("Classificacao: Top Seller")
	case soma >= 180:
		fmt.Println("Classificacao: Senior")
	case soma >= 100:
		fmt.Println("Categoria: Pleno")
	default:
		fmt.Println("Meta minima anual nao atingida!")
	}
}
