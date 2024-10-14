 
 -- INSPECIONANDO TABELAS A PARTIR DO INFORMATION_SCHEMA --
 
 -- 👉 Inspecione o nome das colunas e o tipo de dados das tabelas:
    --> DimCustomer, DimEmployee

 -- Informações extra: https://learn.microsoft.com/pt-br/sql/relational-databases/system-information-schema-views/columns-transact-sql?view=sql-server-ver16
 -- Informações extra (tipos de dados em SQL): https://learn.microsoft.com/pt-br/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16#exact-numerics)

USE AdventureWorksDW2022
 
SELECT COLUMN_NAME, DATA_TYPE

FROM INFORMATION_SCHEMA.COLUMNS -- Sintaxe: INFORMATION_SCHEMA.view_name

WHERE TABLE_NAME = 'DimEmployee'