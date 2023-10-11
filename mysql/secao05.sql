CREATE DATABASE secao05;
USE secao05;

CREATE TABLE IF NOT EXISTS tipos_produto(
codigo INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(30) NOT NULL,
PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS produtos(
codigo INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(30),
preco DECIMAL(8,2) NOT NULL,
codigo_tipo INT NOT NULL,
PRIMARY KEY(codigo),
FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
);

INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES 
	('Desktop', '1200', 1),
	('Laptop', '1800', 1),
	('Impr Jato de tinta', '300', 2),
	('Impr a Laser', '500', 2);

-- Filtrando consultas com WHERE

SELECT * FROM produtos WHERE codigo_tipo = 2;

SELECT * FROM produtos WHERE codigo_tipo = 2 AND preco >300; -- Ambas condições devem ser verdadeiras

SELECT * FROM produtos WHERE codigo_tipo = 2 OR preco > 300; -- Todos os produtos com preços maiores que 300 são exibidos caso a primeira condição seja falsa


-- CONSULTAS DE MULTIPLAS TABELAS

SELECT * FROM produtos, tipos_produto;

SELECT p.codigo AS id, p.descricao AS 'Descrição do Produto', p.preco AS 'preço', p.codigo_tipo AS "Tipo do produto",
tp.codigo AS id_tipo_produto, tp.descricao AS "Descrição do Tipo de produto" FROM produtos AS p, tipos_produto tp; -- OBSERVE QUE TEM DUPLICATAS

SELECT p.codigo AS id, p.descricao AS 'Descrição do Produto', p.preco AS 'preço', p.codigo_tipo AS "Tipo do produto",
tp.codigo AS id_tipo_produto, tp.descricao AS "Descrição do Tipo de produto" FROM produtos AS p, tipos_produto tp
WHERE p.codigo_tipo  = tp.codigo -- FILTRO PARA REMOVER DUPLICATAS.
ORDER BY preco ASC; 



SELECT * FROM produtos as p
INNER JOIN tipos_produto tp
ON p.codigo_tipo = tp.codigo;
