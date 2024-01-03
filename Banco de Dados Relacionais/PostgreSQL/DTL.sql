CREATE TABLE tipos_produto(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50)
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	valor MONEY NOT NULL,
	descricao VARCHAR(50),
	codigo_tipo INT REFERENCES tipos_produto(id) NOT NULL
);


INSERT INTO tipos_produto (descricao) VALUES
	('Computador'),
	('Impressora'),
	('Notebook');
	
INSERT INTO produtos (valor, descricao, codigo_tipo) VALUES
	(1200, 'Desktop', 1),
	(1800, 'Laptop', 3),
	(800, 'Impr. Jato de Tinta', 2);
	
-- DTL	
	
BEGIN TRANSACTION; -- INICIO DE UMA TRANSAÇÃO

INSERT INTO tipos_produto (descricao) VALUES 
	('Smartphone'),
	('Periféricos gamer');

SELECT * FROM tipos_produto;
	
-- COMMIT -> OS DADOS SO SERÃO PERSSISTIDOS NO BANCO DE DADOS QUANDO O COMMIT FOR EXECUTADO!
COMMIT;

-- ROLLBACK SERVE PARA DESFAZER AS ALTERAÇÕES QUE FORAM FEITAS DENTRO DA TRANSAÇÃO
-- AO APLICAR COMMIT NÃO É POSSÍVEL FAZER ROLLBACK
-- CASO DESEJA CANCELAR UMA TRANSAÇÃO BASTA UTILIZAR O ROLLBACK E A TRANSAÇÃO SERÁ CANCELADA

BEGIN TRANSACTION;

INSERT INTO tipos_produto (descricao) VALUES
	('Monitor'),
	('CPU'),
	('Ventiladores');
	
SELECT * FROM tipos_produto;

ROLLBACK;

SELECT * FROM tipos_produto;

-- OBSERVE QUE OS ITENS INSERIDOS NA TABELA tipos_produto NÃO FORAM INSERIDOS NA TABELA APÓS O ROLLBACK

