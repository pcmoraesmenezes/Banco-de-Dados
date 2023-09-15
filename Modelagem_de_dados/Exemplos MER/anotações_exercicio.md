# Anotações sobre o exercicio

Observe que há dois tipos de picolés - Normal (agua) e ao Leite.

As informações padrões dos picolés são -> Sabor, Ingredientes, preço e tipo de embalagem, todos picoles tem esses atributos

Para cada picole existem varios ingredientes.

Picolés normais possuem um conjunto de aditivos nutritivos (sais minerais ou vitaminas) cada um com um nome e uma formula quimica.
Está no plural pois um picole pode ter mais de um aditivo.

Picoles ao leite contem um conjuto de conservantes, cada um com um nome e uma descrição

Os dois tipos de picoles são vendidos em lotes exclusivos, ou seja cada lote tem um único tipo exclusivo, so irá ter ao leite ou normais.

## Dicas para fazer uma modelagem
-   Separe as informações por etapa!
    ### -- Linha de contextualização ---

     Uma empresa fabricante de picoles deseja armazenar informações acerca de seus negocios.

     [1]
     
     #### Entidades: 
     -  picoles(id, preço, tipo da embalagem)
     - tipos de picoles (id, nome)
     -  Tipo da embalagem (id, nome)
     -  Ingredientes (id, nome)
     -  Ingredientes Picole (id, id picole, id ingrediente)
     -  Sabor(nome, id)

     OBS: um picole pode ter varios ingredientes;

     Os picoles fabricados são divididos em normal (com agua) e ao leite.
     As informações comuns armazenadas dos picoles são: sabor, ingredientes, preço e tipo da embalagem.


    Entidades:
    -   Aditivos Nutritivos(id, nome, formula quimica)
    -   Conservantes(id, nome, descrição)
    -   Aditivos nutritivos picole ( id, id aditivo nutritivo , id picole)
    -   Conservantes picole (id, id conservante, id picole)    

    [2]

     Especificamente, picoles normais possuem um conjunto de aditivos nutritivos (vitaminas ou sais minerais) cada um com um nome e formula quimica; e picoles ao leite contem um conjunto de conservantes, cada um com nome e descrição

    Entidades:
    -   Lotes (id, id tipo picole, quantidade)
    -   Notas fiscais (id, data, valor, numero de serie, descrição, id revendedor)
    -   Lotes Nota Fiscal (id, id lote, id nota fiscal)

    [3]

     Os dois tipos de picoles são vendidos em lotes exclusivos (ou normais, ou ao leite) para os revendedores e cada venda gera uma nota fsical que pode conter um ou varios lotes.  
     AS notas fiscais possuem data, valor, numero de serie e descrição

   
    Entidades:
    -   Revendedores (id, cnpj, razão social, contato)

    [4]

     Todo revendedor possui uma pessoa de contrato para eventuais resoluções de problemas, além disso, armazena-se do revendedor o CPNJ e a razão social

    ### --- Linha de contextualização ---

     Deseja-se obter relatorios sobre as vendas mensais dos picoles de cada tipo e quais revendedores compraram mais picoles nos ultimos meses.


     Note como as informações estão mais claras

### O que precisa ser feito?
-   Encontrar as entidades
-   Definir os atributos
-   Definir os relacionamentos
