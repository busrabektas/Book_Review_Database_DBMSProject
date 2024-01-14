CREATE DATABASE DB_NAME;
USE DB_NAME;

CREATE TABLE User(
    username VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bio VARCHAR(300),
    goal_book_num INT DEFAULT 0,
    email VARCHAR(50) UNIQUE,
    following_num INT DEFAULT 0 ,
    gender VARCHAR(50),
    past_read_num INT DEFAULT 0,
    follower_num INT DEFAULT 0,
    password_ VARCHAR(20),
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE Writer(
    w_bio VARCHAR(300),
    w_username VARCHAR(50) PRIMARY KEY,
    w_first_name VARCHAR(50), 
    w_last_name VARCHAR(50),
    num_of_ratings INT DEFAULT 0,
    num_of_likes INT DEFAULT 0,
    rate DECIMAL(3,2) DEFAULT 0.0,
    book_num INT DEFAULT 0,
    num_of_reads INT DEFAULT 0,
    follower_num INT DEFAULT 0
);
CREATE TABLE Post (
    postcreate_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    postupdate_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    like_num INT DEFAULT 0,
    post_title VARCHAR(50),
    username VARCHAR(50),
    post_content VARCHAR(500),
    FOREIGN KEY (username) REFERENCES User(username)
 );
ALTER TABLE Post AUTO_INCREMENT=3000;

CREATE TABLE Book(
    book_name VARCHAR(100),
    book_id INT PRIMARY KEY auto_increment,
    short_desc TEXT,
    num_of_reads INT DEFAULT 0,
    num_of_ratings INT DEFAULT 0,
    rate_of_book DECIMAL(3,2) DEFAULT 0,
    w_username VARCHAR(50),
    FOREIGN KEY (w_username) REFERENCES Writer(w_username)
);

CREATE TABLE BookList(
    list_id INT PRIMARY KEY auto_increment,
    list_name VARCHAR(50),
    username VARCHAR(50),
    FOREIGN KEY (username) REFERENCES User(username)
);
ALTER TABLE BookList AUTO_INCREMENT=4000;
CREATE TABLE Likes(
    username VARCHAR(50),
    post_id INT,
    primary key(username, post_id),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);
CREATE TABLE Comments(
    create_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE current_timestamp,
    comment_id INT auto_increment PRIMARY KEY,
    user_name VARCHAR(50),
    post_id INT, 
    comment_content VARCHAR(200),
    FOREIGN KEY (user_name) REFERENCES User(username),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);
ALTER TABLE Comments auto_increment=2000;
CREATE TABLE Include(
    book_id INT,
    list_id INT,
    primary key(book_id, list_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (list_id) REFERENCES BookList(list_id)
);

CREATE TABLE Rates(
    username VARCHAR(50),
    w_username VARCHAR(50),
    rate_value DECIMAL(3,2),
    primary key(username, w_username),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (w_username) REFERENCES Writer(w_username)
);
CREATE TABLE Follow_Writer(
    w_username VARCHAR(50),
    username VARCHAR(50),
    primary key(username, w_username),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (w_username) REFERENCES Writer(w_username)
);
CREATE TABLE Follow(
    follower_username VARCHAR(50),
    followed_username VARCHAR(50),
    f_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    primary key(follower_username, followed_username),
    FOREIGN KEY (follower_username) REFERENCES User(username),
    FOREIGN KEY (followed_username) REFERENCES User(username)
);
CREATE TABLE Rate_Book(
    book_id INT,
    rate_value DECIMAL(3,2),
    username VARCHAR(50),
    primary key(book_id, username),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);


CREATE TABLE Reads_(
    username VARCHAR(50),
    book_id INT,
    primary key(username, book_id),
    FOREIGN KEY (username) REFERENCES User(username),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

create table like_writer(
username varchar(20),
w_username varchar(20),
FOREIGN KEY (username) REFERENCES user(username),
FOREIGN KEY (w_username) REFERENCES writer(w_username));


INSERT INTO book (book_name, short_desc, num_of_reads, rate_of_book, w_username, num_of_ratings)
VALUES 
('Harry Potter', 'Harry Potter is a series written by J.K. Rowling, encompassing themes of magic, adventure, and friendship', 54, 4.2, 'JKrowling', 56),
('The Great Gatsby', 'A novel about the American Dream in the 1920s.', 54, 3.5, 'FScottFitzgerald', 5),
('Pride and Prejudice', 'A classic novel exploring themes of love and social standing.', 48, 4.8, 'JaneAusten', 12),
('1984', 'A dystopian novel about totalitarianism and surveillance.', 35, 4.5, 'GeorgeOrwell', 10),
('To Kill a Mockingbird', 'A novel about racial injustice in the American South.', 42, 4.2, 'HarperLee', 8),
('The Catcher in the Rye', 'A story about the disillusionment of a teenage boy.', 30, 4.0, 'JDSalinger', 6);

INSERT INTO writer
VALUES 
  ('Author of the Harry Potter series', 'JKrowling', 'J.K.', 'Rowling', 30, 150, 4.5, 12, 245,100),
  ('American novelist and short story writer', 'FScottFitzgerald', 'F. Scott', 'Fitzgerald', 20, 130, 3.9, 17, 189, 68 ),
  ('(1775-1817) was a renowned English novelist', 'JaneAusten', 'Jane', 'Austen', 30, 110, 4.8, 8, 231, 200),
  ('(1903-1950) was an English author and journalist', 'GeorgeOrwell', 'George', 'Orwell', 25,110, 4.7,12, 110,100),
  ('(1926-2016) was an American author', 'HarperLee', 'Harper', 'Lee', 17, 123, 3.7, 11, 122, 66),
  ('(1919-2010) was an American author', 'JDSalinger', 'J.D.', 'Salinger', 23, 135, 4.1, 6, 132, 112);
