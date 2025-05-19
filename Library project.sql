use Library_project;
show tables;
select * from members;


/*Queries*/

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT emp_name, salary FROM employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
customer on issuestatus.Issued_cust = customer.Customer_Id;

# 4. Display the total count of books in each category.
SELECT Category, COUNT(Book_title) FROM books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT emp_name, position FROM employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);

# 7. Display the branch numbers and the total count of employees in each branch.
ALTER TABLE employee ADD COLUMN branch_no VARCHAR(10);
ALTER TABLE employee ADD CONSTRAINT FOREIGN KEY (branch_no)
REFERENCES branch(branch_no);
DESC employee;

UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E101';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E102';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E103';
UPDATE employee SET branch_no = 'B001' WHERE emp_id ='E104';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E105';
UPDATE employee SET branch_no = 'B003' WHERE emp_id ='E106';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E107';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E108';
UPDATE employee SET branch_no = 'B002' WHERE emp_id ='E109';
UPDATE employee SET branch_no = 'B004' WHERE emp_id ='E110';
UPDATE employee SET branch_no = 'B003' WHERE emp_id ='E111';

SELECT * FROM employee;

SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-06-01' AND 
issuestatus.Issue_date <= '2023-06-30';

# 9. Retrieve book_title from book table containing 'history'.
SELECT book_title FROM books WHERE Category = 'history';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no, COUNT(emp_id) FROM employee GROUP BY branch_no HAVING COUNT(Emp_id) > 5;



 