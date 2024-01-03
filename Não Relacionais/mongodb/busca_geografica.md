# Busca Geográfica no MongoDB

Quando se deseja trabalhar com coordenadas geográficas, o MongoDB oferece um recurso de busca geográfica, que permite encontrar documentos que estejam próximos a uma determinada coordenada.

Entretanto, é necessário existir um campo chamado `coordinates` e especificar o `type` como `Point` para que o MongoDB entenda que é um campo de coordenadas geográficas.

Exemplo:

```js

{
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1, 9.5 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' },
      { nome: 'Java', nivel: 'Intermediario' }
    ],
    localizacao: {
      endereco: 'Avenida AMV, 2005',
      coordinates: [ -20.38808, -54.577545 ],
      type: 'Point'
    }
  }

```

Antes de prosseguir, como importar os dados de exemplo?

No terminal do sistema operacional, digite:

```bash

mongoimport -d nome_banco_de_dados -c colecao --jsonArray < arquivo.json

```

Como utilizar os recursos avançados do MongoDB para buscar dados geográficos?

- Informar qual o campo que deve ser utilizado como indice de busca

```js

db.inscricoes.createIndex({
    "localizacao": "2dsphere"
})

```

Isso signifca que o campo `localizacao` será utilizado como indice de busca. O `2dsphere` é o tipo de indice que será utilizado.

- Deve realizar uma consulta utilizando agregação para buscar os dados geográficos

```js

db.inscricoes.aggregate([
    {
        
        $geoNear: { //proximidade geográfica
            "near": {
                 "coordinates": [ -20.38808, -54.577545 ],
                    "type": "Point"
            },
            "distanceField": "distancia.calculada", //campo que será criado para armazenar a distancia calculada
            "spherical": true, //esferico
        }
    },
        {
            $limit: 3 //limitar a 3 registros
        }
            
])

```

O campo `distancia.calculada` não é adicionado ao registro, isso é apenas uma busca, isso só existe no resultado

O primeiro resultado é o proprio valor 

```js

[
  {
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1, 9.5 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' },
      { nome: 'Java', nivel: 'Intermediario' }
    ],
    localizacao: {
      endereco: 'Avenida AMV, 2005',
      coordinates: [ -20.38808, -54.577545 ],
      type: 'Point'
    },
    distancia: { calculada: 0 }
  },
  {
    _id: ObjectId('65895709d6957a7bbe6582d6'),
    aluno: 'Fortuna',
    localizacao: { type: 'Point', coordinates: [ -20.388008, -54.577546 ] },
    distancia: { calculada: 4.646807205414087 }
  },
  {
    _id: ObjectId('65895709d6957a7bbe6582df'),
    aluno: 'Angelina',
    localizacao: { type: 'Point', coordinates: [ -20.393017, -54.565923 ] },
    distancia: { calculada: 1332.395587956312 }
  }
]

```

Para remover o primeiro valor, basta utilizar o `$skip`

```js

db.inscricoes.aggregate([
    {
        
        $geoNear: { //proximidade geográfica
            "near": {
                 "coordinates": [ -20.38808, -54.577545 ],
                    "type": "Point"
            },
            "distanceField": "distancia.calculada", //campo que será criado para armazenar a distancia calculada
            "spherical": true, //esferico
        }
    },
        {
            $limit: 3, //limitar a 3 registros,
        },
        {
            $skip: 1 //pular o primeiro registro
        }
            
])

```
