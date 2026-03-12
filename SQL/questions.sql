
      --                                    question  answer                                      --

-- 1) What is SELECT in SQL
-- in sql the SELECT statement is used to fetch or retrieve data from a database

-- 2)difference between SELECT* and SELECT column
-- in SELECT* is a wildcard that tells SQL to fetch every single column from the table. SELECT	column list only the columns you need

-- 3)why FROM is mandatory
-- because SQL needs to know where the data comes from.

--  4) What is column alias?
-- A column alias is a temporary name you give to a column (or expression) in a query result to make it clearer, shorter, or usable later.

-- 5)Difference between alias and actual column name
-- Actual column names define stored data; aliases are temporary labels for query output.

-- 6)Why comments are important in SQL?
-- Comments make SQL easier to understand, maintain, and safely modify.


use flipkart;
  -- 7)select only employee names
SELECT name from customers;

-- 8)select employee name  and city
SELECT name, address from customers;

-- 9) rename salary column as monthly_income


-- 10) fetch department details only
SELECT department from employees;

--  11)	Create  dashboard-friendly SELECT query


                                                          --   mini    project-1    --


create database flipkart1;
use flipkart1;
create table employees1(
	employee_id  int primary key auto_increment,
    name varchar(50) not null,
    salary numeric(10,2)
);

alter table employees1
add position  varchar(50);
alter table employees1
add department  varchar(50);

insert into employees1 (name,salary,position,department)values
		('ravi',600000,'data analyst','it'),
        ('virat',70000,'data scientist','cse'),
        ('mahi',80000,'mis executive','msc');
  
  --   12)display full employee data --
  select * from employees1;
  
  
  -- 13) show only name& salary --
  select  name,salary from employees1;
  
  --  14) rename columns for excel report --
  Select name as "employee name" from employees1;
   
   -- 15)      add meaningful comments ---
   
   
   -- 16)      save queries for reuse ----

                                                             -- question  answers  --

  --   17)What is LIKE operator?
  --   Like operator is used to search for pattern in column 
  
  --   18)Difference between % and _
  --    % =  Matches zero, one, or many characters
  --  LIKE 'A%'     -- starts with A
  -- LIKE '%A%'    -- contains A anywhere
  -- lIKE '%'      -- matches everything 
  
  --    _= Matches exactly one character
  -- LIKE 'A_'     -- A + exactly 1 character
  -- LIKE 'A__'    -- A + exactly 2 characters
  -- LIKE '_A_'    -- A in the middle, total length = 3
  
  
   -- 19) Is BETWEEN inclusive or exclusive?
   -- BETWEEN is inclusive — it includes both the lower and upper bounds
   
   -- 20)Difference between IN and OR
   --  In - checks multiple  conditions at same time
   --  OR - check one condition at a time 
   -- 21)When to use LIKE vs =
   --  = checks if the value is exactly the same.
   -- like - for pattern matching
   
   -- 22)Can BETWEEN be used with dates?
   -- yes— BETWEEN can be used with dates
   
     --           mini project 2     ---
     
     
     
	use  flipkart;
    -- 23) Find customers whose name starts with ‘R’
    select * from customers 
    where name like "R%";
--    24) Fetch products priced between 5000–20000
   select * from products
   where price between 5000 and 20000;
--     25) find orders paid using UPI or COD
select * from orders
where payment_method in ("UPI","COD");

--     26) find deliveries handled by Ekart
select * from deliveries
where delivery_partner like "Ekart";

--     27)Find products with word ‘Shirt’
select * from products
where product_name like "shirt";

-- 28) Find customers using gmail
SELECT * FROM customers
WHERE email LIKE '%@gmail.com';




                                            --      mini project 3 --
-- 29)Search customers by name pattern
select * from customers
where name like "A%";

-- 30)Filter products by price range
select * from products
where price between 15000 and 25000;

--  31)Filter orders by payment method
SELECT * FROM orders
WHERE payment_method = 'COD';

-- 32).identify fast deliveries
select * from deliveries
where delivery_days between 1 and 3;

-- 28.combine multiple filters in one query
SELECT * FROM orders
WHERE order_status="delivered" and payment_method in ("UPI");

-- 29).what does DISTINCT do?
 -- DISTINCT is used to remove duplicate values and show unique data only.

 -- 30).Default sorting order in sql
 -- Ascending

 -- 31) why ORDER BY is slow sometimes?
  -- ORDER BY is slow sometimes because it needs to sort a large amount of data, which takes more time, especially when there is no index.

   -- 32).Can LIMIT be used without ORDER BY?
   -- Yes

  -- 33)Difference between ACS and DESC
   -- ASC sorts data in ascending order (small to big).
 -- DESC sorts data in descending order (big to small).

-- 34)show unique payment method 
SELECT DISTINCT payment_method FROM orders;

-- 35)show unique product categories
select distinct category from products;

-- 36) show top 5 expensive products
SELECT * FROM products
ORDER BY price DESC LIMIT 5;

-- 37) show latest 3 orders
SELECT * FROM orders
ORDER BY order_date DESC LIMIT 3;

-- 38)sort sellers by rating
SELECT * FROM reviews
ORDER BY rating DESC;

-- 39)show cheapest 5 product
SELECT * FROM products
ORDER BY price ASC LIMIT 5;


                                        --  mini project-4  --
-- 40)top 5 expensive products
SELECT * FROM products
ORDER BY price DESC LIMIT 5;

-- 41) cheapest product list
SELECT * FROM products
ORDER BY price ASC;

-- 42)unique categories list
select distinct category from products;

-- 43) latest orders snapshot
SELECT * FROM orders
ORDER BY order_date DESC;

-- 44) best rated sellers
SELECT * FROM reviews
ORDER BY rating DESC;



-- 45) What is GROUP BY?
-- used to group rows that have the same values in one or more columns

-- 46) Why HAVING is required?
-- HAVING is required because it is used to filter grouped data, especially when we use aggregate functions.

-- 47) Difference between WHERE and HAVING
-- WHERE is used to filter rows before grouping.
-- HAVING is used to filter data after GROUP BY.

-- 48)SQL execution order
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

-- 49)Can GROUP BY work without aggregate?
 -- Yes, GROUP BY can work without aggregate functions.

-- 50)Can HAVING exist without GROUP BY?
-- No, HAVING is mainly used with GROUP BY to filter grouped data.



 USE  flipkart;
-- 51) Count products per category
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

-- 52) Avg price per category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- 53) Orders per payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method;

-- 54) Delivered orders per payment method
select payment_method , count(*) as delivered_order
from  orders
where order_status = "Delivered"
group by payment_method ;

-- 55) Categories with more than 1 product
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;

-- 56) Payment methods with more than 2 orders
select payment_method, COUNT(*) AS Payment_method
FROM orders
GROUP BY payment_method
HAVING COUNT(*)>2;

-- 57)Product distribution by category
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- 58.Avg price per category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- 59.Most used payment method
SELECT payment_method, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC
LIMIT 1;

-- 60.Categories with high average price
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 500;

-- 61.Order distribution analysis
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- 62) What is JOIN?
-- JOIN is used to combine data from two or more tables using a common column.

-- 63) Difference between INNER and LEFT JOIN
-- INNER JOIN - returns only matching records
-- LEFT JOIN - returns all records from left table and matching from right

-- 64) When to use LEFT JOIN?
-- Use LEFT JOIN when you want all data from main table, even if no match exists.

-- 65) Can RIGHT JOIN be replaced?
-- Yes, RIGHT JOIN can be replaced by LEFT JOIN by swapping tables.

-- 66) What happens if no match in JOIN?
-- INNER JOIN - record is not shown
-- LEFT JOIN - record is shown with NULL values

-- 67) Difference between ON and WHERE
-- ON - sets the join condition
-- WHERE - filters the final result 



use flipkart;
select o.customer_id, c.customer_id, c.name , o.order_id, o.order_date
from customers c
left join orders o
on c.customer_id= o.customer_id;



select s.seller_name, count(product_id) as product_count
from seller s 
left join product as p
on s.seller_id=p.seller_id;


-- 68)What is JOIN?
-- A JOIN is used to combine rows from two or more tables based on a related column between them.

-- 69)Difference between INNER and LEFT JOIN
-- INNER JOIN - returns only matching records
-- LEFT JOIN - returns all records from left table and matching from right

-- 70)to use LEFT JOIN?
-- Use LEFT JOIN when you want all data from main table, even if no match exists.

-- 71)Can RIGHT JOIN be replaced?
--  yes, RIGHT JOIN can be replaced by LEFT JOIN by swapping tables.

-- 72)What happens if no match in JOIN?
-- INNER JOIN
-- Row is discarded

-- LEFT JOIN
-- Row appears with NULLs for right table columns

-- RIGHT JOIN
-- Row appears with NULLs for left table columns

-- 73)Difference between ON and WHERE
-- ON - sets the join condition
-- WHERE - filters the final result 

