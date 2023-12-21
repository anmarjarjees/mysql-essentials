/* 
Link: https://www.diffen.com/difference/Inner_Join_vs_Outer_Join
*/
/* 
Select all of the data for every `Track` record across 
both the `Track` and `Album` tables
*/
select * from track 
INNER JOIN album 
ON track.albumId=album.AlbumId;

/*
Select the Track's Name, the Album's Title and the Artist's ArtistId 
for every `Track` record across both 
the `Track` and `Album` tables
*/
select Name, Title, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Use MySQL's aliases to display friendlier column names
*/
select Name as Track, Title as Album, ArtistId from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId;

/*
Instead of just getting the Artist's Id, 
we'll do an additional join
to get the Artist's name from the `Artist` table

Album Table (PK: albumId) (FK:artistId) :
- *title => for the album => Ex: Golden Hits
Artist table (Pk: artistId):
- *name => for the artist => Ex: ABBA
Track table (pk: trackId) (FK: albumId)
- *name => for the track => Ex: The winner takes it all

We need:
- The track name
- the title
- the artist Id
- the artist name
Tables: Track, Album, Artist
*/
SELECT * FROM track 
INNER JOIN album on track.AlbumId= album.AlbumId
INNER JOIN artist on artist.artistId = album.ArtistId;

-- Customize the query for displaying these fields only:
-- Album name, Composer, title, Artist name

SELECT 
artist.name as 'Artist Name', 
composer, title, track.name 
as Album_Name  
FROM track 
INNER JOIN album on track.AlbumId= album.AlbumId
INNER JOIN artist on artist.artistId = album.ArtistId 
order by artist.name;
/* 
if we don't add artist.name and track.name, just using name:
-- Error Code: 1052. Column 'name' in field list is ambiguous
*/

SELECT 
artist.name as 'Artist Name', 
composer, title, track.name 
as Album_Name  
FROM track 
INNER JOIN album on track.AlbumId= album.AlbumId
INNER JOIN artist on artist.artistId = album.ArtistId 
WHERE Artist.Name = "U2";

/*
Show all of 
- the Track names, 
- album titles 
- and artist name 
where the artist's name
is "U2" and the name of the track is "PrIde (In The Name Of Love)"
*/
SELECT 
artist.name as 'Artist Name', 
composer, title, track.name 
as Album_Name  
FROM track 
INNER JOIN album ON track.AlbumId= album.AlbumId
INNER JOIN artist ON artist.artistId = album.ArtistId 
WHERE Artist.Name = "U2" AND Track.Name = "PrIde (In The Name Of Love)";

/*
Order all of the `Album` records by the `ArtistId` field in 
ascending order, and within that, order by `Title`
*/
SELECT title, artistId FROM Album ORDER BY ArtistId, Title;

/*
Select the `InvoiceDate`, `BillingCity`, and `Total` from the `Invoice` table.
Order them descendingly by the total and limit the results to 5
*/

-- check:
-- SELECT * from invoice;
SELECT InvoiceDate, BillingCity, Total FROM Invoice
ORDER BY Total DESC
LIMIT 5;

/*
Create a query that shows our 10 biggest invoices by Total value, 
in descending order.
If two invoices have the same Total, the more recent should appear first.
The query should also show the Name of the Customer (one full name column)

Customer table <=> Invoice table (key: customerId)
*/
-- x INNER JOIN y or y INNER JOIN x
-- x=y or y=x
SELECT concat(firstname," ",lastname) AS 'Full Name', invoicedate AS Date, total FROM invoice INNER JOIN customer
ON customer.customerId = invoice.CustomerId 
ORDER BY total DESC
Limit 10;









