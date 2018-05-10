MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| csd2204s18         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.00 sec)

MariaDB [(none)]> SHOW TABLES;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> USE DATABASE CSD2204S18;
ERROR 1049 (42000): Unknown database 'database'
MariaDB [(none)]> USE CSD2204S18;
Database changed
MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer;
Empty set (0.08 sec)

MariaDB [CSD2204S18]> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.09 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C01','ASHLEY','ASH','WDC','321200',34);
Query OK, 1 row affected (0.13 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer;
+--------+--------+----------+------+------------+------+
| custID | name   | nickname | city | postalcode | age  |
+--------+--------+----------+------+------------+------+
| C01    | ASHLEY | ASH      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.01 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C02','BOB MARLEY','BM','TORONTO','100100',23);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C03','CHERLIES THERON','CHER','NEW YORK','120134',20);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C04','DANIEL JACK','DJ','BRAZIL','341020',25);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C05','DONNA NEWMAN','NEW','TORONTO','130120',50);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C06','ESTON M,','M.','TORONTO','201023',65);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C07','BOBBY CHACKO','CHAC','NEW YORK','320300',70);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C08','ASHKO CHARLES','AK','USA','421044',72);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C09','TONY SPECIAL','SPECIE','GTA','418321',62);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO customer VALUES('C10','JACK SP','SPARROW','NEW JERSEY','102301',35);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M,        | M.       | TORONTO    | 201023     |   65 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE customer SET NAME='ESTON M.' WHERE CUSTid='C06';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,nickname FROM Customer;
+-----------------+----------+
| name            | nickname |
+-----------------+----------+
| ASHLEY          | ASH      |
| BOB MARLEY      | BM       |
| CHERLIES THERON | CHER     |
| DANIEL JACK     | DJ       |
| DONNA NEWMAN    | NEW      |
| ESTON M.        | M.       |
| BOBBY CHACKO    | CHAC     |
| ASHKO CHARLES   | AK       |
| TONY SPECIAL    | SPECIE   |
| JACK SP         | SPARROW  |
+-----------------+----------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,postalcode FROM customer;
+------------+------------+
| city       | postalcode |
+------------+------------+
| WDC        | 321200     |
| TORONTO    | 100100     |
| NEW YORK   | 120134     |
| BRAZIL     | 341020     |
| TORONTO    | 130120     |
| TORONTO    | 201023     |
| NEW YORK   | 320300     |
| USA        | 421044     |
| GTA        | 418321     |
| NEW JERSEY | 102301     |
+------------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer where name='ASHLEY';
+--------+--------+----------+------+------------+------+
| custID | name   | nickname | city | postalcode | age  |
+--------+--------+----------+------+------------+------+
| C01    | ASHLEY | ASH      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer where nickname='AK';
+--------+---------------+----------+------+------------+------+
| custID | name          | nickname | city | postalcode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | ASHKO CHARLES | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select city from customer where name='ESTON M.';
+---------+
| city    |
+---------+
| TORONTO |
+---------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select name,city from customer where name='ESTON M.';
+----------+---------+
| name     | city    |
+----------+---------+
| ESTON M. | TORONTO |
+----------+---------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select name,city from customer where city='TORONTO';
+--------------+---------+
| name         | city    |
+--------------+---------+
| BOB MARLEY   | TORONTO |
| DONNA NEWMAN | TORONTO |
| ESTON M.     | TORONTO |
+--------------+---------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select name,city from customer where city!='TORONTO';
+-----------------+------------+
| name            | city       |
+-----------------+------------+
| ASHLEY          | WDC        |
| CHERLIES THERON | NEW YORK   |
| DANIEL JACK     | BRAZIL     |
| BOBBY CHACKO    | NEW YORK   |
| ASHKO CHARLES   | USA        |
| TONY SPECIAL    | GTA        |
| JACK SP         | NEW JERSEY |
+-----------------+------------+
7 rows in set (0.02 sec)