-- 74).List customers with their orders
use flipkart;
SELECT customers.name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- 75)Show products with seller details
select products.product_name, sellers.seller_name
from products
inner join sellers
on products.seller_id = sellers.seller_id;

-- 76).Find customers with no orders
SELECT name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

-- 77)Show order delivery details
select orders.order_id, deliveries.delivery_status
from orders
inner join deliveries
on orders.order_id = deliveries.order_id;

-- 78)Find products without reviews
select product_name
from products
left join reviews
on products.product_id= reviews.product_id
where reviews.review_text is null;

-- 79)Count orders per customer
SELECT customers.name, COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- 80)Customer order report
SELECT customers.name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- 81)product-seller mapping
select products.product_name, sellers.seller_name
from products
inner join sellers
on products.seller_id = sellers.seller_id;

-- 82)Delivery performance report
select orders.order_id, deliveries.delivery_status
from orders
inner join deliveries
on orders.order_id = deliveries.order_id;

-- 83)Customers with no orders
SELECT name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

-- 84)Order count per customer
SELECT customers.name, COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- 85)What is FULL OUTER JOIN?
-- SQL join that returns everything from both tables—matched and unmatched rows.
--  > If a row matches in both tables → you get one combined row.
--  > If a row exists only in the left table → you still get it (with NULLs for the right table).
--  > If a row exists only in the right table → you still get it (with NULLs for the left table).

-- 86)Does MySQL support FULL JOIN?
-- No—MySQL does not support FULL OUTER JOIN (or FULL JOIN) natively.
-- If you try to write it, MySQL will throw a syntax error.

-- 87)How do you simulate FULL OUTER JOIN in MySQL?
-- By combining LEFT JOIN and RIGHT JOIN with UNION:

-- 88)What is SELF JOIN
-- A SELF JOIN is when a table is joined to itself.

-- 89)When is SELF JOIN used?
-- When data in one table relates to other rows in the same table

-- 90)What is CROSS JOIN?
-- A CROSS JOIN returns the Cartesian product of two tables.
-- Every row from table A is combined with every row from table B.

-- 91)Why CROSS JOIN is dangerous?
-- Because it can explode in size

-- 92)Difference between INNER & FULL JOIN
--                                  inner        full
-- Matching row                      yes         yes
-- Non-matching left rows            no          yes
-- Non-matching right rows           no          yes
-- NULLs included	                 no          yes

-- 93)What happens when no match in LEFT JOIN?
-- All rows from the left table appear
-- Columns from the right table become NULL

-- 94)Can SELF JOIN use same column?
-- Yes.
-- You can join the same column to itself (using aliases).

-- 95)How many rows does CROSS JOIN return?
-- Rows = (rows in table A) × (rows in table B)

-- 96)Real-world use case of SELF JOIN
-- Employee–Manager relationship


-- 97)Show all customers & orders (FULL JOIN logic)
SELECT customers.customer_id, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
UNION
SELECT customers.customer_id, orders.order_id
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

-- 98)Find customers without orders
SELECT name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

-- 99)Find orders without delivery
SELECT orders.order_id
FROM orders
LEFT JOIN deliveries ON orders.order_id = deliveries.order_id
WHERE deliveries.delivery_id IS NULL;

-- 100)Find products without reviews
select product_name
from products
left join reviews
on products.product_id= reviews.product_id
where reviews.review_text is null;

-- 101) Compare products in same category
SELECT p1.product_name, p2.product_name, p1.category
FROM products p1
JOIN products p2
ON p1.category = p2.category
AND p1.product_id <> p2.product_id;

-- 102) Create customer city comparison
SELECT c1.name, c2.name, c1.address
FROM customers c1
JOIN customers c2
ON c1.address = c2.address
AND c1.customer_id <> c2.customer_id;

-- 103) Create product × seller combinations
SELECT products.product_name, sellers.seller_name
FROM products
CROSS JOIN sellers;

-- 104)Count unmatched rows in JOIN
SELECT COUNT(*) AS unmatched_customers
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

-- 105) Find delivery records without orders
SELECT delivery.delivery_id
FROM delivery
LEFT JOIN orders ON delivery.order_id = orders.order_id
WHERE orders.order_id IS NULL;

-- 106) Show cross join output count
SELECT COUNT(*) AS total_rows
FROM products
CROSS JOIN sellers;

-- 107) Replace RIGHT JOIN with LEFT JOIN
SELECT customers.name, orders.order_id
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;

-- 108)Identify orphan records
SELECT orders.order_id
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.customer_id IS NULL;

                                        -- Mini Project 1: Data Quality Audit
--	Find missing orders
SELECT name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

--	Missing deliveries
SELECT orders.order_id
FROM orders
LEFT JOIN deliveries
ON orders.order_id = deliveries.order_id
WHERE deliveries.delivery_id IS NULL;

--	Missing reviews
select product_name
from products
left join reviews
on products.product_id= reviews.product_id
where reviews.review_text is null;

-- Mini Project 2: Customer Coverage Report
--	Customers with orders
SELECT DISTINCT customers.customer_id, customers.name
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

--	Customers without orders
SELECT customers.customer_id, customers.name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;

--	% conversion
SELECT (COUNT(DISTINCT orders.customer_id) * 100.0 / COUNT(DISTINCT customers.customer_id)) 
AS conversion_percentage
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- 109)What is UNION in SQL?
-- UNION is used to combine results of two or more SELECT queries into one result.

-- 110)Difference between UNION and UNION ALL
-- UNION - removes duplicate rows
-- UNION ALL - keeps all rows, including duplicates

-- 111)Why UNION removes duplicates?
-- Because UNION automatically applies DISTINCT on the result.

-- 112) Which is faster: UNION or UNION ALL?
-- UNION ALL is faster because it does not remove duplicates.

-- 113) Can UNION combine different tables?
-- Yes, UNION can combine different tables if columns match.

-- 114)Column rules for UNION
-- Same number of columns
-- Same data types
-- Same column order

-- 115)Can ORDER BY be used inside UNION queries?
-- ORDER BY is used only once at the end of the UNION query.

-- 116)UNION vs JOIN difference
-- UNION - combines rows from multiple queries
-- JOIN - combines columns from multiple tables 

-- 117)Combine customer & seller names
SELECT name AS name FROM customers
UNION
SELECT seller_name FROM sellers;

-- 118) Combine delivered & cancelled orders
SELECT order_id FROM orders WHERE order_status = 'Delivered'
UNION
SELECT order_id FROM orders WHERE order_status = 'Cancelled';

-- 119) Create activity log using orders + deliveries
SELECT order_id, 'Order Placed' AS activity FROM orders
UNION ALL
SELECT order_id, 'Delivered' AS activity FROM deliveries;

-- 120) Combine multiple order statuses
SELECT order_id FROM orders WHERE order_status = 'Pending'
UNION
SELECT order_id FROM orders WHERE order_status = 'Shipped'
UNION
SELECT order_id FROM orders WHERE order_status = 'Delivered';

-- 121)Show customer count & order count in one result
SELECT 'Customers' AS type, COUNT(*) AS total FROM customers
UNION
SELECT 'Orders', COUNT(*) FROM orders;

-- 122)Use UNION ALL for faster report
SELECT order_id FROM orders
UNION ALL
SELECT order_id FROM deliveries;

-- 123) Sort UNION result alphabetically
SELECT name AS name FROM customers
UNION
SELECT seller_name FROM sellers
ORDER BY name;

-- 124) Combine products & sellers names
SELECT product_name AS name FROM products
UNION
SELECT seller_name FROM sellers;

-- 125)Create combined city list (customers + sellers)
SELECT address FROM customers
UNION
SELECT seller_city FROM sellers;

-- 126) Find duplicate rows using UNION vs UNION ALL
SELECT address FROM customers
UNION ALL
SELECT seller_city FROM sellers;

SELECT address FROM customers
UNION
SELECT seller_city FROM sellers;

--                                   Mini Project 1: Flipkart User Directory
-- Goal:
-- Create a combined list of:
-- •	Customers
-- •	Sellers
-- Include role column (Customer / Seller) */

SELECT name AS user_name, 'Customer' AS role
FROM customers
UNION ALL
SELECT seller_name AS user_name, 'Seller' AS role
FROM sellers;

-- 127)  What is a subquery?
-- A subquery is a query inside another SQL query.

-- Types of subqueries
-- Scalar subquery
-- Single-row subquery
-- Multi-row subquery
-- Correlated subquery

-- 128)What is scalar subquery?
-- A scalar subquery returns only one value (one row, one column).

-- 129)Difference between IN and EXISTS
-- IN - compares a value with a list of values
-- EXISTS - checks whether rows exist or not

-- 130)What is correlated subquery?
-- A correlated subquery depends on the outer query and runs for each row.

-- 131)Subquery vs JOIN difference
-- Subquery - query inside another query
-- JOIN - combines tables in a single query

-- 132)Can subquery be used in SELECT?
-- Yes

-- 133)Execution order of subqueries
-- The inner query runs first, then the outer query.

-- 134)Performance issue with correlated subquery
-- It is slow because it runs again for each row of the outer query.

