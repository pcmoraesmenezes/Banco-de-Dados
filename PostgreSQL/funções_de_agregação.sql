CREATE TABLE categorias(
id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
id SERIAL PRIMARY KEY, 
descricao VARCHAR(60) NOT NULL,
preco_venda DECIMAL(8,2) NOT NULL,
preco_custo MONEY NOT NULL,
id_categoria INT REFERENCES categorias(id) NOT NULL
);

INSERT INTO categorias (nome) VALUES ('Material Escolar');
INSERT INTO categorias (nome) VALUES ('Acessório Informática');
INSERT INTO categorias (nome) VALUES ('Material Escritório');
INSERT INTO categorias (nome) VALUES ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', 5.45, 2.30, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', 1.20, 0.45, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 32GB', 120.54, 32.55, 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', 17.00, 4.30, 2);


SELECT MAX(preco_venda) FROM produtos;
SELECT MIN(preco_venda) FROM produtos;

SELECT AVG(preco_custo) FROM produtos; -- Não é possível pois ele não consegue fazer uma média do tipo Money
SELECT AVG(preco_venda) FROM produtos; -- Ele apresenta uma precisão grande
SELECT TO_CHAR(AVG(preco_venda), '99999999D99') AS "Média" FROM produtos; -- Formatado para strings, os 9
-- representam a quantidade máxima de digitos o D representa a quantidade máxima de digitos após a virgula.

SELECT ROUND(AVG(preco_custo::numeric), 2) FROM produtos; -- Esse :: significa um cast para o tipo numerico


SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 1;

SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;

SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;