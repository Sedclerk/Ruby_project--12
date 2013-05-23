In this project you will be learning how to setup and write to a MySQL database. 

Preparation: 
1. Install MySQL
2. Install the mysql2 gem

and also , we are goint to Create a ruby script that does the following:

1. Creates a table
2. Writes data to a table
3. Reads data from a table

================================================================================
Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.6.10-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cars               |
| mysql              |
| performance_schema |
| sakila             |
| test               |
| world              |
+--------------------+
7 rows in set (0.00 sec)


mysql> create database userlogin;
Query OK, 1 row affected (0.00 sec)

mysql> use userlogin;
Database changed

mysql> show tables;
Empty set (0.00 sec)

mysql> create table user(id int(11) unsigned auto_increment primary key not null
,username varchar(25) not null,passwd varchar(25) not null,email varchar(40) not
 null);
Query OK, 0 rows affected (0.61 sec)

mysql> show tables;
+---------------------+
| Tables_in_userlogin |
+---------------------+
| user                |
+---------------------+
1 row in set (0.00 sec)

mysql> describe user;
+----------+------------------+------+-----+---------+----------------+
| Field    | Type             | Null | Key | Default | Extra          |
+----------+------------------+------+-----+---------+----------------+
| id       | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| username | varchar(25)      | NO   |     | NULL    |                |
| passwd   | varchar(25)      | NO   |     | NULL    |                |
| email    | varchar(40)      | NO   |     | NULL    |                |
+----------+------------------+------+-----+---------+----------------+
4 rows in set (0.29 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cars               |
| mysql              |
| performance_schema |
| sakila             |
| test               |
| userlogin          |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> insert into user(username, passwd, email)
    -> values('Sedclerk', 'sedclerk13', 'sedclerk@gmail.com')
    -> ;
Query OK, 1 row affected (0.29 sec)

mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
+----+----------+------------+--------------------+
1 row in set (0.02 sec)

mysql> insert into user(username,passwd,email) values ('Steve','Chevrolet','Stev
e@hotmail.com');
Query OK, 1 row affected (0.32 sec)

mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Chevrolet  | Steve@hotmail.com  |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)

mysql> select username from user;
+----------+
| username |
+----------+
| Sedclerk |
| Steve    |
+----------+
2 rows in set (0.00 sec)

mysql> select passwd from user;
+------------+
| passwd     |
+------------+
| sedclerk13 |
| Chevrolet  |
+------------+
2 rows in set (0.00 sec)

mysql> select email from user;
+--------------------+
| email              |
+--------------------+
| sedclerk@gmail.com |
| Steve@hotmail.com  |
+--------------------+
2 rows in set (0.00 sec)

mysql> select * from user where id=1;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
+----+----------+------------+--------------------+
1 row in set (0.20 sec)

mysql> select * from user where id=2;
+----+----------+-----------+-------------------+
| id | username | passwd    | email             |
+----+----------+-----------+-------------------+
|  2 | Steve    | Chevrolet | Steve@hotmail.com |
+----+----------+-----------+-------------------+
1 row in set (0.00 sec)

mysql> select * from user where username='Steve';
+----+----------+-----------+-------------------+
| id | username | passwd    | email             |
+----+----------+-----------+-------------------+
|  2 | Steve    | Chevrolet | Steve@hotmail.com |
+----+----------+-----------+-------------------+
1 row in set (0.00 sec)

mysql> select * from user where username='Sedclerk'
    -> OR username='Steve';
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Chevrolet  | Steve@hotmail.com  |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)

----OR---
mysql> select * from user where username IN ('Sedclerk', 'Steve');
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Chevrolet  | Steve@hotmail.com  |
+----+----------+------------+--------------------+
2 rows in set (0.14 sec)

mysql>

In here we are going to

4. Performs a SQL query that gets a count of how many records are in our table?

mysql> select count(*) from user;
+----------+
| count(*) |
+----------+
|        2 |
+----------+
1 row in set (0.22 sec)

