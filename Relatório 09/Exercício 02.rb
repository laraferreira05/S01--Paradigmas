class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Este método deve ser implementado nas classes filhas."
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) conduz a melodia principal tocando '#{peca}'."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} (#{instrumento}) acompanha o ritmo do solista tocando '#{peca}'."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "Regente #{@nome} conduzindo a peça: '#{peca}'"
    @orquestra.each do |musico|
      musico.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map do |musico|
      "#{musico.class}: #{musico.nome}"
    end
  end
end

kousei = Solista.new("Kousei Arima", "Piano")
kaori = Acompanhador.new("Kaori Miyazono", "Violino")
maestro = Regente.new("Maestro Hiroko")

maestro.convocar(kousei)
maestro.convocar(kaori)

maestro.reger("Ballade No. 1 em Sol Menor")

maestro.escalacao.each do |texto|
  puts texto
end

instr = Instrumentista.new("Músico Genérico", "Flauta")
# Descomente a linha abaixo para observar o erro (NotImplementedError):
# instr.interpretar("Música")
