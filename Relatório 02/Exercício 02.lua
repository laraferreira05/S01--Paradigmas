print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())
local numeros = {}


for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    local quantidade = tonumber(io.read())
    table.insert(numeros, quantidade)
end

print("Digite o numero X a ser buscado:")
local X = tonumber(io.read())

local cont = 0

for i = 1, #numeros do
    if numeros[i] == X then
        cont = cont + 1
    end
end

print("O numero " .. X .. " aparece " .. cont .. " vez(es) na tabela")
