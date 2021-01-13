-- Section A
use Classicmodels;
-- 1. Using Classicmodels schema, Write a Query to find the list of customers residing in the same city.

select customerName,city 
from (select customerName,city,
	count(city) over(partition by city) as cnt 
	from customers 
    order by cnt desc) a 
where cnt > 1;


use hr;
-- 2. A Business consultant wants to draw out organisation structure for a company. 
-- He needs details about the names of the employees and the names of the persons who manage them. 
-- If the person is at the highest position then he will not have a manager , 
-- in such cases the code "Top Management Employee" must be displayed in the result set. 
-- Write a Query for the same.

SELECT e1.first_name as EmployeeName, IFNULL(e2.first_name, 'Top Management Employee') AS ManagerName
FROM Employees e1
LEFT JOIN Employees e2
ON e1.Manager_ID = e2.Employee_ID;


-- 3. A company is conducting survey and needs data of employees with same last name to be grouped together. Get a list of such employees.

select * 
from (select first_name, last_name,
	count(employee_id) over(partition by last_name) as cnt 
	from employees
    order by cnt desc) a 
where cnt > 1;

select * from employees
where last_name in (select last_name from employees group by last_name having count(last_name)>1);

use bootcamp;
-- 4 Let us consider the below tables.

-- Products (Product_id, Product_name,Price)
-- Promotions (Promotion id, Promo_name, Promo_desc)

-- Identify the promotions that can be applied to each product.

SELECT Product_id ,Product_name, Price ,Promotion_id, Promo_name, Promo_desc
FROM Products CROSS JOIN Promotions;


-- 5. A famous brand ABC has  10 outlets in Bangalore. The brand sells only its signature products in the stores. There are 25 signature products in the brand. The data is stored in the tables given below. Find the Store wise sales of every product.

-- Store(store_id, store_name,address)
-- Products(product_id,product_name, desc)
-- Purchases(store_id,product_id,purchase_id, purchase_amt)"

select p.product_id,s.store_id,sum(pu.purchase_amt) sales 
from bootcamp.products1 p 
join bootcamp.purchases pu 
on pu.product_id=p.product_id 
join bootcamp.store s 
on s.store_id=pu.store_id 
group by p.product_id,s.store_id;

select distinct store_name,address,product_Name,description,sum(purchase_amt) over(partition by product_id,store_name)  sum
from store join purchases using(store_id) join products1 using(product_id)
order by store_name;


use Classicmodels;
-- 6. Using Classicmodels schema, Write a Query to find the list of all the products with the details of code,name,productLine and text description.

select productcode, productname, p.productline, textdescription
from products p join productlines pl using (productline);

use bootcamp;
-- 7. The below data sample has details about Pizza Companies and their food distribution.

-- PizzaCompany(CompanyId,CompanyName,CompanyCity)
-- Foods(ItemId,ItemName,UnitsSold,CompanyID)

-- Suppose three waterparks (looks like summer) get opened in the state and these waterparks outsource food from the pizza outlets.

-- Generate a Report to see all the food distribution across the waterparks by the Pizza outlets."

select waterparklocation, companyname,itemname 
from waterpark w join pizzacompany p on w.companyid = p.companyid 
join foods f on f.companyid = p.companyid;

use classicmodels;
-- 8. A Retail Store XYZ recently started up in the locality. After 3 months of running the store successfully, during analysis the store manager has observed that some products were unsold. The product was not sold even once to any customer. Retail store wants to release some offers on such products. Make a list of such products for the manager.
#Use the tables from Classicmodels schema."

select * 
from products left join orderdetails using(productcode) 
where ordernumber is null;

-- 9. Using Classicmodels schema, Generate a report with all the customers their ids, names and lifetime sales from the customer.

select customernumber,customername, sum(quantityordered*priceEach) as lifetime_sales
 from customers join orders using(customernumber) join orderdetails using(ordernumber)
 group by customernumber order by lifetime_sales desc;
 
 select c.customernumber,customername, ifnull(sum(amount),0) as lifetime_sales
 from customers c left join payments p using (customernumber)
 group by c.customernumber,customername;

-- Section B
use hr;
-- 1. Using HR Schema, Write a Query to find the first day of first job of every employee.

select distinct first_name, first_value(start_date) over (partition by jh.employee_id order by start_date) as 'first_job'
from employees e join job_history jh using (employee_id);


-- 2. Using HR Schema, Write a Query to find the starting minimum salary of the first job that every employee held.

select distinct first_name, first_value(min_salary) over (partition by jh.employee_id order by start_date) as 'first_job_salary'
from employees e join job_history jh on e.employee_id = jh.employee_id 
join jobs j on jh.job_id = j.job_id;


-- 3. Using HR Schema, Write a Query to find the last day of first job of every employee.

SELECT  distinct first_name,
FIRST_VALUE(end_date) OVER (PARTITION BY jh.employee_id ORDER BY start_date) as 'first_job_end'
FROM  job_history jh 
join employees e
on jh.employee_id=e.employee_id;

use classicmodels;
-- 4. Using classicmodels Schema, Write a Query to  fetch the name of the customer along with the current and previous order date.

SELECT c.customerNumber, customerName, orderDate,
LAG(orderDate,1) OVER (PARTITION BY c.customerNumber ORDER BY orderDate ) prevOrderDate
FROM orders o
JOIN customers c
on o.customerNumber=c.customerNumber;


-- 5. Using classicmodels Schema, Write a Query to  fetch the name of the product line with sales for every Year  along with sales from the Previous year.

SELECT productLine, 
		year(orderDate) as Year, 
		sum(quantityOrdered*priceEach) as Sales,
		LAG(sum(quantityOrdered*priceEach),1)  OVER (partition by productLine ORDER BY year(orderDate)) AS prevYearSales
FROM orders o 
join orderdetails od on o.orderNumber=od.OrderNumber
join products p on p.productCode=od.productCode
group by productLine, year(orderDate) 
Order by productLine,Year;




