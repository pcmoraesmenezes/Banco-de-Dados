# Atualizações no MongoDB

As atualizações no MongoDB são realizadas através do método `update()`.

O método recebe dois parâmetros, o primeiro é o filtro, que é utilizado para selecionar os documentos que serão atualizados, e o segundo é o objeto com os dados que serão atualizados.

O comando `update()` irá atualizar apenas o primeiro documento que encontrar, caso exista mais de um documento que atenda ao filtro.

Para atualizar todos os documentos que atendam ao filtro, é necessário utilizar o parâmetro `multi` e passar o valor `true`. Exemplo:

```js
db.collection.update(
  { filtro },
  { dados },
  { multi: true }
);
```

O comando `update()` irá substituir o documento original pelo nome especificado no filtro, por isso, é necessário passar todos os campos que serão atualizados.

## Atualizações Simples

Exemplo de atualização:

Dado o seguinte: 
```js
[
  {
    _id: ObjectId('6586b02324755feb4b84c8ba'),
    aluno: 'Paula Fernandes',
    data: ISODate('2023-12-23T10:02:11.685Z'),
    curso: { nome: 'Programação para internet' } // Deseja-se atualizar o nome do curso para " Programação Para Internet"
  }
]

```
### Operador `$set`

Utilizado para atualizar um campo específico, sem alterar os demais campos.

```js

db.inscricoes.update({
 "curso.nome": "Programação para internet"},
    {
    $set: {
            "curso.nome": "Programação Para Internet" // estamos atualizando o nome do curso somente
        }
    }
 )
    
```

O método `update()` é deprecado, recomenda-se utilização do método `updateOne()` ou `updateMany()`.

Mais um exemplo:

```js
 {
    _id: ObjectId('6587f3a069808469f668709a'),
    aluno: 'Fortuna',
    data: ISODate('2023-12-24T09:02:24.102Z'),
    curso: 'Programação Para Internet', // Deseja-se colocar o curso como um objeto
    notas: [ 7, 8.3, 9 ]
  },

```

```js

db.inscricoes.update({
 "curso": "Programação Para Internet"},
    {
    $set: {
            "curso": {
                nome: "Programação Para Internet"
            }
        }
    }
 )
    
```

E se quisermos adicionar um campo? 

```js

{
    _id: ObjectId('6586b02324755feb4b84c8ba'),
    aluno: 'Paula Fernandes',
    data: ISODate('2023-12-23T10:02:11.685Z'),
    curso: { nome: 'Programação Para Internet' }
  },

```
## Atualizações com Arrays

Queremos adicionar um campo chamado skills, que é um array de strings.

```js
 {
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2 ],
    skills: [ // Deseja-se adicionar este campo para o aluno "Paula Fernandes"
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' }
    ]
  },

``` 

Adicionando o campo skills para o aluno Paula Fernandes:

```js

db.inscricoes.update({
 "aluno": "Paula Fernandes"},
    {
    $set: {
            "skills": [
                { nome: 'Html', nivel: 'Intermediario' },
                { nome: 'CSS', nivel: 'Básico' },
                { nome: 'JavaScript', nivel: 'Iniciante' }
            ]
        }
    }
 )
    
```

Até agora foi visto apenas como atualizar um único "aluno", mas e se quisermos atualizar mais de um?

Suponha que o nome do curso "Programação Para Internet" foi alterado para "Programação" e queremos atualizar todos os alunos que estão cursando "Programação Para Internet" para "Programação".

```js

db.inscricoes.update({
 "curso.nome": "Programação Para Internet"},
    {
    $set: {
            "curso.nome": "Programação"
        }
    },
    {
        multi: true // para atualizar todos os documentos que atendam ao filtro
    }
 )
    
```

Mas e para adicionar um novo valor em um array? 

```js

{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2 ], // Deseja-se adicionar uma nova nota para o aluno "Luana"
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' } // Deseja-se adicionar um novo valor no array "skills"
    ]
  },

```

### Operador `$push`

Utilizado para adicionar um valor em um array.

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $push: {
            "notas": 9.5, // adicionando uma nova nota
            "skills": { nome: 'Java', nivel: 'Intermediario' } // adicionando um novo valor no array "skills"
        }
    }
 )
    
```

Observe que o resultado ficou:

```js
{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' },
      'Java'
    ],
    nivel: [ 'Intermediario' ]
  },

```

### Operador `$each`

O operador `$each` é utilizado para adicionar mais de um valor em um array.

Note que o valor foi adicionado no array, mas não foi adicionado como um objeto, como foi especificado no comando. Para que isso ocorra, é necessário utilizar o operador `$each`.

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $push: {
            "notas": 9.5,
            "skills": { $each: [{ nome: 'Java', nivel: 'Intermediario' }] }
        }
    }
 )
    
```

O resultado ficou:

