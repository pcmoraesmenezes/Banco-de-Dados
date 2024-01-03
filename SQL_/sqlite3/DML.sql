-- OBS: A tabela está no arquivo DDL.sql

-- DML
INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');
INSERT INTO tipos_produto (descricao) VALUES ('notebucki');
INSERT INTO tipos_produto (descricao) VALUES ('Apple');


INSERT INTO produtos (nome, preco, codigo_tipo) VALUES 
	('Desktop', 1800, 1),
	('Laptop', 1200, 1),
	('Impressora Comum', 200, 2),
	('Impressora Laser', 500, 2);
	
INSERT INTO produtos(nome, preco, codigo_tipo) VALUES 
	('Notebook', 2200, 3),
	('iPad', 2500, 4),
	('iPhone Exis', 3999, 4);
	
-- Cliente digitou errado o 'notebook' e agora?

UPDATE tipos_produto SET nome = 'Notebook' WHERE id = 3;

-- É possível atualizar duas coisas ao mesmo tempo?

UPDATE produtos SET codigo_tipo = 3, preco = 1600 WHERE nome = 'Laptop';

-- Cliente deseja deletar as duas impressoras do banco de dados, como fazer?

DELETE FROM produtos WHERE id = 2; -- Deletei o Laptop... Não queria ter deletado-o,  o que fiz de errado?

-- Para apagar os dados das impressoras poderiamos utilizar o codigo_tipo.

-- É possível recuperar os dados? Não...

DELETE FROM produtos WHERE codigo_tipo = 2; -- Agora deletamos todos os tipos de impressora!