-- 135)Can subquery return multiple columns?
-- No

-- 136)Can we nest subqueries?
-- Yes

-- 137)Real-world use case of subqueries
-- To find employees earning more than average salary. 

-- 138) Products above average price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 139)Latest order details
SELECT *
FROM orders
WHERE order_date = (SELECT MAX(order_date) FROM orders);

-- 140) Customers with orders
SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 141) Products with reviews
SELECT *
FROM products
WHERE product_id IN (SELECT product_id FROM reviews);

-- 142) Products priced above category average
SELECT p.product_name, p.price
FROM products p
WHERE p.price >
(
  SELECT AVG(p2.price)
  FROM products p2
  WHERE p2.category = p.category
);

-- 143) Orders after average order date
SELECT *
FROM orders
WHERE order_date >
(SELECT AVG(order_date) FROM orders);

-- 144) Customers without orders
SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- 145) Products with max price per category
SELECT product_name, category, price
FROM products p
WHERE price =
(
  SELECT MAX(p2.price)
  FROM products p2
  WHERE p2.category = p.category
);

-- 146) Count orders using subquery
SELECT 
(SELECT COUNT(*) FROM orders) AS total_orders;

-- 147) Compare EXISTS vs IN
SELECT *
FROM customers c
WHERE EXISTS
(SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

SELECT *
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

--  148)Create derived table query
SELECT avg_table.category, avg_table.avg_price
FROM (
  SELECT category, AVG(price) AS avg_price
  FROM products
  GROUP BY category
) avg_table;

-- 149) Use subquery in SELECT
SELECT product_name,
       (SELECT AVG(price) FROM products) AS avg_price
FROM products;

                               -- Mini Project 1: Premium Product Identification
                               
                               
-- 1. Find products priced above category average */
SELECT p.product_id, p.product_name, p.category, p.price
FROM products p
WHERE p.price >
(
  SELECT AVG(p2.price)
  FROM products p2
  WHERE p2.category = p.category
);
-- 2. Segment premium vs normal products
SELECT p.product_name,
       p.category,
       p.price,
       CASE
         WHEN p.price >
         (
           SELECT AVG(p2.price)
           FROM products p2
           WHERE p2.category = p.category
         )
         THEN 'Premium'
         ELSE 'Normal'
       END AS product_type
FROM products p;

--                                             Mini Project 2: Active Customer Analysis
-- 1. Identify customers with orders 
SELECT DISTINCT c.customer_id, c.name
FROM customers c
WHERE EXISTS
(
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
);

-- 2. Customers without orders
SELECT c.customer_id, c.name
FROM customers c
WHERE NOT EXISTS
(
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
);

-- 3. Latest active customers
SELECT c.customer_id, c.name, o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_date =
(
  SELECT MAX(order_date)
  FROM orders
);


-- 150)What is a CTE?
-- CTE (Common Table Expression) is a temporary named result set defined using WITH that
-- exists only for the duration of a single query.

-- 151)Why use CTE instead of subquery?
-- 	We use CTE instead of subqueries mainly for better readability, easier reuse within the same query
--  and to handle recursive queries. Performance is usually similar, so the choice is about clarity and maintainability, not speed.
    
-- 152) CTE faster than subquery?
-- Usually: NO difference.
    
-- 153)Difference between CTE and VIEW.
	-- A CTE is a temporary query-scoped result set used for readability and recursion, 
  --   while a VIEW is a permanent stored query used for reuse and abstraction.
    
-- 154)What is recursive CTE?
-- A recursive CTE references itself and is used for hierarchical data.
    
-- 155)When should CTE be avoided?
-- The query is tiny and simpler as a subquery
-- You need indexing
-- You reuse data across multiple queries
-- Performance-critical queries where temp tables perform better
	
    
-- 156)Can we use JOIN inside CTE?
-- yes we use JOIN inside CTE.
    
-- 157)Can multiple CTEs exist in one query?
-- Yes, multiple CTEs can be defined in a single query using one WITH clause.
    
-- 158)Scope of CTE.
-- 	A CTE is visible only within the query in which it is defined.
    
-- 159)Can CTE be indexed?
-- CTE cannot be indexed.

-- 160)CTE vs temporary table.
-- CTE is for query readability, temporary table is for performance and reuse.
    
-- 161)Real-world use case of CTE.
-- CTE is used to simplify complex queries, handle hierarchies, and make SQL logic readable and maintainable.
    
-- Create CTE for delivered orders.
	 with deliverd_order as (
     select * from orders where order_status = "Delivered" )
	 select * from deliverd_order ;
     
-- Count delivered orders using CTE.
	 with deliverd_order as (
	 select * from orders where order_status = "Delivered")
	 select count(*) as total_orders 
	 from deliverd_order ;
    
-- Orders per payment method using CTE.
	with total_order as (
	select payment_method,count(payment_method) from orders group by payment_method)
	select * from total_order;
    
-- Customer order count using CTE.
	with customer_order as (
	select customer_name,count(customer_name) from customers group by customer_name)
	select* from customer_order;

-- Products above average price using CTE.
	with avg_price as (
	select round(avg(price),0) as avgpri from products),
    above_price as(
    select price from products)
    select * from avg_price av
    join above_price ab
    on av.avgpri<ab.price order by price desc;
    
-- Avg delivery days using CTE.
	with avg_deliveries_days as (
		select round(avg(delivery_days),0) 
		from deliveries 
		)
	select * from avg_deliveries_days;
    
-- Multiple CTEs in one query.
	with deliverd as (
	select * from deliveries 
		where  delivery_status = "Delivered"
	),
	avg_deliveries_days as (
		select round(avg(delivery_days),0) 
		from deliveries 
		)
	select * from avg_deliveries_days;
    
-- Replace subquery using CTE.
	with total_order as (
	select payment_method,count(payment_method) from orders group by payment_method)
	select * from total_order;
    
-- Sort CTE result.
	  with payment_summary as (
	  select payment_method, count(*) as total_count from orders
		group by payment_method
	)
	select * from payment_summary 
	order by total_count asc;
    
-- Join inside CTE.
	with customer_order as ( select
		c.customer_id, 
		customer_name,
		count(o.order_id)  as total_orders
    from customers c
    left join orders o
    on c.customer_id = o.customer_id
    group by c.customer_id 
    )
    select * from customer_order
	order by total_orders asc ;

-- Create KPI report using CTE.
	
    
-- Recursive CTE to generate numbers.


                                      -- Mini Project 1: Flipkart KPI Layer
-- Total customers
			with total_customer as(
			select count(customer_name) from customers)
			select * from total_customer;
            
-- Total orders
			with total_order as(
			select count(order_id) from orders)
			select * from total_order;
            
-- Delivered orders
			 with deliverd_order as (
			 select * from orders where order_status = "Delivered")
			 select count(*) as total_orders 
			 from deliverd_order ;
             
-- Avg delivery days
			with avg_deliveries_days as (
			select round(avg(delivery_days),0) 
			from deliveries 
			)
			select * from avg_deliveries_days;
             
                                       -- Mini Project 2: Customer Activity Segmentation
-- Customers with orders
			with customer as(
			select c.customer_name,count(o.order_id)
			from customers c
			left join orders o
			on c.customer_id = o.customer_id
			group by c.customer_id)
			select * from customer;
            
-- Customers without orders
		with customer as(
		select c.customer_name,count(o.order_id)
			from customers c
			left join orders o
			on c.customer_id = o.customer_id
			where order_id=null
			group by c.customer_id )
			select * from customer;
				
-- Order count per customer
			with customer as(
				select 
				c.customer_name,
				c.customer_id,
				o.order_id,
				count(o.order_id)
			from customers c 
			left join orders o
			on c.customer_id = o.customer_id 
			group by customer_id)
		select * from customer;
        
                                       -- mini Project 3: Product Price Benchmark
-- Category avg price
			 with category as (
				select category,sum( price) as categoryy from products group by category ),
				above_category as (
				select round(avg(categoryy),0) as avg_price from category)
				select * from category ct
				join above_category ab 
				on ct.categoryy > ab.avg_price;
                
-- Products above benchmark
			 with product as(
				select avg(price) as avg_price from products)
				select product_name,price,avg_price
				from product p1
				join products p2 
				on p1.avg_price<p2.price;

                               -- Mini Project 4: Delivery Performance Report
-- Goal:
-- Delivered orders
			 with deliverd_order as (
				 select * from orders where order_status = "Delivered")
				 select count(*) as total_orders 
				 from deliverd_order ;
                 
-- Avg delivery days
			with avg_deliveries_days as (
				select round(avg(delivery_days),0) 
				from deliveries )
				select * from avg_deliveries_days;
        
-- Fast vs slow delivery classification



use flipkart;

select delivery_partner,delivery_days,round(avg(delivery_days) over (partition by delivery_days),2) as avg_days
from deliveries;


-- 161).What is a window function?
	A window function performs a calculation across a set of table rows that are related to 
    the current row — without collapsing the result into a single row
    
