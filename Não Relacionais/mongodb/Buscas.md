# Buscas no MongoDB

## Buscas Simples

Para verificar os dados de uma coleção, digite:

```bash

db.NomeDaColeção.find()

```
Equivalente ao SELECT * FROM NomeDaColeção.


Substitua o NomeDaColeção pelo nome da coleção que deseja verificar.

Para fazer uma busca especifica, digite:
    
 ```bash

db.NomeDaColeção.find({
    "campo1": "valor1",
    "campo2": "valor2",
    ...

})

```

Onde campo1, campo2, ... são os campos que deseja buscar, e valor1, valor2, ... são os valores que deseja buscar.

Exemplo:

```bash

db.pessoas.find({
    "nome": "Paulo"
})

```

Isso é o equivalente a SELECT * FROM pessoas WHERE nome = "Paulo".


Suponha que você tenha um arquivo neste formato:

```bash

{
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:13:32.711Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' }
    ]
  }

```

Para fazer a busca de todas as pessoas de um determinado curso, digite:

```bash

db.inscricoes.find({
    "curso.nome": "Ciência da Computação"
})

```

O campo curso é um objeto javascript, por isso, para fazer a busca de um campo dentro de um objeto javascript, é necessário utilizar o ponto.

```bash

db.inscricoes.find({
    "skills.nome": "Python"
})
```
Buscando por um campo dentro de um array.

## Buscas com operadores

### Operador $or

Operador $or é utilizado para fazer uma busca com mais de uma condição. É o equivalente ao OU lógico.

Exemplo:

```bash

db.inscricoes.find({
    $or: [
        {"skills.nome": "Python"},
        {"skills.nome": "Banco de Dados"}
    ]
})

```

Buscando pelas pessoas que possuem a skill Python ou a skill Banco de Dados.

### Operador $and

Operador $and é utilizado para fazer uma busca com mais de uma condição. É o equivalente ao E lógico.

Exemplo:

```bash

db.inscricoes.find({
    $and: [
        {"skills.nome": "Python"},
        {"skills.nivel": "Avançado"}
    ]
})

```

Buscando pelas pessoas que possuem a skill Python e o nível Avançado.

### Operador $in

Operador $in é utilizado para fazer uma busca com mais de uma condição. É o equivalente ao IN do SQL.

Exemplo:

```bash

db.inscricoes.find({
    "skills.nome": "Python",
    "skills.nivel": {
        $in: ["Avançado", "Intermediário"]
    }
})

```

### Operador $gt

Operador $gt é utilizado para fazer uma busca com mais de uma condição. É o equivalente ao > do SQL.

Exemplo:

```js

db.inscricoes.find({
        "notas": {
            $gt: 8.0 // Buscando pelas pessoas que possuem nota maior que 8.0
        }
    }
    )

```

#### O operador $gte é utilizado para fazer uma busca com mais de uma condição. É o equivalente ao >= do SQL.

Como fazer para buscar Apenas 1 registro?

```js

db.inscricoes.findOne({
        "notas": {
            $gt: 8.0 // Buscando pelas pessoas que possuem nota maior que 8.0
        }
    }
    )

```

### Metodo sort()

O método sort() é utilizado para ordenar os resultados de uma busca.


```js

 db.inscricoes.find().sort("aluno") // ordem crescente


```


```js

db.inscricoes.find().sort({"aluno": -1}) // ordem decrescente

```

### Metodo limit()

O método limit() é utilizado para limitar a quantidade de resultados de uma busca.

```js

meubanco> db.inscricoes.find().sort({"aluno": -1}).limit(1) // exibir apenas 1 resultado



```
