-- Deletando dados

DELETE FROM atores_filme WHERE id = 9;

DELETE FROM atores_filme WHERE id = 5;

DELETE FROM atores_filme WHERE id = 12;

DELETE FROM filmes_devolucao WHERE id = 2;

DELETE FROM filmes_emprestimo WHERE id = 2;

DELETE FROM filmes_devolucao
	WHERE id_filme_imprestimo BETWEEN 12 AND 17;

DELETE FROM filmes_devolucao WHERE id = 1;

DELETE FROM filmes_devolucao WHERE id = 4;

DELETE FROM filmes_devolucao WHERE id = 6;