In here we are going to
5. Performs a SQL query that updates a record in the table


mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Chevrolet  | Steve@hotmail.com  |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)

mysql> UPDATE user
    -> SET email='steve@capshare.com'
    -> WHERE id=2;
Query OK, 1 row affected (0.29 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Chevrolet  | steve@capshare.com |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)

mysql> UPDATE user
    -> SET passwd='Ford'
    -> WHERE username='Steve';
Query OK, 1 row affected (0.39 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Ford       | steve@capshare.com |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)

In here we are going to
6. Performs a SQL query that deletes a record in the table
first we are going to delete a row:

mysql> select * from user;
+----+----------+------------+--------------------+
| id | username | passwd     | email              |
+----+----------+------------+--------------------+
|  1 | Sedclerk | sedclerk13 | sedclerk@gmail.com |
|  2 | Steve    | Ford       | steve@capshare.com |
+----+----------+------------+--------------------+
2 rows in set (0.00 sec)
mysql> DELETE from user WHERE passwd='Sedclerk13';
Query OK, 1 row affected (0.08 sec)

mysql> select * from user;
+----+----------+--------+--------------------+
| id | username | passwd | email              |
+----+----------+--------+--------------------+
|  2 | Steve    | Ford   | steve@capshare.com |
+----+----------+--------+--------------------+
1 row in set (0.00 sec)

and if we want to delete more that 1 row then you use this way :
eg:
mysql> DELETE from user WHERE passwd IN('Ford', 'sedclerk13') and it will delete a row that contains these passwords
mysql> DELETE from user WHERE email IN('sedclerk@gmail.com', 'steve@capshare.com') it will delete a row that contains these emails
mysql> DELETE from user WHERE username IN('Steve', 'Sedclerk')and it will delete a row that contains these username
mysql> DELETE from user WHERE id IN('1', '2')and it will delete a row that contains these ids

second we are going to delete a column from our database:

