# SQL Interview Questions

1. What is the difference between "Stored Procedure" and "Function"?

- A procedure can have both input and output parameters, but a function can only have input parameters.

- Inside a procedure it's possible use DML (INSERT, UPDATE, DELETE) statements. But inside a function it's not possible to use DML statements.

- It's not possible use a stored procedure in a select statement. But it's possible use a function in a select statement.

- Try-Catch Block in a Stored Procedure can be used to handle errors. But in a function it's not possible to use Try-Catch Block.

- It's not possible use transaction management in a procedure but it's possible in a function.

- It's not possible join a sotred procedure but it's possible join a function.

- Stored procedures cannot be used in the SQL statements anywhere in the WHERE/HAVING/SELECT section. But functions can be.

- Procedure can return zero or n values whereas function can return one value which is mandatory.

- Procedures can have input/output parameters for it whereas functions can have only input parameters.

2. What is difference between "Clustered Index" and "Non-Clustered Index"?

- A clustered index physically stores the data of the table in the order of the keys values and the data is resorted every time wheneaver a new value is inserted or a value is updated in the column on which it is defined, whereas a non-clustered index creates a separate hst of key values that points towards the location of the data in the data pages.

3. What is the difference between the "DELETE" and "TRUNCATE" commands?

- DELETE command is used to remove rows from a table based on a WHERE condition whereas TRUNCATE remove all rows from a table.

- It's extremaely recommended use WHERE condition in DELETE command, because if you don't use WHERE condition, all rows will be removed from the table. But in TRUNCATE command, it's not possible use WHERE condition.

- DELETE is a DMl command and TRUNCATE is a DDL command.


- DELETE requires the DELETE permission whereas TRUNCATE requires the ALTER permission.

4. What is the difference between "HAVING" and "WHERE" clause in SQL?

- WHERE clause can be used with a SELECT, UPDATE and DELETE Statement Clause but HAVING clause can only be used with the SELECT Statement Clause.

- It's not possible use WHERE in aggregate functions, but it's possible use HAVING in aggregate functions.

5. What is the difference between Primary Key and Unique Key?

- A table can have only one primary key, but it can have more than one unique key.

- A primary key cannot accept null values, but a unique key can accept one null value.

- Primary Key supports Auto Increment, but Unique Key doesn't support Auto Increment.

6. What is the difference between a "Local Temporary Table" and a "Global Temporary Table"?

- A local temporary table is available only in the session that created it, and is automatically dropped when the session is closed. A global temporary table is available to all sessions, and is dropped when the last session using it is closed.

7. What are super, primary, candidate and foreign keys?

- Super Key: A super key is a group of single or multiple keys which identifies rows in a table. It is a superset of a candidate key.

- Primary Key: A primary key is a single key which is used to uniquely identify each row in a table. It is a candidate key which is selected by the database designer to uniquely identify the table.

- Candidate Key: A candidate key is a single key which is used to uniquely identify each row in a table. It is a super key which is selected by the database designer to uniquely identify the table.

- Foreign Key: A foreign key is a single key which is used to uniquely identify each row in a table. It is a candidate key which is selected by the database designer to uniquely identify the table.

8. What is the difference between primary constraint and unique constraint?

- A primary key is a column or a group of columns used to identify a row uniquely in a table. A primary key enforces the uniqueness of the column on which they are defined.

9. What is database normalization and why is it important?

- Database normalization is the process of organizing the columns and tables of a relational database to minimize data redundancy. Normalization usually involves dividing a database into two or more tables and defining relationships between the tables.

- The main aim of database normalization is to add, delete or modify a field in a table, we only have to do it in one place. A table is said to be normalized if it is free from insertion, update and deletion anomalies.

10. What is SQL 

- SQL stands for Structured Query Language. SQL is used to communicate with a database. According to ANSI (American National Standards Institute), it is the standard language for relational database management systems. SQL statements are used to perform tasks such as update data on a database, or retrieve data from a database. Some common relational database management systems that use SQL are: Oracle, Sybase, Microsoft SQL Server, Access, Ingres, etc. Although most database systems use SQL, most of them also have their own additional proprietary extensions that are usually only used on their system. However, the standard SQL commands such as "Select", "Insert", "Update", "Delete", "Create", and "Drop" can be used to accomplish almost everything that one needs to do with a database. SQL commands are divided into several different types, among them data manipulation language (DML) and data definition language (DDL) commands, data query language (DQL) commands, and data control language (DCL) commands.

