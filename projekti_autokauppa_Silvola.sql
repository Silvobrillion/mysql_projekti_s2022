-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: projekti_autokauppa
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Current Database: `projekti_autokauppa`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `projekti_autokauppa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `projekti_autokauppa`;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `auto_id` int unsigned NOT NULL AUTO_INCREMENT,
  `vuosimalli` smallint unsigned NOT NULL,
  `merkki` varchar(45) NOT NULL,
  `malli` varchar(45) NOT NULL,
  `vaihteisto` varchar(25) NOT NULL,
  `kayttovoima` varchar(45) NOT NULL,
  `mittarilukema` int unsigned DEFAULT '0',
  `rekisterinumero` varchar(25) DEFAULT NULL,
  `ostohinta` int unsigned NOT NULL,
  `ostopaiva` date NOT NULL DEFAULT (curdate()),
  `toimipiste_id` tinyint unsigned NOT NULL,
  `myyty` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `rekisterinumero_UNIQUE` (`rekisterinumero`),
  KEY `auto_toimipiste_id_idx` (`toimipiste_id`),
  CONSTRAINT `auto_toimipiste_id` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,2011,'Volkswagen','Scirocco','Manuaali','Bensiini',81300,'MOK-381',12100,'2022-08-05',1,1),(3,2009,'Subaru','Forester','Automaatti','Bensiini',245000,'XMF-654',8190,'2022-08-16',2,1),(4,2015,'BMW','X5','Automaatti','Diesel',146000,'CJI-267',38500,'2022-08-25',3,1),(5,2004,'Volvo','S80','Automaatti','Bensiini',305000,'TVC-974',1500,'2022-07-12',1,0),(6,2015,'Mercedes-Benz','C','Automaatti','Hybridi (diesel/sähkö)',165000,'ETI-891',28500,'2022-07-09',2,1),(7,2018,'Skoda','Kodiaq','Automaatti','Diesel',106000,'LON-926',28900,'2022-07-05',3,0),(8,2015,'Ford','Fiesta','Manuaali','Bensiini',205000,'ENS-256',6100,'2022-08-08',1,0),(9,2017,'Suzuki','Ignis','Manuaali','Bensiini',155000,'NLX-215',11500,'2022-08-15',2,1),(10,2023,'Kia','Picanto','Manuaali','Bensiini',0,NULL,11000,'2022-08-31',3,0),(11,2023,'Honda','Jazz','Automaatti','Hybridi (bensiini/sähkö)',0,NULL,25000,'2022-08-10',1,0),(12,2023,'Mitsubishi','Space Star','Automaatti','Bensiini',0,NULL,12000,'2022-08-31',2,0),(14,2023,'Kia','Ceed','Manuaali','Bensiini',0,NULL,17000,'2022-08-25',3,0),(15,2022,'Cupra','Formentor','Automaatti','Bensiini',6800,'ZIZ-545',65000,'2022-08-03',1,0),(16,2012,'Chevrolet','Cruze','Manuaali','Bensiini',124000,'UJK-189',6970,'2022-09-03',2,0),(17,2007,'Toyota','RAV4','Manuaali','Diesel',187000,'TAL-286',8900,'2022-09-11',3,0),(18,2005,'Volkswagen','Polo','Manuaali','Diesel',258000,'TAS-321',2500,'2022-10-23',1,0);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myyja`
--

