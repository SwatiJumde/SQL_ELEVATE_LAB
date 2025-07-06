--View 1: Book Details with Library Name
--Shows book information along with the library it belongs to.


CREATE VIEW BookWithLibrary AS
SELECT 
    b.BookID,
    b.Title,
    b.Author,
    b.YearPublished,
    l.LibraryName,
    l.City,
    l.State
FROM 
    Book b
JOIN 
    Library l ON b.LibraryID = l.LibraryID;

--Usage Example:

SELECT * FROM BookWithLibrary WHERE State = 'Maharashtra';

--------View 2: Active Loans (Not Yet Returned)
--Shows details of books that are currently on loan (i.e., not yet returned).


CREATE VIEW ActiveLoans AS
SELECT 
    l.LoanID,
    m.FirstName,
    m.LastName,
    b.Title,
    l.LoanDate,
    l.DueDate
FROM 
    Loans l
JOIN 
    Members m ON l.MemberID = m.MemberID
JOIN 
    Book b ON l.BookID = b.BookID
WHERE 
    l.ReturnDate IS NULL;

--Usage Example:

SELECT * FROM ActiveLoans ORDER BY DueDate ASC;
-------
--View 3: Overdue Books
--Identifies books that are overdue (DueDate < TODAY and not returned yet).


CREATE VIEW OverdueBooks AS
SELECT
    l.LoanID,
    m.FirstName,
    m.LastName,
    b.Title,
    l.DueDate
FROM
    Loans l
JOIN
    Members m ON l.MemberID = m.MemberID
JOIN
    Book b ON l.BookID = b.BookID
WHERE
    l.ReturnDate IS NULL
    AND l.DueDate < SYSDATE;
Usage Example:

SELECT * FROM OverdueBooks;
--------

--View 4: Library Staff Directory
--List of all staff along with their library location.


CREATE VIEW StaffDirectory AS
SELECT 
    s.StaffID,
    s.FullName,
    s.Role,
    s.Email,
    l.LibraryName,
    l.City,
    l.State
FROM 
    Staff s
JOIN 
    Library l ON s.LibraryID = l.LibraryID;
Usage Example:


SELECT * FROM StaffDirectory WHERE Role = 'Librarian';
--------
