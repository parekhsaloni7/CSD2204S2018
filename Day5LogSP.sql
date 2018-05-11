MariaDB [(none)]> show databases;
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
6 rows in set (0.02 sec)

MariaDB [(none)]> use csd2204s18
Database changed
MariaDB [csd2204s18]> CREATE TABLE PERSONS( 
    -> ID INTEGER(3),
    -> LASTNAME VARCHAR(255) NOT NULL,
    -> FIRSTNAME VARCHAR(255) NOT NULL,
    -> AGE INTEGER(3),
    -> CONSTRAINT PK_PERSONS PRIMARY KEY(ID,LASTNAME));
Query OK, 0 rows affected (0.23 sec)

MariaDB [csd2204s18]> DESC PERSONS;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(3)       | NO   | PRI | NULL    |       |
| LASTNAME  | varchar(255) | NO   | PRI | NULL    |       |
| FIRSTNAME | varchar(255) | NO   |     | NULL    |       |
| AGE       | int(3)       | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.06 sec)

MariaDB [csd2204s18]> SHOW INDEX FROM PERSONS;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LASTNAME    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE TABLE ORDERS(
    -> ORDERID INTEGER(3) NOT NULL,
    -> ORDERNUMBER INTEGER(3) NOT NULL,
    -> PERSONID INTEGER(3),
    -> PRIMARY KEY(ORDERID),
    -> CONSTRAINT FK_PERSONORDER FOREIGN KEY(PERSONID)
    -> REFERENCES PERSONS(ID));
Query OK, 0 rows affected (0.19 sec)

MariaDB [csd2204s18]> SHOW INDEX FROM PERSONS;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LASTNAME    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SHOW INDEX FROM ORDERS;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | ORDERID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PERSONORDER |            1 | PERSONID    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> DESC CUSTOMER;
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
6 rows in set (0.03 sec)

