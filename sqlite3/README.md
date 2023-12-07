# Sqlite 

Sqlite é uma biblioteca opensource que implementa um banco de dados SQL embutido. Diferente da maioria dos outros bancos de dados SQL, o SQLite não possui um processo de servidor separado. O SQLite lê e escreve diretamente nos arquivos de banco de dados ordinários. Um banco de dados SQLite é um arquivo normal no disco que é acessado por meio de chamadas normais do sistema de arquivos. Seu formato de arquivo é independente da arquitetura, portanto, os bancos de dados SQLite podem ser criados e copiados entre sistemas de 32 bits e 64 bits.

É escrito em C e possui ligação para várias linguagens de programação, como C++, Java, C#, Python, Ruby, Tcl, Perl, PHP, entre outras.

Sqlite é o SGBD mais usado no mundo, sendo utilizado em vários sistemas operacionais, como Android, iOS, Windows, Linux, entre outros.

Não existe tanta diferença na sintaxe do sqlite para o mysql e postgresql, porém, algumas coisas são diferentes.

Utiliza-se ```Ìnteger``` para definir um campo inteiro, ao invés de ```int```, o ```AUTOINCREMENT``` é utilizado para definir uma chave primária autoincrementada, ao invés de ```AUTO_INCREMENT```, e o ```TEXT``` é utilizado para definir um campo de texto, ao invés de ```VARCHAR```. O ponto flutuante é utilizado como ```REAL```, ao invés de ```FLOAT```.

Além disso não existe o tipo de dado ```DATE```, sendo necessário utilizar o ```TEXT``` para armazenar datas.

Não há diferença entre o ```ÌNSERT INTO``` do sqlite para o mysql e postgresql, porém, o sqlite não possui o comando ```SHOW DATABASES```, sendo necessário utilizar o comando ```ATTACH DATABASE``` para anexar um banco de dados.

## Tabela de conteúdos

- [Pequenas práticas introdutórias ao sqlite](/sqlite3/pequenas_praticas.sql)