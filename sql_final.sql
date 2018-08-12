CREATE TABLE tbl_BORROWER (
	Card_No INT PRIMARY KEY NOT NULL IDENTITY (1131,1),
	borrower_name VARCHAR(50),
	borrower_address VARCHAR(50),
	borrower_phone VARCHAR(50)
);
CREATE TABLE tbl_LIBRARY_BRANCH (
	Branch_id INT PRIMARY KEY NOT NULL IDENTITY (111,1),
	Branch_name VARCHAR(50),
	Branch_address VARCHAR(50)
);
CREATE TABLE tbl_PUBLISHER (
	Publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50),
	Publisher_phone VARCHAR(50)
);
CREATE TABLE tbl_BOOKS (
	Book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_title VARCHAR(50),
	Publisher_Name VARCHAR(50) NOT NULL CONSTRAINT fk_Publisher_Name FOREIGN KEY REFERENCES tbl_PUBLISHER(Publisher_Name) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE tbl_BOOK_AUTHORS (
	Book_id INT CONSTRAINT fk_Book_id  FOREIGN KEY REFERENCES tbl_BOOKS(Book_id),
	BOOK_AUTHOR_AuthorName VARCHAR(50)
);

CREATE TABLE tbl_BOOK_COPIES (
	Book_id INT NOT NULl REFERENCES tbl_BOOKS(Book_id),
	Branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies VARCHAR(20)
);

CREATE TABLE tbl_BOOK_LOANS (
	Book_id INT NOT NULL REFERENCES tbl_BOOKS(Book_id),
	Branch_id INT NOT NULL REFERENCES tbl_LIBRARY_BRANCH(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Card_No INT NOT NULL CONSTRAINT fk_Card_No FOREIGN KEY REFERENCES tbl_BORROWER(Card_No) ON UPDATE CASCADE ON DELETE CASCADE,
	Date_Out VARCHAR(25),
	Due_Date VARCHAR(25)
);

INSERT INTO tbl_BOOKS
(book_title, Publisher_Name)
VALUES
('Harry Potter 1', 'Bloomsbury Publishing'),
('Harry Potter 2', 'Bloomsbury Publishing'),
('Eragon 1', 'Alfred A. Knopf'),
('Eragon 2', 'Alfred A. Knopf'),
('Outlander 1', 'Dell Publishing'),
('Outlander 2', 'Dell Publishing'),
('The Mortal Instruments', 'Margaret K. McElderry'),
('The Mortal Instruments', 'Margaret K. McElderry'),
('Percy Jackson & the Olympians 1', 'Miramax Book'),
('Percy Jackson & the Olympians 2', 'Miramax Book'),
('A Song of Ice and Fire 1', 'Bantam Books'),
('A Song of Ice and Fire 2', 'Bantam Books'),
('The Hunger Games', 'Scholastic'),
('Catching Fire', 'Scholastic'),
('A Series of Unfortunate Events 1', 'HarperCollins'),
('A Series of Unfortunate Events 2', 'HarperCollins'),
('The Dark Tower 1', 'Donald M. Grant'),
('The Expanse', 'Orbit Books'),
('Under The Dome', 'Charles Scribners Sons'),
('The Lost Tribe', 'Picador')
;

INSERT INTO tbl_publisher 
(publisher_Name,  publisher_address,  Publisher_phone)
VALUES
('Bloomsbury Publishing', '102 N Lakeshore Dr', '503-777-1212'),
('Alfred A. Knopf', '103 N Lakeshore Dr', '503-777-1213'),
('Dell Publishing', '104 N Lakeshore Dr', '503-777-1214'),
('Margaret K. McElderry', '105 N Lakeshore Dr', '503-777-1215'),
('Miramax Book', '106 N Lakeshore Dr', '503-777-1216'),
('Bantam Books', '107 N Lakeshore Dr', '503-777-1217'),
('Scholastic', '108 N Lakeshore Dr', '503-777-1218'),
('HarperCollins', '109 N Lakeshore Dr', '503-777-1219'),
('Donald M. Grant', '110 N Lakeshore Dr', '503-777-1220'),
('Orbit Books', '111 N Lakeshore Dr', '503-777-1221'),
('Charles Scribners Sons', '112 N Lakeshore Dr', '503-777-1221'),
('Picador', '113 N Lakeshore Dr', '503-777-1222')
;

INSERT INTO tbl_BOOK_AUTHORS 
(BOOK_AUTHOR_AuthorName)
VALUES
('J. K. Rowling'),
('J. K. Rowling'),
('Christopher Paolini'),
('Christopher Paolini'),
('Diana Gabaldon'),
('Diana Gabaldon'),
('Cassandra Clare'),
('Cassandra Clare'),
('Rick Riordan'),
('Rick Riordan'),
('George R. R. Martin'),
('George R. R. Martin'),
('Suzanne Collins'),
('Suzanne Collins'),
('Lemony Snicket'),
('Lemony Snicket'),
('Stephen King'),
('James S. A. Corey'),
('Stephen King'),
('Mark Lee')
;

 INSERT INTO tbl_LIBRARY_BRANCH
 (Branch_name, Branch_address)
 VALUES
 ('Sharpstone', '207 S Stone Lane'),
 ('Central', '208 S Stone Lane'),
 ('Bridgestone', '209 S Stone Lane'),
 ('Pillarstone', '210 S Stone Lane')
 ;

 INSERT INTO tbl_BOOK_COPIES
 (Book_id, Branch_id, No_Of_Copies)
 VALUES
 ('1', '111', '2'),
 ('3', '111', '2'),
 ('5', '111', '2'),
 ('7', '111', '2'),
 ('9', '111', '2'),
 ('11', '111', '2'),
 ('13', '111', '2'),
 ('15', '111', '2'),
 ('17', '111', '2'),
 ('20', '111', '2'),
 ('20', '112', '2'),
 ('4', '112', '2'),
 ('6', '112', '2'),
 ('8', '112', '2'),
 ('10', '112', '2'),
 ('12', '112', '2'),
 ('14', '112', '2'),
 ('17', '112', '2'),
 ('18', '112', '2'),
 ('19', '112', '2'),
 ('1', '113', '2'),
 ('3', '113', '2'),
 ('5', '113', '2'),
 ('7', '113', '2'),
 ('9', '113', '2'),
 ('11', '113', '2'),
 ('13', '113', '2'),
 ('15', '113', '2'),
 ('17', '113', '2'),
 ('20', '113', '2'),
 ('2', '114', '2'),
 ('4', '114', '2'),
 ('6', '114', '2'),
 ('8', '114', '2'),
 ('20', '114', '3'),
 ('12', '114', '2'),
 ('14', '114', '2'),
 ('16', '114', '2'),
 ('18', '114', '2'),
 ('19', '114', '2')
 ;

 INSERT INTO tbl_BOOK_LOANS
 (Book_id, Branch_id, Card_No, Date_Out, Due_Date)
 VALUES
 ('1', '111', '1131', '9/14/2017', '9/28/2017'),
 ('2', '111', '1131', '9/14/2017', '9/28.2017'),
 ('3', '111', '1131', '9/14/2017', '9/28/2017'),
 ('4', '111', '1131', '9/14/2017', '9/28/2017'),
 ('5', '111', '1131', '9/14/2017', '9/28/2017'),
 ('6', '111', '1131', '9/14/2017', '9/28/2017'),
 ('7', '111', '1131', '9/14/2017', '9/28/2017'),
 ('8', '111', '1131', '9/14/2017', '9/28/2017'),
 ('9', '111', '1131', '9/14/2017', '9/28/2017'),
 ('10', '111', '1131', '9/14/2017', '9/28/2017'),
 ('1', '112', '1132', '8/14/2017', '8/28/2017'),
 ('3', '112', '1132', '8/14/2017', '8/28/2017'),
 ('7', '112', '1132', '8/14/2017', '8/28/2017'),
 ('10', '112', '1132', '8/14/2017', '8/28/2017'),
 ('15', '112', '1132', '8/14/2017', '8/28/2017'),
 ('20', '114', '1133', '7/14/2017', '7/28/2017'),
 ('18', '114', '1133', '7/14/2017', '7/28/2017'),
 ('11', '114', '1133', '7/14/2017', '7/28/2017'),
 ('12', '114', '1133', '7/14/2017', '7/28/2017'),
 ('17', '114', '1133', '7/14/2017', '7/28/2017'),
 ('2', '113', '1134', '2/14/2017', '2/28/2017'),
 ('4', '113', '1134', '2/14/2017', '2/28/2017'),
 ('5', '111', '1135', '4/14/2017', '4/28/2017'),
 ('11', '111', '1135', '4/14/2017', '4/28/2017'),
 ('12', '111', '1135', '4/14/2017', '4/28/2017'),
 ('14', '111', '1135', '4/14/2017', '4/28/2017'),
 ('5', '111', '1135', '4/14/2017', '4/28/2017'),
 ('17', '111', '1135', '4/14/2017', '4/28/2017'),
 ('18', '111', '1135', '4/14/2017', '4/28/2017'),
 ('10', '113', '1136', '10/14/2017', '10/28/2017'),
 ('2', '113', '1136', '10/14/2017', '10/28/2017'),
 ('3', '113', '1136', '10/14/2017', '10/28/2017'),
 ('7', '113', '1136', '10/14/2017', '10/28/2017'),
 ('8', '113', '1136', '10/14/2017', '10/28/2017'),
 ('13', '113', '1136', '10/14/2017', '10/28/2017'),
 ('14', '113', '1136', '10/14/2017', '10/28/2017'),
 ('15', '113', '1136', '10/14/2017', '10/28/2017'),
 ('18', '112', '1137', '1/14/2017', '1/28/2017'),
 ('19', '112', '1137', '1/14/2017', '1/28/2017'),
 ('1', '112', '1137', '1/14/2017', '1/28/2017'),
 ('2', '112', '1137', '1/14/2017', '1/28/2017'),
 ('4', '112', '1137', '1/14/2017', '1/28/2017'),
 ('5', '112', '1137', '1/14/2017', '1/28/2017'),
 ('20', '112', '1137', '1/14/2017', '1/28/2017'),
 ('7', '112', '1137', '1/14/2017', '1/28/2017'),
 ('18', '114', '1138', '2/14/2017', '2/28/2017'),
 ('19', '114', '1138', '2/14/2017', '2/28/2017'),
 ('20', '114', '1138', '2/14/2017', '2/28/2017'),
 ('1', '112', '1139', '4/14/2017', '4/28/2017'),
 ('2', '112', '1139', '4/14/2017', '4/28/2017'),
 ('3', '112', '1139', '4/14/2017', '4/28/2017')
 ;

 INSERT INTO tbl_BORROWER
 (borrower_name, borrower_address, borrower_phone)
 VALUES
 ('Tom Bower', '1017 S Ridge Way', '505-101-2227'),
 ('Sarah Ezay', '1012 S Ridge Way', '505-102-2227'),
 ('Ted Collins', '1013 S Ridge Way', '505-103-2227'),
 ('Tadd Collins', '1014 S Ridge Way', '505-104-2227'),
 ('Theo Conver', '1015 S Ridge Way', '505-105-2227'),
 ('Sally Rose', '1016 S Ridge Way', '505-107-2227'),
 ('Erica Donald', '1017 S Ridge Way', '505-108-2227'),
 ('Todd Ardvark', '1018 S Ridge Way', '505-109-2227'),
 ('John Star', '1010 S Ridge Way', '505-110-2227'),
 ('Mee Person', '1011 S Ridge Way', '505-111-2227')
 ;

 /* Stored Procedures */
 /* Procedure 1 */
GO
CREATE PROC getbook 
AS
SELECT No_Of_Copies, book_title, Branch_name
FROM tbl_BOOK_COPIES
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_BOOK_COPIES.Branch_id = tbl_LIBRARY_BRANCH.Branch_id
INNER JOIN tbl_BOOKS ON tbl_BOOK_COPIES.Book_id = tbl_BOOKS.Book_id
WHERE Branch_name = 'Sharpstone'
AND book_title = 'The Lost Tribe'
GO

/* Procedure 2 */
CREATE PROC getcopies
AS
SELECT book_title, Branch_name, No_Of_Copies
FROM tbl_BOOK_COPIES
INNER JOIN tbl_LIBRARY_BRANCH ON tbl_BOOK_COPIES.Branch_id = tbl_LIBRARY_BRANCH.Branch_id
INNER JOIN tbl_BOOKS on tbl_BOOK_COPIES.Book_id = tbl_BOOKS.Book_id
WHERE book_title = 'The Lost Tribe'
GO

/* Procedure 3 */
CREATE PROC getname 
AS
SELECT borrower_name
FROM tbl_BORROWER
WHERE tbl_BORROWER.Card_No NOT IN(SELECT tbl_BOOK_LOANS.Card_No FROM tbl_BOOK_LOANS)
GO

/* Procedure 4 */
CREATE PROC getinfo
AS
SELECT book_title, borrower_name, borrower_address
FROM tbl_BORROWER
INNER JOIN tbl_BOOK_LOANS ON tbl_BORROWER.Card_No = tbl_BOOK_LOANS.Card_No
INNER JOIN tbl_BOOKS ON tbl_BOOK_LOANS.Book_id = tbl_BOOKS.Book_id
WHERE Branch_id = '111'
AND Due_Date = '9/28/2017'
GO

/* Procedure 5 */
CREATE PROC totalbooks
AS
SELECT Branch_Name, COUNT(Book_Id) AS 'Total Books'
FROM tbl_Library_Branch
INNER JOIN tbl_Book_Loans ON tbl_LIBRARY_BRANCH.Branch_Id = tbl_Book_loans.Branch_id
GROUP BY Branch_Name
GO
/* Procedure 6 */
CREATE PROC loanedbooks
AS
SELECT borrower_name, borrower_address, COUNT(Book_Id) AS 'Checked Out'
FROM tbl_Book_Loans
INNER JOIN tbl_Borrower ON tbl_book_loans.Card_No = tbl_BORROWER.Card_No
GROUP BY tbl_Borrower.borrower_name, borrower_address
HAVING COUNT(Book_Id) > 5
GO

/* Procedure 7 */
CREATE PROC StephenKing
AS
SELECT book_title, No_Of_Copies
FROM tbl_Book_Copies
INNER JOIN tbl_Library_Branch ON tbl_BOOK_COPIES.Branch_id = tbl_LIBRARY_BRANCH.Branch_id
INNER JOIN tbl_BOOKS ON tbl_BOOK_COPIES.Book_id = tbl_BOOKS.Book_id
INNER JOIN tbl_BOOK_AUTHORS ON tbl_Book_Copies.Book_id = tbl_Book_AUTHORS.Book_id
WHERE BOOK_AUTHOR_AuthorName = 'Stephen King' and Branch_name = 'Central'
;

