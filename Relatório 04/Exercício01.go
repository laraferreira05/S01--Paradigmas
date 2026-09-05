package main
import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string){

	if len(codigo) == 10 {
		return true, "Código de rastreio registrado no sistema!"
	}else{
		return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
	}
}
func main() {

	var codigo string
	valido := false
	var mensagem string

	for valido == false {
		
		fmt.Print("Digite o código de rastreio: ")
		fmt.Scanln(&codigo)
		valido, mensagem = ValidarCodigoRastreio(codigo)

		if valido {
			fmt.Println(mensagem)
		} else {
			fmt.Println(mensagem)
		}
	}
}
