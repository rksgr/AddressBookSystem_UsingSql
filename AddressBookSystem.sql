USE CASE 1: Create a Address Book Service Database

mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| db_emp               |
| db_emp_am            |
| information_schema   |
| mysql                |
| performance_schema   |
+----------------------+
6 rows in set (0.01 sec)


USE CASE 2: Create a Address Book table with given attributes


mysql> create table address_book(first_name VARCHAR(50) NOT NULL,last_name VARCHAR(50),address VARCHAR(140) NOT NULL,
        city VARCHAR(25),state VARCHAR(35),zip int(10) NOT NULL,phone_num int(12),email VARCHAR(25));
ERROR 1046 (3D000): No database selected
mysql> use Address_Book_Service;
Database changed
mysql> select database();
+----------------------+
| database()           |
+----------------------+
| address_book_service |
+----------------------+
1 row in set (0.00 sec)

mysql> create table address_book(first_name VARCHAR(50) NOT NULL,last_name VARCHAR(50),address VARCHAR(140) NOT NULL,
        city VARCHAR(25),state VARCHAR(35),zip int(10) NOT NULL,phone_num int(12),email VARCHAR(25));
Query OK, 0 rows affected, 2 warnings (0.05 sec)


mysql> DESCRIBE address_book;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| first_name | varchar(50)  | NO   |     | NULL    |       |
| last_name  | varchar(50)  | YES  |     | NULL    |       |
| address    | varchar(140) | NO   |     | NULL    |       |
| city       | varchar(25)  | YES  |     | NULL    |       |
| state      | varchar(35)  | YES  |     | NULL    |       |
| zip        | int          | NO   |     | NULL    |       |
| phone_num  | int          | YES  |     | NULL    |       |
| email      | varchar(25)  | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.02 sec)


USE CASE 3: Insert new contacts into address_book table


mysql> INSERT into address_book(first_name,last_name,address,city,state,zip,phone_num,email)
        values("sushila","kumari","Ambedkar nagar","chhindwara","Madhya Pradesh",456238,7894561230,"sushila.kumari@gmail.com");
ERROR 1264 (22003): Out of range value for column 'phone_num' at row 1
mysql> INSERT into address_book(first_name,last_name,address,city,state,zip,phone_num,email)
        values("sushila","kumari","Ambedkar nagar","chhindwara","Madhya Pradesh",456238,789230,"sushila.kumari@gmail.com");
Query OK, 1 row affected (0.04 sec)

mysql> INSERT into address_book(first_name,last_name,address,city,state,zip,phone_num,email)
        values("Lila","Kumari","Ambedkar nagar","chhindwara","Madhya Pradesh",456238,7892321,"lila.kumari@gmail.com");
Query OK, 1 row affected (0.01 sec)

mysql> INSERT into address_book(first_name,last_name,address,city,state,zip,phone_num,email)
        values("munni","devi","Ambedkar nagar","chhindwara","Madhya Pradesh",456238,78923232,"munni.devi@gmail.com");
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * from address_book;
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                    |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |    789230 | sushila.kumari@gmail.com |
| Lila       | Kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |   7892321 | lila.kumari@gmail.com    |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com     |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
3 rows in set (0.01 sec)


USE CASE 4: Edit existing contact person using their first_name


mysql> UPDATE address_book set phone_num=78945631 WHERE first_name="sushila";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * from address_book;
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                    |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com |
| Lila       | Kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |   7892321 | lila.kumari@gmail.com    |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com     |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
3 rows in set (0.00 sec)


USE CASE 5: Delete a person using person name


mysql> DELETE from address_book WHERE first_name="Lila" and last_name="kumari";
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * from address_book;
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                    |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com     |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
2 rows in set (0.04 sec)


USE CASE 6: Retrieve person belonging to a city or state from the address book;



mysql> SELECT * from address_book;
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                     |
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com  |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com      |
| Amitabh    | Bachhan   | zuhu           | Mumbai     | Maharashtra    | 223322 |  12345678 | amitabh.bachhan@gmail.com |
| Anil       | Ambani    | andheri        | Mumbai     | Maharashtra    | 223320 |  12345656 | anil.ambani@gmail.com     |
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE city="Mumbai";
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
| first_name | last_name | address | city   | state       | zip    | phone_num | email                     |
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
| Amitabh    | Bachhan   | zuhu    | Mumbai | Maharashtra | 223322 |  12345678 | amitabh.bachhan@gmail.com |
| Anil       | Ambani    | andheri | Mumbai | Maharashtra | 223320 |  12345656 | anil.ambani@gmail.com     |
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE state="Madhya Pradesh";
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                    |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com     |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
2 rows in set (0.00 sec)


