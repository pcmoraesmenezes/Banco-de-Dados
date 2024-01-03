# Banco de dados relacionais 🗄️

## 🏁 Tópicos

- [Breve Introdução](#breve-introdução-👾)
- [Vantagens](#vantagens-📈)
- [Desvantagens](#desvantagens-📉)

## Breve Introdução 👾

São conhecidos como bancos SQL (Structured Query Language)

A ideia surgiu no artigo de Edgar Frank Codd na decada de 70
Baseado no modelo relacional, onde os dados estão guardados entre tabelas que por sua vez podem ou não estar relacionadas. 

Os dados são guardados entre linhas e colunas, os campos são guardados nas colunas e os dados nas linhas.

A modelagem relacional é feita através de um diagrama entidade relacionamento, onde se tem as entidades, os relacionamentos e os atributos. 

Principais banco de dados Relacionais:
- Oracle DataBase
- SQL Server 
- MySQL
- SQlite
- PostgreSQL
- MariaDB


## Vantagens 📈

- Os Sistemas Gerenciadores de Banco de Dados (SGBDs) oferecem aos usuarios processos de validação, verificação e garantia de integração de dados.

- Oferece controle de concorrência, ou seja em um cenario onde se tem muita requisições ao banco de dados, os SGBDs garantem a recuperação de falhas e segurança,
controle de transações, otimização de consulta dentre outras.

- Controle de transações -> Transação é qualquer ação realizada no banco de dados, ou seja, uma consulta, uma inserção, atualização, deleção de dados.

- Otimização de consulta -> Otimizar uma consulta é tornar ela mais rapida, mais eficiente, mais performatica.

- Segurança -> Garantir que os dados estejam seguros, que não sejam acessados por pessoas não autorizadas.


## Desvantagens 📉

- Existe uma dificuldade em conciliar o modelo relacional com linhas e colunas de uma tabela com uma demanda por escabilidade cada vez mais frequente.

- Escabilidade:  Por exemplo um sistema está sendo acessado por 10 usuarios, e esses usuarios divulgam esse sistema para outros usuarios que em pouco tempo aumenta significativamente a quantidade de usuarios presentes, se o banco de dados não for escalavel, ele não conseguirá atender a demanda de acesso ao banco de dados e o sistema irá cair. Ou seja a ação de conseguir elevar o suporte a diversos acessos a um sistema. 

- Existe uma dificuldade de se organizar os dados em um sistema distribuido trabalhando com particionamento de dados. Ou seja entra na questão da escabilidade.

- Dificuldade de se trabalhar com dados não estruturados, ou seja dados que não se encaixam em um modelo relacional, como por exemplo um arquivo de imagem, um arquivo de audio, um arquivo de video.

## Bancos de Dados Abordados 🎮

- Mysql
- PostgreSQL
- sqlite3

Além disso foi abordado a linguagem SQL em si, como por exemplo DCML, DQL, DDL, DML, DCL, TCL. A modelagem de dados também foi amplamente abordada.

### Acessando Os Projetos 🎥

Os projetos podem ser acessados através dos links abaixo:

- [Mysql](/Banco%20de%20Dados%20Relacionais/mysql/README.md)
- [PostgreSQL](/Banco%20de%20Dados%20Relacionais/PostgreSQL/README.md).
- [sqlite3](/Banco%20de%20Dados%20Relacionais/sqlite3/README.md)
- [Linguagem SQL](/Banco%20de%20Dados%20Relacionais/Linguagem%20SQL/README.md)
- [Modelagem de Dados](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/modelagem_conceitual_logica_&_fisica.md)
- [Primeira Forma Normal](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/primeira_forma_normal.md)
- [Segunda Forma Normal](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/segunda_forma_normal.md)
- [Terceira Forma Normal](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/terceira_forma_normal.md)
- [Outras Formas Normais](/Banco%20de%20Dados%20Relacionais/Modelagem_de_dados/outras_formas_normais.md)