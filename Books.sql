CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    PublishedYear INT,
    ISBN VARCHAR(20),
    AvailableCopies INT DEFAULT 0
);
INSERT INTO Books (BookID, Title, Author, Genre, PublishedYear, ISBN, AvailableCopies) 
VALUES 
(1, '1984', 'George Orwell', 'Dystopian', 1949, '9780451524935', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, '9780061120084', NULL), -- NULL copies
(3, 'Sapiens', 'Yuval Noah Harari', 'History', 2011, '9780062316097', 10),
(4, 'Invisible Man', 'Ralph Ellison', NULL, 1952, '9780679732761', 4), -- NULL genre
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, NULL, 3); -- NULL ISBN
