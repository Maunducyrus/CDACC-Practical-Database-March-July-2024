-- CREATE DATABASE Business;
-- USE Business;

-- CREATE TABLE Accounting (
--     deptno INT PRIMARY KEY,
--     dname VARCHAR(50),
--     loc VARCHAR(50)
-- );
-- SELECT * FROM Accounting

-- CREATE TABLE Employer (
--     empno INT PRIMARY KEY,
--     ename VARCHAR(50),
--     job VARCHAR(50),
--     mgr INT,
--     hiredate DATE,
--     salary DECIMAL(10, 2),
--     comm DECIMAL(10, 2),
--     deptno INT,
--     FOREIGN KEY (deptno) REFERENCES Accounting(deptno)
-- );

-- SELECT * FROM Employer

-- INSERT INTO Accounting (deptno, dname, loc) VALUES
-- (10, 'Accounting', 'New York'),
-- (20, 'Research', 'Dallas'),
-- (30, 'Sales', 'Chicago');

-- INSERT INTO Employer (empno, ename, job, mgr, hiredate, salary, comm, deptno) VALUES
-- (7369, 'Smith', 'Clerk', 7902, '1980-12-17', 800.00, NULL, 20),
-- (7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600.00, 300.00, 30),
-- (7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250.00, 500.00, 30);

-- Update Employee Salary by 15% Whose Job Experience is Greater than 10 Years

-- UPDATE Employer
-- SET salary = salary * 1.15
-- WHERE DATEDIFF(YEAR, hiredate, GETDATE()) > 10;

-- Delete Employees Who Completed 30 Years of Service

-- DELETE FROM Employer
-- WHERE DATEDIFF(YEAR, hiredate, GETDATE()) >= 30;

-- ******Create a View Containing Employee Names and Their Manager
 
           --  Create a View Containing Employee Names and Their Manager 
-- CREATE VIEW EmpManager AS
-- SELECT e1.ename AS EmployeeName, e2.ename AS ManagerName
-- FROM Employer e1
-- LEFT JOIN Employer e2 ON e1.mgr = e2.empno;

           -- Perform Queries Using Tables DEPARTMENTS and EMPLOYEES
-- SELECT e.ename AS EmployeeName, d.dname AS DepartmentName
-- FROM Employer e
-- LEFT JOIN Dept d ON e.deptno = d.deptno;

            -- b. Display Employee's Name and Department Name by Implementing a Right Outer Join
-- SELECT e.ename AS EmployeeName, d.dname AS DepartmentName
-- FROM Employer e
-- RIGHT JOIN Dept d ON e.deptno = d.deptno;

            -- c.Display the Details of Those Who Draw a Salary Greater than the Average Salary
-- SELECT *
-- FROM Employer
-- WHERE salary > (SELECT AVG(salary) FROM Employer);

             -- Create Sales Table in the Enterprise Database
             -- a. Create the Sales Table and Insert Five Records
-- USE Business;

-- CREATE TABLE Sales (
--     SalesNo INT PRIMARY KEY,
--     Salesname VARCHAR(50),
--     Branch VARCHAR(50),
--     Salesamount DECIMAL(10, 2),
--     DOB DATE
-- );
-- SELECT * FROM Sales

-- INSERT INTO Sales (SalesNo, Salesname, Branch, Salesamount, DOB) VALUES
-- (1, 'John Doe', 'New York', 1500.00, '1985-12-21'),
-- (2, 'Jane Smith', 'Chicago', 2000.00, '1990-12-05'),
-- (3, 'Michael Brown', 'Dallas', 2500.00, '1982-12-15'),
-- (4, 'Emily Davis', 'New York', 1800.00, '1995-06-22'),
-- (5, 'David Wilson', 'Chicago', 2200.00, '1989-07-30');

-- 				b. Calculate Total Salesamount in Each Branch
-- SELECT Branch, SUM(Salesamount) AS TotalSales
-- FROM Sales
-- GROUP BY Branch;

                -- c. Calculate Average Salesamount in Each Branch
-- SELECT Branch, AVG(Salesamount) AS AverageSales
-- FROM Sales
-- GROUP BY Branch;

--                     d. Display All the Salesmen, DOB Who Are Born in December
-- SELECT Salesname, CONVERT(VARCHAR, DOB, 6) AS DOB
-- FROM Sales
-- WHERE MONTH(DOB) = 12;

-- TASK 3
-- Create a Prototype Database for IGNOU Library Management System
-- CREATE DATABASE IGNOU_Library;

USE IGNOU_Library;

-- CREATE TABLE BookRecords (
--     AccessionNumber INT PRIMARY KEY,
--     ISBNNumber VARCHAR(20)
-- );

-- SELECT * FROM BookRecords;

-- CREATE TABLE Books (
--     ISBNNumber VARCHAR(20) PRIMARY KEY,
--     Author VARCHAR(50),
--     Publisher VARCHAR(50),
--     Price DECIMAL(10, 2)
-- );

-- CREATE TABLE Members (
--     MemberId INT PRIMARY KEY,
--     MemberName VARCHAR(50),
--     MaxBooks INT
-- );

-- CREATE TABLE BookIssue (
--     MemberId INT,
--     AccessionNumber INT,
--     IssueDate DATE,
--     ReturnDate DATE,
--     PRIMARY KEY (MemberId, AccessionNumber),
--     FOREIGN KEY (MemberId) REFERENCES Members(MemberId),
--     FOREIGN KEY (AccessionNumber) REFERENCES BookRecords(AccessionNumber)
-- );

--                 Insert records into BookRecords table
-- INSERT INTO BookRecords (AccessionNumber, ISBNNumber) VALUES
-- (1, '978-3-16-148410-0'),
-- (2, '978-1-56619-909-4'),
-- (3, '978-0-596-52068-7');

                     -- Insert records into Books table
-- INSERT INTO Books (ISBNNumber, Author, Publisher, Price) VALUES
-- ('978-3-16-148410-0', 'Author One', 'Publisher A', 50.00),
-- ('978-1-56619-909-4', 'Author Two', 'Publisher B', 60.00),
-- ('978-0-596-52068-7', 'Author Three', 'Publisher C', 70.00);

--                        -- Insert records into Members table
-- INSERT INTO Members (MemberId, MemberName, MaxBooks) VALUES
-- (101, 'Alice Johnson', 5),
-- (102, 'Bob Smith', 3),
-- (103, 'Charlie Brown', 4);

                          -- Insert records into BookIssue table
-- INSERT INTO BookIssue (MemberId, AccessionNumber, IssueDate, ReturnDate) VALUES
-- (101, 1, '2024-01-10', '2024-02-10'),
-- (102, 2, '2024-01-15', '2024-02-15'),
-- (103, 3, '2024-01-20', '2024-02-20');


-- Display structure of BookRecords table
-- EXEC sp_help 'BookRecords';

-- Display structure of Books table
-- EXEC sp_help 'Books';

-- Display structure of Members table
-- EXEC sp_help 'Members';

-- Display structure of BookIssue table
-- EXEC sp_help 'BookIssue';


-- SELECT * FROM Books;
-- SELECT * FROM Members

SELECT AccessionNumber
FROM BookRecords
WHERE AccessionNumber NOT IN (SELECT AccessionNumber FROM BookIssue WHERE ReturnDate IS NULL); 



