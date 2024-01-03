# Comandos do mysql -> Linux

``` bash

sudo systemctl status mysql

```

Esse comando serve para verificar o status do mysql, se ele está ativo ou não.

``` bash

sudo systemctl start mysql

```

Esse comando serve para iniciar o mysql.

``` bash

sudo systemctl stop mysql

```

Esse comando serve para parar o mysql.

``` bash

sudo systemctl restart mysql

```

Esse comando serve para reiniciar o mysql.

``` bash

sudo systemctl enable mysql

```

Esse comando serve para habilitar o mysql junto com a inicialização do sistema.

``` bash

sudo systemctl disable mysql

```

Esse comando serve para desabilitar o mysql junto com a inicialização do sistema.

``` bash

sudo mysql_secure_installation

```

Esse comando serve para configurar o mysql.

``` bash

sudo mysql

```

Esse comando serve para entrar no mysql.

``` bash

sudo mysql -u usuario -p

```

Esse comando serve para entrar no mysql como root.


Dentro do terminal mysql, para criar um usuario:

``` bash

CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'senha';

```

Dentro do terminal mysql, para garantir todos os privilegios para o usuario:

``` bash

GRANT ALL PRIVILEGES ON *.* TO 'usuario'@'localhost' WITH GRANT OPTION;

```

Dentro do terminal mysql, para atualizar os privilegios:

``` bash

FLUSH PRIVILEGES;

```


dentro do terminal mysql, para ver os banco de dados:

``` bash

SHOW DATABASES;

```

dentro do terminal mysql para usar um banco de dados:

``` bash

USE nome_do_banco_de_dados;

```

DEntro do terminal mysql para visualizar as tabelas:

``` bash

SHOW TABLES;

```

Para deslogar do mysql:

``` bash

\q;

```

Dentro do terminal sql:

Esse comando serve para atualizar o plugin do mysql.
``` bash

UPDATE user SET plugin='mysql_native_password' WHERE User='root';

```
