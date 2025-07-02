--few example tasks and SQL queries that demonstrate subqueries and nested logic, using SELECT, WHERE, and
--FROM clauses as well as IN, EXISTS, scalar subqueries, and correlated subqueries.
--1. Find the titles of books that are currently on loan (i.e., not yet returned)
  
SELECT Title
FROM Book
WHERE BookID IN (
    SELECT BookID
    FROM Loans
    WHERE ReturnDate IS NULL
);

--2. List members who have borrowed more than 3 books in total

SELECT FirstName, LastName
FROM Members
WHERE MemberID IN (
    SELECT MemberID
    FROM Loans
    GROUP BY MemberID
    HAVING COUNT(LoanID) > 3
);
--3. Find the most recently joined member (using a scalar subquery)

SELECT *
FROM Members
WHERE MembershipDate = (
    SELECT MAX(MembershipDate)
    FROM Members
);
--4. List libraries that have at least one staff member assigned (using EXISTS)

SELECT LibraryName
FROM Library L
WHERE EXISTS (
    SELECT 1
    FROM Staff S
    WHERE S.LibraryID = L.LibraryID
);
--5. Find names of members who borrowed books written by "J.K. Rowling" (nested subquery)

SELECT DISTINCT M.FirstName, M.LastName
FROM Members M
WHERE MemberID IN (
    SELECT L.MemberID
    FROM Loans L
    WHERE L.BookID IN (
        SELECT B.BookID
        FROM Book B
        WHERE B.Author = 'J.K. Rowling'
    )
);
--6. For each member, show their name and the number of books they have currently borrowed (correlated subquery)

SELECT M.FirstName, M.LastName,
    (SELECT COUNT(*)
     FROM Loans L
     WHERE L.MemberID = M.MemberID AND L.ReturnDate IS NULL) AS CurrentLoans
FROM Members M;
--7. Find books that were returned after their due date (late returns)

SELECT Title
FROM Book
WHERE BookID IN (
    SELECT BookID
    FROM Loans
    WHERE ReturnDate > DueDate
);
--8. List members who have never borrowed a book

SELECT FirstName, LastName
FROM Members
WHERE MemberID NOT IN (
    SELECT DISTINCT MemberID
    FROM Loans
);
