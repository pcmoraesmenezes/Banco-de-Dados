-- Funções de agregação

-- MAX -> Maior

SELECT p.id, p.nome, p.preco, tp.id FROM produtos p, tipos_produto tp
	WHERE p.codigo_tipo = tp.id AND
	p.preco = (SELECT MAX(preco) FROM produtos);


-- MIN -> Menor

SELECT p.id, p.nome, p.preco, tp.id FROM produtos p, tipos_produto tp
	WHERE p.codigo_tipo = tp.id AND
	p.preco = (SELECT MIN(preco) FROM produtos);
	
-- AVG -> Média

SELECT ROUND(AVG(preco), 2) FROM produtos;

-- Count -> Contar

SELECT COUNT(preco) AS 'Quantidade' FROM produtos WHERE codigo_tipo = 1;

-- Groupy by -> Agrupar

SELECT codigo_tipo, MAX (preco) FROM produtos p GROUP BY codigo_tipo;

-- HAVING -> Usado junto do groupy by, semelhante ao where

SELECT codigo_tipo, MAX(preco) FROM produtos GROUP BY codigo_tipo HAVING MAX(preco) > 1000;