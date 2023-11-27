-- Consultas Simples

SELECT * FROM filmes;

SELECT * FROM atores;

SELECT * FROM clientes;

SELECT * FROM atores_filme;

SELECT * FROM devolucoes;

SELECT * FROM dvds;

SELECT * FROM emprestimos;

SELECT * FROM filmes_devolucao;

SELECT * FROM filmes_emprestimo;

SELECT * FROM genero;

-- Filmes e generos

SELECT f.id, f.titulo, g.genero, f.valor
	FROM filmes AS f, generos AS g
		WHERE f.id_genero = g.id;
		
-- Atores Filmes

SELECT * FROM atores, filmes;

SELECT af.id, f.titulo, a.nome, af.personagem 
	FROM filmes AS f, atores AS a, atores_filme AS af
		WHERE af.id_filme = f.id AND
		af.id_ator = a.id;
		
-- FILTROS

SELECT * FROM generos WHERE id = 2;

SELECT * FROM generos WHERE genero = 'Clássico';

-- FUNÇÕES AGREGADAS

SELECT SUM(valor) AS "Soma de Todos os Filmes" FROM filmes;

SELECT MAX(valor) AS "Filme mais caro" FROM filmes;
SELECT * FROM filmes WHERE valor IN ( SELECT MAX(valor) FROM filmes);
