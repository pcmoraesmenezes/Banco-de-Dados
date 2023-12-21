-- DQL

SELECT * FROM tipos_produto;

SELECT  descricao, codigo FROM tipos_produto;

SELECT nome, preco FROM produtos;

SELECT p.nome AS 'Nome do Produto', p.preco AS 'Preço' FROM produtos AS p;