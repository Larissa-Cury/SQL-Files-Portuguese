
-- A partir da tabela FactInternetSales, encontre qual foi a CATEGORIA de produto mais vendida 
-- e a quantidade vendida em dinheiro

USE AdventureWorksDW2022

SELECT 
--	SALES.ProductKey,
--	SALES.SalesAmount,
--	P.ProductSubcategoryKey,
--	SUB_CAT.ProductCategoryKey,
	CAT.EnglishProductCategoryName,
	ROUND(SUM(SALES.SalesAmount),2) AS 'TOTAL'	
FROM FactInternetSales AS SALES
INNER JOIN DimProduct AS P ON P.ProductKey = SALES.ProductKey
INNER JOIN DimProductSubcategory AS SUB_CAT ON SUB_CAT.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN DimProductCategory AS CAT ON CAT.ProductCategoryKey = SUB_CAT.ProductCategoryKey
GROUP BY CAT.EnglishProductCategoryName
ORDER BY TOTAL DESC


SELECT 
--	SALES.ProductKey,
--	SALES.SalesAmount,
--	P.ProductSubcategoryKey,
--	SUB_CAT.ProductCategoryKey,
	CAT.EnglishProductCategoryName,
	ROUND(SUM(SALES.SalesAmount),2) AS 'TOTAL'	
FROM FactInternetSales AS SALES
INNER JOIN DimProduct AS P ON P.ProductKey = SALES.ProductKey
INNER JOIN DimProductSubcategory AS SUB_CAT ON SUB_CAT.ProductSubcategoryKey = P.ProductSubcategoryKey
INNER JOIN DimProductCategory AS CAT ON CAT.ProductCategoryKey = SUB_CAT.ProductCategoryKey
GROUP BY CAT.EnglishProductCategoryName
WITH ROLLUP
ORDER BY TOTAL DESC





