USE chinook;

/* 
How Many Customers is Jane Peacock the Sales Support Agent For?
You'll need to join the Employee and Customer Tables for this one.
*/

-- Check the record for Jane Peacock
SELECT * FROM employee WHERE Employee.FirstName='Jane' AND Employee.LastName='Peacock';
/*
Employee Table
EmployeeID => PK (no FK)
*/

-- Check the columns for customers
SELECT * FROM customer;
/*
Customer Table
CustomerID => PK 
SupportRepId => FK (to connect this table with the employee table)
*/


SELECT CONCAT (Employee.FirstName," ",Employee.LastName) AS 'Employee' , COUNT(customer.firstname) AS 'Customer#'
FROM employee JOIN customer
ON employee.EmployeeId = customer.SupportRepId 
WHERE Employee.FirstName='Jane' AND Employee.LastName='Peacock';
/*
OUTPUT:
Jane Peacock => 21
*/


/*
What is the date of birth of our oldest employee?
*/
-- one idea:
SELECT firstname, BirthDate FROM employee ORDER BY BirthDate LIMIT 1;

-- min() 
SELECT MIN(BirthDate) AS 'Oldest Employee' FROM employee; 

SELECT MIN(LastName) FROM Customer;

/*
On what date was our most recent employee hired?
*/
SELECT MAX(HireDate) FROM employee;

/*
The average of the total for all the invoices:
*/
SELECT AVG(Total) FROM Invoice;
-- OUTPUT: 5.651942

/*
The Round function.
Get the average of the total column in the invoice table.
And round the result to two decimal places.
The result is 5.65.

ROUND(column, precision) or ROUND(expression, precision)

In Py: 
int(input("Enter your number"))

In JS:
parseInt(prompt("Enter your number"))
*/
SELECT ROUND(AVG(Total),2) FROM Invoice; -- 5.65