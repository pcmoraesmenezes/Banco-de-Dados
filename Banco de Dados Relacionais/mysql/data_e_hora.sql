# FUNÇÕES DE DATA E HORA

SELECT CURDATE(); -- DATA CORRENTE

SELECT CURDATE() AS "Data Atual"; -- DATA CORRENTE EXIBIDA COMO DATA ATUAL

SELECT CURTIME() AS "Hora Atual"; -- HORA ATUAL

SELECT CURRENT_TIME() AS "Hora Atual"; -- FAZ O MESMO QUE O CURTIME

-- DATA_ADD(DATA, INTERVALO)

SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY) AS "Adicionando 3 dias ao dia atual";

SELECT DATE_ADD(CURDATE(), INTERVAL 3 MONTH) AS "Adicionando 3 meses ao dia atual";

SELECT DATE_ADD(CURDATE(), INTERVAL 3 YEAR) AS "Adicionando 3 anos ao dia atual";

-- DATE_SUB PARA SUBTRAIR, MESMO CONCEITO DO ANTERIOR

SELECT DATE_SUB(CURDATE(), INTERVAL 3 DAY) AS "Removendo 3 dias ao dia atual";

SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AS "Removendo 3 meses ao dia atual";

SELECT DATE_SUB(CURDATE(), INTERVAL 3 YEAR) AS "Removendo 3 Anos ao dia atual";

-- DATEDIFF

SELECT DATEDIFF(CURDATE(), DATE_SUB(CURDATE(), INTERVAL 3 DAY)); -- CALCULANDO A DIFERENÇA DA DATA ATUAL PARA A DATA DE 3 DIAS ATRAS

-- DATE_FORMAT 

SELECT DATE_FORMAT(CURDATE(), '%d/%m/%Y') AS "Data_Atual"; -- y maiusculo faz exibir data no formato xxxx ja o y minusculo no formato xx


-- DAYNAME

SELECT DAYNAME(CURDATE()) AS "Dia da Semana" -- Retorna o dia da semana

-- DAYOFMONTH

SELECT DAYOFMONTH(CURDATE()) AS "Dia do Mês" -- Retorna o dia do mês

-- DAYOFWEEK

SELECT DAYOFWEEK(CURDATE()) AS "Dia da Semana" -- Retorna o dia da semana em formato de numero

-- DAYOFYEAR

SELECT DAYOFYEAR(CURDATE()) AS "Dia do Ano" -- Exibe o dia do ano, x/365 ou x/366(bissexto)


-- FROM_DAYS

SELECT FROM_DAYS(790000) AS "DATA REAL"; 

-- NOW 

SELECT NOW() -- RETORNA A DATA E HORA ATUAL



-- FORMATANDO 

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %h:%m:%s') AS "Data/Hora"




















    