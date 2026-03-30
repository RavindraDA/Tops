USE flipkart_db;

create table Company
                (CompanyID int,
			     CompanyName varchar(50),
                 street varchar(50),
                 City varchar(50),
                 State varchar(20),
                 zip varchar(10)
          );
-- 1) Statement to create the Contact table
create table Contact(
               ContactID int primary key,
			   CompanyID int,
               FirstName varchar(45),
               Lastname varchar(45),
               Street varchar(45),
               City varchar(45),
               State varchar(20),
               Zip varchar(10),
               Ismain boolean,
               Email varchar(45),
               Phone varchar(12));
               
               select * from Contact;
-- 2) Statement to create the Employee table
    create table Employee10(
                 EmployeelD INT,
				 FirstName VARCHAR(45),
				 LastName VARCHAR(45),
                 Salary DECIMAL(10,2),
                 HireDate DATE,
                 JobTitle VARCHAR(25),
				 Email VARCHAR(45),
				 Phone VARCHAR(12) );
                 select * from Employee10;
                 
-- 3) Statement to create the ContactEmployee table
      create table ContactEmployee(
                            ContactEmployeeID INT,
                            ContactID INT,
							EmployeID INT,
                            ContactDate DATE,
							Description VARCHAR(100));
			select * from ContactEmployee;
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014).

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number
-- to 215-555-8800
	update Employee10
    set Phone = '215-555-8800'
    where FirstName = 'Lesley' and LastName = 'Bland';
    
-- 5) In the Company table, the statement that changes the name of “Urban
-- Outfitters, Inc.” to “Urban Outfitters” .
  update Company 
  set Companyname = 'Urban Outfitters'
  where Companyname ='Urban Outfitters,Inc';
  
-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
-- event with Jack Lee (one statement).
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.
DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 101;

-- 7) Write the SQL SELECT query that displays the names of the employees that
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in
-- MySQL Workbench. Copy the results below as well.
SELECT e.FirstName, e.LastName
FROM Employee10 e
JOIN ContactEmployee ce ON e.EmployeelD = ce.EmployeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company comp ON c.CompanyID = comp.CompanyID
WHERE comp.CompanyName = 'Toll Brothers';

-- 8) What is the significance of “%” and “_” operators in the LIKE statement?
-- % - Represents zero, one, or multiple characters
-- _ - Represents exactly one character

-- 9) Explain normalization in the context of databases.
-- Normalization is the process of organizing data in a database to:
-- Reduce data redundancy
-- Improve data integrity
-- Ensure efficient storage

-- 10) What does a join in MySQL mean?
-- A JOIN is used to combine rows from two or more tables based on a related column.

-- 11)What do you understand about DDL, DCL, and DML in MySQL?
-- DDL (Data Definition Language)
-- Used to define or modify database structure:
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE

-- DML (Data Manipulation Language)
-- Used to manage data inside tables:
-- SELECT
-- INSERT
-- UPDATE
-- DELETE

-- DCL (Data Control Language)
-- Used to control access/permissions:
-- GRANT
-- REVOKE

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some
-- common types of joins?
-- The JOIN clause is used to combine data from multiple tables in a single query based on related columns.

-- INNER JOIN
-- LEFT JOIN (LEFT OUTER JOIN)
-- RIGHT JOIN (RIGHT OUTER JOIN)
-- FULL JOIN (FULL OUTER JOIN) 
-- CROSS JOIN