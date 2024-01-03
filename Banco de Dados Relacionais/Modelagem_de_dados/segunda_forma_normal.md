## Segunda Forma Normal (2FN)

Uma entidade só estará na segunda forma normal se ela já se encontrar na primeira forma normal.

Além disso, todos os atributos não chave devem ser totalmente dependentes da chave primaria.

![Alt text](/Modelagem_de_dados/images/segunda_forma_normal.png)

Nesse exemplo da tabela pedidos, ela se encontra na primeira forma normal. O N_pedido é a chave primaria.
O restante é não chave.

## Os campos não chave são totalmente dependentes da chave? 

Pense da seguinte forma. A tabela é de pedidos, o pedido foi feito em cima de um produto, é interessante saber o código do produto nesse pedido? Sim. O nome do produto deveria estar ai? Na verdade não, o produto não é totalmente dependente da chave primaria, que é o N_pedido, ele é dependente do código do produto, ele está diretamente ligado ao código do produto.


![Alt text](/Modelagem_de_dados/images/2FN.png)

Aplicando a segunda forma normal temos uma nova tabela, observe que removemos um campo da tabela pedidos e cria-se uma tabela produtos, onde tem-se o código_produto e o produto, o código_produto está intimamente ligado a tabela pedidos.
Há um relacionamento entre as tabelas. O código_produto é uma chave estrangeira, ele é uma chave primaria em uma outra tabela.

Quando se aplica as normalizações é comum gerarmos novas tabelas.