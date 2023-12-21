# Installing MySQL
Refer to one my PDF files in the course contents for downloading and installing:
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