-- 162)Difference between GROUP BY and window function.
	GROUP BY aggregates data.
	Window functions analyse data.
    
-- 163)What does OVER() do?
	OVER() defines the window (set of rows) for a window function.
    
-- 164)Purpose of PARTITION BY.
	PARTITION BY splits rows into groups (like GROUP BY), but without collapsing them.

-- 165).Can window functions reduce rows?
	No. Window functions cannot reduce rows
    
-- 166).Can WHERE use window functions?
	No. Because WHERE runs before window functions are calculated, 
    so you must filter them using a subquery, CTE, or QUALIFY.
    
-- 167).Window function vs subquery
	Subquery → filtering, existence checks, step-by-step logic
	Window function → analysis across rows without losing detail
    
-- 168)When to use window functions?
 Use window functions when you need analytical calculations across related rows while preserving row-level detail.
    
-- 169).Can we use aggregate functions as window functions?
	Yes — but only when they are used with OVER().

-- 170).Is PARTITION BY mandatory?
	No. PARTITION BY is NOT mandatory.
    
-- 171)Can window functions be nested?
	No. Window functions cannot be nested inside other window functions.
    
-- 172)Real-world use cases of window functions.
	Window functions are used for analytical queries such as ranking, running totals, trend analysis,
    and comparisons across related rows without losing detail.

-- 173)Show avg product price with each product.
	select product_name,round(avg(price) over(),2) as avg_price from products;
    
-- Avg price per category using window function.
	select product_name,category,round(avg(price) over(partition by category),2) as avg_price from products;

-- Count products per category using window function.
	select category,count(product_id)over(partition by category) as total_product from products;

-- Show total orders per customer (row-level).
	select c.customer_name,count(o.order_id)over(partition by o.customer_id) from orders o left join customers c on c.customer_id = o.customer_id ;
    
-- Compare price vs category average.
	select product_name,category,round(avg(price) over(partition by category),2) as avg_price from products;

-- Show avg delivery days per partner.
	select delivery_id,delivery_partner,delivery_days,avg(delivery_days)over(partition by delivery_partner) from deliveries;
    
-- Show category stock value.
	select category,sum(stock)over(partition by category) as total_stock from products;

-- Window function without PARTITION BY.
	select product_name,round(avg(price) over(),2) as avg_price from products;
    
-- Use window function with JOIN.
	select c.customer_name,count(o.order_id)over(partition by o.customer_id) from orders o left join customers c on c.customer_id = o.customer_id ;
    
-- Filter rows using window output.
	select category,sum(stock)over(partition by category) as total_stock from products;
    
-- Window function vs GROUP BY example.
	select category,sum(stock)over(partition by category) as total_stock from products;
    select category,sum(stock) as total_stock from products group by category;
    
-- Create inventory analytics query.
	select category,sum(stock) as total_stock from products where category="Accessories" group by category;
    
    
    
                                       -- Mini Project 1: Product Price Intelligence
--	Show product price
		select product_name,price from products;
        
--	Category average price
		select product_name,category,
        round(avg(price) over(partition by category),2) as avg_price 
        from products;
        
--	Difference from average
		select product_name,
        round(avg(price) over(partition by category),2),(price-round(avg(price) over(partition by category),2)) as avg_price
        from products;

                                         --  Mini Project 2: Customer Order Strength
-- Order count per customer (row-level)
		select c.customer_name,count(o.order_id)over(partition by o.customer_id) from orders o left join customers c on c.customer_id = o.customer_id ;
    
-- Identify repeat customers
		select c.customer_name,count(o.order_id)over(partition by o.customer_id) from orders o left join customers c on c.customer_id = o.customer_id where order_id<1;
    
-- 173).What is ROW_NUMBER?
	ROW_NUMBER() is a window function that assigns a unique sequential number to each row within a window.

-- 174)Difference between RANK and DENSE_RANK.
	RANK() assigns the same rank to ties and skips subsequent numbers, while DENSE_RANK() assigns the same rank to ties without skipping numbers.
    
-- 175)When to use ROW_NUMBER?
	Use ROW_NUMBER() when you need a unique sequence or exactly one row per group, even in the presence of ties.
    
-- 176)What happens in RANK when values tie?
	When values tie, RANK() assigns the same rank to the tied rows and skips the subsequent rank numbers.

-- 177)Does DENSE_RANK skip numbers?
	No. DENSE_RANK() does NOT skip numbers.
    
-- 178)Can ranking be used without ORDER BY?
	No. Ranking functions cannot be used without ORDER BY.

-- 179)Difference between LIMIT and ranking.
	LIMIT restricts the number of rows returned, while ranking functions assign positions to rows without removing them and correctly handle ties.
    
-- 180)What is Top-N per group?
	Top-N per group means selecting the highest N records within each group using window functions like ROW_NUMBER with PARTITION BY.
    
-- 181)Can ranking work with JOIN?
	Yes — ranking works perfectly with JOIN.

-- 182)Ranking vs GROUP BY.
	GROUP BY collapses rows.
	Ranking keeps rows and adds intelligence.
    
-- 183)Can ranking functions be nested?
	No, ranking functions cannot be nested directly.To apply multiple rankings, we use subqueries or CTEs.
  
-- 184)Real-world use cases of ranking.
	Whenever you hear top, highest, latest, best, rank, duplicate,
	think window functions — not GROUP BY, not LIMIT.
    
-- Rank products by price
	select product_name,price,rank()over(order by price desc) from products;

-- Dense rank products by price
	select product_name,price,dense_rank()over(order by price desc) from products;
    
-- .Assign row number to products.
	 select product_name,row_number()over(order by product_id desc) from products;

-- .Rank products per category.
	 select product_name,category,rank()over(order by category desc) from products;
     
-- Top 3 products per category.
	select product_name,category,rank()over(order by category desc) from products limit 3;
    
-- Rank customers by order count.
	select order_id,rank() over(order by order_id asc) from orders;
    
-- Rank deliveries by speed.
	   select order_id,delivery_days,rank() over (order by delivery_days asc) from deliveries;
    
-- Ranking without PARTITION BY
	select order_id,rank() over(order by order_id asc) from orders;
    
-- Ranking with JOIN.
	select * from (
			select
		customer_name,
		count(o.order_id) as total_orders,
		rank() over (order by count(o.order_id) desc) as customer_rank
		from customers c
		left join orders o
		on c.customer_id = o.customer_id
		group by customer_name
	) t;
    
-- Compare RANK vs DENSE_RANK output.
	select product_name,price,rank()over(order by price desc) from products;
	select product_name,price,dense_rank()over(order by price desc) from products;
    
-- Create leaderboard query.
	----
    
                                           -- mini Project 1: Category Leaderboard
-- 	Top 3 expensive products per category
		select product_name,category,
        rank()over(order by category desc) 
        from products 
        limit 3;
    
-- 	Ranking logic
		select product_name,price,
        rank()over(order by price desc) 
        from products;

                                                  -- Mini Project 2: Customer Power Users
-- Rank customers by number of orders
		select order_id,rank() over(order by order_id asc) from orders;
        
-- 	Identify top buyers
		select * from (
			select
			customer_name,
			count(o.order_id) as total_orders,
			rank() over (order by count(o.order_id) desc) as customer_rank
			from customers c
			left join orders o
			on c.customer_id = o.customer_id
			group by customer_name
		) t;
        

                                            -- .Mini Project 3: Delivery Performance Ranking
                                            
                                            
-- Fastest delivery partners
		select delivery_days,delivery_partner,
        row_number()over(order by delivery_days desc) as avg_days 
        from deliveries
        limit 5;

-- 	Order-wise delivery ranking
		select customer_id,
        rank()over(partition by customer_id order by customer_id desc)
        from customers;
        
        
        
        
-- 185) What is DATE datatype?
-- The DATE datatype stores calendar dates only (Year–Month–Day

-- 186)Difference between DATE and DATETIME
-- Use DATE when time is not needed.
-- Use DATETIME when exact timestamp matters (orders, logins, etc.).

-- 187)What does NOW() return?
-- NOW() returns the current date and time

-- 188)Difference between NOW() and CURDATE()
-- NOW() → Current date + time
-- CURDATE() → Current date only

-- 189)How does DATEDIFF work?
-- DATEDIFF(date1, date2) returns the difference in days between two dates.

-- 190)What is INTERVAL?
-- INTERVAL is used to add or subtract time from a date

-- 191)How to calculate last 30 days?
SELECT *
FROM orders
WHERE order_date >= NOW() - INTERVAL 30 DAY;

-- 192)Can we group by month only?
-- Yes, using MONTH()
SELECT MONTH(order_date), COUNT(*)
FROM orders
GROUP BY MONTH(order_date);

-- 193)Why year & month grouped together?
-- To avoid mixing same months from different years

-- 194)What is recency analysis?
-- Recency analysis measures how recently a customer made a purchase

-- 195)Date functions in analytics?
-- NOW(),CURDATE(),DATEDIFF(),DATE_ADD(),DATE_SUB(),YEAR(),MONTH(),DAY(),EXTRACT()

