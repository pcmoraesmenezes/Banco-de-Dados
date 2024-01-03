-- CREATE DATABASE secao03;


CREATE TABLE tipos_produtos (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL 
);

CREATE TABLE produtos (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	descricao TEXT NOT NULL,
	preco REAL NOT NULL,
	id_tipo_produto INTEGER REFERENCES tipos_produtos(id) NOT NULL
);

CREATE TABLE pacientes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	nome TEXT NOT NULL,
	endereco TEXT NOT NULL,
	bairro TEXT NOT NULL,
	cidade TEXT NOT NULL,
	estado TEXT NOT NULL,
	cep TEXT NOT NULL,
	data_nascimento TEXT NOT NULL
);

CREATE TABLE professor (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	telefone INTEGER NOT NULL,
	nome TEXT NOT NULL
);

CREATE TABLE turma(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    capacidade INTEGER NOT NULL,
	id_professor INTEGER REFERENCES professor(id) NOT NULL
);

-- INSERTS

-- Tipos Produto
INSERT INTO tipos_produtos (descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos (descricao) VALUES ('Diversos');

-- Produtos
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook DELL 1544', 2345.67, 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impr. Jato de Tinta', 456.00, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse sem fio', 45, 3);

-- Pacientes
INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento) 
	VALUES ('Angelina Jolie', 'Rua da paz, 44', 'Nova Lima', 'Santos', 'SP', '121213213', '1978-04-24');


-- professor
INSERT INTO professor (telefone, nome) VALUES (12345, 'Fernando Perez');

-- TURMA 
INSERT INTO turma (capacidade, id_professor) VALUES (50, 1);

-- Selects
SELECT * FROM tipos_produtos;

SELECT * FROM produtos;

SELECT * FROM pacientes;

SELECT * FROM professor;

SELECT * FROM turma;