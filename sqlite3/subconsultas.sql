-- Subconsulta

SELECT * FROM produtos WHERE codigo_tipo IN (SELECT id FROM tipos_produto WHERE id = 2);

SELECT  nome, preco, descricao FROM produtos p, tipos_produto tp
	WHERE p.codigo_tipo = tp.id AND
	p.preco < (SELECT AVG(preco) FROM produtos);
