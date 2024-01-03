-- DTL

BEGIN TRANSACTION;

INSERT INTO tipos_produto (descricao) VALUES ('Sony');
INSERT INTO produtos (nome, preco, codigo_tipo) VALUES 
	('Playstation 4', 2000, 4),
	('Tv 47 Polegadas', 3800, 4),
	('Playstation 6 + 2 Controles', 1, 4);
	
SELECT * FROM produtos p;
SELECT * FROM tipos_produto tp;

-- Se executar commit, todas as alterações feitas até agora serão executadas.

COMMIT;

SELECT * FROM produtos p;

-- Realize as consultas linhas por linhas, o entendimento será melhor!
BEGIN TRANSACTION;

INSERT INTO tipos_produto (descricao) VALUES ('Tablet');

SELECT * FROM tipos_produto tp; -- Até aqui

ROLLBACK;

SELECT * FROM tipos_produto tp; -- Execute o ROLLBACK e realize a consulta dessa linha, observe que o table não está mais!