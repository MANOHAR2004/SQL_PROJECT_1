THIS FILE WILL HAVE MY SQL CODE:
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
