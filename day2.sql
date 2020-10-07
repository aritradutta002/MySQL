CREATE TABLE student
(
student_id INT,
name VARCHAR(50),
age INT
);
DESC student;

CREATE TABLE employees
(
emp_id INT,
name VARCHAR(50),
dept VARCHAR(50),
doj DATE,
salary FLOAT
);
DESC employees;

DROP TABLE student;

ALTER TABLE employees ADD(designation VARCHAR(20));
ALTER TABLE employees ADD(subject VARCHAR(20));

ALTER TABLE employees DROP subject;

ALTER TABLE employees MODIFY name VARCHAR(35);

ALTER TABLE employees MODIFY salary INT;
# comment - way 1
-- comment - way 2
/* inline comments */
/* multi-line
comment */



-- DAY 2
#CHANGE is used to change the name of the columns as well as the DATATYPE

ALTER TABLE employees CHANGE designation desig VARCHAR(25);

ALTER TABLE employees MODIFY salary FLOAT;

INSERT INTO employees VALUES (101, 'Alex', 'MKT', '2020/06/23', 5000, 'MGR');
INSERT INTO employees (emp_id, name, salary) VALUES (102, 'Jobes', 7000);

SELECT * FROM employees;

-- UPDATE is used to update an existing record

UPDATE employees SET dept = 'sales' WHERE name = 'Jobes';

UPDATE employees SET dept = 'SALES', doj = '2019-05-12', desig = 'Executive' WHERE emp_id = 102;

INSERT INTO employees VALUES (103, 'Gaurav', 'MKT', '2000/06/21', 8000, 'MGR');
INSERT INTO employees VALUES (104, 'Monisha', 'MKT', '2000/05/23', 6000, 'JR.MGR');
INSERT INTO employees VALUES (105, 'Manu', 'MKT', '2001/05/13', 9000, 'MGR');

UPDATE employees SET desig = 'EXEC' WHERE emp_id = 102;
UPDATE employees SET desig = 'SR.MGR' WHERE emp_id = 103;

DELETE FROM employees WHERE emp_id = 103;

CREATE TABLE dt
(
dte DATE,
dtime DATETIME,
t1 TIME
);

DESC dt;

INSERT INTO dt VALUES (CURRENT_DATE(), NOW(), CURRENT_TIME(), UTC_TIMESTAMP());
INSERT INTO dt VALUES ('2020/05/05', '2020/01/01 10:23:25', '14:53:15');

ALTER TABLE dt ADD utctime TIMESTAMP;


SELECT * FROM dt;

#How to delete multiple rows, and how to delete a specific value?

SELECT * FROM employees WHERE emp_id > 100;
SELECT * FROM employees WHERE desig <> 'MGR';
SELECT * FROM employees WHERE emp_id > 101;
SELECT * FROM employees WHERE emp_id >= 101;
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 6000;
SELECT * FROM employees WHERE emp_id = 101 OR emp_id = 102;
SELECT * FROM employees WHERE name LIKE 'a%';

SELECT name, salary, salary + 1000 AS 'revised salary' FROM employees;
SELECT DISTINCT desig FROM employees;
SELECT COUNT(*) from employees;