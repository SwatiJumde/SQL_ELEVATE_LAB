   CREATE TABLE Library (
    LibraryID INT PRIMARY KEY,
    LibraryName VARCHAR2(100),
    Address VARCHAR2(255),
    City VARCHAR2(50),
    State VARCHAR2(50),
   ZipCode VARCHAR2(10)  
 );                                                       
 "Table created"
CREATE TABLE BOOK (
BOOKID INT PRIMARY KEY,
TITLE VARCHAR(200),
AUTHOR VARCHAR(100),
YEARPUBLISHED INT,
LIBRARYID INT,
FOREIGN KEY (LibraryID) REFERENCES Libraries (LibraryID)
);
 "Table created"
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
 "Table created"
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
 "Table created"
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR2(100),
    Role VARCHAR2(50),
    Email VARCHAR2(100),
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)    
);
 "Table created"


