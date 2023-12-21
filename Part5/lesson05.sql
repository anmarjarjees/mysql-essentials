-- Here is the total value for invoice number 2.
-- table "invoice"
SELECT * FROM invoice WHERE InvoiceId = 2;

SELECT * FROM invoiceline WHERE InvoiceId = 2;
-- We changed the quantity column values for invioce#2
-- Using the GUI result (output)
-- Click "Apply" button

/*
Table: Invoiceline => the invoice details
- TrackId => FK

Table: Track =>
- TrackId => PK
*/

/*
SELECT name, unitprice FROM track
JOIN invoiceline
ON track.TrackId = invoiceline.TrackId;

Error Code: 1052. 
Column 'unitprice' in field list is ambiguous
*/

SELECT invoiceline.trackid, name, invoiceline.unitprice, Quantity FROM track
JOIN invoiceline
ON track.TrackId = invoiceline.TrackId
WHERE InvoiceId = 2;

/*
 taking the line items from that invoice, 
 multiplying the price by quantity to get the total for each line item. 
 Then we use the sum function to get the total for the invoice.
*/

SELECT SUM(unitprice * quantity) FROM invoiceline where InvoiceId=2;

/*
Task:
Modify the command below:
SELECT invoiceline.trackid, name, invoiceline.unitprice, Quantity FROM track
JOIN invoiceline
ON track.TrackId = invoiceline.TrackId
WHERE InvoiceId = 2;

to also display the customer name of that invoice details

- Table: invoiceline
- Table: track

to get the cutsomer name:
- table "customer" is NOT linked to "invoiceline" 
- Table "customer" linked to table "invoice" => customerid
- Table "invoice" linked to table "invoiceline" => invoiceid
- MEAN => MongoDB, ExpressJS, AngularJS, NodeJS
*/


SELECT AlbumId, COUNT(*) FROM Track
GROUP BY AlbumId;

SELECT Album.Title, COUNT(*) AS total FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId ORDER BY total DESC;


SELECT Album.Title, ROUND(SUM(UnitPrice), 2) FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
GROUP BY Track.AlbumId;

/*
You'll need to find how many sales (Quantity) there are for each track 
in the InvoiceLine table,
 
multiply by the Unit Price, 
join to the Track table to bring in the Track Name, 
and filter to find the details for "The Woman King"
*/

SELECT SUM(invoiceline.unitprice * invoiceline.Quantity), track.name FROM invoiceline 
JOIN track
ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";