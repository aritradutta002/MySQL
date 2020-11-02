#Referential Cycles
/*
Step 1: Insert some values into first table - leave the FK null
Step 2: Insert complete data in table 2 - include the FK values as well.
Step 3: Write update statement to update the FK in table 1.
*/
/*
Scenario Question:
1. Create table - parts - partno ,partname, dno
2. Create table - distributor - dno , dname, partno
3. Insert data into both tables
*/

Create table Parts
(
partno int Primary key,
partname varchar(20),
dno int 
);

Create table Distributor
(
dno int Primary Key,
dname varchar(30),
partno int 
);

alter table Parts 
add constraint pfk1 foreign key(dno) references Distributor(dno);
alter table distributor 
add constraint dfk1 foreign key(partno) references Parts(partno);

#Both insert statments throw errors because of referential cycles
insert into Parts(partno,partname,dno)
values (10,'abc',201);

insert into distributor(dno,dname,partno)
values (201,'Dabc',10);


#Break the referenctial cycle and insert the values 
#using the above mentioned steps.
  
# Step1:
insert into Parts(partno,partname,dno)
values (10,'abc',NULL);

#Step2 :
insert into distributor(dno,dname,partno)
values (201,'Dabc',10);

#Step3:
update parts
set dno=201
where partno=10;


/*
#Follow the instructions and create code.

1. Create a table as below:
    employee  - empid
				empname
                deptid
                
	department - depid
				 depname
                 depmgr_empid
 */               

create table employee (
emp_id int  primary key,
emp_name varchar(20),
dept_id int
);

create table department (
dep_id int primary key,
dep_name varchar(30),
deptmgr_emp_id int
);
        
/*
2. Alter table and add fk contraints 
    employee  deptid is referencing department depid
    department depmgr_empid is referencing employee empid
*/

alter table employee 
add constraint pf1 foreign key(dept_id) references department(dep_id)
ON DELETE SET NULL ON UPDATE SET NULL;

alter table department 
add constraint df1 foreign key(deptmgr_emp_id) references employee(emp_id)
ON DELETE SET NULL ON UPDATE SET NULL;


/*    
3. Insert an employee 
	100 john 10
    101 dave  20
    
   insert a department 
    10 accounts
    20 finance
*/

insert into employee values (100, 'john' ,10);
insert into employee values (101, 'dave' ,20);
insert into employee values (103, 'steve', 10);


insert into department values (10, 'Accounts' , 103);


#Step1:
insert into department values (10, 'Accounts' , NULL);

#step 2:
insert into employee values (100, 'john' ,10);
insert into employee values (103, 'steve', 10);

#Step3:
update department 
set deptmgr_emp_id = 103
where dep_id=10;

select * from department;

select * from employee;

#_____________________________________________________________________________