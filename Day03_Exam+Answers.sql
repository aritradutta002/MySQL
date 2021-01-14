use hr;
-- 1. A Business consultant wants to draw out organisation structure for a company. 
-- He needs details about the names of the employees and the names of the persons who manage them. 
-- If the person is at the highest position then he will not have a manager , 
-- in such cases the code "Top Management Employee" must be displayed in the result set. Write a Query for the same.
-- (use hr schema)

SELECT e1.first_name as EmployeeName, IFNULL(e2.first_name, 'Top Management Employee') AS ManagerName
FROM Employees e1
LEFT JOIN Employees e2
ON e1.Manager_ID = e2.Employee_ID;

use bootcamp;
-- 2. The movies database has a table called Movies. I would like to identify the movies of the same length for my project analysis. Help me identify such movies along with the length of the  movie.
-- (use bootcamp film table)

select title 
from (select title, count(film_id) over (partition by length) cnt from film) a
where cnt > 1;

use bootcamp;
-- 3. A Family is planning to play secret santa game for christmas. Create a list who should gift to whom. The list should read as below:
-- #Givername is buying a Gift for Receivername.
-- (use bootcamp giftnames table)

SELECT concat(g1.name,' is buying a Gift for ', g2.name ) 'Secret Santa Game'
FROM giftnames g1, giftnames g2
WHERE g1.assignment = g2.id;

use classicmodels;
-- 4. Using Classicmodels schema, Write a Query to find the list of all the products with the details of code,name,productLine and text description.

select productcode, productname, p.productline, textdescription
from products p join productlines pl using (productline);

-- Below question is optional
use classicmodels;
-- 5. A Shopping ecommerce site recently performed a detailed analysis of the data. It needs a report on the list of inactive customers. 
-- The company is planning on releasing offers to convert the inactive customers into active.Make a list of such names.
-- (Use Classicmodels schema)

select c.customernumber, c.customername
from customers c left join orders o using(customernumber)
where ordernumber is null;