
--- EXERCÍCIO SUBQUERIES COM HAVING --- 

--  👉 Identificar TOP 10 produtos que tiveram uma média de vendas maior a média de vendas
--  👉 Trazer o nome dos produtos (JOIN COM DimProduct por ProductKey)

-- Utilizar tabela: FactInternetSales, colunas: SalesAmount e ProductKey

USE AdventureWorksDW2022

-- Descobrir qual é a média de vendas 

--SELECT 
--	AVG(SalesAmount) AS AVG_SALES
--FROM FactInternetSales AS S

-- TOP 10 produtos que tiveram uma média de vendas maior a média de vendas

--SELECT TOP 10
--	S_2.ProductKey,
--	AVG(S_2.SalesAmount) AS AVG_SALES_BY_PRODUCT
--FROM FactInternetSales AS S_2
--GROUP BY S_2.ProductKey
--HAVING AVG(S_2.SalesAmount) > 486.0869  --- hard coding 

--- UTILIZAR UMA SUBQUERY

SELECT TOP 10
	S_3.ProductKey,
	P.EnglishProductName,
	AVG(S_3.SalesAmount) AS AVG_SALES_BY_PRODUCT
FROM FactInternetSales AS S_3
INNER JOIN DimProduct AS P ON P.ProductKey = S_3.ProductKey
GROUP BY S_3.ProductKey, P.EnglishProductName
HAVING AVG(S_3.SalesAmount) > (
			SELECT 
				AVG(SalesAmount) AS AVG_SALES
			FROM FactInternetSales AS S
) ORDER BY AVG_SALES_BY_PRODUCT DESC


SELECT TOP 10
	S_3.ProductKey,
	P.EnglishProductName,
	AVG(S_3.SalesAmount) AS AVG_SALES_BY_PRODUCT
FROM FactInternetSales AS S_3
INNER JOIN DimProduct AS P ON P.ProductKey = S_3.ProductKey
GROUP BY S_3.ProductKey, P.EnglishProductName
HAVING AVG(S_3.SalesAmount) > (
			SELECT 
				AVG(SalesAmount) AS AVG_SALES
			FROM FactInternetSales AS S
) 




































SELECT
	AVG(S.SalesAmount) AS AVG_SALES
FROM FactInternetSales AS S

-- Resultado: 486.0869

-- 

SELECT TOP 10
	S_2.ProductKey,
	AVG(S_2.SalesAmount) AS AVG_SALES_BY_PRODUCT
FROM FactInternetSales AS S_2
GROUP BY S_2.ProductKey
HAVING AVG(S_2.SalesAmount) > 486.0869
ORDER BY AVG_SALES_BY_PRODUCT DESC

--- 

SELECT TOP 10
	S_3.ProductKey,
	AVG(S_3.SalesAmount) AS AVG_SALES_BY_PRODUCT
FROM FactInternetSales AS S_3
GROUP BY S_3.ProductKey
HAVING AVG(S_3.SalesAmount) > (

		SELECT
			AVG(S.SalesAmount) AS AVG_SALES
		FROM FactInternetSales AS S

)
ORDER BY AVG_SALES_BY_PRODUCT DESC















--SELECT TOP 10
--  S.ProductKey,
--  AVG(S.SalesAmount) AS AVG_SALES
--FROM FactInternetSales AS S
--GROUP BY (ProductKey)
--HAVING AVG(S.SalesAmount) > (

--	SELECT
--		AVG(S_2.SalesAmount)
--	FROM FactInternetSales AS S_2

--) 
--ORDER BY AVG_SALES DESC











