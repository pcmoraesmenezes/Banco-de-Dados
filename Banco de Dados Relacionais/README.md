# Banco de dados relacionais 🗄️

São conhecidos como bancos SQL.

A ideia surgiu no artigo de Edgar Frank Codd na decada de 70
Baseado no modelo relacional, onde os dados estão guardados entre tabelas que por sua vez podem ou não estar relacionadas. 

Os dados são guardados entre linhas e colunas, os campos são guardados nas colunas e os dados nas linhas.

Pontos positivos:
- Os Sistemas Gerenciadores de Banco de Dados (SGBDs) oferecem aos usuarios processos de validação, verificação e garantia de integração de dados.
- Oferece controle de concorrência, ou seja em um cenario onde se tem muita requisições ao banco de dados, os SGBDs garantem a recuperação de falhas e segurança,
controle de transações, otimização de consulta dentre outras
- Controle de transações -> Transação é qualquer ação realizada no banco de dados, ou seja, uma consulta, uma inserção, atualização, deleção de dados.

Pontos Negativos:
- Existe uma dificuldade em conciliar o modelo relacional com linhas e colunas de uma tabela com uma demanda por escabilidade cada vez mais frequente
- Escabilidade:  Por exemplo um sistema está sendo acessado por 10 usuarios, e esses usuarios divulgam esse sistema para outros usuarios que em pouco tempo 
aumenta significativamente a quantidade de usuarios presentes, se o banco de dados não for escalavel, ele não conseguirá atender a demanda de acesso ao banco de 
dados e o sistema irá cair. Ou seja a ação de conseguir elevar o suporte a diversos acessos a um sistema. 
- Existe uma dificuldade de se organizar os dados em um sistema distribuido trabalhando com particionamento de dados. Ou seja entra na questão da escabilidade.

Principais banco de dados Relacionais:
- Oracle DataBase
- SQL Server 
- MySQL
- SQlite
- PostgreSQL
- MariaDB
