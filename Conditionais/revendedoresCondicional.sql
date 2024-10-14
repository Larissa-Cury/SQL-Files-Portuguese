---- EXERCÍCIO WHERE COM STRINGS  ---

-- Faça a query correta para retornar: 

-- 1) 👉  Todas os revendedores que tenham "bike" no nome ("bike" em qualquer parte)
-- 2) 👉  "Superlative Bikes" e "Optimal Bikes" ("bikes" no final)
-- 3) 👉  Verificar se existem lojam com "bike" no final (sem o plural)
-- 4) 👉  "Bikes and Motorbikes" e "Bike Boutique" ("bikes" no começo)
-- 5) 👉  "Bike World" e "Bike Boutique" (apenas "bike" no começo - sem o plural)


USE AdventureWorksDW2022

SELECT * FROM DimReseller

WHERE ResellerName LIKE ('bike E%')