MariaDB [CSD2204S18]> select name,age from customer where age=50;
+--------------+------+
| name         | age  |
+--------------+------+
| DONNA NEWMAN |   50 |
+--------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select name,age from customer where age<50;
+-----------------+------+
| name            | age  |
+-----------------+------+
| ASHLEY          |   34 |
| BOB MARLEY      |   23 |
| CHERLIES THERON |   20 |
| DANIEL JACK     |   25 |
| JACK SP         |   35 |
+-----------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select name,age from customer where age>50;
+---------------+------+
| name          | age  |
+---------------+------+
| ESTON M.      |   65 |
| BOBBY CHACKO  |   70 |
| ASHKO CHARLES |   72 |
| TONY SPECIAL  |   62 |
+---------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select name,city from customer where name<'DONNA NEWMAN';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| ASHLEY          | WDC      |
| BOB MARLEY      | TORONTO  |
| CHERLIES THERON | NEW YORK |
| DANIEL JACK     | BRAZIL   |
| BOBBY CHACKO    | NEW YORK |
| ASHKO CHARLES   | USA      |
+-----------------+----------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name<'DONNA NEWMAN';
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ASHLEY          | ASH      | WDC      | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO  | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL   | 341020     |   25 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK | 320300     |   70 |
| C08    | ASHKO CHARLES   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM customer where name='ASHLEY'||CITY='TORONTO';
+--------------+---------+
| name         | city    |
+--------------+---------+
| ASHLEY       | WDC     |
| BOB MARLEY   | TORONTO |
| DONNA NEWMAN | TORONTO |
| ESTON M.     | TORONTO |
+--------------+---------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM customer where CITY='NEW YORK'||CITY='TORONTO';
+-----------------+----------+
| name            | city     |
+-----------------+----------+
| BOB MARLEY      | TORONTO  |
| CHERLIES THERON | NEW YORK |
| DONNA NEWMAN    | TORONTO  |
| ESTON M.        | TORONTO  |
| BOBBY CHACKO    | NEW YORK |
+-----------------+----------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,,AGE,city FROM customer where AGE>50||CITY='TORONTO';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'AGE,city FROM customer where AGE>50||CITY='TORONTO'' at line 1
MariaDB [CSD2204S18]> SELECT name,AGE,city FROM customer where AGE>50||CITY='TORONTO';
+---------------+------+----------+
| name          | AGE  | city     |
+---------------+------+----------+
| BOB MARLEY    |   23 | TORONTO  |
| DONNA NEWMAN  |   50 | TORONTO  |
| ESTON M.      |   65 | TORONTO  |
| BOBBY CHACKO  |   70 | NEW YORK |
| ASHKO CHARLES |   72 | USA      |
| TONY SPECIAL  |   62 | GTA      |
+---------------+------+----------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,AGE FROM customer where AGE>50||CITY='TORONTO';
+---------------+------+
| name          | AGE  |
+---------------+------+
| BOB MARLEY    |   23 |
| DONNA NEWMAN  |   50 |
| ESTON M.      |   65 |
| BOBBY CHACKO  |   70 |
| ASHKO CHARLES |   72 |
| TONY SPECIAL  |   62 |
+---------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,AGE FROM customer where AGE>50 AND CITY='TORONTO';
+----------+------+
| name     | AGE  |
+----------+------+
| ESTON M. |   65 |
+----------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer where CITY='TORONTO';
+--------+--------------+----------+---------+------------+------+
| custID | name         | nickname | city    | postalcode | age  |
+--------+--------------+----------+---------+------------+------+
| C02    | BOB MARLEY   | BM       | TORONTO | 100100     |   23 |
| C05    | DONNA NEWMAN | NEW      | TORONTO | 130120     |   50 |
| C06    | ESTON M.     | M.       | TORONTO | 201023     |   65 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT count(*) FROM customer where CITY='TORONTO';
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT count(*)"NO OF CUSTOMERS IN TORONTO" FROM customer where CITY='TORONTO';
+----------------------------+
| NO OF CUSTOMERS IN TORONTO |
+----------------------------+
|                          3 |
+----------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT count(*)"NO OF CUSTOMERS HAVING GE MORE THAN 50" FROM customer where AGE>50;
+----------------------------------------+
| NO OF CUSTOMERS HAVING GE MORE THAN 50 |
+----------------------------------------+
|                                      4 |
+----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT count(*)"NO OF CUSTOMERS HAVING AGE MORE THAN 50" FROM customer where AGE>50;
+-----------------------------------------+
| NO OF CUSTOMERS HAVING AGE MORE THAN 50 |
+-----------------------------------------+
|                                       4 |
+-----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT count *"NO OF CUSTOMERS HAVING AGE BTW 30 AND 70" FROM customer where AGE>30 AND AGE<70;
ERROR 1054 (42S22): Unknown column 'count' in 'field list'
MariaDB [CSD2204S18]> SELECT * "NO OF CUSTOMERS HAVING AGE BTW 30 AND 70" FROM customer where AGE>30 AND AGE<70;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '"NO OF CUSTOMERS HAVING AGE BTW 30 AND 70" FROM customer where AGE>30 AND AGE<70' at line 1
MariaDB [CSD2204S18]> SELECT * FROM customer where AGE>30 AND AGE<70;
+--------+--------------+----------+------------+------------+------+
| custID | name         | nickname | city       | postalcode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | ASHLEY       | ASH      | WDC        | 321200     |   34 |
| C05    | DONNA NEWMAN | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.     | M.       | TORONTO    | 201023     |   65 |
| C09    | TONY SPECIAL | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP      | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
5 rows in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM cusomer WHERE age BETWEEN 30 and 70;
ERROR 1146 (42S02): Table 'csd2204s18.cusomer' doesn't exist
MariaDB [CSD2204S18]> SELECT * FROM customer WHERE age BETWEEN 30 and 70;
+--------+--------------+----------+------------+------------+------+
| custID | name         | nickname | city       | postalcode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | ASHLEY       | ASH      | WDC        | 321200     |   34 |
| C05    | DONNA NEWMAN | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.     | M.       | TORONTO    | 201023     |   65 |
| C07    | BOBBY CHACKO | CHAC     | NEW YORK   | 320300     |   70 |
| C09    | TONY SPECIAL | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP      | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE not age BETWEEN 30 and 70;
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C02    | BOB MARLEY      | BM       | TORONTO  | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL   | 341020     |   25 |
| C08    | ASHKO CHARLES   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select name,max(age) from customer;
+--------+----------+
| name   | max(age) |
+--------+----------+
| ASHLEY |       72 |
+--------+----------+
1 row in set (0.05 sec)

