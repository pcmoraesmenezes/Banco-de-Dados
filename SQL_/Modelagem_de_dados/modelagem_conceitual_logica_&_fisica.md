# Modelagem

Os modelos de banco de dados são usados para descrever, mais detalhadamente, a estruturada
de um banco de dados. Eles servem então como parte importante da documentação dos sistemas
que auxiliam nao somente os desenvolvedores que estão trabalhando no projeto, mas tambem
servem como documentação que pode ser entregue ao cliente que contratou o serviço de desenvolvimento.

Um modelo de dados não informa quais dados estão armazenados em um banco de dados, mas sim apenas
quais e que tipos de dados contém.

*Os modelos são baseados em três niveis: Conceitual, Lógico e Físico*


Modelagem -> Modelos
Modelagem conceitual -> Modelo conceitual
Modelagem Lógica -> modelo logico 
Modelagem Físifca -> modelo físico

Usa-se modelagem para ajudar a descrever com mais detalhes uma estrutura do banco de dados.

## Modelagem Conceitual

- Modelo mais alto nível, ou seja tá mais próximo dos usuários

- Quanto mais alto nível, mais facíl a compreensão dos conceitos, quanto mais baixo o nível, mais facil das maquinas entenderem.

- Alto nível de abstração, ou seja, a partir dos requisitos do sistemas, extraidos na fase de levantamento
    de requisitos pelos analistas de sistemas.
    - Abstração é extrair informações mais importantes, ou seja quando se cria um modelo conceitual, se coloca aquilo que é 
    importante. Isso é feito através do documento do requisito de sistemas.

    - O modelo pode ser elaborado de forma textual ou por meio de dois diagramas: Diagrama de entidade e relacionamento e/ou
    Diagrama de Classes

    Exemplo de Modelo conceitual de forma textual:
    - Imagine um sistema que exista duas entidades(tabelas), cliente e pedido.
    - O sistema terá o cadastro do cliente que terá os sseguintes dados: Nome completo, tipo de pessoa(fisica ou juridica), endereço
        bairro, cidade, estado, telefone, email, nome de contato
    - Já a tabela pedido terá os seguintes dados: codigo do produto, quantidade, codigo do cliente, codigo do vendedor
    - Esse modelo de forma textual não é tão interessante, deseja-se buscar a parte gráfica.

Parte gráfica: ![Alt text](/Modelagem_de_dados/images/conceitual1.png)
    Exemplo de DER - Diagrama de Entidade e Relacionamento ou MER - Modelo de entidade e relacionamento
    Uma outra forma seria utilizando um diagrama de classes, mas esse tipo de diagrama implica que o sistema será desenvolvido
    usando orientação a objetos. POrém nem todo o sistema e feito usando orientação a objetos, portanto recomenda-se utilizar o MER
    O modelo MER É independente de implementação

## Modelo Lógico
Descreve como os dados serão armazenados no banco de dados e seu relacionamento

Nesse modelo pode-se definir a tecnologia utilizada para a armazenagem dos dados, por exemplo ou o banco de dados relacionais ou não relacionais.
    
    
Formas de representação de um modelo logico:
![Alt text](/Modelagem_de_dados/images/modelo_logico1.png) 

Nessa forma temos basicamente a definiçao dos nomes de tabela,colunas e exemplificação dos dados que serão armazenados.

Além disso conseguimos observar o tipo dos dados, por exemplo pode-se observar que código será um tipo inteiro e o campo Descrição será um tipo string.


![Alt text](/Modelagem_de_dados/images/modelo_logico2.png) Exemplo de um banco de dados relacionais, temos a definição de uma tabela - Produto e tipo de produto

É a mesma descrição da imagem anterior, entretanto é uma forma diferente de representação.

Temos uma definição das chaves de cada tabela, ou seja o identificador de cada registro da tabela, na imagem é código, estão destacadas. Os 
        campos em branco são campos comuns. Além disso temos um relacionamento do produto, que é do tipo 
![Alt text](/Modelagem_de_dados/images/modelo_logico3.png)

Basicamente temos a definição dos nomes de tabela, suas colunas e definição das chaves de cada tabela.
        
Os campos sublinhados são as chaves, ou seja o identificador do registro.