-- 196)Common date mistakes in SQL?
-- Grouping only by month (ignoring year)
--  Mixing DATE and DATETIME without conversion
-- ime zone confusion
-- sing = instead of range filtering
-- Not handling NULL dates
--  Incorrect date format




-- Extract year from orders.
	select order_id,year(order_date) as month from orders;
        
-- Extract month from orders.
	select order_id,month(order_date) as month from orders;
        
-- Show today’s date.
	select now();
        
-- Add 10 days to order date.
	select order_id,order_date,date_add(order_date,interval 10 day) as after_days from orders;

-- Find orders from last 15 days.
	select * from orders where order_date >= curdate() - interval 15 day;
    
-- Calculate days since each order.
	select order_id,order_date,datediff(curdate(),order_date) as dates from orders;
    
-- Count orders per month.
	select monthname(order_date) as month ,count(*) as total_order from orders group by month(order_date);
    
-- Find oldest order.
	select  order_id,order_date from orders order by order_date asc limit 1;
    
-- Find most recent order
	select  order_id,order_date from orders order by order_date desc limit 1;
   
-- calculate average delivery days.
	select round(avg(delivery_days),0) as avgdays from deliveries;

-- Show orders in January.
	select order_id,order_date from orders where monthname(order_date)="january";
    
-- Find orders placed this year.
	select order_id,order_date from orders where year(order_date)=year(curdate());




                                            -- Mini Project 1: Monthly Order Dashboard
                                            
                                            
                                            
-- Orders per month
		select monthname(order_date) as month ,count(*) as total_order from orders group by month(order_date);
		
-- Latest month sales
		select order_id,order_date from orders where month(order_date)=month(curdate());

-- Growth trend
	select month(order_date) as monts ,count(*) as total orders from orders group by month(order_date) order by month;
    
    
    
                                                   -- Mini Project 2: Delivery SLA Report
                                                   
                                                   
                                                   
-- Avg delivery days
		select round(avg(delivery_days),0) as avgdays from deliveries;
		
-- Fast vs slow deliveries
		select order_id ,delivery_days from deliveries where delivery_days>3;
		with fast as
		count(select d1.order_id ,d2.delivery_days from deliveries where delivery_days>3) as fast,
		as slow 
		count(select d1.order_id ,d2.delivery_days from deliveries where delivery_days<3) as slow from deliveries d1 join deliveris d2 on d1.delivery_days=d2.delivery_days;
		
-- Delay classification
		SELECT c.customer_id
			FROM customers c
			LEFT JOIN orders o 
			ON c.customer_id = o.customer_id
			AND o.order_date >= CURDATE() - INTERVAL 30 DAY
			WHERE o.customer_id IS NULL
    
    
    
											-- Mini Project 3: Customer Recency Analysis
                                            
                                            
-- Days since last order
			select order_id,order_date,datediff(curdate(),date(order_date)) as dates from orders order by dates limit 1 ;
			
-- Active vs inactive customers
			SELECT c.customer_id
			FROM customers c
			LEFT JOIN orders o 
			ON c.customer_id = o.customer_id
			AND o.order_date >= CURDATE() - INTERVAL 30 DAY
			WHERE o.customer_id IS NULL





       

-- 197)What is CONCAT?
-- CONCAT() combines two or more strings into one single string

-- 198)Difference between UPPER and LOWER
-- UPPER() converts text to uppercase letters.
-- LOWER() converts text to lowercase letters.

-- 199)What does LENGTH return?
-- LENGTH() returns the total number of characters in a string (including spaces)

-- 200)What is SUBSTRING?
-- SUBSTRING() extracts a specific part of a string starting from a given position

-- 201)Difference between LEFT and SUBSTRING
-- LEFT(string, n) returns the first n characters from the left.
-- SUBSTRING(string, start, length) extracts characters from any position

-- 202)Purpose of REPLACE
-- REPLACE() substitutes a specific part of a string with another value

-- 203)What does TRIM do?
-- TRIM() removes leading and trailing spaces from a string

-- 204)How to extract email domain?
-- The domain is the part after @.

-- 205)Why clean text before analysis?
-- To remove duplicates
-- To standardize case (Ali vs ali)
-- To remove extra spaces
-- To improve grouping and reporting accuracy

-- 206)Case sensitivity in SQL?
-- Case sensitivity depends on the database system:
-- MySQL is usually case-insensitive (by default).
-- PostgreSQL is case-sensitive in comparisons.

-- 207)Can multiple string functions be nested?
-- Yes, multiple string functions can be nested

-- 208))real-world use case of string cleaning?
-- Standardizing city names or phone numbers for accurate reporting





-- Concatenate name & email.
	select concat(customer_name,"--",email) as concate from customers;
    
-- Convert all product names to uppercase.
	select upper(customer_name) from customers;
    
-- Extract first 4 letters of product name.
	select left(product_name,4) from products;
    
-- Extract last 3 letters.
	select right(product_name,3) from products;
    
-- eplace COD with Cash.
	select replace(payment_method,"COD","cash") from orders;

-- Trim spaces from names.
	select trim(customer_name) as namee from customers;
    
-- count length of seller names.
	select length(customer_name) from customers;
    
-- Extract email domain.
	select email,substring_index(email,"@",-1) from customers;

-- create short product cod.
	

-- Combine category + price.
	select concat(category,"-",price) from products;
    
-- Standardize payment method to lowercase.
	select lower(payment_method) from orders;
    
-- Format name properly.
	SELECT CONCAT(UPPER(LEFT(customer_name,1)),LOWER(SUBSTRING(customer_name,2))) AS proper_name FROM customers;


                                            -- Mini Project 1: Customer Data Cleaning


-- Standardize names
	SELECT CONCAT(UPPER(LEFT(customer_name,1)),LOWER(SUBSTRING(customer_name,2))) AS proper_name FROM customers;

-- extract email domains
	select email,substring_index(email,"@",-1) from customers;
    
-- Remove extra spaces
	select trim(customer_name) as namee from customers;
    
    
    
											-- Mini Project 2: Product Code Generator
                                            
                                            
-- Generate short code using first 3 letters + price
	select concat(left(product_name,3),"-",price) from products;

                                              -- Mini Project 3: Marketing Segmentation
-- group customers by email domain
	select concat(customer_name,"-",email)from customers;
    
-- Identify top domain users
	


-- 209)What is CASE WHEN?
-- CASE is a conditional expression in SQL. It works like an IF-THEN-ELSE statement and returns a value based on conditions.

-- 210)Difference between IF and CASE

-- 211)Is ELSE mandatory?
-- No.
-- If omitted and no condition matches → CASE returns NULL.

-- 212)Can CASE be used with aggregates?
-- yes

-- 213)Can CASE be used in ORDER BY?
-- yes
-- 214)Can CASE be nested?
-- yes

-- 215)How does SQL evaluate CASE?
-- Evaluation is top-to-bottom.
-- SQL checks each WHEN
-- Stops at first TRUE condition
-- Returns corresponding result
-- If none match → returns ELSE or NULL

-- 216)CASE vs WHERE difference
-- case chooses values inside results 
-- where filters which row appear

-- 217)When to use CASE?
-- use it to aasign values conditionally in select,order by or aggregates.

-- 218)Can CASE return NULL?
-- yes

-- 219)Performance impact of CASE?
-- Usually minimal
-- It does NOT significantly slow queries

-- 220)Real-world business uses of CASE
-- Categorize sales into “Low”, “Medium”, “High”
-- Grade students (A, B, C, Fail)


-- Classify products by price
	select product_name,price,
    case 
    when price >= 50000 then "Expensive"
    when price between 10000 and 49999 then "moderate"
    else "affortable"
    end as price_category
    from products;

-- Segment customers by order count
	select customer_name,case
    when order_id >=2 then " regular"
    when order_id =1 then "normal"
    else "null"
    end as customer_type
    from
	(select c.customer_name,o.order_id,count(o.order_id)
    from customers c
    left join orders o
    on c.customer_id = o.customer_id 
    group by o.order_id)t;

-- Identify fast/slow deliveries
	select delivery_id,delivery_days,case 
    when delivery_days >=3 then "slow delivery"
    when delivery_days <3 then "fast delillverly"
    else "not delivered" 
    end as delivey_status from deliveries;
 
-- Count delivered vs non-delivered orders
	select delivery_status,
    sum(case when delivery_status ="Delivered" then 1 else 0 end) as deliverd_order,
    sum(case when delivery_status <> "Delivered" then 1 else 0 end) as other_status
    from deliveries;
    
-- Categorize sellers by rating
	select seller_rating ,case
    when seller_rating >= 4.0 then "best seller"
    when seller_rating >3 then "medium seller"
    when seller_rating = 0 then "not good"
    else "not rating"
    end as rating_sellers from sellers;
    
-- Classify inventory status
	---------------
    
