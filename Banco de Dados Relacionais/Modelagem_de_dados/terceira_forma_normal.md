# Terceira Forma Normal (3FN)

Cada forma norma tende a ir refinando a modelagem deixando a estrutura de dados mais integra e exclusiva, assim evita-se repetições desnecessarias e possiveis sobrecarga no gerenciador de banco de dados.

Uma tabela só poderá estar na 3FN se ela já estiver na 2FN.

Além disso para a tabela estar na 3FN é necessário que nenhuma coluna não chave dependa de outra coluna não chave.

Ou seja remove-se os campos que são obtidos pela equação de outros campos

![Alt text](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/images/3fn.png)

Observe nessa tabela o campo Subtotal, o que ele representa? 

O campo subtotal representa uma equanção entre a quantidade de itens pelo preço único do item.

Ou seja o subtotal está relacionado com a quantidade e valor_unit

## Como se resolve?
Simplesmente exclui essa coluna.

Não faz sentido manter um campo desnecessário, esse valor é facilmente obtido pela multiplicação de outros dois campos que não são chaves.

![Alt text](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/images/3FN.png)

Essa tabela representa uma tabela normalizada dentro das três formas.

Podemos fazer algumas mudanças nessa tabela, como por exemplo a coluna valor_unit não faz sentido estar presente nessa tabela, ela está mais relacionado com o produto.

![Alt text](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/images/ped_prod.png)

Portanto a tabela final ficaria assim