## Modelo Físico
- Também chamado de modelo de implementação, descreve por meio de alguma linguagem, usualmente SQL, de como será feita a armazenagem do banco.
- Nesse nivel se escolhe qual sistema gerenciador de banco de dados será utilizado.
- No model ofisico é o momento da criação da tabela, é o último passo para se tomar uma decisão do tipo utilizado, é o modelo de implementação!
- Exemplos:
    - ![Alt text](/Modelagem_de_dados/images/modelo_fisico1.png)-> Nessa imagem temos uma preparação para a implementação, essa tabela servirá de cadastro para o cliente.
    - ![Alt text](/Modelagem_de_dados/images/modelo_fisico2.png) -> Utilizando a linguagem SQL, utilizaa-se essa forma para a criação de tabelas e dados.

- ## Outros conceitos essenciais:
    - ### Entidade:
     Objeto ou evento do mundo real sobre o qual desejamos manter registros em um banco de dados.

    Ex: Aluno, carros, produto, vendedor, venda, etc.
    
     ![Alt text](/Modelagem_de_dados/images/modelo_logico2.png)-> Para essa tabela, tem-se duas entidades:
    Produto e Tipo de produto. Ou seja são as tabelas

    - ### Atributo:
     Propriedade ou caracteristica que descreve uma entidade. São as colunas (campos) das tabelas que irão armazenar os dados.
    
    #### Entidade Produto: código, descrição e preço
    Entidade Tipo de Produto: código, descrição.
    Uma entidade deve ter atributos. ![Alt text](/Modelagem_de_dados/images/modelo_logico2.png) Para essa imagem acima temos os atributos: preço, descrição e codigo para a entidade Produto e descrição 
    e codigo para a entidade Tipo de Produto.

    - ### Atributo chave: 
    Também conhecido como chave primaria, primary key ou pk.
    
     É um campo que deve possuir valor unico em todo o conjunto de dados da entidade.

    Esse atributo é usado para identificar unicamente um registro da tabela
    ![Alt text](/Modelagem_de_dados/images/modelo_logico2.png) o Atributo chave é código para ambas entidades.

    - ### Relacionamentos:
     Geralmente as entidades nunca estão sozinhas. Normalmente estão associadas com outras entidades.

    Ou seja uma tabela está associada, mantém relaciomaneto com outra tabela.
    
    Reconhecer e registrar os relacionamentos entre entidades fornece 
    uma descrição muito mais rica do modelo, fica mais claro e melhor utilizado.

    O relacionamento pode acontecer entre uma, duas ou varias entidades.
   ![Alt text](/Modelagem_de_dados/images/modelo_logico2.png) 
    temos um relacionamento entre a entidade produto e tipo de produto.
    Isso indica que um produto tem um tipo.

    - ### Chave estrangeira: 
    Tambem conhecida como foreign key ou fk.

    A chave estrangeira é um atributo presente em uma entidade que indica um relacionamento e representa a chave primaria de uma outra
    entidade.

   ![Alt text](/Modelagem_de_dados/images/modelo_logico2.png) 
   temos que a entidade produto teria um atributo que seria a representação de uma outra
    entidade nela. Neste caso a outra entidade é tipo de produto.

    - ### Grau de relacionamento:
    Indica a quantida de entidades ligadas a um relacionamento.

    Os principais graus de relacionamento são: Unario, binario e ternario.

    - ### Unario:
        ![Alt text](/Modelagem_de_dados/images/unario.png)
         Nessa foto temos dois exemplos de um relacionamento unario, também chamado de grau 1.

        Uma entidade se relaciona com ela mesmo. Dependendo do tipo da empresa, temos um funcionario que gerencia outros funcionarios. Um funcionario
        gerencia outros funcionarios.

        Outro exemplo Pessoa, outra pessoa pode geralmente casar com outra pessoa.
        
        Não é comum esse tipo de relacionamento 

    - ### Binario: 
        ![Alt text](/Modelagem_de_dados/images/binario.png) Nessa foto temos dois exemplos. Uma entidade se relaciona com outra entidade. Chamado tambem de grau 2.

        É o tipo mais comum de relacionamento.

        No exemplo temos a entidade vendedor que vende um produto, existe uma relação entre vendedor e produto.

        Aluno cursa uma disciplina, existe uma relação.

    - ### Ternario:
        Também chamado de grau 3: Tres entidades estão relacionadads por um mesmo relacionamento.![Alt text](/Modelagem_de_dados/images/ternario.png)
        Temos um pedido relacionado com 3, existe uma entidade cliente, tipo de pagamento e vendedor, existe um relacionamento pedido, as tres entidades estão relacionadas na mesma relação.

        Dependendo da complexidade do projeto podemos ter relacionamentos com grau quaternario, grau 5, 6, 7 etc...
        ## O mais comum é binario. 

    ### Cardinalidade (Máxima):
    - Define a quantidade maxima de ocorrencias de uma entidade que podera estar associada a outra entidade.

    Exemplo: Um vendedor pode vender apenas um tipo de produto? ou dois? ou tres? Um produto pode ser vendido por apenas um vendedor? ou por todos?
        
    #### Relacionamento Binario Um para um (1:1):
    - ![Alt text](/Modelagem_de_dados/images/um_para_um.png)
            Esse relacionamento indica que uma ocorrencia da entidade A pode se relacionar excluisavmente com uma ocorrencia da entidade B e vice versa.

        No exemplo da imagem, temos que um vendedor so pode trabalhar em um vendedor, e um escritorio so comporta um vendedor.
            
         Note a enumeração em cada uma das pontas para indicar a cardinalidade do relacionamento.

    #### Relacionamento Binario Um - Para - Muitos (1:n)
    ![Alt text](/Modelagem_de_dados/images/um_para_muitos.png)
        - Indica que uma ocorrencia da entidade A pode se relacionar com varias ocorrencias da entidade B, porem o inverso nao é permitido.
    
    Para a imagem, temos que um vendedor atende muitos clientes, porém cada cliente é atendido apenas por um vendedor especifico.
    Um grupo de 10 clientes por exemplo é atendido pelo mesmo vendedor.

    #### Relacionamento Binario Muitos - para Muitos (n:m):
    - Indica que uma ocorrencia da entidade A pode se relacionar com varias ocorrencias da entidade B e vice versa.

    - Exemplo, um vendedor atende muitos clientes e um cliente pode ser atendido por varios vendedores.

    - Na prática o relacionamento n:m é dividido em duas relações 1:n e uma nova entidade é criada para representar o relacionamento
    ![Alt text](/Modelagem_de_dados/images/muitos_para_muitos.png)   

    ### Cardinalidade (Minima):
    - Define a quantidade minima de ocorrencias de uma entidade que precisa estar associada a outra entidade (em carater obrigatorio).

    - São consideradas como cardinalidades minimas: 0 e 1

    - São representadas por: 0..1, 1..1, 0..n, 1..n, o..*, 1..*, etc (o asterisco significa muitos)

    Exemplo : ![Alt text](/Modelagem_de_dados/images/minimo_zero_maximo_um.png) Um vendedor ocupa um unico escritorio, porém é obrigatorio que ele tenha um escritorio,
        ou seja lê se no minimo um, no maximo um. 
        
    Um escritorio pode ser ocupado por um unico vendedor, porem pode ser que a sala esteja vazia, ainda sem vendedor

    Um escritorio pode estar vazio, mas um vendedor nunca terá um escritorio vazio!

    Formas de Representação:
        - Podemos encontrar uma variedade grande de representações graficas para o MER: os mais comuns são o:
        ![Alt text](/Modelagem_de_dados/images/um_varios.png)
        Clássico -> tem-se o relacionamento incluindo a cardinalidade, o 1 indica um e um. Para o lado do cliente, temos um e 
        muitos.
        ![Alt text](/Modelagem_de_dados/images/pe_de_galinha.png)
        Pé de galinha -> é chamada de pé de galinha por causa dos simbolos, na representação tem-se o mesmo significado do classico acima
        tem-se uma relação um um, e um muitos.

    - Ferramenta interessante para a modelagem:
        - MySQL Workbench

Resumo:

Do negocio -> Modelo tarefa do usuario (feita pelos analistas do sistema, gerando um documento de requisitos) -> modelo conceitual -> modelo logico -> modelo fisico -> ao sistema