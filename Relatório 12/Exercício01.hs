-- 1. Tipo Cafe com campos posicionais (nome, preço e intensidade)
data Cafe = Cafe String Double Int

-- 2. Retorna a descrição (nome e preço)
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

-- 3. Retorna a força do café baseada na intensidade usando Guards
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

-- 4. Calcula o preço com ou sem leite usando if then else
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

-- 5. Função main para testes
main :: IO ()
main = do
  -- Três cafés em diferentes faixas de intensidade
  let cafeSuave       = Cafe "Café Suave" 5.0 3
  let cafeEquilibrado = Cafe "Café Leblanc" 7.5 6
  let cafeForte       = Cafe "Café Express" 9.0 9

  -- Exibindo descrição e força
  putStrLn (descrever cafeSuave ++ " (" ++ forca cafeSuave ++ ")")
  putStrLn (descrever cafeEquilibrado ++ " (" ++ forca cafeEquilibrado ++ ")")
  putStrLn (descrever cafeForte ++ " (" ++ forca cafeForte ++ ")")

  putStrLn "--- Pedidos ---"
  -- Preço do Café Leblanc com leite e sem leite
  putStr "Preço com leite: R$ "
  print (precoDoPedido True cafeEquilibrado)
  
  putStr "Preço sem leite: R$ "
  print (precoDoPedido False cafeEquilibrado)
