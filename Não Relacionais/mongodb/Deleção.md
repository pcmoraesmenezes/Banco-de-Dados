# Deleção no MongoDB

As deleções no MongoDB são realizadas através do método `remove()`.

O método recebe um parâmetro, que é o filtro, que é utilizado para selecionar os documentos que serão deletados.

O comando `remove()` irá deletar apenas o primeiro documento que encontrar, caso exista mais de um documento que atenda ao filtro.

Para deletar todos os documentos que atendam ao filtro, é necessário utilizar o parâmetro `multi` e passar o valor `true`. Exemplo:

```js

db.collection.remove(
  { filtro },
  { multi: true }
);

```

Exemplo de deleção:

Dado o seguinte objectID: ` _id: ObjectId('6586b2cc24755feb4b84c8bd'`

```js

db.inscricoes.remove({
    "_id" : ObjectId('6586b2cc24755feb4b84c8bd')
    }
)
    
```

O método `remove()` é deprecado, recomenda-se utilização do método `deleteOne()` ou `deleteMany()`.

Para o caso de remoção de um único documento, deve-se utilizar o método `deleteOne()`, que recebe um parâmetro, que é o filtro, que é utilizado para selecionar o documento que será deletado. É recomendavel a deleção através do id, pois é único.

Para remover mais de um documento, deve-se utilizar o método `deleteMany()`, que recebe um parâmetro, que é o filtro, que é utilizado para selecionar os documentos que serão deletados.

Exemplo de deleção utilizando o método `deleteMany()`:

```js

db.inscricoes.deleteMany({
    "curso.nome": "Odontologia"
    }
)