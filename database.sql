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
INSERT INTO `ping_result_ipv4` VALUES (1,'2018-01-15 07:43:33','8.8.8.8',0,57.0000,15.9370),(2,'2018-01-15 07:43:33','8.8.8.8',1,57.0000,14.4970),(3,'2018-01-15 07:43:33','8.8.8.8',2,57.0000,14.3660),(4,'2018-01-15 07:43:33','8.8.8.8',3,57.0000,14.2560),(5,'2018-01-15 07:43:33','8.8.8.8',4,57.0000,14.2930),(6,'2018-01-15 07:43:33','8.8.8.8',5,57.0000,14.2970),(7,'2018-01-15 07:43:33','8.8.8.8',6,57.0000,14.3470),(8,'2018-01-15 07:43:33','8.8.8.8',7,57.0000,14.3300),(9,'2018-01-15 07:43:33','8.8.8.8',8,57.0000,14.2380),(10,'2018-01-15 07:43:33','8.8.8.8',9,57.0000,15.5350),(11,'2018-01-15 07:43:33','203.84.221.53',0,48.0000,257.9790),(12,'2018-01-15 07:43:33','203.84.221.53',1,48.0000,251.3620),(13,'2018-01-15 07:43:33','203.84.221.53',2,48.0000,251.3430),(14,'2018-01-15 07:43:33','203.84.221.53',3,48.0000,251.3220),(15,'2018-01-15 07:43:33','203.84.221.53',4,48.0000,251.2570),(16,'2018-01-15 07:43:33','203.84.221.53',5,48.0000,251.3110),(17,'2018-01-15 07:43:33','203.84.221.53',6,48.0000,251.4660),(18,'2018-01-15 07:43:33','203.84.221.53',7,48.0000,251.2840),(19,'2018-01-15 07:43:33','203.84.221.53',8,48.0000,251.3840),(20,'2018-01-15 07:43:33','203.84.221.53',9,48.0000,251.2920);
/*!40000 ALTER TABLE `ping_result_ipv4` ENABLE KEYS */;
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
  `destination` varchar(255) DEFAULT NULL,
  `trace_hop` int(10) DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-15 15:24:53
