# Banco de Dados 🗃️

![Python](https://img.shields.io/badge/-Python-05122A?style=flat&logo=python)&nbsp;
![Static Badge](https://img.shields.io/badge/MySQL-05122A?style=flat&logo=mysql&logoColor=blue)
![Static Badge](https://img.shields.io/badge/PostgreSQL-05122A?style=flat&logo=postgresql&logoColor=blue)
![Static Badge](https://img.shields.io/badge/SQLite-05122A?style=flat&logo=sqlite&logoColor=blue)
![Static Badge](https://img.shields.io/badge/MongoDB-05122A?style=flat&logo=mongodb&logoColor=green)
![Static Badge](https://img.shields.io/badge/Redis-05122A?style=flat&logo=redis&logoColor=red)
![Static Badge](https://img.shields.io/badge/CouchDB-05122A?style=plastic&logo=apachecouchdb&logoColor=red)
![GitHub](https://img.shields.io/badge/-GitHub-05122A?style=flat&logo=github)&nbsp;



## Objetivo 🚀

O objetivo deste repositório é armazenar os conhecimentos adquiridos em  banco de dados. Neste repositorio será abordado diversos bancos de dados relacionais e não relacionais, além de linguagens de consulta e modelagem de dados.

## Algumas breves definições 📝

### Banco de dados relacionais 🗄️

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

### Banco de dados não relacionais 📁

São conhecidos como NoSql(Not only SQL)

Não significa que os bancos de dados não relacionais não utilizem sql, mas eles podem ou não utilizar o sql ou algo diferente, algo a mais.

Esse termo surgiu em 1998 a partir de uma solução de banco de dados que não fornecia uma interface SQL. Essa solução ainda estava baseada na arquitetura original, ou seja relacional.

Passou a ser uma alternativa ao modelo relacional, não mais utilizando linhas e colunas. 

O grande diferencial é a performace, consegue-se trabalhar com os dados de uma forma muito mais rapida por não se fazer uso de linhas e colunas em uma tabela.

Como são livres do modelo comum, ou seja do modelo relacional, promovem alta disponibilidade e maior escalabilidade

Algumas implementações que oferecem:
- Facilita o particionamento e a replicação de dados
- SIstemas baseados em armazenamento de chave e valor
- Sistemas orientados a documentos
- Sistemas orientados a coluna -  Semelhante as linhas e colunas do relacional, entretanto ele utiliza apenas as colunas.
- Sistemas baseado em grafos
- Entre outras

Principais banco de dados não relacionais:
- mongoDB
- elasticsearch
- CouchDB
- Redis
- Oracle Coherence

Ou seja, o modelo relacional lida com os dados em formato de tabelas, tendo linhas e colunas, como se fosse uma matriz, as colunas são os campos da tabela e as linhas
são os dados, a leitura é feita através disto.
Já os bancos de dados não relacionais, os mais comuns trabalham através de chave-valor ou através de documentos (cada inserção do banco de dados é conhecido como um documento)