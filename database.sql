-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dbping
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB

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
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `ipv4` varchar(255) NOT NULL,
  `ipv6` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'www.google.com','8.8.8.8','2001:4860:4860::8888'),(2,'ns3.yahoo.com','203.84.221.53','2406:8600:b8:fe03::1003');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ping_result_ipv4`
--

DROP TABLE IF EXISTS `ping_result_ipv4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ping_result_ipv4` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `destination` varchar(255) DEFAULT NULL,
  `icmp_seq` int(10) DEFAULT NULL,
  `icmp_ttl` float(10,4) DEFAULT NULL,
  `icmp_time` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ping_result_ipv4`
--

LOCK TABLES `ping_result_ipv4` WRITE;
/*!40000 ALTER TABLE `ping_result_ipv4` DISABLE KEYS */;
INSERT INTO `ping_result_ipv4` VALUES (1,'2018-01-19 11:17:20','8.8.8.8',0,57.0000,17.3100),(2,'2018-01-19 11:17:20','8.8.8.8',1,57.0000,16.3690),(3,'2018-01-19 11:17:20','8.8.8.8',2,57.0000,16.1420),(4,'2018-01-19 11:17:20','8.8.8.8',3,57.0000,15.8710),(5,'2018-01-19 11:17:20','8.8.8.8',4,57.0000,15.9570),(6,'2018-01-19 11:17:20','8.8.8.8',5,57.0000,15.9090),(7,'2018-01-19 11:17:20','8.8.8.8',6,57.0000,15.9500),(8,'2018-01-19 11:17:20','8.8.8.8',7,57.0000,15.9610),(9,'2018-01-19 11:17:20','8.8.8.8',8,57.0000,15.9900),(10,'2018-01-19 11:17:20','8.8.8.8',9,57.0000,16.1510),(11,'2018-01-19 11:17:29','203.84.221.53',0,48.0000,253.8610),(12,'2018-01-19 11:17:29','203.84.221.53',1,48.0000,252.4990),(13,'2018-01-19 11:17:29','203.84.221.53',2,48.0000,252.5670),(14,'2018-01-19 11:17:29','203.84.221.53',3,48.0000,253.1580),(15,'2018-01-19 11:17:29','203.84.221.53',4,48.0000,252.5520),(16,'2018-01-19 11:17:29','203.84.221.53',5,48.0000,252.5120),(17,'2018-01-19 11:17:29','203.84.221.53',6,48.0000,253.5990),(18,'2018-01-19 11:17:29','203.84.221.53',7,48.0000,252.6060),(19,'2018-01-19 11:17:29','203.84.221.53',8,48.0000,252.7910),(20,'2018-01-19 11:17:29','203.84.221.53',9,48.0000,252.5160);
/*!40000 ALTER TABLE `ping_result_ipv4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ping_result_ipv6`
--

DROP TABLE IF EXISTS `ping_result_ipv6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ping_result_ipv6` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `destination` varchar(255) DEFAULT NULL,
  `icmp_seq` int(10) DEFAULT NULL,
  `icmp_ttl` float(10,4) DEFAULT NULL,
  `icmp_time` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ping_result_ipv6`
--

LOCK TABLES `ping_result_ipv6` WRITE;
/*!40000 ALTER TABLE `ping_result_ipv6` DISABLE KEYS */;
/*!40000 ALTER TABLE `ping_result_ipv6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_result_ipv4`
--

DROP TABLE IF EXISTS `trace_result_ipv4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_result_ipv4` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trace_destination` varchar(255) DEFAULT NULL,
  `trace_hop` int(10) DEFAULT NULL,
  `trace_hostname` varchar(255) DEFAULT NULL,
  `trace_ip` varchar(255) DEFAULT NULL,
  `trace_time` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_result_ipv4`
--

LOCK TABLES `trace_result_ipv4` WRITE;
/*!40000 ALTER TABLE `trace_result_ipv4` DISABLE KEYS */;
/*!40000 ALTER TABLE `trace_result_ipv4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_result_ipv6`
--

DROP TABLE IF EXISTS `trace_result_ipv6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_result_ipv6` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trace_destination` varchar(255) DEFAULT NULL,
  `trace_hop` int(10) DEFAULT NULL,
  `trace_hostname` varchar(255) DEFAULT NULL,
  `trace_ip` varchar(255) DEFAULT NULL,
  `trace_time` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_result_ipv6`
--

LOCK TABLES `trace_result_ipv6` WRITE;
/*!40000 ALTER TABLE `trace_result_ipv6` DISABLE KEYS */;
/*!40000 ALTER TABLE `trace_result_ipv6` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-19 18:48:28
