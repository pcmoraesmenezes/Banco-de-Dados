# Data Definition Language - Linguagem de Definição de Dados

No subgrupo DDL tem-se quatro comandos:

- CREATE

- ALTER

- DROP

- TRUNCATE

## Sintaxe

### CREATE

```sql

CREATE TABLE <nome da tabela> (
    <nome da coluna> <tipo de dado> <restrições>,
    <nome da coluna> <tipo de dado> <restrições>,
    <nome da coluna> <tipo de dado> <restrições>,
    ...
);
```

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será criada.

- nome da coluna: Obrigatório, utilizado para especificar o nome da coluna que será criada.

- tipo de dado: Obrigatório, utilizado para especificar o tipo de dado que será armazenado na coluna. Os tipso de dados são: INT, VARCHAR, DATE, FLOAT, DOUBLE, TEXT, entre outros.

- restrições: Opcional, utilizado para especificar restrições para a coluna. As restrições são: NOT NULL, PRIMARY KEY, AUTO_INCREMENT, UNIQUE, DEFAULT, entre outros.

### ALTER

```sql

ALTER TABLE <nome da tabela> <comando>;
```

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será alterada.

- comando: Obrigatório, utilizado para especificar o comando que será executado.

### DROP

```sql

DROP TABLE <nome da tabela>;
```

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será removida.

### TRUNCATE

```sql

TRUNCATE TABLE <nome da tabela>;
```

- nome da tabela: Obrigatório, utilizado para especificar o nome da tabela que será esvaziada.

Create serve para criar uma tabela, alter para alterar uma tabela, drop para remover uma tabela e truncate para esvaziar uma tabela.

Exemplo de criação de uma tabela:

```sql

CREATE TABLE alunos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
```

A tabela ficaria dessa forma:

| id | nome | idade | cidade |
|----|------|-------|--------|
|    |      |       |        |

Exemplo de alteração de uma tabela:

```sql

ALTER TABLE alunos ADD COLUMN email VARCHAR(255) NOT NULL;
```

A tabela ficaria dessa forma:

| id | nome | idade | cidade | email |
|----|------|-------|--------|-------|
|    |      |       |        |       |

Exemplo de remoção de uma tabela:

```sql

DROP TABLE alunos;
```

Exemplo de esvaziamento de uma tabela:

```sql

TRUNCATE TABLE alunos;
```

É possível apagar uma coluna já existente utilizando o comando ALTER TABLE:

```sql

ALTER TABLE alunos DROP COLUMN email;
```

A tabela ficaria dessa forma:

| id | nome | idade | cidade |
|----|------|-------|--------|
|    |      |       |        |


## Exercícios

1.  Crie uma tabela chamada alunos com as seguintes colunas: id, nome, idade, cidade.

2.  Crie uma tabela chamada cursos com as seguintes colunas: id, nome, carga horária.

3.  Crie uma tabela chamada alunos_cursos com as seguintes colunas: id, id_aluno, id_curso.

4. Adicione uma coluna chamada email na tabela alunos.

5. Remova a coluna email da tabela alunos.

6. Remova a tabela alunos_cursos.

7. Esvazie a tabela alunos.

## Solução:

1.  ```sql
    CREATE TABLE alunos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        idade INT NOT NULL,
        cidade VARCHAR(255) NOT NULL
    );
    ```

    A tabela ficaria dessa forma:

    | id | nome | idade | cidade |
    |----|------|-------|--------|
    |    |      |       |        |

2.  ```sql

    CREATE TABLE cursos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        carga_horaria INT NOT NULL
    );
    ```

    A tabela ficaria dessa forma:

    | id | nome | carga_horaria |
    |----|------|---------------|
    |    |      |               |

3.  ```sql

    CREATE TABLE alunos_cursos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_aluno INT NOT NULL,
        id_curso INT NOT NULL
    );
    ```

    A tabela ficaria dessa forma:

    | id | id_aluno | id_curso |
    |----|----------|----------|
    |    |          |          |

4.  ```sql

    ALTER TABLE alunos ADD COLUMN email VARCHAR(255) NOT NULL;
    ```

    A tabela ficaria dessa forma:

    | id | nome | idade | cidade | email |
    |----|------|-------|--------|-------|
    |    |      |       |        |       |

5.  ```sql

    ALTER TABLE alunos DROP COLUMN email;
    ```

    A tabela ficaria dessa forma:

    | id | nome | idade | cidade |
    |----|------|-------|--------|
    |    |      |       |        |


6.  ```sql
    
        DROP TABLE alunos_cursos;
        ```

7.  ```sql
    
        TRUNCATE TABLE alunos;
        ```
    
