Use Day9;
-- Host: localhost    Database: day9
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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int(11) DEFAULT NULL,
  `subject` text,
  `name` text,
  `marks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'English','Ross',90),(2,'English','Nancy',70),(3,'Maths','Rachel',69),(4,'Maths','Joey',59),(5,'Maths','Mike',56),(6,'Science','Harvey',60),(7,'Science','Ross',75),(8,'Science','Nancy',65),(9,'Maths','Jack',45),(10,'English','Mary',94),(11,'Maths','Nancy',100);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 16:28:00
/*--------------------------------------------------*/
-- Use students tables
# Q1. Rank the students on the basis of their marks subjectwise.

select * , rank() over (partition by subject order by marks desc) 'Rank'
from students;

# Q2. Provide the new roll numbers to the students on the basis of their names alphabetically.

select * , row_number() over(order by name) 'Roll_Number'
from students
group by name;

# Q3. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).

select * , sum(marks) over(partition by subject) 'Total_Marks'
from students;

# Q4. Display the records from the students table where partition should be done on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.

select * ,
sum(marks) over(partition by subject rows between unbounded preceding and current row ) 'Total_Marks'
from students;

# Q5. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'

create table Students_Ranked as
select * , dense_rank() over(partition by subject order by marks desc) 'marks_Rank' from students;

# Q6. Find the 2nd highest marks student subject wise.alter

select * from
(select * , dense_rank() over(partition by subject order by marks desc) 'marks_Rank' from students) s
where marks_rank = 2;