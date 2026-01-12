# SQL Portfolio: Library Management System 📚

**End-to-end relational database design & advanced SQL analysis**  
A complete library management database built in MySQL with realistic data and 10 practical business queries.

### 🎯 Project Overview
Designed and implemented a relational database for a library system to track authors, books, members, and borrowing history.

**Key features demonstrated:**
- Database design with normalization and foreign key constraints  
- Realistic data population (English + Indian literature)  
- 10 real-world business queries using JOINs, aggregates, subqueries, date functions, and window-like logic  
- Clean, readable, and production-ready SQL code

### 🛠️ Tech Stack
- MySQL  
- SQL (Advanced: JOINs, GROUP BY, HAVING, COUNT(DISTINCT), DATEDIFF, CONCAT, anti-joins)

### 📊 Key Business Queries Implemented
1. Currently borrowed books with member & due date  
2. Overdue books with days late calculation  
3. Top 5 most borrowed books  
4. Members who never borrowed anything  
5. Authors ranked by total borrows  
6. Books that have never been borrowed  
7. Members with more than 3 active borrows  
8. Potential fine revenue calculation (₹10/day overdue)  
9. Monthly borrowing trend analysis  
10. Members who borrowed from the most diverse authors (COUNT DISTINCT)

### 🏗️ Database Schema (ER Diagram)

<img width="781" height="756" alt="Library Management System – ER Diagram drawio" src="https://github.com/user-attachments/assets/41f09405-39a8-4748-bff6-43debaeb3ba4" />

### Sample query results(screanshots)
### Sample Query Results
**Overdue Books Report (Query 2)**  
![Overdue Books](<img width="706" height="638" alt="query_2" src="https://github.com/user-attachments/assets/fe295dcd-7be8-49bf-857b-d3f1bd354386" />

)

**Potential Fine Calculation (Query 8)**  
![Fines Calculation](<img width="796" height="678" alt="duedate_query_result" src="https://github.com/user-attachments/assets/4ef2185f-f3d6-462a-b621-4142f1a1fb64" />


)

**Monthly Borrowing Trend (Query 9)**  
![Monthly Trend](<img width="1110" height="696" alt="query_9" src="https://github.com/user-attachments/assets/08ede466-b4cc-4e37-90a7-24119d127eb3" />

)
