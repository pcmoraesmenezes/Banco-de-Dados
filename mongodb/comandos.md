# Comandos Para o MongoDB

Para iniciar o MongoDB no terminal, digite:
```bash
mongosh
```

Use é utilizado para selecionar um banco de dados, caso ele não exista, ele será criado.

```bash
use
```

Para verificar o banco de dados que está sendo utilizado, digite:

```bash

db
```

O show dbs é utilizado para mostrar todos os bancos de dados existentes.

```bash
show dbs
```

O show collections é utilizado para mostrar todas as coleções existentes.

```bash
show collections
```

O show users é utilizado para mostrar todos os usuários existentes.

```bash
show users
```

Para criar uma coleção vazia digite:

```bash

db.createCollection("NomeDaColeção")

```


Para criar uma coleção no MongoDB, digite:

```bash

db.NomeDaColeção.insert({
    "campo1": "valor1",
    "campo2": "valor2",
    ...
})

```
