-- 1. Tipo Esboco com campos nomeados
data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

-- 2. Identifica o esboço mais recente utilizando Pattern Matching
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno de esboços está vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"

-- 3. Conta o total de esboços via recursão (sem utilizar length)
contarEsbocos :: [Esboco] -> Int
contarEsbocos []       = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

-- 4. Soma as horas trabalhadas via recursão (sem sum/map)
horasDesenhando :: [Esboco] -> Int
horasDesenhando []       = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

-- 5, 6 e 7. Função main para testes
main :: IO ()
main = do
  let cadernoOriginal =
        [ Esboco { titulo = "Ruínas Antigas", tecnica = "Nanquim", horas = 5 }
        , Esboco { titulo = "Criatura das Sombras", tecnica = "Carvão", horas = 3 }
        , Esboco { titulo = "Floresta Obscura", tecnica = "Grafite", horas = 2 }
        ]

  putStrLn "--- Caderno Original ---"
  putStrLn (esbocoMaisRecente cadernoOriginal)
  putStrLn ("Total de esboços: " ++ show (contarEsbocos cadernoOriginal))
  putStrLn ("Total de horas: " ++ show (horasDesenhando cadernoOriginal))

  putStrLn "\n--- Caderno Vazio ---"
  putStrLn (esbocoMaisRecente [])

  -- 6. Inserção imutável de um novo esboço na frente
  let novoEsboco = Esboco { titulo = "Dragão de Cinzas", tecnica = "Nanquim", horas = 6 }
  let cadernoAtualizado = novoEsboco : cadernoOriginal

  putStrLn "\n--- Comparação de Imutabilidade ---"
  putStrLn ("Novo Caderno -> " ++ esbocoMaisRecente cadernoAtualizado ++ " | Total: " ++ show (contarEsbocos cadernoAtualizado))
  putStrLn ("Caderno Anterior -> " ++ esbocoMaisRecente cadernoOriginal ++ " | Total: " ++ show (contarEsbocos cadernoOriginal))

  -- 7. Teste do erro com head em lista vazia:
  -- putStrLn (titulo (head []))
  -- Erro em tempo de execução: Exception: Prelude.head: empty list
