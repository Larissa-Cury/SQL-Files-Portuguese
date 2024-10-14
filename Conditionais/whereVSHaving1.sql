
--- GROUP BY + HAVING X WHERE --- 

--- 1) Selecionar clientes que fizeram mais de 50 pedidos --
--  2) Identificar produtos que tiveram uma média de vendas maior que 3000.

-- 👉 WHERE é usado para filtrar linhas ANTES da agregação.
-- 👉 HAVING é usado para filtrar valores APÓS a agregação.

--> EVALUATION ORDER: FROM > JOIN > WHERE > GROUP BY > HAVING > SELECT > ORDER BY 
--> https://learn.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15#logical-processing-order-of-the-select-statement

USE AdventureWorksDW2022

-- 1) Identificar Clientes que Fizeram Mais do que 50 Pedidos (i.e, Count > 50)

SELECT
	S.CustomerKey,
	COUNT(CustomerKey) AS ORDERS
FROM FactInternetSales AS S
GROUP BY S.CustomerKey
HAVING COUNT(CustomerKey) > 50


-- 2) Identificar produtos que tiveram uma média de vendas maior que 3000.

SELECT
	S.ProductKey,
	AVG(SalesAmount) AS SALES
FROM FactInternetSales AS S
GROUP BY S.ProductKey
HAVING AVG(SalesAmount) > 3000








-----
-- 1) Identificar Clientes que Fizeram Mais do que 50 Pedidos (i.e, Count > 50)

--SELECT 
--	S.CustomerKey,
--	COUNT(S.CustomerKey) AS ORDERS
--FROM FactInternetSales AS S
--GROUP BY S.CustomerKey
--HAVING COUNT(S.CustomerKey) > 50

---- 2) Identificar produtos que tiveram uma média de vendas maior que 3000.

--SELECT 
--  S.ProductKey,
--  AVG(S.SalesAmount)
--FROM FactInternetSales AS S
--GROUP BY (ProductKey)
--HAVING AVG(S.SalesAmount) > 3000








