module Depoente
  def depor
    raise NotImplementedError, "Implementar depor na classe que usar o módulo"
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado(a) pela Scotland Yard!"
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} (Testemunha): 'Eu vi um homem alto correndo no beco às 22h!'"
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def depor
    puts "#{nome} (Suspeito): 'Eu estava no pub o tempo todo!'"
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "Caso: #{@caso}"
    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    detidos = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detidos.each(&:ser_detido)
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Sebastian Moran")
suspeito2 = SuspeitoDoCrime.new("James Moriarty")

investigacao = Investigacao.new("O Estudo em Vermelho")
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