```js
{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1, 9.5 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' },
      'Java',
      { nome: 'Java', nivel: 'Intermediario' }
    ],
    nivel: [ 'Intermediario' ]
  },

```

### Operador `$pull`

O operador `$pull` é utilizado para remover um valor de um array.

Ainda é necessário remover o valor "Java" que foi adicionado como string no array "skills". Para isso, é necessário utilizar o operador `$pull`.

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $pull: {
            "skills": 'Java'
        }
    }
 )
    
```
Agora removendo o ultimo array contendo o valor nivel:

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $pull: {
            "nivel": 'Intermediario'
        }
    }
 )
    
```

O resultado final ficou:
```js

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
    nivel: []
  },

```

Como apagar aquele ultimo array vazio? 

### Operador `$unset`

O operador `$unset` é utilizado para remover um campo de um documento.

```js

db.inscricoes.update(
    { _{ _id: ObjectId('6586b1a924755feb4b84c8bb'), nivel: [] },
   { $unset: { nivel: 1 } } }
)
    
```

Por fim corrigimos:
```js
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
    ]
  },

```



## Mais exemplos - Adicionando campos

```js
{
    _id: ObjectId('6587f3a069808469f668709a'),
    aluno: 'Fortuna',
    data: ISODate('2023-12-24T09:02:24.102Z'),
    curso: { nome: 'Programação' },
    notas: [ 7, 8.3, 6 ] // Vamos alterar esse 6 para 9
  },

```

```js

db.inscricoes.update({
 "aluno": "Fortuna"},
    {
    $set: {
            "notas.2": 9 // alterando o valor do array "notas" na posição 2
        }
    }
 )
    
```

Agora vamos adicionar mais duas notas para o aluno "Fortuna":

```js

db.inscricoes.update({
 "aluno": "Fortuna"},
    {
    $push: {
            "notas": { $each: [ 9.5, 9.7 ] } // adicionando mais dois valores no array "notas"
        }
    }
 )
    
```
---
Vamos adicionar mais um curso para este aluno aqui:
```js
{
    _id: ObjectId('6586b9b8ed0f7330e1d6afa7'),
    aluno: 'Paulo',
    Data: ISODate('2023-12-23T10:43:04.634Z'),
    curso: { nome: 'Odontologia' }, // Vamos adicionar o período do curso
    notas: [ 9.9, 10, 9.5 ],
    skills: [
      { nome: 'Marketing', nivel: 'Avançado' },
      { nome: 'Excel', nivel: 'Avançado' }
    ]
  },

```

```js

db.inscricoes.update({
 "aluno": "Paulo"},
    {
    $set: {
            "curso.periodo": "Noturno" // adicionando o período do curso
        }
    }
 )
    
```

Vamos agora adicionar uma nova skill para o aluno "Paulo":

```js

db.inscricoes.update({
 "aluno": "Paulo"},
    {
    $push: {
            "skills": { $each: [{ nome: 'Word', nivel: 'Intermediario' }] } // adicionando uma nova skill
        }
    }
 )
    
```

---

Dado o seguinte aluno agora:

```js
 {
    _id: ObjectId('6587f3a069808469f668709b'),
    aluno: 'Vitor',
    data: ISODate('2023-12-24T09:02:24.102Z'),
    curso: { nome: 'Safe and Security' },
    notas: [ 8.3, 8.7, 9 ]
  }

```

Vamos adicionar um campo skills para o aluno "Vitor":

```js

db.inscricoes.update({
 "aluno": "Vitor"},
    {
    $set: {
            "skills": [
                { nome: 'Java', nivel: 'Avançado' },
                { nome: 'Testes (TDD, BDD)', nivel: 'Avançado' }
            ]
        }
    }
 )
    
```
---

### Mais exemplos - Removendo campos

```js

{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1, 9.5 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' },
      { nome: 'Java', nivel: 'Intermediario' } // Deseja-se remover este campo
    ]
  },

```

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $unset: {
            "skills.2": 1 // removendo o campo "skills" na posição 2
        }
    }
 )
    
```

```js

{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.1, 9.5 ], // deseja-se remover a nota 9.1
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' }
    ]
  },

```

```js

db.inscricoes.update({
 "aluno": "Luana"},
    {
    $pull: {
            "notas": 9.1 // removendo a nota 9.1
        }
    }
 )
    
```

```js

{
    _id: ObjectId('6586b1a924755feb4b84c8bb'),
    aluno: 'Luana',
    data: ISODate('2023-12-23T10:08:41.770Z'),
    curso: { nome: 'Ciência da Computação' },
    notas: [ 9.7, 9.3, 9.2, 9.5 ],
    skills: [
      { nome: 'Python', nivel: 'Avançado' },
      { nome: 'Banco de Dados', nivel: 'Avançado' }
    ]
  },

```
---