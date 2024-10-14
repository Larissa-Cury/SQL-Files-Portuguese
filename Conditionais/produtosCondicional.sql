
                                        -- SELECIONAR PRODUTOS CONDICIONALMENTE --
-- EXERCÍCIO WHERE CONDICIONAL COM STRINGS (LIKE) --

-- 👉 Retornar apenas produtos que comecem com "Flat" (EnglishProductName)
-- 👉 Retornar apenas produtos que terminem com "Race" (EnglishProductName)
-- 👉 Retornar apenas produtos que terminem com "Nut" e tenham 2 characteres depois (EnglishProductName)
-- 👉 Retornar apenas produtos que terminem com "Nut" e tenham 3 characteres depois (EnglishProductName)
-- 👉 Retornar apenas produtos que terminem com "Nut" e tenham 5 characteres antes (EnglishProductName)
-- 👉 Retornar apenas produtos que tenham "Touring" em qualquer posição (EnglishProductName)
-- 👉 Retornar produtos que comecem "ML" ou "LL" + "Mountain Handlebars" (EnglishProductName)
-- 👉 Retornar produtos que tenham "Mountain-200 Silver OU Black" em qualquer posição (EnglishProductName)

USE AdventureWorksDW2022

SELECT 
	ProductKey,
	EnglishProductName
FROM DimProduct

WHERE 
	EnglishProductName LIKE ('%Mountain-200 [Silver Black]%')







