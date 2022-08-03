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

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| EMPLOYEE           |
| Menu               |
| Movie_list         |
| TE_B               |
| aadarsh            |
| aakansha           |
| assignment         |
| assignment2        |
| b1                 |
| college            |
| database2          |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
| personal_info      |
| pizza_mania        |
| rushi              |
| samiksha           |
| school             |
| shital             |
| store              |
| sys                |
| teachers_info      |
+--------------------+
25 rows in set (0.01 sec)

mysql> create database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create database Amezon_product;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Amezon_product     |
| EMPLOYEE           |
| Menu               |
| Movie_list         |
| TE_B               |
| aadarsh            |
| aakansha           |
| assignment         |
| assignment2        |
| b1                 |
| college            |
| database2          |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
| personal_info      |
| pizza_mania        |
| rushi              |
| samiksha           |
| school             |
| shital             |
| store              |
| sys                |
| teachers_info      |
+--------------------+
26 rows in set (0.00 sec)

mysql> use Amezon_product;
Database changed
mysql> create table productlist;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table productlist(product_id INT primary key,product_name VARCHAR(30));
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Amezon_product(product_name values(101,'Kurties');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(101,'Kurties')' at line 1
mysql> INSERT INTO Amezon_product(product_name) values(101,'Kurties');
ERROR 1146 (42S02): Table 'Amezon_product.Amezon_product' doesn't exist
mysql> INSERT INTO productlist(product_name) values(101,'Kurties');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO productlist values(101,'Kurties');
Query OK, 1 row affected (0.03 sec)

mysql> select * from Amezon_product;
ERROR 1146 (42S02): Table 'Amezon_product.Amezon_product' doesn't exist
mysql> select * from productlist;
+------------+--------------+
| product_id | product_name |
+------------+--------------+
|        101 | Kurties      |
+------------+--------------+
1 row in set (0.00 sec)

mysql> Create TABLE productlist(product_id INT,product_name VARCHAR(30) UNIQUE);
ERROR 1050 (42S01): Table 'productlist' already exists
mysql> Create TABLE productlist1(product_id INT,product_name VARCHAR(30) UNIQUE);
Query OK, 0 rows affected (0.05 sec)

mysql> desc productlist;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| product_id   | int         | NO   | PRI | NULL    |       |
| product_name | varchar(30) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc productlist1;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| product_id   | int         | YES  |     | NULL    |       |
| product_name | varchar(30) | YES  | UNI | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table productlist1 add product_price int not NULL;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc productlist1;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| product_id    | int         | YES  |     | NULL    |       |
| product_name  | varchar(30) | YES  | UNI | NULL    |       |
| product_price | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into productlist1 values (102,'saree');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into productlist1 values (102,'saree'799 );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '799 )' at line 1
mysql> insert into productlist1 values (102,'saree',799);
Query OK, 1 row affected (0.02 sec)

mysql> select * from productlist1;
+------------+--------------+---------------+
| product_id | product_name | product_price |
+------------+--------------+---------------+
|        102 | saree        |           799 |
+------------+--------------+---------------+
1 row in set (0.00 sec)

mysql> insert into productlist1 values (103'jeans',469);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''jeans',469)' at line 1
mysql> insert into productlist1 values (103,'jeans',469);
Query OK, 1 row affected (0.02 sec)

mysql> select * from productlist1;
+------------+--------------+---------------+
| product_id | product_name | product_price |
+------------+--------------+---------------+
|        102 | saree        |           799 |
|        103 | jeans        |           469 |
+------------+--------------+---------------+
2 rows in set (0.00 sec)

mysql> insert into productlist1 values (104,'watch',2000);
Query OK, 1 row affected (0.03 sec)

mysql> select * from productlist1;
+------------+--------------+---------------+
| product_id | product_name | product_price |
+------------+--------------+---------------+
|        102 | saree        |           799 |
|        103 | jeans        |           469 |
|        104 | watch        |          2000 |
+------------+--------------+---------------+
3 rows in set (0.00 sec)

mysql> alter table productlist drop column product_id;
Query OK, 1 row affected (0.04 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> select * from productlis1;
ERROR 1146 (42S02): Table 'Amezon_product.productlis1' doesn't exist
mysql> alter table productlist1 add product_key PRIMARY KEY AUTO_INCREMENT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'PRIMARY KEY AUTO_INCREMENT' at line 1
mysql> alter table productlist1 srno int primary key auto_increment;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'srno int primary key auto_increment' at line 1
mysql> alter table productlist1 drop column product_id;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table productlist1 srno int primary key auto_increment;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'srno int primary key auto_increment' at line 1
mysql> alter table productlist1 add  srno int primary key auto_increment;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc productlist1;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| product_name  | varchar(30) | YES  | UNI | NULL    |                |
| product_price | int         | NO   |     | NULL    |                |
| srno          | int         | NO   | PRI | NULL    | auto_increment |
+---------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into productlist1 values ('top',205);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into productlist1 (product_name,product_price) values ('top',205);
Query OK, 1 row affected (0.02 sec)

mysql> select * from productlist1;
+--------------+---------------+------+
| product_name | product_price | srno |
+--------------+---------------+------+
| saree        |           799 |    1 |
| jeans        |           469 |    2 |
| watch        |          2000 |    3 |
| top          |           205 |    4 |
+--------------+---------------+------+
4 rows in set (0.00 sec)
