-- Junção de tabelas

CREATE TABLE profissoes(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	cargo TEXT NOT NULL
);

CREATE TABLE clientes(
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	nome TEXT NOT NULL,
	data_nascimento TEXT NOT NULL,
	telefone TEXT NOT NULL,
	id_profissao INTEGER REFERENCES profissoes(id) NOT NULL
);

CREATE TABLE consumidor(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    contato TEXT NOT NULL,
    endereco TEXT NOT NULL,
    cidade TEXT NOT NULL,
    cep TEXT NOT NULL,
    pais TEXT NOT NULL
);


INSERT INTO profissoes (cargo) VALUES ('Programador');
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pirez', '1991-02-05', '5234-5621', 1);

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');



-- Junção de produto cartesiano

SELECT c.id , c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes c, profissoes p
	WHERE c.id_profissao = p.id;
	
-- Inner Join

SELECT c.nome, c.data_nascimento, c.telefone, p.cargo
	FROM clientes c INNER JOIN profissoes p
	ON c.id_profissao = p.id;

-- Left Outer Join

SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- Right Outer Join -> Não possuí implementação em SQLITE


-- Full Outer Join -> Não possuí implementação em SQLITE

-- Cross Join

SELECT c.nome, c.data_nascimento, c.telefone, p.cargo FROM clientes c CROSS JOIN profissoes p;

-- Self Join

SELECT a.nome AS 'Consumidor 1', b.nome AS 'Consumidor 2', a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade
ORDER BY a.cidade;

