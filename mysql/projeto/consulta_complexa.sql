USE farmacia;

# Consulta Complexa

SELECT * FROM compras -- Exibindo todas as compras 

SELECT com.id AS 'Id Compra', cli.nome AS 'Cliente', com.data_compra AS 'Data Compra' FROM compras AS com, cliente cli
WHERE com.id_cliente = cli.id; -- Exibindo o nome dos clientes e a data da compra

SELECT * FROM produtos_compra; -- 4 colunas na tabela, id, id_produto (foreign key de produto), id_compra (foreign key de compra) e tem quantidade
-- Se a gente somente exibir a tabela produtos_compra não teremos nenhuma informação sobre o cliente, ou sobre a compra em si, teremos apenas referencias
-- de onde as informações estão contidas!

SELECT proc.id AS "Produto Compra ",
	com.id AS "Compra",
	prod.produto AS "Produto",
	prod.preco_venda AS "Preço",
	proc.quantidade AS "Quantidade"
	-- Explicação até aqui! Ocorre uma seleção de 5 colunas, seleciona-se o campo produtos_compra usando um apelido "Produto Compra" e o mesmo para as 
	-- Outras colunas, esse trecho de consulta é somente para definição das tabelas que serão exibidas.
	FROM produtos_compra AS proc, produtos AS prod, compras AS com WHERE -- AQUI TEMOS DE ONDE A SELEÇÃO OCORRE, OU SEJA DE QUAL TABELA ESTAMOS FAZENDO AS
	-- SELEÇÕES
	-- TEM-SE SELECIONADO ATÉ ENTÃO O ID DO PRODUTO E O ID DA COMRPA(COM.ID, PROC.ID)
	-- PROD.PRODUTO É O PRODUTO VENDIDO
	-- UTILIZA-SE O FILTRO PARA SELECIONAR APENAS OS ITENS QUE TEM:
		-- O ID DA COMPRA IGUAIS AO ID DO PRODUT_COMPRA
		-- E O ID DO PRODUTO IGUAIS AO ID DO PRODUTO COMPRA  
	com.id = proc.id_compra  AND 
	prod.id = proc.id_produto;



SELECT proc.id AS "Produto Compra ",
	com.id AS "Compra",
	prod.produto AS "Produto",
	prod.preco_venda AS "Preço",
	proc.quantidade AS "Quantidade", 
	(prod.preco_venda * proc.quantidade) AS 'Total Produto Compra' -- ESSA LINHA É O DIFERENCIAL DA CONSULTA DE CIMA PARA ESSA.
	-- NESSA LINHA FAZ-SE UMA NOVA ADIÇÃO A EXIBIÇÃO DA CONSULTA, NELA EXIBE-SE O TOTAL DO PRODUTO COMPRA, ESSE TOTAL É CALCULADO PELA QUANTIDADE
	-- MULTIPLICADO PELO PREÇO
	FROM produtos_compra AS proc, produtos AS prod, compras AS com WHERE 
	com.id = proc.id_compra  AND 
	prod.id = proc.id_produto;


SELECT com.id AS "Venda", -- AQUI NESSE SELECT FAZ-SE UMA ALTERAÇÃO A FIM DE EXIBIR APENAS DADOS UTEIS, ENTRETANTO AINDA FALTA A EXIBIÇÃO DA VENDA TOTAL
	com.data_compra AS 'Data da Compra',
	cli.nome AS 'Cliente',
	(prod.preco_venda * proc.quantidade) AS 'Total Produto Compra'
	FROM produtos_compra AS proc, produtos AS prod, compras AS com, cliente AS cli WHERE 
	com.id = proc.id_compra  AND 
	prod.id = proc.id_produto AND 
	cli.id = com.id_cliente;


SELECT com.id AS "Venda",
	com.data_compra AS 'Data da Compra',
	cli.nome AS 'Cliente',
	SUM((prod.preco_venda * proc.quantidade)) AS 'Total' -- AQUI TEM O SOMATORIO, PARA ASSIM ENTÃO TERMOS O TOTAL QUE O CLIENTE GASTOU
	FROM produtos_compra AS proc, produtos AS prod, compras AS com, cliente AS cli WHERE 
	com.id = proc.id_compra  AND 
	prod.id = proc.id_produto AND 
	cli.id = com.id_cliente AND 
	com.data_compra = 
	GROUP BY com.id; -- UTILIZA-SE O GROUPY BY PARA UNIR AS TABELAS.

-- EXISTEM 3 FOREIGN KEYS POR ISSO A NECESSIDADE DE TRES JUNÇÕES NAS QUAIS OS IDS SÃO CORRESPONDENTES

SELECT com.data_compra AS 'Data da Compra',
       cli.nome AS 'Cliente',
       SUM(prod.preco_venda * proc.quantidade) AS 'Total'
FROM produtos_compra AS proc
JOIN produtos AS prod ON prod.id = proc.id_produto
JOIN compras AS com ON com.id = proc.id_compra
JOIN cliente AS cli ON cli.id = com.id_cliente
GROUP BY com.data_compra, cli.nome
ORDER BY com.data_compra;
-- NESSA CONSULTA FAZ-SE A DISTINÇÃO DE DATAS!