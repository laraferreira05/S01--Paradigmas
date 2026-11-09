-- 1. Tipo Etapa com deriving (Show, Eq)
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

-- 2. Tipo Atendimento com campos nomeados
data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

-- 3. Retorna a descrição formatada usando show para a etapa
descrever :: Atendimento -> String
descrever a =
  cliente a ++ " | Serviço: " ++ servico a ++ " | Etapa: " ++ show (etapa a)

-- 4. Retorna uma cópia atualizada com a etapa Concluido
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

-- 5. Calcula o valor arrecadado (filtra Concluido com lambda, faz map do valor e soma)
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

-- 6 e 7. Função main para testes
main :: IO ()
main = do
  -- Lista original (nenhum concluído)
  let a1 = Atendimento { cliente = "Sem Rosto", servico = "Banho de Ervas", valor = 150.0, etapa = NaFila }
  let a2 = Atendimento { cliente = "Deus do Rio", servico = "Limpeza Profunda", valor = 500.0, etapa = NoBanho }
  let a3 = Atendimento { cliente = "Espírito Radis", servico = "Massagem", valor = 80.0, etapa = NaFila }

  let listaOriginal = [a1, a2, a3]

  -- Lista nova onde alguns atendimentos foram concluídos
  let listaAtualizada = [concluir a1, a2, concluir a3]

  putStrLn "--- Lista Original ---"
  mapM_ putStrLn (map descrever listaOriginal)
  putStrLn ("Arrecadado (Original): R$ " ++ show (arrecadado listaOriginal))

  putStrLn "\n--- Lista Atualizada ---"
  mapM_ putStrLn (map descrever listaAtualizada)
  putStrLn ("Arrecadado (Atualizada): R$ " ++ show (arrecadado listaAtualizada))
