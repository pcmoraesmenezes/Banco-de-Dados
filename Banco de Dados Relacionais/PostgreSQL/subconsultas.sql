CREATE TABLE escritorios(
	id SERIAL PRIMARY KEY,
	pais VARCHAR(30) NOT NULL
);

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY, 
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	id_escritorio INT REFERENCES escritorios(id) NOT NULL
);

CREATE TABLE pagamentos(
	id SERIAL PRIMARY KEY,
	id_funcionario INT REFERENCES funcionarios(id) NOT NULL,
	salario DECIMAL(8,2) NOT NULL,
	data DATE NOT NULL
);


INSERT INTO escritorios (pais) VALUES ('Brasil');
INSERT INTO escritorios (pais) VALUES ('Estados Unidos');
INSERT INTO escritorios (pais) VALUES ('Alemanha');
INSERT INTO escritorios (pais) VALUES ('França');

INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Pedro', 'Souza', 1);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Sandra', 'Rubin', 2);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Mikail', 'Schumer', 3);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Olivier', 'Gloçan', 4);

INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (1, '5347.55', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (2, '9458.46', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (3, '4669.67', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (4, '2770.32', '2019-03-17');

SELECT nome, sobrenome FROM funcionarios 
	WHERE id_escritorio IN 
		(SELECT id FROM escritorios WHERE pais = 'Brasil'); -- Seleciona o funcionario com id = 1
		
SELECT id FROM escritorios
	WHERE pais = 'Brasil';
	

-- Sem subconsulta

SELECT nome, sobrenome 
	FROM funcionarios, escritorios AS e 
	WHERE id_escritorio = e.id AND e.pais = 'Brasil';
	

SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
	WHERE f.id_escritorio = e.id
		AND f.id = p.id_funcionario
		AND salario = (SELECT MAX(salario) FROM pagamentos); -- SELECIONANDO O MAIOR SALARIO

SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
		WHERE f.id_escritorio = e.id
			AND f.id = p.id_funcionario -- Pegando todos os dados
		
		
SELECT f.nome, f.sobrenome, e.pais, p.salario
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
		WHERE f.id_escritorio = e.id
		AND f.id = p.id_funcionario
		AND salario < (SELECT AVG(salario) FROM pagamentos ); -- pegando salarios que estão a baixo da média
			

	
	
	
	
	
	
	
	