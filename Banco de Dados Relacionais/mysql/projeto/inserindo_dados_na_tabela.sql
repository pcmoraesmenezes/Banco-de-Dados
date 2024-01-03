# DML (DATA MANAGMENT LANGUAGE)

USE farmacia;

-- Qual tabela se inicia a inserção de dados?

-- NÃO É POSSÍVEL INICIAR A INSERÇÃO DE DADOS EM TABELAS QUE POSSUEM DEPENDENCIA DE CHAVE ESTRANGEIRA

-------------------------------------------------------------------------------------------------------------------------------------------------------------

## inserindo dados de teste 

-- Inserindo em tipos produto

INSERT INTO tipos_produtos (tipo) VALUES ('Remédios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmético');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');
INSERT INTO tipos_produtos (tipo) VALUES ('Medicamentos Sem Prescrição');
INSERT INTO tipos_produtos (tipo) VALUES ('Prescrição Médica');
INSERT INTO tipos_produtos (tipo) VALUES ('Produtos de Higiene Pessoal');
INSERT INTO tipos_produtos (tipo) VALUES ('Vitaminas e Suplementos');
INSERT INTO tipos_produtos (tipo) VALUES ('Primeiros Socorros');
INSERT INTO tipos_produtos (tipo) VALUES ('Dermocosméticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Acessórios para Saúde');
INSERT INTO tipos_produtos (tipo) VALUES ('Cuidados com Bebês');	


-- Fabricantes

INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive');
INSERT INTO fabricantes (fabricante) VALUES ('Bayer');
INSERT INTO fabricantes (fabricante) VALUES ('Johnson & Johnson');
INSERT INTO fabricantes (fabricante) VALUES ('Pfizer');
INSERT INTO fabricantes (fabricante) VALUES ('GSK (GlaxoSmithKline)');
INSERT INTO fabricantes (fabricante) VALUES ('Sanofi');
INSERT INTO fabricantes (fabricante) VALUES ('Procter & Gamble');
INSERT INTO fabricantes (fabricante) VALUES ('Unilever');
INSERT INTO fabricantes (fabricante) VALUES ('Colgate-Palmolive');
INSERT INTO fabricantes (fabricante) VALUES ('Nestlé');
INSERT INTO fabricantes (fabricante) VALUES ('Aveeno');

-- Médicos

INSERT INTO medicos (nome, CRM) VALUES ('Paulo César', '232131-MG');
INSERT INTO medicos (nome, CRM) VALUES ('Paula Silva', '276251-SP');
INSERT INTO medicos (nome, CRM) VALUES ('Felipe', 	   '129383-RS');
INSERT INTO medicos (nome, CRM) VALUES ('Maria Santos', '175632-RJ');
INSERT INTO medicos (nome, CRM) VALUES ('Ricardo Oliveira', '342179-SP');
INSERT INTO medicos (nome, CRM) VALUES ('Ana Costa', '198723-MG');
INSERT INTO medicos (nome, CRM) VALUES ('Fernando Pereira', '276541-PR');
INSERT INTO medicos (nome, CRM) VALUES ('Carla Martins', '128765-RJ');
INSERT INTO medicos (nome, CRM) VALUES ('Roberto Alves', '234567-SP');
INSERT INTO medicos (nome, CRM) VALUES ('Lúcia Ferreira', '319876-PR');
INSERT INTO medicos (nome, CRM) VALUES ('André Silva', '289876-MG');
INSERT INTO medicos (nome, CRM) VALUES ('Lucas Sampaio', '127635-RS');

-- Clientes

INSERT INTO cliente  (nome, endereco, telefone, codigo_postal, localidade, numero_contribuinte  ) VALUES 
					('Peter Parker', 'Rua Ingram 20, Forest Hills', '(11)92382-2313', '3421399', 'Belo Horizonte', '232.123.898-23');
					
			
				
INSERT INTO cliente  (nome, endereco, telefone, codigo_postal, localidade, numero_contribuinte  ) VALUES 
					('Bruce Wayne', 'Rua da Gotham City', '(11)217327918', '2131239', 'Belo Horizonte', '123.145.576.89');
					

INSERT INTO cliente  (nome, endereco, telefone, codigo_postal, localidade, numero_contribuinte  ) VALUES 
					('Patrick Watson', 'Rua dos Abraços', '(21)98782-2343', '3424549', 'Alfenas', '178.465.677.89');
					
INSERT INTO cliente (nome, endereco, telefone, codigo_postal, localidade, numero_contribuinte) VALUES
('Mary Jane Watson', 'Rua dos Abraços, 45', '(21)98213-5487', '3424549', 'Alfenas', '198.754.223.61'),

('Diana Prince', 'Avenida Themyscira, 123', '(11)91732-5648', '1234567', 'Gotham City', '456.789.123.45'),

('Bruce Wayne', 'Mansão Wayne, Gotham City', '(11)88888-8888', '1234567', 'Gotham City', '123.000.111.22'),

('Tony Stark', 'Torre Stark, Malibu', '(12)55555-5555', '5432198', 'Los Angeles', '987.654.321.00'),

('Steve Rogers', 'Apartamento 2B, Brooklyn', '(12)44444-4444', '1122334', 'New York', '222.333.444.55'),

('Peter Parker', 'Apartamento 5A, Forest Hills', '(11)92382-2313', '3421399', 'Belo Horizonte', '232.123.898.23'),

('Clark Kent', 'Fazenda Kent, Smallville', '(23)77777-7777', '6789012', 'Metropolis', '777.888.999.11'),

('Barry Allen', 'Laboratório Star Labs, Central City', '(13)99999-9999', '9876543', 'Central City', '888.777.666.55'),

