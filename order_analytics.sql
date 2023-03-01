/* In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customer and order data. */

/* Seeing what columns we have in the tables. */
SELECT * FROM BIT_DB.JanSales
    LIMIT 20;
SELECT * FROM BIT_DB.customers
    LIMIT 20;   

/* Checking for messy data */  
SELECT * FROM BIT_DB.customers;

/* There is quite a bit of messy data, so I'm making note
that whenever I want to use order_id, I'll need to tell SQL 
to display results that have real order IDs only. Use this 
at the end of any queries where you use order_id:
    WHERE length(order_id) = 6
    AND order_id <> 'Order ID'  */
    
/* How many orders were placed in January? */
SELECT * FROM BIT_DB.JanSales
    LIMIT 5;
SELECT COUNT(orderID)
    FROM BIT_DB.JanSales
    WHERE length (orderID) = 6
    AND orderID <> ' ';
    
/* How many of those orders were for an iPhone? */
SELECT COUNT(orderid)
    FROM BIT_DB.JanSales
    WHERE product = 'iPhone'
    AND length (orderID) = 6
    AND orderID <> ' ';
    
/* Select the customer account numbers for all the orders that were placed in February. */
SELECT DISTINCT customers.acctnum
    FROM BIT_DB.customers 
    INNER JOIN BIT_DB.FebSales 
    ON customers.order_id = FebSales.orderID
    WHERE length (orderID) = 6
    AND orderID <> ' ';
        
/* Which product was the cheapest one sold in January, and what was the price? */
SELECT DISTINCT price, product
    FROM BIT_DB.JanSales
    ORDER BY price ASC
    LIMIT 1;
    
/* What is the total revenue for each product sold in January? 
(Revenue can be calculated using the number of products sold and the price of the products). */
SELECT SUM(quantity) * price as revenue, product
    FROM BIT_DB.JanSales
    GROUP BY product;
    
/* Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, 
how many of each were sold, and what was the total revenue? */
SELECT product, SUM(quantity), SUM(quantity) * price AS Revenue
    FROM BIT_DB.FebSales
    WHERE location = '548 Lincoln St, Seattle, WA 98101';
    
/* How many customers ordered more than 2 products at a time in February, and what was the 
average amount spent for those customers? */
SELECT COUNT(DISTINCT cust.acctnum) as customers, AVG(quantity * price) as avg_amt_spent
FROM BIT_DB.FebSales Feb
    LEFT JOIN BIT_DB.customers cust
    ON Feb.orderID = cust.order_id
    WHERE Feb.quantity > 2
    AND length (orderID) = 6
    AND orderID <> ' ';
    
/* List all the products sold in LA in February, and include how many of each were sold. */
SELECT * FROM BIT_DB.FebSales
    LIMIT 5;
SELECT product, SUM(quantity)
    FROM BIT_DB.FebSales 
    WHERE location LIKE '%Los Angeles%'
    GROUP BY product;
