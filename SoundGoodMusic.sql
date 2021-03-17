-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: SoundGoodMusic
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `person_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`person_id`,`email`),
  CONSTRAINT `FK_email_0` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1001,'johan.svensson@live.com'),(1003,'behnam.eliasi@hotmail.se'),(1004,'robert.akhbari@kth.se'),(1005,'pontus.lind@kth.se'),(1006,'maja.abbas@yahoo.ca');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensembles`
--

DROP TABLE IF EXISTS `ensembles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensembles` (
  `ensemble_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `seats_taken` int DEFAULT NULL,
  PRIMARY KEY (`ensemble_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensembles`
--

LOCK TABLES `ensembles` WRITE;
/*!40000 ALTER TABLE `ensembles` DISABLE KEYS */;
INSERT INTO `ensembles` VALUES (9001,'2021-01-10 00:00:00','pop',3),(9002,'2021-01-10 00:00:00','jazz',1),(9003,'2021-01-11 00:00:00','metal',9),(9004,'2021-01-12 00:00:00','country',5),(9005,'2021-01-13 00:00:00','reggae',3),(9006,'2021-02-08 00:00:00','hiphop',7),(9007,'2021-03-20 00:00:00','pop',9),(9008,'2021-03-20 00:00:00','country',5),(9009,'2021-03-22 00:00:00','jazz',2),(9010,'2021-03-23 00:00:00','pop',10);
/*!40000 ALTER TABLE `ensembles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_schedule`
--

DROP TABLE IF EXISTS `group_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_schedule` (
  `group_id` int NOT NULL,
  `lesson_id` int DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_schedule`
--

LOCK TABLES `group_schedule` WRITE;
/*!40000 ALTER TABLE `group_schedule` DISABLE KEYS */;
INSERT INTO `group_schedule` VALUES (8001,4004,'pop','2021-03-01'),(8002,4004,'jazz','2021-03-03'),(8003,4004,'classic','2021-03-15'),(8004,4004,'classic','2021-03-18'),(8005,4005,'pop','2021-03-22'),(8006,4005,'jazz','2021-03-23');
/*!40000 ALTER TABLE `group_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructor_id` int NOT NULL,
  `person_id` int NOT NULL,
  `skill_level` varchar(100) NOT NULL,
  PRIMARY KEY (`instructor_id`,`person_id`),
  KEY `FK_instructor_0` (`person_id`),
  CONSTRAINT `FK_instructor_0` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (2001,1004,'Beginner, Intermediate, Advanced'),(2002,1005,'Beginner, Intermediate, Advanced');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrument` (
  `instrument_id` int NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `brand` varchar(15) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (5001,'Guitar','Dragonfly',50,5,'pop'),(5002,'Guitar','Killer',70,3,'country'),(5003,'Piano','Yamaha',50,3,'jazz'),(5004,'Piano','Casio',100,1,'metal'),(5005,'Trumpet','King',30,0,NULL),(5006,'Trumpet','Armstrong',70,5,'pop'),(5007,'Violin','Ceclilio',100,0,NULL),(5008,'Violin','Mendini',120,4,'hiphop'),(5009,'Drum','Tama',30,0,'classic'),(5010,'Drum','Sonor',60,3,'pop');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `typeOfLesson` varchar(15) NOT NULL,
  `level` varchar(15) NOT NULL,
  `audition` char(10) DEFAULT NULL,
  `genre` char(10) DEFAULT NULL,
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (4001,'Individual','Beginner',NULL,NULL),(4002,'Individual','Intermediate',NULL,'metall'),(4003,'Individual','Advanced',NULL,'pop'),(4004,'Group','Beginner',NULL,NULL),(4005,'Group','Intermediate',NULL,NULL),(4006,'Group','Advanced',NULL,NULL),(4007,'Ensemble','Beginner',NULL,'country'),(4008,'Ensemble','Intermediate',NULL,'pop'),(4009,'Ensemble','Advanced',NULL,'country');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL,
  `ssn` varchar(12) NOT NULL,
  `firstname` char(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1001,'199901011111','Johan','Svensson',21,'Skolvägen 10','16035','Stockholm'),(1002,'199801021234','Mohammad','Ahmed',22,'Kistavägen 15','16543','Spånga'),(1003,'199707013214','Behnam','Eliasi',23,'Finlandsgatan 12','15323','Kista'),(1004,'197501014311','Robert','Akhbari',45,'Kistagången 16','16214','Kista'),(1005,'198005045433','Pontus','Lind',40,'Kistagången 16','16214','Kista'),(1006,'199501034323','Maja','Abbas',25,'Pajalagatan 32','11325','Vällingby'),(1007,'199203042167','Linda','Hagman',28,'Hemvägen 12','11243','Stockholm'),(1008,'199003236546','Amanda','Ali Mansoor',30,'Attackgatan 15','18081','Huddinge'),(1009,'201009101231','Philip','Ericsson',10,'Råckstavägen 10','17878','Hässelby'),(1010,'201212100122','Mimmi','Söderlind',8,'Timmervägen 45','14252','Skogås');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `person_id` int NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  PRIMARY KEY (`person_id`,`phone_no`),
  CONSTRAINT `FK_phone_0` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1001,'0704682573'),(1002,'0722283214'),(1003,'0738965542'),(1004,'0762737906'),(1004,'084202011'),(1005,'0736393824'),(1005,'084121101'),(1006,'0705836212'),(1007,'0731234567'),(1008,'0722205049'),(1009,'0721294233');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `person_id` int NOT NULL,
  `sibling_person_id` int DEFAULT NULL,
  `audition` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`person_id`),
  KEY `FK_student_0` (`person_id`),
  CONSTRAINT `FK_student_0` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (3001,1001,NULL,NULL),(3002,1002,NULL,NULL),(3003,1003,NULL,NULL),(3004,1006,NULL,NULL),(3005,1007,1010,NULL),(3006,1008,NULL,NULL),(3007,1009,NULL,NULL),(3008,1010,1007,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_instrument`
--

DROP TABLE IF EXISTS `student_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_instrument` (
  `instrument_id` int NOT NULL,
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `rental_date` datetime NOT NULL,
  `cancellation` datetime DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  KEY `FK_student_instrument_1` (`instrument_id`),
  KEY `FK_student_instrument_0` (`student_id`),
  CONSTRAINT `FK_student_instrument_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_instrument`
--

LOCK TABLES `student_instrument` WRITE;
/*!40000 ALTER TABLE `student_instrument` DISABLE KEYS */;
INSERT INTO `student_instrument` VALUES (5001,6009,3001,'2021-01-16 06:17:21',NULL),(5002,6010,3001,'2021-02-10 09:18:15',NULL),(5008,6011,3002,'2021-02-16 10:18:22',NULL),(5009,6012,3002,'2021-02-01 08:18:35',NULL),(5010,6013,3003,'2021-03-12 12:18:59',NULL),(5004,6014,3003,'2021-03-16 03:19:32',NULL),(5010,6015,3004,'2021-03-16 10:36:31','2021-03-16 10:48:06'),(5010,6016,3004,'2021-03-16 10:47:49','2021-03-16 10:48:06'),(5010,6017,3004,'2021-03-16 10:49:39',NULL),(5010,6018,3004,'2021-03-16 10:50:17',NULL);
/*!40000 ALTER TABLE `student_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_lesson_instructor`
--

DROP TABLE IF EXISTS `student_lesson_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_lesson_instructor` (
  `student_id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  `lesson_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `start_date` date NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`student_id`,`lesson_id`,`instructor_id`),
  KEY `FK_student_lesson_instructor_1` (`lesson_id`),
  KEY `FK_student_lesson_instructor_0` (`student_id`,`person_id`),
  KEY `FK_student_lesson_instructor_2` (`instructor_id`,`person_id`),
  CONSTRAINT `FK_student_lesson_instructor_0` FOREIGN KEY (`student_id`, `person_id`) REFERENCES `student` (`student_id`, `person_id`),
  CONSTRAINT `FK_student_lesson_instructor_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `FK_student_lesson_instructor_2` FOREIGN KEY (`instructor_id`, `person_id`) REFERENCES `instructor` (`instructor_id`, `person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_lesson_instructor`
--

LOCK TABLES `student_lesson_instructor` WRITE;
/*!40000 ALTER TABLE `student_lesson_instructor` DISABLE KEYS */;
INSERT INTO `student_lesson_instructor` VALUES (1001,NULL,4001,1004,'2020-11-30',100),(1002,NULL,4002,1004,'2020-11-10',200),(1002,NULL,4005,1004,'2020-11-18',250),(1003,NULL,4003,1005,'2020-11-25',150),(1007,NULL,4006,1004,'2020-12-10',300),(1008,NULL,4008,1005,'2020-12-15',200),(1009,NULL,4007,1001,'2020-10-12',200);
/*!40000 ALTER TABLE `student_lesson_instructor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-17 11:34:42
