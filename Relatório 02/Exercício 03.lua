print("Digite a quantidade de elementos(N):")
local N = tonumber(io.read())
local tabela = {}


for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    local quantidade = tonumber(io.read())
    table.insert(tabela, quantidade)
end

print("Digite o valor limite (K):")
local limite = tonumber(io.read())
local cont = 0

function filtrarMaiores(tabela, limite)

    local maior = {}
    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(maior, tabela[i]) 
            cont = cont + 1
        end
    end        
    return maior
end

local resultado = filtrarMaiores(tabela,limite)
print("---Elementos maiores que " .. limite .. " ---")

    for i = 1, #resultado do
    print(resultado[i])
end
