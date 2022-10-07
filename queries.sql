#7.1. Books per author.
SELECT a.authorId, a.firstName b.Title
FROM authors a
INNER JOIN books b
ON a.authorId = b.authorId;

#7.2. Authors per book.
SELECT 		a.ISBN, b.title, 
			COUNT(a.authorId) as "Authors per book"
FROM 		authors a
			INNER JOIN books b
				ON a.ISBN = b.ISBN
GROUP BY 	a.ISBN, b.title;

#7.3. Author royalties on a book.
SELECT 		a.ISBN, b.title, 
			ROUND(SUM(a.authorRoyalties),2) as "Royalties per book"
FROM 		authors a
			INNER JOIN books b
				ON a.ISBN = b.ISBN
GROUP BY 	a.ISBN, b.title;

#7.4. Book royalties per author.
SELECT 		a.authorId, a.firstName, a.lastName, 
			a.authorRoyalties as "Royalties"
FROM 		authors a
			INNER JOIN authors a
				ON a.authorId = a.authorId
GROUP BY 	a.firstName, a.authorId, a.lastName, a.authorRoyalties;

#7.5. Books in a genre.
SELECT 		g.genre, g.genreId, COUNT(b.ISBN) as "Number of Books"
FROM 		genres g
            JOIN genre g
				ON g.genreId = g.genreId
GROUP BY 	g.genre, g.genreId;

#7.6. Books published by a publisher.
SELECT 		p.publisherId, p.name, COUNT(b.ISBN) AS "Book Count"
FROM 		publishers p
            JOIN books b
				ON p.publisherId = b.publisherId
GROUP BY 	p.name, p.publisherId;

#7.7. Editors per book.
SELECT 		b.ISBN, b.title, COUNT(be.editorId) AS "Editor Count"
FROM 		books b
            JOIN editor e
				ON b.ISBN  = e.ISBN
GROUP BY 	b.title, b.ISBN;

#7.8. Books per editor.
SELECT 		e.editorId, e.name, COUNT(be.ISBN) AS "Book Count"
FROM 		editors e
            JOIN editor e
				ON e.editorId = e.editorId
GROUP BY 	e.name, e.editorId;

#7.9. Books in an order.
SELECT 		o.orderid, COUNT(bo.ISBN) AS "Book Count"
FROM 		orders o
            JOIN order o
				ON o.orderId = b.orderId
GROUP BY 	o.orderId;

#7.10. Orders for a book.
SELECT 		b.title, COUNT(bo.orderNo) AS "Order Count"
FROM 		books b
            JOIN order o
				ON b.ISBN = o.ISBN
GROUP BY 	b.title;

#7.11. Customer orders.
SELECT 		c.customerId, c.firstName, c.lastName, 
            o.orderId
FROM 		customers c
            JOIN customers c
				ON o.customerId = c.customerId;

#7.12. Orders per customer.
SELECT 		c.firstName, c.lastName, COUNT(co.orderNo) AS "Order Count"
FROM 		customers c
            JOIN customers c
				ON c.customerId = o.customerId
GROUP BY 	c.firstName, c.lastName;