/* Create a grocery store database. */

CREATE TABLE store (id INTEGER PRIMARY KEY, item TEXT, size TEXT, price INTEGER, color TEXT, quantity INTEGER);
INSERT INTO store VALUES (1, "t-shirt", "small", 5, "red", 10);
INSERT INTO store VALUES (2, "t-shirt", "medium", 5, "red", 8);
INSERT INTO store VALUES (3, "t-shirt", "large", 5, "red", 9);
INSERT INTO store VALUES (4, "crew neck", "small", 10, "blue", 4);
INSERT INTO store VALUES (5, "crew neck", "medium", 10, "blue", 6);
INSERT INTO store VALUES (6, "crew neck", "large", 10, "blue", 3);
INSERT INTO store VALUES (7, "hoodie", "small", 13, "green", 5);
INSERT INTO store VALUES (8, "hoodie", "medium", 13, "green", 9);
INSERT INTO store VALUES (9, "hoodie", "large", 13, "green", 13);
INSERT INTO store VALUES (10, "shorts", "small", 10, "grey", 7);
INSERT INTO store VALUES (11, "shorts", "medium", 10, "grey", 9);
INSERT INTO store VALUES (12, "shorts", "large", 10, "grey", 14);
INSERT INTO store VALUES (13, "pants", "small", 8, "black", 5);
INSERT INTO store VALUES (14, "pants", "medium", 8, "black", 11);
INSERT INTO store VALUES (15, "pants", "large", 8, "black", 3);

/* Order items from least to most expensive. */
SELECT * FROM store ORDER BY price ASC;

/* How much is the most expensive item? */
SELECT MAX(price) as most_dollars_paid FROM store;

/* What is the average price of items in the store? */
SELECT AVG(price) FROM store;

/* How much would it cost to by every item in the store? */
SELECT SUM(price) AS total_dollars_paid FROM store;

/* How many items cost more than five dollars? */ 
SELECT COUNT(*) AS greater_than_5dollars FROM store WHERE price > 5;

/* How many color options are there? */
SELECT COUNT(DISTINCT color) AS color_options FROM store;
