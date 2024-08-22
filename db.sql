-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_management
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diet_plan`
--

DROP TABLE IF EXISTS `diet_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plan` (
  `Diet_Pid` varchar(5) NOT NULL,
  `Nutriton` varchar(30) DEFAULT NULL,
  `Meal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Diet_Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plan`
--

LOCK TABLES `diet_plan` WRITE;
/*!40000 ALTER TABLE `diet_plan` DISABLE KEYS */;
INSERT INTO `diet_plan` VALUES ('DP101','High Protein','Breakfast'),('DP102','Low Carb','Lunch'),('DP103','High Fiber','Dinner'),('DP104','Balanced','Snacks'),('DP105','Vegetarian','Dessert');
/*!40000 ALTER TABLE `diet_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `Eqp_id` varchar(5) NOT NULL,
  `Eqp_Name` varchar(20) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Mem_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Eqp_id`),
  KEY `Mem_id` (`Mem_id`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`Mem_id`) REFERENCES `member` (`Mem_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('E001','Treadmill',5,'M1001'),('E002','Dumbell',25,'M1003'),('E003','Smith Machine',1,'M1001'),('E004','Lats Machine',5,'M1004'),('E005','Cycling Machine',4,'M1005');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `Mem_id` varchar(5) DEFAULT NULL,
  `WP_id` varchar(5) DEFAULT NULL,
  `Diet_Pid` varchar(5) DEFAULT NULL,
  KEY `Mem_id` (`Mem_id`),
  KEY `WP_id` (`WP_id`),
  KEY `Diet_Pid` (`Diet_Pid`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`Mem_id`) REFERENCES `member` (`Mem_id`) ON DELETE SET NULL,
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`WP_id`) REFERENCES `workout_plan` (`WP_id`) ON DELETE SET NULL,
  CONSTRAINT `follows_ibfk_3` FOREIGN KEY (`Diet_Pid`) REFERENCES `diet_plan` (`Diet_Pid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES ('M1001','WP101','DP101'),('M1002','WP102','DP102'),('M1003','WP103','DP103'),('M1004','WP104','DP104'),('M1005','WP105','DP105');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `Ins_id` varchar(5) NOT NULL,
  `FName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `Contact` char(10) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Ins_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('I101','John','Doe','1234567890','M'),('I102','Jane','Smith','9876543210','F'),('I103','Michael','Johnson','4567891230','M'),('I104','Sarah','Williams','7894561230','F'),('I105','David','Brown','6543217890','M');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Mem_id` varchar(10) NOT NULL,
  `FName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Contact` char(10) DEFAULT NULL,
  `Fees` int DEFAULT NULL,
  `Subscription` varchar(20) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `Ins_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Mem_id`),
  KEY `Ins_id` (`Ins_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Ins_id`) REFERENCES `instructor` (`Ins_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('12hah','ayman',NULL,33,NULL,NULL,NULL,'',NULL,NULL),('M1001','GTRT','Johnson',88,'1234567890',200,'Monthly','M','2023-01-15','I101'),('M1002','Benjamin','Williams',35,'9876543210',250,'Monthly','M','2023-02-20','I102'),('M1003','Sophia','Brown',30,'4567891230',180,'Quarterly','M','2023-03-10','I103'),('M1004','Liam','Miller',27,'7894561230',300,'Monthly','F','2023-04-05','I104'),('M1005','Ava','Taylor',40,'6543217890',220,'Monthly','F','2023-05-12','I105'),('M1006','Noah','Anderson',32,'3216549870',270,'Monthly','M','2023-06-18',NULL),('M1007','Mia','Wilson',29,'9871236540',190,'Quarterly','F','2023-07-25',NULL),('M1008','James','Martinez',31,'1593578520',280,'Monthly','M','2023-08-30','I102'),('M1009','Charlotte','Hernandez',33,'8529637410',230,'Monthly','F','2023-09-05','I104'),('M1010','William','Garcia',26,'3692581470',260,'Monthly','M','2023-10-10',NULL),('M87','DFG',NULL,55,NULL,NULL,NULL,'F',NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggests`
--

DROP TABLE IF EXISTS `suggests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggests` (
  `Workout_id` varchar(5) DEFAULT NULL,
  `Ins_id` varchar(5) DEFAULT NULL,
  `Diet_id` varchar(5) DEFAULT NULL,
  KEY `Workout_id` (`Workout_id`),
  KEY `Ins_id` (`Ins_id`),
  KEY `Diet_id` (`Diet_id`),
  CONSTRAINT `suggests_ibfk_1` FOREIGN KEY (`Workout_id`) REFERENCES `workout_plan` (`WP_id`) ON DELETE SET NULL,
  CONSTRAINT `suggests_ibfk_2` FOREIGN KEY (`Ins_id`) REFERENCES `instructor` (`Ins_id`) ON DELETE SET NULL,
  CONSTRAINT `suggests_ibfk_3` FOREIGN KEY (`Diet_id`) REFERENCES `diet_plan` (`Diet_Pid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggests`
--

LOCK TABLES `suggests` WRITE;
/*!40000 ALTER TABLE `suggests` DISABLE KEYS */;
INSERT INTO `suggests` VALUES ('WP101','I101','DP101'),('WP102','I102','DP102'),('WP103','I103','DP103'),('WP104','I104','DP104'),('WP105','I105','DP105');
/*!40000 ALTER TABLE `suggests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_plan`
--

DROP TABLE IF EXISTS `workout_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_plan` (
  `WP_id` varchar(5) NOT NULL,
  `Workout_Time` int DEFAULT NULL,
  `DUration` int DEFAULT NULL,
  `Workout` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WP_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_plan`
--

LOCK TABLES `workout_plan` WRITE;
/*!40000 ALTER TABLE `workout_plan` DISABLE KEYS */;
INSERT INTO `workout_plan` VALUES ('WP101',30,60,'Cardio'),('WP102',45,45,'Strength Training'),('WP103',60,90,'CrossFit'),('WP104',40,60,'Yoga'),('WP105',50,75,'Pilates');
/*!40000 ALTER TABLE `workout_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 23:33:09
