SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM borrowed_books;
SELECT * FROM employees;
SELECT * FROM users;



-- GROUP BY Task
SELECT user_id, COUNT(*) FROM borrowed_books
GROUP BY user_id
ORDER BY COUNT(*) DESC;

SELECT COUNT(*), genre FROM books
GROUP BY genre;

SELECT COUNT(*), library_branch FROM employees
GROUP BY library_branch;


-- HAVING Task

SELECT user_id, COUNT(*) FROM borrowed_books
GROUP BY user_id
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;


SELECT COUNT(*), genre FROM books
GROUP BY genre
HAVING COUNT(*) > 10;

SELECT COUNT(*), library_branch FROM employees
GROUP BY library_branch
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;



-- Union, Intersect, Except Tasks

SELECT first_name, last_name FROM users
UNION
SELECT first_name, last_name FROM employees;



SELECT country FROM users
UNION ALL
SELECT country FROM employees;


SELECT country FROM users
UNION 
SELECT country FROM employees;


SELECT first_name FROM users
INTERSECT
SELECT first_name FROM employees;


SELECT country FROM users
INTERSECT
SELECT country FROM employees;


SELECT first_name FROM users
EXCEPT
SELECT first_name FROM employees;


SELECT country FROM users
EXCEPT
SELECT country FROM employees;





-- JOINS task
SELECT users.first_name, users.last_name, COUNT(borrowed_books.borrow_date)
FROM users
INNER JOIN borrowed_books ON borrowed_books.user_id = users.user_id
GROUP BY (users.first_name, users.last_name)
ORDER BY COUNT(borrowed_books.borrow_date)
LIMIT 10;




SELECT users.first_name, users.last_name, users.phone_number, users.email, books.title, books.isbn, borrowed_books.borrow_date
FROM users
LEFT JOIN borrowed_books ON borrowed_books.user_id = users.user_id
LEFT JOIN books ON borrowed_books.book_id = books.book_id
WHERE books.title IS NOT NULL;



SELECT users.first_name, users.last_name, users.phone_number, users.email, books.title, books.isbn, borrowed_books.borrow_date
FROM users
LEFT JOIN borrowed_books ON borrowed_books.user_id = users.user_id
LEFT JOIN books ON borrowed_books.book_id = books.book_id
WHERE books.title IS NOT NULL;



SELECT users.first_name, users.last_name, COUNT(DISTINCT borrowed_books.borrow_date)
FROM users
LEFT JOIN borrowed_books ON borrowed_books.user_id = users.user_id
WHERE borrowed_books.borrow_date IS NOT NULL
GROUP BY users.first_name, users.last_name
ORDER BY COUNT(borrowed_books.borrow_date) DESC;



SELECT employees.first_name, employees.last_name, employees.country, library_branch.branch_name 
FROM employees
FULL JOIN library_branch ON library_branch.branch_id = employees.employee_id
JOIN users ON users.country = employees.country
WHERE employees.library_branch IS NOT NULL AND employees.country = 'USA';





