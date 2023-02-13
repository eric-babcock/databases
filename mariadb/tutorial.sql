/*FROM 
https://www.guru99.com/mariadb-tutorial-install.html#:~:text=MariaDB%20supports%20a%20popular%20and,popular%20language%20for%20web%20development.
*/

MySQL -u root -p

/*  command for creating databases
CREATE DATABASE DatabaseName;
*/

/* command for showing databases
*/

SHOW DATABASES;

/* command for selecting/switching 
   to a new database
USE database_name;
*/

USE Demo;

/* command for creating a table of data
CREATE TABLE tableName(columnName columnType);
*/

CREATE TABLE Book(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id));

CREATE TABLE Price(
id INT NOT NULL AUTO_INCREMENT,
price float NOT NULL,
PRIMARY KEY(ID));

/* command for looking at all tables in demo
*/

SHOW TABLES;

/* Showing table structures*/

DESC TableName;

Desc Book;
DESC Price;

/*Inserting data into tables*/
/*
INSERT INTO tableName
(column_1, column_2, ... )  
VALUES  
(value1, value2, ... ),  
(value1, value2, ... ),  
...;  
*/

INSERT INTO Book
(id,name)
values(1,'MariaDB Book');

INSERT INTO price
(id, price)  
VALUES(1, 200);  

/* select command */

SELECT * FROM book;

SELECT * FROM price;

INSERT INTO book
(id, name)  
VALUES  
(2,'MariaDB Book2'),  
(3,'MariaDB Book3'),  
(4,'MariaDB Book4'),  
(5,'MariaDB Book5');

INSERT INTO price 
(id, price)  
VALUES  
(2, 250),  
(3, 220),  
(4, 190),  
(5, 300); 

/* UPDATE to change or modify data*/

/*
UPDATE tableName SET field=newValue, 
field2=newValue2,...  
[WHERE ...]  
*/


UPDATE price 
SET price = 250
WHERE id = 1;

UPDATE book
SET name = “MariaDB Book1”
WHERE id = 1;


UPDATE price
SET id = 6,
price = 280
WHERE id = 5;



/* DELETE FROM tableName  */
/*
[WHERE condition(s)]  
[ORDER BY exp [ ASC | DESC ]]  
[LIMIT numberRows]; 
*/

DELETE FROM price
WHERE id = 6;


/*The WHERE clause helps us to 
  specify the exact location where 
  we need to make a change. It 
  is used together with statements 
  such as INSERT, SELECT, UPDATE, 
  and DELETE. Consider the Price 
  table with the following data:*/

SELECT *   
FROM price 
WHERE price < 250;  

SELECT *  
FROM price  
WHERE id > 3  
AND price < 250;   

SELECT *  
FROM price 
WHERE id > 3  
OR price < 250;   

/* LIKE */

/*
SELECT field_1, field_2,... FROM tableName1, tableName2,...  
WHERE fieldName LIKE condition;
*/

SELECT name  
FROM book  
WHERE name LIKE 'M%';  

SELECT name  
FROM book  
WHERE name LIKE '%4';  

SELECT name  
FROM book  
WHERE name LIKE '%DB%';  

SELECT *  
FROM price
WHERE price LIKE '1_0';  

SELECT *  
FROM price 
WHERE price LIKE '_2_'; 

SELECT *  
FROM price  
WHERE price NOT LIKE '2%';  

/* ORDER BY */

/*SELECT expression(s)  
FROM tables  
[WHERE condition(s)]  
ORDER BY exp [ ASC | DESC ];   
*/

SELECT * FROM price 
WHERE price LIKE '2%.'
ORDER BY price;   

SELECT * FROM price
WHERE price LIKE '2%'  
ORDER BY price DESC;   

SELECT * FROM price 
WHERE price LIKE '2%.'  
ORDER BY price ASC;   

/* DISTINCT*/
/*
SELECT DISTINCT expression(s)  
FROM tableName  
[WHERE condition(s)];
*/


SELECT price FROM Price;


SELECT DISTINCT price FROM Price;

/* FROM */

/* SELECT columnNames FROM tableName; */

SELECT * FROM price;

SELECT price FROM Price;


/* delimiter syntax */
/* allows you to create commands
   into the database*/

DELIMITER //

CREATE PROCEDURE myProcedure()
  BEGIN
    SELECT name FROM book;
  END;
  //

DELIMITER ;

/* CALLING */

/* procedure for calling delimiters*/

CALL myProcedure();

DELIMITER //
	create procedure myProcedure2(book_id int)
		begin
			select name from book where id = book_id;
		end;
	//

delimiter ;
		
/* FUNCTIONS*/

Delimiter //

create function sumFunc(x INT)
returns INT deterministic

begin
	declare sum int;
	set sum = 0;
	label1: while sum <= 3000 DO
	set sum = sum + x;
	end while label1;
	return sum;
end; 
//

delimiter ;


select sumFunc(1000);

DROP FUNCTION myFunc;


/*INNER JOIN*/

/*
SELECT columns  
FROM table-1   
INNER JOIN table-2  
ON table-1.column = table-2.column;  
*/

SELECT book.name, price.price 
FROM book   
INNER JOIN price 
ON book.id = price.id;   

/* LEFT OUTER JOIN */

/*
SELECT columns  
FROM table-1  
LEFT [OUTER] JOIN table-2  
ON table-1.column = table-2.column;  
*/

SELECT book.name, price.price 
FROM book   
LEFT JOIN price 
ON book.id = price.id; 

/*RIGHT OUTER JOIN*/

/*
SELECT columns  
FROM table-1  
RIGHT [OUTER] JOIN table-2  
ON table-1.column = table-2.column;  
*/

SELECT book.name, price.price 
FROM book   
RIGHT JOIN price
ON book.id = price.id;






















