
--- EXERCÍCIO: RANQUEAMENTO POR DENSE_RANK() ---

-- Retornar TOP 3 produtos de cada categoria -- 
-- Tabela: FactInternetSales (Vendas) 
-- Fazer o JOIN COM: DimProduct (ProductKey); DimProductSubCategory (ProductSubCategoryKey); DimProductCategory (ProductCategoryKey)

USE AdventureWorksDW2022;

WITH RankedSales AS (
SELECT
	S.ProductKey,
	CAT.EnglishProductCategoryName AS ProductCategory,
	SUM(S.SalesAmount) AS TotalSalesAmount,
	DENSE_RANK() OVER(PARTITION BY CAT.EnglishProductCategoryName
				 ORDER BY SUM(S.SalesAmount)) AS RANK_WITHIN_CAT
FROM FactInternetSales AS S
INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey
INNER JOIN DimProductSubCategory AS SUBCAT ON SUBCAT.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN DimProductCategory AS CAT ON CAT.ProductCategoryKey = SUBCAT.ProductCategoryKey
GROUP BY S.ProductKey, CAT.EnglishProductCategoryName
)
SELECT *
FROM RankedSales
WHERE RANK_WITHIN_CAT IN (1,2,3)
ORDER BY ProductCategory,RANK_WITHIN_CAT










































--WITH RankedSales AS (
--    SELECT 
--        S.ProductKey,
--        SUM(S.SalesAmount) AS TotalSalesAmount,  -- Somando as vendas por produto
--        CAT.EnglishProductCategoryName AS ProductCategory,
--        DENSE_RANK() OVER(PARTITION BY CAT.EnglishProductCategoryName 
--					 ORDER BY SUM(S.SalesAmount) DESC) AS RANK_WITHIN_CAT  -- Aplicando ranking com base nas vendas totais
--    FROM FactInternetSales AS S
--    INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey 
--    INNER JOIN DimProductSubCategory AS SUBCAT ON SUBCAT.ProductSubcategoryKey = P.ProductSubcategoryKey
--    INNER JOIN DimProductCategory AS CAT ON CAT.ProductCategoryKey = SUBCAT.ProductCategoryKey
--    GROUP BY S.ProductKey, CAT.EnglishProductCategoryName  -- Agrupando por produto e categoria para obter vendas totais
--)
--SELECT *
--FROM RankedSales
--WHERE RANK_WITHIN_CAT IN (1,2,3)  -- Filtrando os produtos no top 3
--ORDER BY ProductCategory, RANK_WITHIN_CAT;