('Oliver Queen', 'Mansão Queen, Star City', '(14)77777-7777', '7654321', 'Star City', '777.666.555.44'),

('John Smith', '123 Main Street, Anytown', '(99)12345-6789', '5432109', 'Anytown', '111.222.333.44');


-- O próximo passo após inserir em todas as tabelas que não possuem dependencia é inserir nas tabelas que já é possível atender as dependencias

-- produtos

INSERT INTO produtos (produto, desiginacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
VALUES ('Dipirona', 'Dores em geral', 'Metil-propileno', '12.44', 1, 1);

-- Inserção de produtos para cada tipo de produto
INSERT INTO produtos (produto, desiginacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
VALUES
('Dorflex', 'Alívio da dor', 'Paracetamol e Orfenadrina', '9.99', 1, 4),
('Tylenol', 'Analgésico', 'Paracetamol', '7.50', 1, 4),
('Loção Hidratante', 'Hidratação Corporal', 'Manteiga de Karité', '14.99', 2, 2),
('Creme Antirrugas', 'Anti-Envelhecimento', 'Ácido Hialurônico', '29.99', 2, 2),
('Escova de Dentes', 'Higiene Bucal', 'Cerdas Macias', '2.99', 3, 3),
('Sabonete Líquido', 'Limpeza Corporal', 'Glicerina', '4.99', 3, 3),
('Vitamina C', 'Suplemento', 'Ácido Ascórbico', '12.99', 7, 4),
('Multivitamínico', 'Suplemento', 'Vitaminas A a Z', '19.99', 7, 4),
('Kit de Primeiros Socorros', 'Emergências', 'Vários Itens', '24.99', 8, 5),
('Curativo Adesivo', 'Curativo', 'Tecido não Tecido', '1.99', 8, 5),
('Creme Hidratante', 'Hidratação Facial', 'Ácido Hialurônico', '19.99', 9, 2),
('Loção Solar', 'Proteção Solar', 'Óxido de Zinco', '15.99', 9, 2),
('Termômetro Digital', 'Medição de Temperatura', 'Eletrônico', '6.99', 10, 1),
('Babador Infantil', 'Cuidados com Bebês', 'Tecido Lavável', '3.49', 11, 8),
('Fralda Descartável', 'Cuidados com Bebês', 'Polpa de Celulose', '16.99', 11, 8),
('Xampu Infantil', 'Higiene Capilar', 'Extrato de Camomila', '4.99', 6, 3),
('Hidratante para Bebês', 'Cuidados com Bebês', 'Manteiga de Karité', '5.99', 6, 2);



-- Compras

INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2019-05-18');



INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2023-09-12');
INSERT INTO compras (id_cliente, data_compra) VALUES (2, '2023-08-25');
INSERT INTO compras (id_cliente, data_compra) VALUES (3, '2023-10-05');
INSERT INTO compras (id_cliente, data_compra) VALUES (4, '2023-09-21');
INSERT INTO compras (id_cliente, data_compra) VALUES (5, '2023-09-15');
INSERT INTO compras (id_cliente, data_compra) VALUES (6, '2023-09-30');
INSERT INTO compras (id_cliente, data_compra) VALUES (7, '2023-08-10');
INSERT INTO compras (id_cliente, data_compra) VALUES (8, '2023-07-29');
INSERT INTO compras (id_cliente, data_compra) VALUES (9, '2023-08-18');
INSERT INTO compras (id_cliente, data_compra) VALUES (10, '2023-08-01');
INSERT INTO compras (id_cliente, data_compra) VALUES (11, '2023-10-09');
INSERT INTO compras (id_cliente, data_compra) VALUES (12, '2023-09-05');
INSERT INTO compras (id_cliente, data_compra) VALUES (13, '2023-09-12');


INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2021-06-15');
INSERT INTO compras (id_cliente, data_compra) VALUES (2, '2021-07-20');
INSERT INTO compras (id_cliente, data_compra) VALUES (3, '2021-08-25');
INSERT INTO compras (id_cliente, data_compra) VALUES (4, '2021-09-10');
INSERT INTO compras (id_cliente, data_compra) VALUES (5, '2022-03-05');
INSERT INTO compras (id_cliente, data_compra) VALUES (6, '2022-04-18');
INSERT INTO compras (id_cliente, data_compra) VALUES (7, '2022-05-22');
INSERT INTO compras (id_cliente, data_compra) VALUES (8, '2022-06-30');
INSERT INTO compras (id_cliente, data_compra) VALUES (9, '2022-07-12');
INSERT INTO compras (id_cliente, data_compra) VALUES (10, '2022-08-24');
INSERT INTO compras (id_cliente, data_compra) VALUES (11, '2022-09-01');
INSERT INTO compras (id_cliente, data_compra) VALUES (12, '2022-10-07');
INSERT INTO compras (id_cliente, data_compra) VALUES (13, '2022-11-15');


-- produtos compra

INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (2, 1, 2);
-- Inserção de valores na tabela produtos_compra
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (2, 1, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (3, 2, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (4, 2, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (5, 3, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (6, 4, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (7, 5, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (8, 6, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (9, 7, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (10, 7, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (11, 8, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (12, 9, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (13, 10, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (14, 11, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (15, 12, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (16, 13, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (17, 14, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (18, 15, 3);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (19, 16, 1);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (2, 17, 2);
INSERT INTO produtos_compra (id_produto, id_compra, quantidade) VALUES (3, 18, 3);
	

-- receita medicas

INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (4, 1, 'receita.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (4, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (4, 2, 'receita2.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (7, 3, 'receita3.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (12, 4, 'receita4.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (8, 5, 'receita5.pdf');



