
-- SQL Joins (Inner, Left, Right, Full)    --Concept : Joins, Relationships
-- 1 INNER JOIN
-- Get a list of books along with the library name where each book is available:
SELECT 
    Book.BookID,
    Book.Title,
    Library.LibraryName
FROM 
    Book
INNER JOIN 
    Library ON Book.LibraryID = Library.LibraryID;

-- 2 LEFT JOIN
-- List all members along with their borrowed books (if any):
SELECT 
    Members.FirstName,
    Members.LastName,
    Book.Title,
    Loans.LoanDate
FROM 
    Members
LEFT JOIN 
    Loans ON Members.MemberID = Loans.MemberID
LEFT JOIN 
    Book ON Loans.BookID = Book.BookID;
--This will include members who haven't borrowed any books too.

--3. RIGHT JOIN
--Show all books and the members who borrowed them, if any (including books that are not borrowed):
SELECT 
    Book.Title,
    Members.FirstName,
    Members.LastName
FROM 
    Loans
RIGHT JOIN 
    Book ON Loans.BookID = Book.BookID
RIGHT JOIN 
    Members ON Loans.MemberID = Members.MemberID;

-- 4 FULL OUTER JOIN (Note: MySQL does not support FULL OUTER JOIN natively. Use UNION of LEFT and RIGHT joins.)
-- List all books and the members who borrowed them — including books never borrowed and members who never borrowed any book:
SELECT 
    Members.FirstName,
    Members.LastName,
    Book.Title,
    Loans.LoanDate
FROM 
    Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID
LEFT JOIN Book ON Loans.BookID = Book.BookID

UNION

SELECT 
    Members.FirstName,
    Members.LastName,
    Book.Title,
    Loans.LoanDate
FROM 
    Book
LEFT JOIN Loans ON Book.BookID = Loans.BookID
LEFT JOIN Members ON Loans.MemberID = Members.MemberID;




