--Stored Procedure
--📌 Objective: Get all books issued to a specific member


CREATE OR REPLACE PROCEDURE GetBooksByMember(p_MemberID IN NUMBER)
IS
BEGIN
    FOR rec IN (
        SELECT 
            b.BookID,
            b.Title,
            l.LoanDate,
            l.DueDate,
            l.ReturnDate
        FROM 
            Loans l
        JOIN 
            Book b ON l.BookID = b.BookID
        WHERE 
            l.MemberID = p_MemberID
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Book ID: ' || rec.BookID || ' | Title: ' || rec.Title);
    END LOOP;
END;
/
--Procedure created.

SQL> SET SERVEROUTPUT ON;
SQL> EXEC GetBooksByMember(101);

--PL/SQL procedure successfully completed.
--Function
--📌 Objective: Get total number of overdue books


CREATE OR REPLACE FUNCTION CountOverdueBooks
RETURN NUMBER
IS
    overdueCount NUMBER;
BEGIN
    SELECT COUNT(*) INTO overdueCount
    FROM Loans
    WHERE ReturnDate IS NULL AND DueDate < SYSDATE;

    RETURN overdueCount;
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Overdue Books: ' || CountOverdueBooks);
END;
/

--Total Overdue Books: 2

--PL/SQL procedure successfully completed.
--Outcome
--Stored Procedure modularizes data retrieval logic based on a parameter.

--Function encapsulates logic to return a value useful in reporting or conditional checks.

