# Outras formas normais 

Um banco de dados é considerado normalizado apenas se estiver sido aplicado as 3 formas normais.

Entretanto a depender do projeto, é possível aplicar a 4FN ou a 5FN

## Quarta Forma Normal(4FN)
É dito que uma entidade estará na 4FN se estiver na 3FN, além disso ela não deverá conter multiplas entravadas multivaloradas, ou seja valores repetidos em diferentes colunas.

![Alt text](/Modelagem_de_dados/images/4fn-1.png)

Essa tabela está armazenando informações sobre planos de saúde e exames de um paciente.

O paciente é o mesmo, o murilo possuí planos na São Camilo e na Unimed, note que ele tem o mesmo exame em laboratorios diferentes.

### Onde se encontra o problema?

Se for realizar uma busca nesta tabela de todos os planos de saúde do paciente, retornará 4 planos.

O mesmo para os exames

Se corrige esse problema dividindo-o em dois grupos.

![Alt text](/Modelagem_de_dados/images/4fn-2.png)

### Outro exemplo

![Alt text](/Modelagem_de_dados/images/4fn-3.png)

Temos uma tabela que armazena informações sobre disciplinas e os professores das mesmas com sua titulação.

Observe que ocorre duplicação de especialista e doutor

Para corrigir, basta separar em duas tabelas diferentes.

![Alt text](/Modelagem_de_dados/images/4fn-4.png)

## Quinta Forma Normal

Uma entidade só estará na quinta forma normal, se ela estiver na 4fn.

ALém disso é necessário que exista um atributo em outra tabela sem a necessidade de sua existencia, sua remoção não ocasiona perda nenhuma de informação

![Alt text](/Modelagem_de_dados/images/5fn.png)

Note que se tem 3 tabelas:
Produtos, fornecedor e nota fiscal

Estas tabelas estão relacionadas pelo Fornecedor e pode-se tirar o campo idProduto e ainda seria possivel acessar o dado através do idFornecedor


