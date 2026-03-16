-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cloudresourcedb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `Bill_ID` int NOT NULL,
  `Resource_ID` int DEFAULT NULL,
  `Cost_Per_Month` decimal(10,2) DEFAULT NULL,
  `Billing_Cycle` varchar(20) DEFAULT NULL,
  `Payment_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `resources` (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,101,8500.00,'Monthly','Paid'),(2,102,3000.00,'Monthly','Paid'),(3,103,9000.00,'Monthly','Pending'),(4,104,7500.00,'Monthly','Paid'),(5,105,4000.00,'Monthly','Pending'),(6,106,8800.00,'Monthly','Paid'),(7,107,5200.00,'Monthly','Paid'),(8,108,2800.00,'Monthly','Paid'),(9,109,4600.00,'Monthly','Pending'),(10,110,3100.00,'Monthly','Paid');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_providers`
--

DROP TABLE IF EXISTS `cloud_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_providers` (
  `Provider_ID` int NOT NULL,
  `Provider_Name` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Provider_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_providers`
--

LOCK TABLES `cloud_providers` WRITE;
/*!40000 ALTER TABLE `cloud_providers` DISABLE KEYS */;
INSERT INTO `cloud_providers` VALUES (1,'AWS','Asia-Pacific'),(2,'Microsoft Azure','Asia-Pacific'),(3,'Google Cloud','US-East'),(4,'IBM Cloud','Europe-West'),(5,'Oracle Cloud','US-West'),(6,'Alibaba Cloud','Asia-Pacific'),(7,'DigitalOcean','US-East'),(8,'Red Hat OpenShift','Global'),(9,'VMware Cloud','Europe-Central'),(10,'SAP Cloud Platform','Europe');
/*!40000 ALTER TABLE `cloud_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flats`
--

DROP TABLE IF EXISTS `flats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flats` (
  `Flat_ID` int NOT NULL,
  `Society_ID` int DEFAULT NULL,
  `Owner_ID` int DEFAULT NULL,
  `Flat_Number` varchar(10) DEFAULT NULL,
  `Floor_No` int DEFAULT NULL,
  `Flat_Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Flat_ID`),
  KEY `Society_ID` (`Society_ID`),
  KEY `Owner_ID` (`Owner_ID`),
  CONSTRAINT `flats_ibfk_1` FOREIGN KEY (`Society_ID`) REFERENCES `society` (`Society_ID`),
  CONSTRAINT `flats_ibfk_2` FOREIGN KEY (`Owner_ID`) REFERENCES `owners` (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flats`
--

LOCK TABLES `flats` WRITE;
/*!40000 ALTER TABLE `flats` DISABLE KEYS */;
INSERT INTO `flats` VALUES (101,1,1,'A-101',1,'2BHK'),(102,1,2,'A-102',1,'3BHK'),(103,1,3,'B-201',2,'2BHK'),(104,2,4,'C-301',3,'1BHK'),(105,2,5,'C-302',3,'2BHK'),(106,3,1,'D-401',4,'3BHK'),(107,3,6,'D-402',4,'2BHK'),(108,4,7,'E-101',1,'2BHK'),(109,4,8,'E-102',1,'3BHK'),(110,5,9,'F-201',2,'1BHK');
/*!40000 ALTER TABLE `flats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `Maintenance_ID` int NOT NULL,
  `Flat_ID` int DEFAULT NULL,
  `Month` varchar(20) DEFAULT NULL,
  `Amount` decimal(8,2) DEFAULT NULL,
  `Payment_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Maintenance_ID`),
  KEY `Flat_ID` (`Flat_ID`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`Flat_ID`) REFERENCES `flats` (`Flat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,101,'January',2500.00,'Paid'),(2,102,'January',3000.00,'Paid'),(3,103,'January',2500.00,'Pending'),(4,104,'January',2000.00,'Paid'),(5,105,'January',2200.00,'Pending'),(6,106,'January',3200.00,'Paid'),(7,107,'January',2400.00,'Paid'),(8,108,'January',2600.00,'Pending'),(9,109,'January',3100.00,'Paid'),(10,110,'January',1800.00,'Paid');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `Owner_ID` int NOT NULL,
  `Owner_Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Arjun Kumar','9876543210','arjun@gmail.com'),(2,'Priya Sharma','9845612378','priya@gmail.com'),(3,'Ravi Mehta','9823456712','ravi@gmail.com'),(4,'Sneha Patel','9898123456','sneha@gmail.com'),(5,'Amit Verma','9812345678','amit@gmail.com'),(6,'Neha Singh','9871234560','neha@gmail.com'),(7,'Rahul Nair','9965321478','rahul@gmail.com'),(8,'Anjali Rao','9887766554','anjali@gmail.com'),(9,'Karthik R','9845123678','karthik@gmail.com'),(10,'Pooja Das','9834567123','pooja@gmail.com');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residents`
--

DROP TABLE IF EXISTS `residents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residents` (
  `Resident_ID` int NOT NULL,
  `Flat_ID` int DEFAULT NULL,
  `Resident_Name` varchar(50) DEFAULT NULL,
  `Resident_Type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Resident_ID`),
  KEY `Flat_ID` (`Flat_ID`),
  CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`Flat_ID`) REFERENCES `flats` (`Flat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residents`
--

LOCK TABLES `residents` WRITE;
/*!40000 ALTER TABLE `residents` DISABLE KEYS */;
INSERT INTO `residents` VALUES (1,101,'Arjun Kumar','Owner'),(2,102,'Priya Sharma','Owner'),(3,103,'Ravi Mehta','Owner'),(4,104,'Anjali Rao','Tenant'),(5,105,'Karthik R','Tenant'),(6,106,'Sneha Patel','Tenant'),(7,107,'Neha Singh','Tenant'),(8,108,'Rahul Nair','Owner'),(9,109,'Anjali Rao','Owner'),(10,110,'Pooja Das','Tenant');
/*!40000 ALTER TABLE `residents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_allocation`
--

DROP TABLE IF EXISTS `resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_allocation` (
  `Allocation_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Resource_ID` int DEFAULT NULL,
  `Allocation_Date` date DEFAULT NULL,
  PRIMARY KEY (`Allocation_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  CONSTRAINT `resource_allocation_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  CONSTRAINT `resource_allocation_ibfk_2` FOREIGN KEY (`Resource_ID`) REFERENCES `resources` (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_allocation`
--

LOCK TABLES `resource_allocation` WRITE;
/*!40000 ALTER TABLE `resource_allocation` DISABLE KEYS */;
INSERT INTO `resource_allocation` VALUES (1,1,101,'2025-01-10'),(2,2,102,'2025-01-11'),(3,3,103,'2025-01-12'),(4,4,104,'2025-01-13'),(5,5,105,'2025-01-14'),(6,6,106,'2025-01-15'),(7,7,107,'2025-01-16'),(8,8,108,'2025-01-17'),(9,9,109,'2025-01-18'),(10,10,110,'2025-01-19');
/*!40000 ALTER TABLE `resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `Resource_ID` int NOT NULL,
  `Provider_ID` int DEFAULT NULL,
  `Resource_Type` varchar(30) DEFAULT NULL,
  `Resource_Name` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Resource_ID`),
  KEY `Provider_ID` (`Provider_ID`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`Provider_ID`) REFERENCES `cloud_providers` (`Provider_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (101,1,'VM','EC2-Server-1','Running'),(102,1,'Storage','S3-Bucket-01','Active'),(103,2,'VM','Azure-VM-01','Running'),(104,2,'Database','Azure-SQL-01','Active'),(105,3,'VM','GCE-VM-01','Stopped'),(106,1,'VM','EC2-Server-2','Running'),(107,1,'Database','RDS-MySQL-01','Active'),(108,1,'Storage','S3-Bucket-02','Active'),(109,2,'VM','Azure-VM-02','Stopped'),(110,2,'Storage','Azure-Blob-01','Active');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `society` (
  `Society_ID` int NOT NULL,
  `Society_Name` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Society_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society`
--

LOCK TABLES `society` WRITE;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` VALUES (1,'Green Valley','Bengaluru'),(2,'Sunrise Residency','Chennai'),(3,'Lake View Apartments','Hyderabad'),(4,'Royal Enclave','Mumbai'),(5,'Silver Springs','Pune'),(6,'Palm Heights','Kochi'),(7,'Blue Pearl Homes','Visakhapatnam'),(8,'Emerald Greens','Noida'),(9,'Golden Nest','Delhi'),(10,'Harmony Apartments','Coimbatore');
/*!40000 ALTER TABLE `society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_monitoring`
--

DROP TABLE IF EXISTS `usage_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_monitoring` (
  `Usage_ID` int NOT NULL,
  `Resource_ID` int DEFAULT NULL,
  `CPU_Usage` decimal(5,2) DEFAULT NULL,
  `Memory_Usage` decimal(5,2) DEFAULT NULL,
  `Storage_Used_GB` int DEFAULT NULL,
  PRIMARY KEY (`Usage_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  CONSTRAINT `usage_monitoring_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `resources` (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_monitoring`
--

LOCK TABLES `usage_monitoring` WRITE;
/*!40000 ALTER TABLE `usage_monitoring` DISABLE KEYS */;
INSERT INTO `usage_monitoring` VALUES (1,101,65.40,70.20,120),(2,102,0.00,0.00,500),(3,103,78.90,82.10,250),(4,104,55.00,60.30,180),(5,105,10.50,15.40,90),(6,106,72.30,68.40,140),(7,107,48.60,52.10,200),(8,108,0.00,0.00,650),(9,109,22.80,30.50,110),(10,110,0.00,0.00,800);
/*!40000 ALTER TABLE `usage_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL,
  `User_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Arjun Kumar','arjun.kumar@cloud.com','Admin'),(2,'Priya Sharma','priya.sharma@cloud.com','Developer'),(3,'Ravi Mehta','ravi.mehta@cloud.com','Analyst'),(4,'Sneha Patel','sneha.patel@cloud.com','Developer'),(5,'Amit Verma','amit.verma@cloud.com','Analyst'),(6,'Neha Singh','neha.singh@cloud.com','Developer'),(7,'Rahul Nair','rahul.nair@cloud.com','Admin'),(8,'Anjali Rao','anjali.rao@cloud.com','Developer'),(9,'Karthik R','karthik.r@cloud.com','Analyst'),(10,'Pooja Das','pooja.das@cloud.com','Developer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilities`
--

DROP TABLE IF EXISTS `utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilities` (
  `Utility_ID` int NOT NULL,
  `Flat_ID` int DEFAULT NULL,
  `Electricity_Units` int DEFAULT NULL,
  `Water_Units` int DEFAULT NULL,
  `Gas_Units` int DEFAULT NULL,
  PRIMARY KEY (`Utility_ID`),
  KEY `Flat_ID` (`Flat_ID`),
  CONSTRAINT `utilities_ibfk_1` FOREIGN KEY (`Flat_ID`) REFERENCES `flats` (`Flat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities`
--

LOCK TABLES `utilities` WRITE;
/*!40000 ALTER TABLE `utilities` DISABLE KEYS */;
INSERT INTO `utilities` VALUES (1,101,180,25,10),(2,102,220,30,12),(3,103,200,28,11),(4,104,150,20,8),(5,105,170,22,9),(6,106,240,35,15),(7,107,190,26,10),(8,108,210,29,11),(9,109,230,32,13),(10,110,140,18,7);
/*!40000 ALTER TABLE `utilities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-16 11:25:47
