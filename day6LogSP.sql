MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> show tables;
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

MariaDB [csd2204s18]> select * from customers;
ERROR 1146 (42S02): Table 'csd2204s18.customers' doesn't exist
MariaDB [csd2204s18]> select * from customer;
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
10 rows in set (0.06 sec)

MariaDB [csd2204s18]> select * from customer ORDER BY name,city ASC;
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

MariaDB [csd2204s18]> select * from customer ORDER BY name DESC,city ASC;
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

MariaDB [csd2204s18]> select * from customer limit 3;
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C01    | ASHLEY          | ASH      | WDC      | 321200     |   34 |
| C02    | BOB MARLEY      | BM       | TORONTO  | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from customer order by desc limit 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'desc limit 3' at line 1
MariaDB [csd2204s18]> select * from customer order by custID desc LIMIT 3;
+--------+---------------+----------+------------+------------+------+
| custID | name          | nickname | city       | postalcode | age  |
+--------+---------------+----------+------------+------------+------+
| C10    | JACK SP       | SPARROW  | NEW JERSEY | 102301     |   35 |
| C09    | TONY SPECIAL  | SPECIE   | GTA        | 418321     |   62 |
| C08    | ASHKO CHARLES | AK       | USA        | 421044     |   72 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.02 sec)

MariaDB [csd2204s18]> select * from customer order by custID desc LIMIT 3 ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ASC' at line 1
MariaDB [csd2204s18]> select * from( select * from customer order by custID desc LIMIT 3) t order by custID ASC;
+--------+---------------+----------+------------+------------+------+
| custID | name          | nickname | city       | postalcode | age  |
+--------+---------------+----------+------------+------------+------+
| C08    | ASHKO CHARLES | AK       | USA        | 421044     |   72 |
| C09    | TONY SPECIAL  | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP       | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.03 sec)

MariaDB [csd2204s18]> select * from customer;
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
10 rows in set (0.01 sec)

MariaDB [csd2204s18]> select * from customer GROUP BY city;
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 |
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city from customer GROUP BY city;
+------------+
| city       |
+------------+
| BRAZIL     |
| GTA        |
| NEW JERSEY |
| NEW YORK   |
| TORONTO    |
| USA        |
| WDC        |
+------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select count(city) "Unique Cities" from customer GROUP BY city;
+---------------+
| Unique Cities |
+---------------+
|             1 |
|             1 |
|             1 |
|             2 |
|             3 |
|             1 |
|             1 |
+---------------+
7 rows in set (0.01 sec)

MariaDB [csd2204s18]> select city, count(city) "No of Customers from Cities" from customer GROUP BY city;
+------------+-----------------------------+
| city       | No of Customers from Cities |
+------------+-----------------------------+
| BRAZIL     |                           1 |
| GTA        |                           1 |
| NEW JERSEY |                           1 |
| NEW YORK   |                           2 |
| TORONTO    |                           3 |
| USA        |                           1 |
| WDC        |                           1 |
+------------+-----------------------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city, distinct(city) "No of Customers from Cities" from customer GROUP BY city;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'distinct(city) "No of Customers from Cities" from customer GROUP BY city' at line 1
MariaDB [csd2204s18]> select distinct(city) from Customer;
+------------+
| city       |
+------------+
| WDC        |
| TORONTO    |
| NEW YORK   |
| BRAZIL     |
| USA        |
| GTA        |
| NEW JERSEY |
+------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select (count(CITY)- distinct count(CITY)) from Customer; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'distinct count(CITY)) from Customer' at line 1
MariaDB [csd2204s18]> selectcity,COUNT(city) "No.of customers" from Customer having city like 'New%' OR city='Toronto';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'selectcity,COUNT(city) "No.of customers" from Customer having city like 'New%' O' at line 1
MariaDB [csd2204s18]> select city,COUNT(city) "No.of customers" from Customer having city like 'New%' OR city='Toronto';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select city,COUNT(city) "No.of customers" from Customer Group by having city like 'New%' OR city='Toronto';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'having city like 'New%' OR city='Toronto'' at line 1
MariaDB [csd2204s18]> select city,COUNT(city) "No.of customers" from Customer Group by city  having city like 'New%' OR city='Toronto';
+------------+-----------------+
| city       | No.of customers |
+------------+-----------------+
| NEW JERSEY |               1 |
| NEW YORK   |               2 |
| TORONTO    |               3 |
+------------+-----------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> select city,count(city) "No.of Customers" From Customer GROUP BY City having COUNT(city)>2; 
+---------+-----------------+
| city    | No.of Customers |
+---------+-----------------+
| TORONTO |               3 |
+---------+-----------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where name REGEXP 'n$';
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.06 sec)