DROP TABLE IF EXISTS `myyja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myyja` (
  `myyja_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(45) NOT NULL,
  `sukunimi` varchar(45) NOT NULL,
  `henkilotunnus` varchar(15) DEFAULT NULL,
  `puhelinnumero` varchar(25) NOT NULL,
  `toimipiste_id` tinyint unsigned NOT NULL,
  `osoite_id` smallint unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`myyja_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `puhelinnumero_UNIQUE` (`puhelinnumero`),
  UNIQUE KEY `henkilotunnus_UNIQUE` (`henkilotunnus`),
  KEY `myyja_toimipiste_id_idx` (`toimipiste_id`),
  KEY `myyja_osoite_id_idx` (`osoite_id`),
  CONSTRAINT `myyja_osoite_id` FOREIGN KEY (`osoite_id`) REFERENCES `osoite` (`osoite_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `myyja_toimipiste_id` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myyja`
--

LOCK TABLES `myyja` WRITE;
/*!40000 ALTER TABLE `myyja` DISABLE KEYS */;
INSERT INTO `myyja` VALUES (1,'Jere','Haapaniemi','190178-751K','041 359 5786',1,1,'jere.haapaniemi@autokauppa.fi'),(2,'Kaarina','Kottila','161182-048W','040 835 6408',3,2,'kaarina.kottila@autokauppa.fi'),(3,'Vappu','Myllylä','270487-246A','046 807 2777',2,4,'vappu.myllyla@autokauppa.fi'),(4,'Iivari','Niskavaara','300676-465T','040 609 4792',1,3,'iivari.niskavaara@autokauppa.fi'),(5,'Laura','Enckelman','070789-172N','041 510 1748',2,5,'laura.enckelman@autokauppa.fi'),(6,'Kati','Hyvärinen','240386-342F','050 053 0291',1,8,'kati.hyvarinen@autokauppa.fi'),(7,'Taina','Polvi','280390-598Y','046 233 1711',2,9,'taina.polvi@autokauppa.fi'),(8,'Annemari','Holopainen','300671-482H','050 626 1507',3,11,'annemari.holopainen@autokauppa.fi'),(9,'Minna','Kovalainen','201095-368M','041 888 2471',3,12,'minna.kovalainen@autokauppa.fi');
/*!40000 ALTER TABLE `myyja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myynti`
--

DROP TABLE IF EXISTS `myynti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myynti` (
  `myynti_id` int unsigned NOT NULL AUTO_INCREMENT,
  `auto_id` int unsigned NOT NULL,
  `myyja_id` smallint unsigned NOT NULL,
  `myyntihinta` int unsigned NOT NULL,
  `myyntipaiva` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`myynti_id`),
  UNIQUE KEY `auto_id_UNIQUE` (`auto_id`),
  KEY `myynti_myyja_id_idx` (`myyja_id`),
  CONSTRAINT `myynti_auto_id` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `myynti_myyja_id` FOREIGN KEY (`myyja_id`) REFERENCES `myyja` (`myyja_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myynti`
--

LOCK TABLES `myynti` WRITE;
/*!40000 ALTER TABLE `myynti` DISABLE KEYS */;
INSERT INTO `myynti` VALUES (1,1,1,14500,'2022-09-10'),(3,3,3,10200,'2022-10-23'),(4,4,2,42500,'2022-10-23'),(5,6,5,33200,'2022-09-25'),(6,9,5,14300,'2022-09-26');
/*!40000 ALTER TABLE `myynti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoite`
--

DROP TABLE IF EXISTS `osoite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoite` (
  `osoite_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `katuosoite` varchar(65) NOT NULL,
  `postinumero` varchar(12) NOT NULL,
  `kaupunki` varchar(25) NOT NULL,
  `maa` varchar(35) NOT NULL,
  PRIMARY KEY (`osoite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoite`
--

LOCK TABLES `osoite` WRITE;
/*!40000 ALTER TABLE `osoite` DISABLE KEYS */;
INSERT INTO `osoite` VALUES (1,'Gesterbyntie 29','05510','Hyvinkää','Suomi'),(2,'Väätäjänniementie 39','96190','Rovaniemi','Suomi'),(3,'Lukiokatu 63','13600','Hämeenlinna','Suomi'),(4,'Kanslerinrinne 17','37620','Valkeakoski','Suomi'),(5,'Jykintie 83','33950','Pirkkala','Suomi'),(6,'Kaarrostie 8','00970','Helsinki','Suomi'),(7,'Kiannonkatu 96','90520','Oulu','Suomi'),(8,'Puolakantie 61','00580','Helsinki','Suomi'),(9,'Kanslerinrinne 40','37140','Nokia','Suomi'),(10,'Ysitie 40','33300','Tampere','Suomi'),(11,'Jalonkatu 95','90220','Oulu','Suomi'),(12,'Kankaanpääntie 32','94600','Kemi','Suomi');
/*!40000 ALTER TABLE `osoite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toimipiste`
--

DROP TABLE IF EXISTS `toimipiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toimipiste` (
  `toimipiste_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `osoite_id` smallint unsigned NOT NULL,
  `manageri_myyja_id` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`toimipiste_id`),
  UNIQUE KEY `osoite_id_UNIQUE` (`osoite_id`),
  KEY `toimipiste_manageri_id_idx` (`manageri_myyja_id`),
  CONSTRAINT `toimipiste_manageri_id` FOREIGN KEY (`manageri_myyja_id`) REFERENCES `myyja` (`myyja_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `toimipiste_osoite_id` FOREIGN KEY (`osoite_id`) REFERENCES `osoite` (`osoite_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toimipiste`
--

LOCK TABLES `toimipiste` WRITE;
/*!40000 ALTER TABLE `toimipiste` DISABLE KEYS */;
INSERT INTO `toimipiste` VALUES (1,6,6),(2,10,5),(3,7,9);
/*!40000 ALTER TABLE `toimipiste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24  1:19:59
