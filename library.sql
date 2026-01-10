-- Library Management System – Full SQL Script
-- Created by [MANOHAR CHOUDHARY]
-- For portfolio demonstration

THIS FILE WILL HAVE MY SQL CODE:

-- CREATE AND INSERT QUERIES :
CREATE DATABASE sql_portfolio_database;

USE sql_portfolio_database;

CREATE TABLE authors_table (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_year YEAR
);

CREATE TABLE books_table (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    publish_year YEAR NOT NULL,
    author_id INT NOT NULL,
    copies_available SMALLINT,
    FOREIGN KEY (author_id)
        REFERENCES authors_table(author_id)
);

CREATE TABLE members_table (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    join_date DATE
);

ALTER TABLE authors_table 
MODIFY birth_year INT; 

ALTER TABLE books_table 
MODIFY publish_year INT;

ALTER TABLE members_table
ADD email VARCHAR(100);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books_table(book_id),
    FOREIGN KEY (member_id) REFERENCES members_table(member_id)
);


 INSERT INTO authors_table (author_id, first_name, last_name, birth_year) 
 VALUES
(1, 'Jane', 'Austen', 1775),
(2, 'George', 'Orwell', 1903),
(3, 'J.K.', 'Rowling', 1965),
(4, 'Agatha', 'Christie', 1890),
(5, 'Mark', 'Twain', 1835),
(6, 'Harper', 'Lee', 1926),
(7, 'Munshi', 'Premchand', 1880),
(8, 'Nagarjun', 'Vaidyanath Mishra', 1911),
(9, 'Rabindranath', 'Tagore', 1861),
(10, 'R.K.', 'Narayan', 1906),
(11, 'Mahadevi', 'Varma', 1907);

INSERT INTO books_table(book_id, title, publish_year, author_id, copies_available) VALUES
(1, 'Pride and Prejudice', 1813, 1, 3),
(2, 'Sense and Sensibility', 1811, 1, 2),
(3, '1984', 1949, 2, 0),
(4, 'Animal Farm', 1945, 2, 1),
(5, 'Harry Potter and the Philosopher''s Stone', 1997, 3, 1),
(6, 'Harry Potter and the Chamber of Secrets', 1998, 3, 0),
(7, 'Harry Potter and the Prisoner of Azkaban', 1999, 3, 2),
(8, 'Murder on the Orient Express', 1934, 4, 4),
(9, 'And Then There Were None', 1939, 4, 0),
(10, 'The Adventures of Huckleberry Finn', 1884, 5, 2),
(11, 'The Adventures of Tom Sawyer', 1876, 5, 3),
(12, 'To Kill a Mockingbird', 1960, 6, 1),
(13, 'Godaan', 1936, 7, 4),
(14, 'Gaban', 1931, 7, 2),
(15, 'Rashmirathi', 1952, 8, 3),
(16, 'Gitanjali', 1910, 9, 5),
(17, 'Malgudi Days', 1943, 10, 2),
(18, 'Yama', 1930, 11, 1);

INSERT INTO members_table (member_id, first_name, last_name, join_date, email) VALUES
(1, 'Alice', 'Johnson', '2024-01-15', 'alice@email.com'),
(2, 'Bob', 'Smith', '2024-02-20', 'bob@email.com'),
(3, 'Carol', 'Davis', '2024-03-10', 'carol@email.com'),
(4, 'David', 'Wilson', '2024-04-05', 'david@email.com'),
(5, 'Eva', 'Brown', '2024-05-12', 'eva@email.com'),
(6, 'Frank', 'Miller', '2024-06-18', 'frank@email.com'),
(7, 'Grace', 'Taylor', '2024-07-22', 'grace@email.com'),
(8, 'Henry', 'Anderson', '2024-08-30', 'henry@email.com'),
(9, 'Ivy', 'Thomas', '2024-09-14', 'ivy@email.com'),
(10, 'Jack', 'White', '2024-10-01', 'jack@email.com'),
(11, 'Rahul', 'Sharma', '2024-10-10', 'rahul@email.com'),
(12, 'Priya', 'Verma', '2024-10-12', 'priya@email.com'),
(13, 'Amit', 'Kumar', '2024-10-15', 'amit@email.com'),
(14, 'Neha', 'Singh', '2024-10-18', 'neha@email.com'),
(15, 'Anjali', 'Patel', '2024-10-20', 'anjali@email.com');


INSERT INTO borrowed_books (borrow_id, book_id, member_id, borrow_date, due_date, return_date) VALUES
-- Currently borrowed (return_date NULL)
(1, 1, 1, '2025-12-01', '2026-01-04', NULL),        -- Alice - Pride (due today!)
(2, 3, 2, '2025-12-15', '2026-01-18', NULL),        -- Bob - 1984
(3, 5, 3, '2025-12-20', '2026-01-23', NULL),        -- Carol - Harry Potter 1
(4, 8, 4, '2025-12-25', '2026-01-28', NULL),        -- David - Murder Orient
(5, 10, 5, '2026-01-01', '2026-02-04', NULL),       -- Eva - Huckleberry