MariaDB [csd2204s18]> select * from Customer where name REGEXP '^..a';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where name REGEXP '^..e';
+--------+-----------------+----------+----------+------------+------+
| custID | name            | nickname | city     | postalcode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | CHERLIES THERON | CHER     | NEW YORK | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where postalcode REGEXP '^[0-9]';
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

MariaDB [csd2204s18]> select * from Customer where postalcode REGEXP '^[A-Z]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where postalcode REGEXP '^A*';
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

MariaDB [csd2204s18]> select * from Customer where postalcode REGEXP '^A+';
Empty set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where nickname REGEXP '^A+';
+--------+---------------+----------+------+------------+------+
| custID | name          | nickname | city | postalcode | age  |
+--------+---------------+----------+------+------------+------+
| C01    | ASHLEY        | ASH      | WDC  | 321200     |   34 |
| C08    | ASHKO CHARLES | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where nickname REGEXP '^A?';
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

MariaDB [csd2204s18]> select * from Customer where city REGEXP '^.{4}';
+--------+-----------------+----------+------------+------------+------+
| custID | name            | nickname | city       | postalcode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer where city REGEXP rLIKE '^4+';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'rLIKE '^4+'' at line 1
MariaDB [csd2204s18]> select * from Customer where city REGEXP rLIKE '^[A]*';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'rLIKE '^[A]*'' at line 1
MariaDB [csd2204s18]> select * from Customer where nicknme REGEXP rLIKE '^[A]*';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'rLIKE '^[A]*'' at line 1
MariaDB [csd2204s18]> select * from Customer where nickname REGEXP rLIKE '^[A]*';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'rLIKE '^[A]*'' at line 1
MariaDB [csd2204s18]> select * from Customer where nickname REGEXP rLIKE '^[A]*';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'rLIKE '^[A]*'' at line 1
MariaDB [csd2204s18]> select * from Customer where nickname rLIKE '^[A]*';
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

MariaDB [csd2204s18]> select curdate();
+------------+
| curdate()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.03 sec)

