							-- SUBQUERIES + CTEs --
-- 👉 Retorne apenas os clientes que compraram mais do que a média de compras
-- 👉 Retorne o último name desses clientes (JOIN COM "DimCustomer", trazer LastName) 

-- Utilizar: FactInternetSales 

USE AdventureWorksDW2022;

-- CTE

WITH CTE_1 --- AGRUPAMENTO DOS DADOS PELO CLIENTE
AS (

SELECT
	S.CustomerKey,
	COUNT(S.CustomerKey) AS ORDERS
	FROM FactInternetSales AS S
	GROUP BY S.CustomerKey

),
CTE_2 AS (   --- CALCULA A MÉDIA DE ORDERS
SELECT
	AVG(ORDERS) AS ORDERS_AVG
FROM CTE_1
)
SELECT 
	CTE_1.CustomerKey,
	C.LastName, 
	CTE_1.ORDERS
FROM CTE_1
INNER JOIN DimCustomer AS C ON C.CustomerKey = CTE_1.CustomerKey
WHERE CTE_1.ORDERS > (SELECT CTE_2.ORDERS_AVG FROM CTE_2)



-- HAVING 

--SELECT 
--	S.CustomerKey,
--	C.LastName,
--	COUNT(S.CustomerKey) AS ORDERS_BY_CLIENT
--FROM FactInternetSales AS S
--INNER JOIN DimCustomer AS C ON C.CustomerKey = S.CustomerKey
--GROUP BY S.CustomerKey, C.LastName
--HAVING COUNT(S.CustomerKey) > (

--	 SELECT
--		AVG(ORDERS)
--	 FROM (
--	 SELECT 
--		COUNT(S2.CustomerKey) AS ORDERS
--		FROM FactInternetSales AS S2
--		GROUP BY S2.CustomerKey
--	 ) AS TOTAL_AVG
--)











-- Média (de pedidos por cliente)

--SELECT
--	AVG(ORDERS) AS ORDERS_AVG
--FROM (

--	SELECT
--	COUNT(S.CustomerKey) AS ORDERS
--	FROM FactInternetSales AS S
--	GROUP BY S.CustomerKey

--) AS TOTAL_AVG



















