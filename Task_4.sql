--These queries cover all required elements:

--⦁	 Aggregate functions: COUNT, AVG, SUM

--⦁	 Grouping via GROUP BY

--⦁	 Group-level filtering using HAVING


--1. Count of Books in Each Library
SELECT 
    l.LibraryName,
    COUNT(b.BookID) AS TotalBooks
FROM 
    Library l
LEFT JOIN 
    Book b ON l.LibraryID = b.LibraryID
GROUP BY 
    l.LibraryName;

--2. Number of Members in Each Library
SELECT 
    l.LibraryName,
    COUNT(m.MemberID) AS TotalMembers
FROM 
    Library l
LEFT JOIN 
    Members m ON l.LibraryID = m.LibraryID
GROUP BY 
    l.LibraryName;

--3. Average Years Since Books Were Published (Grouped by Library)

SELECT
    l.LibraryName,
    AVG(EXTRACT(YEAR FROM SYSDATE) - b.YearPublished) AS AvgBookAge
FROM
    Library l
JOIN
    Book b ON l.LibraryID = b.LibraryID
GROUP BY
    l.LibraryName;

--4. Number of Loans Per Member

SELECT
    m.MemberID,
    m.FirstName || ' ' || m.LastName AS MemberName,
    COUNT(l.LoanID) AS LoansCount
FROM
    Members m
LEFT JOIN
    Loans l ON m.MemberID = l.MemberID
GROUP BY
    m.MemberID, m.FirstName, m.LastName;

--5. Members with More Than 3 Loans

SELECT
    m.MemberID,
    m.FirstName || ' ' || m.LastName AS MemberName,
    COUNT(l.LoanID) AS TotalLoans
FROM
    Members m
JOIN
    Loans l ON m.MemberID = l.MemberID
GROUP BY
    m.MemberID, m.FirstName, m.LastName
HAVING
    COUNT(l.LoanID) > 3;

--6. Total and Average Loan Duration per Book

SELECT
    b.Title,
    COUNT(l.LoanID) AS TotalLoans,
    AVG(l.ReturnDate - l.LoanDate) AS AvgLoanDuration
FROM
    Book b
JOIN
    Loans l ON b.BookID = l.BookID
WHERE
    l.ReturnDate IS NOT NULL
GROUP BY
    b.Title;

--7. Number of Staff Members by Role per Library

SELECT 
    l.LibraryName,
    s.Role,
    COUNT(s.StaffID) AS StaffCount
FROM 
    Library l
JOIN 
    Staff s ON l.LibraryID = s.LibraryID
GROUP BY 
    l.LibraryName, s.Role;

--8. Libraries with More Than 2 Staff Members

SELECT 
    l.LibraryName,
    COUNT(s.StaffID) AS StaffCount
FROM 
    Library l
JOIN 
    Staff s ON l.LibraryID = s.LibraryID
GROUP BY 
    l.LibraryName
HAVING 
    COUNT(s.StaffID) > 2;