USE CASE 7: Understand the size of address book by city and state


mysql> SELECT COUNT(*) FROM address_book WHERE city="bhopal";
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE city="chhindwara";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE state="Madhya Pradesh";
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE state="Maharashtra";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)


USE CASE 8: Retrieve entries sorted alphabetically by person name for a given city


mysql> SELECT * FROM address_book WHERE city="Mumbai" ORDER BY first_name;
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
| first_name | last_name | address | city   | state       | zip    | phone_num | email                     |
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
| Amitabh    | Bachhan   | zuhu    | Mumbai | Maharashtra | 223322 |  12345678 | amitabh.bachhan@gmail.com |
| Anil       | Ambani    | andheri | Mumbai | Maharashtra | 223320 |  12345656 | anil.ambani@gmail.com     |
+------------+-----------+---------+--------+-------------+--------+-----------+---------------------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE city="chhindwara" ORDER BY first_name;
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                    |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com     |
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com |
+------------+-----------+----------------+------------+----------------+--------+-----------+--------------------------+
2 rows in set (0.00 sec)


USE CASE 9: Identify each address book with name and type
            -- Alter address book to add name and type

mysql> ALTER table  address_book ADD name VARCHAR(37) NOT NULL;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC address_book;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| first_name | varchar(50)  | NO   |     | NULL    |       |
| last_name  | varchar(50)  | YES  |     | NULL    |       |
| address    | varchar(140) | NO   |     | NULL    |       |
| city       | varchar(25)  | YES  |     | NULL    |       |
| state      | varchar(35)  | YES  |     | NULL    |       |
| zip        | int          | NO   |     | NULL    |       |
| phone_num  | int          | YES  |     | NULL    |       |
| email      | varchar(25)  | YES  |     | NULL    |       |
| name       | varchar(37)  | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> ALTER TABLE address_book ADD type VARCHAR(37) NOT NULL;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC address_book;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| first_name | varchar(50)  | NO   |     | NULL    |       |
| last_name  | varchar(50)  | YES  |     | NULL    |       |
| address    | varchar(140) | NO   |     | NULL    |       |
| city       | varchar(25)  | YES  |     | NULL    |       |
| state      | varchar(35)  | YES  |     | NULL    |       |
| zip        | int          | NO   |     | NULL    |       |
| phone_num  | int          | YES  |     | NULL    |       |
| email      | varchar(25)  | YES  |     | NULL    |       |
| name       | varchar(37)  | NO   |     | NULL    |       |
| type       | varchar(37)  | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)


Use Case 10: Get number of contact persons ie. count by type


mysql> SELECT * from address_book;
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+------+------------+
| first_name | last_name | address        | city       | state          | zip    | phone_num | email                     | name | type       |
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+------+------------+
| sushila    | kumari    | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78945631 | sushila.kumari@gmail.com  |      | staff      |
| munni      | devi      | Ambedkar nagar | chhindwara | Madhya Pradesh | 456238 |  78923232 | munni.devi@gmail.com      |      | staff      |
| Amitabh    | Bachhan   | zuhu           | Mumbai     | Maharashtra    | 223322 |  12345678 | amitabh.bachhan@gmail.com |      | profession |
| Anil       | Ambani    | andheri        | Mumbai     | Maharashtra    | 223320 |  12345656 | anil.ambani@gmail.com     |      | profession |
| shivraj    | singh     | shyamla hills  | bhopal     | Madhya Pradesh | 489569 |  78998745 | shivraj.singh@gmail.com   |      |            |
+------------+-----------+----------------+------------+----------------+--------+-----------+---------------------------+------+------------+
5 rows in set (0.01 sec)

mysql> SELECT COUNT(*) from address_book WHERE type="profession";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(*) FROM address_book WHERE type="staff";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)


USE CASE 11: Add person to both friend and family



