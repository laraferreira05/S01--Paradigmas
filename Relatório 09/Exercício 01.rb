class CoquetelAfterlife
    attr_reader :nome
  
    def initialize(nome, preco)
      @nome = nome
      @preco = preco
    end
  
    def preco
      @preco
    end
  
    def preco=(valor)
      if valor >= 5 && valor <= 200
        @preco = valor
      else
        puts "Preço inválido!"
      end
    end
  
    def ficha
      "Drink: #{@nome} | Preço: R$ #{preco}"
    end
  end
  
  class DrinkDeLenda < CoquetelAfterlife
    attr_reader :lenda
  
    def initialize(nome, preco, lenda)
      super(nome, preco)
      @lenda = lenda
    end
  
    def ficha
      "#{super} | Homenagem: #{@lenda}"
    end
  end
  
  cardapio = [
    CoquetelAfterlife.new("Jackie Wells", 50),
    DrinkDeLenda.new("Johnny Silverhand", 120, "Johnny Silverhand"),
    DrinkDeLenda.new("David Martinez", 90, "David Martinez")
  ]
  
  cardapio.each do |drink|
    puts drink.ficha
  end
  
  drink_lenda = cardapio[1]
  drink_lenda.preco = 500
  drink_lenda.preco = 80
  puts drink_lenda.ficha
  
  # Descomente a linha abaixo para observar o erro de método indefinido (undefined method `nome='):
  # drink_lenda.nome = "Novo Nome"
