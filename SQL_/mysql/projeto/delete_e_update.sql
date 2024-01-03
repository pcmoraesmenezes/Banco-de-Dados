-- Atualizando dados

USE farmacia;

SELECT *FROM tipos_produtos;

UPDATE tipos_produtos SET tipo = 'Medicação com Receita' WHERE id = 9;

SELECT * FROM produtos;

UPDATE produtos SET preco_venda = '29.99' WHERE id = 11;

UPDATE produtos SET preco_venda = '10.44' WHERE id = 2;

 -- loção solar trocar para 2 e creme hidratante tambem

UPDATE produtos SET id_tipo_produto = 2 WHERE id = 14 OR id = 13;

UPDATE produtos SET preco_venda = '3.5' WHERE id_tipo_produto = 3;


SELECT * FROM produtos_compra;

UPDATE produtos_compra SET id_produto = 2 WHERE id = 6;

SELECT proc.id_produto AS "Id do produto Compra",
	   prod.produto AS "Produto",
	   prod.preco_venda AS "Preço",
	   cli.nome AS "Nome do Cliente"
	   FROM produtos_compra AS proc, produtos prod, cliente AS cli
	   WHERE proc.id_produto = prod.id AND
	   prod.id_tipo_produto  = cli.id AND
	   proc.id_produto = 2;
	  
-- Excluindo Dados
	  
SELECT * FROM produtos_compra;

SELECT * FROM receitas_medica;

DELETE FROM produtos_compra WHERE id = 7; -- ELE NÃO DEIXA DELETAR POIS TEM-SE UMA TABELA QUE É A RECEITA MÉDICA QUE DEPENDE DESSE VALOR
-- ISSO É UMA MEDIDA DE SEGURANÇA

-- PRIMEIRO DELETA O DADO NA TABELA DE RECEITA

DELETE FROM receitas_medica WHERE receita = 'receita3.pdf';