-- Use CASE in ORDER BY
	select product_name,price,
    case 
    when price >= 50000 then "Expensive"
    when price between 10000 and 49999 then "moderate"
    else "affortable"
    end as price_category
    from products order by price_category desc;
    
-- Use CASE with window function
	-----------
    
-- Segment orders by payment type
	select payment_method,
    sum(case when payment_method ="UPI" then 1 else 0 end) as upi_method,
    sum(case when payment_method ="Cradit Card" then 1 else 0 end) as craditcard_method,
    sum(case when payment_method ="Debit Card" then 1 else 0 end) as Debittcard_method
    from orders;
    
-- Create revenue band categories
	--------
    
-- Nested CASE example
	select 
	customer_name, 
    case
		when customer_name like "A%" then "starts with A"
        else 
			case
				when customer_name like "R%" then "start with R"
                else "Other"
			end
		end as name_type
	from customers ;
    
-- Classify customers by email domain
	select customer_name,email,case
    when email like "%gmail.com" then "emails"
    else "yahoo"
    end as domain from customers;

                                          -- Mini Project 1: Customer Segmentation Engine
-- Segment into Inactive / Occasional / Frequent
		select customer_name,case
		when order_id >=2 then " Frequent"
		when order_id =1 then "Occasional"
		else "Inactive"
		end as customer_type
		from
		(select c.customer_name,o.order_id,count(o.order_id) 
        from customers c
        left join orders o 
        on c.customer_id = o.customer_id
        group by o.order_id)t;

-- Create summary report
		----------------
    
									-- Mini Project 2: Product Price Intelligence
-- Low / Medium / High
		select product_name,price,
		case 
		when price >= 50000 then "high"
		when price between 10000 and 49999 then "medium"
		else "low"
		end as price_category
		from products order by price_category desc;
		
-- Compare vs category average
	   --------------
   
                                      -- Mini Project 3: Delivery Performance Scorecard
-- Classify partners
			select delivery_partner,
		sum(case when delivery_partner = "Ekart" then 1 else 0 end),
		sum(case when delivery_partner = "Delhivery" then 1 else 0 end),
		sum(case when delivery_partner = "BlueDart" then 1 else 0 end)
		from deliveries;
		
-- Rank by performance
		select delivery_id,delivery_days,case 
		when delivery_days >=3 then "slow delivery"
		when delivery_days <3 then "fast delillverly"
		else "not delivered" 
		end as delivey_status from deliveries;
    
											-- Mini Project 4: Inventory Risk Monitoring
                                            
-- Identify out-of-stock
		select stock ,case when stock = 0 then "out of stock"
		else "stock avilable" 
		end as stocks 
		from products;
		
-- High-demand items
		 select * from products;
		select stock ,case when stock >=50 then "high demand"
		else "less demand" 
		end as stocks 
		from products;


-- 221)What is a view?
-- A view is a virtual table created from a SQL query.
-- It does not store data itself (in most databases). Instead, it stores the query definition,
--  and when you query the view, SQL executes that query on the underlying tables.

-- 222)Difference between view and table
-- A Table stores data physically,but a view shows data from tables without storing it

-- 223)Does view store data?
-- no

-- 224)Can we insert into view?
-- yes but only if the view is simple and based on  one table without complex joins

-- 225)What happens when base table updates?
-- If base table changes → view result changes automatically
-- View always shows latest data
-- It reflects real-time data.

-- 226)Can views be indexed?
-- no

-- 227)Why use views in dashboards?
-- Simplification
-- Complex joins are hidden inside the view.

-- Reusability
-- Same business logic reused across reports.

-- Security
-- Expose only required columns.

-- Consistency
-- All dashboards use same calculation logic.

-- 228)What is materialized view?
-- A materialized view is a view that physically stores the query result.

-- 229)Security benefits of views
-- Views improve security by:
-- Hiding sensitive columns (salary, SSN)
-- Restricting rows (region-based access)
-- Granting access to view instead of base table
-- applying business logic filters

-- 230)Can view contain joins?
-- yes 

-- 231)View vs CTE difference
-- a view permanently in database,but cte exists only during query execution

-- 232)When should views be avoided?
-- Query is extremely complex and slows performance
-- Nested views (view on view on view)
-- When indexing is required but not supported
-- Heavy real-time aggregations (use materialized view instead)
-- Debugging becomes difficult




-- Create customer summary view
		create view customer_order_summary as 
		select 
		c.customer_id,
		c.customer_name,
		count(o.order_id) as total_orders
	from customers c
	left join orders o
	on c.customer_id = o.customer_id
	group by c.customer_id ;
	select * from customer_order_summary;

-- Create delivered orders view
	create view deliver_order as 
    select delivery_status,delivery_id from deliveries where delivery_status="Delivered";
     select * from deliver_order;
     
-- Create product performance view
		create view product_per as
	    select product_name,price,
		case 
		when price >= 50000 then "high"
		when price between 10000 and 49999 then "medium"
		else "low"
		end as price_category
		from products;
        select * from product_per;
        
-- Query from view
 SELECT * FROM  customer_order_summary;


	
-- Modify view using REPLACE
-- Drop view
-- Create view hiding sensitive columns
-- Create view using JOIN
-- Create view using GROUP BY
-- Use view in another query
-- Count records from view
-- Compare performance of table vs view



-- 233)What is an index?
-- An index is a data structure (usually a B-tree in MySQL) that stores column values in a sorted format with pointers to table rows.

-- 234)How does indexing improve performance?
-- Reducing rows scanned
-- Speeding up SELECT, WHERE, JOIN, ORDER BY, GROUP BY
-- Avoiding full table scans

-- 235)What is full table scan?
-- A full table scan occurs when the database reads every row in a table to find matching data.

-- 236)Types of indexes in MySQL?
-- ⭐ Primary Index (Clustered)
-- Created automatically for primary key
-- Data stored in index order

-- ⭐ Secondary Index
-- Separate structure referencing table rows

-- ⭐ Unique Index
-- Prevents duplicate values

-- ⭐ Composite Index
-- Multiple columns

-- ⭐ Fulltext Index
-- Text searching

-- ⭐ Spatial Index
-- Geographical data

-- 237)What is composite index?
-- An index built on multiple columns.

-- 238)When should we avoid index?
-- Small tables (scan faster than index lookup)
--  Columns frequently updated
--  Low selectivity columns (gender, boolean)
--  Write-heavy systems
-- Large text/blob fields unnecessarily

-- 239)What does EXPLAIN show?
-- EXPLAIN shows how MySQL executes a query.

-- 240)Difference between UNIQUE and PRIMARY KEY?
-- PRIMARY KEY - main identifier of a table, does not allow NULL, only one per table 
-- UNIQUE - prevents duplicate values but allows NULL, multiple allowed.

-- 241)Can too many indexes slow performance?
-- yes

-- 242)How does index affect INSERT?

-- When inserting:
-- Row inserted into table
-- Every index updated
-- Tree rebalanced

-- Result:
-- Slower writes
-- More CPU and disk operations
-- More indexes → slower insert speed.

-- 243)Index vs partitioning difference?
-- Index -improves data search speed
--  Partitioning -splits a large table into smaller parts for better management and faster scanning.

-- 244)Real-world optimization scenario?
-- E-commerce site → slow order lookup.



use flipkart;

-- Create index on order_date
create index idx_order_date
on orders(order_date);

-- Create index on customer_id
 create index idx_customer_id
on orders(customer_id);

-- Create composite index
create index idx_customer_date
on orders(customer_id, order_date);

-- Drop an index
drop index idx_order_date on orders;

-- Use EXPLAIN on SELECT query
explain select * from orders
where customer_id = 1;

-- Compare query before & after index
explain select * from  orders
where customer_id = 1;
-- type: ALL - full table scan.

create index idx_customer_id ON orders(customer_id);
explain select * from orders
where customer_id = 1;
-- type: ref - index used (faster).

-- Optimize date filtering query
select * from orders
where order_date between '2024-01-01' and '2024-12-31';

-- Identify full table scan
explain select * from  products
where category = 'Electronics';
-- If output shows:  type-full then Full table scan happening.

-- Optimize JOIN query
create index
 on orders(customer_id);

-- Test ORDER BY performance
create index idx_price on products(price);
explain select * from products
order by price;

-- Show indexes of table
show indexes from orders;

-- Remove unnecessary index
show indexes from orders;
drop index idx_price on products;


                                        -- Mini Project 1: Query Performance Audit
-- •	Identify slow queries
SELECT * 
FROM customers 
WHERE email = 'amit.sharma@gmail.com';
-- this is slow
-- •	Use EXPLAIN
EXPLAIN SELECT * 
FROM customers 
WHERE email = 'amit.sharma@gmail.com';
-- •	Add indexes
CREATE INDEX idx_customers_email
ON customers(email);
-- •	Compare performance
EXPLAIN SELECT * 
FROM customers 
WHERE email = 'amit.sharma@gmail.com';
-- this is fast

                                         -- Mini Project 2: JOIN Optimization
-- •	Optimize customer-order join
EXPLAIN
SELECT c.name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- •	Add index on foreign keys
CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_products_seller
ON products(seller_id);

