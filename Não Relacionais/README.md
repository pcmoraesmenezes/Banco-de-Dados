# Banco de dados não relacionais 📁

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