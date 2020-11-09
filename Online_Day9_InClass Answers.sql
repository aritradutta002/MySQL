CREATE SCHEMA IF NOT EXISTS Day9;
USE Day9;
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
-- Table structure for table `titanic_ds`
--

DROP TABLE IF EXISTS `titanic_ds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titanic_ds` (
  `Passenger_No` int(11) DEFAULT NULL,
  `first_name` text,
  `last_name` text,
  `survived` int(11) DEFAULT NULL,
  `pclass` int(11) DEFAULT NULL,
  `sex` text,
  `age` int(11) DEFAULT NULL,
  `parch` int(11) DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `embarked` text,
  `class` text,
  `who` text,
  `adult_male` text,
  `deck` text,
  `embark_town` text,
  `alive` text,
  `alone` text,
  `DECK_NUMBER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titanic_ds`
--

LOCK TABLES `titanic_ds` WRITE;
/*!40000 ALTER TABLE `titanic_ds` DISABLE KEYS */;
INSERT INTO `titanic_ds` VALUES (1,'Steven','King',0,3,'male',22,0,24000,'S','Third','man','TRUE','A','Southampton','no','FALSE',90),(2,'Ross','Kochhar',1,1,'female',38,0,50806,'C','First','woman','FALSE','C','Cherbourg','yes','FALSE',90),(3,'Alex','Urman',1,3,'female',26,0,54071,'S','Third','woman','FALSE','B','Southampton','yes','TRUE',90),(4,'Bruce','Popp',1,1,'female',35,0,26969,'S','First','woman','FALSE','C','Southampton','yes','FALSE',60),(5,'David','Raphaely',0,3,'male',35,0,34048,'S','Third','man','TRUE','C','Southampton','no','TRUE',60),(6,'Nancy','Khoo',0,3,'male',27,0,46206,'Q','Third','man','TRUE','E','Queenstown','no','TRUE',70),(7,'John','Baida',0,1,'male',54,0,63090,'S','First','man','TRUE','E','Southampton','no','TRUE',70),(8,'Daniel','Weiss',0,3,'male',2,1,56356,'S','Third','child','FALSE','G','Southampton','no','FALSE',70),(9,'Sigal','Kaufling',1,3,'female',27,2,23488,'S','Third','woman','FALSE','A','Southampton','yes','FALSE',60),(10,'Adam','Vollman',1,2,'female',14,0,29047,'C','Second','child','FALSE','B','Cherbourg','yes','FALSE',90),(11,'Mathew','Himuro',1,3,'female',4,1,51428,'S','Third','child','FALSE','G','Southampton','yes','FALSE',100),(12,'Harvey','Mikkilineni',1,1,'female',58,0,61770,'S','First','woman','FALSE','C','Southampton','yes','TRUE',100),(13,'Kevin','Rogers',0,3,'male',20,0,30897,'S','Third','man','TRUE','C','Southampton','no','TRUE',70),(14,'Julia','Patel',0,3,'male',39,5,59197,'S','Third','man','TRUE','C','Southampton','no','FALSE',80),(15,'Irene','Davies',0,3,'female',14,0,61211,'S','Third','child','FALSE','G','Southampton','no','TRUE',80),(16,'James','Zlotkey',1,2,'female',55,0,43386,'S','Second','woman','FALSE','D','Southampton','yes','TRUE',80),(17,'Jason','Bernstein',0,3,'male',2,1,27978,'Q','Third','child','FALSE','G','Queenstown','no','FALSE',100),(18,'Peter','Hall',1,2,'male',34,0,46632,'S','Second','man','TRUE','B','Southampton','yes','TRUE',80),(19,'Sartha','Sully',0,3,'female',31,0,66662,'S','Third','woman','FALSE','D','Southampton','no','FALSE',60),(20,'William','Smith',1,3,'female',29,0,38628,'C','Third','woman','FALSE','D','Cherbourg','yes','TRUE',70),(21,'Jack','Greene',0,2,'male',35,0,20068,'S','Second','man','TRUE','G','Southampton','no','TRUE',90);
/*!40000 ALTER TABLE `titanic_ds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtube_11`
--

DROP TABLE IF EXISTS `youtube_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtube_11` (
  `Category_id` int(11) DEFAULT NULL,
  `Video_id` text,
  `Publish_Date` text,
  `Trending_Date` text,
  `Channel_Title` text,
  `Description` text,
  `Trend Day` int(11) DEFAULT NULL,
  `Tag Count` int(11) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Dislikes` int(11) DEFAULT NULL,
  `Views` int(11) DEFAULT NULL,
  `comment_disabled` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtube_11`
--

LOCK TABLES `youtube_11` WRITE;
/*!40000 ALTER TABLE `youtube_11` DISABLE KEYS */;
INSERT INTO `youtube_11` VALUES (1,'V_1','29-11-2017','20-11-2017','CaseyNeistat','The Trump Presidency: Last Week Tonight with John Oliver (HBO)',6,21,13342,6089,1978978,'FALSE'),(2,'V_2','09-11-2017','20-11-2017','LastWeekTonight','Racist Superman | Rudy Mancuso, King Bach & Lele Pons',1,23,5761,3044,1487870,'TRUE'),(3,'V_3','23-11-2017','20-11-2017','Rudy Mancuso','Nickelback Lyrics: Real or Fake?',10,22,0,0,1502102,'TRUE'),(4,'V_4','07-11-2017','20-11-2017','Good Mythical Morning','I Dare You: GOING BALD!?',12,17,0,0,3519302,'TRUE'),(5,'V_5','05-11-2017','19-11-2017','nigahiga','2 Weeks with iPhone X',11,15,0,0,4835374,'TRUE'),(6,'V_6','03-11-2017','20-11-2017','iJustine','Roy Moore & Jeff Sessions Cold Open - SNL',10,9,8619,3697,1580238,'TRUE'),(7,'V_7','09-11-2017','18-11-2017','Saturday Night Live','5 Ice Cream Gadgets put to the Test',4,17,9951,937,1204461,'FALSE'),(8,'V_8','21-11-2017','19-11-2017','CrazyRussianHacker','The Greatest Showman | Official Trailer 2 [HD] | 20th Century FOX',9,14,18010,11026,2542878,'TRUE'),(9,'V_9','01-11-2017','15-11-2017','20th Century Fox','Why the rise of the robots won’t mean the end of work',8,20,12126,7855,1090597,'TRUE'),(10,'V_10','21-11-2017','15-11-2017','Vox','Dion Lewis\' 103-Yd Kick Return TD vs. Denver! | Can\'t-Miss Play | NFL Wk 10 Highlights',11,8,0,0,1407313,'TRUE'),(11,'V_11','09-11-2017','14-11-2017','NFL','(SPOILERS) \'Shiva Saves the Day\' Talked About Scene Ep. 804 | The Walking Dead',6,21,11933,9200,1293021,'TRUE');
/*!40000 ALTER TABLE `youtube_11` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 13:21:11
-----------------------------------------------------------------------------------------------

#Q1. Display the age, first_name and last_name of those passengers who has minimum age

select age , first_name , last_name from titanic_ds where age = (select  min(age) from titanic_ds);

#Q2. Display the age, first name and survival status of those passengers who survived the accident 
-- -- (Note : Survived = 1 ; Not_Survived = 0)

select age , first_name , survived from titanic_ds where survived in (select survived from titanic_ds where survived = 1);

#Q3. Display the age, first_name, last_name and pclass of those passengers where pclass is 1 or 2.

select age , first_name , last_name , pclass from titanic_ds where pclass in (select pclass from titanic_ds where pclass in (1,2));

#Q4. Display the first_name, last_name, passenger_no of the passenger who paid the maximum fare. Display the maximum fair paid by the passenger as well

select first_name , last_name , passenger_no , fare from titanic_ds where fare = (select max(fare) from titanic_ds);

#Q5. Display the survived status of all the male passengers.

select survived from titanic_ds where sex in (select sex from titanic_ds where sex = 'MALE');

#Q6. Display the passenger_no, first_name, last_name and embark_town of those passenger where embark_town should not contain any word ending with ‘rg’.

select passenger_no , first_name , last_name , embark_town from titanic_ds where embark_town in (select embark_town from titanic_ds where embark_town not like '%rg');

#Q7. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. 

select first_name , last_name , fare from titanic_ds where fare > (select avg(fare) from titanic_ds);

#Q8. Retrieve the deck, first_name, last_name and age details of all those passengers having age in between 20 to 35.

select deck_number , first_name , last_name , age from titanic_ds where age in (select age from titanic_ds where age between 20 and 35);
