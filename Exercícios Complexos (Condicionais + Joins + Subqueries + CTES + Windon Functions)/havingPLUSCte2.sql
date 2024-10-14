
                             --- SUBQUERIES & CTES ---
-- Agrupar o total de vendas por produto
-- Retornar os TOP 10 produtos com vendas acima da média
-- Trazer o nome dos productos a partir de DimProduct 

-- UTILIZAR: ProductKey e SalesAmount de FactInternetSales 

USE AdventureWorksDW2022;

WITH CTE_1 
AS (
SELECT 
	S.ProductKey,
	SUM(S.SalesAmount) AS SALES
FROM FactInternetSales AS S
GROUP BY S.ProductKey
),
CTE_2 
AS (
	SELECT
		AVG(SALES) AS TOTAL_AVG
	FROM CTE_1
) 
SELECT TOP 10
	CTE_1.ProductKey,
	P.EnglishProductName
FROM CTE_1
INNER JOIN DimProduct AS P ON P.ProductKey = CTE_1.ProductKey
WHERE CTE_1.SALES > (SELECT TOTAL_AVG FROM CTE_2)
ORDER BY CTE_1.SALES DESC





--SELECT TOP 10
--	S.ProductKey,
--	SUM(S.SalesAmount) AS SALES
--FROM FactInternetSales AS S
--GROUP BY S.ProductKey
--HAVING SUM(S.SalesAmount) > (

--		SELECT AVG(SALES_BY_PRODUCT)
--		FROM (
--		SELECT 
--				S.ProductKey,
--				SUM(S.SalesAmount) AS SALES_BY_PRODUCT
--			FROM FactInternetSales AS S
--			GROUP BY S.ProductKey
		
--		) AS TOTAL_AVG
--) ORDER BY SALES DESC
			




