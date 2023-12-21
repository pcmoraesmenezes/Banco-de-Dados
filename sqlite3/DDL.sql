-- DDL

CREATE TABLE tipos_produto(
	codigo INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL
);

CREATE TABLE produtos(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	preco REAL NOT NULL,
	codigo_tipo INTEGER REFERENCES tipos_produto(codigo) NOT NULL
);

-- ALTER -> Alterar uma tabela

ALTER TABLE tipos_produto ADD peso REAL; -- Adicionando uma nova coluna a tabela

ALTER TABLE tipos_produto ADD COLUMN peso REAL; -- Funciona dessa forma também!!!


ALTER TABLE tipos_produto
	RENAME codigo TO id; -- Renomeando a coluna codigo
	
ALTER TABLE tipos_produto
	RENAME COLUMN codigo TO id; -- Também funciona!
	
ALTER TABLE produtos ADD teste INTEGER REFERENCES tipos_produto(peso) ON UPDATE CASCADE ON DELETE CASCADE;


UPDATE tipos_produto  SET peso = 1;

ALTER TABLE produtos DROP  teste;

ALTER TABLE tipos_produto DROP peso; -- Removendo a coluna peso

-- DROP

DROP TABLE produtos; -- deletei o banco de dados produtos!

DROP DATABASE secao04; -- Não funciona!

SELECT * FROM tipos_produto; -- Apenas para ver as modificações...

SELECT * FROM produtos;