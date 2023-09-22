Data Transaction Language - Linguagem de Transação de Dados

No subgrupo DTL tem-se t^res comandos:

- COMMIT

- ROLLBACK

- Begin

## Sintaxe

### COMMIT

```sql

COMMIT;
```

### ROLLBACK

```sql

ROLLBACK;
```

### Begin

```sql

BEGIN;
```

O comando COMMIT é utilizado para confirmar as alterações feitas no banco de dados.

O comando ROLLBACK é utilizado para desfazer as alterações feitas no banco de dados.

O comando BEGIN é utilizado para iniciar uma transação.
Uma transação é um conjunto de comandos que são executados como uma única unidade de trabalho.


Imagine a seguinte tabela de alunos:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 20    | SP     |

Imagine que você queira alterar a idade do aluno com id 1 para 21, você deve executar o seguinte comando:

```sql

UPDATE alunos SET idade = 21 WHERE id = 1;
```

Agora imagine que você queira desfazer essa alteração, você deve executar o seguinte comando:

```sql

ROLLBACK;
```

Agora imagine que você queira confirmar essa alteração, você deve executar o seguinte comando:

```sql

COMMIT;
```

Agora imagine que você queira iniciar uma transação, você deve executar o seguinte comando:

```sql

BEGIN;
```

## Exercícios

1.  Crie uma tabela chamada alunos com as seguintes colunas: id, nome, idade, cidade.

2.  Crie uma tabela chamada cursos com as seguintes colunas: id, nome, carga horária.

3. Insira os alunos Lucas(Lucas, 20, RK),Lua(Lua, 24, SP) e Paulo(Paulo, 19, MG) na tabela alunos.

4. Insira os cursos de SQL e Python na tabela cursos para os alunos Lucas e Lua.

5.  Altere a idade do aluno Lucas para 21.

6.  Desfaça a alteração feita no exercício anterior.

7.  Confirme a alteração feita no exercício anterior.

8.  Inicie uma transação.

## Solução:

1. Crie uma tabela chamada alunos com as seguintes colunas: id, nome, idade, cidade.

```sql

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    cidade VARCHAR(255)
);
```

2. Crie uma tabela chamada cursos com as seguintes colunas: id, nome, carga horária.

```sql

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    carga_horaria INT
);
```

3. Insira os alunos Lucas(Lucas, 20, RK),Lua(Lua, 24, SP) e Paulo(Paulo, 19, MG) na tabela alunos.

```sql

INSERT INTO alunos (nome, idade, cidade) VALUES ('Lucas', 20, 'RK'), ('Lua', 24, 'SP'), ('Paulo', 19, 'MG');
```

A tabela ficaria dessa forma:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | Lucas | 20    | RK     |
| 2  | Lua   | 24    | SP     |
| 3  | Paulo | 19    | MG     |

4. Insira os cursos de SQL e Python na tabela cursos para os alunos Lucas e Lua.

```sql

INSERT INTO cursos (nome, carga_horaria) VALUES ('SQL', 40), ('Python', 40);
```

A tabela ficaria dessa forma:

| id | nome   | carga_horaria |
|----|--------|---------------|
| 1  | SQL    | 40            |
| 2  | Python | 40            |

5. Altere a idade do aluno Lucas para 21.

```sql

UPDATE alunos SET idade = 21 WHERE id = 1;
```

A tabela ficaria dessa forma:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | Lucas | 21    | RK     |
| 2  | Lua   | 24    | SP     |
| 3  | Paulo | 19    | MG     |

6. Desfaça a alteração feita no exercício anterior.

```sql

ROLLBACK;
```

A tabela ficaria dessa forma:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | Lucas | 20    | RK     |
| 2  | Lua   | 24    | SP     |
| 3  | Paulo | 19    | MG     |

7. Confirme a alteração feita no exercício anterior.

```sql

COMMIT;
```

A tabela ficaria dessa forma:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | Lucas | 20    | RK     |
| 2  | Lua   | 24    | SP     |
| 3  | Paulo | 19    | MG     |

8. Inicie uma transação.

```sql

BEGIN;
```

A tabela ficaria dessa forma:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | Lucas | 20    | RK     |
| 2  | Lua   | 24    | SP     |
| 3  | Paulo | 19    | MG     |
