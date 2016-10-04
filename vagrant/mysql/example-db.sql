-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 192.168.2.80    Database: g3common_v2
-- ------------------------------------------------------
-- Server version	5.6.27-enterprise-commercial-advanced-log

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
-- Table structure for table `cnf_customer`
--

DROP TABLE IF EXISTS `cnf_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnf_customer` (
  `IDCustomer` int(10) unsigned NOT NULL,
  `CustomerName` varchar(200) DEFAULT NULL,
  `CustomerDescription` text,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `FKState` int(10) unsigned DEFAULT NULL,
  `FKCountry` int(10) unsigned DEFAULT NULL,
  `PostalCode` varchar(15) DEFAULT NULL,
  `CustomerPrefix` varchar(25) DEFAULT NULL,
  `DBDomainName` varchar(256) DEFAULT NULL,
  `DBName` varchar(256) DEFAULT NULL,
  `IsFMSEnable` tinyint(1) NOT NULL DEFAULT '0',
  `InstallationDate` datetime NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDCustomer`),
  KEY `FK_CNF_Customer_lkp_country_8` (`FKCountry`),
  KEY `FK_CNF_Customer_lkp_state_7` (`FKState`),
  CONSTRAINT `FK_CNF_Customer_lkp_country_8` FOREIGN KEY (`FKCountry`) REFERENCES `lkp_country` (`IDCountry`),
  CONSTRAINT `FK_CNF_Customer_lkp_state_7` FOREIGN KEY (`FKState`) REFERENCES `lkp_state` (`IDState`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnf_customer`
--

LOCK TABLES `cnf_customer` WRITE;
/*!40000 ALTER TABLE `cnf_customer` DISABLE KEYS */;
INSERT INTO `cnf_customer` VALUES (1,'EllisDon','EllisDon',NULL,NULL,NULL,NULL,NULL,'lgsdev','ellisdon.com','g3customerDS',1,'2010-08-18 12:00:00',1,'2010-08-18 12:00:00',0,'2010-08-18 12:00:00',0),(2,'DevQA','DevQA',NULL,NULL,NULL,NULL,NULL,'devqa','devqa.com','g3devqaDS',0,'2013-01-07 12:00:00',1,'2015-09-29 12:00:00',0,'2015-09-29 12:00:00',0);
/*!40000 ALTER TABLE `cnf_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnf_customerlicense`
--

DROP TABLE IF EXISTS `cnf_customerlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnf_customerlicense` (
  `IDCustomerLicense` int(11) NOT NULL,
  `FKCustomer` int(11) NOT NULL,
  `IsSiteLicensing` tinyint(1) DEFAULT NULL,
  `LicenseCount` int(11) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`IDCustomerLicense`),
  KEY `FKCustomer1` (`FKCustomer`),
  CONSTRAINT `FKCustomer1` FOREIGN KEY (`FKCustomer`) REFERENCES `tmp_cnf_customer` (`IDCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To Store customer license information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnf_customerlicense`
--

LOCK TABLES `cnf_customerlicense` WRITE;
/*!40000 ALTER TABLE `cnf_customerlicense` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnf_customerlicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnf_gcsbucketcustomer`
--

DROP TABLE IF EXISTS `cnf_gcsbucketcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnf_gcsbucketcustomer` (
  `IDGcsBucketCustomer` int(10) unsigned NOT NULL,
  `BucketName` varchar(200) DEFAULT NULL,
  `FKCustomer` int(10) unsigned DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDGcsBucketCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnf_gcsbucketcustomer`
--

LOCK TABLES `cnf_gcsbucketcustomer` WRITE;
/*!40000 ALTER TABLE `cnf_gcsbucketcustomer` DISABLE KEYS */;
INSERT INTO `cnf_gcsbucketcustomer` VALUES (1,'94911f61-950d-4791-8426-73d1a80f3c55',1,0,'2014-04-25 11:07:19',0,'2014-04-25 11:07:19',0),(2,'4cf80417-fe3f-4145-9f5c-c6d701bee80d',2,0,'2015-09-29 12:00:00',0,'2015-09-29 12:00:00',0);
/*!40000 ALTER TABLE `cnf_gcsbucketcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnf_gcsproject`
--

DROP TABLE IF EXISTS `cnf_gcsproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnf_gcsproject` (
  `IDGcsProject` int(10) unsigned NOT NULL,
  `ProjectName` varchar(200) DEFAULT NULL,
  `ClientID` varchar(200) DEFAULT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL,
  `ClientSecret` varchar(200) DEFAULT NULL,
  `PublicKey` varchar(200) DEFAULT NULL,
  `AccessToken` varchar(200) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDGcsProject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnf_gcsproject`
--

LOCK TABLES `cnf_gcsproject` WRITE;
/*!40000 ALTER TABLE `cnf_gcsproject` DISABLE KEYS */;
INSERT INTO `cnf_gcsproject` VALUES (1,'GateThree-DEV-Media','371967118925-ts3khef200lbmq3i5thlh4t5q7nk605k.apps.googleusercontent.com','371967118925-ts3khef200lbmq3i5thlh4t5q7nk605k@developer.gserviceaccount.com','notasecret','GateThree-DEV-Media-d16b10a4b116','ya29.8gFOhm-ruQib9PqXRUwZQ1ND0A3kQzYsm4pcfuNTVHOjY_1SIa-O0bUz',0,'2014-04-25 10:57:31',0,'2015-09-18 09:39:14',622),(2,'G3Bim','75015711242-ptpcvblg6qe5c6l7l2knv7hbrc19htka.apps.googleusercontent.com','75015711242-ptpcvblg6qe5c6l7l2knv7hbrc19htka@developer.gserviceaccount.com','notasecret','646bcbceaffb4ad8211e3625171c44aefc063b45','ya29.gwBjhQorfV8E57o89g8d8_rotRDnEgUX8Vu7ca-pmxGRMqT6ue7fHyVm',0,'2014-06-20 10:00:31',0,'2014-09-17 09:43:05',80),(3,'GateThree-DEV-Documents','236507511288-nesaoe2n2s8ppgi0e9stugmbt059993b.apps.googleusercontent.com','236507511288-nesaoe2n2s8ppgi0e9stugmbt059993b@developer.gserviceaccount.com','notasecret','GateThree-DEV-Documents-7ef211afcc1f','ya29.KgKpabN9SvXqYP2salFr1OYOPFGBr9tbiKtwhHRr4_9e6XY8ehUXTz7wbL907R_QEg6QSig',0,'2014-07-23 10:40:58',0,'2015-11-12 11:00:48',5059);
/*!40000 ALTER TABLE `cnf_gcsproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeruser`
--

DROP TABLE IF EXISTS `customeruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customeruser` (
  `IDCustomerUser` int(10) unsigned NOT NULL,
  `FKCustomer` int(10) unsigned DEFAULT NULL,
  `FKGateThreeUser` int(11) unsigned DEFAULT NULL,
  `IsDefault` tinyint(1) DEFAULT NULL,
  `IsSuspended` tinyint(1) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDCustomerUser`),
  KEY `FK_CustomerUser_CNF_Customer_5` (`FKCustomer`),
  KEY `FK_CustomerUser_GateThreeUser_6` (`FKGateThreeUser`),
  CONSTRAINT `FK_CustomerUser_CNF_Customer_5` FOREIGN KEY (`FKCustomer`) REFERENCES `cnf_customer` (`IDCustomer`),
  CONSTRAINT `FK_CustomerUser_GateThreeUser_6` FOREIGN KEY (`FKGateThreeUser`) REFERENCES `gatethreeuser` (`IDGateThreeUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeruser`
--

LOCK TABLES `customeruser` WRITE;
/*!40000 ALTER TABLE `customeruser` DISABLE KEYS */;
INSERT INTO `customeruser` VALUES (1,1,1,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(2,1,2,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(3,1,3,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(4,1,4,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(5,1,5,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(6,1,6,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(7,1,7,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(8,1,8,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(9,1,9,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(10,1,10,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(11,1,11,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(12,1,12,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(13,1,13,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(14,1,14,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(15,1,15,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(16,1,16,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(17,1,17,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(18,1,18,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(19,1,19,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(20,1,20,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(21,1,21,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(22,1,22,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(23,1,23,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(24,1,24,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(25,1,25,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(26,1,26,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(27,1,27,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(28,1,28,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(29,1,29,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(30,1,30,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(31,1,31,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(32,1,32,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(33,1,33,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(34,1,34,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(35,1,35,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(36,1,36,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(37,1,37,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(38,1,38,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(39,1,39,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(40,1,40,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(41,1,41,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(42,1,42,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(43,1,43,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(44,1,44,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(45,1,45,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(46,1,46,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(47,1,47,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(48,1,48,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(49,1,49,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(50,1,50,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(51,1,51,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(52,1,52,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(53,1,53,1,0,0,'2014-08-06 16:34:30',0,'2014-08-06 16:34:30',0),(54,2,126,1,0,0,'2014-08-13 15:02:42',0,'2014-08-13 15:02:42',0),(4603,1,10608,1,0,0,'2015-07-02 12:32:32',0,'2015-07-02 12:32:32',0),(9999,1,9999,1,0,0,'2014-08-13 15:02:42',0,'2014-08-13 15:02:42',0);
/*!40000 ALTER TABLE `customeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `DBVersionID` int(10) unsigned NOT NULL,
  `ModuleNumber` int(11) DEFAULT NULL,
  `DBVersion` decimal(10,5) DEFAULT NULL,
  `ApplicationVersion` varchar(15) DEFAULT NULL,
  `DBUpgradeFile` varchar(45) DEFAULT NULL,
  `DBUpdatedDate` datetime DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DBVersionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (1,99,1.06300,NULL,'Update 2011-08-25 M99 V01_063.sql','2011-08-26 14:13:00',NULL),(2,0,1.43100,'0.00000','Update 2014-04-23 V01_431 M00','2014-04-25 08:45:54',''),(3,99,1.49200,'','Update 2014-08-05 V01_492 M99.sql','2014-08-05 13:15:27',''),(4,99,1.49200,'','Update 2014-08-05 V01_492 M99-Migration.sql','2014-08-06 16:34:30','Common - Migration'),(5,99,1.49600,'','Update 2014-08-13 V01_496 M99.sql','2014-08-13 12:08:02',''),(6,99,1.52800,'','Update 2014-10-22 V01_528 M99.sql','2014-10-28 09:30:06',''),(7,99,1.52900,'','Update 2014-10-31 V01_529 M99.sql','2014-10-31 15:11:34',''),(8,0,1.53800,'','Update 2014-12-29 V01_538 M00','2015-01-06 08:37:46','GT-7453 Forgot password functionality');
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatethreeuser`
--

DROP TABLE IF EXISTS `gatethreeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gatethreeuser` (
  `IDGateThreeUser` int(11) unsigned NOT NULL,
  `UserID` varchar(80) DEFAULT NULL,
  `DisplayName` varchar(90) DEFAULT NULL,
  `Picture_DocID` varchar(256) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Salutation` varchar(80) DEFAULT NULL,
  `PhoneNumber` varchar(25) DEFAULT NULL,
  `Fax` varchar(25) DEFAULT NULL,
  `CompanyName` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `FKCountry` int(10) unsigned DEFAULT NULL,
  `FKState` int(10) unsigned DEFAULT NULL,
  `PostalCode` varchar(15) DEFAULT NULL,
  `EmailAddress` varchar(80) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDGateThreeUser`),
  KEY `FK_GateThreeUser_lkp_country_4` (`FKCountry`),
  KEY `FK_GateThreeUser_lkp_state_3` (`FKState`),
  CONSTRAINT `FK_GateThreeUser_lkp_country_4` FOREIGN KEY (`FKCountry`) REFERENCES `lkp_country` (`IDCountry`),
  CONSTRAINT `FK_GateThreeUser_lkp_state_3` FOREIGN KEY (`FKState`) REFERENCES `lkp_state` (`IDState`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatethreeuser`
--

LOCK TABLES `gatethreeuser` WRITE;
/*!40000 ALTER TABLE `gatethreeuser` DISABLE KEYS */;
INSERT INTO `gatethreeuser` VALUES (1,'gatethree_admin@ellisdon.com',NULL,NULL,'System',NULL,'Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gatethree_admin@ellisdon.com',1,0,'2010-03-31 11:31:54',0,'2010-03-31 11:31:54',0),(2,'wayneb@ellisdon.com',NULL,NULL,'Bruce',NULL,'Wayne',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wayneb@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(3,'bunnyb@ellisdon.com',NULL,NULL,'Bugs',NULL,'Bunny',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bunnyb@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(4,'kentc@ellisdon.com',NULL,NULL,'Clark',NULL,'Kent',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kentc@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(5,'mousem@ellisdon.com',NULL,NULL,'Mickey',NULL,'Mouse',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mousem@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(6,'parkerp@ellisdon.com',NULL,NULL,'Peter',NULL,'parker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'parkerp@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(7,'donaldd@ellisdon.com',NULL,NULL,'Donald',NULL,'Duck',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'donaldd@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(8,'fudde@ellisdon.com',NULL,NULL,'Elmer',NULL,'Fudd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fudde@ellisdon.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(9,'pletourneau@lgs.com',NULL,NULL,'Philippe',NULL,'Letourneau',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pletourneau@lgs.com',1,345,'2010-07-02 10:13:29',346,'2010-07-02 10:13:29',0),(10,'ahenry@ellisdon.qc',NULL,NULL,'Allain',NULL,'Henry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahenry@ellisdon.qc',1,345,'2011-03-31 00:00:00',346,'2011-03-31 00:00:00',0),(11,'test.user1@ellisdon.com',NULL,NULL,'test.user1',NULL,'Vendor Management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user1@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(12,'test.user2@ellisdon.com',NULL,NULL,'test.user2',NULL,'CPS Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user2@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(13,'test.user3@ellisdon.com',NULL,NULL,'test.user3',NULL,'CPS Reviewer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user3@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(14,'test.user4@ellisdon.com',NULL,NULL,'test.user4',NULL,'Financial Administrators',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user4@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(15,'test.user5@ellisdon.com',NULL,NULL,'test.user5',NULL,'Project Managers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user5@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(16,'test.user6@ellisdon.com',NULL,NULL,'test.user6',NULL,'Assistant Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user6@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(17,'test.user7@ellisdon.com',NULL,NULL,'test.user7',NULL,'Field Engineers',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user7@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(18,'test.user8@ellisdon.com',NULL,NULL,'test.user8',NULL,'GateThree Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user8@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(19,'test.user9@ellisdon.com',NULL,NULL,'test.user9',NULL,'Standard Use',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user9@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(20,'test.user10@ellisdon.com',NULL,NULL,'test.user10',NULL,'Coop Student',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user10@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(21,'test.user11@ellisdon.com',NULL,NULL,'test.user11',NULL,'PP Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user11@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(22,'test.user12@ellisdon.com',NULL,NULL,'test.user12',NULL,'EB Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user12@ellisdon.com',1,345,'2010-11-24 11:00:00',346,'2010-11-24 11:00:00',0),(23,'test.user13@ellisdon.com',NULL,NULL,'test.user13',NULL,'Communic Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test.user13@ellisdon.com',1,0,'2011-10-03 13:42:10',0,'2011-10-03 13:42:10',0),(24,'pp_readonly@ellisdon.com ',NULL,NULL,'pp',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pp_readonly@ellisdon.com ',1,0,'2012-11-29 09:53:40',0,'2012-11-29 09:53:40',0),(25,'pp_admin@ellisdon.com ',NULL,NULL,'pp',NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pp_admin@ellisdon.com ',1,0,'2012-11-29 11:24:14',0,'2012-11-29 11:24:14',0),(26,'eb_readonly@ellisdon.com',NULL,NULL,'eb',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eb_readonly@ellisdon.com',1,0,'2012-12-10 11:54:25',0,'2012-12-10 11:54:25',0),(27,'root@ellisdon.com',NULL,NULL,'Root',NULL,'Root',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'root@ellisdon.com',1,0,'2012-12-17 15:37:45',0,'2012-12-17 15:37:45',0),(28,'projet.t1@mail.com',NULL,NULL,'projet',NULL,'t1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projet.t1@mail.com',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(29,'projettest01@hotmail.fr',NULL,NULL,'projet',NULL,'test01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest01@hotmail.fr',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(30,'projettest02@hotmail.fr',NULL,NULL,'projet',NULL,'test02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest02@hotmail.fr',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(31,'projettest03@hotmail.com',NULL,NULL,'projet',NULL,'test03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest03@hotmail.com',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(32,'projettest04@hotmail.com',NULL,NULL,'projet',NULL,'test04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest04@hotmail.com',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(33,'projettest5@hotmail.com',NULL,NULL,'projet',NULL,'test5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest5@hotmail.com',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(34,'projettest6@hotmail.com',NULL,NULL,'projet',NULL,'test6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest6@hotmail.com',1,999,'2013-01-14 13:13:39',999,'2013-01-14 13:13:39',0),(35,'contracts_readonly@ellisdon.com',NULL,NULL,'Contracts',NULL,'Read Only',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'contracts_readonly@ellisdon.com',1,0,'2013-01-31 10:58:51',0,'2013-01-31 10:58:51',0),(36,'budget_readonly@ellisdon.com',NULL,NULL,'budget',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'budget_readonly@ellisdon.com',1,0,'2013-01-31 11:09:25',0,'2013-01-31 11:09:25',0),(37,'projettest7@hotmail.com',NULL,NULL,'projet',NULL,'test7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'projettest7@hotmail.com',1,999,'2013-01-31 16:00:04',999,'2013-01-31 16:00:04',0),(38,'o.mansour2@gmail.com',NULL,NULL,'omar',NULL,'mansour',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'o.mansour2@gmail.com',1,0,'2013-02-01 10:16:26',0,'2013-02-01 10:16:26',0),(39,'contracts_admin@ellisdon.com',NULL,NULL,'Contracts',NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'contracts_admin@ellisdon.com',1,0,'2013-02-01 10:41:17',0,'2013-02-01 10:41:17',0),(40,'dd_admin@ellisdon.com',NULL,NULL,'Design Documents',NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dd_admin@ellisdon.com',1,0,'2013-02-01 10:55:45',0,'2013-02-01 10:55:45',0),(41,'costing_readonly@ellisdon.com',NULL,NULL,'costing',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'costing_readonly@ellisdon.com',1,0,'2013-02-07 11:12:04',0,'2013-02-07 11:12:04',0),(42,'payapp_billing_readonly@ellisdon.com',NULL,NULL,'payapp_billing',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'payapp_billing_readonly@ellisdon.com',1,0,'2013-02-07 11:22:07',0,'2013-02-07 11:22:07',0),(43,'cm_readonly@ellisdon.com',NULL,NULL,'cm',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cm_readonly@ellisdon.com',1,0,'2013-02-07 11:27:23',0,'2013-02-07 11:27:23',0),(44,'tc_readonly@ellisdon.com',NULL,NULL,'tc',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tc_readonly@ellisdon.com',1,0,'2013-02-07 11:39:49',0,'2013-02-07 11:39:49',0),(45,'cps_readonly@ellisdon.com',NULL,NULL,'cps',NULL,'readonly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cps_readonly@ellisdon.com',1,0,'2013-02-07 11:50:00',0,'2013-02-07 11:50:00',0),(46,'bqm_readonly@ellisdon.com',NULL,NULL,'BQM',NULL,'Read Only',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bqm_readonly@ellisdon.com',1,0,'2013-02-08 10:15:21',0,'2013-02-08 10:15:21',0),(47,'contacts_admin@ellisdon.com',NULL,NULL,'Contacts',NULL,'Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'contacts_admin@ellisdon.com',1,0,'2013-02-08 11:28:44',0,'2013-02-08 11:28:44',0),(48,'pp_admin@ellisdon.com',NULL,NULL,'PP',NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pp_admin@ellisdon.com',1,0,'2013-02-08 14:24:52',0,'2013-02-08 14:24:52',0),(49,'anonymous@ellisdon.com',NULL,NULL,'Guest',NULL,'Guest',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anonymous@ellisdon.com',1,0,'2013-02-13 10:53:42',0,'2013-02-13 10:53:42',0),(50,'tc_readonly@ellisdon.com',NULL,NULL,'TC',NULL,'Read Only',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tc_readonly@ellisdon.com',1,0,'2013-02-25 11:11:44',0,'2013-02-25 11:11:44',0),(51,'testacp2@ellisdon.com',NULL,NULL,'Jimmy',NULL,'Thetester',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'testacp2@ellisdon.com',1,0,'2013-06-19 13:22:30',0,'2013-06-19 13:22:30',0),(52,'testacp5@ellisdon.com',NULL,NULL,'Ritchy',NULL,'Thetester',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'testacp5@ellisdon.com',1,0,'2013-06-19 13:35:45',0,'2013-06-19 13:35:45',0),(53,'testacp8@ellisdon.com',NULL,NULL,'Sandy',NULL,'Thetester',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'testacp8@ellisdon.com',1,0,'2013-06-19 13:40:19',0,'2013-06-19 13:40:19',0),(126,'system.administrator@training.gatethree.ca',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system.administrator@training.gatethree.ca',1,0,'2015-07-02 12:32:32',0,'2015-07-02 12:32:32',0),(9999,'test@junit.com',NULL,NULL,'test',NULL,'JUnit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test@junit.com',1,0,'2014-08-13 15:02:42',0,'2014-08-13 15:02:42',0),(10608,'mphilipchenko@ellisdon.com','Maria philipchenko',NULL,'Maria',NULL,'PH-Owner',NULL,NULL,'9053456354',NULL,'123 Spadina Ave','Toronto',39,68,'M5V 1C9','mphilipchenko@ellisdon.com',1,0,'2015-07-02 12:32:32',0,'2015-07-02 12:32:32',0);
/*!40000 ALTER TABLE `gatethreeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkp_country`
--

DROP TABLE IF EXISTS `lkp_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lkp_country` (
  `IDCountry` int(10) unsigned NOT NULL,
  `CountryName` varchar(45) NOT NULL,
  PRIMARY KEY (`IDCountry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkp_country`
--

LOCK TABLES `lkp_country` WRITE;
/*!40000 ALTER TABLE `lkp_country` DISABLE KEYS */;
INSERT INTO `lkp_country` VALUES (1,'AFGHANISTAN'),(2,'Ã…LAND ISLANDS'),(3,'ALBANIA'),(4,'ALGERIA'),(5,'AMERICAN SAMOA'),(6,'ANDORRA'),(7,'ANGOLA'),(8,'ANGUILLA'),(9,'ANTARCTICA'),(10,'ANTIGUA AND BARBUDA'),(11,'ARGENTINA'),(12,'ARMENIA'),(13,'ARUBA'),(14,'AUSTRALIA'),(15,'AUSTRIA'),(16,'AZERBAIJAN'),(17,'BAHAMAS'),(18,'BAHRAIN'),(19,'BANGLADESH'),(20,'BARBADOS'),(21,'BELARUS'),(22,'BELGIUM'),(23,'BELIZE'),(24,'BENIN'),(25,'BERMUDA'),(26,'BHUTAN'),(27,'BOLIVIA'),(28,'BOSNIA AND HERZEGOVINA'),(29,'BOTSWANA'),(30,'BOUVET ISLAND'),(31,'BRAZIL'),(32,'BRITISH INDIAN OCEAN TERRITORY'),(33,'BRUNEI DARUSSALAM'),(34,'BULGARIA'),(35,'BURKINA FASO'),(36,'BURUNDI'),(37,'CAMBODIA'),(38,'CAMEROON'),(39,'CANADA'),(40,'CAPE VERDE'),(41,'CAYMAN ISLANDS'),(42,'CENTRAL AFRICAN REPUBLIC'),(43,'CHAD'),(44,'CHILE'),(45,'CHINA'),(46,'CHRISTMAS ISLAND'),(47,'COCOS (KEELING) ISLANDS'),(48,'COLOMBIA'),(49,'COMOROS'),(50,'CONGO'),(51,'COOK ISLANDS'),(52,'COSTA RICA'),(54,'CROATIA'),(55,'CUBA'),(56,'CYPRUS'),(57,'CZECH REPUBLIC'),(58,'DENMARK'),(59,'DJIBOUTI'),(60,'DOMINICA'),(61,'DOMINICAN REPUBLIC'),(62,'ECUADOR'),(63,'EGYPT'),(64,'EL SALVADOR'),(65,'EQUATORIAL GUINEA'),(66,'ERITREA'),(67,'ESTONIA'),(68,'ETHIOPIA'),(69,'FALKLAND ISLANDS (MALVINAS)'),(70,'FAROE ISLANDS'),(71,'FIJI'),(72,'FINLAND'),(73,'FRANCE'),(74,'FRENCH GUIANA'),(75,'FRENCH POLYNESIA'),(76,'FRENCH SOUTHERN TERRITORIES'),(77,'GABON'),(78,'GAMBIA'),(79,'GEORGIA'),(80,'GERMANY'),(81,'GHANA'),(82,'GIBRALTAR'),(83,'GREECE'),(84,'GREENLAND'),(85,'GRENADA'),(86,'GUADELOUPE'),(87,'GUAM'),(88,'GUATEMALA'),(89,'GUERNSEY'),(90,'GUINEA'),(91,'GUINEA-BISSAU'),(92,'GUYANA'),(93,'HAITI'),(94,'HEARD ISLAND AND MCDONALD ISLANDS'),(95,'HOLY SEE (VATICAN CITY STATE)'),(96,'HONDURAS'),(97,'HONG KONG'),(98,'HUNGARY'),(99,'ICELAND'),(100,'INDIA'),(101,'INDONESIA'),(102,'IRAN'),(103,'IRAQ'),(104,'IRELAND'),(105,'ISLE OF MAN'),(106,'ISRAEL'),(107,'ITALY'),(108,'JAMAICA'),(109,'JAPAN'),(110,'JERSEY'),(111,'JORDAN'),(112,'KAZAKHSTAN'),(113,'KENYA'),(114,'KIRIBATI'),(115,'KOREA'),(116,'KUWAIT'),(117,'KYRGYZSTAN'),(118,'DEMOCRATIC REPUBLIC LAO'),(119,'LATVIA'),(120,'LEBANON'),(121,'LESOTHO'),(122,'LIBERIA'),(123,'LIBYAN ARAB JAMAHIRIYA'),(124,'LIECHTENSTEIN'),(125,'LITHUANIA'),(126,'LUXEMBOURG'),(127,'MACAO'),(128,'MACEDONIA'),(129,'MADAGASCAR'),(130,'MALAWI'),(131,'MALAYSIA'),(132,'MALDIVES'),(133,'MALI'),(134,'MALTA'),(135,'MARSHALL ISLANDS'),(136,'MARTINIQUE'),(137,'MAURITANIA'),(138,'MAURITIUS'),(139,'MAYOTTE'),(140,'MEXICO'),(141,'FEDERATED STATES OF MICRONESIA'),(142,'REPUBLIC OF MOLDOVA'),(143,'MONACO'),(144,'MONGOLIA'),(145,'MONTENEGRO'),(146,'MONTSERRAT'),(147,'MOROCCO'),(148,'MOZAMBIQUE'),(149,'MYANMAR'),(150,'NAMIBIA'),(151,'NAURU'),(152,'NEPAL'),(153,'NETHERLANDS'),(154,'NETHERLANDS ANTILLES'),(155,'NEW CALEDONIA'),(156,'NEW ZEALAND'),(157,'NICARAGUA'),(158,'NIGER'),(159,'NIGERIA'),(160,'NIUE'),(161,'NORFOLK ISLAND'),(162,'NORTHERN MARIANA ISLANDS'),(163,'NORWAY'),(164,'OMAN'),(165,'PAKISTAN'),(166,'PALAU'),(167,'PALESTINIAN'),(168,'PANAMA'),(169,'PAPUA NEW GUINEA'),(170,'PARAGUAY'),(171,'PERU'),(172,'PHILIPPINES'),(173,'PITCAIRN'),(174,'POLAND'),(175,'PORTUGAL'),(176,'PUERTO RICO'),(177,'QATAR'),(178,'R'),(179,'ROMANIA'),(180,'RUSSIAN FEDERATION'),(181,'RWANDA'),(182,'SAINT BARTH'),(183,'SAINT HELENA'),(184,'SAINT KITTS AND NEVIS'),(185,'SAINT LUCIA'),(186,'SAINT MARTIN'),(187,'SAINT PIERRE AND MIQUELON'),(188,'SAINT VINCENT AND THE GRENADINES'),(189,'SAMOA'),(190,'SAN MARINO'),(191,'SAO TOME AND PRINCIPE'),(192,'SAUDI ARABIA'),(193,'SENEGAL'),(194,'SERBIA'),(195,'SEYCHELLES'),(196,'SIERRA LEONE'),(197,'SINGAPORE'),(198,'SLOVAKIA'),(199,'SLOVENIA'),(200,'SOLOMON ISLANDS'),(201,'SOMALIA'),(202,'SOUTH AFRICA'),(203,'SOUTH GEORGIA'),(204,'SPAIN'),(205,'SRI LANKA'),(206,'SUDAN'),(207,'SURINAME'),(208,'SVALBARD AND JAN MAYEN'),(209,'SWAZILAND'),(210,'SWEDEN'),(211,'SWITZERLAND'),(212,'SYRIA'),(213,'TAIWAN'),(214,'TAJIKISTAN'),(215,'TANZANIA'),(216,'THAILAND'),(217,'TIMOR-LESTE'),(218,'TOGO'),(219,'TOKELAU'),(220,'TONGA'),(221,'TRINIDAD AND TOBAGO'),(222,'TUNISIA'),(223,'TURKEY'),(224,'TURKMENISTAN'),(225,'TURKS AND CAICOS ISLANDS'),(226,'TUVALU'),(227,'UGANDA'),(228,'UKRAINE'),(229,'UNITED ARAB EMIRATES'),(230,'UNITED KINGDOM'),(231,'UNITED STATES'),(232,'UNITED STATES MINOR OUTLYING ISLANDS'),(233,'URUGUAY'),(234,'UZBEKISTAN'),(235,'VANUATU'),(236,'VATICAN CITY STATE'),(237,'VENEZUELA'),(238,'VIET NAM'),(239,'VIRGIN ISLANDS- BRITISH'),(240,'VIRGIN ISLANDS-U.S.'),(241,'WALLIS AND FUTUNA'),(242,'WESTERN SAHARA'),(243,'YEMEN'),(244,'ZAMBIA'),(245,'ZIMBABWE'),(246,'.'),(5469,'5a6f87d3-d123-48a6-9700-d2e82a8b641a'),(5470,'e6643dcb-9b22-4c43-a187-b17a367cd3f6');
/*!40000 ALTER TABLE `lkp_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkp_securityquestion`
--

DROP TABLE IF EXISTS `lkp_securityquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lkp_securityquestion` (
  `IDSecurityQuestion` int(10) unsigned NOT NULL,
  `SecurityQuestion` varchar(125) NOT NULL,
  PRIMARY KEY (`IDSecurityQuestion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkp_securityquestion`
--

LOCK TABLES `lkp_securityquestion` WRITE;
/*!40000 ALTER TABLE `lkp_securityquestion` DISABLE KEYS */;
INSERT INTO `lkp_securityquestion` VALUES (1,'What is the food you least liked as a child?'),(2,'What was your maternal grandfather\'s first name?'),(3,'What did you earn your first medal or award for?'),(4,'What was the first computer game you played?'),(5,'Who is your favorite sports player?'),(6,'What is the name of your favourite teacher?'),(7,'What was your first vacation spot?'),(8,'What was your dream job as a child?'),(9,'What is the name of your favorite childhood teacher?'),(10,'In what city did your parents meet?'),(11,'Who is your favorite author?'),(12,'What is the name of the street on which you grew up?'),(13,'What was the first thing you learned to cook?'),(14,'What is your favorite piece of art?');
/*!40000 ALTER TABLE `lkp_securityquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkp_state`
--

DROP TABLE IF EXISTS `lkp_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lkp_state` (
  `IDState` int(10) unsigned NOT NULL,
  `FKCountry` int(10) unsigned NOT NULL,
  `StateName` varchar(45) NOT NULL,
  `StateAbbreviation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`IDState`),
  KEY `FK_lkp_state_lkp_country_2` (`FKCountry`),
  CONSTRAINT `FK_lkp_state_lkp_country_2` FOREIGN KEY (`FKCountry`) REFERENCES `lkp_country` (`IDCountry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkp_state`
--

LOCK TABLES `lkp_state` WRITE;
/*!40000 ALTER TABLE `lkp_state` DISABLE KEYS */;
INSERT INTO `lkp_state` VALUES (1,231,'ALABAMA','AL'),(2,231,'ALASKA','AK'),(3,231,'AMERICAN SAMOA','AS'),(4,231,'ARIZONA','AZ'),(5,231,'ARKANSAS','AR'),(6,231,'CALIFORNIA','CA'),(7,231,'COLORADO','CO'),(8,231,'CONNECTICUT','CT'),(9,231,'DELAWARE','DE'),(10,231,'DISTRICT OF COLUMBIA','DC'),(11,231,'FEDERATED STATES OF MICRONESIA','FM'),(12,231,'FLORIDA','FL'),(13,231,'GEORGIA','GA'),(14,231,'GUAM','GU'),(15,231,'HAWAII','HI'),(16,231,'IDAHO','ID'),(17,231,'ILLINOIS','IL'),(18,231,'INDIANA','IN'),(19,231,'IOWA','IA'),(20,231,'KANSAS','KS'),(21,231,'KENTUCKY','KY'),(22,231,'LOUISIANA','LA'),(23,231,'MAINE','ME'),(24,231,'MARSHALL ISLANDS','MH'),(25,231,'MARYLAND','MD'),(26,231,'MASSACHUSETTS','MA'),(27,231,'MICHIGAN','MI'),(28,231,'MINNESOTA','MN'),(29,231,'MISSISSIPPI','MS'),(30,231,'MISSOURI','MO'),(31,231,'MONTANA','MT'),(32,231,'NEBRASKA','NE'),(33,231,'NEVADA','NV'),(34,231,'NEW HAMPSHIRE','NH'),(35,231,'NEW JERSEY','NJ'),(36,231,'NEW MEXICO','NM'),(37,231,'NEW YORK','NY'),(38,231,'NORTH CAROLINA','NC'),(39,231,'NORTH DAKOTA','ND'),(40,231,'NORTHERN MARIANA ISLANDS','MP'),(41,231,'OHIO','OH'),(42,231,'OKLAHOMA','OK'),(43,231,'OREGON','OR'),(44,231,'PALAU','PW'),(45,231,'PENNSYLVANIA','PA'),(46,231,'PUERTO RICO','PR'),(47,231,'RHODE ISLAND','RI'),(48,231,'SOUTH CAROLINA','SC'),(49,231,'SOUTH DAKOTA','SD'),(50,231,'TENNESSEE','TN'),(51,231,'TEXAS','TX'),(52,231,'UTAH','UT'),(53,231,'VERMONT','VT'),(54,231,'VIRGIN ISLANDS','VI'),(55,231,'VIRGINIA','VA'),(56,231,'WASHINGTON','WA'),(57,231,'WEST VIRGINIA','WV'),(58,231,'WISCONSIN','WI'),(59,231,'WYOMING','WY'),(60,39,'Alberta','AB'),(61,39,'British Columbia','BC'),(62,39,'Manitoba','MB'),(63,39,'New Brunswick','NB'),(64,39,'Newfoundland and Labrador','NL'),(65,39,'Northwest Territories','NT'),(66,39,'Nova Scotia','NS'),(67,39,'Nunavut','NU'),(68,39,'Ontario','ON'),(69,39,'Prince Edward Island','PE'),(70,39,'Quebec','QC'),(71,39,'Saskatchewan','SK'),(72,39,'Yukon','YT'),(73,140,'Aguascalientes','AG'),(74,140,'Baja California- North','BA'),(75,140,'Baja California - South','BS'),(76,140,'Campeche','CE'),(77,140,'Chiapas','CI'),(78,140,'Chihuahua','CH'),(79,140,'Coahuila','CU'),(80,140,'Colima','CL'),(81,140,'Distrito Federal','DF'),(82,140,'Durango','DO'),(83,140,'Guanajuato','GX'),(84,140,'Guerrero','GR'),(85,140,'Hidalgo','HL'),(86,140,'Jalisco','JL'),(87,140,'Mexico','MX'),(88,140,'Michoacan','MC'),(89,140,'Morelos','MR'),(90,140,'Nayarit','NA'),(91,140,'Nuevo Leon','NN'),(92,140,'Oaxaca','OA'),(93,140,'Puebla','PB'),(94,140,'Queretaro','QU'),(95,140,'Quintana Roo','QR'),(96,140,'San Luis Potosi','SL'),(97,140,'Sinaloa','SI'),(98,140,'Sonora','SO'),(99,140,'Tabasco','TB'),(100,140,'Tamaulipas','TA'),(101,140,'Tlaxcala','TL'),(102,140,'Veracruz','VC'),(103,140,'Yucatan','YU'),(104,140,'Zacatecas','ZA'),(150,246,'.','*');
/*!40000 ALTER TABLE `lkp_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('system-ActivitiesSendAutomaticReminderJobTrigger','DEFAULT','0 0 5 * * ? *','America/New_York'),('system-BPConsumeWSContactPayApplicationPaymentJobTrigger','DEFAULT','0 15 12,17,21 * * ? *','America/New_York'),('system-BPConsumeWSPrimePayApplicationPaymentJobTrigger','DEFAULT','0 45 12,17,21 * * ? *','America/New_York'),('system-CFCFGenerateCashFlowJobTrigger','DEFAULT','0 0 0 * * ?*','America/New_York'),('system-CFCFGenerateForecastCostJobTrigger','DEFAULT','0 0 0 * * ?*','America/New_York'),('system-CommunicRefreshAllEmailJobTrigger','DEFAULT','0 0/15 * * * ?*','America/New_York'),('system-CompanyDraftExpiredJobTrigger','DEFAULT','0 0 0/2 * * ?*','America/New_York'),('system-ContactDraftExpiredJobTrigger','DEFAULT','0 0 0/2 * * ?*','America/New_York'),('system-ContactDurationExpiredJobTrigger','DEFAULT','0 0 0/12 * * ?*','America/New_York'),('system-ContractsGenTrackingDocExpiryJobTrigger','DEFAULT','0 0 0 * * ?*','America/New_York'),('system-DeleteExpiredEBinderSetsJobTrigger','DEFAULT','0 0/2 * * * ?*','America/New_York'),('system-DSRGenerateDailySiteReportsJobTrigger','DEFAULT','0 0 0/1 1/1 * ? *','America/New_York'),('system-ReportGenerateReportingDocumentJobTrigger','DEFAULT','0 0 0/1 1/1 * ? *','America/New_York'),('system-TCConsumeWSChequesListJobTrigger','DEFAULT','0 0 7 * * ?*','America/New_York'),('system-TCGenerateTimeCardsJobTrigger','DEFAULT','0 0 7 * * ?*','America/New_York'),('system-TCPositionProfileSupersedeJobTrigger','DEFAULT','0 0 7 * * ?*','America/New_York');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_STATEFUL` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `IS_STATEFUL` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('system-ActivitiesSendAutomaticReminderJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.activities.job.SendAutomaticReminderJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-BPConsumeWSContactPayApplicationPaymentJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.bp.job.ConsumeWSContactPayApplicationPaymentJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-BPConsumeWSPrimePayApplicationPaymentJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.bp.job.ConsumeWSPrimePayApplicationPaymentJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-CFCFGenerateCashFlowJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.cfcf.job.GenerateCashFlowJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-CFCFGenerateForecastCostJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.cfcf.job.GenerateForecastCostJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-CommunicRefreshAllEmailJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.communic.job.RefreshAllEmailJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-CompanyDraftExpiredJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.vm.job.DeleteCompanyDraftExpiredJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-ContactDraftExpiredJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.vm.job.DeleteContactDraftExpiredJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-ContactDurationExpiredJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.vm.job.ContactDurationExpiredJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-ContractsGenTrackingDocExpiryJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.contracts.job.GenTrackingDocExpiryJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-DeleteExpiredEBinderSetsJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.eb.job.DeleteExpiredEBinderSetsJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-DSRGenerateDailySiteReportsJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.dsr.job.GenerateDailySiteReportsJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-ReportGenerateReportingDocumentJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.report.job.GenerateReportingDocumentJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-TCConsumeWSChequesListJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.tc.job.ConsumeWSChequesListJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-TCGenerateTimeCardsJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.tc.job.GenerateTimeCardsJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),('system-TCPositionProfileSupersedeJobDetail','DEFAULT',NULL,'com.econstruction.gate_three.scheduler.tc.job.PositionProfileSupersedeJob','0','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `JOB_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`),
  CONSTRAINT `qrtz_job_listeners_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_listeners`
--

LOCK TABLES `qrtz_job_listeners` WRITE;
/*!40000 ALTER TABLE `qrtz_job_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('CALENDAR_ACCESS'),('JOB_ACCESS'),('MISFIRE_ACCESS'),('STATE_ACCESS'),('TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(7) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `TRIGGER_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`),
  CONSTRAINT `qrtz_trigger_listeners_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_trigger_listeners`
--

LOCK TABLES `qrtz_trigger_listeners` WRITE;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_trigger_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('system-ActivitiesSendAutomaticReminderJobTrigger','DEFAULT','system-ActivitiesSendAutomaticReminderJobDetail','DEFAULT','0',NULL,1447408800000,1447322400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-BPConsumeWSContactPayApplicationPaymentJobTrigger','DEFAULT','system-BPConsumeWSContactPayApplicationPaymentJobDetail','DEFAULT','0',NULL,1447348500000,1447294500000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-BPConsumeWSPrimePayApplicationPaymentJobTrigger','DEFAULT','system-BPConsumeWSPrimePayApplicationPaymentJobDetail','DEFAULT','0',NULL,1447350300000,1447296300000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-CFCFGenerateCashFlowJobTrigger','DEFAULT','system-CFCFGenerateCashFlowJobDetail','DEFAULT','0',NULL,1447390800000,1447304400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-CFCFGenerateForecastCostJobTrigger','DEFAULT','system-CFCFGenerateForecastCostJobDetail','DEFAULT','0',NULL,1447390800000,1447304400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-CommunicRefreshAllEmailJobTrigger','DEFAULT','system-CommunicRefreshAllEmailJobDetail','DEFAULT','0',NULL,1447344900000,1447344000000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-CompanyDraftExpiredJobTrigger','DEFAULT','system-CompanyDraftExpiredJobDetail','DEFAULT','0',NULL,1447347600000,1447340400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-ContactDraftExpiredJobTrigger','DEFAULT','system-ContactDraftExpiredJobDetail','DEFAULT','0',NULL,1447347600000,1447340400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-ContactDurationExpiredJobTrigger','DEFAULT','system-ContactDurationExpiredJobDetail','DEFAULT','0',NULL,1447347600000,1447304400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-ContractsGenTrackingDocExpiryJobTrigger','DEFAULT','system-ContractsGenTrackingDocExpiryJobDetail','DEFAULT','0',NULL,1447390800000,1447304400000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-DeleteExpiredEBinderSetsJobTrigger','DEFAULT','system-DeleteExpiredEBinderSetsJobDetail','DEFAULT','0',NULL,1447344480000,1447344360000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-DSRGenerateDailySiteReportsJobTrigger','DEFAULT','system-DSRGenerateDailySiteReportsJobDetail','DEFAULT','0',NULL,1447347600000,1447344000000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-ReportGenerateReportingDocumentJobTrigger','DEFAULT','system-ReportGenerateReportingDocumentJobDetail','DEFAULT','0',NULL,1447347600000,1447344000000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-TCConsumeWSChequesListJobTrigger','DEFAULT','system-TCConsumeWSChequesListJobDetail','DEFAULT','0',NULL,1447416000000,1447329600000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-TCGenerateTimeCardsJobTrigger','DEFAULT','system-TCGenerateTimeCardsJobDetail','DEFAULT','0',NULL,1447416000000,1447329600000,5,'WAITING','CRON',1412618639000,0,NULL,0,''),('system-TCPositionProfileSupersedeJobTrigger','DEFAULT','system-TCPositionProfileSupersedeJobDetail','DEFAULT','0',NULL,1447416000000,1447329600000,5,'WAITING','CRON',1412618639000,0,NULL,0,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_table`
--

DROP TABLE IF EXISTS `sequence_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_table` (
  `SEQ_NAME` varchar(100) NOT NULL,
  `SEQ_COUNT` int(11) unsigned NOT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_table`
--

LOCK TABLES `sequence_table` WRITE;
/*!40000 ALTER TABLE `sequence_table` DISABLE KEYS */;
INSERT INTO `sequence_table` VALUES ('CNF_ACLLevel_SEQ',3),('CNF_Customer_SEQ',16533),('CNF_GCSBucketCustomer_SEQ',1),('CNF_GCSProject_SEQ',1),('CNF_Role_SEQ',3),('CNF_UserRole_SEQ',3),('CNF_User_SEQ',12),('customeruser_seq',7088),('gatethreeuser_seq',16198),('lkp_country_seq',5470),('LKP_Language_SEQ',5),('lkp_securityquestion_SEQ',5317),('lkp_state_seq',150),('SystemException_SEQ',540),('UserContact_SEQ',25),('UserRecentAccessProject_SEQ',834),('UserSignUp_SEQ',8179);
/*!40000 ALTER TABLE `sequence_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersignup`
--

DROP TABLE IF EXISTS `usersignup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersignup` (
  `IDUserSignUp` int(10) unsigned NOT NULL,
  `SignupID` varchar(200) DEFAULT NULL,
  `FKCustomer` int(10) unsigned DEFAULT NULL,
  `FKContact` int(10) unsigned DEFAULT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  `LockVersion` int(10) DEFAULT NULL,
  PRIMARY KEY (`IDUserSignUp`),
  KEY `FK_CNF_Customer_UserSignUp` (`FKCustomer`),
  CONSTRAINT `FK_CNF_Customer_UserSignUp` FOREIGN KEY (`FKCustomer`) REFERENCES `cnf_customer` (`IDCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersignup`
--

LOCK TABLES `usersignup` WRITE;
/*!40000 ALTER TABLE `usersignup` DISABLE KEYS */;
INSERT INTO `usersignup` VALUES (1,'b9e01dcb-154f-49ce-8c91-fac49001a812',1,333863,100019,'2014-08-08 12:08:50',100019,'2014-08-08 12:08:50',NULL),(2,'7dc8ccc9-7815-4945-9227-05a05d3363aa',1,3714,100019,'2014-08-08 12:15:15',100019,'2014-08-08 12:15:15',NULL),(3,'c8f2c4a6-3550-4cab-ab56-81e102820c02',1,345765,100019,'2014-08-11 14:21:24',100019,'2014-08-11 14:21:24',NULL),(4,'fc55de60-75e0-49b4-9d40-2ba7353577f8',1,347827,100019,'2014-08-11 14:21:25',100019,'2014-08-11 14:21:25',NULL),(5,'bc96fd93-fee3-41e5-b4ea-bd219eb4e364',1,347574,100019,'2014-08-11 14:23:18',100019,'2014-08-11 14:23:18',NULL),(6,'986a7212-8648-45c9-bd88-7a68a5df3e25',1,6353,100019,'2014-08-11 15:07:59',100019,'2014-08-11 15:07:59',NULL),(7,'1d004299-46d2-4698-ab29-4254d07ffc02',1,2913,100019,'2014-08-11 15:13:02',100019,'2014-08-11 15:13:02',NULL),(8,'65159799-d3ef-4ba8-9ac6-bc7323af9ba4',1,345429,0,'2014-08-13 09:51:37',0,'2014-08-13 09:51:37',NULL),(9,'382b5383-08c0-4049-b7cf-06bde765a69d',1,344437,0,'2014-08-13 09:55:14',0,'2014-08-13 09:55:14',NULL),(10,'e7a4979d-b3ed-47ff-aa28-2dcb712baace',1,345584,0,'2014-08-13 09:57:04',0,'2014-08-13 09:57:04',NULL),(11,'cd718c73-98d8-48dd-94c2-16d739d9ed8f',1,342173,0,'2014-08-13 09:57:52',0,'2014-08-13 09:57:52',NULL),(12,'aec1c028-63c3-4c3b-9d29-9b2be45168c6',1,347305,0,'2014-08-15 13:13:41',0,'2014-08-15 13:13:41',NULL),(27,'a4f024a5-c4d2-44e3-ab78-54c5bd98cc0c',1,156,100019,'2014-08-15 19:39:04',100019,'2014-08-15 19:39:04',NULL),(28,'86c7058e-829d-4000-b142-12cf46b89e70',1,347818,100019,'2014-08-15 20:18:07',100019,'2014-08-15 20:18:07',NULL),(29,'2d5e1692-2fce-4b12-b390-3f86b93cd168',1,347815,100019,'2014-08-15 20:18:38',100019,'2014-08-15 20:18:38',NULL),(30,'929942fd-6810-490a-99d7-3dcc1b5bf2d9',1,347824,100019,'2014-08-15 20:19:05',100019,'2014-08-15 20:19:05',NULL),(45,'57c97615-793d-4dac-80a6-7718e0528726',1,344859,100021,'2014-08-18 10:20:27',100021,'2014-08-18 10:20:27',NULL),(46,'e63f3fde-c788-4001-95f9-0dac949a4629',1,344865,100021,'2014-08-18 10:20:28',100021,'2014-08-18 10:20:28',NULL),(301,'4979b098-f168-455d-a8ed-d2f0b2e3b371',1,345313,100019,'2014-09-15 10:23:54',100019,'2014-09-15 10:23:54',NULL),(579,'90c97193-a041-4441-bbb4-ae434e0d7412',1,341887,100021,'2014-10-07 10:55:05',100021,'2014-10-07 10:55:05',NULL),(580,'9a9cb391-71d5-4c1f-94ee-b77b28b861ce',1,333856,100021,'2014-10-07 10:55:06',100021,'2014-10-07 10:55:06',NULL),(581,'0c5781d3-5c54-4dd5-bdae-44a9cc1e6d48',1,344878,100021,'2014-10-07 10:55:07',100021,'2014-10-07 10:55:07',NULL),(596,'fdf1b108-282e-4c0e-ab40-4d1196373768',1,345648,100021,'2014-10-08 14:28:10',100021,'2014-10-08 14:28:10',NULL),(723,'33b454ef-bd0a-47c8-8be2-d55685efec4a',1,348525,100019,'2014-10-15 16:39:39',100019,'2014-10-15 16:39:39',NULL),(822,'05614412-589c-48b9-a203-0fff14c16243',1,345672,100021,'2014-10-21 12:02:08',100021,'2014-10-21 12:02:08',NULL),(907,'f71bc631-d98f-4efd-937c-88ffa4e86064',1,3044,100021,'2014-10-24 11:02:45',100021,'2014-10-24 11:02:45',NULL),(950,'ed36f01f-b845-4308-b56a-8a65eab59c82',1,341702,100019,'2014-10-28 10:48:58',100019,'2014-10-28 10:48:58',NULL),(1035,'ac72d3f4-2766-42f3-919f-58bd60f4d539',1,344594,100021,'2014-10-31 13:46:15',100021,'2014-10-31 13:46:15',NULL),(1036,'587939ec-dc79-4517-858d-a94e5610a979',1,345652,100021,'2014-11-03 11:23:07',100021,'2014-11-03 11:23:07',NULL),(1037,'147d60bc-4e6a-4394-9e1b-9ff98253cd94',1,345065,100019,'2014-11-05 12:09:53',100019,'2014-11-05 12:09:53',NULL),(1080,'7c20a05d-c137-40a7-a0af-55a9e9eb0425',1,344384,100002,'2014-11-07 10:08:56',100002,'2014-11-07 10:08:56',NULL),(1137,'2ae57408-60ff-47f4-91e9-48161c1f41a3',1,343867,100019,'2014-11-11 16:03:23',100019,'2014-11-11 16:03:23',NULL),(1208,'2cab9057-8eb8-43ce-b05a-c8715e731123',1,347697,100019,'2014-11-14 10:15:36',100019,'2014-11-14 10:15:36',NULL),(1293,'a2e5608c-6b35-4801-b978-17a298dc142c',1,343945,100002,'2014-11-18 14:41:05',100002,'2014-11-18 14:41:05',NULL),(1294,'697a4af8-9624-4062-b989-7da9490dab21',1,344205,100002,'2014-11-18 14:59:21',100002,'2014-11-18 14:59:21',NULL),(1351,'6c693005-1be8-47e5-ab50-fb02d2a1025d',1,346418,100019,'2014-11-20 10:15:59',100019,'2014-11-20 10:15:59',NULL),(1366,'7833567b-7e83-410f-bbe0-51bcabeae686',1,334153,100019,'2014-11-20 17:57:36',100019,'2014-11-20 17:57:36',NULL),(1465,'0a13111e-90ac-45f6-bfa4-466aeecc7f8d',1,347701,100019,'2014-11-25 14:41:15',100019,'2014-11-25 14:41:15',NULL),(1494,'c80fad0e-5931-4e60-a1c1-f8befe60a7f5',1,345359,100019,'2014-11-26 10:43:12',100019,'2014-11-26 10:43:12',NULL),(1593,'3704d923-3577-4e6f-9e60-d9edac93d585',1,344753,100002,'2014-12-02 08:42:35',100002,'2014-12-02 08:42:35',NULL),(1622,'fc5003f2-1239-42f0-9be3-77fe90683bec',1,343241,100002,'2014-12-03 09:27:31',100002,'2014-12-03 09:27:31',NULL),(1623,'c5db7fd6-b06a-4508-b5bb-aa937120d7cb',1,344459,100002,'2014-12-03 09:27:31',100002,'2014-12-03 09:27:31',NULL),(1624,'10622cfd-45a5-4236-993f-781a0adf3b71',1,345037,100008,'2014-12-03 13:19:03',100008,'2014-12-03 13:19:03',NULL),(1667,'fa3ba2de-5ffe-48df-96ae-1c0f13b8d3fc',1,348567,0,'2014-12-05 10:52:28',0,'2014-12-05 10:52:28',NULL),(1920,'35b4c6b1-7c30-47ce-bd50-7e52cb3a6fb2',1,347219,0,'2014-12-17 11:06:11',0,'2014-12-17 11:06:11',NULL),(1935,'c4c528b9-6dcf-4916-b1de-a6046832f496',1,345717,0,'2014-12-17 11:54:29',0,'2014-12-17 11:54:29',NULL),(1964,'9d20c80b-6900-4e6b-b76e-11a18ab9b528',1,347555,0,'2014-12-18 17:33:06',0,'2014-12-18 17:33:06',NULL),(1965,'e15a09f3-4eb1-4206-9e14-1d7db7a3979f',1,348578,0,'2014-12-18 19:59:15',0,'2014-12-18 19:59:15',NULL),(2036,'f7d5204f-e53f-4982-a06f-12cebca1b842',1,333860,100021,'2015-01-05 10:30:38',100021,'2015-01-05 10:30:38',NULL),(2037,'81a27302-5c68-47bf-98ac-3bb2295010a4',1,343380,100073,'2015-01-05 14:19:05',100073,'2015-01-05 14:19:05',NULL),(2444,'f8af663a-6d39-4156-b318-b8488ef3c7bc',1,347297,0,'2015-01-30 11:42:07',0,'2015-01-30 11:42:07',NULL),(2795,'814fd04d-0b85-4ea0-8bcf-f6e73533fce8',1,346943,0,'2015-02-23 10:01:18',0,'2015-02-23 10:01:18',NULL),(2852,'a32bb6b9-bc48-4577-a9b4-a6c133ea4beb',1,345069,100019,'2015-02-25 16:05:42',100019,'2015-02-25 16:05:42',NULL),(3133,'06060cd8-8bf8-49f5-b111-a4ee16f41186',1,341839,100021,'2015-03-10 09:50:40',100021,'2015-03-10 09:50:40',NULL),(3190,'bf315210-b320-4f1a-ada4-0c416be8edde',1,342244,100002,'2015-03-12 14:13:03',100002,'2015-03-12 14:13:03',NULL),(3681,'324ff80a-eb91-4e31-8d4e-1d0f7b7773d4',1,346767,0,'2015-04-02 11:30:21',0,'2015-04-02 11:30:21',NULL),(3808,'389c05bb-baa1-4350-9de8-9b4e94a92c3c',1,345350,0,'2015-04-07 12:15:24',0,'2015-04-07 12:15:24',NULL),(3963,'3bacb638-6580-4367-b1f5-dd59bee2f6e2',1,348610,0,'2015-04-10 12:14:18',0,'2015-04-10 12:14:18',NULL),(4301,'9a3272d6-0a53-4f99-a68d-30469f04a26f',1,348617,100019,'2015-05-15 12:34:57',100019,'2015-05-15 12:34:57',NULL),(4302,'2894d19b-99e2-43f3-be6e-21f9c6a46165',1,348621,100019,'2015-05-15 14:29:10',100019,'2015-05-15 14:29:10',NULL),(4303,'55b01153-9b28-438b-9f63-825dd9da2a26',1,345629,0,'2015-05-19 10:44:04',0,'2015-05-19 10:44:04',NULL),(4304,'db99a84e-b10c-44d2-8765-48c08cc5247e',1,348626,100019,'2015-05-21 11:51:58',100019,'2015-05-21 11:51:58',NULL),(4305,'49bba282-e071-4411-9ae3-0b0181ffc0ae',1,348628,100019,'2015-05-21 14:19:58',100019,'2015-05-21 14:19:58',NULL),(4306,'595763a1-21fd-4d6e-83e6-04aa82ab9429',1,348642,0,'2015-05-21 16:15:50',0,'2015-05-21 16:15:50',NULL),(4307,'bfdf49ee-d2cb-43e7-b27c-b59bf2b0852d',1,348641,0,'2015-05-21 16:15:52',0,'2015-05-21 16:15:52',NULL),(4308,'7ad6d7a0-9a7f-4232-81be-fb0c25e5f5d3',1,348620,100019,'2015-05-25 15:38:05',100019,'2015-05-25 15:38:05',NULL),(4477,'ad9b7a01-d48d-4711-aaac-c04de3a90815',1,348630,0,'2015-06-02 10:26:46',0,'2015-06-02 10:26:46',NULL),(4478,'58182ddb-ab4d-4fee-b03d-70799aadc754',1,348634,0,'2015-06-02 10:40:10',0,'2015-06-02 10:40:10',NULL),(4479,'ffd7a7d2-2f19-48e4-9f85-4024c70aeb21',1,348647,0,'2015-06-02 14:34:41',0,'2015-06-02 14:34:41',NULL),(4509,'67520f9c-cb78-4f5a-9312-862ea9af7c19',1,344232,0,'2015-06-03 16:10:20',0,'2015-06-03 16:10:20',NULL),(4510,'66832f38-5b39-40af-b81e-596106f18e15',1,345437,0,'2015-06-03 16:10:30',0,'2015-06-03 16:10:30',NULL),(4511,'37177fca-be3c-4749-8aa3-6fcb65f491d8',1,345438,0,'2015-06-03 16:10:31',0,'2015-06-03 16:10:31',NULL),(4512,'472d5dc0-c253-48e3-911b-d92aad745e42',1,345439,0,'2015-06-03 16:10:33',0,'2015-06-03 16:10:33',NULL),(4513,'3c096a9e-8a0e-40c8-a549-cbe39aa3ad7f',1,346037,0,'2015-06-03 16:11:17',0,'2015-06-03 16:11:17',NULL),(4514,'c5b3854f-0cb5-4941-bbce-4e06aafcc743',1,345272,0,'2015-06-03 16:11:22',0,'2015-06-03 16:11:22',NULL),(4515,'35eee99a-d156-446c-af0d-302561c92374',1,347641,0,'2015-06-03 16:11:25',0,'2015-06-03 16:11:25',NULL),(4516,'962185cf-721b-41ea-bfb7-90ab5288e945',1,346461,0,'2015-06-03 16:12:46',0,'2015-06-03 16:12:46',NULL),(4517,'21c78c39-80dc-4321-b8c4-72eefa171c15',1,342112,0,'2015-06-03 16:12:52',0,'2015-06-03 16:12:52',NULL),(4518,'9fab9bf3-9ca5-4073-976d-721c981c4206',1,342114,0,'2015-06-03 16:12:55',0,'2015-06-03 16:12:55',NULL),(4519,'b65f1110-625d-4ca9-b54c-6cb03c4bc7ec',1,342117,0,'2015-06-03 16:13:00',0,'2015-06-03 16:13:00',NULL),(4520,'ea19a8bc-212c-4de7-afe1-a06420d033e5',1,342124,0,'2015-06-03 16:13:06',0,'2015-06-03 16:13:06',NULL),(4521,'ac384398-f1f4-46d4-9f40-ce30462dca58',1,341675,0,'2015-06-03 16:13:12',0,'2015-06-03 16:13:12',NULL),(4522,'0ce072ca-3fc5-4538-b3e6-a5a92c08d876',1,341689,0,'2015-06-03 16:13:14',0,'2015-06-03 16:13:14',NULL),(4523,'2440beb8-0a5e-4e77-9f62-fa9961e3c098',1,342304,0,'2015-06-03 16:13:15',0,'2015-06-03 16:13:15',NULL),(4524,'cdac57c5-dbc9-4490-a0d9-f309fefbf5e5',1,345644,0,'2015-06-03 16:13:32',0,'2015-06-03 16:13:32',NULL),(4637,'60e980a7-9263-4cb1-8329-7d4e8d2999cd',1,348652,0,'2015-06-09 15:55:40',0,'2015-06-09 15:55:40',NULL),(4890,'36178f60-6db4-4f83-8705-9c4ddb62daac',1,348663,0,'2015-06-17 13:44:43',0,'2015-06-17 13:44:43',NULL),(4891,'81b8da92-180b-4369-b9ab-79a8526af594',1,341500,0,'2015-06-17 14:26:48',0,'2015-06-17 14:26:48',NULL),(6040,'64dfcf06-5aa5-467f-9617-c1fbda645e4e',1,100019,0,'2015-08-05 16:25:22',0,'2015-08-05 16:25:22',NULL),(6139,'6d8685f9-c095-406e-97f2-27c4f359d20e',1,348661,100019,'2015-08-10 19:54:16',100019,'2015-08-10 19:54:16',NULL),(6336,'58e76259-7f6e-47c1-bcfd-96bf81fba984',1,348755,100019,'2015-08-17 09:15:42',100019,'2015-08-17 09:15:42',NULL),(6337,'72e47d5c-4eef-4916-96b3-9b21c67540d5',1,348758,100019,'2015-08-17 09:56:31',100019,'2015-08-17 09:56:31',NULL),(6660,'e7b5c8c2-a0e9-4789-80a8-561aad8dcca4',1,348787,0,'2015-08-31 11:31:51',0,'2015-08-31 11:31:51',NULL),(7039,'fc2c7cd6-840d-4cd5-a7f3-54822bf33d0c',1,348730,0,'2015-09-18 14:31:07',0,'2015-09-18 14:31:07',NULL),(7152,'c0e7eb96-5872-4059-bf4f-9969fe8463eb',1,348708,100019,'2015-09-24 11:13:39',100019,'2015-09-24 11:13:39',NULL),(7307,'d5b4181d-5cf8-4fd4-b89e-2b45ae1917b7',1,348723,0,'2015-10-01 15:17:03',0,'2015-10-01 15:17:03',NULL),(7742,'d28b8168-3085-4570-909a-f6fc40e3288f',1,348765,100019,'2015-10-21 10:21:40',100019,'2015-10-21 10:21:40',NULL),(8051,'42b4547f-283c-4180-838a-eec12e5423ec',1,348698,0,'2015-11-04 16:43:51',0,'2015-11-04 16:43:51',NULL),(8080,'6da91e84-7bee-4ffd-9250-5fa20466095b',1,348705,100019,'2015-11-06 14:48:21',100019,'2015-11-06 14:48:21',NULL);
/*!40000 ALTER TABLE `usersignup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'g3common_v2'
--

--
-- Dumping routines for database 'g3common_v2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-12 11:06:08
