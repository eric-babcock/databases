SELECT book.name, price.price 
FROM book   
INNER JOIN price 
ON book.id = price.id;   

SELECT book.name, price.price 
FROM book   
LEFT JOIN price 
ON book.id = price.id;   

SELECT book.name, price.price 
FROM book   
RIGHT JOIN price
ON book.id = price.id;   