MariaDB [csd2204s18]> select now();
+---------------------+
| now()               |
+---------------------+
| 2018-05-14 09:15:09 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> alter table customer add column dob DATE;
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custID     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| dob        | date        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from Customer;
+--------+-----------------+----------+------------+------------+------+------+
| custID | name            | nickname | city       | postalcode | age  | dob  |
+--------+-----------------+----------+------------+------------+------+------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 | NULL |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 | NULL |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 | NULL |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 | NULL |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 | NULL |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 | NULL |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 | NULL |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 | NULL |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 | NULL |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 | NULL |
+--------+-----------------+----------+------------+------------+------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> update customer set dob='1996-04-15' where custid = 'C02';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1995-01-16' where custid = 'C03';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1995-11-03' where custid = 'C04';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1995-01-16' where custid = 'C05';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1996-10-22' where custid = 'C06';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1992-11-07' where custid = 'C07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1996-05-07' where custid = 'C08';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1985-08-28' where custid = 'C09';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1995-07-17' where custid = 'C10';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> update customer set dob='1991-01-10' where custid = 'C01';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custID | name            | nickname | city       | postalcode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| C01    | ASHLEY          | ASH      | WDC        | 321200     |   34 | 1991-01-10 |
| C02    | BOB MARLEY      | BM       | TORONTO    | 100100     |   23 | 1996-04-15 |
| C03    | CHERLIES THERON | CHER     | NEW YORK   | 120134     |   20 | 1995-01-16 |
| C04    | DANIEL JACK     | DJ       | BRAZIL     | 341020     |   25 | 1995-11-03 |
| C05    | DONNA NEWMAN    | NEW      | TORONTO    | 130120     |   50 | 1995-01-16 |
| C06    | ESTON M.        | M.       | TORONTO    | 201023     |   65 | 1996-10-22 |
| C07    | BOBBY CHACKO    | CHAC     | NEW YORK   | 320300     |   70 | 1992-11-07 |
| C08    | ASHKO CHARLES   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | TONY SPECIAL    | SPECIE   | GTA        | 418321     |   62 | 1985-08-28 |
| C10    | JACK SP         | SPARROW  | NEW JERSEY | 102301     |   35 | 1995-07-17 |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name,dob ,TIMESTAMP(year,dob,CURDATE()) "age" FROM customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CURDATE()) "age" FROM customer' at line 1
MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| ASHLEY          | 1991-01-10 |   27 |
| BOB MARLEY      | 1996-04-15 |   22 |
| CHERLIES THERON | 1995-01-16 |   23 |
| DANIEL JACK     | 1995-11-03 |   22 |
| DONNA NEWMAN    | 1995-01-16 |   23 |
| ESTON M.        | 1996-10-22 |   21 |
| BOBBY CHACKO    | 1992-11-07 |   25 |
| ASHKO CHARLES   | 1996-05-07 |   22 |
| TONY SPECIAL    | 1985-08-28 |   32 |
| JACK SP         | 1995-07-17 |   22 |
+-----------------+------------+------+
10 rows in set (0.02 sec)

MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(day,dob,CURDATE()) "age" FROM customer;
+-----------------+------------+-------+
| name            | dob        | age   |
+-----------------+------------+-------+
| ASHLEY          | 1991-01-10 |  9986 |
| BOB MARLEY      | 1996-04-15 |  8064 |
| CHERLIES THERON | 1995-01-16 |  8519 |
| DANIEL JACK     | 1995-11-03 |  8228 |
| DONNA NEWMAN    | 1995-01-16 |  8519 |
| ESTON M.        | 1996-10-22 |  7874 |
| BOBBY CHACKO    | 1992-11-07 |  9319 |
| ASHKO CHARLES   | 1996-05-07 |  8042 |
| TONY SPECIAL    | 1985-08-28 | 11947 |
| JACK SP         | 1995-07-17 |  8337 |
+-----------------+------------+-------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(day,dob,CURDATE()) "age" FROM customer having age=22;
Empty set (0.00 sec)

MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer having age=22;
+---------------+------------+------+
| name          | dob        | age  |
+---------------+------------+------+
| BOB MARLEY    | 1996-04-15 |   22 |
| DANIEL JACK   | 1995-11-03 |   22 |
| ASHKO CHARLES | 1996-05-07 |   22 |
| JACK SP       | 1995-07-17 |   22 |
+---------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer where TIMESTAMPDIFF()=22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')=22' at line 1
MariaDB [csd2204s18]> select name,dob ,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer where TIMESTAMPDIFF()=22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')=22' at line 1
MariaDB [csd2204s18]> select name,dob,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer where TIMESTAMPDIFF()=22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')=22' at line 1
MariaDB [csd2204s18]> select name,dob,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer where TIMESTAMPDIFF())=22;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '))=22' at line 1
MariaDB [csd2204s18]> select name,dob,TIMESTAMPDIFF(year,dob,CURDATE()) "age" FROM customer where TIMESTAMPDIFF(year,dob,CURDATE())=22;
+---------------+------------+------+
| name          | dob        | age  |
+---------------+------------+------+
| BOB MARLEY    | 1996-04-15 |   22 |
| DANIEL JACK   | 1995-11-03 |   22 |
| ASHKO CHARLES | 1996-05-07 |   22 |
| JACK SP       | 1995-07-17 |   22 |
+---------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> COMMIT;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> EXIT;
