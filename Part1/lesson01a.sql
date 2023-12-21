-- To Display (SELECT) all users:
# another comments
SELECT user from mysql.user;
/* 
Output:
mysql.infoschema
mysql.session
mysql.sys
root
*/

-- Show databases inside MySQL:
SHOW DATABASES;
-- Create a Database:
-- Optional: IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS music_library;

--  Create a Database:
CREATE DATABASE story_club;


-- DROP DATABASE:
-- Optional: IF EXISTS
-- DROP DATABASE IF EXISTS story_club;
# DROP DATABASE story_list

-- Use a database (call a database):
USE story_club; 

-- Create a table named authors
-- We can specify the database name "story_club":
CREATE TABLE story_club.authors (
	author_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- Integer value with auto-increment 
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(70) UNIQUE, 
    password VARCHAR(100), -- In case you encrypted by MySQL => it needs more characters
    phone VARCHAR(20), -- should use text value (no calculation and can have 0 at the left)
    is_admin TINYINT DEFAULT 0, 
    city VARCHAR(30),  
    province VARCHAR(30) DEFAULT "ON",
    join_date DATETIME
    -- Adding the constraint for the primary key at the bottom (another way):
    -- PRIMARY KEY(author_id) 
);

-- NOTE: is_admin TINYINT(1) DEFAULT 0,
-- Warning: #1681 Integer display width is deprecated and will be removed in a future release.

-- NOTE: author_id INT(12) PRIMARY KEY NOT NULL AUTO_INCREMENT
-- Warning: #1681 Integer display width is deprecated and will be removed in a future release.

/* 
0 row(s) affected, 2 warning(s): 1681 Integer display width is deprecated and will be removed in a future release. 1681 Integer display width is deprecated and will be removed in a future release.
*/

-- Drop table:
-- DROP TABLE table_name
DROP TABLE authors

-- UPDATE:
--------------------------------------
-- We should use id with DELETE/UPDATE

UPDATE authors SET email="saragrayson@storyclub.ca"
/* 
Error Code: 1175. 
You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
*/

UPDATE authors SET email="saragrayson@storyclub.ca" WHERE first_name="Sara" AND last_name="GRAYSON";

UPDATE authors SET email="saragrayson@storyclub.ca" WHERE author_id=;


-- Update Table Examples:
-- 1. Change Field Name (Rename it):
ALTER TABLE authors 
RENAME COLUMN label TO title;

-- 2. Add a new field:
ALTER TABLE authors ADD hobby VARCHAR(3);
-- if the table has some records, the value will be null for hobby


-- INSERT INTO table_name
-- Insert Row / Record
-- Notice that we skip the id as it's an auto increment:
-- using now() function to enter the current date time
-- Refer to my pdf file for more examples:
INSERT INTO authors 
(first_name, last_name, email, password, phone, is_admin, city, join_date) 
VALUES 
('Alex', 'Chow', 'alexchow@storyclub.ca','ac1234','4161231234',1,'Toronto',now());

-- Adding multiple values:
-- skipping is_admin field as it has a default value:
INSERT INTO authors 

(first_name, last_name, email, password, phone, city, join_date) 
values 
('Sam', 'Simpson', 'samsimpson@storyclub.ca','ac1234','4161231234','Toronto',now()),
('Martin', 'Smith', 'alexchow@storyclub.ca','ms1234','4161231235','Scarborough',now()),
('Sara', 'Grays', 'saragrayson@ggmmaaiill.ca','sg1234','4161231236','Mississauga',now()),
('Kate', 'Wilson', 'katewilson@storyclub.ca','kw1234','4161231237','Brampton',now()),
('Susan', 'Clark', 'susanclarck@storyclub.ca','sw1234','4161231238','Toronto',now());

-- SELECT Statement:
SELECT * FROM authors;


-- Show tables inside a database:
SHOW TABLES

-- ALTER => Change the table structure (modify the table columns)
-- UPDATE => Change the table contents (modify the data inside the table)
UPDATE authors
SET email='martinsmith@storyclub.ca'
WHERE author_id = 2;

