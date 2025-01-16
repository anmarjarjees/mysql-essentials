# MySQL Essentials
Working with MySQL Server SQL (Structured Query Language)

# Installing MySQL
Refer to my PDF files in the course contents for downloading and installing:
- MySQL Workbench for Flask/Django Python development course or MySQL Relational DBMS course
- XAMPP installation and PhpMyAdmin setup for PHP development course

# To Access MySQL using CMD:
Check if MySQL is installed with its version. Going to the destination folder based on the list above.

For PHP developer => Run xampp then apache and mysql 

Open the cmd within mysql folder:
- For xampp (PHP developer)=> C:\xampp\mysql\bin
- For MySQL Server:
    - Windows => C:\Program files\MySQL\MySQL Server X.X\bin
        - [C:\Program Files\MySQL\MySQL Server 8.0\bin]
    - Mac => usr\local\mysql\bin

## Inside the bin folder:
You can type this command to check the version first: 
> mysql --version

Then type: 
> mysql -u root -p press enter key
- u for username
- p for password
With any command if you don't write ; at the end it will continue 

## Anywhere
To run mysql command anywhere, you need to add it to the path. You can copy the folder location for example:
    - C:\Program Files\MySQL\MySQL Server 8.0\bin
and add it to the path environment variable. You can follow the same steps as written in my PDF file


The commands:
\ show databases;

\exit; => exit the MySql shell
 
# MySQL Workbench 
 - Using database which also called "schema". 
 - Databases are displayed under the label "Schemas".
 - Set the default schema (database) to be used by default:
    - Right Click => Select "Set as Default Schema"

# MysQL PhpMyAdmin
- Using the XAMPP control panel to run both Apache and MySQL services
- Click the "Admin" button in the control panel or "PhpMyAdmin" in localhost/dashboard url
#### NOTE: more details you will find in the course PDF files

# MySQL Commands
Check the PDF files about MySQl CLI commands.

## Modifying Table Structure:
We can use the command "ALTER TABLE" to do many things regarding the table structure but NOT the data inside our table

---
---
# References, Resources, and Credits:
- MySQL 8.4 Reference Manual:
    https://dev.mysql.com/doc/refman/8.4/en/
- MySQL Tutorial:
    https://dev.mysql.com/doc/refman/8.4/en/tutorial.html
- MySQL source code documentation:
    https://dev.mysql.com/doc/dev/mysql-server/9.1.0/
- W3Schools:
    https://www.w3schools.com/MySQL/default.asp
- TutorialsPoints:
    https://www.tutorialspoint.com/mysql/index.htm
- SQLServerCentral:
    https://www.sqlservercentral.com/
- Khan Academy:
    https://www.khanacademy.org/computing/computer-programming/sql
- Udemy Free MySQL Courses (Filter by Free):
    https://www.udemy.com/courses/search/?lang=en&price=price-free&q=MySQL&sort=relevance&src=ukw
- Codecademy - Learn SQL:
    https://www.codecademy.com/learn/learn-sql
- SQL and Databases - A Full Course for Beginners By Quincy Larson:
    https://www.freecodecamp.org/news/sql-and-databases-full-course/
- Stack Overflow Forms and Discussions:
    https://stackoverflow.com/