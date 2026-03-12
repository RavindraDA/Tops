create database office;
use office;
 drop database office;

create table worker
(worker_id int auto_increment primary key,
first_name varchar(30),
last_name varchar(30),
salary decimal(10,2),
joining_date datetime ,
department varchar(20)
);

insert into worker (first_name,last_name,salary,joining_date,department)
values('Monika','Arora',100000,'2021-02-20 9:00:00','HR'),
	  ('Nihanka','Verma',80000,'2014-06-11 9:00:00','Admin'),
	  ('Vishal','Singhal',300000,'2014-02-20 9:00:00','HR'),
	  ('Amitabh','Singh',500000,'2014-02-20 9:00:00','Admin'),
	  ('Vivek','Bhati',500000,'2014-06-11 9:00:00','Admin'),
	  ('Vipul','Diwan',200000,'2014-06-11 9:00:00','Account'),
      ('Satish','Kumar',75000,'2014-01-20 9:00:00','Account'),
	  ('Geetika','Chauhan',90000,'2014-04-11 9:00:00','Admin'),
	  ('Rahul','Sharma',120000,'2015-01-01 9:00:00','HR'),
	('Pooja','Patel',95000,'2015-01-02 9:00:00','Admin'),
	('Karan','Mehta',210000,'2015-01-03 9:00:00','Account'),
	('Sneha','Kapoor',87000,'2015-01-04 9:00:00','HR'),
	('Arjun','Malhotra',175000,'2015-01-05 9:00:00','Admin'),
	('Neha','Joshi',99000,'2015-01-06 9:00:00','Account'),
	('Rohit','Agarwal',160000,'2015-01-07 9:00:00','HR'),
	('Simran','Kaur',110000,'2015-01-08 9:00:00','Admin'),
	('Manish','Tiwari',140000,'2015-01-09 9:00:00','Account'),
	('Anjali','Saxena',92000,'2015-01-10 9:00:00','HR'),
	('Varun','Gupta',230000,'2015-01-11 9:00:00','Admin'),
	('Isha','Bansal',105000,'2015-01-12 9:00:00','Account'),
	('Deepak','Yadav',88000,'2015-01-13 9:00:00','HR'),
	('Ritika','Arora',97000,'2015-01-14 9:00:00','Admin'),
	('Sandeep','Nair',150000,'2015-01-15 9:00:00','Account'),
	('Kavita','Reddy',91000,'2015-01-16 9:00:00','HR'),
	('Tarun','Khanna',200000,'2015-01-17 9:00:00','Admin'),
	('Priya','Desai',98000,'2015-01-18 9:00:00','Account'),
	('Aditya','Chopra',170000,'2015-01-19 9:00:00','HR'),
	('Meena','Pillai',86000,'2015-01-20 9:00:00','Admin'),
	('Nitin','Kulkarni',145000,'2015-01-21 9:00:00','Account'),
	('Shalini','Mishra',93000,'2015-01-22 9:00:00','HR'),
	('Aakash','Jain',155000,'2015-01-23 9:00:00','Admin'),
	('Komal','Shah',89000,'2015-01-24 9:00:00','Account'),
	('Harsh','Soni',165000,'2015-01-25 9:00:00','HR'),
	('Divya','Bhatt',94000,'2015-01-26 9:00:00','Admin'),
	('Lokesh','Rana',135000,'2015-01-27 9:00:00','Account'),
	('Tanya','Kapoor',99000,'2015-01-28 9:00:00','HR'),
	('Ramesh','Chandra',142000,'2015-01-29 9:00:00','Admin'),
	('Alok','Dubey',158000,'2015-01-30 9:00:00','Account'),
	('Vikas','Sharma',120000,'2015-02-01 9:00:00','HR'),
	('Priti','Patel',95000,'2015-02-02 9:00:00','Admin'),
	('Kunal','Mehta',210000,'2015-02-03 9:00:00','Account'),
	('Sonia','Kapoor',87000,'2015-02-04 9:00:00','HR'),
	('Aman','Malhotra',175000,'2015-02-05 9:00:00','Admin'),
	('Nisha','Joshi',99000,'2015-02-06 9:00:00','Account'),
	('Rakesh','Agarwal',160000,'2015-02-07 9:00:00','HR'),
	('Suman','Kaur',110000,'2015-02-08 9:00:00','Admin'),
	('Mahesh','Tiwari',140000,'2015-02-09 9:00:00','Account'),
	('Anita','Saxena',92000,'2015-02-10 9:00:00','HR'),
	('Vivek','Gupta',230000,'2015-02-11 9:00:00','Admin'),
	('Ishita','Bansal',105000,'2015-02-12 9:00:00','Account'),
	('Dheeraj','Yadav',88000,'2015-02-13 9:00:00','HR'),
	('Rohini','Arora',97000,'2015-02-14 9:00:00','Admin'),
    ('Rohan','Sharma',125000,'2016-01-01 9:00:00','IT'),