/*
ALTER TABLE highend_college.persons 
CHANGE RENAME id TO personID;

RENAME COLUMN is more convenient to change the name 
without changing the definition 
because it requires only the old and new names:

ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
*/
-- ALTER A table by changing the column name:
ALTER TABLE authors 
RENAME COLUMN cell TO phone;

/*
ALTER TABLE t1 CHANGE b b INT NOT NULL;
Link: https://dev.mysql.com/doc/refman/8.0/en/alter-table.html
*/


-- WHERE clause:
-- = , > , < , >= , <= , <>
SELECT * FROM authors WHERE city="Toronto" AND first_name='alex';

SELECT * FROM authors WHERE is_admin=1;

SELECT * FROM authors WHERE is_admin<>1;

SELECT * FROM authors WHERE city="TORONTO" AND is_admin<>0;


-- SORTING:
-- ASC (Default)
-- DESC
SELECT * FROM authors ORDER BY first_name;

SELECT * FROM authors ORDER BY first_name DESC;

# SELECT CONCAT('My', 'S', 'QL',' ','PHP'); 
-- Concatenating Columns when displaying them:
-- first_name and last_name as "Full Name"
SELECT CONCAT(first_name,' ',last_name) AS 'FULL NAME', email FROM authors

-- SQL SELECT DISTINCT Statement
-- The SELECT DISTINCT statement is used to return only distinct (different) values
-- Link: https://www.w3schools.com/sql/sql_distinct.asp
-- Example, to get the authors' city list (without duplicated/repeated values)
SELECT city FROM authors;
SELECT DISTINCT city FROM authors;

-- SELECT with BETWEEN EXAMPLES
SELECT * FROM products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM exams
WHERE exam BETWEEN 50 AND 100;

-- OR:
SELECT * FROM exams WHERE exam >= 50;

-- BETWEEN Dates Example
-- Between '01-July-1996' and '31-July-1996':
-- Link: https://www.w3schools.com/mysql/mysql_between.asp
-- Example from W3school:
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';


SELECT * FROM authors
WHERE join_date BETWEEN '2020-01-01' AND '2022-12-31';

-- LIKE:
--  Select all the authors whose first name starts with "s"
SELECT * FROM authors WHERE first_name LIKE 's%';

--  Select all the authors whose first name starts with "sa" => sally, sam, ...
SELECT * FROM authors WHERE first_name LIKE 'sa%';;

--  Select all the authors whose last name ends with "on" => simpson, jackson, ...
SELECT * FROM authors WHERE last_name LIKE '%on';

--  Select all the authors whose last name has this text "on" anywhere => sara, arnold,...
SELECT * FROM authors WHERE last_name LIKE '%ar%';

--  Select all the authors whose last name doesn't have this text "on" anywhere => sara, arnold,...
SELECT * FROM authors WHERE last_name NOT LIKE '%ar%';

-- Instead of using:
SELECT * FROM authors WHERE city='TORONTO' OR city='Brampton';

-- OR: Using IN() function to list a list of values!
SELECT * FROM authors WHERE city IN('TORONTO','Brampton');


-- Working with INDEX
-- INDEX => Used to create and retrieve data from the database very quickly
-- Adding INDEX for any field that is frequently used in searching to speed up the process:
-- Indexes are used to retrieve data from the database more quickly than otherwise. 
-- The users cannot see the indexes, they are just used to speed up searches/queries.
-- Link: https://www.w3schools.com/mysql/mysql_create_index.asp
/* 
CREATE INDEX index_name
ON table_name (column1, column2, ...);
 */
CREATE INDEX city_idx on authors(city);

/* 
DROP INDEX Statement
The DROP INDEX statement is used to delete an index in a table.

ALTER TABLE table_name
DROP INDEX index_name;

Link: https://www.techonthenet.com/mysql/indexes.php
*/
DROP INDEX city_idx ON authors;


-- DELETE a record
-- Using WHERE with DELETE and UPDATE
DELETE FROM authors WHERE author_id = 6;