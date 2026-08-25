function calcularMedia(a, b)
local soma = a + b
return soma/2

end

function encontrarMaior(a, b)
    local maior 
    if a > b then 
        maior = a
    elseif b > a then
        maior = b
    end
 return maior

end

function calcularDiferencaAbsoluta(a, b)
    local diferenca = math.abs(a - b)
return diferenca

end

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
        
    elseif operacao == "maior" then 
        return encontrarMaior(n1, n2)
        
        
    elseif operacao == "diferenca" then 
        return calcularDiferencaAbsoluta(n1, n2)
        end 
end


print("Digite o primeiro número:")
local N1 = tonumber(io.read())

print("Digite o segundo número:")
local N2 =  tonumber(io.read())

print("Digite a operação:")
local operacao = io.read()

local resultado = analisarNumeros(N1, N2, operacao)
print ("Resultado:"..resultado)
