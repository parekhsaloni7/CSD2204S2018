MariaDB [csd2204s18]> Create view v1 AS SELECT * FROM products;
Query OK, 0 rows affected (0.06 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| new_movie            |
| orders               |
| persons              |
| products             |
| regions              |
| v1                   |
+----------------------+
17 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from v1;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.03 sec)

MariaDB [csd2204s18]> Create view v2 AS SELECT * FROM products where price>100;
Query OK, 0 rows affected (0.03 sec)

MariaDB [csd2204s18]> select * from v2;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> Create or Replce view v1 AS SELECT * FROM products where price>100;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Replce view v1 AS SELECT * FROM products where price>100' at line 1
MariaDB [csd2204s18]> Create or Replace view v1 AS SELECT * FROM products where price>100;
Query OK, 0 rows affected (0.05 sec)

MariaDB [csd2204s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> insert into v1 values(12,'USB PORT',89,2);
ERROR 1062 (23000): Duplicate entry '12' for key 'PRIMARY'
MariaDB [csd2204s18]> insert into v1 values(13,'USB PORT',89,2);
ERROR 1062 (23000): Duplicate entry '13' for key 'PRIMARY'
MariaDB [csd2204s18]> insert into v1 values(20,'USB PORT',89,2);
Query OK, 1 row affected (0.08 sec)

MariaDB [csd2204s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB PORT        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> delete from v1 where code=20;
Query OK, 0 rows affected (0.02 sec)

MariaDB [csd2204s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB PORT        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name,price from products where name like '%drive%';
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> Create or Replce view v2 AS select name,price from products where name like '%drive%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Replce view v2 AS select name,price from products where name like '%drive%'' at line 1
MariaDB [csd2204s18]> Create or Replace view v2 AS select name,price from products where name like '%drive%';
Query OK, 0 rows affected (0.02 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| new_movie            |
| orders               |
| persons              |
| products             |
| regions              |
| v1                   |
| v2                   |
+----------------------+
18 rows in set (0.00 sec)

MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select products.code,products.name,manu.name from manu inner join products on products.manu=manu.code;
ERROR 1054 (42S22): Unknown column 'products.manu' in 'on clause'
MariaDB [csd2204s18]> 
MariaDB [csd2204s18]> select products.code,products.name,manu.name from manu inner join products on products.manufacturer=manu.code;
+------+-----------------+-------------------+
| code | name            | name              |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB PORT        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> select products.code,products.name "Products",manu.name "Manufacturer" from manu inner join products on products.manufacturer=manu.code;
+------+-----------------+-------------------+
| code | Products        | Manufacturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB PORT        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> Create or Replace view v3 AS  select products.code,products.name "Products",manu.name "Manufacturer" from manu inner join products on products.manufacturer=manu.code;
Query OK, 0 rows affected (0.08 sec)

MariaDB [csd2204s18]> select * from v3;
+------+-----------------+-------------------+
| code | Products        | Manufacturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB PORT        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name,salary FROM employees where SALARY> ALL(select AVG(salary) from employees GROUP BY department_id);
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.05 sec)

MariaDB [csd2204s18]> Create or Replace view v4 AS select first_name,last_name,salary FROM employees where SALARY> ALL(select AVG(salary) from employees GROUP BY department_id);
Query OK, 0 rows affected (0.05 sec)

MariaDB [csd2204s18]> select * from v4;
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> drop view v5;
ERROR 1051 (42S02): Unknown table 'csd2204s18.v5'
MariaDB [csd2204s18]> drop view if exists v5;
Query OK, 0 rows affected, 1 warning (0.00 sec)

MariaDB [csd2204s18]> drop view if exists v1;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| new_movie            |
| orders               |
| persons              |
| products             |
| regions              |
| v2                   |
| v3                   |
| v4                   |
+----------------------+
19 rows in set (0.00 sec)

MariaDB [csd2204s18]> commit;
Query OK, 0 rows affected (0.01 sec)

MariaDB [csd2204s18]> exit;
