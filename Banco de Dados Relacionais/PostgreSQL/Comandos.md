# Comandos PostgreSQL

Esse comando é usado para entrar no usuário postgres:

```bash
sudo su - postgres
```

Esse comando é usado para entrar no psql:

```bash
psql
```

Esse comando é para definir uma senha para o usuário postgres:

```bash
ALTER user postgres WITH PASSWORD 'senha';
```

Esse comando é para criar um usuario:

```bash

create user nome_usuario;

```

Esse comando é para alterar as permissões de um usuário:

```bash

psql -c "ALTER USER user PERMISSÃO;"

```

Esse comando é para criar um banco de dados:

```bash

createdb -u nome_usuario nome_banco_de_dados;

```

Para acessar o banco de dados:

```bash

psql -U nome_usuario

```