-- Overdue (due_date < 2026-01-04, return_date NULL)
(6, 9, 6, '2025-11-20', '2025-12-24', NULL),        -- Frank - And Then There Were None (OVERDUE)
(7, 6, 7, '2025-11-25', '2025-12-29', NULL),        -- Grace - Harry Potter 2 (OVERDUE)

-- Returned on time
(8, 2, 1, '2025-11-10', '2025-12-14', '2025-12-12'), -- Alice returned early
(9, 4, 2, '2025-11-15', '2025-12-19', '2025-12-18'), -- Bob
(10, 7, 3, '2025-11-20', '2025-12-24', '2025-12-23'),-- Carol
(11, 11, 4, '2025-11-25', '2025-12-29', '2025-12-28'), -- David

-- Returned late
(12, 12, 5, '2025-11-05', '2025-12-09', '2025-12-15'), -- Eva late
(13, 1, 6, '2025-11-01', '2025-12-05', '2025-12-10'),  -- Frank late

-- Multiple borrows by the same member
(14, 3, 1, '2025-11-30', '2025-12-04', '2025-12-03'),  -- Alice borrowed 1984 early
(15, 5, 2, '2025-12-10', '2025-12-14', '2025-12-13'),  -- Bob
(16, 8, 3, '2025-12-05', '2025-12-09', '2025-12-08'),  -- Carol
(17, 9, 8, '2025-11-28', '2025-12-02', '2025-12-01'),  -- Henry
(18, 10, 9, '2025-12-28', '2026-01-01', '2026-01-02'), -- Ivy late
(19, 4, 10, '2025-12-22', '2026-01-25', '2026-01-24'), -- Jack
(20, 12, 7, '2025-12-28', '2026-01-31', '2026-01-30');  -- Grace

	
-- 10 BUSINESS PROBLEMS HAVE TO BE SOLVED.

-- Q1.Currently Borrowed Books Report
-- List all books that are currently out (not returned) with book title, member full name, borrow date, and due date. Order by due date (soonest first).
-- Q2.Overdue Books Alert
-- Find all overdue books (due_date < '2026-01-05' and not returned) with book title, member full name, due date, and number of days overdue.
-- Q3.Most Popular Books
-- Show the top 5 most borrowed books of all time (count total borrows per book, even if returned), with title and borrow count.
-- Q4.Inactive Members
-- List members who have never borrowed any book (no record in borrowed_books).
-- Q5.Top Authors by Popularity
-- Rank authors by total number of times their books were borrowed. Show the author's full name and total borrows.
-- Q6.Books Never Borrowed
-- Find all books that have never been borrowed (no entry in borrowed_books).
-- Q7.Heavy Borrowers
-- Show members who currently have more than 3 books borrowed (return_date IS NULL).
-- Q8.Potential Fine Revenue
-- Calculate potential fines for all overdue books. Assume ₹10 per day overdue. Show member name, book title, days overdue, and fine amount.
-- Q9.Monthly Borrowing Trend
-- Show the number of books borrowed each month (from borrow_date). Group by year and month.
-- Q10.Most Diverse Readers
-- Find the member(s) who have borrowed books from the largest number of different authors.

-- PROBLEM(1)- Q1.Currently Borrowed Books Report
-- List all books that are currently out (not returned) with book title, member full name, borrow date, and due date. Order by due date (soonest first).
-- QUERY 1: 
  SELECT 
	  b.title AS books_title,
	  CONCAT(m.first_name,' ',m.last_name) AS members_name,
    br.due_date AS due_date
FROM borrowed_books br
JOIN books_table b ON br.book_id = b.book_id
JOIN members_table m ON br.member_id = m.member_id
WHERE br.return_date IS NULL
ORDER BY br.due_date ASC;

-- PROBLEM(2)- Q2.Overdue Books Alert
-- Find all overdue books (due_date < '2026-01-05' and not returned) with book title, member full name, due date, and number of days overdue.
-- QUERY 2: 
SELECT 
	CONCAT(m.first_name,' ',m.last_name) AS members_name,
	b.title AS book_title,
    br.due_date AS due_date,
    DATEDIFF('2026-01-05', br.due_date) AS days_overdue
FROM borrowed_books br
JOIN books_table b ON br.book_id = b.book_id
JOIN members_table m ON br.member_id = m.member_id
WHERE br.due_date < '2026-01-04'
AND br.return_date IS NULL
ORDER BY days_overdue DESC;


-- PROBLEM(3)- Q3.Overdue Books Alert
-- Find all overdue books (due_date < '2026-01-05' and not returned) with book title, member full name, due date, and number of days overdue.
-- QUERY 3: 
SELECT 
    b.title AS book_title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    COUNT(br.book_id) AS borrow_count