CREATE INDEX idx_deliveries_order
ON deliveries(order_id);

CREATE INDEX idx_reviews_customer
ON reviews(customer_id);

                                      -- Mini Project 3: Date Filtering Optimization
-- •	Replace YEAR() filtering
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- •	Improve performance
CREATE INDEX idx_orders_date
ON orders(order_date);

                                       -- Mini Project 4: Index Strategy Design
-- Design indexing plan for:
-- •	Orders table
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_status ON orders(order_status);

-- •	Products table
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_price ON products(price);
CREATE INDEX idx_products_seller ON products(seller_id);

-- •	Deliveries table
CREATE INDEX idx_deliveries_order ON deliveries(order_id);
CREATE INDEX idx_deliveries_status ON deliveries(delivery_status);



 -- 245)What is a stored procedure?
	stored procedure is a precompiled set of SQL statements stored in the database that can be executed by calling its name.

-- 245)Benefits of stored procedures?
	They improve performance, security, reusability, and reduce network traffic.

-- 246) What is DELIMITER?
	DELIMITER is used in MySQL to change the statement terminator temporarily so we can define procedures or triggers containing multiple statements.

-- 247)IN vs OUT parameters?
	IN sends value to procedure, OUT returns value from procedure.

-- 248)Procedure vs Function difference?
	Procedure can perform operations and may not return a value, while function must return a single value and can be used inside SQL queries.

-- 249) What is a trigger?
	A trigger is a database object that automatically executes when a specific event (INSERT, UPDATE, DELETE) happens on a table.

-- 250)Types of triggers?
	INSERT trigger, UPDATE trigger, DELETE trigger.

-- 251)BEFORE vs AFTER trigger?
	BEFORE runs before the event occurs, AFTER runs after the event is completed.

-- 252) What are NEW and OLD?
	NEW refers to the new row values and OLD refers to the previous row values inside a trigger.

-- 253)Can trigger return value?
	No, triggers cannot return values.

-- 254)Trigger vs procedure?
	Trigger runs automatically on table events, procedure runs manually when called.

-- 255) Are triggers automatically executed?
	Yes, triggers execute automatically when the defined event occurs.

-- 256)Can we disable trigger?
	In MySQL, we cannot directly disable a trigger; we must drop it.

-- 257)Performance impact of triggers?
	Triggers can slow down performance because they execute automatically with each affected row.

-- 258)Real-world use case of triggers?
	Automatically inserting records into an audit table whenever data is updated.
    
-- Create procedure for delivered orders
		DELIMITER //
			CREATE PROCEDURE deliver_status()
			BEGIN
				SELECT * FROM orders WHERE order_status="Delivered";
			END //
		DELIMITER ; 
        
-- Create procedure with parameter0
		DELIMITER //
			CREATE PROCEDURE order_select( IN add_id INT)
			BEGIN 
				SELECT * FROM orders 
                WHERE order_id=add_id;
			END//
		DELIMITER ;
        CALL order_select(1006);
	
-- Create procedure with OUT parameter
		DELIMITER //
			CREATE PROCEDURE cout_total(OUT totall int)
			BEGIN
				SELECT COUNT(*) INTO totall FROM orders;
			END //
		DELIMITER ;
        CALL cout_total(@totall);
        select @total;
       
--  Use IF in procedure
		DELIMITER //
			CREATE PROCEDURE use_if(IN price_value INT)
            BEGIN
				IF price_value>=1000 THEN 
					SELECT "high value";
                ELSE 
					SELECT "low value";
			    END IF ;
			END //
	    DELIMITER ;
        CALL use_if(23000);
        
-- Drop a procedure
		DROP PROCEDURE use_if;
        
-- create audit table
		CREATE TABLE audit(
			audit_id INT AUTO_INCREMENT PRIMARY KEY ,
			order_id INT,
			action_type VARCHAR(10),
			action_time DATETIME DEFAULT CURRENT_TIMESTAMP);
-- Create AFTER INSERT trigger
		delimiter //
			create trigger after_order_insert_reduce_stock
			after insert on orders
			for each row
			begin 
				update products
				set stock = stock -1
				where product_id = NEW.order_id ;
			end //
		delimiter ;

--  Create BEFORE UPDATE trigger
		delimiter //
			create trigger before_order_update
			before update on orders
			for each row
			begin
				if old.order_status = "Delivered" then
					signal sqlstate "45000"
					set message_text = "Delivered order can not be modify" ;
				end if ;
			end //
		delimiter ;

-- create DELETE trigger
		delimiter //
			create trigger before_order_delete
			before delete on orders
			for each row
			begin
				if old.order_status = "Delivered" then
					signal sqlstate "45000"

-- Create DELETE trigger
		delimiter //
			create trigger before_order_delete
			before delete on orders
			for each row
			begin
				if old.order_status = "Delivered" then
					signal sqlstate "45000"
					set message_text = "can not delete delivered order" ;
				end if ;
			end //
		delimiter ;

-- Use NEW keyword
		delimiter //
			create trigger before_product_insert
			before insert on products 
			for each row
			begin 
				if NEW.stock < 0 then 
					set NEW.stock = 0 ;
				end if ;
			end //
		delimiter ;

--  Use OLD keyword
	delimiter //
	create trigger after_order_delete
	after delete on orders
	for each row
	begin 
		insert into order_audit(order_id, action_type)
		values (old.order_id, "DELETE");
	END //
	DELIMITER ;

--  Test trigger functionality

-- Create validation trigger
		delimiter //
			create trigger before_order_update
			before update on orders
			for each row
			begin
				if old.order_status = "Delivered" then
					signal sqlstate "45000"
					set message_text = "Delivered order can not be modify" ;
				end if ;
			end //
		delimiter ;
        
-- Create logging trigger

-- Remove trigger
		drop trigger before_order_update ;
        
        
                                            -- Mini Project 1: Order Automation System
-- •	Procedure to insert order
		create table order_audit (
			audit_id int auto_increment primary key,
			order_id int,
			action_type varchar(10),
			action_time datetime default current_timestamp
		);

		delimiter //
		create trigger after_order_insert
		after insert on orders
		for each row
		begin 
			insert into order_audit(order_id, action_type)
			values (NEW.order_id, "INSERT");
		END //
		DELIMITER ; 

--  •	Trigger to log activity
		CREATE TABLE order_log (
			log_id INT AUTO_INCREMENT PRIMARY KEY,
			order_id INT,
			action_time DATETIME
		);

		DELIMITER //
		CREATE TRIGGER log_order
		AFTER INSERT ON orders
		FOR EACH ROW
		BEGIN
			INSERT INTO order_log(order_id, action_time)
			VALUES(NEW.order_id, NOW());
		END //
		DELIMITER ;
        
        

                                              -- Mini Project 2: Inventory Protection System
-- •	Prevent negative stock
		DELIMITER //
		CREATE TRIGGER check_stock_update
		BEFORE UPDATE ON products
		FOR EACH ROW
		BEGIN
			IF NEW.stock < 0 THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Stock cannot be negative';
			END IF;
		END //
		DELIMITER ;

-- •	Log stock changes
		CREATE TABLE stock_log (
			log_id INT AUTO_INCREMENT PRIMARY KEY,
			product_id INT,
			old_stock INT,
			new_stock INT,
			change_time DATETIME
		);

		DELIMITER //
		CREATE TRIGGER log_stock_update
		AFTER UPDATE ON products
		FOR EACH ROW
		BEGIN
			INSERT INTO stock_log(product_id, old_stock, new_stock, change_time)
			VALUES(NEW.product_id, OLD.stock, NEW.stock, NOW());
		END //
		DELIMITER ;

                                        --  Mini Project 3: Audit & Compliance System
--  •	Log every insert/update/delete
		delimiter //
		create trigger after_order_insert
		after insert on orders
		for each row
		begin 
			insert into order_audit(order_id, action_type)
			values (NEW.order_id, "INSERT");
		END //
		DELIMITER ; 


--  •	Track timestamps


                                           --  Mini Project 4: Customer Reward Automation
-- •	Procedure to calculate total orders
		DELIMITER //
		CREATE PROCEDURE customer_total_orders( IN cust_id INT, OUT total_orders INT )
		BEGIN
			SELECT COUNT(*) INTO total_orders
			FROM orders
			WHERE customer_id = cust_id;
		END //
		DELIMITER ;

--  •	Trigger to classify customer as “Frequent”
		ALTER TABLE customers ADD customer_type VARCHAR(20);

		DELIMITER //
		CREATE TRIGGER classify_customer
		AFTER INSERT ON orders
		FOR EACH ROW
		BEGIN
			UPDATE customers
			SET customer_type = 'Frequent'
			WHERE customer_id = NEW.customer_id
			AND (
				SELECT COUNT(*) 
				FROM orders 
				WHERE customer_id = NEW.customer_id
			) > 2;
		END //
		DELIMITER ;
