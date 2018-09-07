-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: computer
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Laptop`
--

DROP TABLE IF EXISTS `Laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laptop` (
  `model` int(11) DEFAULT NULL,
  `speed` decimal(3,2) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `hd` int(11) DEFAULT NULL,
  `screen` decimal(3,1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laptop`
--

LOCK TABLES `Laptop` WRITE;
/*!40000 ALTER TABLE `Laptop` DISABLE KEYS */;
INSERT INTO `Laptop` VALUES (2001,2.00,2048,240,20.1,367),(2002,1.73,1024,80,17.0,949),(2003,1.80,512,60,15.4,549),(2004,2.00,512,60,13.3,1150),(2005,2.16,1024,120,17.0,2500),(2006,2.00,2048,80,15.4,1700),(2007,1.83,1024,120,13.3,1429),(2008,1.60,1024,100,15.4,900),(2009,1.60,512,80,14.1,680),(2010,2.00,2048,160,15.4,2300);
/*!40000 ALTER TABLE `Laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PC`
--

DROP TABLE IF EXISTS `PC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PC` (
  `model` int(11) DEFAULT NULL,
  `speed` decimal(3,2) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `hd` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PC`
--

LOCK TABLES `PC` WRITE;
/*!40000 ALTER TABLE `PC` DISABLE KEYS */;
INSERT INTO `PC` VALUES (1001,2.66,1024,250,2114),(1002,2.10,512,250,995),(1003,1.42,512,80,478),(1004,2.80,1024,250,649),(1005,3.20,512,250,630),(1006,3.20,1024,320,1049),(1007,2.20,1024,200,510),(1008,2.20,2048,250,770),(1009,2.00,1024,250,650),(1010,2.80,2048,300,770),(1011,1.86,2048,160,959),(1012,2.80,1024,160,649),(1013,3.06,512,80,529),(1001,2.66,1024,250,2114),(1002,2.10,512,250,995),(1003,1.42,512,80,478),(1004,2.80,1024,250,649),(1005,3.20,512,250,630),(1006,3.20,1024,320,1049),(1007,2.20,1024,200,510),(1008,2.20,2048,250,770),(1009,2.00,1024,250,650),(1010,2.80,2048,300,770),(1011,1.86,2048,160,959),(1012,2.80,1024,160,649),(1013,3.06,512,80,529),(1001,2.66,1024,250,2114),(1002,2.10,512,250,995),(1003,1.42,512,80,478),(1004,2.80,1024,250,649),(1005,3.20,512,250,630),(1006,3.20,1024,320,1049),(1007,2.20,1024,200,510),(1008,2.20,2048,250,770),(1009,2.00,1024,250,650),(1010,2.80,2048,300,770),(1011,1.86,2048,160,959),(1012,2.80,1024,160,649),(1013,3.06,512,80,529);
/*!40000 ALTER TABLE `PC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer` (
  `model` int(11) DEFAULT NULL,
  `color` tinyint(1) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer`
--

LOCK TABLES `Printer` WRITE;
/*!40000 ALTER TABLE `Printer` DISABLE KEYS */;
INSERT INTO `Printer` VALUES (3001,1,'ink-jet',99),(3002,0,'laser',239),(3003,1,'laser',899),(3004,1,'ink-jet',120),(3005,0,'laser',120),(3006,1,'ink-jet',100),(3007,1,'laser',200),(3001,1,'ink-jet',99),(3002,0,'laser',239),(3003,1,'laser',899),(3004,1,'ink-jet',120),(3005,0,'laser',120),(3006,1,'ink-jet',100),(3007,1,'laser',200);
/*!40000 ALTER TABLE `Printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `maker` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('A',1001,'pc'),('A',1002,'pc'),('A',1003,'pc'),('A',2004,'laptop'),('A',2005,'laptop'),('A',2006,'laptop'),('B',1004,'pc'),('B',1005,'pc'),('B',1006,'pc'),('B',2007,'laptop'),('C',1007,'pc'),('D',1008,'pc'),('D',1009,'pc'),('D',1010,'pc'),('D',3004,'printer'),('D',3005,'printer'),('E',1011,'pc'),('E',1012,'pc'),('E',1013,'pc'),('E',2001,'laptop'),('E',2002,'laptop'),('E',2003,'laptop'),('E',3001,'printer'),('E',3002,'printer'),('E',3003,'printer'),('F',2008,'laptop'),('F',2009,'laptop'),('G',2010,'laptop'),('H',3006,'printer'),('H',3007,'printer');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-07  6:59:03