MariaDB [CSD2204S18]> select name from customer where age=max(age);
ERROR 1111 (HY000): Invalid use of group function
MariaDB [CSD2204S18]> SELECT min(age) from customer;
+----------+
| min(age) |
+----------+
|       20 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT avg(age) from customer;
+----------+
| avg(age) |
+----------+
|  45.6000 |
+----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name= 'B%';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name LIKE 'B%';
+--------+--------------+----------+----------+------------+------+
| custID | name         | nickname | city     | postalcode | age  |
+--------+--------------+----------+----------+------------+------+
| C02    | BOB MARLEY   | BM       | TORONTO  | 100100     |   23 |
| C07    | BOBBY CHACKO | CHAC     | NEW YORK | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name NOT LIKE 'B%';
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name LIKE '%B';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name LIKE '%n';
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where city LIKE 'n%';
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where city LIKE 'new%';
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name LIKE '__n%';
+--------+--------------+----------+---------+------------+------+
| custID | name         | nickname | city    | postalcode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | DANIEL JACK  | DJ       | BRAZIL  | 341020     |   25 |
| C05    | DONNA NEWMAN | NEW      | TORONTO | 130120     |   50 |
| C09    | TONY SPECIAL | SPECIE   | GTA     | 418321     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where name LIKE '__n_a%';
+--------+--------------+----------+---------+------------+------+
| custID | name         | nickname | city    | postalcode | age  |
+--------+--------------+----------+---------+------------+------+
| C05    | DONNA NEWMAN | NEW      | TORONTO | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer LIMIT 4;
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ASHLEY          | ASH      | WDC      | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO  | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where age IN (20,25,65,72);
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL   | 341020     |   25 |
| C06    | ESTON M.        | M.       | TORONTO  | 201023     |   65 |
| C08    | ASHKO CHARLES   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where age NOT IN (20,25,65,72);
+--------+--------------+----------+------------+------------+------+
| custID | name         | nickname | city       | postalcode | age  |
+--------+--------------+----------+------------+------------+------+
| C01    | ASHLEY       | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY   | BM       | TORONTO    | 100100     |   23 |
| C05    | DONNA NEWMAN | NEW      | TORONTO    | 130120     |   50 |
| C07    | BOBBY CHACKO | CHAC     | NEW YORK   | 320300     |   70 |
| C09    | TONY SPECIAL | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP      | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where city IN ('toronto','gta','usa','wdc');
+--------+---------------+----------+---------+------------+------+
| custID | name          | nickname | city    | postalcode | age  |
+--------+---------------+----------+---------+------------+------+
| C01    | ASHLEY        | ASH      | WDC     | 321200     |   34 |
| C02    | BOB MARLEY    | BM       | TORONTO | 100100     |   23 |
| C05    | DONNA NEWMAN  | NEW      | TORONTO | 130120     |   50 |
| C06    | ESTON M.      | M.       | TORONTO | 201023     |   65 |
| C08    | ASHKO CHARLES | AK       | USA     | 421044     |   72 |
| C09    | TONY SPECIAL  | SPECIE   | GTA     | 418321     |   62 |
+--------+---------------+----------+---------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select DISTINCT(city) 'Unique Cities' FROM Customer;
+---------------+
| Unique Cities |
+---------------+
| WDC           |
| TORONTO       |
| NEW YORK      |
| BRAZIL        |
| USA           |
| GTA           |
| NEW JERSEY    |
+---------------+
7 rows in set (0.03 sec)

