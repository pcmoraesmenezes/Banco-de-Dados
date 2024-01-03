# Primeira forma Normal
## Também conhecida como 1FN

Contextualizando: <br>
O processo de normalização aplica uma série de regras sobre as tabelas de um banco de dados para verificar se estas estão sendo corretamente projetadas.
<br><br>
Embora existam cinco formas normais(ou regras de normalização), na prática usamos um conjunto de <strong>Formas Normais</strong>, ou seja, um banco de dados é considerado normalizado se nele foram aplicadas as regras destas três formas normais.

Uma entidade (tabela), estará na primeira forma normal (1FN) se todos os campos forem atômicos (simples) e não multivaloriados(multiplos valores)

![Texto alternativo](/Modelagem_de_dados/images/1FN.png)

Observe que o campo telefone é multivaloriado, ou seja tem multiplos valorios no mesmo campo, observe o código do cliente, ele é atômico, o mesmo para o nome.
O mesmo para o campo endereço, ele também está multivalorado. 
Essa tabela está em desacordo com a Primeira forma normal.
## Como resolver esse problema?

Observe que o campo endereço possuí três partes, então a ideia é dividir isso em 3 campos da mesma tabela.


![Texto alternativo](/Modelagem_de_dados/images/1FN_concertado.png)

A tabela então ficará dessa forma. Remove-se o endereço e divide-se as partes do endereço. Dessa forma os valores ficam simples, atômicos, observe que o numero da casa faz parte da rua então não tem influência.

Entretanto ainda resta resolver a questão do telefone, que ainda está multivaloriado.

Não se pode criar duas tabelas para um unico campo, como forma de resolver esse problema, pois nem todos clientes tem dois telefones, logo a tabela ficaria vazia.

Pode-se porém criar uma nova tabela, uma forma inteligente de contornar o problema.

![Alt text](/Modelagem_de_dados/images/1fn%20concertado.png)

A tabela corrigida ficaria dessa forma. Têm-se o código do cliente e o numero de telefone. Note que os códigos ali são os mesmos do cliente.

### O processo de normalização é sequencial, isso significa que so se pode aplicar as próximas regras para as próximas forma se estas ja estiverem previamente normalizadas!

## Quais os problemas de uma tabela não normalizada com a 1FN?
-   Redundacia de dados (como se faria uma busca em um banco de dados com valores redundantes?)
-   Desorganização dos dados
-   Como se faria uma busca de todos os clientes que morassem na cidade de são paulo? Ou no estado de SP? A consulta demoraria bastante

## Toda tabela precisa ser normalizada obrigatoriamente?
Não, a normalização é um processo que deve ser aplicado em casos especificos onde o problema for identificado. Tudo depende de como a analise dos dados foi feito.