11. What is SQL Injection?

- SQL injection is a code injection technique that might destroy your database. SQL injection is one of the most common web hacking techniques. SQL injection is the placement of malicious code in SQL statements, via web page input.

12. What are the differences between DDL, DML and DCL in SQL?

- DDL (Data Definition Language) is used to define the structure that holds the data. For example, create, alter, drop, truncate, etc.

- DML (Data Manipulation Language) is used for managing data within schema objects. For example, insert, update, delete, etc.

- DCL (Data Control Language) is used to control access to data within the database. For example, grant, revoke, etc.

13. What is JOIN in SQL?

- JOIN is used to combine rows from two or more tables, based on a related column between them.

14. What is Identity?

- Identity (or AutoNumber) is a column that automatically generates numeric values. A start and increment value can be set, but most DBA leave these at 1. A GUID column also generates numbers; the value of this cannot be controlled. Identity/GUID columns do not need to be indexed.

15. What is a View? How to create a view?

- A view is a virtual table based on the result-set of an SQL statement. A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database. You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data were coming from one single table.

- To create a view, a user must have the appropriate system privilege according to the specific implementation.

16. What are the uses of view?

- Views are used for security purposes. They restrict access to the data because the view can display selected columns from the table.

- Views are used to simplify the complex queries. If a complex query is written in a view, then we can access the view to get the data.

17. What is a Trigger?

- A trigger is a set of SQL statements stored in the database catalog. A trigger is executed automatically when an event (insert, delete or update) occurs. Triggers are used to maintain the referential integrity of data by changing the data in a systematic fashion.

18. What is a Stored Procedure?

- A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again. So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it. You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

19. What is the difference between Trigger and Stored Procedure?

- A trigger is a special kind of stored procedure that automatically executes when an event occurs in the database server. A stored procedure is a set of SQL statements that can be executed on the database.

20. What is a transaction? What are ACID properties?

- A transaction is a single unit of work. If a transaction is successful, all of the data modifications made during the transaction are committed and become a permanent part of the database. If a transaction encounters errors and must be canceled or rolled back, then all of the data modifications are erased.

- ACID (Atomicity, Consistency, Isolation, Durability) is a set of properties of database transactions intended to guarantee validity even in the event of errors, power failures, etc. In the context of databases, a sequence of database operations that satisfies the ACID properties (which can be perceived as a single logical operation on the data) is called a transaction.

21. What is a subquery?

- A subquery is a query within another query. The outer query is called as main query and inner query is called as subquery. The subquery must be enclosed with the parenthesis and generally executes first, and its output is used to complete the query condition for the main query.

22. What are indexes?

- Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

23. What are Primary and Foreign Keys?

- Primary key is a unique key that is used to uniquely identify each row in a table. A primary key cannot accept null values. Foreign key is a field in the table that is primary key in another table.

24. What are the advantages of using SQL?

- SQL is not a proprietary language used by specific database vendors. Nearly all modern database systems support SQL, so learning this one language will enable you to interact with a wide range of databases.

- SQL databases provide safe and scalable storage for web applications. They allow you to store and retrieve data as requested by other software applications.

- SQL databases are easy to scale, and can provide a seamless transition from a small database used by a single person to a large database that can be used by many users simultaneously.

25. What is a field in a database?

- A field is a single item of data that is stored in a table. It is a column in a table that is designed to maintain specific information about every record in the table.

26. What is a record in a database?

- A record is a complete set of fields in a database. It is a row in a table that is designed to maintain specific information about every record in the table.

27. What is a table in a database?

- A table is a collection of data stored in a database. Tables are organized into rows and columns; and each table must have a name.

28. What is a database?

- A database is a collection of information that is organized so that it can be easily accessed, managed and updated.

29. What are properties of a transaction?

- ACID:

- Atomicity: It ensures that all operations within the work unit are completed successfully. Otherwise, the transaction is aborted at the point of failure and all the previous operations are rolled back to their former state.

- Consistency: It ensures that the database properly changes states upon a successfully committed transaction.

- Isolation: It enables transactions to operate independently of and transparent to each other.

- Durability: It ensures that the result or effect of a committed transaction persists in case of a system failure.

30. What is a query?

- A query is a request for data or information from a database table or combination of tables. This data may be generated as results returned by structured query language (SQL) or as pictorials, graphs or complex results, e.g., trend analyses from data-mining tools.