-- Create a BEFORE INSERT trigger on customers that prevents insertion if the email does not contain “@” and raise an error using SIGNAL.
		DELIMITER //
		CREATE TRIGGER validate_email
		BEFORE INSERT ON customers
		FOR EACH ROW
		BEGIN
			IF NEW.email NOT LIKE '%@%' THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Invalid Email';
			END IF;
		END //
		DELIMITER ;
			

 
-- Create a BEFORE INSERT trigger on reviews that automatically sets review_date to CURRENT_DATE if it is inserted as NULL.
		DELIMITER //
		CREATE TRIGGER review_date
		BEFORE INSERT ON reviews
		FOR EACH ROW
		BEGIN
			IF NEW.review_date IS NULL THEN
				SET NEW.review_date = CURRENT_DATE;
			END IF;
		END //
		DELIMITER ;

-- Create a BEFORE INSERT trigger on deliveries that ensures delivery_days cannot be greater than 30; if greater, set it to 30.
		DELIMITER //
		CREATE TRIGGER limit_delivery
		BEFORE INSERT ON deliveries
		FOR EACH ROW
		BEGIN
			IF NEW.delivery_days > 30 THEN
				SET NEW.delivery_days = 30;
			END IF;
		END //
		DELIMITER ;

-- Create an AFTER INSERT trigger on reviews that inserts a record into a new table review_log(review_id, product_id, log_time) whenever a new review is added.
		CREATE TABLE review_log (
			review_id INT,
			product_id INT,
			log_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER review_insert
		AFTER INSERT ON reviews
		FOR EACH ROW
		BEGIN
			INSERT INTO review_log(review_id, product_id, log_time)
			VALUES(NEW.review_id, NEW.product_id, NOW());
		END //
		DELIMITER ;

--  Create an AFTER INSERT trigger on customers that inserts a welcome record into a table customer_activity(customer_id, activity_type, activity_time) with activity_type = 'New Signup'.
		CREATE TABLE customer_activity (
			customer_id INT,
			activity_type VARCHAR(50),
			activity_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER welcome_customer
		AFTER INSERT ON customers
		FOR EACH ROW
		BEGIN
			INSERT INTO customer_activity(customer_id, activity_type, activity_time)
			VALUES(NEW.customer_id, 'New Signup', NOW());
		END //
		DELIMITER ;

--  Create an AFTER INSERT trigger on products that inserts a row into inventory_log(product_id, stock_added, log_time) recording the initial stock value.
			CREATE TABLE inventory_log (
				product_id INT,
				stock_added INT,
				log_time DATETIME
			);
			DELIMITER //
			CREATE TRIGGER log_stock
			AFTER INSERT ON products
			FOR EACH ROW
			BEGIN
				INSERT INTO inventory_log(product_id, stock_added, log_time)
				VALUES(NEW.product_id, NEW.stock, NOW());
			END //
			DELIMITER ;

--  Create a BEFORE UPDATE trigger on deliveries that prevents updating delivery_status to 'Delivered' if delivery_days is NULL.
		DELIMITER //
		CREATE TRIGGER check_delivery_days
		BEFORE UPDATE ON deliveries
		FOR EACH ROW
		BEGIN
			IF NEW.delivery_status = 'Delivered' 
			   AND NEW.delivery_days IS NULL THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot mark as Delivered without delivery_days';
			END IF;
		END //
		DELIMITER ;

--  Create a BEFORE UPDATE trigger on customers that blocks updating the mobile_no if the new number already exists in another customer record.
		DELIMITER //
		CREATE TRIGGER duplicate_mobile
		BEFORE UPDATE ON customers
		FOR EACH ROW
		BEGIN
			IF EXISTS (
				SELECT 1 FROM customers
				WHERE mobile_no = NEW.mobile_no
				AND customer_id <> OLD.customer_id
			) THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Mobile number already exists';
			END IF;
		END //
		DELIMITER ;

--  Create a BEFORE UPDATE trigger on products that prevents reducing stock by more than 50 units in a single update operation.
		DELIMITER //
		CREATE TRIGGER limit_stock
		BEFORE UPDATE ON products
		FOR EACH ROW
		BEGIN
			IF (OLD.stock - NEW.stock) > 50 THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot reduce stock by more than 50 units';
			END IF;
		END //
		DELIMITER ;

-- Create an AFTER UPDATE trigger on deliveries that logs changes of delivery_partner into a table delivery_partner_change(order_id, old_partner, new_partner, change_time).
		CREATE TABLE delivery_partner_change (
			order_id INT,
			old_partner VARCHAR(50),
			new_partner VARCHAR(50),
			change_time DATETIME
		);

		DELIMITER //
		CREATE TRIGGER log_partner_change
		AFTER UPDATE ON deliveries
		FOR EACH ROW
		BEGIN
			IF OLD.delivery_partner <> NEW.delivery_partner THEN
					INSERT INTO delivery_partner_change
				(order_id, old_partner, new_partner, change_time)
				VALUES
				(NEW.order_id, OLD.delivery_partner, NEW.delivery_partner, NOW());
			END IF;
		END //
		DELIMITER ;

--  Create an AFTER UPDATE trigger on customers that logs address changes into customer_address_log(customer_id, old_address, new_address, change_time).
		CREATE TABLE customer_address_log (
			customer_id INT,
			old_address VARCHAR(255),
			new_address VARCHAR(255),
			change_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER log_address_change
		AFTER UPDATE ON customers
		FOR EACH ROW
		BEGIN
			IF OLD.address <> NEW.address THEN
				INSERT INTO customer_address_log
				VALUES (NEW.customer_id, OLD.address, NEW.address, NOW());
			END IF;
		END //
		DELIMITER ;

-- Create an AFTER UPDATE trigger on products that logs price changes into price_change_log(product_id, old_price, new_price, change_time) only if price actually changed.
		CREATE TABLE price_change_log (
			product_id INT,
			old_price DECIMAL(10,2),
			new_price DECIMAL(10,2),
			change_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER log_price_change
		AFTER UPDATE ON products
		FOR EACH ROW
		BEGIN
			IF OLD.price <> NEW.price THEN
				INSERT INTO price_change_log
				VALUES (NEW.product_id, OLD.price, NEW.price, NOW());
			END IF;
		END //
		DELIMITER ;

--  Create a BEFORE DELETE trigger on customers that prevents deletion if the customer has any records in orders.
		DELIMITER //
		CREATE TRIGGER customer_delete
		BEFORE DELETE ON customers
		FOR EACH ROW
		BEGIN
			IF EXISTS (
				SELECT 1 FROM orders
				WHERE customer_id = OLD.customer_id
			) THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delete customer with existing orders';
			END IF;
		END //
		DELIMITER ;

--  Create a BEFORE DELETE trigger on products that prevents deletion if the product stock is greater than 0.
		DELIMITER //
		CREATE TRIGGER product_delete
		BEFORE DELETE ON products
		FOR EACH ROW
		BEGIN
			IF OLD.stock > 0 THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delete product with available stock';
			END IF;
		END //
		DELIMITER ;
        
-- Create a BEFORE DELETE trigger on deliveries that prevents deletion if delivery_status = 'In Transit'.
		DELIMITER //
		CREATE TRIGGER prevent_delivery_delete
		BEFORE DELETE ON deliveries
		FOR EACH ROW
		BEGIN
			IF OLD.delivery_status = 'In Transit' THEN
				SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Cannot delete delivery that is In Transit';
			END IF;
		END //
		DELIMITER ;

-- Create an AFTER DELETE trigger on reviews that inserts deleted review details into deleted_reviews_log(review_id, product_id, customer_id, deleted_time).
		CREATE TABLE deleted_reviews_log (
			review_id INT,
			product_id INT,
			customer_id INT,
			deleted_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER log_deleted_review
		AFTER DELETE ON reviews
		FOR EACH ROW
		BEGIN
			INSERT INTO deleted_reviews_log
			VALUES (OLD.review_id, OLD.product_id, OLD.customer_id, NOW());
		END //
		DELIMITER ;

--  Create an AFTER DELETE trigger on products that inserts deleted product information into product_archive(product_id, product_name, deleted_time).
		CREATE TABLE product_archive (
			product_id INT,
			product_name VARCHAR(255),
			deleted_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER archive_deleted_product
		AFTER DELETE ON products
		FOR EACH ROW
		BEGIN
			INSERT INTO product_archive
			VALUES (OLD.product_id, OLD.product_name, NOW());
		END //
		DELIMITER ;

-- create an AFTER DELETE trigger on sellers that logs seller removal into seller_removal_log(seller_id, seller_name, removal_time).
		CREATE TABLE seller_removal_log (
			seller_id INT,
			seller_name VARCHAR(255),
			removal_time DATETIME
		);
		DELIMITER //
		CREATE TRIGGER log_seller_removal
		AFTER DELETE ON sellers
		FOR EACH ROW
		BEGIN
			INSERT INTO seller_removal_log
			VALUES (OLD.seller_id, OLD.seller_name, NOW());
		END //
		DELIMITER ;



























   









