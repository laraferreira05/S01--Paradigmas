class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail enviado para o passado: '#{mensagem}'"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Membro LabMem ##{membro.numero} (#{membro.nome}) admitido!"
  end

  def experimento(mensagem)
    puts "Membros presentes:"
    @membros.each do |membro|
      puts "- LabMem ##{membro.numero}: #{membro.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new("001", "Okabe Rintarou")
mayuri = MembroDoLab.new("002", "Shiina Mayuri")

lab = LaboratorioDeGadgets.new
lab.admitir(okabe)
lab.admitir(mayuri)

lab.experimento("El Psy Kongroo")

# Composição: O objeto PhoneWave é criado dentro do LaboratorioDeGadgets (@phonewave = PhoneWave.new), existindo apenas dentro dele.
# Agregação: Os objetos MembroDoLab são criados fora e passados por parâmetro (admitir), continuando a existir mesmo sem o laboratório.