MariaDB [CSD2204S18]> select count(DISTINCT(city)) 'Unique Cities' FROM Customer;
+---------------+
| Unique Cities |
+---------------+
|             7 |
+---------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY name;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.05 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY name asc;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY name DESC;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY age DESC;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY age DESC limit 1;
+--------+---------------+----------+------+------------+------+
| custID | name          | nickname | city | postalcode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | ASHKO CHARLES | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY age DESC limit 2;
+--------+---------------+----------+----------+------------+------+
| custID | name          | nickname | city     | postalcode | age  |
+--------+---------------+----------+----------+------------+------+
| C08    | ASHKO CHARLES | AK       | USA      | 421044     |   72 |
| C07    | BOBBY CHACKO  | CHAC     | NEW YORK | 320300     |   70 |
+--------+---------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer ORDER BY age DESC age<max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'age<max(age)' at line 1
MariaDB [CSD2204S18]> select * from customer ORDER BY age where age<max(age);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where age<max(age)' at line 1
MariaDB [CSD2204S18]> select * from (select * from customer ORDER BY age DESC limit 2) AS t order by age SC LIMIT 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SC LIMIT 1' at line 1
MariaDB [CSD2204S18]> select * from (select * from customer ORDER BY age DESC limit 2) AS t order by age ASC LIMIT 1;
+--------+--------------+----------+----------+------------+------+
| custID | name         | nickname | city     | postalcode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | BOBBY CHACKO | CHAC     | NEW YORK | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select * from (select * from customer ORDER BY age asc limit 2) AS t order by age des LIMIT 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'des LIMIT 1' at line 1
MariaDB [CSD2204S18]> select * from (select * from customer ORDER BY age asc limit 2) AS t order by age desc LIMIT 1;
+--------+------------+----------+---------+------------+------+
| custID | name       | nickname | city    | postalcode | age  |
+--------+------------+----------+---------+------------+------+
| C02    | BOB MARLEY | BM       | TORONTO | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> select max(age)*100 from customer;
+--------------+
| max(age)*100 |
+--------------+
|         7200 |
+--------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> commit;
Query OK, 0 rows affected (0.00 sec)

MariaDB [CSD2204S18]> exit;
