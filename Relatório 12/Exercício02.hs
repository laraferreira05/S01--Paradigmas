-- 1. Peso máximo suportado pela vassoura
pesoMaximo :: Double
pesoMaximo = 5.0

-- 7. Teste de redefinição (descomentar para ver o erro de compilação):
-- pesoMaximo = 10.0
-- Erro retornado pelo GHC: Multiple declarations of 'pesoMaximo'

-- 2. Tipo Encomenda com campos nomeados (record syntax)
data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

-- 3. Retorna os dados da encomenda lidos com as funções dos campos
descrever :: Encomenda -> String
descrever enc =
  "Destinatário: " ++ destinatario enc ++
  " | Peso: " ++ show (peso enc) ++ "kg" ++
  " | Frete: R$ " ++ show (frete enc)

-- 4. Filtra encomendas com peso <= pesoMaximo usando filter e lambda
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

-- 5. Soma os fretes das encomendas recebidas
totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

-- 6. Função main para testes
main :: IO ()
main = do
  let listaEncomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.0, frete = 15.0 }
        , Encomenda { destinatario = "Tombo", peso = 6.5, frete = 35.0 }
        , Encomenda { destinatario = "Senhora da Cidade", peso = 4.5, frete = 25.0 }
        , Encomenda { destinatario = "Padeiro Fukuo", peso = 8.0, frete = 40.0 }
        ]

  putStrLn "--- Todas as Encomendas ---"
  mapM_ putStrLn (map descrever listaEncomendas)

  let entregaveis = cabemNaVassoura listaEncomendas

  putStrLn "\n--- Encomendas que Cabem na Vassoura ---"
  mapM_ putStrLn (map descrever entregaveis)

  putStrLn "\n--- Total dos Fretes (Válidos) ---"
  print (totalDeFretes entregaveis)
