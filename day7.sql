use hr;

select e.first_name , e.last_name , e.department_id , d.department_name from employees e 
join departments d
on e.department_id = d.department_id;

select e.first_name , e.last_name , e.department_id , d.department_name , l.city , l.state_province from employees e 
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id;

# which departments has no employee?
select d.department_id , d.department_name from employees e 
right join departments d
on e.department_id = d.department_id 
where e.employee_id is null;