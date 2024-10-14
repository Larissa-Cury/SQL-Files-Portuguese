
-- EXERCICIO: SOMA ACUMULADA DE VENDAS USANDO WINDOW FUNCTIONS
-- 👉 Retorne a soma acumulada de vendas de acordo com o pedido

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

-- 1) YEAR-TO-DATE (Soma acumulada do ano até a linha atual)

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	SUM(TOTAL) OVER(
					PARTITION BY ANO
					ORDER BY ANO, MES ASC
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS YTD
FROM Vendas;

-- 2) Retorne a soma acumulada do BIMESTRE
-- 👉 Soma do mês anterior + o mês atual 

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	SUM(TOTAL) OVER(
					PARTITION BY ANO
					ORDER BY ANO, MES ASC
			ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS BIMESTRE_1
FROM Vendas;

-- 3) Retorne a soma acumulada do BIMESTRE
-- 👉 Soma dos 2 meses anteriores SEM considerar o atual

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	SUM(TOTAL) OVER(
					PARTITION BY ANO
					ORDER BY ANO, MES ASC
			ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS BIMESTRE_2
FROM Vendas;

-- 4) Retorne a soma acumulada do TRIMESTRE
-- 👉 Soma dos 3 meses anteriores SEM considerar o atual

SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	SUM(TOTAL) OVER(
					PARTITION BY ANO
					ORDER BY ANO, MES ASC
			ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING) AS TRIMESTRE
FROM Vendas;

-- 5) Retorne a soma acumulada do SEMESTRE
-- 👉 Soma dos 6 meses anteriores SEM considerar o atual


SELECT 
    ANO, MES, 
    FORMAT(TOTAL, 'C0') AS TOTAL,
	SUM(TOTAL) OVER(
					PARTITION BY ANO
					ORDER BY ANO, MES ASC
			ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS SEMESTRE
FROM Vendas;

SELECT
SUM(TOTAL)
FROM Vendas
GROUP BY ANO