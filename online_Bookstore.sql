--  Book table create query
CREATE TABLE book (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    price DOUBLE
);
-- Insert the value into book table
INSERT INTO book (title, author, price)
VALUES ('The Hobbit', 'J.R.R. Tolkien', 19.99);

INSERT INTO book (title, author, price)
VALUES ('Automic Habits', 'JJ', 25);


-- Select all books
SELECT * FROM book;


-- delete a book
DELETE FROM book WHERE id = 1;

