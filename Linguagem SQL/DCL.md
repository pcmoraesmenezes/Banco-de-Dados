Data Control Language - Linguagem de Controle de Dados

No subgrupo DCL tem-se dois comandos:

- GRANT

- REVOKE

## Sintaxe

### GRANT

```sql

GRANT <permissão> ON <nome da tabela> TO <usuário>;
```

- permissão: Obrigatório, utilizado para especificar a permissão que será concedida. As permissões são: SELECT, INSERT, UPDATE, DELETE, ALL PRIVILEGES, entre outros.

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será concedida a permissão.

- usuário: Obrigatório, utilizado para especificar o usuário que receberá a permissão.

### REVOKE

```sql

REVOKE <permissão> ON <nome da tabela> FROM <usuário>;
```

- permissão: Obrigatório, utilizado para especificar a permissão que será revogada. As permissões são: SELECT, INSERT, UPDATE, DELETE, ALL PRIVILEGES, entre outros.

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será revogada a permissão.

- usuário: Obrigatório, utilizado para especificar o usuário que terá a permissão revogada.

O comando GRANT concede permissões para um usuário, enquanto o comando REVOKE revoga permissões de um usuário.

Imagine a seguinte tabela de alunos:

| id | nome | idade | cidade |
|----|------|-------|--------|
| 1  | João | 20    | SP     |
| 2  | Ana  | 18    | RJ     |
| 3  | José | 20    | SP     |
| 4  | Lua  | 20    | SP     |

Imagine que você queira conceder a permissão de SELECT para o usuário "joao" na tabela alunos, você deve executar o seguinte comando:

```sql

GRANT SELECT ON alunos TO joao;
```

Agora imagine que você queira revogar a permissão de SELECT para o usuário "joao" na tabela alunos, você deve executar o seguinte comando:

```sql

REVOKE SELECT ON alunos FROM joao;
```

## Exemplos

### Exemplo 1

```sql

GRANT SELECT ON alunos TO joao;
```

### Exemplo 2

```sql

REVOKE SELECT ON alunos FROM joao;
```
Esse comando revoga a permissão de SELECT para o usuário "joao" na tabela alunos.

### Exemplo 3

```sql

GRANT SELECT, INSERT ON alunos TO joao;
```
Esse comando concede as permissões de SELECT e INSERT para o usuário "joao" na tabela alunos.

### Exemplo 4

```sql

REVOKE SELECT, INSERT ON alunos FROM joao;
```
Esse comando revoga as permissões de SELECT e INSERT para o usuário "joao" na tabela alunos.

## Exercícios:

1. Crie uma tabela chamada alunos com as seguintes colunas: id, nome, idade, cidade.

2. Crie um aluno chamado "Lua" com 20 anos e que mora em SP.

3. Conceda a permissão de SELECT para o usuário "Lua" na tabela alunos.

4. Revogue a permissão de SELECT para o aluna "Lua" na tabela alunos.

5. Conceda as permissões de SELECT e INSERT para o aluna "Lua" na tabela alunos.

6. Revogue as permissões de SELECT e INSERT para o aluna "Lua" na tabela alunos.

7. Remova o aluna "Lua".

8. Remova a tabela alunos.

## Solução:

1. ```sql

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
    |    |      |       |        |

2. ```sql

   INSERT INTO alunos (nome, idade, cidade) VALUES ('Lua', 20, 'SP');
   ```

    A tabela ficaria dessa forma:

    | id | nome | idade | cidade |
    |----|------|-------|--------|
    | 1  | Lua  | 20    | SP     |

3. ```sql

   GRANT SELECT ON alunos TO Lua;
   ```
    Esse comando concede a permissão de SELECT para  a aluna "Lua" na tabela alunos.

4. ```sql

   REVOKE SELECT ON alunos FROM Lua;
   ```
    Esse comando revoga a permissão de SELECT para a aluna "Lua" na tabela alunos.

5. ```sql

    GRANT SELECT, INSERT ON alunos TO Lua;
    ```
     Esse comando concede as permissões de SELECT e INSERT para a aluna "Lua" na tabela alunos.

6. ```sql

    REVOKE SELECT, INSERT ON alunos FROM Lua;
    ```
     Esse comando revoga as permissões de SELECT e INSERT para a aluna "Lua" na tabela alunos.

7. ```sql

    DELETE FROM alunos WHERE nome = 'Lua';
    ```
     Esse comando remove a aluna "Lua".

8. ```sql

    DROP TABLE alunos;
    ```
     Esse comando remove a tabela alunos.







