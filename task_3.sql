--Here's a Task 3 SQL script written using your provided tables (Library, Book, Members, Loans, Staff). 

--SELECT * and specific columns

--WHERE, AND, OR, LIKE, BETWEEN

--ORDER BY, LIMIT
-- 1. Select all libraries
SELECT * FROM Library;

-- 2.Select specific columns: Title and Author from the Book table
 Select specific columns: Title and Author from the Book table
SELECT Title, Author FROM Book;

--3.Find members who joined in or after 2023
 SELECT FirstName, LastName, MembershipDate
FROM Members
WHERE MembershipDate >= TO_DATE('2023-01-01', 'YYYY-MM-DD');

-- 4. Find books published between 2000 and 2020
SELECT Title, YearPublished FROM Book
WHERE YearPublished BETWEEN 2000 AND 2020;

-- 5. List loans that have not been returned yet (ReturnDate IS NULL)
SELECT LoanID, BookID, MemberID, LoanDate FROM Loans
WHERE ReturnDate IS NULL;

-- 6. Find members whose first names start with 'A'
SELECT MemberID, FirstName, LastName FROM Members
WHERE FirstName LIKE 'S%';

-- 7. Find staff members with the role 'Librarian' or 'Manager'
SELECT FullName, Role FROM Staff
WHERE Role = 'Librarian' OR Role = 'Manager';

-- 8. List books ordered by year published (newest first)
SELECT Title, YearPublished FROM Book
ORDER BY YearPublished DESC;

-- 9. List top 5 most recent loans
SELECT *
FROM (
    SELECT *
    FROM Loans
    ORDER BY LoanDate DESC
)
WHERE ROWNUM <= 5;

-- 10. Show all books along with their library name using JOIN
SELECT B.Title, B.Author, L.LibraryName FROM Book B
JOIN Library L ON B.LibraryID = L.LibraryID;
