-- Consultas de multiplas tabelas

SELECT descricao AS 'Descrição do Tipo', nome AS 'Nome do Produto', preco AS 'Preço'
	FROM produtos, tipos_produto
		WHERE produtos.codigo_tipo = tipos_produto.id;
	