('Pooja','Patel',98000,'2016-01-02 9:00:00','Sales'),
('Kunal','Mehta',210000,'2016-01-03 9:00:00','Finance'),
('Sneha','Kapoor',90000,'2016-01-04 9:00:00','Marketing'),
('Arjun','Malhotra',175000,'2016-01-05 9:00:00','IT'),
('Neha','Joshi',99000,'2016-01-06 9:00:00','Sales'),
('Rohit','Agarwal',160000,'2016-01-07 9:00:00','Finance'),
('Simran','Kaur',110000,'2016-01-08 9:00:00','Marketing'),
('Manish','Tiwari',140000,'2016-01-09 9:00:00','IT'),
('Anjali','Saxena',92000,'2016-01-10 9:00:00','Sales'),
('Varun','Gupta',230000,'2016-01-11 9:00:00','Finance'),
('Isha','Bansal',105000,'2016-01-12 9:00:00','Marketing'),
('Deepak','Yadav',88000,'2016-01-13 9:00:00','IT'),
('Ritika','Arora',97000,'2016-01-14 9:00:00','Sales'),
('Sandeep','Nair',150000,'2016-01-15 9:00:00','Finance'),

('Kavita','Reddy',91000,'2016-01-16 9:00:00','Legal'),
('Tarun','Khanna',200000,'2016-01-17 9:00:00','Legal'),

('Priya','Desai',98000,'2016-01-18 9:00:00','Support'),
('Aditya','Chopra',170000,'2016-01-19 9:00:00','Support'),
('Meena','Pillai',86000,'2016-01-20 9:00:00','Support');


select * from worker;

-- queries

/* 1)query to print all Worker details from the Worker table order by FIRST_NAME
     Ascending and DEPARTMENT Descending. */
     
     select * from worker
     order by First_name asc,department desc;

/* 2) query to print details for Workers with the first names “Vipul” and “Satish”
      from the Worker table. */
      
      select * from worker
      where first_name in ('Vipul','Satish');
      
      
      -- second way
	  select * from worker
      where first_name='Vipul' or first_name='Satish';
      
/*3)query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
	contains six alphabets. */

     select * from worker 
     where first_name like '%h'
     and length(first_name)=6;

/* 4)query to print details of the Workers whose SALARY lies between 1. */


/* 5) query to fetch duplicate records having matching data in some fields of a table. */
	select department,count(*) as count
	from worker 
	group by department 
	having count(*)>1;

-- for full row details 
	select * from worker
	where department in (
	select department 
	from worker 
	group by department
	having count(*)>1);

/*6) query to show the top 6 records of a table.*/
	select * from worker
	order by salary desc
	limit 6;


/*7)query to fetch the departments that have less than five people in them.*/
    select department,count(*) as department_worker
	from worker 
	group by department 
	having count(*)<5;

/*8)query to show all departments along with the number of people in there.*/
    select department,count(*) as total_worker_in_dept
	from worker 
	group by department ;


/*9) query to print the name of employees having the highest salary in each
department. */

	select first_name,department,salary from 
	( select first_name,department,salary,
	dense_rank() over (partition by department order by salary desc) as rnk
	from worker
	)t
	where rnk=1;
    
    
    
CREATE TABLE Student (
    StdID INT PRIMARY KEY,
    StdName VARCHAR(50),
    Sex VARCHAR(10),
    Percentage INT,
    Class INT,
    Section CHAR(1),
    Stream VARCHAR(20),
    DOB DATE
);
    
    
    INSERT INTO Student VALUES
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'STUTI MISHRA', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSHA AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');
    
    select * from Student;
    
    
    -- queries
    
-- 1)To display all the records form STUDENT table. 
     SELECT * FROM student ;
     
-- 2. To display any name and date of birth from the table STUDENT.
	SELECT StdName, DOB
	FROM student ;
    
 -- 3. To display all students record where percentage is greater of equal to 80 FROM student table.
    SELECT * FROM student
   WHERE percentage >= 80;
   
-- 4. To display student name, stream and percentage where percentage of student is more than 80
   SELECT  StdName, Stream, Percentage
   from student
   WHERE percentage > 80;
   
-- 5. To display all records of science students whose percentage is more than 75 form student table.
   SELECT * from  student
   WHERE 
   Stream = 'Science' AND percentage > 75; 
    
