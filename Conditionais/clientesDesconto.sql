
                                      -- Exercício SELECIONANDO CLIENTES PARA DESCONTO -- 
-- Exercício de prática de condicional (WHERE)
-- Imagine que a empresa quer oferecer um desconto a um público de clientes que cumpra as seguintes condições:

-- 📌 Apenas clientes que informaram o nome do meio (MiddleName)
-- 📌 Desses clientes, apenas os quem têm Graduação OU Mestrado/Doutorado - graduate degree (EnglishEducation) - Utilize IN
-- 📌 Selecione apenas os clientes que nasceram na década de 80 (BirthDate), que ganhem igual ou mais do que USD 50.0000 por ano (YearlyIncome) 
-- 📌 Selecione os clientes que têm 1 ou 2 carros (NumberCarsOwned) - Utilize OR - e que não sejam casados (MaritalStatus)  - Utilize apenas expressões matemáticas
-- 📌 Por fim, selecione os que fizeram a primeira compra entre 2013 e 2012 (DateFirstPurchase)
-- 📌 Ordene o dataset pela data da compra (+ antiga para mais nova)

-- Procedência de operadores: https://help.claris.com/pt/sql-reference/content/operator-precedence.html

USE AdventureWorksDW2022

 --Para inspecionar os dados -- 
 -- SELECT * FROM DimCustomer

--SELECT COLUMN_NAME, DATA_TYPE
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'DimCustomer'

-- Exercício:

SELECT 

FirstName,
MiddleName,
LastName,
BirthDate,
MaritalStatus,
YearlyIncome,
EnglishEducation,
NumberCarsOwned,
DateFirstPurchase

FROM DimCustomer
WHERE
	MiddleName IS NOT NULL
	AND EnglishEducation IN ('Bachelors', 'Graduate Degree')
	AND  BirthDate BETWEEN '1980-01-01' AND '1989-12-31' AND YearlyIncome >= 50000
	AND (NumberCarsOwned = 1 OR NumberCarsOwned = 2) AND MaritalStatus <> 'M'
	AND  DateFirstPurchase BETWEEN '2012-01-01' AND '2013-12-31'

ORDER BY DateFirstPurchase ASC



	

	
	
