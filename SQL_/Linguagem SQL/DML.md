# DML - Data Manipulation Language


No subgrupo DML tem-se três comandos:

- INSERT

- UPDATE

- DELETE

## Sintaxe

### INSERT

```sql

INSERT INTO <tabela> (<colunas>) VALUES (<valores>);
```

- tabela: Obrigatório, utilizado para especificar a tabela que será inserido o registro.

- colunas: Opcional, utilizado para especificar as colunas que serão inseridas.

- valores: Obrigatório, utilizado para especificar os valores que serão inseridos.

### UPDATE

```sql

UPDATE <tabela> SET <coluna> = <valor> [WHERE <condição>];
```

- tabela: Obrigatório, utilizado para especificar a tabela que será atualizado o registro.

- coluna: Obrigatório, utilizado para especificar a coluna que será atualizada.

- valor: Obrigatório, utilizado para especificar o valor que será atualizado.

- WHERE: Opcional, utilizado para especificar uma condição para a atualização.

### DELETE

```sql

DELETE FROM <tabela> [WHERE <condição>];
```

- tabela: Obrigatório, utilizado para especificar a tabela que será removido o registro.

- WHERE: Opcional, utilizado para especificar uma condição para a remoção.

**OBS:** O comando DELETE remove todos os registros de uma tabela, caso não seja especificado uma condição.

**OBS2:** O comando DELETE não pode ser desfeito.

**OBS3:** O comando UPDATE atualiza TODOS os registros de uma tabela, caso não seja especificado uma condição.

Imagine a seguinte tabela de alunos:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Ana  | 20    | SP     |
| 5  | Isa  | 18    | SP     |
| 6  | Lua  | 18    | SP     |

### Exemplo 1

```sql

INSERT INTO alunos (nome, idade, cidade) VALUES ('Paulo', 19, 'MG');
```
A tabela ficaria assim após o comando:

| id | nome  | idade | cidade |
|----|-------|-------|--------|
| 1  | João  | 20    | SP     |
| 2  | Ana   | 18    | RJ     |
| 3  | José  | 20    | SP     |
| 4  | Ana   | 20    | SP     |
| 5  | Isa   | 18    | SP     |
| 6  | Lua   | 18    | SP     |
| 7  | Paulo | 19    | MG     |

### Exemplo 2

```sql

INSERT INTO alunos (nome, idade, cidade) VALUES ('Irineu', 18, 'SP');
```

A tabela ficaria assim após o comando:

| id | nome   | idade | cidade |
|----|--------|-------|--------|
| 1  | João   | 20    | SP     |
| 2  | Ana    | 18    | RJ     |
| 3  | José   | 20    | SP     |
| 4  | Ana    | 20    | SP     |
| 5  | Isa    | 18    | SP     |
| 6  | Lua    | 18    | SP     |
| 7  | Paulo  | 19    | MG     |
| 8  | Irineu | 18    | SP     |

### Exemplo 3

```sql

INSERT INTO alunos (nome, idade, cidade) VALUES ('Rodrigo', 18, 'SP'), ('Mateus', 19, 'MG');
```

A tabela ficaria assim após o comando:

| id | nome   | idade | cidade |
|----|--------|-------|--------|
| 1  | João   | 20    | SP     |
| 2  | Ana    | 18    | RJ     |
| 3  | José   | 20    | SP     |
| 4  | Ana    | 20    | SP     |
| 5  | Isa    | 18    | SP     |
| 6  | Lua    | 18    | SP     |
| 7  | Paulo  | 19    | MG     |
| 8  | Irineu | 18    | SP     |
| 9  | Rodrigo| 18    | SP     |
| 10 | Mateus | 19    | MG     |

É possível adicionar varios registros em uma única query.

Exemplos para o DELETE:

### Exemplo 4

```sql

DELETE FROM alunos WHERE id = 10;
```

A tabela ficaria assim após o comando:

| id | nome   | idade | cidade |
|----|--------|-------|--------|
| 1  | João   | 20    | SP     |
| 2  | Ana    | 18    | RJ     |
| 3  | José   | 20    | SP     |
| 4  | Ana    | 20    | SP     |
| 5  | Isa    | 18    | SP     |
| 6  | Lua    | 18    | SP     |
| 7  | Paulo  | 19    | MG     |
| 8  | Irineu | 18    | SP     |
| 9  | Rodrigo| 18    | SP     |

### Exemplo 5

```sql

DELETE FROM alunos WHERE cidade = 'RJ';
```

A tabela ficaria assim após o comando:

| id | nome   | idade | cidade |
|----|--------|-------|--------|
| 1  | João   | 20    | SP     |
| 3  | José   | 20    | SP     |
| 4  | Ana    | 20    | SP     |
| 5  | Isa    | 18    | SP     |
| 6  | Lua    | 18    | SP     |
| 7  | Paulo  | 19    | MG     |
| 8  | Irineu | 18    | SP     |
| 9  | Rodrigo| 18    | SP     |

É possível remover um aluno com nome igual, deixando apenas um:

### Exemplo 6

```sql

DELETE FROM alunos WHERE nome = 'Ana' LIMIT 1;
```

A tabela ficaria assim após o comando:

| id | nome   | idade | cidade |
|----|--------|-------|--------|
| 1  | João   | 20    | SP     |
| 3  | José   | 20    | SP     |
| 4  | Ana    | 20    | SP     |
| 5  | Isa    | 18    | SP     |
| 6  | Lua    | 18    | SP     |
| 7  | Paulo  | 19    | MG     |
| 8  | Irineu | 18    | SP     |
| 9  | Rodrigo| 18    | SP     |