MariaDB [csd2204s18]> CREATE TABLE C1 AS SELECT * FROM CUSTOMER; 
Query OK, 10 rows affected (0.22 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> CREATE TABLE C2 AS SELECT NAME,POSTALCODE FROM CUSTOMER WHERE CITY="TORONTO"; 
Query OK, 3 rows affected (0.28 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAME       | varchar(50) | YES  |     | NULL    |       |
| POSTALCODE | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM C1;
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

MariaDB [csd2204s18]> SELECT * FROM C2;
+--------------+------------+
| NAME         | POSTALCODE |
+--------------+------------+
| BOB MARLEY   | 100100     |
| DONNA NEWMAN | 130120     |
| ESTON M.     | 201023     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAME       | varchar(50) | YES  |     | NULL    |       |
| POSTALCODE | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SHOW CRETE TABLE C2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CRETE TABLE C2' at line 1
MariaDB [csd2204s18]> SHOW CREATE TABLE C2;
+-------+---------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                          |
+-------+---------------------------------------------------------------------------------------------------------------------------------------+
| C2    | CREATE TABLE `c2` (
  `NAME` varchar(50) DEFAULT NULL,
  `POSTALCODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+-------+---------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM C2;
+--------------+------------+
| NAME         | POSTALCODE |
+--------------+------------+
| BOB MARLEY   | 100100     |
| DONNA NEWMAN | 130120     |
| ESTON M.     | 201023     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c2                   |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.00 sec)

MariaDB [csd2204s18]> CREATE TABLE C3 LIKE CUSTOMER;
Query OK, 0 rows affected (0.34 sec)

MariaDB [csd2204s18]> SELECT * FROM C3;
Empty set (0.00 sec)

MariaDB [csd2204s18]> DESC C3;
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
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> INSERT INTO C3 SELECT * FROM CUSTOMER;
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C3;
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

MariaDB [csd2204s18]> ALTER TABLE C3 ADD COLUMN COUNTRY VARCHAR(100);
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| custID     | varchar(5)   | NO   | PRI | NULL    |       |
| name       | varchar(50)  | YES  |     | NULL    |       |
| nickname   | varchar(10)  | YES  |     | NULL    |       |
| city       | varchar(20)  | YES  |     | NULL    |       |
| postalcode | varchar(10)  | YES  |     | NULL    |       |
| age        | int(3)       | YES  |     | NULL    |       |
| COUNTRY    | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C3 MODIFY COLUMN COUNTRY VARCHAR(35);
Query OK, 10 rows affected (0.52 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| COUNTRY    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.02 sec)

MariaDB [csd2204s18]> ALTER TABLE C3 MODIFY COLUMN country VARCHAR(35);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.02 sec)

MariaDB [csd2204s18]> alter table c3 change column postalcode zipcode varchar(7);
Query OK, 10 rows affected (0.47 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| custID   | varchar(5)  | NO   | PRI | NULL    |       |
| name     | varchar(50) | YES  |     | NULL    |       |
| nickname | varchar(10) | YES  |     | NULL    |       |
| city     | varchar(20) | YES  |     | NULL    |       |
| zipcode  | varchar(7)  | YES  |     | NULL    |       |
| age      | int(3)      | YES  |     | NULL    |       |
| country  | varchar(35) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

MariaDB [csd2204s18]> alter table c3 change column custID customerID VARCHAR(5);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| zipcode    | varchar(7)  | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> alter table c3 DROP COLUMN NICKNAME;
Query OK, 0 rows affected (1.66 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| zipcode    | varchar(7)  | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C3 MODIFY NAME VARCHAR(50) NOT NULL;
Query OK, 10 rows affected (0.52 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| NAME       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| zipcode    | varchar(7)  | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

MariaDB [csd2204s18]> ALTER TABLE C1 ADD CUSTID VARCHAR(5) PRIMARY KEY;
ERROR 1060 (42S21): Duplicate column name 'CUSTID'
MariaDB [csd2204s18]> SELECT * FROM C1;
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

MariaDB [csd2204s18]> DESC C1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C1 ADD PRIMARY KEY(CUSTID);
Query OK, 0 rows affected (0.58 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C1;
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
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C1 DROP INDEX CUSTID;
ERROR 1091 (42000): Can't DROP 'CUSTID'; check that column/key exists
MariaDB [csd2204s18]> DESC C1;
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
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C1 DROP INDEX custID;
ERROR 1091 (42000): Can't DROP 'custID'; check that column/key exists
MariaDB [csd2204s18]> show variables like 'version';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| version       | 10.1.21-MariaDB |
+---------------+-----------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> alter table c2 drop primary key(custID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custID)' at line 1
MariaDB [csd2204s18]> alter table c2 drop primary key;
ERROR 1091 (42000): Can't DROP 'PRIMARY'; check that column/key exists
MariaDB [csd2204s18]> alter table c1 drop primary key;
Query OK, 10 rows affected (0.52 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C1 DROP INDEX CUSTID;
ERROR 1091 (42000): Can't DROP 'CUSTID'; check that column/key exists
MariaDB [csd2204s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAME       | varchar(50) | YES  |     | NULL    |       |
| POSTALCODE | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE C2 ADD PRIMARY KEY(name);
Query OK, 3 rows affected (0.64 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> DESC C2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| NAME       | varchar(50) | NO   | PRI | NULL    |       |
| POSTALCODE | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(3)       | NO   | PRI | NULL    |       |
| LASTNAME  | varchar(255) | NO   | PRI | NULL    |       |
| FIRSTNAME | varchar(255) | NO   |     | NULL    |       |
| AGE       | int(3)       | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> show index from persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LASTNAME    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> desc c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| NAME       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| zipcode    | varchar(7)  | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(35) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM C3;
+------------+-----------------+------------+---------+------+---------+
| customerID | NAME            | city       | zipcode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | ASHLEY          | WDC        | 321200  |   34 | NULL    |
| C02        | BOB MARLEY      | TORONTO    | 100100  |   23 | NULL    |
| C03        | CHERLIES THERON | NEW YORK   | 120134  |   20 | NULL    |
| C04        | DANIEL JACK     | BRAZIL     | 341020  |   25 | NULL    |
| C05        | DONNA NEWMAN    | TORONTO    | 130120  |   50 | NULL    |
| C06        | ESTON M.        | TORONTO    | 201023  |   65 | NULL    |
| C07        | BOBBY CHACKO    | NEW YORK   | 320300  |   70 | NULL    |
| C08        | ASHKO CHARLES   | USA        | 421044  |   72 | NULL    |
| C09        | TONY SPECIAL    | GTA        | 418321  |   62 | NULL    |
| C10        | JACK SP         | NEW JERSEY | 102301  |   35 | NULL    |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.03 sec)

MariaDB [csd2204s18]> update c3 set country='USA';
Query OK, 10 rows affected (0.05 sec)
Rows matched: 10  Changed: 10  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C3;
+------------+-----------------+------------+---------+------+---------+
| customerID | NAME            | city       | zipcode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | ASHLEY          | WDC        | 321200  |   34 | USA     |
| C02        | BOB MARLEY      | TORONTO    | 100100  |   23 | USA     |
| C03        | CHERLIES THERON | NEW YORK   | 120134  |   20 | USA     |
| C04        | DANIEL JACK     | BRAZIL     | 341020  |   25 | USA     |
| C05        | DONNA NEWMAN    | TORONTO    | 130120  |   50 | USA     |
| C06        | ESTON M.        | TORONTO    | 201023  |   65 | USA     |
| C07        | BOBBY CHACKO    | NEW YORK   | 320300  |   70 | USA     |
| C08        | ASHKO CHARLES   | USA        | 421044  |   72 | USA     |
| C09        | TONY SPECIAL    | GTA        | 418321  |   62 | USA     |
| C10        | JACK SP         | NEW JERSEY | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> update c3 set country='CANADA' where city='TORONTO';
Query OK, 3 rows affected (0.05 sec)
Rows matched: 3  Changed: 3  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C3;
+------------+-----------------+------------+---------+------+---------+
| customerID | NAME            | city       | zipcode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | ASHLEY          | WDC        | 321200  |   34 | USA     |
| C02        | BOB MARLEY      | TORONTO    | 100100  |   23 | CANADA  |
| C03        | CHERLIES THERON | NEW YORK   | 120134  |   20 | USA     |
| C04        | DANIEL JACK     | BRAZIL     | 341020  |   25 | USA     |
| C05        | DONNA NEWMAN    | TORONTO    | 130120  |   50 | CANADA  |
| C06        | ESTON M.        | TORONTO    | 201023  |   65 | CANADA  |
| C07        | BOBBY CHACKO    | NEW YORK   | 320300  |   70 | USA     |
| C08        | ASHKO CHARLES   | USA        | 421044  |   72 | USA     |
| C09        | TONY SPECIAL    | GTA        | 418321  |   62 | USA     |
| C10        | JACK SP         | NEW JERSEY | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> update c3 set country='CANADA' where city='TORONTO'||CITY='GTA';
Query OK, 1 row affected (0.03 sec)
Rows matched: 4  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C3;
+------------+-----------------+------------+---------+------+---------+
| customerID | NAME            | city       | zipcode | age  | country |
+------------+-----------------+------------+---------+------+---------+
| C01        | ASHLEY          | WDC        | 321200  |   34 | USA     |
| C02        | BOB MARLEY      | TORONTO    | 100100  |   23 | CANADA  |
| C03        | CHERLIES THERON | NEW YORK   | 120134  |   20 | USA     |
| C04        | DANIEL JACK     | BRAZIL     | 341020  |   25 | USA     |
| C05        | DONNA NEWMAN    | TORONTO    | 130120  |   50 | CANADA  |
| C06        | ESTON M.        | TORONTO    | 201023  |   65 | CANADA  |
| C07        | BOBBY CHACKO    | NEW YORK   | 320300  |   70 | USA     |
| C08        | ASHKO CHARLES   | USA        | 421044  |   72 | USA     |
| C09        | TONY SPECIAL    | GTA        | 418321  |   62 | CANADA  |
| C10        | JACK SP         | NEW JERSEY | 102301  |   35 | USA     |
+------------+-----------------+------------+---------+------+---------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> update c3 set country='SOUTH AMERICA' where city='BRAZIL';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C3;
+------------+-----------------+------------+---------+------+---------------+
| customerID | NAME            | city       | zipcode | age  | country       |
+------------+-----------------+------------+---------+------+---------------+
| C01        | ASHLEY          | WDC        | 321200  |   34 | USA           |
| C02        | BOB MARLEY      | TORONTO    | 100100  |   23 | CANADA        |
| C03        | CHERLIES THERON | NEW YORK   | 120134  |   20 | USA           |
| C04        | DANIEL JACK     | BRAZIL     | 341020  |   25 | SOUTH AMERICA |
| C05        | DONNA NEWMAN    | TORONTO    | 130120  |   50 | CANADA        |
| C06        | ESTON M.        | TORONTO    | 201023  |   65 | CANADA        |
| C07        | BOBBY CHACKO    | NEW YORK   | 320300  |   70 | USA           |
| C08        | ASHKO CHARLES   | USA        | 421044  |   72 | USA           |
| C09        | TONY SPECIAL    | GTA        | 418321  |   62 | CANADA        |
| C10        | JACK SP         | NEW JERSEY | 102301  |   35 | USA           |
+------------+-----------------+------------+---------+------+---------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM C2;
+--------------+------------+
| NAME         | POSTALCODE |
+--------------+------------+
| BOB MARLEY   | 100100     |
| DONNA NEWMAN | 130120     |
| ESTON M.     | 201023     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> DROP FROM C2 WHERE NAME LIKE='BOB';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM C2 WHERE NAME LIKE='BOB'' at line 1
MariaDB [csd2204s18]> DELETE FROM C2 WHERE NAME LIKE 'BOB%';
Query OK, 1 row affected (0.03 sec)

MariaDB [csd2204s18]> SELECT * FROM C2;
+--------------+------------+
| NAME         | POSTALCODE |
+--------------+------------+
| DONNA NEWMAN | 130120     |
| ESTON M.     | 201023     |
+--------------+------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> DELETE FROM C2;
Query OK, 2 rows affected (0.05 sec)

MariaDB [csd2204s18]> SELECT * FROM C2;
Empty set (0.00 sec)

MariaDB [csd2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c2                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [csd2204s18]> DROP TABLE C2;
Query OK, 0 rows affected (0.09 sec)

MariaDB [csd2204s18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM C1;
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

MariaDB [csd2204s18]> UPDATE C1 SET CUSTID=1 WHERE AGE >=50; 
Query OK, 5 rows affected (0.09 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM C1;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| 1      | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| 1      | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| 1      | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| 1      | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| 1      | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> commit;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> exit;
