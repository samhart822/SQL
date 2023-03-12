/* This is a project I wrote SQL for that includes a dataset from chinook that represents a digital media store. */

/* Show Customers (their full names, customer ID, and country) who are not in the US. */
SELECT firstname, lastname, customerid, country
    FROM chinook.customers
    WHERE country <> 'USA';
    
/* Show only the Customers from Brazil. */
SELECT * 
    FROM chinook.customers
    WHERE country = 'Brazil';
    
/* Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country. */
 SELECT cust.firstname, cust.lastname, inv.invoiceid, inv.invoicedate, inv.billingcountry
     FROM chinook.invoices inv
     LEFT JOIN chinook.customers cust
     ON cust.customerid = inv.customerid
     WHERE inv.billingcountry = 'Brazil';
     
/* Show the Employees who are Sales Agents. */
SELECT * 
    FROM chinook.employees
    WHERE title LIKE '%sales % agent%';
    
/* Find a unique/distinct list of billing countries from the Invoice table. */
SELECT DISTINCT billingcountry
    FROM chinook.invoices;
    
/* Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name. */
SELECT inv.invoiceid, emp.firstname, emp.lastname
    FROM chinook.employees emp
    JOIN chinook.customers cust
    ON cust.supportrepid = emp.employeeid
    JOIN chinook.invoices inv
    ON cust.customerid = inv.customerid;
    
/* Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers. */
SELECT inv.total, cust.firstname, cust.lastname, cust.country, emp.firstname, emp.lastname
    FROM chinook.employees emp
    JOIN chinook.customers cust
    ON cust.supportrepid = emp.employeeid
    JOIN chinook.invoices inv
    ON cust.customerid = inv.customerid;
    
/* How many Invoices were there in 2009? */
SELECT COUNT(invoiceid) 
    FROM chinook.invoices
    WHERE invoicedate BETWEEN '2009-01-01' AND '2009-12-31';
    
/* What are the total sales for 2009? */
SELECT SUM(total)
    FROM chinook.invoices
    WHERE invoicedate BETWEEN '2009-01-01' AND '2009-12-31';

/* Write a query that includes the purchased track name with each invoice line ID. */
SELECT tracks.name, inv.invoicelineid
    FROM chinook.tracks
    LEFT JOIN chinook.invoice_items inv
    ON tracks.trackid = inv.trackid
    WHERE invoicelineid IS NOT NULL;
    
/* Write a query that includes the purchased track name AND artist name with each invoice line ID. */
SELECT t.name AS track, art.name AS artist, inv.invoicelineid
    FROM chinook.invoice_items inv
    LEFT JOIN chinook.tracks t
    ON inv.trackid = t.trackid
    INNER JOIN chinook.albums alb
    ON alb.albumid = t.albumid
    LEFT JOIN chinook.artists art
    ON art.artistid = alb.artistid; 
    
/* Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre. */
SELECT a.title AS album_title, t.name AS track_name, m.name AS media_type, g.name AS genre
    FROM chinook.albums a
    JOIN chinook.tracks t
    ON a.albumid = t.albumid
    JOIN chinook.genres g 
    ON g.genreid = t.genreid
    JOIN chinook.media_types m
    ON m.mediatypeid = t.mediatypeid;
    
/* Show the total sales made by each sales agent. */
SELECT SUM(inv.total) AS total_sales, emp.employeeid
    FROM chinook.employees emp
    JOIN chinook.customers cus
    ON emp.employeeid = cus.supportrepid
    JOIN chinook.invoices inv
    ON cus.customerid = inv.customerid
    WHERE emp.title LIKE '%sales%agent%'
    GROUP BY emp.employeeid;
    
/* Which sales agent made the most dollars in sales in 2009? */
SELECT ROUND(SUM(inv.total), 2) AS total_sales, emp.firstname, emp.lastname
    FROM chinook.employees emp 
    JOIN chinook.customers cus
    ON emp.employeeid = cus.supportrepid
    JOIN chinook.invoices inv
    ON cus.customerid = inv.customerid
    WHERE emp.title LIKE '%sales%agent%'
    AND inv.invoicedate LIKE '%2009%'
    GROUP BY emp.firstname
    ORDER BY ROUND(SUM(inv.total), 2) DESC
    LIMIT 1;
    
/* Which media type is the most expensive? */
SELECT DISTINCT med.name AS media_type, inv.unitprice
    FROM chinook.media_types med
    JOIN chinook.tracks t
    ON med.mediatypeid = t.mediatypeid
    JOIN chinook.invoice_items inv
    ON t.trackid = inv.trackid
    ORDER BY inv.unitprice DESC
    LIMIT 1;
    
/* How many protected MPEG-4 video files were sold? */
SELECT SUM(inv.quantity) AS quantity, med.name AS media_type
    FROM chinook.media_types med
    LEFT JOIN chinook.tracks t
    ON med.mediatypeid = t.mediatypeid
    JOIN chinook.invoice_items inv
    ON t.trackid = inv.trackid
    WHERE media_type LIKE '%MPEG-4 video file%'
    ORDER BY media_type;