Observe que o ID 2 foi removido, e os IDS subsequentes foram inalterados, isso ocorre pois o ID é uma chave primária, e não pode ser repetida.

Exemplos para o UPDATE:

### Exemplo 7

```sql

UPDATE alunos SET nome = 'João Paulo' WHERE id = 1;
```

A tabela ficaria assim após o comando:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João Paulo | 20    | SP     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 20    | SP     |
| 5  | Isa        | 18    | SP     |
| 6  | Lua        | 18    | SP     |
| 7  | Paulo      | 19    | MG     |
| 8  | Irineu     | 18    | SP     |
| 9  | Rodrigo    | 18    | SP     |

### Exemplo 8

```sql

UPDATE alunos SET idade = 24 WHERE nome = 'Lua';
```

A tabela ficaria assim após o comando:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João Paulo | 20    | SP     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 20    | SP     |
| 5  | Isa        | 18    | SP     |
| 6  | Lua        | 24    | SP     |
| 7  | Paulo      | 19    | MG     |
| 8  | Irineu     | 18    | SP     |
| 9  | Rodrigo    | 18    | SP     |

### Exemplo 9

```sql

UPDATE alunos SET idade = 18, cidade = 'RJ' WHERE nome = 'Ana';
```

A tabela ficaria assim após o comando:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João Paulo | 20    | SP     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 18    | RJ     |
| 5  | Isa        | 18    | SP     |
| 6  | Lua        | 24    | SP     |
| 7  | Paulo      | 19    | MG     |
| 8  | Irineu     | 18    | SP     |
| 9  | Rodrigo    | 18    | SP     |

Os comandos SQL são terminados com um ponto e vírgula (;).

Novamente é importante ressaltar que o comando UPDATE atualiza TODOS os registros de uma tabela, caso não seja especificado uma condição.

## Exercícios

1.  Crie uma tabela chamada `alunos` com as seguintes colunas:
    -   `id` do tipo `INT` com auto incremento e chave primária
    -   `nome` do tipo `VARCHAR(255)`
    -   `idade` do tipo `INT`
    -   `cidade` do tipo `VARCHAR(255)`

2.  Insira os seguintes registros na tabela `alunos`:
    -   `nome` = 'João', `idade` = 20, `cidade` = 'SP'
    -   `nome` = 'Ana', `idade` = 18, `cidade` = 'RJ'
    -   `nome` = 'José', `idade` = 20, `cidade` = 'SP'
    -   `nome` = 'Ana', `idade` = 20, `cidade` = 'SP'
    -   `nome` = 'Isa', `idade` = 18, `cidade` = 'SP'
    -   `nome` = 'Lua', `idade` = 18, `cidade` = 'SP'

3.  Atualize o registro com `id` = 2, alterando o nome para 'Ana Paula'.

4.  Atualize o registro com `id` = 6, alterando a idade para 24.

5.  Atualize o registro com `id` = 4, alterando a idade para 18 e a cidade para 'RJ'.

6.  Remova o registro com `id` = 5.

## Resolução:

1.  ```sql
    CREATE TABLE alunos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255),
        idade INT,
        cidade VARCHAR(255)
    );
    ```

A tabela ficaria dessa forma:

| id | nome | idade | cidade |
|----|------|-------|--------|

2.  ```sql
    INSERT INTO alunos (nome, idade, cidade) VALUES ('João', 20, 'SP');
    INSERT INTO alunos (nome, idade, cidade) VALUES ('Ana', 18, 'RJ');
    INSERT INTO alunos (nome, idade, cidade) VALUES ('José', 20, 'SP');
    INSERT INTO alunos (nome, idade, cidade) VALUES ('Ana', 20, 'SP');
    INSERT INTO alunos (nome, idade, cidade) VALUES ('Isa', 18, 'SP');
    INSERT INTO alunos (nome, idade, cidade) VALUES ('Lua', 18, 'SP');
    ```
A tabela ficaria dessa forma:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Ana  | 20    | SP     |
| 5  | Isa  | 18    | SP     |
| 6  | Lua  | 18    | SP     |

3.  ```sql
    UPDATE alunos SET nome = 'Ana Paula' WHERE id = 2;
    ```
A tabela ficaria dessa forma:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João       | 20    | SP     |
| 2  | Ana Paula  | 18    | RJ     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 20    | SP     |
| 5  | Isa        | 18    | SP     |
| 6  | Lua        | 18    | SP     |

4.  ```sql
    UPDATE alunos SET idade = 24 WHERE id = 6;
    ```
A tabela ficaria dessa forma:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João       | 20    | SP     |
| 2  | Ana Paula  | 18    | RJ     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 20    | SP     |
| 5  | Isa        | 18    | SP     |    
| 6  | Lua        | 24    | SP     |

5.  ```sql
    UPDATE alunos SET idade = 18, cidade = 'RJ' WHERE id = 4;
    ```
A tabela ficaria dessa forma:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João       | 20    | SP     |
| 2  | Ana Paula  | 18    | RJ     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 18    | RJ     |
| 5  | Isa        | 18    | SP     |
| 6  | Lua        | 24    | SP     |

6.  ```sql
    DELETE FROM alunos WHERE id = 5;
    ```
A tabela ficaria dessa forma:

| id | nome       | idade | cidade |
|----|------------|-------|--------|
| 1  | João       | 20    | SP     |
| 2  | Ana Paula  | 18    | RJ     |
| 3  | José       | 20    | SP     |
| 4  | Ana        | 18    | RJ     |
| 6  | Lua        | 24    | SP     |
