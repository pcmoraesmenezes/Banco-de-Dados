-- Atores

INSERT INTO atores (nome) VALUES ('Tom Holland');
INSERT INTO atores (nome) VALUES ('Tobey Miguere');
INSERT INTO atores (nome) VALUES ('Andrew Garfield');
INSERT INTO atores (nome) VALUES ('Joaquim Phoenix');
INSERT INTO atores (nome) VALUES ('Leonardo di Caprio');
INSERT INTO atores (nome) VALUES ('Brad Pitt');
INSERT INTO atores (nome) VALUES ('Marla Singer');
INSERT INTO atores (nome) VALUES ('Edward Norton');




-- Gêneros

INSERT INTO generos (genero) VALUES ('Ação');
INSERT INTO generos (genero) VALUES ('Comédia');
INSERT INTO generos (genero) VALUES ('Super Héroi');
INSERT INTO generos (genero) VALUES ('História');
INSERT INTO generos (genero) VALUES ('Clássico');



-- FIlmes

INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha 1', 3, 9.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha 2', 3, 7.39);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha 3', 3, 3.49);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('O Espetacular Homem Aranha 1', 3, 14.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('O Espetacular Homem Aranha 2', 3, 12.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha Longe de casa', 3, 5.34);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha de Volta ao Lar', 3, 8.76);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Homem Aranha Sem Volta Para Casa', 3, 20.00);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('O lobo de Wall Streat', 2, 12.39);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Bastardos Inglórios', 1, 23.88);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Napoleão', 4, 25.00);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Oppenheimer', 4, 24.00);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Clube da Luta', 5, 14.23);



-- Clientes

INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Lua', 'House', '379888746792', 'Miss.June' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Paulo', 'César', '379883123792', 'St. Happy' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Vetor', 'Bolotinha', '379888324516', 'Sky' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Young', 'Jovem', '379834092774', 'Pub' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Sparky', 'Deathcap', '379712008769', 'Semptember' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Isa', 'V.', '379559878767', 'First. June' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Blaster', 'Rafa', '379488237692', 'Fools Land' );
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Tonho', 'An', '379877204277', 'N. Nt' );

-- Atores Filme
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (1, 1, 'Peter Parker (Tom)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (6, 1, 'Peter Parker (Tom)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (7, 1, 'Peter Parker (Tom)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (4, 4, 'Napoleão Bonaparte');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (2, 5, 'Jordan Belfort');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (3, 6, 'Tenente Aldo');

INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (13, 6, 'Tyler Durden');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (13, 8, 'Narrador');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (1, 6, 'Peter Parker (Tom)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (2, 6, 'Peter Parker (Tobey)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (3, 6, 'Peter Parker (Andrew)');
INSERT INTO atores_filme  (id_filme, id_ator, personagem) VALUES (3, 5, 'Peter Parker (Andrew)');

-- DVDS

INSERT INTO dvds (id_filme, quantidade) VALUES (1, 3);
INSERT INTO dvds (id_filme, quantidade) VALUES (2, 2);
INSERT INTO dvds (id_filme, quantidade) VALUES (3, 7);
INSERT INTO dvds (id_filme, quantidade) VALUES (4, 1);
INSERT INTO dvds (id_filme, quantidade) VALUES (5, 3);
INSERT INTO dvds (id_filme, quantidade) VALUES (6, 2);
INSERT INTO dvds (id_filme, quantidade) VALUES (7, 7);
INSERT INTO dvds (id_filme, quantidade) VALUES (8, 8);
INSERT INTO dvds (id_filme, quantidade) VALUES (9, 9);
INSERT INTO dvds (id_filme, quantidade) VALUES (10, 13);
INSERT INTO dvds (id_filme, quantidade) VALUES (11, 2);
INSERT INTO dvds (id_filme, quantidade) VALUES (12, 1);
INSERT INTO dvds (id_filme, quantidade) VALUES (13, 1);


-- EMPRESTIMOS

INSERT INTO emprestimos (data, id_cliente) VALUES ('27/11/2023', 1);
INSERT INTO emprestimos (data, id_cliente) VALUES ('7/10/2023', 2);
INSERT INTO emprestimos (data, id_cliente) VALUES ('23/08/2023', 3);
INSERT INTO emprestimos (data, id_cliente) VALUES ('21/09/2023', 4);
INSERT INTO emprestimos (data, id_cliente) VALUES ('10/09/2023', 5);
INSERT INTO emprestimos (data, id_cliente) VALUES ('9/11/2023', 6);
INSERT INTO emprestimos (data, id_cliente) VALUES ('7/10/2023', 7);
INSERT INTO emprestimos (data, id_cliente) VALUES ('17/10/2023', 8);


-- Devoluções

INSERT INTO devolucoes (id_emprestimo, data) VALUES (1, '29/11/2023');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (3, '2/10/2023');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (7, '11/10/2023');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (5, '10/11/2023');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (2, '8/10/2023');

-- Filmes Emprestimo

INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 13)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 10)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (1, 12)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 11)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (3, 3)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (4, 13)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (5, 10)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (5, 12)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (5, 11)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (3, 1)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 1)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 2)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 3)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 4)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 5)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 6)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 7)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (2, 8)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (6, 1)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (6, 12)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (7, 13)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (7, 11)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (7, 12)
INSERT INTO filmes_emprestimo(id_emprestimo, id_dvd) VALUES (6, 10)


-- Filmes devolução

INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (1,1)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (1,2)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (1,3)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (2,4)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (2,3)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (2,1)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (2,5)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (3,1)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (3,12)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (3,14)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (3,10)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (4,8)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (4,7)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (4,4)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (5,5)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (5,6)
INSERT INTO filmes_devolucao (id_devolucao, id_filme_imprestimo) VALUES (5,7)