FROM borrowed_books AS br
JOIN books_table AS b ON br.book_id = b.book_id
JOIN authors_table AS a ON b.author_id = a.author_id
GROUP BY b.book_id, b.title, a.first_name, a.last_name
ORDER BY borrow_count DESC
LIMIT 5;

-- PROBLEM(4)- Q4.Inactive Members
-- List members who have never borrowed any book (no record in borrowed_books).
-- QUERY 4: 

SELECT 
	
	CONCAT(m.first_name,' ',m.last_name) AS member_name,
    m.join_date
FROM  members_table AS m
LEFT JOIN  borrowed_books  AS br
ON m.member_id = br.member_id
WHERE borrow_date IS NULL
GROUP BY m.member_id, m.first_name, m.last_name, m.join_date
ORDER BY m.join_date ASC
;

-- FOR THIS QUESTION, 'NOT EXISTS' CAN ALSO BE USED

-- QUERY(4) THIS QUERY INVOLVES THE USE OF A SUBQUERY IN MYSQL

SELECT
    CONCAT(first_name, ' ', last_name) AS member_name,
    join_date
FROM members_table
WHERE member_id NOT IN (
    SELECT DISTINCT member_id 
    FROM borrowed_books 
    WHERE member_id IS NOT NULL
)
ORDER BY join_date ASC;

-- PROBLEM(5)- Q5.Top Authors by Popularity
-- Rank authors by the total number of times their books were borrowed. Show the author's full name and total borrows.
-- QUERY(5) 

SELECT 
	CONCAT(a.first_name,' ',a.last_name) AS author_name,
	COUNT(br.book_id) AS total_borrows
FROM borrowed_books AS br
JOIN books_table AS b ON br.book_id = b.book_id
JOIN authors_table AS a ON b.author_id = a.author_id 
GROUP BY a.author_id, a.first_name, a.last_name
ORDER BY total_borrows DESC
LIMIT 10;

-- PROBLEM(6)- Q6.Books Never Borrowed
-- Find all books that have never been borrowed (no entry in borrowed_books).
-- QUERY(6) 

SELECT 
	b.title AS book_title,
	CONCAT(a.first_name,' ',a.last_name) AS author_name,
	b.copies_available 
FROM books_table AS b
LEFT JOIN borrowed_books AS br ON b.book_id = br.book_id
JOIN authors_table AS a ON b.author_id = a.author_id
WHERE br.book_id IS NULL
ORDER BY copies_available DESC
;


-- PROBLEM(7)- Q7.Heavy Borrowers
-- Show members who currently have more than 3 books borrowed (return_date IS NULL).
-- QUERY(7) 

SELECT 
    CONCAT(m.first_name, ' ', m.last_name) AS member_name
FROM members_table m
JOIN borrowed_books br ON m.member_id = br.member_id
WHERE br.return_date IS NULL
GROUP BY m.member_id, m.first_name, m.last_name
HAVING COUNT(br.book_id) > 3;

-- PROBLEM(8)- Q8.Potential Fine Revenue
-- Calculate potential fines for all overdue books. Assume ₹10 per day overdue. Show member name, book title, days overdue, and fine amount.
-- QUERY(8) 

SELECT 
CONCAT(m.first_name,' ',m.last_name) AS  member_name,
b.title AS book_title,
br.due_date AS due_date,
DATEDIFF('2026-1-08',br.due_date) AS days_overdue,
DATEDIFF('2026-1-08',br.due_date) *10 AS total_fine_inr
FROM borrowed_books br
JOIN members_table m ON m.member_id = br.member_id
JOIN books_table b ON br.book_id = b.book_id
WHERE br.return_date IS NULL AND
br.due_date <'2026-01-08'
ORDER BY total_fine_inr DESC;



-- PROBLEM(9)- -- Q9.Monthly Borrowing Trend
-- Show the number of books borrowed each month (from borrow_date). Group by year and month.
-- QUERY(9) 

SELECT 
	YEAR(br.borrow_date) AS year,
	MONTH(br.borrow_date) AS borrow_month,
	MONTHNAME(br.borrow_date) AS month_name,
	COUNT(*) AS total_borrows
FROM borrowed_books br
WHERE br.borrow_date IS NOT NULL
GROUP BY year,borrow_month,month_name
ORDER BY year,borrow_month; 


-- PROBLEM(10)- Q10.Most Diverse Readers
-- Find the member(s) who have borrowed books from the largest number of different authors.
-- QUERY(10)-Members who borrowed from the most diverse authors 

SELECT 
CONCAT(m.first_name,' ',m.last_name) AS member_name,
COUNT(DISTINCT b.author_id) AS unique_authors
FROM members_table m
JOIN borrowed_books br ON m.member_id = br.member_id
JOIN books_table b ON br.book_id = b.book_id
GROUP BY m.member_id,m.first_name,m.last_name
ORDER by unique_authors DESC;
