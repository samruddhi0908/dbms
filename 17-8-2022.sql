buntu@ubuntu-OptiPlex-5000:~$ mysql-u root -p
mysql-u: command not found
ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Amezon_product     |
| EMPLOYEE           |
| MAYURESH           |
| Menu               |
| Movie_list         |
| PROJECT            |
| TE_B               |
| aadarsh            |
| aakansha           |
| assignment         |
| assignment2        |
| b1                 |
| college            |
| database2          |
| databasename       |
| employeedata       |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
| personal_info      |
| pizza_mania        |
| rushi              |
| rutik              |
| samiksha           |
| sample             |
| school             |
| shital             |
| store              |
| sys                |
| teachers_info      |
+--------------------+
32 rows in set (0.01 sec)

mysql> create databases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databases' at line 1
mysql> 
mysql> create database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create database custemerinfo;
Query OK, 1 row affected (0.03 sec)

mysql> use custermerinfo;
ERROR 1049 (42000): Unknown database 'custermerinfo'
mysql> use custemerinfo;
Database changed
mysql> create table custemerorder (custemerid int,custemerName varchar(30),Order varchar(40));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Order varchar(40))' at line 1
mysql> create table custemerorder (custemerid int,custemerName varchar(30),order varchar(40));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order varchar(40))' at line 1
mysql> create table custemerorder (custemerid int,custemerName varchar(30),order_no varchar(40));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into custemerorder values (2,'nisha','10388'),(30,'kyra','19004'),(5,'krupa','28345'),(32,'nivedita','12349'),(81,'krushna','18432');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select *from custeerorder;
ERROR 1146 (42S02): Table 'custemerinfo.custeerorder' doesn't exist
mysql> select *from custemerinfo;
ERROR 1146 (42S02): Table 'custemerinfo.custemerinfo' doesn't exist
mysql> select * from custemerinfo;
ERROR 1146 (42S02): Table 'custemerinfo.custemerinfo' doesn't exist
mysql> select * from custemerorder;
+------------+--------------+----------+
| custemerid | custemerName | order_no |
+------------+--------------+----------+
|          2 | nisha        | 10388    |
|         30 | kyra         | 19004    |
|          5 | krupa        | 28345    |
|         32 | nivedita     | 12349    |
|         81 | krushna      | 18432    |
+------------+--------------+----------+
5 rows in set (0.00 sec)

mysql> create table custemers;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table custemers (orderID int,contact_name varchar(40),country varchar(30),orderdate int);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into custemers values (1,'Maria Anders','Germeny',2022-8-5);
Query OK, 1 row affected (0.02 sec)

mysql> select * from custemers;
+---------+--------------+---------+-----------+
| orderID | contact_name | country | orderdate |
+---------+--------------+---------+-----------+
|       1 | Maria Anders | Germeny |      2009 |
+---------+--------------+---------+-----------+
1 row in set (0.00 sec)

mysql> insert into custemers values (1,'Maria Anders','Germeny',2022-8-5),(2,'Antonio Moreno Taquería','mexico'),(3,'Berglunds snabbköp','canada'),(4,'Around the Horn',mexico'),(5,'Around the Horn',mexico');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''),(5,'Around the Horn',mexico')' at line 1
mysql> insert into custemers values (1,'Maria Anders','Germeny',2022-8-5),(2,'Antonio Moreno Taquería','mexico'),(3,'Berglunds snabbköp','canada'),(4,'Around the Horn',mexico'),(5,'Around the Horn','mexico');
    '> ;
    '> '
    -> ''
    -> ^C
mysql> insert into custemers values (1,'Maria Anders','Germeny',2022-8-5),(2,'Antonio Moreno Taquería','mexico'),(3,'Berglunds snabbköp','canada'),(4,'Around the Horn','mexico'),(5,'Around the Horn','mexoco');
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> insert into custemers(orderId,contact_name,country) values (1,'Maria Anders','Germeny'),(2,'Antonio Moreno Taquería','mexico'),(3,'Berglunds snabbköp','canada'),(4,'Around the Horn','mexico'),(5,'Around the Horn','mexoco');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from custemers;
+---------+--------------------------+---------+-----------+
| orderID | contact_name             | country | orderdate |
+---------+--------------------------+---------+-----------+
|       1 | Maria Anders             | Germeny |      2009 |
|       1 | Maria Anders             | Germeny |      NULL |
|       2 | Antonio Moreno Taquería  | mexico  |      NULL |
|       3 | Berglunds snabbköp       | canada  |      NULL |
|       4 | Around the Horn          | mexico  |      NULL |
|       5 | Around the Horn          | mexoco  |      NULL |
+---------+--------------------------+---------+-----------+
6 rows in set (0.00 sec)

mysql> select custemerorder.custemerid,custemerorder.custemerName from custemerorder left join custemers on custemerorder.custemerid=custemers.orderID;
+------------+--------------+
| custemerid | custemerName |
+------------+--------------+
|          2 | nisha        |
|         30 | kyra         |
|          5 | krupa        |
|         32 | nivedita     |
|         81 | krushna      |
+------------+--------------+
5 rows in set (0.00 sec)

mysql> select custemerorder.custemerid,custemerorder.custemerName from custemerorder right join custemers on custemerorder.custemerid=custemers.orderID;
+------------+--------------+
| custemerid | custemerName |
+------------+--------------+
|       NULL | NULL         |
|       NULL | NULL         |
|          2 | nisha        |
|       NULL | NULL         |
|       NULL | NULL         |
|          5 | krupa        |
+------------+--------------+
6 rows in set (0.00 sec)

mysql> select custemerorder.custemerid,custemerorder.custemerName from custemerorder inner join custemers on custemerorder.custemerid=custemers.orderID;
+------------+--------------+
| custemerid | custemerName |
+------------+--------------+
|          2 | nisha        |
|          5 | krupa        |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> 
mysql> select custemerorder.custemerid,custemerorder.custemerName from custemerorder outer join custemers on custemerorder.custemerid=custemers.orderID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'outer join custemers on custemerorder.custemerid=custemers.orderID' at line 1
mysql> create view same_country as select * from custemers where country='Germeny';
Query OK, 0 rows affected (0.03 sec)

mysql> select * from same_country;
+---------+--------------+---------+-----------+
| orderID | contact_name | country | orderdate |
+---------+--------------+---------+-----------+
|       1 | Maria Anders | Germeny |      2009 |
|       1 | Maria Anders | Germeny |      NULL |
+---------+--------------+---------+-----------+
2 rows in set (0.00 sec)
