-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: new_camel_poc_4
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `diagnosis_details`
--

DROP TABLE IF EXISTS `diagnosis_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_details` (
  `diagnosis_id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_details`
--

LOCK TABLES `diagnosis_details` WRITE;
/*!40000 ALTER TABLE `diagnosis_details` DISABLE KEYS */;
INSERT INTO `diagnosis_details` VALUES (215321,'Morning blood test before lunch','Type1 Diabetes');
/*!40000 ALTER TABLE `diagnosis_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_details`
--

DROP TABLE IF EXISTS `equipment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_details` (
  `equipment_id` int NOT NULL,
  `allocation_date_time` varchar(255) DEFAULT NULL,
  `equipment_name` varchar(255) DEFAULT NULL,
  `in_used` tinyint(1) DEFAULT (false),
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_details`
--

LOCK TABLES `equipment_details` WRITE;
/*!40000 ALTER TABLE `equipment_details` DISABLE KEYS */;
INSERT INTO `equipment_details` VALUES (23242,'2024-05-24 13:23:44','Patient Monitors',0),(23243,'2024-05-30 13:23:44','Glucose Monitor',1);
/*!40000 ALTER TABLE `equipment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_details`
--

DROP TABLE IF EXISTS `nurse_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse_details` (
  `nurse_id` int NOT NULL,
  `age` int NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_details`
--

LOCK TABLES `nurse_details` WRITE;
/*!40000 ALTER TABLE `nurse_details` DISABLE KEYS */;
INSERT INTO `nurse_details` VALUES (21323,34,'8353275332','1990-03-04','Linda','Female','Anderson','Nurse'),(21324,37,'8353275332','1990-03-04','Lisa','Female','Anderson','Nurse');
/*!40000 ALTER TABLE `nurse_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_demographic_details`
--

DROP TABLE IF EXISTS `patient_demographic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_demographic_details` (
  `patient_id` int NOT NULL,
  `age` int NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_demographic_details`
--

LOCK TABLES `patient_demographic_details` WRITE;
/*!40000 ALTER TABLE `patient_demographic_details` DISABLE KEYS */;
INSERT INTO `patient_demographic_details` VALUES (1234,27,'9284008545','1997-07-14','Tanmay','Male',_binary '','Patil','Patient'),(1235,27,'9284008545','1997-06-06','Kavita','Female',_binary '\0','Patil','Patient');
/*!40000 ALTER TABLE `patient_demographic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_details`
--

DROP TABLE IF EXISTS `treatment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_details` (
  `treatment_id` int NOT NULL,
  `treatment_end_date_time` varchar(255) DEFAULT NULL,
  `treatment_name` varchar(255) DEFAULT NULL,
  `treatment_start_date_time` varchar(255) DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `equipment_id` int DEFAULT NULL,
  `nurse_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `FKc96aposfvn4uqx4085t86yvqd` (`diagnosis_id`),
  KEY `FKn7a4ad2mvn7wxmvmcyvuc84c4` (`equipment_id`),
  KEY `FKdlx3l13u3drgx9lldpv4kvi85` (`nurse_id`),
  KEY `FKnm1uahvq79i2d93uq5n1b4y4q` (`patient_id`),
  CONSTRAINT `FKc96aposfvn4uqx4085t86yvqd` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis_details` (`diagnosis_id`),
  CONSTRAINT `FKdlx3l13u3drgx9lldpv4kvi85` FOREIGN KEY (`nurse_id`) REFERENCES `nurse_details` (`nurse_id`),
  CONSTRAINT `FKn7a4ad2mvn7wxmvmcyvuc84c4` FOREIGN KEY (`equipment_id`) REFERENCES `equipment_details` (`equipment_id`),
  CONSTRAINT `FKnm1uahvq79i2d93uq5n1b4y4q` FOREIGN KEY (`patient_id`) REFERENCES `patient_demographic_details` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_details`
--

LOCK TABLES `treatment_details` WRITE;
/*!40000 ALTER TABLE `treatment_details` DISABLE KEYS */;
INSERT INTO `treatment_details` VALUES (4326517,'2024-05-30 15:23:44','Blood Test','2024-05-30 13:23:44',215321,23243,21323,1234),(4326518,'2024-05-30 15:23:44','Blood Test','2024-05-30 13:23:44',215321,23243,21324,1235);
/*!40000 ALTER TABLE `treatment_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 18:23:58
