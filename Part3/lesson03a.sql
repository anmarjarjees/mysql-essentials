select * from Album limit 5;

select * from Artist limit 5;

SELECT title, name FROM album
JOIN artist ON Album.ArtistId = Artist.ArtistId GROUP BY name;

/* Execute an insert, id is auto increment: Genre */
insert into Genre (Name) values ('Trad');

/* 
Show the id of the last insert performed (last inserted row) 
LAST_INSERT_ID() function
*/
SELECT LAST_INSERT_ID();

/* Filter data using `where` */
select * from Genre where GenreId = 26;

/* Update a record: change name from ‘Trad’ to ‘Traditional’ */
update Genre set Name = 'Traditional' where Name = 'Trad';

SELECT * FROM Genre WHERE name ='trad';

/* the id=26 for 'Trad' */
update Genre set Name = 'Traditional' where genreid = 26;

SELECT * FROM Genre WHERE name ='trad';

/* Execute a delete query */
delete from Genre where Name = 'Traditional'; 

/*
Error Code: 1175. 
You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
*/
delete from Genre where genreid = 26;

Select * from track;


-- UPDATE track SET composer = 'ABC' WHERE name = 'Balls to the wall';
UPDATE track SET composer = 'ABC' WHERE trackid='2';

Select * from track where composer ='ac/dc';

/*
Order all of the `Album` records by the `Title` field in
descending order
*/
SELECT * FROM Album ORDER BY Title DESC;
