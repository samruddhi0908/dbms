ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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
| Menu               |
| Movie_list         |
| PROJECT            |
| aakansha           |
| assignment         |
| assignment2        |
| college            |
| custemerinfo       |
| database2          |
| databasename       |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
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
26 rows in set (0.00 sec)

mysql> create database employ_info;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Amezon_product     |
| Menu               |
| Movie_list         |
| PROJECT            |
| aakansha           |
| assignment         |
| assignment2        |
| college            |
| custemerinfo       |
| database2          |
| databasename       |
| employ_info        |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
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
27 rows in set (0.01 sec)

mysql> use employe_info;
ERROR 1049 (42000): Unknown database 'employe_info'
mysql> use employ_info;
mysql> 
mysql> create table employe_list(Srno INT,Employe_name varchar(50),EmployeID int(
mysql> create table employe_list(Srno INT,Employe_name varchar(50),EmployeID int,Dept_name varchar(30),salary INT);
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO employe_info values(1,'Samruddhi',103,'Computer',450000),(2,'Affan',105,'AIDS',240000),(3,'Sweta',203,'Mechanical',2000000),(4,'himmanshu',304,'Computer',110000),(5,'Shreya',402,'IT',30000);
ERROR 1146 (42S02): Table 'employ_info.employe_info' doesn't exist
mysql> INSERT INTO employ_info values(1,'Samruddhi',103,'Computer',450000),(2,'Affan',105,'AIDS',240000),(3,'Sweta',203,'Mechanical',2000000),(4,'himmanshu',304,'Computer',110000),(5,'Shreya',402,'IT',30000);
ERROR 1146 (42S02): Table 'employ_info.employ_info' doesn't exist
mysql> INSERT INTO employ_list values(1,'Samruddhi',103,'Computer',450000),(2,'Affan',105,'AIDS',240000),(3,'Sweta',203,'Mechanical',2000000),(4,'himmanshu',304,'Computer',110000),(5,'Shreya',402,'IT',30000);
ERROR 1146 (42S02): Table 'employ_info.employ_list' doesn't exist
mysql> INSERT INTO employe_list values(1,'Samruddhi',103,'Computer',450000),(2,'Affan',105,'AIDS',240000),(3,'Sweta',203,'Mechanical',2000000),(4,'himmanshu',304,'Computer',110000),(5,'Shreya',402,'IT',30000);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employe_list;
+------+--------------+-----------+------------+---------+
| Srno | Employe_name | EmployeID | Dept_name  | salary  |
+------+--------------+-----------+------------+---------+
|    1 | Samruddhi    |       103 | Computer   |  450000 |
|    2 | Affan        |       105 | AIDS       |  240000 |
|    3 | Sweta        |       203 | Mechanical | 2000000 |
|    4 | himmanshu    |       304 | Computer   |  110000 |
|    5 | Shreya       |       402 | IT         |   30000 |
+------+--------------+-----------+------------+---------+
5 rows in set (0.00 sec)

mysql> select * from employe_list where EmployeID in(select EmployeID from employe_list where salary>50000);
+------+--------------+-----------+------------+---------+
| Srno | Employe_name | EmployeID | Dept_name  | salary  |
+------+--------------+-----------+------------+---------+
|    1 | Samruddhi    |       103 | Computer   |  450000 |
|    2 | Affan        |       105 | AIDS       |  240000 |
|    3 | Sweta        |       203 | Mechanical | 2000000 |
|    4 | himmanshu    |       304 | Computer   |  110000 |
+------+--------------+-----------+------------+---------+
4 rows in set (0.00 sec)

mysql> select * from employe_list where salary>50500;
+------+--------------+-----------+------------+---------+
| Srno | Employe_name | EmployeID | Dept_name  | salary  |
+------+--------------+-----------+------------+---------+
|    1 | Samruddhi    |       103 | Computer   |  450000 |
|    2 | Affan        |       105 | AIDS       |  240000 |
|    3 | Sweta        |       203 | Mechanical | 2000000 |
|    4 | himmanshu    |       304 | Computer   |  110000 |
+------+--------------+-----------+------------+---------+
4 rows in set (0.00 sec)

mysql> select * from emoloye_list where Dept_name = (select Dept_name from employe_list where Employe_name='Samruddhi');
ERROR 1146 (42S02): Table 'employ_info.emoloye_list' doesn't exist
mysql> select * from employe_list where Dept_name = (select Dept_name from employe_list where Employe_name='Samruddhi');
+------+--------------+-----------+-----------+--------+
| Srno | Employe_name | EmployeID | Dept_name | salary |
+------+--------------+-----------+-----------+--------+
|    1 | Samruddhi    |       103 | Computer  | 450000 |
|    4 | himmanshu    |       304 | Computer  | 110000 |
+------+--------------+-----------+-----------+--------+
2 rows in set (0.00 sec)

mysql> select * from employe_list where EmployeID = (select EmployeID from employe_list where Employe_name='Samruddhi');
+------+--------------+-----------+-----------+--------+
| Srno | Employe_name | EmployeID | Dept_name | salary |
+------+--------------+-----------+-----------+--------+
|    1 | Samruddhi    |       103 | Computer  | 450000 |
+------+--------------+-----------+-----------+--------+
1 row in set (0.00 sec)
  
