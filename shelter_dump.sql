-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Furever_Animal_Shelter
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Adopt`
--

DROP TABLE IF EXISTS `Adopt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adopt` (
  `adoption_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` tinyint unsigned NOT NULL,
  `AnimalID` tinyint unsigned NOT NULL,
  `adoption_date` date NOT NULL,
  PRIMARY KEY (`adoption_id`),
  KEY `owner_id` (`owner_id`),
  KEY `AnimalID` (`AnimalID`),
  CONSTRAINT `Adopt_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `Owner` (`owner_id`),
  CONSTRAINT `Adopt_ibfk_2` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adopt`
--

LOCK TABLES `Adopt` WRITE;
/*!40000 ALTER TABLE `Adopt` DISABLE KEYS */;
INSERT INTO `Adopt` VALUES (1,1,1,'2025-08-11'),(2,2,2,'2025-08-01'),(3,3,3,'2025-08-06'),(4,4,4,'2025-08-03'),(5,5,5,'2025-08-04');
/*!40000 ALTER TABLE `Adopt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `AnimalID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Age` tinyint unsigned DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Type` tinyint unsigned NOT NULL,
  `Breed` varchar(40) DEFAULT NULL,
  `DateIn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateOut` datetime DEFAULT NULL,
  `Availability` enum('AD','R','H','O') NOT NULL,
  PRIMARY KEY (`AnimalID`),
  KEY `Type` (`Type`),
  CONSTRAINT `Animal_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `AnimalType` (`TypeNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (1,'Milo',2,'M',1,'American Shorthair','2025-08-06 00:49:38',NULL,'AD'),(2,'Luna',3,'F',2,'Labrador Retriever','2025-08-06 00:49:38',NULL,'H'),(3,'Bella',1,'F',1,'Siamese','2025-08-06 00:49:38',NULL,'R'),(4,'Max',4,'M',2,'Poodle','2025-08-06 00:49:38',NULL,'AD'),(5,'Daisy',5,'F',2,'Bulldog','2025-08-06 00:49:38',NULL,'O');
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalMedicalProcedure`
--

DROP TABLE IF EXISTS `AnimalMedicalProcedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AnimalMedicalProcedure` (
  `AnimalID` tinyint unsigned NOT NULL,
  `MedicalCode` tinyint unsigned NOT NULL,
  `ProcedureDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EmployeeID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`AnimalID`,`MedicalCode`,`EmployeeID`),
  KEY `MedicalCode` (`MedicalCode`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `AnimalMedicalProcedure_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `AnimalMedicalProcedure_ibfk_2` FOREIGN KEY (`MedicalCode`) REFERENCES `MedicalProcedure` (`MedicalCode`),
  CONSTRAINT `AnimalMedicalProcedure_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalMedicalProcedure`
--

LOCK TABLES `AnimalMedicalProcedure` WRITE;
/*!40000 ALTER TABLE `AnimalMedicalProcedure` DISABLE KEYS */;
INSERT INTO `AnimalMedicalProcedure` VALUES (1,10,'2025-08-01 00:00:00',1),(2,20,'2025-08-02 00:00:00',2),(3,30,'2025-08-03 00:00:00',3),(4,10,'2025-08-04 00:00:00',4),(5,20,'2025-08-05 00:00:00',5);
/*!40000 ALTER TABLE `AnimalMedicalProcedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalType`
--

DROP TABLE IF EXISTS `AnimalType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AnimalType` (
  `TypeNum` tinyint unsigned NOT NULL,
  `TypeName` varchar(20) NOT NULL,
  PRIMARY KEY (`TypeNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalType`
--

LOCK TABLES `AnimalType` WRITE;
/*!40000 ALTER TABLE `AnimalType` DISABLE KEYS */;
INSERT INTO `AnimalType` VALUES (1,'Cat'),(2,'Dog');
/*!40000 ALTER TABLE `AnimalType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Breed`
--

DROP TABLE IF EXISTS `Breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Breed` (
  `AnimalType` tinyint unsigned NOT NULL,
  `BreedName` varchar(40) NOT NULL,
  PRIMARY KEY (`AnimalType`,`BreedName`),
  CONSTRAINT `Breed_ibfk_1` FOREIGN KEY (`AnimalType`) REFERENCES `AnimalType` (`TypeNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Breed`
--

LOCK TABLES `Breed` WRITE;
/*!40000 ALTER TABLE `Breed` DISABLE KEYS */;
INSERT INTO `Breed` VALUES (1,' Norwegian Forest'),(1,'American Shorthair'),(1,'Ragdoll'),(1,'Siamese'),(1,'Unknown'),(2,'Australian Shepherd'),(2,'Bulldog'),(2,'Chihuahua'),(2,'Labrador Retriever'),(2,'Poodle'),(2,'Unknown');
/*!40000 ALTER TABLE `Breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeID` tinyint unsigned NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Sarah','Nguyen','5551112222'),(2,'David','Kim','5552223333'),(3,'Riley','Martinez','5553334444'),(4,'Chris','Thompson','5554445555'),(5,'Pat','Lopez','5555556666');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeTraining`
--

DROP TABLE IF EXISTS `EmployeeTraining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EmployeeTraining` (
  `EmployeeID` tinyint unsigned NOT NULL,
  `Department` varchar(20) NOT NULL,
  `TrainingCompleted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmployeeID`,`Department`),
  KEY `Department` (`Department`),
  CONSTRAINT `EmployeeTraining_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `EmployeeTraining_ibfk_2` FOREIGN KEY (`Department`) REFERENCES `Training` (`Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeTraining`
--

LOCK TABLES `EmployeeTraining` WRITE;
/*!40000 ALTER TABLE `EmployeeTraining` DISABLE KEYS */;
INSERT INTO `EmployeeTraining` VALUES (1,'Intake','2025-08-06 00:54:57'),(2,'Vaccinations','2025-08-06 00:54:57'),(3,'Surgical','2025-08-06 00:54:57'),(4,'Nursery','2025-08-06 00:54:57');
/*!40000 ALTER TABLE `EmployeeTraining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedProcedureEmployee`
--

DROP TABLE IF EXISTS `MedProcedureEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedProcedureEmployee` (
  `EmployeeID` tinyint unsigned NOT NULL,
  `MedicalCode` tinyint unsigned NOT NULL,
  PRIMARY KEY (`EmployeeID`,`MedicalCode`),
  KEY `MedicalCode` (`MedicalCode`),
  CONSTRAINT `MedProcedureEmployee_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `MedProcedureEmployee_ibfk_2` FOREIGN KEY (`MedicalCode`) REFERENCES `MedicalProcedure` (`MedicalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedProcedureEmployee`
--

LOCK TABLES `MedProcedureEmployee` WRITE;
/*!40000 ALTER TABLE `MedProcedureEmployee` DISABLE KEYS */;
INSERT INTO `MedProcedureEmployee` VALUES (1,10),(4,10),(2,20),(5,20),(3,30);
/*!40000 ALTER TABLE `MedProcedureEmployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalProcedure`
--

DROP TABLE IF EXISTS `MedicalProcedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedicalProcedure` (
  `MedicalCode` tinyint unsigned NOT NULL,
  `ProcedureName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`MedicalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalProcedure`
--

LOCK TABLES `MedicalProcedure` WRITE;
/*!40000 ALTER TABLE `MedicalProcedure` DISABLE KEYS */;
INSERT INTO `MedicalProcedure` VALUES (10,'General Checkup'),(20,'Vaccinations'),(30,'Spay / Neuter');
/*!40000 ALTER TABLE `MedicalProcedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owner`
--

DROP TABLE IF EXISTS `Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Owner` (
  `owner_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owner`
--

LOCK TABLES `Owner` WRITE;
/*!40000 ALTER TABLE `Owner` DISABLE KEYS */;
INSERT INTO `Owner` VALUES (1,'Emily','Stone','101 Maple St'),(2,'John','Doe','202 Oak Ave'),(3,'Luna','West','303 Pine Blvd'),(4,'Nina','Bell','404 Cedar Ct'),(5,'Ethan','Gray','505 Birch Rd');
/*!40000 ALTER TABLE `Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `AnimalID` tinyint unsigned NOT NULL,
  `owner_id` tinyint unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_hold_date` date NOT NULL,
  `ready` enum('yes','no') NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `AnimalID` (`AnimalID`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `Owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,1,1,'2025-08-01','2025-08-10','yes'),(2,2,2,'2025-07-20','2025-07-30','no'),(3,3,3,'2025-08-05','2025-08-12','yes'),(4,4,4,'2025-08-02','2025-08-09','no'),(5,5,5,'2025-08-03','2025-08-11','yes');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Training`
--

DROP TABLE IF EXISTS `Training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Training` (
  `Department` varchar(20) NOT NULL,
  PRIMARY KEY (`Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Training`
--

LOCK TABLES `Training` WRITE;
/*!40000 ALTER TABLE `Training` DISABLE KEYS */;
INSERT INTO `Training` VALUES ('Intake'),('Nursery'),('Surgical'),('Vaccinations');
/*!40000 ALTER TABLE `Training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Volunteer`
--

DROP TABLE IF EXISTS `Volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Volunteer` (
  `VolunteerID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`VolunteerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteer`
--

LOCK TABLES `Volunteer` WRITE;
/*!40000 ALTER TABLE `Volunteer` DISABLE KEYS */;
INSERT INTO `Volunteer` VALUES (1,'Alex','Rivera','5551234567'),(2,'Jamie','Lee','5552345678'),(3,'Morgan','Smith','5553456789'),(4,'Taylor','Brown','5554567890'),(5,'Jordan','Davis','5555678901');
/*!40000 ALTER TABLE `Volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_location`
--

DROP TABLE IF EXISTS `animal_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_location` (
  `AnimalID` tinyint unsigned NOT NULL,
  `room_type` char(1) NOT NULL,
  `room_num` varchar(2) NOT NULL,
  `kennel_id` varchar(2) NOT NULL,
  PRIMARY KEY (`AnimalID`),
  UNIQUE KEY `room_type` (`room_type`,`room_num`,`kennel_id`),
  CONSTRAINT `animal_location_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`),
  CONSTRAINT `animal_location_ibfk_2` FOREIGN KEY (`room_type`, `room_num`) REFERENCES `room` (`room_type`, `room_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_location`
--

LOCK TABLES `animal_location` WRITE;
/*!40000 ALTER TABLE `animal_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foster`
--

DROP TABLE IF EXISTS `foster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foster` (
  `AnimalID` tinyint unsigned NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`AnimalID`),
  UNIQUE KEY `address` (`address`),
  CONSTRAINT `foster_ibfk_1` FOREIGN KEY (`address`) REFERENCES `foster_info` (`address`),
  CONSTRAINT `foster_ibfk_2` FOREIGN KEY (`AnimalID`) REFERENCES `Animal` (`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foster`
--

LOCK TABLES `foster` WRITE;
/*!40000 ALTER TABLE `foster` DISABLE KEYS */;
INSERT INTO `foster` VALUES (1,'1 Foster Ln'),(2,'2 Foster Ln'),(3,'3 Foster Ln'),(4,'4 Foster Ln'),(5,'5 Foster Ln');
/*!40000 ALTER TABLE `foster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foster_info`
--

DROP TABLE IF EXISTS `foster_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foster_info` (
  `foster_id` tinyint NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`foster_id`),
  UNIQUE KEY `address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foster_info`
--

LOCK TABLES `foster_info` WRITE;
/*!40000 ALTER TABLE `foster_info` DISABLE KEYS */;
INSERT INTO `foster_info` VALUES (1,'Anna','Ford','1 Foster Ln','5551110001'),(2,'Tom','Rogers','2 Foster Ln','5552220002'),(3,'Cathy','Long','3 Foster Ln','5553330003'),(4,'Ben','Hill','4 Foster Ln','5554440004'),(5,'Nora','Stone','5 Foster Ln','5555550005');
/*!40000 ALTER TABLE `foster_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_num` varchar(2) NOT NULL,
  `room_type` char(1) NOT NULL,
  `VolunteerID` tinyint unsigned NOT NULL,
  `EmployeeID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`room_type`,`room_num`),
  KEY `VolunteerID` (`VolunteerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `room_type` (`room_type`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`VolunteerID`) REFERENCES `Volunteer` (`VolunteerID`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('04','M',4,4),('03','N',3,3),('05','N',5,5),('01','S',1,1),('02','S',2,2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `room_type` char(1) NOT NULL,
  `type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`room_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES ('M','Medical Room'),('N','Nursery'),('S','Standard Room');
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 20:32:59
