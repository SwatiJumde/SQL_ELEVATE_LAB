CREATE TABLE Library (
    LibraryID INT PRIMARY KEY,
    LibraryName VARCHAR2(100),
    Address VARCHAR2(255),
    City VARCHAR2(50),
    State VARCHAR2(50),
   ZipCode VARCHAR2(10)  
 );             
INSERT INTO Library (LibraryID, LibraryName, Address, City, State, ZipCode)
VALUES (1, 'Delhi Public Library', 'S.P. Mukherjee Marg', 'Delhi', 'Delhi', '110006');

INSERT INTO Library (LibraryID, LibraryName, Address, City, State, ZipCode)
VALUES (2, 'Anna Centenary Library', 'Kotturpuram', 'Chennai', 'Tamil Nadu', '600085');

INSERT INTO Library (LibraryID, LibraryName, Address, City, State, ZipCode)
VALUES (3, 'State Central Library', NULL, 'Bengaluru', 'Karnataka', '560001');

CREATE TABLE BOOK (
BOOKID INT PRIMARY KEY,
TITLE VARCHAR(200),
AUTHOR VARCHAR(100),
YEARPUBLISHED INT,
LIBRARYID INT,
FOREIGN KEY (LibraryID) REFERENCES Libraries (LibraryID)
);
INSERT INTO Book (BookID, Title, Author, YearPublished, LibraryID)
VALUES(101, 'Wings of Fire', 'A.P.J. Abdul Kalam', 1999, 1);

INSERT INTO Book (BookID, Title, Author, YearPublished, LibraryID)
VALUES(102, 'Train to Pakistan', 'Khushwant Singh', 1956, 1);

INSERT INTO Book (BookID, Title, Author, YearPublished, LibraryID)
VALUES(103, 'The Guide', 'R.K. Narayan', 1958, 2);

INSERT INTO Book (BookID, Title, Author, YearPublished, LibraryID)
VALUES(104, 'Godaan', NULL, 1936, 2);        -- Missing author

INSERT INTO Book (BookID, Title, Author, YearPublished, LibraryID)
VALUES (105, 'Midnight''s Children', 'Salman Rushdie', NULL, 3);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE,
    PhoneNumber VARCHAR2(15),
    MembershipDate DATE,
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);
INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, MembershipDate, LibraryID)
VALUES (201, 'SWATI', 'JUMDE', 'swati24@example.com', '9876543210', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1);
-- Member 2 (NULL email)
INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, MembershipDate, LibraryID)
VALUES (202, 'kiran', 'kk', NULL, '9123456789', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 1);

-- Member 3 (NULL phone)
INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, MembershipDate, LibraryID)
VALUES (203, 'bittu', 'Patil', 'bittu.patil@example.com', NULL, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 2);

-- Member 4 (NULL membership date)
INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber, MembershipDate, LibraryID)
VALUES (204, 'Priya', 'Nair', 'priya.nair@example.com', '9876512345', NULL, 3);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) );

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate)
VALUES (301, 101, 201, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), NULL);  

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate)
VALUES(302, 102, 202, TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-18', 'YYYY-MM-DD'))

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate)
VALUES(303, 103, 203, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), NULL);

    CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR2(100),
    Role VARCHAR2(50),
    Email VARCHAR2(100),
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)  );

INSERT INTO Staff (StaffID, FullName, Role, Email, LibraryID)
VALUES
(401, 'Neha Singh', 'Librarian', 'neha.singh@library.in', 1);

INSERT INTO Staff (StaffID, FullName, Role, Email, LibraryID)
VALUES(402, 'Amit Joshi', 'Clerk', NULL, 2);   -- Missing email

INSERT INTO Staff (StaffID, FullName, Role, Email, LibraryID)
VALUES(403, 'Ravi Kumar', 'Manager', 'ravi.kumar@library.in', 3);




