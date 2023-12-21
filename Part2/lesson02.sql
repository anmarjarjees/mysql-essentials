-- Aggregate Functions
-- Link: https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html
-- Link: https://www.w3schools.com/sql/sql_count_avg_sum.asp

-- Count how many authors
SELECT COUNT(author_id) FROM authors;

-- OR:
SELECT COUNT(*) FROM authors;

-- COUNT() with WHERE:
SELECT city, COUNT(city) FROM authors WHERE city = 'toronto' 

-- Using AS for a column title:
SELECT city, COUNT(city) AS Total FROM authors WHERE city = 'toronto';

-- Select the maximum:
SELECT MAX(rate) FROM comments;

-- Select the minimum:
SELECT MIN(rate) FROM comments;

-- Select the sum
SELECT SUM(rate) FROM comments;

-- Upper Case:
SELECT UCASE(first_name), UCASE(last_name), LCASE(city) FROM authors;

-- GROUP BY
-- Based on City => How many authors we have from every city:
SELECT city, COUNT(city) FROM authors GROUP BY city;

-- How many stories have 5 points rate:
-- SELECT title, COUNT(title) FROM ...

