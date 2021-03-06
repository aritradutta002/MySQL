#Section A (Book table)
use li;
#1.	Write a query to print the unique author names in the dataset.

select distinct authors 
from book;

#2.	Write a query to print the information about the books published between the years 1996 to 2006 which have a rating more than 3.5.

select * 
from book 
where original_publication_year between 1996 and 2006 and average_rating > 3.5;

#3.	Write a query to print the Book count corresponding to each Genre in the dataset.

select Genre, count(Id) 'Number of Boooks' 
from book 
group by genre;

#4.	Write a query to print the Book count corresponding to each Genre which have a rating more than 3.7 in the dataset.

select Genre, count(Id) 'Number of Boooks'
from book 
where ratings_1 > 3.5 
group by genre;

#5.	Write a query to find the name of the cheapest book.

select title
from book
where price_per_book = (select min(price_per_book) from book);

#6.	Write a query to display a column namely Revenue_2017,which will indicate the Revenue generated by each book in the year 2017.

select title, sell_count_2017 * price_per_book 'Revenue_2017' 
from book;

#7.	Write a query to print the name of the books and the corresponding author names whose work_text_reviews_count is greater than 100 and rating is more than 3.6

select title, authors
from book
where work_text_reviews_count > 100 and average_rating > 3.6;

#8.	Write a query to print the Genre of the books  that have got 5 least Revenue in the year 2017.

select title,genre, sell_count_2017 * price_per_book 'Revenue' 
from book
order by revenue asc
limit 5;

#9.	Write a query to print the Genre of the books that has got the best Revenue Increase from the year 2017 to 2018

select title,genre, (sell_count_2018 * price_per_book) - (sell_count_2017 * price_per_book) Revenue_diff
from book
order by Revenue_diff desc
limit 1;

#10.	Write a query to show the price Fluctuations for the books written by A.A. Milne, Ernest H. Shepard over the years chronologically(latest year to earliest year).

select authors, price_per_book, original_publication_year
from book
where authors like '%A.A. Milne%'
order by original_publication_year desc;

#11.	Write a query to print the number of books with non available data for language_code.

select count(*)
from book
where language_code is Null or language_code like '';

#12.	Write a query to find the name of the latest book available with rating more than 4.5 in the dataset

select title,original_publication_year,average_rating
from book
where average_rating > 4.5
order by original_publication_year desc
limit 1;

#Section B (Employee Table)
#1.	Write a query to show the Department & Joining year for Jennice & Daniel.

select depertment, year_of_joining 
from employee
where `employee name` in ('Jennice','Daniel');

#2.	Write a query to show the Name of the Operation managers in the company.

select `employee name`,designation
from employee
where designation like '%manager%' and depertment like '%Operations%';

#3.	Write a query to show the names of the Jr. Leads whose rating is more than 3 but lesser than 4.2.

select `employee name`
from employee
where designation like 'Jr. Lead' and employee_rating between 3 and 4.2;

#4.	Write a query to show the Designation for HAzel & Tom.

select designation
from employee
where `employee name` like 'Hazel' and `employee name` like 'Tom';

#5.	Write a query to show the employee detail where Sr. Leads are earning more than Asst. Managers.

select * 
from employee_details 
where Designation = 'Sr. Lead' 
and Salary > (select min(Salary) from employee_details where Designation = 'Asst. Manager');

#Section C (HR Schema)
use hr;
#1.	Using the HR Schema, Write a Query to replace the null values in the column commission_pct to 0.

select ifnull(commission_pct,0)
from employees;

#2.	Using the HR Schema, Write a Query to print the name and  a message 'Well Paid' or 'Underpaid' if the salary is above or below 6500$ respectively.

select concat(first_name,' ',last_name) 'Employee Name', if(salary>6500,'Well Paid','Underpaid') 'Salary Status'
from employees;

select concat(first_name,' ',last_name) 'Employee Name',
case when salary>6500 then 'Well Paid'
else 'Underpaid'
end as 'Salary Status'
from employees;

#3.	Write a Query to display the word Learn from the string 'Great Learning'.

select substr('Great Learning',7,5);

#4.	Write a Query to find the number of days elapsed since the beginning of new year.

select datediff(curdate(),'2021-01-01');

#5.	Write a Query to add 5 days to the date 01-01-2020.

select adddate('2021-01-01',interval 5 day);

#Section D (HR Schema)
#1.	Using HR Schema, Write a query to fetch the first name ,last name, name of the department and the location of work of all the employees.

select first_name, last_name, department_name, street_address, postal_code, city, state_province
from employees join departments using(department_id) join locations using(location_id);

#2.	Using HR Schema, Write a Query to fetch all the departments and the names of the person managing them.

select concat(first_name,' ',last_name) 'Employee Name', department_name
from departments d left join employees e on  d.manager_id = e.employee_id;

#3.	Using HR Schema, Write a query to fetch the names of the departments that are unstaffed.

select department_name
from departments d left join employees e on d.department_id = e.department_id
where e.employee_id is null;

#4.	Using HR Schema, Write a query to identify the list of names of employees who are not assigned any work and also the list of departments that are unstaffed so that the employees can be utilised to staff the departments.

select concat(first_name,' ',last_name) 'Employee Name',department_name
from employees e left join departments d on e.department_id = d.department_id
union
select concat(first_name,' ',last_name) 'Employee Name',department_name
from employees e right join departments d on e.department_id = d.department_id;

#5.	Using HR Schema, Write a query to list the names of all people who report to the same person in department Accounting (i.e.110).

SELECT e1.employee_id,e1.first_name,e1.last_name, e1.department_id, e2.employee_id, e2.first_name,e2.last_name,e2.department_id
FROM employees e1 
JOIN employees e2
ON e1.manager_id=e2.manager_id 
AND e1.employee_id!=e2.employee_id
WHERE e2.department_id=110;

