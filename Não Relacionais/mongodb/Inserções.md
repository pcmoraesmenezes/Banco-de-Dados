# Inserções no MongoDB

Inserções no MongoDB são feitas utilizando o comando insert.

```bash

db.NomeDaColeção.insert({
    "campo1": "valor1",
    "campo2": "valor2",
    ...
})

```

Atenção: Se fizer insert em uma coleção que não existe, o MongoDB irá criar a coleção e inserir o documento.

O insert é depreciado, porém, ainda funciona. Para inserir um documento, utilize o insertOne ou insertMany.

InsertOne é o equivalente ao INSERT INTO do SQL, ou seja, insere apenas um documento na coleção.

Já o insertMany é necessário passar um array de documentos, e ele insere todos os documentos do array na coleção.

Exemplo:

```bash

db.pessoas.insertOne({
    "nome": "Paulo",
    "idade": 20,
    "sexo": "M"
})

```

Isso é o equivalente a INSERT INTO pessoas (nome, idade, sexo) VALUES ("Paulo", 20, "M").

```bash

db.pessoas.insertMany([
    {
        "nome": "Paulo",
        "idade": 20,
        "sexo": "M"
    },
    {
        "nome": "Maria",
        "idade": 30,
        "sexo": "F"
    },
    {
        "nome": "João",
        "idade": 40,
        "sexo": "M"
    }
])

```

Isso é o equivalente a INSERT INTO pessoas (nome, idade, sexo) VALUES ("Paulo", 20, "M"), ("Maria", 30, "F"), ("João", 40, "M").

Lembrando: O funcionamento do Mongo é baseado em objetos javascript, por isso, os campos e valores são passados entre chaves.

Isso permite que seja passado um objeto javascript como valor de um campo.

Exemplo:

```bash
db.inscricoes.insert({
 "aluno": "Paula Fernandes",
 "data": new Date(),
 "curso": {
 "nome": "Programação para internet",
 }
)
```

É possível passar ainda mais objetos javascript como valor de um campo.

Exemplo:

```bash
db.inscricoes.insert(
{
    "aluno": "Luana",
    "data": new Date(),
    "curso": {
         "nome": "Ciência da Computação" },

    "notas": [9.7, 9.3, 9.2],
    "skills": [
    {
        "nome": "Python",
        "nivel": "Avançado"
    },
    {
        "nome": "Banco de Dados",
        "nivel": "Avançado"
    }
    ]
}
)
```