-- EXERCICIO: RANQUEANDO VENDAS
-- 👉 Ranqueie a coluna TOTAL com e sem pular posições repetidas

-- RANK(): https://learn.microsoft.com/en-us/sql/t-sql/functions/rank-transact-sql?view=sql-server-ver16
-- DENSE_RANK(): https://learn.microsoft.com/en-us/sql/t-sql/functions/dense-rank-transact-sql?view=sql-server-ver16
--              

CREATE TABLE Vendas (
    ANO INT,
	MES INT,
    TOTAL NUMERIC);

INSERT INTO Vendas (ANO, MES, TOTAL)
VALUES (2023, 7, 130),
       (2023, 8 , 150),
	   (2023, 9, 250),
       (2023, 10, 250),
	   (2023, 11, 350),
	   (2023, 12, 250),
	   (2024, 1, 100),
       (2024, 2, 150),
	   (2024, 3, 200),
       (2024, 4, 250),
	   (2024, 5, 350),
	   (2024, 6, 150);

---#
SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL
FROM Vendas;

--- 1) Ranqueie as vendas agrupando por ANO, com intervalos entre os rankings

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	RANK() OVER(
				PARTITION BY ANO
				ORDER BY TOTAL) AS RANKING_1
FROM Vendas;

--- 1) Ranqueie as vendas agrupando por ANO, sem intervalos entre os rankings

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	DENSE_RANK() OVER(
				PARTITION BY ANO
				ORDER BY TOTAL) AS RANKING_2
FROM Vendas;