mysql> ALTER TABLE user DROP column passwd;
Query OK, 0 rows affected (0.91 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from user;
+----+----------+--------------------+
| id | username | email              |
+----+----------+--------------------+
|  2 | Steve    | steve@capshare.com |
+----+----------+--------------------+
1 row in set (0.00 sec)

here we want to
7. Performs a SQL query that deletes all records in the table
  
  mysql> drop database userlogin;
Query OK, 1 row affected (0.35 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cars               |
| mysql              |
| performance_schema |
| sakila             |
| test               |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> drop database cars;
Query OK, 0 rows affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| test               |
| world              |
+--------------------+
6 rows in set (0.00 sec)

Here, we are going to
8. Create a “Prepared Statement” and use it to insert multiple records


in here we are going to
Insert multiple rows with a prepared statement

Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.6.10-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database Officers;
Query OK, 1 row affected (0.00 sec)

mysql> use Officers;
Database changed

mysql> show tables;
Empty set (0.00 sec)

mysql> create table list(id int(11) unsigned auto_increment primary key not null
    -> ,name varchar(25) not null,Office varchar(25) not null);
Query OK, 0 rows affected (0.62 sec)

mysql> show tables;
+--------------------+
| Tables_in_officers |
+--------------------+
| list               |
+--------------------+
1 row in set (0.00 sec)

mysql> describe list;
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| id     | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(25)      | NO   |     | NULL    |                |
| Office | varchar(25)      | NO   |     | NULL    |                |
+--------+------------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| officers           |
| performance_schema |
| sakila             |
| test               |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> insert into list(id,name,office) values
    -> ('001','Steve','No.255');
Query OK, 1 row affected (0.19 sec)

mysql> insert into list(id,name,office) values
    -> ('002','Jeron','No.256');
Query OK, 1 row affected (0.12 sec)

mysql> insert into list(id,name,office) values
    -> ('003','Sedy','No.257');
Query OK, 1 row affected (0.06 sec)

mysql> insert into list(id,name,office) values
    -> ('004','Nathan','No.258');
Query OK, 1 row affected (0.06 sec)

mysql> insert into list(id,name,office) values
    -> ('005','Larry','No.259');
Query OK, 1 row affected (0.07 sec)

mysql> insert into list(id,name,office) values
    -> ('005','Naly','No.260');
    
    
    or you can also doing this,

insert into list(id,name,office)
select '001','Steve','No.255'
union all
select '002','Jeron','No.256'
union all
select '003','Sedy','No.257'
union all
select '004','Nathan','No.258'
union all
select '005','Larry','No.259'
union all
select '005','Naly','No.260';

to see our table:

mysql> select * from list;
+----+--------+--------+
| id | name | Office |
+----+--------+--------+
|  1 | Steve  | No.255 |
|  2 | Jeron  | No.256 |
|  3 | Sedy   | No.257 |
|  4 | Nathan | No.258 |
|  5 | Larry  | No.259 |
+----+--------+--------+
5 rows in set (0.00 sec)

9- Why use a “Prepared Statement”?

In database management systems, a prepared statementis a feature
used to execute the same or similar database statements repeatedly with
high efficiency. Typically used with SQL statements such
as queries or updates, the prepared statement takes the
form of a template into which certain constant values are
substituted during each execution.
The typical workflow of using a prepared statement is as follows:
 -first: Prepare: The statement template is created by the application
and sent to the database management system (DBMS). Certain
values are left unspecified, called parameters, placeholders
or bind variables (labelled "?" below):
INSERT INTO PRODUCT (name, price) VALUES (?, ?)
 -second: The DBMS parses, compiles, and performs query optimization on
the statement template, and stores the result without executing it.
 -third: Execute: At a later time, the application supplies (or binds)
values for the parameters, and the DBMS executes the statement
(possibly returning a result). The application may execute the
statement as many times as it wants with different values.


10. Study up on database “joins”

-----------------Done------------------

11. Create another table and show an example of writing a
SQL Join that queries data from two tables

Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 5.6.10-log MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| cars               |
| mysql              |
| performance_schema |
| sakila             |
| test               |
| world              |
+--------------------+
7 rows in set (0.00 sec)


mysql> create database skills;
Query OK, 1 row affected (0.00 sec)

mysql> use skills;
Database changed

mysql> show tables;
Empty set (0.00 sec)

mysql> create table languages(id int(11) unsigned auto_increment primary key not null
,name varchar(25) not null);
Query OK, 0 rows affected (0.61 sec)

mysql> show tables;
+---------------------+
| Tables_in_skills |
+---------------------+
| languages           |
+---------------------+
1 row in set (0.00 sec)

mysql> describe languages;
mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| officers           |
| performance_schema |
| sakila             |
| skills             |
| test               |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> insert into languages(id,name) values('1','Rails');
Query OK, 1 row affected (0.34 sec)

mysql> insert into languages(id,name) values('2','HTML5');
Query OK, 1 row affected (0.05 sec)

mysql> insert into languages(id,name) values('3','Ruby');
Query OK, 1 row affected (0.26 sec)

mysql> insert into languages(id,name) values('4','MySQL');
Query OK, 1 row affected (0.29 sec)

mysql> insert into languages(id,name) values('5','PHP');
Query OK, 1 row affected (0.18 sec)


mysql> select * from languages;
+----+------------+
| id | name       |
+----+------------+
|  1 | Rails      |
|  2 | HTML5      |
|  3 | Ruby       |
|  4 | MySQL      |
|  5 | PHP        |
+----+------------+
6 rows in set (0.00 sec)

so on 

and here in on how to of write a SQL Join that queries data from these tables

SELECT (list.officers, languages.skills)
FROM 'list'
INNER JOIN  'languages' ON ( list.languages = languages.id );

and the result should be looking like this

name.officers	name.skills
Steve	         Rails
Jeron	         HTML5
Sedy 	         Ruby
Nathan	         MySQL
Larry            PHP












