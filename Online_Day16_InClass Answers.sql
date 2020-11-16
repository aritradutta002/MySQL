create database Day16;
use Day16;


-- Host: localhost    Database: day16
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department_details`
--

DROP TABLE IF EXISTS `department_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_details` (
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_NAME` text,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_details`
--

LOCK TABLES `department_details` WRITE;
/*!40000 ALTER TABLE `department_details` DISABLE KEYS */;
INSERT INTO `department_details` VALUES (100,10,'Administration',200,1700),(101,20,'Marketing',201,1800),(102,30,'Human Resources	',202,1700),(103,40,'Shipping',203,2400),(104,50,'IT	',204,1700),(105,60,'Public Relations	',108,2700),(106,70,'Executive',119,1900),(107,80,'Finance',117,2000),(108,90,'Corporate Tax	',120,2001),(109,100,'Contracting',121,1700),(110,110,'Operations',90,1700),(111,120,'Government Sales	',90,1700),(112,130,'Payroll',60,1700),(113,140,'IT Support	',156,1700),(114,150,'NOC',145,1600),(115,160,'IT Helpdesk	',123,1800),(116,170,'Manufacturing',208,1600),(117,180,'Construction',210,1800),(118,190,'Contracting',234,1700);
/*!40000 ALTER TABLE `department_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details` (
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `FIRST_NAME` text,
  `LAST_NAME` text,
  `EMAIL` text,
  `PHONE_NUMBER` text,
  `HIRE_DATE` text,
  `JOB_ID` text,
  `SALARY` int(11) DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details`
--

LOCK TABLES `employee_details` WRITE;
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
INSERT INTO `employee_details` VALUES (100,'Steven','King','Steven@gmail.com','515.125.678','17-06-2017','AD_PRES',24000,100,90),(101,'Ross','Kochhar','Rkochhar@yahoo.com','590.126.679','23-01-2001','AD_VP',50806,100,90),(102,'Alex','Urman','AlexUrman@gmail.com','515.123.245','31-08-2002','IT_PROG',54071,102,90),(103,'Bruce','Popp','Bruce@gmail.com','515.125.679','08-04-2003','FI_MGR',26969,103,60),(104,'David','Raphaely','Raphaely@gmail.com','590.126.680','15-11-2009','PU_MAN',34048,105,60),(105,'Nancy','Khoo','Nancy@gmail.com','515.123.246','23-06-2005','ST_CLERK',46206,113,70),(106,'John','Baida','John@yahoo.com','515.125.680','29-01-2009','AC_ACCOUNTANT',63090,123,70),(107,'Daniel','Weiss','Weiss@yahoo.com','590.126.681','06-09-1902','AD_PRES',56356,131,70),(108,'Sigal','Kaufling','Kaufling@yahoo.com','515.123.247','17-06-2017','AD_VP',23488,111,60),(109,'Adam','Vollman','Adam@gmail.com','515.125.681','23-01-2001','IT_PROG',29047,114,90),(110,'Mathew','Himuro','Himuro@yahoo.com','590.126.682','17-06-2017','FI_MGR',51428,145,100),(111,'Harvey','Mikkilineni','Harvey@gmail.com','515.123.248','23-01-2001','PU_MAN',61770,145,100),(112,'Kevin','Rogers','Rogers@yahoo.com','515.125.682','17-06-2017','ST_CLERK',30897,112,70),(113,'Julia','Patel','Julia@yahoo.com','590.126.683','23-01-2001','AC_ACCOUNTANT',59197,131,80),(114,'Irene','Davies','Davies@gmail.com','515.123.249','17-06-2017','AD_PRES',61211,121,80),(115,'James','Zlotkey','James@gmail.com','515.125.683','23-01-2001','AD_VP',43386,116,80),(116,'Jason','Bernstein','Bernstein@yahoo.com','590.126.684','17-06-2017','IT_PROG',27978,117,100),(117,'Peter','Hall','Hall@gmail.com','515.123.250','23-01-2001','FI_MGR',46632,118,80),(118,'Sartha','Sully','Sartha@gmail.com','515.125.684','17-06-2017','PU_MAN',66662,121,60),(119,'William','Smith','Smith@yahoo.com','590.126.685','23-01-2001','ST_CLERK',38628,120,70),(120,'Jack','Greene','Jgreene@gmail.com','515.123.251','17-06-2017','AC_ACCOUNTANT',20068,119,90);
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

##############################################
select * from employee_details;
select * from department_details;

# Q.1 Create a view "details" that contains the columns employee_id, first_name, last_name and the salary from the table "employee_details".
 
 create view details as
 select employee_id , first_name , last_name, salary from employee_details;
 select * from details;
 
# Q.2 Update the view "details" such that it contains the records from the columns employee_id, first_name, last_name, salary, hire_date and job_id 
-- --  where job_id is ‘IT_PROG’.

create or replace view details as
select employee_id , first_name , last_name , salary, hire_date, job_id from employee_details where job_id = 'IT_PROG';

# Q.3 Create a view "check_salary" that contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary should be greater than 50000.

create view check_salary as
select employee_id , first_name , last_name, job_id, salary from employee_details where salary > 50000;
select * from check_salary;

# Q.4 Create a view "location_details" that contains the records from the columns department_name, manager_id and the location_id from the table "department_details" 
-- --  where the department_name is ‘Shipping’.
 
 create view location_details as
 select department_name , manager_id , location_id from department_details where department_name = 'Shipping';
 select * from location_details;
 
# Q.5 Create a view "salary_range" such that it contains the records from the columns employee_id, first_name, last_name, job_id and salary from the table "employee_details" 
-- --  where the salary is in the range (30000 to 50000).

create view salary_range as
select employee_id , first_name , last_name, job_id, salary from employee_details where salary between 30000 and 50000;
select * from salary_range;

# Q.6 Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".

create or replace view employee_department as
select e.employee_id , first_name , last_name , job_id , salary , e.manager_id , e.department_id , department_name
from employee_details e join department_details d on e.employee_id = d.employee_id;
select * from employee_department;

# Q.7 Create a view "pattern_matching" such that it contains the records from the columns employee_id, first_name, job_id and salary from the table name "employee_details" 
-- --  where first_name ends with "l".

create view pattern_matching as
select employee_id , first_name , job_id , salary from employee_details where first_name like '%l';
select* from pattern_matching;

# Q.8 Drop multiple existing views "pattern_matching", "salary" and "location_details".

drop view pattern_matching,location_details,salary_range,check_salary;

