USE secao04;

CREATE TABLE tipos_produto (
    codigo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

CREATE TABLE produtos (
	codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(30) NOT NULL,
	preco DECIMAL(8.2) NOT NULL,
	codigo_tipo INT NOT NULL,
	FOREIGN KEY (codigo_tipo) REFERENCES tipos_produto(codigo)
);

INSERT INTO tipos_produto (descricao) VALUES ('Computadores ');

INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Leptop', '1900', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impresso Jato de Tinta', '200', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impressora Laser', '500', 2);

# DQL

SELECT * FROM tipos_produto;

SELECT * FROM produtos;

SELECT descricao FROM tipos_produto tp;

SELECT produtos.codigo AS cod , produtos.descricao AS descr, produtos.preco AS p, produtos.codigo_tipo AS ctp FROM produtos; 

SELECT produtos.codigo AS 'Código' , produtos.descricao AS 'Descrição', produtos.preco AS 'preço', produtos.codigo_tipo AS 'Código tipo produto' FROM produtos; 


# DML 

-- Insert
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Notebook', '1500', 1);

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Macbook Pro', '3700', 1);

-- Se passarmos o campo id como null ele irá auto incrementar evitando que o campo fique null

INSERT INTO produtos VALUES (NULL, 'Impressora 3d', '5000', 2);

SELECT * FROM produtos WHERE produtos.descricao = 'Impressora 3d';

INSERT INTO tipos_produto VALUES (NULL, 'Apple');

-- UPDATE

SELECT * FROM produtos

UPDATE produtos SET codigo_tipo = 5 WHERE codigo = 10;

UPDATE produtos SET descricao = 'Impr. Jato de Tinta', preco = '500' WHERE codigo = 3;

-- DELETE
SELECT * FROM produtos;

DELETE FROM produtos WHERE descricao = 'Impressora Laser';

# DDL 

-- CREATE

CREATE DATABASE  IF NOT EXISTS ddl_test; 

USE ddl_test;

CREATE TABLE  people (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

INSERT INTO people VALUES (NULL, 'Paulo');

SELECT * FROM people;

-- ALTER 

ALTER TABLE people ADD ano_nascimento INT;

ALTER TABLE people ADD mes_nasc INT NOT NULL;

UPDATE  people SET ano_nascimento = 2004 WHERE id = 1;

UPDATE people SET mes_nasc = 06 WHERE mes_nasc = 0;

-- DROP

DROP TABLE people;

DROP DATABASE ddl_test;

# DTL
USE secao04;

SELECT * FROM tipos_produto

-- TRANSACTION

START TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('Acessorios');
	INSERT INTO tipos_produto (descricao) VALUES ('Equipamento');
	SELECT * FROM tipos_produto tp;
COMMIT;

ROLLBACK; -- Não funciona se usado apos

START TRANSACTION;

	INSERT INTO produtos VALUES (NULL, 'Fone', '200', 6);

SELECT * FROM produtos p ;

ROLLBACK;

SELECT  * FROM produtos p 