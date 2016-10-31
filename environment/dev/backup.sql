mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: itop
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `applicationsolution`
--

DROP TABLE IF EXISTS `applicationsolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicationsolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `redundancy` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'disabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationsolution`
--

LOCK TABLES `applicationsolution` WRITE;
/*!40000 ALTER TABLE `applicationsolution` DISABLE KEYS */;
INSERT INTO `applicationsolution` VALUES (11,'active','disabled'),(12,'active','disabled'),(13,'active','disabled'),(14,'active','disabled');
/*!40000 ALTER TABLE `applicationsolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expire` datetime DEFAULT NULL,
  `temp_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_id` int(11) DEFAULT '0',
  `item_org_id` int(11) DEFAULT '0',
  `contents_data` longblob,
  `contents_mimetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temp_id` (`temp_id`),
  KEY `item_class_item_id` (`item_class`,`item_id`),
  KEY `item_org_id` (`item_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1),(2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businessprocess`
--

DROP TABLE IF EXISTS `businessprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessprocess`
--

LOCK TABLES `businessprocess` WRITE;
/*!40000 ALTER TABLE `businessprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `businessprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change`
--

DROP TABLE IF EXISTS `change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('approved','assigned','closed','implemented','monitored','new','notapproved','plannedscheduled','rejected','validated') COLLATE utf8_unicode_ci DEFAULT 'new',
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `requestor_id` int(11) DEFAULT '0',
  `creation_date` datetime DEFAULT NULL,
  `impact` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `supervisor_group_id` int(11) DEFAULT '0',
  `supervisor_id` int(11) DEFAULT '0',
  `manager_group_id` int(11) DEFAULT '0',
  `manager_id` int(11) DEFAULT '0',
  `outage` enum('no','yes') COLLATE utf8_unicode_ci DEFAULT 'no',
  `fallback` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `requestor_id` (`requestor_id`),
  KEY `supervisor_group_id` (`supervisor_group_id`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `manager_group_id` (`manager_group_id`),
  KEY `manager_id` (`manager_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change`
--

LOCK TABLES `change` WRITE;
/*!40000 ALTER TABLE `change` DISABLE KEYS */;
/*!40000 ALTER TABLE `change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_approved`
--

DROP TABLE IF EXISTS `change_approved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_approved` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_date` datetime DEFAULT NULL,
  `approval_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_approved`
--

LOCK TABLES `change_approved` WRITE;
/*!40000 ALTER TABLE `change_approved` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_approved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_emergency`
--

DROP TABLE IF EXISTS `change_emergency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_emergency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_emergency`
--

LOCK TABLES `change_emergency` WRITE;
/*!40000 ALTER TABLE `change_emergency` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_normal`
--

DROP TABLE IF EXISTS `change_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_normal`
--

LOCK TABLES `change_normal` WRITE;
/*!40000 ALTER TABLE `change_normal` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_routine`
--

DROP TABLE IF EXISTS `change_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_routine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_routine`
--

LOCK TABLES `change_routine` WRITE;
/*!40000 ALTER TABLE `change_routine` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectableci`
--

DROP TABLE IF EXISTS `connectableci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectableci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectableci`
--

LOCK TABLES `connectableci` WRITE;
/*!40000 ALTER TABLE `connectableci` DISABLE KEYS */;
INSERT INTO `connectableci` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `connectableci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `org_id` int(11) DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `notify` enum('no','yes') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `function` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Contact',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'My last name','active',1,'my.email@foo.org','+00 000 000 000','yes','','Person'),(2,'Gavalda','active',2,'gavalda@it.com','','yes','','Person'),(3,'Monet','active',3,'monet@demo.com','','yes','','Person'),(4,'Delacroix','active',3,'delacroix@demo.com','','yes','','Person'),(5,'Flaubert','active',2,'flaubert@it.com','','yes','','Person'),(6,'Cocteau','active',2,'cocteau@it.com','','yes','','Person'),(7,'Kahlo','active',3,'frida.kahlo@demo.com','','yes','','Person'),(8,'Sartre','active',2,'sartre@it.com','','yes','','Person'),(9,'Verne','active',2,'vernes@it.com','','yes','','Person'),(10,'Duras','active',2,'duras@it.com','','yes','','Person'),(11,'Picasso','active',3,'pablo@demo.com','','yes','','Person'),(12,'Dali','active',3,'dali@demo.com','','yes','','Person'),(13,'Hugo','active',2,'hugo@it.com','','yes','','Person'),(14,'Hardware support','active',2,'hw@test.com','','yes','','Team'),(15,'Helpdesk','active',2,'','','yes','','Team'),(16,'Network support','active',2,'nw@test.com','','yes','','Team'),(17,'System & application support','active',2,'','','yes','','Team'),(18,'kutya','active',3,'','','yes','','Person'),(19,'dsa','active',3,'','','yes','','Person');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacttype`
--

DROP TABLE IF EXISTS `contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacttype`
--

LOCK TABLES `contacttype` WRITE;
/*!40000 ALTER TABLE `contacttype` DISABLE KEYS */;
INSERT INTO `contacttype` VALUES (12),(13),(14),(15),(16),(17);
/*!40000 ALTER TABLE `contacttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `cost_currency` enum('dollars','euros') COLLATE utf8_unicode_ci DEFAULT NULL,
  `contracttype_id` int(11) DEFAULT '0',
  `billing_frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `cost_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `provider_id` int(11) DEFAULT '0',
  `status` enum('implementation','obsolete','production') COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Contract',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `contracttype_id` (`contracttype_id`),
  KEY `provider_id` (`provider_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,'Customer contract Demo',3,'',NULL,NULL,'',NULL,0,'','',2,NULL,'CustomerContract');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracttype`
--

DROP TABLE IF EXISTS `contracttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracttype`
--

LOCK TABLES `contracttype` WRITE;
/*!40000 ALTER TABLE `contracttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercontract`
--

DROP TABLE IF EXISTS `customercontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customercontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercontract`
--

LOCK TABLES `customercontract` WRITE;
/*!40000 ALTER TABLE `customercontract` DISABLE KEYS */;
INSERT INTO `customercontract` VALUES (1);
/*!40000 ALTER TABLE `customercontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databaseschema`
--

DROP TABLE IF EXISTS `databaseschema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databaseschema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbserver_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dbserver_id` (`dbserver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databaseschema`
--

LOCK TABLES `databaseschema` WRITE;
/*!40000 ALTER TABLE `databaseschema` DISABLE KEYS */;
INSERT INTO `databaseschema` VALUES (8,7),(27,25),(28,26);
/*!40000 ALTER TABLE `databaseschema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacenterdevice`
--

DROP TABLE IF EXISTS `datacenterdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacenterdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_id` int(11) DEFAULT '0',
  `enclosure_id` int(11) DEFAULT '0',
  `nb_u` int(11) DEFAULT NULL,
  `managementip` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `powera_id` int(11) DEFAULT '0',
  `powerB_id` int(11) DEFAULT '0',
  `redundancy` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `rack_id` (`rack_id`),
  KEY `enclosure_id` (`enclosure_id`),
  KEY `powera_id` (`powera_id`),
  KEY `powerB_id` (`powerB_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacenterdevice`
--

LOCK TABLES `datacenterdevice` WRITE;
/*!40000 ALTER TABLE `datacenterdevice` DISABLE KEYS */;
INSERT INTO `datacenterdevice` VALUES (1,0,0,NULL,'',0,0,'1'),(2,0,0,NULL,'',0,0,'1'),(3,0,0,NULL,'',0,0,'1'),(4,0,0,NULL,'10.10.24.2',0,0,'1'),(5,0,0,NULL,'',0,0,'1'),(6,0,0,NULL,'',0,0,'1');
/*!40000 ALTER TABLE `datacenterdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbserver`
--

DROP TABLE IF EXISTS `dbserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbserver`
--

LOCK TABLES `dbserver` WRITE;
/*!40000 ALTER TABLE `dbserver` DISABLE KEYS */;
INSERT INTO `dbserver` VALUES (7),(25),(26);
/*!40000 ALTER TABLE `dbserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverymodel`
--

DROP TABLE IF EXISTS `deliverymodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverymodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymodel`
--

LOCK TABLES `deliverymodel` WRITE;
/*!40000 ALTER TABLE `deliverymodel` DISABLE KEYS */;
INSERT INTO `deliverymodel` VALUES (1,'Standard support',2,'');
/*!40000 ALTER TABLE `deliverymodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `documenttype_id` int(11) DEFAULT '0',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('draft','obsolete','published') COLLATE utf8_unicode_ci DEFAULT NULL,
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Document',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `documenttype_id` (`documenttype_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentfile`
--

DROP TABLE IF EXISTS `documentfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_data` longblob,
  `file_mimetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentfile`
--

LOCK TABLES `documentfile` WRITE;
/*!40000 ALTER TABLE `documentfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentnote`
--

DROP TABLE IF EXISTS `documentnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentnote`
--

LOCK TABLES `documentnote` WRITE;
/*!40000 ALTER TABLE `documentnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documenttype`
--

DROP TABLE IF EXISTS `documenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documenttype`
--

LOCK TABLES `documenttype` WRITE;
/*!40000 ALTER TABLE `documenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `documenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentweb`
--

DROP TABLE IF EXISTS `documentweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentweb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentweb`
--

LOCK TABLES `documentweb` WRITE;
/*!40000 ALTER TABLE `documentweb` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentweb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enclosure`
--

DROP TABLE IF EXISTS `enclosure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enclosure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_id` int(11) DEFAULT '0',
  `nb_u` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rack_id` (`rack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enclosure`
--

LOCK TABLES `enclosure` WRITE;
/*!40000 ALTER TABLE `enclosure` DISABLE KEYS */;
/*!40000 ALTER TABLE `enclosure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm`
--

DROP TABLE IF EXISTS `farm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `farm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redundancy` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm`
--

LOCK TABLES `farm` WRITE;
/*!40000 ALTER TABLE `farm` DISABLE KEYS */;
INSERT INTO `farm` VALUES (16,'1'),(17,'1');
/*!40000 ALTER TABLE `farm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiberchannelinterface`
--

DROP TABLE IF EXISTS `fiberchannelinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiberchannelinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `speed` decimal(6,2) DEFAULT NULL,
  `topology` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `wwn` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `datacenterdevice_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `datacenterdevice_id` (`datacenterdevice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiberchannelinterface`
--

LOCK TABLES `fiberchannelinterface` WRITE;
/*!40000 ALTER TABLE `fiberchannelinterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiberchannelinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionalci`
--

DROP TABLE IF EXISTS `functionalci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functionalci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `org_id` int(11) DEFAULT '0',
  `business_criticity` enum('high','low','medium') COLLATE utf8_unicode_ci DEFAULT 'low',
  `move2production` date DEFAULT NULL,
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'FunctionalCI',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionalci`
--

LOCK TABLES `functionalci` WRITE;
/*!40000 ALTER TABLE `functionalci` DISABLE KEYS */;
INSERT INTO `functionalci` VALUES (1,'Server1','',3,'low',NULL,'Server'),(2,'Server2','',3,'low',NULL,'Server'),(3,'Server3','',3,'low',NULL,'Server'),(4,'Server4','',3,'low',NULL,'Server'),(5,'Router1','',3,'low',NULL,'NetworkDevice'),(6,'Switch1','',3,'low',NULL,'NetworkDevice'),(7,'Oracle','',3,'low',NULL,'DBServer'),(8,'openerpprod','',3,'low',NULL,'DatabaseSchema'),(9,'IIS','',3,'low',NULL,'WebServer'),(10,'onlineSales','',3,'low',NULL,'WebApplication'),(11,'CRM','',3,'high',NULL,'ApplicationSolution'),(12,'ERP','',3,'low',NULL,'ApplicationSolution'),(13,'itop','',3,'low',NULL,'ApplicationSolution'),(14,'Sales web site','',3,'high',NULL,'ApplicationSolution'),(15,'Rack1','',3,'low',NULL,'Rack'),(16,'Cluster1','',3,'low',NULL,'Farm'),(17,'Cluster2','',3,'medium',NULL,'Farm'),(18,'ESX1','',3,'low',NULL,'Hypervisor'),(19,'ESX2','',3,'low',NULL,'Hypervisor'),(20,'ESX3','',3,'low',NULL,'Hypervisor'),(21,'VM1','',3,'low',NULL,'VirtualMachine'),(22,'VM2','',3,'low',NULL,'VirtualMachine'),(23,'VM3','',3,'low',NULL,'VirtualMachine'),(24,'VM4','',3,'low',NULL,'VirtualMachine'),(25,'MySQL','',3,'low',NULL,'DBServer'),(26,'Oracle','',3,'low',NULL,'DBServer'),(27,'itop-demo','',3,'low',NULL,'DatabaseSchema'),(28,'sugarcrmprod','',3,'low',NULL,'DatabaseSchema'),(29,'Apache','',3,'low',NULL,'WebServer'),(30,'Open ERP','',3,'low',NULL,'WebApplication'),(31,'Sugar CRM','',3,'high',NULL,'WebApplication');
/*!40000 ALTER TABLE `functionalci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('implementation','obsolete','production') COLLATE utf8_unicode_ci DEFAULT 'implementation',
  `org_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `parent_id` int(11) DEFAULT '0',
  `parent_id_left` int(11) DEFAULT '0',
  `parent_id_right` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_id_left` (`parent_id_left`),
  KEY `parent_id_right` (`parent_id_right`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hypervisor`
--

DROP TABLE IF EXISTS `hypervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hypervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `farm_id` int(11) DEFAULT '0',
  `server_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `farm_id` (`farm_id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hypervisor`
--

LOCK TABLES `hypervisor` WRITE;
/*!40000 ALTER TABLE `hypervisor` DISABLE KEYS */;
INSERT INTO `hypervisor` VALUES (18,16,1),(19,16,3),(20,17,0);
/*!40000 ALTER TABLE `hypervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inline_image`
--

DROP TABLE IF EXISTS `inline_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inline_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expire` datetime DEFAULT NULL,
  `temp_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_id` int(11) DEFAULT '0',
  `item_org_id` int(11) DEFAULT '0',
  `contents_data` longblob,
  `contents_mimetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `temp_id` (`temp_id`),
  KEY `item_class_item_id` (`item_class`,`item_id`),
  KEY `item_org_id` (`item_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inline_image`
--

LOCK TABLES `inline_image` WRITE;
/*!40000 ALTER TABLE `inline_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `inline_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iosversion`
--

DROP TABLE IF EXISTS `iosversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iosversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iosversion`
--

LOCK TABLES `iosversion` WRITE;
/*!40000 ALTER TABLE `iosversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `iosversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipinterface`
--

DROP TABLE IF EXISTS `ipinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `macaddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `ipgateway` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ipmask` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `speed` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipinterface`
--

LOCK TABLES `ipinterface` WRITE;
/*!40000 ALTER TABLE `ipinterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipphone`
--

DROP TABLE IF EXISTS `ipphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipphone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipphone`
--

LOCK TABLES `ipphone` WRITE;
/*!40000 ALTER TABLE `ipphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence`
--

DROP TABLE IF EXISTS `licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `usage_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `licence_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `perpetual` enum('no','yes') COLLATE utf8_unicode_ci DEFAULT 'no',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Licence',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence`
--

LOCK TABLES `licence` WRITE;
/*!40000 ALTER TABLE `licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkapplicationsolutiontobusinessprocess`
--

DROP TABLE IF EXISTS `lnkapplicationsolutiontobusinessprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkapplicationsolutiontobusinessprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessprocess_id` int(11) DEFAULT '0',
  `applicationsolution_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `businessprocess_id` (`businessprocess_id`),
  KEY `applicationsolution_id` (`applicationsolution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkapplicationsolutiontobusinessprocess`
--

LOCK TABLES `lnkapplicationsolutiontobusinessprocess` WRITE;
/*!40000 ALTER TABLE `lnkapplicationsolutiontobusinessprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkapplicationsolutiontobusinessprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkapplicationsolutiontofunctionalci`
--

DROP TABLE IF EXISTS `lnkapplicationsolutiontofunctionalci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkapplicationsolutiontofunctionalci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationsolution_id` int(11) DEFAULT '0',
  `functionalci_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `applicationsolution_id` (`applicationsolution_id`),
  KEY `functionalci_id` (`functionalci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkapplicationsolutiontofunctionalci`
--

LOCK TABLES `lnkapplicationsolutiontofunctionalci` WRITE;
/*!40000 ALTER TABLE `lnkapplicationsolutiontofunctionalci` DISABLE KEYS */;
INSERT INTO `lnkapplicationsolutiontofunctionalci` VALUES (1,12,8),(2,13,29),(3,14,11),(4,14,12),(5,11,28),(6,11,31),(7,12,30),(8,13,27);
/*!40000 ALTER TABLE `lnkapplicationsolutiontofunctionalci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkconnectablecitonetworkdevice`
--

DROP TABLE IF EXISTS `lnkconnectablecitonetworkdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkconnectablecitonetworkdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkdevice_id` int(11) DEFAULT '0',
  `connectableci_id` int(11) DEFAULT '0',
  `network_port` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `device_port` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` enum('downlink','uplink') COLLATE utf8_unicode_ci DEFAULT 'downlink',
  PRIMARY KEY (`id`),
  KEY `networkdevice_id` (`networkdevice_id`),
  KEY `connectableci_id` (`connectableci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkconnectablecitonetworkdevice`
--

LOCK TABLES `lnkconnectablecitonetworkdevice` WRITE;
/*!40000 ALTER TABLE `lnkconnectablecitonetworkdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkconnectablecitonetworkdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcontacttocontract`
--

DROP TABLE IF EXISTS `lnkcontacttocontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcontacttocontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `contact_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcontacttocontract`
--

LOCK TABLES `lnkcontacttocontract` WRITE;
/*!40000 ALTER TABLE `lnkcontacttocontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkcontacttocontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcontacttofunctionalci`
--

DROP TABLE IF EXISTS `lnkcontacttofunctionalci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcontacttofunctionalci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionalci_id` int(11) DEFAULT '0',
  `contact_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `functionalci_id` (`functionalci_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcontacttofunctionalci`
--

LOCK TABLES `lnkcontacttofunctionalci` WRITE;
/*!40000 ALTER TABLE `lnkcontacttofunctionalci` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkcontacttofunctionalci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcontacttoservice`
--

DROP TABLE IF EXISTS `lnkcontacttoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcontacttoservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT '0',
  `contact_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcontacttoservice`
--

LOCK TABLES `lnkcontacttoservice` WRITE;
/*!40000 ALTER TABLE `lnkcontacttoservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkcontacttoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcontacttoticket`
--

DROP TABLE IF EXISTS `lnkcontacttoticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcontacttoticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `contact_id` int(11) DEFAULT '0',
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `impact_code` enum('computed','do_not_notify','manual') COLLATE utf8_unicode_ci DEFAULT 'manual',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcontacttoticket`
--

LOCK TABLES `lnkcontacttoticket` WRITE;
/*!40000 ALTER TABLE `lnkcontacttoticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkcontacttoticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcontracttodocument`
--

DROP TABLE IF EXISTS `lnkcontracttodocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcontracttodocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contract_id` (`contract_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcontracttodocument`
--

LOCK TABLES `lnkcontracttodocument` WRITE;
/*!40000 ALTER TABLE `lnkcontracttodocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkcontracttodocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkcustomercontracttoservice`
--

DROP TABLE IF EXISTS `lnkcustomercontracttoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkcustomercontracttoservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customercontract_id` int(11) DEFAULT '0',
  `service_id` int(11) DEFAULT '0',
  `sla_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customercontract_id` (`customercontract_id`),
  KEY `service_id` (`service_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkcustomercontracttoservice`
--

LOCK TABLES `lnkcustomercontracttoservice` WRITE;
/*!40000 ALTER TABLE `lnkcustomercontracttoservice` DISABLE KEYS */;
INSERT INTO `lnkcustomercontracttoservice` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1);
/*!40000 ALTER TABLE `lnkcustomercontracttoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdatacenterdevicetosan`
--

DROP TABLE IF EXISTS `lnkdatacenterdevicetosan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdatacenterdevicetosan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `san_id` int(11) DEFAULT '0',
  `datacenterdevice_id` int(11) DEFAULT '0',
  `san_port` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `datacenterdevice_port` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `san_id` (`san_id`),
  KEY `datacenterdevice_id` (`datacenterdevice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdatacenterdevicetosan`
--

LOCK TABLES `lnkdatacenterdevicetosan` WRITE;
/*!40000 ALTER TABLE `lnkdatacenterdevicetosan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdatacenterdevicetosan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdeliverymodeltocontact`
--

DROP TABLE IF EXISTS `lnkdeliverymodeltocontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdeliverymodeltocontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliverymodel_id` int(11) DEFAULT '0',
  `contact_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deliverymodel_id` (`deliverymodel_id`),
  KEY `contact_id` (`contact_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdeliverymodeltocontact`
--

LOCK TABLES `lnkdeliverymodeltocontact` WRITE;
/*!40000 ALTER TABLE `lnkdeliverymodeltocontact` DISABLE KEYS */;
INSERT INTO `lnkdeliverymodeltocontact` VALUES (1,1,8,17),(2,1,17,16),(3,1,15,17);
/*!40000 ALTER TABLE `lnkdeliverymodeltocontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdocumenttofunctionalci`
--

DROP TABLE IF EXISTS `lnkdocumenttofunctionalci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdocumenttofunctionalci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionalci_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `functionalci_id` (`functionalci_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdocumenttofunctionalci`
--

LOCK TABLES `lnkdocumenttofunctionalci` WRITE;
/*!40000 ALTER TABLE `lnkdocumenttofunctionalci` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdocumenttofunctionalci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdocumenttolicence`
--

DROP TABLE IF EXISTS `lnkdocumenttolicence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdocumenttolicence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `licence_id` (`licence_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdocumenttolicence`
--

LOCK TABLES `lnkdocumenttolicence` WRITE;
/*!40000 ALTER TABLE `lnkdocumenttolicence` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdocumenttolicence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdocumenttopatch`
--

DROP TABLE IF EXISTS `lnkdocumenttopatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdocumenttopatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patch_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `patch_id` (`patch_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdocumenttopatch`
--

LOCK TABLES `lnkdocumenttopatch` WRITE;
/*!40000 ALTER TABLE `lnkdocumenttopatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdocumenttopatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdocumenttoservice`
--

DROP TABLE IF EXISTS `lnkdocumenttoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdocumenttoservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdocumenttoservice`
--

LOCK TABLES `lnkdocumenttoservice` WRITE;
/*!40000 ALTER TABLE `lnkdocumenttoservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdocumenttoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkdocumenttosoftware`
--

DROP TABLE IF EXISTS `lnkdocumenttosoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkdocumenttosoftware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_id` int(11) DEFAULT '0',
  `document_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `software_id` (`software_id`),
  KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkdocumenttosoftware`
--

LOCK TABLES `lnkdocumenttosoftware` WRITE;
/*!40000 ALTER TABLE `lnkdocumenttosoftware` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkdocumenttosoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkfunctionalcitoospatch`
--

DROP TABLE IF EXISTS `lnkfunctionalcitoospatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkfunctionalcitoospatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ospatch_id` int(11) DEFAULT '0',
  `functionalci_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ospatch_id` (`ospatch_id`),
  KEY `functionalci_id` (`functionalci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkfunctionalcitoospatch`
--

LOCK TABLES `lnkfunctionalcitoospatch` WRITE;
/*!40000 ALTER TABLE `lnkfunctionalcitoospatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkfunctionalcitoospatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkfunctionalcitoprovidercontract`
--

DROP TABLE IF EXISTS `lnkfunctionalcitoprovidercontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkfunctionalcitoprovidercontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providercontract_id` int(11) DEFAULT '0',
  `functionalci_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `providercontract_id` (`providercontract_id`),
  KEY `functionalci_id` (`functionalci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkfunctionalcitoprovidercontract`
--

LOCK TABLES `lnkfunctionalcitoprovidercontract` WRITE;
/*!40000 ALTER TABLE `lnkfunctionalcitoprovidercontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkfunctionalcitoprovidercontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkfunctionalcitoservice`
--

DROP TABLE IF EXISTS `lnkfunctionalcitoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkfunctionalcitoservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT '0',
  `functionalci_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `functionalci_id` (`functionalci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkfunctionalcitoservice`
--

LOCK TABLES `lnkfunctionalcitoservice` WRITE;
/*!40000 ALTER TABLE `lnkfunctionalcitoservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkfunctionalcitoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkfunctionalcitoticket`
--

DROP TABLE IF EXISTS `lnkfunctionalcitoticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkfunctionalcitoticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT '0',
  `functionalci_id` int(11) DEFAULT '0',
  `impact` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `impact_code` enum('computed','manual','not_impacted') COLLATE utf8_unicode_ci DEFAULT 'manual',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `functionalci_id` (`functionalci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkfunctionalcitoticket`
--

LOCK TABLES `lnkfunctionalcitoticket` WRITE;
/*!40000 ALTER TABLE `lnkfunctionalcitoticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkfunctionalcitoticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkgrouptoci`
--

DROP TABLE IF EXISTS `lnkgrouptoci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkgrouptoci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0',
  `ci_id` int(11) DEFAULT '0',
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `ci_id` (`ci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkgrouptoci`
--

LOCK TABLES `lnkgrouptoci` WRITE;
/*!40000 ALTER TABLE `lnkgrouptoci` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkgrouptoci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkpersontoteam`
--

DROP TABLE IF EXISTS `lnkpersontoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkpersontoteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT '0',
  `person_id` int(11) DEFAULT '0',
  `role_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `person_id` (`person_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkpersontoteam`
--

LOCK TABLES `lnkpersontoteam` WRITE;
/*!40000 ALTER TABLE `lnkpersontoteam` DISABLE KEYS */;
INSERT INTO `lnkpersontoteam` VALUES (1,17,9,0),(2,17,8,0),(3,15,9,0),(4,15,10,0),(5,15,13,0),(6,14,5,0),(7,14,2,0),(8,16,6,0),(9,16,7,0);
/*!40000 ALTER TABLE `lnkpersontoteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkphysicalinterfacetovlan`
--

DROP TABLE IF EXISTS `lnkphysicalinterfacetovlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkphysicalinterfacetovlan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physicalinterface_id` int(11) DEFAULT '0',
  `vlan_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `physicalinterface_id` (`physicalinterface_id`),
  KEY `vlan_id` (`vlan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkphysicalinterfacetovlan`
--

LOCK TABLES `lnkphysicalinterfacetovlan` WRITE;
/*!40000 ALTER TABLE `lnkphysicalinterfacetovlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkphysicalinterfacetovlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkprovidercontracttoservice`
--

DROP TABLE IF EXISTS `lnkprovidercontracttoservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkprovidercontracttoservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT '0',
  `providercontract_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `providercontract_id` (`providercontract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkprovidercontracttoservice`
--

LOCK TABLES `lnkprovidercontracttoservice` WRITE;
/*!40000 ALTER TABLE `lnkprovidercontracttoservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkprovidercontracttoservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkservertovolume`
--

DROP TABLE IF EXISTS `lnkservertovolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkservertovolume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` int(11) DEFAULT '0',
  `server_id` int(11) DEFAULT '0',
  `size_used` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  KEY `server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkservertovolume`
--

LOCK TABLES `lnkservertovolume` WRITE;
/*!40000 ALTER TABLE `lnkservertovolume` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkservertovolume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkslatoslt`
--

DROP TABLE IF EXISTS `lnkslatoslt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkslatoslt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sla_id` int(11) DEFAULT '0',
  `slt_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sla_id` (`sla_id`),
  KEY `slt_id` (`slt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkslatoslt`
--

LOCK TABLES `lnkslatoslt` WRITE;
/*!40000 ALTER TABLE `lnkslatoslt` DISABLE KEYS */;
INSERT INTO `lnkslatoslt` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `lnkslatoslt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnksoftwareinstancetosoftwarepatch`
--

DROP TABLE IF EXISTS `lnksoftwareinstancetosoftwarepatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnksoftwareinstancetosoftwarepatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `softwarepatch_id` int(11) DEFAULT '0',
  `softwareinstance_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `softwarepatch_id` (`softwarepatch_id`),
  KEY `softwareinstance_id` (`softwareinstance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnksoftwareinstancetosoftwarepatch`
--

LOCK TABLES `lnksoftwareinstancetosoftwarepatch` WRITE;
/*!40000 ALTER TABLE `lnksoftwareinstancetosoftwarepatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnksoftwareinstancetosoftwarepatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnksubnettovlan`
--

DROP TABLE IF EXISTS `lnksubnettovlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnksubnettovlan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet_id` int(11) DEFAULT '0',
  `vlan_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `subnet_id` (`subnet_id`),
  KEY `vlan_id` (`vlan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnksubnettovlan`
--

LOCK TABLES `lnksubnettovlan` WRITE;
/*!40000 ALTER TABLE `lnksubnettovlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnksubnettovlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lnkvirtualdevicetovolume`
--

DROP TABLE IF EXISTS `lnkvirtualdevicetovolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkvirtualdevicetovolume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` int(11) DEFAULT '0',
  `virtualdevice_id` int(11) DEFAULT '0',
  `size_used` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  KEY `virtualdevice_id` (`virtualdevice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lnkvirtualdevicetovolume`
--

LOCK TABLES `lnkvirtualdevicetovolume` WRITE;
/*!40000 ALTER TABLE `lnkvirtualdevicetovolume` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnkvirtualdevicetovolume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `org_id` int(11) DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Bordeaux','active',3,'','','',''),(2,'Grenoble','active',3,'24, rue Lamartine','38320','Eybens','France'),(3,'Paris','active',3,'5, rue du Sentier','75002','Paris','France');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logicalinterface`
--

DROP TABLE IF EXISTS `logicalinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logicalinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualmachine_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `virtualmachine_id` (`virtualmachine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logicalinterface`
--

LOCK TABLES `logicalinterface` WRITE;
/*!40000 ALTER TABLE `logicalinterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `logicalinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logicalvolume`
--

DROP TABLE IF EXISTS `logicalvolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logicalvolume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `lun_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `raid_level` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `storagesystem_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storagesystem_id` (`storagesystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logicalvolume`
--

LOCK TABLES `logicalvolume` WRITE;
/*!40000 ALTER TABLE `logicalvolume` DISABLE KEYS */;
/*!40000 ALTER TABLE `logicalvolume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `middleware`
--

DROP TABLE IF EXISTS `middleware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `middleware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `middleware`
--

LOCK TABLES `middleware` WRITE;
/*!40000 ALTER TABLE `middleware` DISABLE KEYS */;
/*!40000 ALTER TABLE `middleware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `middlewareinstance`
--

DROP TABLE IF EXISTS `middlewareinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `middlewareinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `middleware_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `middleware_id` (`middleware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `middlewareinstance`
--

LOCK TABLES `middlewareinstance` WRITE;
/*!40000 ALTER TABLE `middlewareinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `middlewareinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobilephone`
--

DROP TABLE IF EXISTS `mobilephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobilephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hw_pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobilephone`
--

LOCK TABLES `mobilephone` WRITE;
/*!40000 ALTER TABLE `mobilephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobilephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT '0',
  `type` enum('DiskArray','Enclosure','IPPhone','MobilePhone','NAS','NetworkDevice','PC','PDU','Peripheral','Phone','PowerSource','Printer','Rack','SANSwitch','Server','StorageSystem','Tablet','TapeLibrary') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (3,1,'NetworkDevice'),(4,2,'Server'),(5,2,'NetworkDevice');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasfilesystem`
--

DROP TABLE IF EXISTS `nasfilesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nasfilesystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `raid_level` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `nas_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `nas_id` (`nas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasfilesystem`
--

LOCK TABLES `nasfilesystem` WRITE;
/*!40000 ALTER TABLE `nasfilesystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `nasfilesystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkdevice`
--

DROP TABLE IF EXISTS `networkdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkdevicetype_id` int(11) DEFAULT '0',
  `iosversion_id` int(11) DEFAULT '0',
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `networkdevicetype_id` (`networkdevicetype_id`),
  KEY `iosversion_id` (`iosversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkdevice`
--

LOCK TABLES `networkdevice` WRITE;
/*!40000 ALTER TABLE `networkdevice` DISABLE KEYS */;
INSERT INTO `networkdevice` VALUES (5,10,0,''),(6,11,0,'');
/*!40000 ALTER TABLE `networkdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkdevicetype`
--

DROP TABLE IF EXISTS `networkdevicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkdevicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkdevicetype`
--

LOCK TABLES `networkdevicetype` WRITE;
/*!40000 ALTER TABLE `networkdevicetype` DISABLE KEYS */;
INSERT INTO `networkdevicetype` VALUES (10),(11);
/*!40000 ALTER TABLE `networkdevicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkinterface`
--

DROP TABLE IF EXISTS `networkinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NetworkInterface',
  PRIMARY KEY (`id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkinterface`
--

LOCK TABLES `networkinterface` WRITE;
/*!40000 ALTER TABLE `networkinterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT 'active',
  `parent_id` int(11) DEFAULT '0',
  `parent_id_left` int(11) DEFAULT '0',
  `parent_id_right` int(11) DEFAULT '0',
  `deliverymodel_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_id_left` (`parent_id_left`),
  KEY `parent_id_right` (`parent_id_right`),
  KEY `deliverymodel_id` (`deliverymodel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'My Company/Department','SOMECODE','active',0,1,2,0),(2,'IT Department','IT','active',0,3,4,0),(3,'Demo','','active',0,5,6,1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osfamily`
--

DROP TABLE IF EXISTS `osfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osfamily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osfamily`
--

LOCK TABLES `osfamily` WRITE;
/*!40000 ALTER TABLE `osfamily` DISABLE KEYS */;
INSERT INTO `osfamily` VALUES (6),(7);
/*!40000 ALTER TABLE `osfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oslicence`
--

DROP TABLE IF EXISTS `oslicence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oslicence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osversion_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `osversion_id` (`osversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oslicence`
--

LOCK TABLES `oslicence` WRITE;
/*!40000 ALTER TABLE `oslicence` DISABLE KEYS */;
/*!40000 ALTER TABLE `oslicence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospatch`
--

DROP TABLE IF EXISTS `ospatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osversion_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `osversion_id` (`osversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospatch`
--

LOCK TABLES `ospatch` WRITE;
/*!40000 ALTER TABLE `ospatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osversion`
--

DROP TABLE IF EXISTS `osversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osversion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osfamily_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `osfamily_id` (`osfamily_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osversion`
--

LOCK TABLES `osversion` WRITE;
/*!40000 ALTER TABLE `osversion` DISABLE KEYS */;
INSERT INTO `osversion` VALUES (8,6),(9,7);
/*!40000 ALTER TABLE `osversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `othersoftware`
--

DROP TABLE IF EXISTS `othersoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `othersoftware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `othersoftware`
--

LOCK TABLES `othersoftware` WRITE;
/*!40000 ALTER TABLE `othersoftware` DISABLE KEYS */;
/*!40000 ALTER TABLE `othersoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch`
--

DROP TABLE IF EXISTS `patch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Patch',
  PRIMARY KEY (`id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch`
--

LOCK TABLES `patch` WRITE;
/*!40000 ALTER TABLE `patch` DISABLE KEYS */;
/*!40000 ALTER TABLE `patch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osfamily_id` int(11) DEFAULT '0',
  `osversion_id` int(11) DEFAULT '0',
  `cpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` enum('desktop','laptop') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `osfamily_id` (`osfamily_id`),
  KEY `osversion_id` (`osversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcsoftware`
--

DROP TABLE IF EXISTS `pcsoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcsoftware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcsoftware`
--

LOCK TABLES `pcsoftware` WRITE;
/*!40000 ALTER TABLE `pcsoftware` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcsoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdu`
--

DROP TABLE IF EXISTS `pdu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_id` int(11) DEFAULT '0',
  `powerstart_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rack_id` (`rack_id`),
  KEY `powerstart_id` (`powerstart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdu`
--

LOCK TABLES `pdu` WRITE;
/*!40000 ALTER TABLE `pdu` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peripheral`
--

DROP TABLE IF EXISTS `peripheral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peripheral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peripheral`
--

LOCK TABLES `peripheral` WRITE;
/*!40000 ALTER TABLE `peripheral` DISABLE KEYS */;
/*!40000 ALTER TABLE `peripheral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_data` longblob,
  `picture_mimetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `manager_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'','','','My first name','','',0,0),(2,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0`\0\0\0�\0\0\0�\�l�\0\0 \0IDATx^ܽw�W�\���U\�9��䤙�F��%[\�9`�ƀ�۰x��\�,�g�`�&\�\�,��8[�,\�\�Y�\�9w\�����\��F2f\��\�\�#߮:7�t\�=7�\��\�V�u�+v;�S�\�Y�b\�\n***�\�b���r\�\�!�\�\�\\\����e˖Q^^�\�\�fdd�m۶1<<�\�\�y!\�\r~���ы��)}��\�u.�S��/���]\��\Z�\�Z�J)))����]�v\�\�ގ��\�\��o�l6K__###8�N����\�D�QF\�G�lf\�+G\�\���\'�\�\�\�O\�U\�	\�a��\�]d/��޵��\�J\�˖�Z�J�x<����c\�&&&\�*\��:�R�F\�\�\�ebb�\�\�R���I�R����y��\�\�}ݭ/w�\�U։\�of�\�\�Gi\�\�r\�\�_p��kV�\\���\�Ν;inn&�\�\�U\��Ր\�fe``\0�\�C]]�D\\��LĂ\r\�U;&FF\�*g6����-�\�\�߹虽���*֬[�N\�4�\�۷\�\�Յ�r�\"���D\"���\0��\�\�\�H<gpx�\�i�{N��t[Kg|�2\�q8�im�M՞q�\\�\�3ϔ�\\r��\����_uu��\�KeII��\�\��\��_\Zo޶l��\"\�\�\���\�d�=�59���ٻw/���se��\�(�f������w\�\�P\�\�Ζ]�#ms\�o����5�w|����x\�e����#G��c��\�\�a\�ƍlذ�\�N2�$�͞r�6�\r�ߏ\�\�DUU2�����*���-3)�dxx���z�~?��\�L&�]�x\��C�\�\�\�\�_o��.\�8�Ͷ�_r{=�V�Z%\�\�\�ٻg\�Tj��\0\�\�vB�^����\"\�\�\�\�4-�����e˖Q__�\�ᠬ��\�\�J\�\�0�@\0�\�\����f\�l6\\.v�\0]\�B�x�b\�;\�<.\\Huu5N��\�\�jjjj���\"� �`rr�m�\r��d2.\\H<W��zb\�\��x|r\�\\y\�\�ַ�����~��\\]__�\�\�b\�֭Dc���\� �\��\�B�\�d�B�[�!��\�udd�`0��(�|>�~?B��L���6�N\'MMMTUU�i\ZB�\�$}}}�R),X@:�����\�\�j�/_NWW\�\�\�H)q�\�TVV��*�����}}}\�\�\�HOo��ol\�_y�\�~\��_�+����cCgv�}����lي\�>|��c\�se�RJ\�\�4\�t�x<N__---\�\�q�~?���\�k�\n�hii!\Z�\�r�p:�$	:::�z�466RRR�\�\�EJ��`0H(�����^z���6zzzhiia߾}088HOO\�\�݌��\�\�Ꙑ\�fI$\�\�\�`�\�\�\�\�+\�\�\��ε�~�\�=����}\�\Z0����,i\\\�\�\�\�\�se9	d�Y�;F?\�p���!\�\�4�v\�bhh�\�\�a�\�$���,[�!B�\�\�(���\Z���h�F4\Z%�H\0��F��\�i\0FFFNԈ����SYQɱ�\���^�\�W�3�m���<\�ҵ�-����\�+�����s�l\���B�]nY]U%UU���\�\�\��\�+��R�~�\��_R�\�[.�\�\�I�I��{n���?_�㧥*�X�d1�x�}����Wb\�4ʊ�=n�~���Ǎ\�\�\�\�v�H�\�\�\�\�L����S�\�OH�\�8]NjkjioowLƣ���\�\'��9Ɠ6Aw��\�\�x*qq���P(\����S\�\�����=n�\�U�q\�B\�45\�\�qj\Z( %R�@\"�X\"\�D4\��c]\�;\�Akw?͝�d�YR�\�I]P���)���*v�Feq�\�@�㢢(��\�58\�D<�D ��\�~)C\�\�,\�l�U�\�:��TVTR[[\����#\�\��\�;6�\�\�8)|�쫴?oim,�����������f\�W���x\�\�gp�Yk�_S&ǢL�\�@\�H!d�c9&���V,!�2K[� �v�y�a�h\�pG7�>�\"B|n\'�� �\�XPUN}E	�\�%���| ���0\�S�\��0>c8>\�\��N�\�mfǡ6�v��%�544DWW���;v�fg�\�\��kO\�x\�7\�\�`\�I1\��ֽ~!\�\�^�\�\n�صk׬A6�\��\�\�\\\�ǯ��5\�(B`\r��xʔ`�`���� ���\�b\Z*J�������\0��\�\�1��\�t6˒�*�9g\r奔�.�\���L�\n�2�)+	(!�ҨS(�\�s�ظ~	�+/\�HG��\�\�G�\���mL)%-\�-\�\�\�\n�\�\�[��yg#�{r�\���~醝�?5���\�\�\�ࡃ�S3\�\�i\�\Z��K�\�ƫ.��(�V\� �L3M�(\�d2(�P���\0B��\�#\�l\\\�\�/:�]-\��ƍ\�\�=g��������ݞS,��@�e\Z�\� F*�\�\�\�\�p\�)	X����_rEA?\�:�N���R)\�\�0��\�\�^w\�`\��;?�\��\�xyVvRHfR�LdS�.Z�����~��(��f	w~����MU��ǥ\��\�x�T2]\�a�\�z.e>�Y\�\�!���\�X�����J�^�lX��(n\�ET!�6\�\�m.-$R�83m`X\�S8]v#�\"�\�mlX����*^ڶ�\�\�T�\�d�7o\�\�\�\�\�\Z�D^y�y��fH�\�w~���с�@0�\�\�9n����M��֏���*/y\�\�=+I\�\�y\�6\r�4�\r\"3KZ�<\�[h�˅\�\�D\�T�>g�� 9\���=;nz.\�\��L� ��\�%W���\�\0�066F2�\�\��j�\�����X\�	`N<�\�\�Պ���\�\�l6��_4������X��L\�n4ֲ��h=\�������TJih�I\0+-�)	\�\�k\�Ϧ��iǥ�\�\�ȋ�, �\�LIHI6�%�J=�yE\\~\�\Z.?k͔c�������1��E����x�Ȏz\�\r�\�\�|��Kh�-L�\na\�4+Y=K*�F/0-S|�i\�\�f\n����\0�\�k�\0\�ԙx�\0�U�, b��$��T\�\�\�3YHp;,��\�a�\�\����\0\�E����\0NȀ\��_�^�g���ZQQĔ�|��/�\�\�W��L�)%���\�T�T´�R\0:�� e�!R\�)ړ3u\�|j��H��A\na9S)�֢�\�y�9�9�\�0E0~J	�X��e�L&X�\�\�\'\���\�\�\�\�l�\�\�l\�\��	\��x\�\�`VϮu�\�N�\�a.�U!8c\�\"�K�r�1�c�t%I��$\�#CKL<!D.���|F\���\�\�x.\r&\�Y\�P�n��	�Z�\��4M����a\�Q�����\�\�t\�\��381Z�\�[n�5,qB�x`[xhr�>�\�\"��=.\�\\ل\�i\�ߧv\n��˱����#O�\�R\\�Sҳ\�\�i�/H\���&=\�&��\��\�\�dA��)D��j\03�ۍb~s_G\�NȀ�\��\n]f�\�\�Ť\�\�)�?�s\�\�\�\�AA\�\�N\"HD��\�r�?�J\�,\�0+~AS\�ZA޿\�0��$�ΐN�s�-F)�¢�j�C:�F\�4��_o\�\�8��2�\�p7��\Z�x<�R�)h����84k^�K\�$ \n\�`P�}/�\��\�/\n��9N�\�8\'��\�0�\�u����j2L�����\�!�ɐN�QTE\�\�\�V3��2�{lp�\�\�\�f�\�X�=��\��7�d�T2�\�\�K�yN�\np�B�B|5�mʏ��\\o�P\�4\�22�%\�\�	�LKXm6�\�\�\�Q>��2�wl�\�\�t�(\n�D�T��\�҆�I\��5$,�L#�\�\�)O=C\��Ɣ>Q�\�Y�Y0JtaS��\��󒮘y\�T�t&k�E���ʲb��%���b\�l�?\�r�}\'`�S��Sg2�\nz<TUelllJ����Ӵ�耮\�$b	�y�\\`I�9\�z���0�\��91�\�՘B�\�g�V)o�)yM\�GJbQ3� ��<Ι\Z�\�:RJE\�4E�?41vj\�\�\�|�Ӊ�\�\�@z]\�fLߊ\�#\��ǩd�L\�PAݘ\��D�\�w\�xÔ�l�\��OO}n圊�N\�\�)���(d\�L�\�l���C��\�mgV��w�	�b�\�\�4\�r�\0(\�4Ր~�a�\�}Qs�%߼|3<\�d��i���D8�\r?��\�`��<�����\�\�ʀ��^��\�p8�X!\�v�u�K$�F��:A:�!\�0��\�<\��d��\��q�V�D,e�ó�Oc�\r��\�\�;>|j&�y��\n��A4\Z��cj��o�aC�0͌�$\�)�z\���zL\���\��>if>�=�v|x\��t*C&�1~̢\0��\�v�\�\�Yk��xx��C}A��c��$\�)\�޴�58\Z�\0\�\�)��\�\0 ����H\��[�L�ʐ\�J��\'��/\�Q�\�OgJڨЬ[XeR@�F;�\�\�(�&Ka\�)�x�	B�Ig�fH���~����x<|>s)T��	RU7��2��\�\�Ayq3m�}F\n(`s�\�\"�\�i���B\"溬�A3�\�0_ֿ\�z�cg!��t�a\�\�\�e՗w7�i�ҬI�\�˷\�)�L��\�\Z8BB6c7�)6��@ ��(d2g�,&h\�5\�5:;�{�D<�\�\�0\�9\����T>L�\�ۜvTU�1C���\��/$�@A����&Dn\�BR\�D�\\��fK\�\r�e%:\�ѤV�I�\�t�Le\�:�\��{)+\n����UT�Ӟ�\��\r˨.-��/�Q�\�tb�\�i\"�t\�0\�XZ\�p�/;_�F�e\0\�\�\�9(�\�\�k.ba}��7�6!PU�\�\��\�-]}��������G�f\��Q��$\�\�\�q#�\�`�\"���\�\�\�\�9w\��.y6\�\�x`�k���T�w\�\�g^aok\�\�\�>>\�4�\�.\�C�ͺ\��	��\�\\��Ϋ\�֏\\ŗhܘ\'D\"�\"�p��f\�gf\">�\�Y\�XZݬK�=�L�e2�\�|\�e�k�\�\�g\�l,0%��`3w=�,;�\�y�#T����\�;l\�\�>\�\�3\��㯿\�7o���\�\�`V�g\�\�j/�뼸c?_��Az�N|�\�\�r�81m��y0K2���\�]\�jn\�\�+\�\�֏]�c4°�W_p\ZO���\�\�\���l&\�\�\�$^���ܦ5��\�xyF��2\�cw#fS�\�\�\�c\�ctuu�\��˨(ϰ(�C��\�\'�\�//�H$񺜬h������׍\"��H�_\�\�\'�%��N�K\�[����\���\r6�-\�{3O�ok\����!y�M�#a�\�VR\Z�\���(\rx\\ t�\�\�MQ\n\r`I\"�\�PG7[���o���\�|�]��\\\�e� \��\��ڮC\�	\�\�\�s��t��`�\�)1\0���v���ֳ[[Zs��\�/\�=\�m@UrSz�x�o\��\0}c\'�-�geC5�+�-\�W@�\�g{�(*Y]G1}j�K{\�\��2|.;��\�\�B�)x{j銢 \�\\L�\����\�\�]\\}\�FTUə�U�\�\��\r\��\�\�\�\�q���I�R=�\�\�PR}\\<!|.w��rʱ�O�\�RB�2^޶��f\�\�7\\IY(�]S)3�%�քn\�\�n�I)HI)Ig28�\Zw���o�(\�\�i\\2�\�̟KC~iŜ#�$\��Ӗ\�\�zYPŚ\��\��\�\�d2i�z{H�\�\����\�w\'\�	���l�ȝn/+rκ%�I\�\��n慃\\�v	5%E\�m\Zû\���\�\��n\n\�\��iZ�B\�\n�\�X����\�	b!�\�&��\�[�\�2\�\���b&>HEP	�\nŜ3\�`~��	\"�J\�\�?�ԥ~V\�\�\�\�\'d�hl�ȩ\�˛��̋�E_EU�Zd\�D�7s��K�\�<�s �\�l8\�v0���s\�d��ʧv;6k�\"\�9G�Q���6\�\���\�x\�v;\r<�yX\�\�f��\�\"3���35���go���\��\�ެ�U\"\�P\�k�k�A!\�\�uKA!˅90�=Nrc\�(\�(�TJ�iV�\�@�׃�\�wwZ�j\�X>#m��n�\�u;�\�Q\�±Z)�8NZ\�\�)�\n\�v;q{\\y��n�\�qx���\�kk��WK�Y]\�\�tǾ�\�rѼ)�ʟ\�l\��\�L6��]���\�DF�:�P�\�\�M�@��ƑH��mݤ\n����@\��=C�L\�\�R��*5%ET�a\�\�\\f\0R`�kx=\�\\�V�8��V\�rz\Z@Q�\��0��\�drD��II{�c\�8R\Z\�6ʋ��\�.@\�\�H!�|8�\�V�LM�i\Z�\r���\�=�\�/��� U\�?t\�M_}�ƻ���|����/\���\����l���$&\�c1)�`am��\�)\�K��\�NMmm�]d�z�m;��cp�C�,觤��(d3Y:�x�@�\�YV_�\�<d�<.\'v͆@Ar�\0���\�\���.��\�FԊ\��K$\�\�\�\�\�\�>|n\'\�\�\0�j[\�d3\�3f\��\�\�++\�\�p�\�4���9+�	N���\�\�\�D�x2�\0�Dz�憪2G\��=]-��\�/�\�P�9W\��\�\�o\�|\��\�~+�\�mlbҵ��S\�d�\\�qיn�9Y\�\ZD}~/>��L&K2�DG2M�\�f\�꒬i]\'�L�Hg�WV\�i�\Z�\�\�\�։�K����\�\�()\nc�\�6\�JA^B�t\�\��mv��Q��dM�\�v���\�\���P\��\�\�񺜸v2\�,�\�\�\�2F�Q�j\�\�tPPW_II���R�Q9{\n��`\�r��\�[4֔��>\�\��\�z�ίz�\rwU���gtph�\�\�\\��\�\\q�:@	���\�\�\�\�\�\�k;���\��n�A�\�W�Hq�\�C_\� Ͽ���\�=<�\�Z��q9\��\�NPR�|�\�\��\�\�R]\�pg��\�Y����P�ݑ3a�\n\�\��ci�$S?���\�a����\�\�����c\�\\�v)\�L�{�\�Ğ\�\�BK�\���l��5\\�v)�lXA\�祶����\�Z��b\�W\Z	�\�w�\�o}��N[ɺ\��\Zk+X�p^䭽��\0wA������\��܆%@|^��l6͘�N�ڨV���~�3Yu�s\���ӛ��L&i�WIcm\�a֮X\�]��\�y\��y|\�.�\�\�;6�\�Wi\�\�\�r���P�\n\�Q\�1\��D~���\�C,#��\�\'����\�I��\�Gxq\�P���P\�ǻ���_\��k\Z\�gg\�1\�x\�6\�o\�F0\��̝,\Z\r\r<\�\�\r��\�ZS@y$\���\�\�z\���⣍`2\�G�\�\�X|�dQ]%���\�Z���E\0�%!�\�,\�\�	|Q\��B\�\�d4�\�\�~�xe+��/�\\���>�T���8��@Q\�\��\�p\Z+V�`�\�F\�:�B~�\�\�\�\�\�\�9���d^5V�\�ؐ`\Z\�)Җ\��\�\���F_�Pp\�m|�\�x䕭\���\�4.^Bui�Ӂ�(\�m6��X\�y\�\�ikW\�PYʇn��\'\�:ȿ��\�\�%�.�O\��n9B(H	G{�QU��\��ܴ���{,�_�\�\�h|v\�\��4A��Z�\�NGӢ�j�P��_=LW\� \����4Bp�XW�ޜ\�v:���\������߽�v��\�\�<��yZ�\�\���=|\�obbb�\�˗��e��\�?�\��~K}E)����\�\'͘����H�E�鄷�[)c�dxM�\�\"�~sxy߹\�{L\r��;�$(�\�i�\�w<�\�\�tv\�n��\�o|��|�#|�\�\�\�_�	\�9g-ߺ\�3aɔ��\�\�ǈ<��k4�u32ełZ�-��\�\�\�\�l��\�-�\Z�ʡ�\�{\\�\�\�J�v�q���Ͼ\�\"��\�\���\�:#\�ħ/FKi.��ң\�:\�\�\�\�z\�]�>��\r\�v{@�b�%�Hp���\�A-]JUu�\�z+\�}\��\�O~CkW/B��\�[�4A>tq|\�{J�Wh\�4�\�\�\�\�Ϟx�o|\�?x\�{\�˒\�\�	E@\n�����\"��l\�*\\.7˖-\��\��\�\�e瑣�\�B\�\"__A+�G\'��\����s_��\�BV\�Uq�_^eAu9�[�؝u�#�^\�\��O�c��\�\�iu�%��u��a�^J�Z\�{H&\��34f펖V�F\����s\��O���3\����\�\�隣��Ukׁb\�a���y�\�\�\���hk;JOo/��v�^&�J�\�&�sJ\'\��z�F\Zi\�|	�#\�\�v����14d�sX�v=g�{��]�,Bz=^\�}\�5!طo_�\��	���\'�\'�a��p&m<�4w��H�I�3x�N|�U\�u��̫(\�EY�ڡ�eO\�a�\�\�X\��uU�$I\�]��tV\�\�7wq�k	�<�\r�12�\�<\�\�ɘ\�a烗�\��~�W��W^v)�?�$\�\�}\\z\�UD�K��h��\�\�{������\\��\�\�\��8���u�����0G:z��uX	�\�yM��RZ<\�A\"�\�wO�D2�\�c�\�o\��1kV�\�\�og�ig�z\��^��ς�&>���/\\\�\�>�>��kY\��ߟ�0\r%\�\�X�VM�\�֮~R\���]J2�a����Y8����\�8�\Z뉥e[�\�j/\����\�\"l�\�/8���I^\�u\0�\��5\�\�\�C-t�\Z�w;Ch��@U\�\���g?\��[w�\�\�~��\�d\�U\�u��X���	R\�\�?��b��\�|�\���va6M����Ґy�ʒxˠ��a)\�\�\�Y��\�Kt�U�u\\~�*ͫ\�]W��}\�x�I}\�>w\0!u\�\���6~w�عsk\���\�.\����h�B*�!�H\�V\��0���\�ȱnt]�����\�J�7�s\�Y\��҇j�\�4\�TO%�\�L:�u��3ٌAu9ٴa�n\��Y����\�E\�\�\��\0\0 \0IDAT��g�c\��LS����\�uIt\"A$\�\�\�o\�\�U�\�\�\���#G	E<�b��\�K�.�z��9\�6,^@\�\�[\�\�Ls�g\"�\\B\�#���ʅk�\�Ք�\�K\�\�\�706\�pW{[\��L\�=8\��fjK#\�x\�\r,�� \�� K�$�\�6�\rE1\�F���x2\�\�\�~l�JEQ��\��\�CO���\�42\�yp��\�\�\�v����H\�\�H�������He\�CZ;͘�e\Z��� %\�h�t҈�(�BYQ���0�[�ɀ\�I\�`t^\�\�3cz��\"\�>ɟ�/��B�\�v\�us��V/#y�´av$�x�T\"�\�m_54\�8O6<>I�����\�f)/)\�\�5KQTcK���\0�\�sy\�})�MEQ�\�\���������m\��l�\����XR��<�t]\'7�ZS|2��F\�K<c\��\�w\�\�/�zF3�O\��\��\�\��d\�3+\��M\�38B4�����\�d�]|&>��T��.R�T��c.������d*�\�a3!\�pW�52����\�Hf\�\r6eIZ� �э�\��m��T��\�ވ<�(�\�\�[��lS~\�\�z�𥱆���r�s픒�\�q:��X1��c}\�t�\�81y6�\�o\�\�\�%���V�j��\�\�=�3/nك\�\�0��M�O���,cI]5�\�Q�v\�*f\�VEA\�4,��J�\�*#�/r�sԕ�N��\�~�w\n_\�\�1��\��F�t�2�����\�I:�\�\���\��Nrϣ\�g<\�\��\�\�6\�-ύ��p�C�\�\��;|���Q�.���x�F\'&YZW��W\�\�?�F��*P\�U���\�!7Q�LJc0\�q\�\�0\�g\�\���du\��̬\�ֿyξc�\"��9\�\\�-ֽ�\�~\0*\"!ҙ,vMCSU�\�\�~\�\�:rl\�\�p?�zޢ\�\n�_v��%\����-�\'��S8�lN�����/\�\�]\�#\��\�@A����v\� �\�-�\�q͔��[I~L\�\�߉�\�$���\�\�9\��7\�$Ppy\\V\�\\�\�\�sUQxn\�n\�̯����Ӊ?\�\�\����\�\�N:ǳ�>�ڇ\��\\*7��Y���;�\�o)���\��C^<7Kj9}Q=\�n݅\"����\�Qセ)\� �\�f3\�\�����U�4/y�_�\�\���i��\'\�\�/���v�\�\��o ����Gi\�\�CJ�\"$�[N$\�\�w�F�_<L��X�\�\��k���\n\�я\�|��<�A,�:�\�\�Okw�b�\�4��\�h�\�\�x�ξ!\�\"99�	�\�nC(\�;�\�}�`�\'s���\�+�0姈 O����.Q�\�\�u\��%q���\�W~�v>\�\�XZ{\�����-��\n��>����\�{��\r\���S\�`_g7~c\'>��\�0�#\�t� 8~#U\�mb5\�w&LV��d�-�d�l��w_\n\�\�\Z�\�Z�\�k�\�;a\�4jʋy�`\�\�\�GJH�ٴ�G_\�2�[V5��\�����\�k�\�t\�\�O\�o��m`bT{u�ޅ5�\�u���\�\��KΠ���?>��5��j1�jS2�^��3�э��f3��agE>9%\�l� ����S�6\�\�\�\� >�ω\�\�0c�\�Ѯ~~��\'�\���\�\�/\�\�3V2:>ɍ_�3342�=\��}\�#;�(�+\�?|\��X\�\�ǥ���7�fvj�4����K\�X\r�\�\�vk�9G�B\�ٝ6@��\�\�P�L\�����&XH�\����,|&\n\�\��P��gZ{�u\�\�3HcM�6R\Z	�H���\�\�{�G�-�h�����쌛͏����yOg}��]}C�?sۯ��S��\�d)-\n������\�\�Ʌ4\�CNm�fSQ\�C\Z�Ŭ�\�峞\�q�!o\r�&\r�\n\�\�\Z\�����Y�0�M�\�\�|c\\�d�\�\�v\rUSs��LZg��VG\�ٸ�	MSym�>������ͫ\�5�\�W��\�w~�\�0�\��ݸz\�\�=\�\�\�\�\�U�\��7V��4\�\�;�ݼ�F\�� ЅqNxt`�D<�\�U5E����\�$�#��E)	����\\RJI4��khM\�*Kq\�\�\�Z&�v�0=�\�y�\�X\�bn�뀇D20<\����*ۺ���^L\�\�O��V)v\�/����\�;�Nxg\�\�7~�wӑ=�#�\�\�ў>\��[w\'��\�B\0᠏K6\Zw	\nhj&2\��d�<�MA>�P�7�\�\�\�7O�\�\�[vQ���3�d\"\Zeb\"\�x��\�\�尳���L\�:� ,��Y8VSE\�\�\�\�\Z�EfN���i\�A\��\�SH)ٶ�%v�k\�P\�z�,�m\��e�o?vh\�V\�?\�Ͻ\���ݯ�\�T��Ɔ�i躭���\�\��:�Ew�ILH\�\�$�C�Ȭy����N�*ϴW��\�f��q\�hU�\�4#�\'m\��Y\�XO\�\�\�e\�\�]O9�����\�ok���<����%�\�\r�	=9�Jg�\�W\�\�\�m\�^PZ���\�\�m\��\�\�\��\����{�p\"8)X�\�ݡ\�p׿?001zM�\�\�g_�\�\�Lrj\\��T2\�\���t6/��	�IY\"P��N4g2E׍\�.��ם?� $s\�;>Iț\'EU��9myvJؼ�0\����D,󧋗l�\�[�zJ�9\�V~�\�T�����5���A������\�1\�U���\�hM\�\�T����\�4RN\r\�N��@�%HE|7e�0e\�E�D\"�>�\�\�°�Y\����Ԓ\\�d�\�4՘d4)�\��\�K[\Z�H�\�\�߷\�YwA\�\'̀--{�\��n�z�\�uk\�Q)\��-{\�}�(X;\n\�XQ�C�����5]���� �\�现��7\"�h��j\�\�kr\�R4+rd\Z���Gc	B�\�\�b\�\�YiE�\�>��*f�`\�\�c<�\�&TE{\��}\�O\�\��S�ɜ�d�\�7~C;\�slu,�X]QQA0d^]\�c���s��\"��\�\�0��6�\'Q!.\'�;��)�\�(T7M\rH7�	aR檗V)Rm��c�\�o+`�jSrs�\��\��\�^��op����/���\�OY�\�$p�\�\'\�\�L�Z	\�\�\�ZE������2yq/l\�c��>H�9l��\�%f�D�Tǡ��\�b�\�k!srj`\��<\�Lr�3p\�S(\�v�\��\�5�a�fzUFa���w?�\�q�vK�9oI�\rN\��\�\�D,\�;6�8(\�P�4?�SJ?��1Ϋ��$�\�%�<B\���ѳ:\�h�\��\�|w�3�[��\�c:02J\�\�(\r�v8\�\�Ʈ=+���ʹR7\�C\�t\�)	ͲDA~aUk\�)���g��ͮ{\r\�y����\��#�H��T\��\�k���\�;>\�ہ�b@���)�\�5���9�I$����\�u^zk/��\�s�ϛ�5χ�3B�B^t)�GX�%�:mA\�u#�+�\��G\'9\�хC\�p�[ԍ�ո2&�5N�\�P\r闀du�\�`�}\�G�\�m4ͫ&dԺn�wS\�����\�tN;���\�f��f˳\�,<���7\�Н6�u��g��\��l�-8)t���B8#\�r�L6˾}�\�\�6V\'�in�\�#,_P\�U\�G�*9wA\�\�@�Ģɜ4IAJ���I&I�G\'�g)qڴ^*�!�I\�u������CQ\"�Q�Tq\�m\���4�A�\�NӼj6�\�c�������\�*�!T%��fe��\�?\��c]l�\�YW�\�\�8����I1\�`\�\�E��Ӊ��cǎq\�ر)8\�t�o��!jʋY�����\0�\"�A��N:�A\�$O\"u�t6C\�\�(;6S\�\�\������;\'2Y�MC p9lD\�I\�&��\'p\��Y��4�d\ZUUp\�4R�$\�,��AϚ1$a\���\��:�=�!o��\�G��\�>�\�Dt�&\\�\�\��V�F�����?}���\�O�\��-���e||��;w�LN���d�\��V/j��p�lrB(\n.��t2��\�5@�\�4ʋ��R|n\'E>��ǅ\�\� �LR�i\nG:��O�\�b��1�S[!\��O%)���=D�>\�~�q��p\��ń|TMCU5\�\�mS\�c_ɏKB��#\��\��\�\�\�m�\�K\�o��h��\�����\�r0�$nUQ\�^���G��\�mRJ^ڶ�[�\�\�\�h\'��P4�@ćå�c�\�5;6\�\�ʦ��;����v[\'\��\�\��8���_C}E1!��E5\�\�+-\�鴡�\n%A?�\"\�T�L6\�\�\�$BUY�h\�\�\�k{�\�jS�=������\�&c|\�\'��\�\�;ǋ����}���\�\�?\�IN\�Ԁ�HE훭{?]QY<}\�\�<�̳d�YE\�\�\':\�{8r��ej)	�\'ʭN	cZos\�Ȧ�d3:\�\�H ���\�(�P5�c�(B�\�\�!\0MU\�TMU�\�65*?�K�\�4\�#cd$,��f~en�kre]. \0ESF|8\�\��\�y�ـ\����y�\�M�E\�\�\�\�\�\����~\�\�;s�=k\�\��`�\�I�R!���crr���)<�q�\�_^}��\�>~��O�nq�y\�β�\�\�>�1>2i̖�\�\�m6�J��y<8\�A|<�@bWU�\�95�4\�x:�!�5\\܌�\��z8ce->�q\�T`�3\nH�*E\����=��V����an��\��\�\�]����\�g7��\�C[���\��ہ95`\��\�%[Z�\�PW_hhh`ǎ���s�\�\�\�\�|\�O\0���\��x\\N�ί�q\�R(�.\�$3~n!p:lT�D�{\�8�����4\�B\�r:��C�FB\�U�Q]V�\�faM\�,�n0L\0n�ȃ6\�\��|��������y\�孱_處��\���\��95�R�\�w\r\r\r�|>\Z\Z\Zr͜\rZ:z�\���+\�\�\�\�n��\�\�Hn�\�\����\Zщ(٬\�q��P�}>B~�#�4w�246�MӰi\Z���H،)�\r\�\r\�\� @(\n��ߝ��a\�)�&�<�\�����Sm]��\"o\�G7l���\���\�<Y8%d�Y\�<�L<---TWWSZZJGǉ�\'�\�f��\�/����\�~�\n\�{\�\�)\�P�\\h6�\�\�	�,!���Ϥ\�i�8¡�.<\'���5����g#\�x�,�^	�EQ��=�\�\���\�X @\nZ�z�՟�\�=�<��ƒ��n߽��\�q\��G\�\��I3 �\�t:q�\\�\�i����\�\�\\��\�\�\�\�ƅ�\�\�l\�}�\��_�e\�>q\�\�\�W����$	!p�U015\\U�a�E\�-T��W-f݂Zto�(@S4r�!	B\�\�oi0Ssh��^.{�,w2\�\�M;�\���\�\�;Ԯ\nu˹Mk~0�\���$>�\���m\�\r\�p�d2IKK�=��q�׋\�\�\'�H\�bz\"�%Rl\�}���\�\�\�rRQ\�c\�>.�u�ہ���\��i\�\r�)��\�\�\�\���y	8\�&)�+&�\"&8\\�?v�\� ��M�T�m�����\��\��\�X|oMQ\�O�W7�\�3{6�v���\�\'i�8)li\�w�\�\�\n�\�8t\�\�\�\�\�\�ӓ�X��\�s~_҂��q^ܶ���ژW^BUY$o��\�iGUU2\�2kM)L�Ƙ8�\�\�B\"�\�\\�\��\�\�x|N|!�\�=\�\���\�Q�{������i\��\�r��|��}��x��\�\�?\�G8\�)�\�I\�ӥ&Xy[&\'\Z�N�\�\�T`\"\Z\�׶��\�tՅ|�}�1�����׉\�mgb4J\"f\\�m\�l	(H\�D�H�����ٌ�\�Ჶ\�oF\'xj\�v��ˇ�c\��\�N�\�3\ZW��\�Ug�\�3:�\�o��\�\�8\�\�\005\�dB*���-�wb�w>�[�\�֏\\ťg�\�i�!�0�$NO�ɱ(�D\�bZ\�aD��p{\�x�n4�\r\�vh\�_���_\�A2�9\\,���\�\�?=�\�\�\�W�u�&�\�\�`���\�T*u\�8\�\�\n�.ټ\��\�ϸ�\�|\�\�k�WQ�\�aa\�\��)�	2�4�\�:B��`�i8=vc㬹~�KI\�\�(��\r\�z\������\�\�\�V\�6}���b\�[��o37ǃ90���\�\���i\�b12\'i\�\��LD���_\�7wr\�\�gs\�\�\�ظ�	M\�\n�\�N�n�qs<E&�1&tN\r�ÎP���\�\�?̦�\���7����)�K\�\�\�ڶ\���m�\�h\�\�\�d@sGX\�N�Ә\�g2���p9휶|!\���\���\�#/l\�C��\�Ǯ>���b�MR�MA�9M73\��K �\����|﷏p����h��\�]\�-����\�D|A�]��\�0RQD��90\�\ZD\�\�\�\�-�g�=7}M�\�\�{K�\�\�N;\�]QQAWW�6m\�-��\����\�\�?Ej,ʟ^\�\�\�\�v����]\�|ͅ\\u\�\�הS���4�!��qw��m3?��1Z:z)xYX]\��/:�O\��.�\0ۚ\�\�h��:Cn�`i |\�\��\�\�߹��\�\�\��\�\�\\�\�j�ͻ\�A�o\�h2j7���w��{Vϒ\�dh��\�&�Yt��������?�\�q\�{�e\�.�\����_2�Ɠ\�o\�\�ͽ�9\�=�\�i缕��d\�R��+hl��&�o�@\�Hl��\����5\�\�����>�\�3���7�=qp�N\'d��\�G\�O+�(׬�^\�:`s��;\\L��vq���!\�m\"�\�f\"s>�Ě�J$�?�\n\�1\Z6ր��Ƈ.�\�W��`+��a˞ü�־\�����\n�����\Z\�S	\�q:�6\�b\��\�r�e���)�����\'�Ѫ���|\�g�\��D�5\�\�\�\�\�ᮎ\��hl�\�Oo���\�\�W�|���<�օge�ß�\�������\�\�\�#��%�音��\���x\�\�4.=��\�*��wh\�\�\�Ӗs\��\��3�>m�`\�\�j+Jp8lT��\��\�Q4M\��K�l�2\���h\�\�g2�Ċ\�W��YTS�\�n\�\�Q�B\�\�%\n�i\�\��\�	y=8�<�͔\�u:��\Z�d\�\�yt��{\�\�@��\�,^y\�%\�\�\�����S�sv=x�[m4M\��x[˓3f\�?~����~��;�������7o^���EQ8p\�\0���3\n��\�p\�\r�\�9����\�E*��\�۵�]�����H�@\�ԌH\�W�	\Z�8�D\ZU(��4U#�L��\�E]E	�\�XX]ASu9\�\� �� ��\�\�$R2vBh*�M\�\�5nF���AK$R\Z\�\�x���\�\�\�|�;x\Z]׉��\��\�\��\��.���s,_1���i\Z\�U��_�\�k\�ѱ\�h\"������ק��1�Gs\�\Z\�s\�\�\�w��@c\���\�zǆn�����^�\n�\�MOO۶m�1	��Y\�G?�}ʫ���LV\'�I��6\�z�?���m|��rѺh\�\�S��;����d�,��5>al\�J��L\�b\�YɔM�&(B�\�46(��+[(\��ڍ��\"��%\�����7�fseE!\�^��s\�/c\�6�\�G�#!\\\\�\�/�l\��\�8]>Sk��ny\��\�ב�\�\�K�m���^\��;Y�,=�$�N�M\�\�]\�}5\�T�\�h2����ܿr\�J|>ccc��曌��L\�\����Ч�\��\��J%\Z!�Hbw:G\"\�\��O>t\'��(����=w=�#7�3Z�z�`�\�,\�lnʒy\��D�\�dH�D)��	R\�L&���\�50B\���\�c���\�۩*	�����k�)+f,\�\�g_\�wO��\�)\�w\�̒\�\�b�\�\��\�\�9\�\�q��v����;�H�-��@\�w����s��\�)M\�\�T�\�7[�~KJ�D�Rs8���V)�jk\�\�\�d\�\�}��N�}]��g\\�¥�\�L��\��\�(c\�}�uѸ\�4���C���\'�)���	\�:\�\�\'����\�n�ݐy\�@#�vM[`-�X\��F1\n22K,���o�\�=��\�72\�\�\�8\��Cdt��\n|n\�a�\�\�p�EgR^\�\�t\�\�T�G\��\�S/�\��\���z�Z6^�A���P�������N�\�-\�\�\0���g���ֽ\�X*�\�?l~\�A\���,5�Ӿ7\��?9\Z��T\�fJ|>�SUz{{\�\��k\�g\�\�\�\0KV��\�\�)I\�\�ģQ��(;\�|�\�/\'�J\�\�ۋ\�S̻?�6��0\����\�\�e��\�s6�d^�y�\�:ʔ׌)�M\��T2C*�2���\�t���K�i\�baM%�j+Y\�TO\�\�#�Q��º�\�X���\'ٺ��_<��\�9L���3.��ƥg�ٜ&���|�RZ\�#R2�\�\"\�֞\�KO\�K\�\�5�Í�\"\�{?��>�eS\��\�\�6U�\�������exxx\�T!)\�\�k>�\�\�!%��s�\�[H��~�q,2\�4�Ҫ�T\�-����M۷��\�t�QV\�\�v!\�\�斫�g��V+�k/�\��\�\�\�\�\�\�\�\�}}�\�\�W?�^\�u�\Z\�65�����\�0E~.����\\\���Z��COrϓ/\�\�3LӪ8����n�f\�\�s#`|�����kq{=\�(�\�t\�OG\�~{U�t�|��\�l�\�|�]�P���{*�:]�2\�?�B�I\�h&�������\�-�~@N\�cc��\��V�C0\\�)k�<\�\�y6�\�X\�.vo}��c�Ȧ�mj\��\r+X����\�CU$���[s&ʀ��\��\���gu�.X��.:�M\�/a��\�ΤG�\�J�_DVf\�^\��ͭII-�1�4\ZȘ\�x;�\��\��`C��|��\�:�\\�\�\�\0��\�-�\Z�e�&%�\�\�fUw-]U�>\"\"3�E\�.\��+��eD\�\�\�ŋ\�ٿ��e�\0\0\n\�IDATB��\�\�\��?\�o�oo�\����4Z}���\�_��5VO�G�)�ˤ�x�\�\��\���o\�_[eum\re��\���9���ߣ\�\��\�\�l�9����~����\�\��\�[w\�[\�\�\�\�%7[�\��OϮm]�\�����\�\��A��j\�Y	Y���	�~P�\�\�.��\�P\��r\�\�_�v�\"����ݍ7�\�;���]�-7\�9\�\�r�\���\�6��\�p��Y��\�=�\���\r\�)�V��k�h\�\�\\�O�ܼ��_�\�&�|\��wr\�\�{��k<�◹�\�lm?O�\�vT:\'���U\�ݕ�\0�\�)I� \�3�VE8{\�i\0g��gv�#�ȁ�M��k?��/��/]Ɂ���ȳ�<˘N�x^��\�22q�/nj\� Ż��9O\\y�\�g_\�\��|�o�·�͇\�Ž�=n����\�7�iř�.�9\���\�\\\�\�0\�b�\r�8�%\�\�\�<4\�Y\�\�\�\'\�A�M�f��[/��&g��e~4\�\�ͷy��Yې�1Pb7oPh��}K�\�$�\�r�6�����\�y�\��\�\�����\�N\�T�?\Z\r=	\�r)(K\�\�kQM	m+��\'�u!-\Z�\�w�\�\�!�\�\�s�\�\���H\��?`\�L\'�\��\�}\�x\��\�ǿ��h�{�:�t{���r�n�3\�\�ԙ\'\�f!�\�!i\�\�Z#)e�S�\\�\�0}@nֵ�\��\��h��LǃK�	\�=��4J\�XJL��\�\�\��p4�F`�u1���V��\��_�����r�\�sL�|t\�\�l��L�,H��\"-\"P\��,�:<x�p\�./��W�Z-����O�N�4���n(�_id�\�Zk��Yb��\�Y\�|6�`X�i��`P^.Cq1z\�y\���h��ݵ\����vgO�\��\�\�4u|�\�\�`�+\��\�ܪ�DM�\�}5\�\"vh�:�\n\r�\��,KPJS:	U0\��X�Z@�\�E�\�EȝyU\�l:\"K<�ǯ��\�\�3\�=�R�E\Z\�\�\����\�Sh\�&	\�lB���8{M)�\�B\�u\�\�)eэd�/CdQf1UoeӖ\�̀-�\�\�\�z\�xNPo���SyN��J8P\�Ci]1�6�\�\�A\�s��ܾ\���t�\�\��ҫ\�f�ͽ�{�,Z\�\�\��\�m5��y���p\���<�\�\�0f���\���-�8��,-)��BPL\�Z��\�\�F��E[N�+�D��/G\�0H\�z\�\�\0�4�wY�f@�\�Y5�$\�\��\�~Z\�>GS3xs\�q��� \��:\n\�\�I)a�!\n�\�\�\�\�؇-87Q��\�*\�v�(�yĴ}3.0�\�\�FI\��\�ȴ\�\�-hw\�\�\�A�\0��Un������pm\�q+l<L�wr��PZ\�[\�YF�&\�{�!P�4\�-@PJ1>\�#�NH����\�+��>��Q�<G���@\nsT�\�\�3w�\�\�^��N���-s\���\�\�X\�\�j9KS<32ȧ�\�������g�Z�\�8�3\�1ү�\��j\��\0gK]�}\�g\�\�&\�v\�y4�=r\�p\�8����\�\�q4�pK;m	f�5��J��9|q�=�-P�$q�S�55�F�\�\�\�\�\r���j�x��Wsq%\�~�7O�?�	�z\��\"��\�\�<\�\�C����\��C$\�ɒ�t\�Z\�ge}\�h4�t{}�z�\�|�\�ƃQ�*F\��\�\���a�8��_�=I�8�\�M�\�>\�5L��y>Y�-��\�k�\�t{]\�0���R:\��\�8	�و�}��KO\�/̀�v?N�d\'\�\��p�C�E(�Q�9%+\�Sr1\�S�+\�k�\�m\�\�*\�A\�`~4�f�Rӏ˷\�p5~P\'I\�b���P\�d�O���;\�4\��I��N\�l��qi�\�d�p�\�\�.\�n�p0N�B19�\��F{ﯞx\�O;X�_��wxj\�\�CO\�tt�\�b>C)�7�\�\�	C��A\�\�v\�v#\�\�dB-\�f?���V\�=5x���`@\� ��\�LL�}�8b�\�\'��\�V/��ͧc�\�\�!�\"�81\�UB�\�\�\�\�x�6&��$I���l����ڡ�\0�����*��D�9(��}�W#��H\��<�+\�\��2��\�\�%a�\��&T͆�d*3\�\�\�b\�c�}\�	~қ��8M<�i�\�y\�l>����\�j51�T^��2��d|@�\�xZ�/o^\\j6>!�޼�+�7ػ\�|6F�ɻ!�_G�6\�(e$\�a\�\�\�bt����P\���}@\�ƀ*�`a���\�ĵ<\���\�4ΘI%\�֥hu{hOs4=$�(�͜3��\�>i\�I�\�z~뙥w\�\"lo\\��\�\�ݣ\�I4\��\�\�#Ib�<#Cj����xY^\��Nw�\�h��\��\�X�\�|}�4���q��G]�>�\�pH�/\"�qB�\�ܓJ�� \��x1��\�\�i�G��N+h~:&\�\�_M\�A8\�҄��n\"?�f�K/\�!\� L̄}!|\nz+L\�#e\�\�c�oJ\�\�\�	\�~$M�K��\�\�\�0�/� \�R�\�j4��\�]I�`|���\�Jy�W�\�K/\��D\0xf�\�{\0�\�2�r\�\�[]&�}jA`�ڵ\�Zfkuט���\�i\�2qx���a�,1k���?\��ny\�\�	>P�Q\�Ҍ��1�B�LI1���N�7\���lz�\�;\0wnM\�\n�\�Qov���ŲA6��\�\�X\�&#��^\�\�B�\�a}\"���@�Hn]WW6����V7\��E\�R!^y��M��\�\��s\��V�3`\�\�<M�8bl\�1\�\��t0Oׁ\��{7#߁\�j�2\�c��[\��!Ů	��7:\��22���mf�1\"��ˀ����,Km\�My\�\'�ؖ��)�,1�,E+�\�Ž$�9���>}�Sր\���G\�=���\�\Z�\�\ZG�����Q9a\�\�>�?�\�h3�\�|t�\�\�܎���R6�fg⪮�R\�\�M\�\�;`:pW�R����,Mɲ\�\�Wql�#1�`K\"\�Rrɬ�5�&1����VN\"�K@\�ѷ_�\0\0\0\0IEND�B`�','image/png','marie.png','Anna','','',0,0),(3,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0e\0\0\0�\0\0\0���\0\0 \0IDATx^��w�G���������3���\�\�,[�,Kr�����IƘl8��\�\�p\��p�3gc0>6\�F��dK���v�Mڼ;���gz�~Tw\�H�,s��}Mꮪ~\��<�B�\n��5W\\\�>3\��Lb\��\�\�p\�\"��\�\�$�T����<�t\Z�������]~	�y�\�&�\\�~\r5�at\'�ᛮ\�7�<�[.\��\�\�\��\�}\\v\�\Z��\�\"�4?�\����v�x\�6���%�;x��W���\�K*�\�\�O�\�v�\���\�>�;bqg\��O0<6��\�_�[w�\�\�ϲ\�\�Qb\�\���ۍ�	\�\�\�	W�fϾ\�$�i\�\�m\�ͻ��\��\�\�H&o�\\oT\�\�Э���\�\����&�o\�%g\�V[W\�_�x	�D���2\��Y`j*��.۸��]w5\�����\0}�\�4\�\���\�7�l~;c�Q\Zkk(/PW]E0\�g\��C\�\�U��cF��k�\�78ª\��\�\�\�v3�����\�\�P�\�\�\�pw\��r\�,_B]M%\�\\\�\�+���l�`=K淳a\�jV-YD:�\�P\�1t��K�)�	�)���\"���\�\���/����?\�@<gLWP��TGjb�\�\�Wtv\�-\\��\��\�\�$�a�L&H\�L�n\�R>��[�r\���4�\�.�>\��\�8W]��\�\�Z��\'R�X4�}��\�=1\���V�#Q<���*^\��`Y����X\�1�\�\�>����\�\�8p�\�\�\�\�8g/[D8T�K\�\�\Za��y!xv\�NV-]\�\��ф@s����d\�ʥ\����c��cJ�x<N&�%	SW[Gtj�>6>�(51:��/;�\�\�7�љ��FΔ���Pjz�6#�\\:g\�\�@G\�<r\��d�`2==MЫ���o}\�X�`^�U\�\n^޵�T:\�\�\�3=\�?\�}���i�\�\���2\�X���\�H%��{x��WY\�>��\�JFƸd\�9\�D*hn�����H(Ė�w\�>��M\�\�pl`�\�\��y�T:C]MW]��\�\0$\����隷�_E&�$�ɐ\�噞�����d2Ţ����@\�\�h�ѯwm��\�\���\�t��w��+?�m\��?���\�x�\�M\r\�5�\�\�ct|�\�)r�<\�\�(-�5\��\�O��앸t\�\�V\��>�{\���a֭\\�\�\�\�\�?<AS}\r�|��w\�cŢy�����T��\�\�;\�ͪ\����\�x� \�V-������2Z��z=l۵���*Z[\Zyt\�Kh�`\�\�y�2\�4S��8 B�[\�\�F�<ȶ]�q\�n4MCJI.�\�\��S][\�dt�&=3\�0~d\��\�֎\�po7��?[ʚ+ަ���\�\�F&�\�\�\�\�\�%K�H&H&\�f�\�L���m��ί���\rM׋��D\0e�|ߍ\�WW�m\�>\\.�\�H\���\�b�f�\�\�l۵�\'_x��HC#L\�\���~�r�\�kH��TWE�@:��}v3K浱��#L��\�!|%\�\�p-�u/ �)Kx��>\�~\�|\�\�\�I\�\�\�\�\0�\�:.���\�:�.Z�ɂ�:=9�\�\�\��\�\��\��I���\�\0\�m����[u��_0!Bfff@��sZ\Z�̇\�OE�$i\�Χ\�,\�\�o�rkB\��\�`�r\Z�\�|�m��!c�ԗ�AJF��\�l�7O:I��C䧣<��E�{��t\�:\�\�$�x�ʊ\nf77\�v\�hB8\\\�R.\�> �\�U�\\\�MW_A:�P0(L���\�\�<��9sk\�l\�|&���\��\�\�\������\�}�\�\��\�\�=/|Q �]4������	\�\�4\�T\nM�\���O\�1gN��\���!҆H���\�܈�ɂ\�MT�\�T�\\\�:\�Cm0@m��\��8{nmuUl?҃�&kۛ�-�\�w�c/\��c\Z�RI&\�\�Y=��t:K8TNE(\�\�\�6�\�N\�Y�#\�W)0.\�ł\�6d�d��}x�^2\�,�d��,\�\��\'\'\�[�4\�\�z\�ȁ�͠���hϡ��F�]����sۘ��f:6�Q(�I\'�\�{o\�ܳV�B���P��\�c!�T2�z.�7�F\�&������\�$�%Ӭh�\�\�\�������\�~?��Y\�\�\�Ht��\�˳{cLVu��\�eio�!\�q\�)\�\�XC\�\�ͥ^��XL8�U[=nK\�w\�\�\�Kw\�\0>��|� ��\�穭�C�\�\�3:г����&P\�}\�{��@\�G33\�O�Κ]6o\�|�����F�\��\�y\��\�\��z��\n�Ϫ�*�Ji$Md:�(dS\�@�\�.M\�zFƹd\�b�����]ӘU[EAJj+B<�\�n\�~NLL�\'ظ���\�0>�N�\�C�\�E��Y\�e�����˲�\�d+�a�\�Eks;�\�%�J\�\�\�\�|�L&CSS3�D<83=�_�\�\�}^�\"<-�\�rه�\�KOMޘ�\Z����6\�\�\��\�\�(�\�I\nH�\���\�z\�u�ʂ\ni\�\r��\�>+�9\�\�(\"6�0ri��J@V����b#��\�k��3\�y�E��,W�YF8\�g*�bWW\�.jG��\\T���KhV\�k1a\�!>���\\֊u\�\�ȧDs��JJ\�\�m\��\0�\\�l.�j`\�\�u��s\�\�\�W\�۶�\��^\�\�қ�o�3scݷ�u}鼎N�^�a(�M�\�i6�]ɼ�9\'	\�\0�|���\�r\�\�$\�3*�+\0���)�\�.0���C�C<�m7\0.M�y\�\Z�����\r�H�\�RZ\�K_�]�\�\�\�$2�)-X�O	B*k.\���X��\�/\��Tt�B��i���ʩ�� (å�| ���c\�$�iPt��f\�\�uv�w\�e�r���\�fs� �\�\��\�\�+-KG\�R\�\�\�Jr9e���H\�l\�h)�V[.M ,�w�w�\�x�\�ü�z\nI\�\�g�\�K�{\�X�\�	\rBۖ\�9��*����j\�2g\�\"��H\�\\\Z7_�V\�\�me&>C6�eb|���q\�nn��k�vvד��\�Mқe�\�lL�^G\�\�\�2�t\�\r@:�b�\�\�47\�a��m6I\��	�YeDR\�ªe������Jm8H[c\r����Dh���;Y\�\�<��\�腰�������0\re1FNyN\�\�V(U\\ص����������a`\\B\�\�v\�v�i�o$�J5\�{6�&\�M�2\�ߵZh\�\�ٳZ)/�D\n���-%\�׬\"\��;B�E��L\'��T	8q\�)H+\�\nA1)@�yy\�\�5T��k		�\�e\\�v\�\�)�\�\�T\�\�\�|ŋI+��31�i%�P�P\0K,�Є`\�ڳX�|	�\�\�|��\�4�D�ٳgS6\�R����\��\ZytƠ��\�\'�у;��|�`8\\���\�T�ɩ(\�(�L$homf\�ڳ���\�R�\�\�#�H%�c ��\�%VX�N��\�vG�Ua>p\�F�n7v4�U`G:�8u�(�?�B�5��٤R��ĶP�EV\�X\����܀�L&�\�\�#*/g\�E>]�K���\�%�	:cP&��p�\��<X�\�n���!�D<\�%\�\��z�UۆER��R��F\�Q\�\"ŘXnFi���\�J i���\�\�A\�q�b��V��@��Ē��@\"R3\�|�\�:©m��@\n\�\�M\rlZ��D2\�\�L�ѱQ\n�\�r�>?��\��[~��\�\��r��?t\�B~iMu-^�iB*�\�\�d�Y*#!.�\��SB�@���\�����\�ċ�����p\0,%�a�(�,�lͷ\�\�Ġx\�:kZ�#���H%@J\'�p�684)�[\�y\�囨\n1�ӱ����z�x=4�~\�\��՜!�(\�\�vO!�[\\0򁖖�\�d�\�b�H2������\r�\�v��\�Z@���̞Kl ��Dh�I\�/Ն��4U\�8>\�.\'J�\�\�\����N\�\�V�`��b�6\��\�\\R*8�s\�l\�<2�\�L<N2�\�\0��=C�!�(�\�>i���}�\�PyLŦ0\n�MH�/��\�rQtY�y[�-}Si��\�(vO--�X\Z\�h�u\�\�NQm�\�R��\�c�ݼ\n�ū\�m�$��M4\�g�raN6f�c�4Q<\��x�p\�\�$\�I���t��L-a\�s\�\�C�j9C:#P�����\�\�v\�BS�\�0�\�*.\�\�\�Xꚁ�\�`\�KB&��\�����\"�\�*�\�,�W��\�\�>o���\�\�%�Dp\�\�B`�B�8�Ē�b\�41sY��%ǭR\�f�ڰf5��B.�\�맡��p8f�Sȥ�\��铜	�(�\�gj�˰3(\�遒TY�O$��SX~E�\n��d�j\�ɩ�9\�\�%e\�;�Tႝ\�J�\�\�9U�\�\� \�\�\�Xe��\n\'\�]�J)$\"�*6i[/�a!��3Q}u{\�,h�K&�%�I�Ng�\�Q\�\rU�=��\�3\Zݟ(�T�:5=>+�8A�i:3͂re�,�\�D���a�a�0q*\�\�\�d��dYo�\�j�$xc	̒�C\�\��)�Z6h6I�H�\�!�9�$��\�\�j���\0+\�\'�\�a�G�\�u7ኈ/=5~�ؑ]���(\�4ߪkz}mm-BB\"� �\�Xy� �\��\'ϔ�S���RM�H\�Q^\�Mh%dp\\�\�vVꜴ�\�O�E\�bFZh*��5�˔\"���j])�\�\�ɴ�\�\"u55FӔ�\�if\�3̚ՂYȵ�\�UK9zCP\���z|�Y8����\"�W����Y�%�˓H$,�.�\�VRLr�ۣT\�PA܂\�\\[Vk�$ReD�Z%M;v�w�(�\��\�|X틒\�|\nl�d\�\�uqY�uՕLͥQ	\�r��øݞ�\�\�h\'g@o\��Z)\��@ �\�\�\�\�v\�\�\�HMu5n�Z�\�\��\�I\�\�(l��P0��L�\�%�k(�\�V>�Y��\�\��C:�/m�$N	,�#��U{��\�	*N�\" ��\�P]:}�e�D*�A\�4фFE�ݥ\�\�u��\�3J�\�p����\�p\�[\�\�Ri\���8ӱ�8�\�3�RA\�\�O\�\'5��&Jk-�S\�\"\"��q���zV�B�4\�s&N��CN{62%E誂�@Ab\�s_\�bvY\�$\�\�\�Rb�NM\�r\�x\�^\���1k�\�\�鴖r\�Ϟ\�w�\�)e!\���\0�F�LMM�A��/\�\�{�uY\"L�\�)�����<Y���N\�?\�ޔ�˒\�Nil�(�QR\�:b\'�0.-lJ�wH !�S�\�OE m>\�>\�\�{\0�ǃ�����	\\�Ny0�Ks����=oWNʮ{��:�F״`c}RJfff�\���\�tSSLd\�@̞\�2`\�)ZE�\�o8)@+)Y�E��\�\�*́Ʈ{���\0r�\n�Îg��9*^��W#|�5\�(Dqr�<���\��z-KY(�\�fhlhB \�M�]{\�?\�\�\�4tZP\�e\�\��\\f}K\�,O8&�L�\�\�qi.t]ǭ\�h\�.�\�C�F�\�m\rV�ϥ�4\�8n�Yb�\n�Sw�(A\�\�\�\��iÉ\"\��NR\�j\��\�z\nN#Eː`x�(\�B)A��N9\�\�bG\��\�\��Je�z���l&CSS����4rWM\�{\�\���1%�N�����g�\"\��yjkkq�\�\�N\"� :=�Kw\�?8L:�\�om\�\�$�v\�rY��\"[VO�#|�\�:XI\�\\YL1�8e�h�iw\�(��²�RpD<[W?��\�\r2�F3 \�^;\�J��Ҏ]x�ޢBA$����K\'�\�f�GkcC=��M˂D�JE\"���	�B$�I�\�(�a\�r\�d�yN�8|�{�\"oM\�\0��\�\�\�[\�-��)E�i�d7o�l��/\�]\�9\�4FI;©e\�+)&[*2e�\�\\�b\�e��Z��d��\�)+\�-!�$�ϣi\Z���\�\�g�H�ig�O��{Sv7m*\n���119A�4\�Y.���\�\0��,M�F�\�\�\�\�I\�\���j���\�R\n\�Ǘpb�#K~\�2.���T^�dl�Voε\�IQ��÷0MȦ��\�Qu\�op\�Y\Z�)�\�\�\�G2����\Z`�\�\�\�q\Z:-(��7F\0LNN��� �#g#o\n�Y2�S�\�rRJk�\�ޕb�,�\�8���\�`	�hpv��\0�\��\�\�)A\n`K\�N[%��0%\�K\�Id�\�H\�吅�rq���/\�أ�T����?�T��\�!2��j�`9\r�6�H0\0�٬\�d�H0>9Q2!�Je2i��h�ujv�(X�\�ڳza�5��&85kO���),\�ZBR)�N�bDi\rm�,0E�ĥՖuN��Q\��o\\\�P�0\�X\�ȁ˭\�c�Ԉ\�blٶ��`\�I\��.\�g&�%�\�\"M\�g8\r�\�R\n�\�bV�=2:�\�^�7�\�e~.?�<ܺ\�\���\'��ץ\Z�lb�+\�*\nRs��V�\�(&\��J_�j��ݶ՞\�l�/^Q\�U«�(RJd:��\�CR�\�Oo!�J��!{�\�\"�Z0\r㴁��\�W&��R\�V��� �\�]�V,\�K.�c\�lG�K�M3�H�\�ރlݱ���G\Zg-�\�\��9\�mj���\Z\�����\�\�-~u\���b\���\�M@ig�?\reaf��	?1\�tl�����<AsM5�p9��y�Mh)���\nM�\��e�pY�8!�y����NC�E�ʔb�8�ۍ\�gQ)�aȂ��Woƣ\�.b�&G����O�\��yÓ�%�ZVDʃ�\�n����5K���\r�\�KCM%\�u5���\�\�Rc�\"倧��[S�h�{eA\�#(�4I�\��G�\�@\�q\��2\����\���\�,Y��\�㜿a=eeA��\\t>?��\�\�f����n�\":��\�_b�\�W�J�����SƲ�l�=�X\�*2��\�\�\�XW��DXBz�\�|\�\�e\��\n�ޟY\��T<���\�q\�0�}\�9\"�r\�\��\�n�\�K���\�MeE���^i�\��Y=�mU�,\0\nfI}\�\\����\�\��\�&O:�u&�\��C|��\�\�>�>u\�������^.�\�<|b^�\�	�*3-�\nOb�/\�iAIN�N�i\��XmY0�\�\n�rj\�\�Z@]&�H�\��\�O\���\�$\�d���Z���\�<�\� ǆ\�0�,���35�x�\�ܴy\�\��~�;h��AwY��J\0)~Qe�e)ɱ�!�ܶ���q�ݾ��F��\�\�V�����\�\�\Z+#�<n�L\�\�\�G���\�d2|\���\��zY�zO<����\'\�\�)愔h�f\nq\�P~zPj:�MO?x\"�ͨu\0��h�V5$:ڐJ\���!����\�wP\�u)�2?;I�z\�j�ع�#\'�\�\Zapb��I\�,�z��\�ѧY\�6��=�\�r�Zgq�9\�ZgY��%��D#sy�W�D\�4^;x�Ϯ\�\�4\"�2BS=+;氨���� .\�N0�\�ꥫ�14偗v�\�٭\\�\�B:\�f\�XW\�\�d�\�U_�\�\\.�\���W\�g8z\�T6:-(��\�\�tߑ\�|:_�u*\�� ,\�\�Sh�,�\�ڕ\�!�!9>\�̉~����\�BY\�܆:n�r�T��x��d�\�Q�&\'\�\�\�G\�Ȏ_\�d�\�\�{81:N\�\�Y�еR/\�|\�x��T�;>0L.�\�U\�\0�\�墥��\�MU�7u�0\�`\0]s%\�5�㺭CM5U|x�&\nA?\�0�B,�\�α-/9�8�\�uM\�ti�Kqy�H!i\�\�(*H�HE��_M+H	\�\�J�u��� �\�V�{��:Al:�~�v\\�N]$Bm$BGK#H\�-��NhB\��\�\�\��;q\�\�ŭ�\�5�\�E���\�\�\�_�\�6f&&�81�Y(�\�@*�/u}��	\��8\��\�:^�=P�\'!PU���\Z�\�B)\�\�\��\�ǷPJ\nHkd&F*Q95\����\�BJ�\�rY͚�U\�\"���H$��J�r\�\�\r���F����Gek�e줠T\�\�\r�>a��9M�xg�\�[�U�,�.i٭PS\�Ŷ�\Z�\�	&f\�t�N�\�Hc3IR������\�ԓN]��{Ke�\�9�\�l��yႢ~X\�M`Vc��qR2T:\�\�\�=�\�\��_�7Xy(W!(�q댦Oe�N\��\'S�e\�.�>J6gPYbբ�,]\�I\�� 9=M.�no3�\�b\nyb3	\�\�Md@\���y\���:\\�k�\�\�X��hV�,\���4\�\�Ny�@\�\�(Om\�\��\��j#�46	���\�]:^��ڊr�5�њKG+d\�\�:�I,�bW\�0[�<�\��gY\�1�sV,���\Z�׃@\�ҠnE1C\r$ms���dsY\\\�����2G�1�\Z�(~�\�\�\�T�R\0��MJI>�\�c��� 5�\�\�b\�ᣜw�*�Gx��g��}�,��\�\"\Z\�\�in�\'�J112��˒\�4�`�Q �H�Lg0\�}=9BeE��W/c�/��̏pi�\�co\��x\�96�[\�\�\�\�3<\�\�\�4#\�\�l�ۅ�iD\��DBe�\�\��\�\�^ݶ�\�p9ׯ]NsC=\r\r\�~?\�\\��5Csi\nM#\��!\��݇��>����s\�x��L$R\�\��\��q\�oY����7m\�(��\�\�󫝓v�-R�\�b3�2)<\�UC\�k�ϝwV�WV�ӏ�<T�������Pe�KO| ��ͲO�+**��`e]]-�H\�I�<�˲���׭a��\�i��\�ʋ6RW[�/\�G\nA�\�z�e\�\�\'�\�Rh�F�``[�<ˁ��\�\�Ǎ�o\"�3=<�ܞ�����g�\�K._��*Lk]5^�\�he2�ehr���)ff�\\���eK�W\���(���\�\�S۶�}�aGv\0H5\�\�\�u�\��	[u��\r�W�\�_�--\�hB�`��\�\'�ehl\�\�R�ad|\�z*�m$�XL\�\�\�\�\�\�\�\'R\�tk�KJy XU���s/�w\�o2\r\�\��7~�w��\�Ω�\�\�\�B�\0\0 \0IDATin��tAgeCue�KP9��}>/F��\�\�\�\�v[\\.�\����,�\'\�wu\rM\�>569\�;��z��\�I\Z\Z���o\�,�,B3D6�W�`p|�^�\�v��\�\�g�����:H\'\��<�\0�\�ͱ�(\���|�\�M������\�io������\�:\�n\�\�ys\�\�\r��-\�$Xׄ\�磬\"DA\�xn\��v�1���PE�P8By(�H\'ХI\�\�ט�\�\�u\�\nR9�\�_\�����X4��\�\���(\\AE(ȖWv2<6A2�v���D��\�!��\��	\��D`���U�\�ή�\�X_)\�\��ၾ��D�\�\�\����\�]\����\�\�ý\�v\�m\r~\�k�ȪeK\�f����\�\�<ģ[�#�\�0>6B}Cj�R1i\�ڶ�}�\�\�4Y(p\�hO=�Bӹ\�+X�|eeAƢ\�d\�i���\�ԀHR3\�\�Wr·o\�[\�\�\�?�w\�s?�\�0\'\"�L\�W��2�\�\�fp����a�\�{�h._��\�\�\�\�\�l\��M�\\5k�\�\�\�rL�ї��K����\�Y�4.;�s?�9��y�\�\����\�\�#��2?��\�8g\�J@\�9g6\�\�\n�^7;\�y\��\nU�\�:�\\Κ3\���\"\�\�\�:>y\���T�\�e\��|\�+wTv���c\�#��/�]�\�\�w\�]/<�Y����]\�\�eK81�n.]<��\�}\�\�|\�\�\�4R\�4c##\�rY+C�G\'\�]�ǋ\�t@`J�M\�\�\�r�\\���\�\�Q��\�\�\�ǧ9�{;�\�!+\0Blt�ڎyT55SW[\�\'>�T7\�\�g=\�\�@,W0�er���\���\�Θ�o�HB.�h2��M\��Z�\�=�c7��,a\�ʕ�\\.�n7\�[�o\�VL#Obz�l&�\��m\�F\�:\�\�\�c��$\�\\�v&�Stu\'_0\0�ۥ\��y���\�\�\�_E.�CJ�=��ɦI&�y=�\�[_\��\��\nM�\rL\�\�\Zf\��\�\�p\�[\�5\�\��\�c�.���>~�p�\'P��\�#�M\�\��w���~���\n֜��\�|�\�\�drY~�\�\�I�SĦ����E �݌OF��\n���\�✳VRU\���>ff\�\��HA��\�\� ���]\n�\�\�\�\�?Jm�|\�n^Ow���r\�ŧ�1�\�N\�(�5j#a��\r\'��\Z\�}�*\�|�\r��d�`�P�W�u��ӹl5^�)%�P���s\�\�\��\�1\\���nx7g_u\r�`\�墯\�8�e~�\�;���\r\�٧Iry�\�\�\�Դ\Zc�\�0$�\�\"�\Z�~q�\�W\�\�\�\�ݿ��Wv�\�Ll�kߺ�+.���\��k-��k&z7\��_�ΥR�\�5\�,�s\�.\���?2�L����Z/?�\�W�\�-僚��\�\�!�LQU%�^���\�i\�\��B\�\Z\�\�.��\�m\�UW�O%(�B*;jh\�\�\\\�x_/�l\Z�\�Mյ\�S=��d,Y\\_�\�\�\�e\�.}!`:�\�\�҈D¨aa�H1��\"~SuC�q\�紑\�d���Y4\���rB\�q\�ZB\�uL\r��g�u7�`\�yx��q.9\�\�`/_�\������	�X\"I\�0��pi\Z?�\�7�z=�������x*\�՗]\�\�\�]\�\����ڝ�g\�|\��P��\�\��Χ�2��\�_ط��j}j\�x/\�l㕝�������\�\�o~�O|\�.>�o����;��.�\�=$�	\�k�WT \��}�E�0�<\�,��CPJIU$���L�i`J\"\� ��U�` �9�\Zu\�\�$!:L�`S�Hɑ�)\�\�\�PQ��eJԺ5�7�ʊ`��p�#ã,�ϐU\��y�@ƣ\�.-k=\�4�4\�\�T�\\�H5����\�\�⎎�z\��\�\�R!\�\�n�N�߇\0\�\�`tl�ѱ1*\�|�K�A\�5>�;�?�\�K\�Մ\�#!�\�\�ł\�6�<�\�\r\��-�\�\�\0�rGFX\�6\�\� \n�i\�*��\�{�\�\�O�\�\�\�FuE�=�s\�[.e~G\�\�\�-ϓ\�d�@sgJA	��G�\�\�lF��\�L\��`\�a �$�H��MP0%}\�.^����D=g�\�$O�Ǫ\�z�9\�\�\�\�0�\�\Z�l�ߋ�&$���\�YU1�ȩq�i:� h!\"V�b%)`xl��\�*uDZ�	�k{\0p�Eii�\��y���򙛯SOΐ\��.�;���Q\�>7�5\����\Z<n�d\Z	��kW~\����������\�Wt\�a\�\�yd\�i&&\'h������5+�\�6��{���>���` ��\�\�J{C^�����IK\�t\�,HR3\�\�Z����\�!t\�Ŋ9-j�\�iD���Ms\�)\�\�\�y��Ӄ�$\�ǑF\�$т���y�TK\n\�\�\�\�I\�ܱ\�hf)v\�{�-/\�`\�ʥY��\�_ۃ\�\�\�Ʒ]M\��>\��\��4\�T�ۧ��\�}�\��\'�h$Ri�n7\r��\0��\�U��9\"\��z|��*\��\�K`i\�m\�\�sV\��z�\�_\�p\�1V/_\�\�\��5;v\�\���n!\�]\Z\�\\r>�=�8?�\�^t��t~\'�--\�\�T\"��4\n��\��\ZR\��4�J�U8\�AW�$�H2K�R\�0ñ$�-i#\\���/�\�k�\"`�~У����Gg,�d�\���ZJ��\�\�A\�@s\�B.ci����\�Y���346Ρc=\�~�0S16�Yɒy\�\��\��~\�s[g\�X_\�\�n\�\\����xuz\�5\�\�A@002ƚs\�eF\�J�\�\\zN�\�r�Q߲���c�\"�Ͱa\�26�\\B푽\�U<�e+׾\�2B\�A�\�ڃi�p���\�0��\�\Z�\�\�y\�}<��\�\��\�\�̟\�ʒ\�j\ZC\\.\�\�e�D\n\�&L%�DI&b	&�f8\�\�O\"������/�\�\�\�n�@q6�\�\�\�{>����\�D�i\�^8v�\�\�\�\�s\��hoi�2�:��<HE�Mhh�b\0��a�Y���({���wb�T6G$d\�\�e,�\�Ae$���j��>\�\�\��W,�����\�>.9g5��\�\�;/�\0��Y�\�\���g\�/�b#�#�Y0rh�\�\��5��s\�[.�,\�\�Vuԭ\�Z\��[nz\';;\Zchl���z\���~m��hk�E&�\�X\�	�\�1�uu�\��\�\���&\\\���S�$�Lx=n*\��\�W�����\�p9~�3Z(�Q{u\�	I;��A��\�!1\�4A]y���\�$�\�1�y�%\�\�\�C<�%c=Ġ\�\�%�f�SJr�>���\�J6����\�&:\�b\�>�Zg�B)�&\�\�\�.�\�4�\�\��\�n�q_��{\�]\ZjV[�\�\�7��rV-[\�\��\0a\�Ыfu$b�\�C\�\�\�H�\�w�\�ǶG)yn\�����914̞�\�XWKO�\0=}�45\�9�݈�\����c.\�\�q^k-�T�L&G:���g鸓֪\��N\�\�A7MN9��\�Va��%\�Q�\�c{u)\�\�R,�|^.��\�\�!�Β\�\�\���{v\'\�W)Є \��\��x�\�np�\�j�\�I�5\�I\�d�y^?҅iJvv�\�\�\�{��\0\��2.8{�]�[\�S\�\"\�\��MWԷ$�\�%���鉡�\�\�\�\�]ǘ__��\� SJ�U��ݟp\�Ƶ�?��\'�\�J}]-�D�\��~\�ٖ\\�֫\�bl��B\Z~����8=�Pt7V�*|ee�\�	\�6i��\�*�!J6�;$�\\�%\�\�]^��!!���r�OY�<�5\r��8�!���Pe@���q\�\�\��\�\�OY�\�\���\����]})\�>���.\��\���ܵj�$�\�>v�\�\��\�7Ҽ\�im��sǌl�`<�2����\�\�ǢQ\�~�a.Y��\�6��>�\�X�!\�XO/\�\\\�\�\�߭<^\nԃ\�ri�#\"�,I��T�\���i:�H%�K�\�iJu��#@����r#Vy\� o%VQ��\0����\�p�¾��s�\08\�*�TɊiX\�ڋb6ߒ\�t����֒�\�\��n7W���KW.\�\�a,:eU��{\�\�\�!�L\Z�|\��\�\�Mh�Y)_y\�\�x\"�ʮ=���y�\r308\�g/�l���{��\�~-oX�\�\�\�Xo\�\�1D	S\n�f������E���k\��dq\�Z�/@�X\�\'�|\�G�\�?<Z��N�z~�{qG	��\�\�\�&����D�\�Ig�FX\�m��\�6��c�\�>g�\�\�\�ãc,�\�\�\�\�vn��\Z~�m\'ǇF�\�e\�;4�8d\�n^ٵ�\�x\"\�+\�Mi?�\�B\�Ͻ�E)۾k�Q�u\�˱\��^�^//�~��\�\�\�n��e�\���8\�\�Otj�(ai�4�\�8\�s�Еu\�\�p�\�!Y�n��x|^�5�$�\�=8b	ӤTG�Z`�\"\�ܖf�\�}�D\�~8jD_\�K���H&�n<�!�F�H\�\rDF�>�\�;�iJV.]�\�\�\�S�\��vv�\��z(�z9>8�v�z��O�}\��d�\�\�K_���/R-�7�u�\'Pvt\�\��\�;t��z\�~�\�\�!�z r&�gg\�qn~\�5x=j��hn����C�c?v\'$\"�WON�{%5\�N\�yl7#K��K[% ��\\�e@�\�\��\�ˬ_���\�0�Z�\��k�\�\�̓/�\�sao��(\�\�\��>\�	v�\����̤ѐ6\�ٶc\0�^�M�@\�-�^\�Σ\�\�Z;uL	w��w|��߱�\�av\�އ\�_v��\����u\�\'�2\Z��i2����~Lcs3��\�\�\Z#�͒\�\�)�&�ph.�6�K.�籧�X��e-(�\nS�~�F\� vi�)\�N��[U����O�䗴�\�\���ގ\�\�,�(�\�Q:`�=^~�\����X��\���N#mT�Re\r\�k����X��:\�\0B\"\�	�i\�gB�H%yy\�k,�\�\�\�\�F+*IB�L\�\�\�,}C��ǃd�\�|\��H������n�\�\0��\��H���{���\�z�\r�򑧈�2�F�X\�\�\��Ě򓜿N\�|��W�,l�\0ݍДu�0�\�s�\n+\�XBqv~`�\�J 9\�;�\�Ol岍\��O\�J$T\�\0\�i\�aA��aNS?��ǹ\�\���\�c[8:`-�[\�\��\�|/����\�U@-��\�J)پ{/�a�x~\'��\�?��GX\�6��\�43�4��\�S\���0e��{�g\�\�]\�Ԍ��\�eΪ\rc�\����Q��\�\�~�\�.`\�E�O��νl\\����~�\�\�dsy\�\�氠��c��\�\�U�\�qCh�?�[%=V]�\'aYR�;�\n�O�\���O�\�z>r\�U���\�ږavv\�վ}<\nr\�s\�Y\��\�\�[)X\�l����+%m�آ�\0�\0�ǃ�hm���\�\�4MV,^D($�\��\�fl`�\r���ν�M�t\�.\�tw�\�\�Bԥ{��	����;\�\�\��\�\�Ǟ\��j\�ǿ���\�\�Y�x�|���Zn�\�\"���\��\�#O�\'hkm!�\�\�S�a!�m�Y���\�w	�H\�\��1a\�\�c\�UF��\�5j��t��֧2\Z\'���\�vq֢�OD��k\�(]j!\�6m@��O��\�\�\�\�ž��J�ٵ\�\0�r\�j�81:\�#Om\�\���=n�\�B�\Zj�\�\r�/^�?~����\�\���_�.��}\�\�\�?�̋?������X��\�Ϧ��&��W\�?x(�j\�b���b����l�(��\��I~���<��K<\�M\"�$��\�p�\\�SB �z�\0�P\�;�\��%h[�\�\�\�G����\�\�u�)���\�}UHi�=\�,JZ�\�<�}\�^t��S\���#��\"r\�\�\n���#t\�\��Xo���\�PW7x�i~\�j^�*Bܻ\�eF\�I��\�r���;��#�쮨o���\�s���Ł�E�n�\�p�\�\�g��\�/\��b���\�\�,[����3,X��;��~���r�U��x<<\�EO��b[*\�\�i+�:)�Z\�r\�X��\�Pe�>?�c�$I�\�4�D�L\"ɋ�\�atb\nS�૔\�\�,����Г\�222F&�\"�\�b�dS�{e_p�\��\�\�Q�A���\�\�\�s��\�\�\�x���E\�\���o|��\�\'��|��ۊ���?�\�L<�����f&�?P=g��6}\��pNU\06\���=�\�݃v|}NKs\�\�?�i��\�J� i���\��\�\�\�n\'�\�?�.�]���+M\���\Z\��?#\"��\�\0ʅ\�3|�\�e~sם��ѩ)\'�\�f�\� %%\�M��6k$S)bS1D�@,�\�\�qs\�\�\��+B�\�o~Ou$o���\Z��hȒ~ٳ�GHe%�*T<Tw�}�\��\�\��m\�Ξ\��?�>��-��\�į~�0_��\�\�\�o^|֗�m�\�G�u{�S\�/�W���0�l~\��B6+O�t\�\��\�+\�f��:\�(�m7��}�\��A:紲\�\�j\n\�6yS�\�P��]������*g\�\�\�9K�맶�u�~:\��\�gx\�\��4.Z\�\�\�H�*��J���@�\�n}�\'w\�t��\�J�G\��\�_��ƺ\Z�\�\�\�(/Sɂ�l\��9�\�\�\��]dM�( Q�M\�:�\�f�\�O\�\�\�f�4q\�\�7*/�\��\�d�����ʿ|\��\�j\\�\��s\�\��\�\���\�\��D�_u\�\�VXs\�Gw�c\��\�\�𒗷o�\�:ރ������\�v\�;0\�o~��I�/:\�q����{3͚�PsT�1\0v`� lk:	(\�e\\�\�,\�C圳tk:\�(�z��T�t\�,\�>ܺ�K\�\�\�Y>w����+֮\��#\�L\�\n\\u\�>z�\�*����SB\�?� \�3\�\�\'\�Z����	I+bIH�\�|�\�\�&�NS�\���ϣ�2B4\�\�\�^\�\�w�\'��\�R\��\�u���`\�\�\�\�z�7�\" ֕NO���=\��_�x]l�Ŀ\�R��\�\�H`\�\�\�\��0>1\��~3�\�\��x���<KKc�3�\'�ĜT���+���ue;P;;\�\�)�\�\�`\�\�\�2Y�F>�4O�#Ls��!\\\Z9\�\�\�q\��z��fX��v좘�;,	\�*ǽ���\�*\�V�\�l}\�U.�\�F\\^o\�%Mmvs�V[]�e�9�N�ѩ��\�@Eì/�}���?z矻�RzCPl\����\�\�\��\�w\�\�\�\�\�,t\"��І�K\���\�\�c#\��\�;w跼\�N)Aħ��I����-xQD���-�R�\0��9\�m��Z_iQ\�\�a�sM��\r���c��\�*���R�\�7�÷���ڶE���\r͖fa�if!��i����\�\�{\�gz�[�\�\�A�i\�Mo9��\�4�ZYe\�t\�ڋ�_�\�_\�:36�\�w\\�9������0=~�p�C��B\��b��,Ó\�pN;�Xd�FJ-A\�H�T\�f	�\�\�\"�\�\�ҡ�F�Q��y#\�\�\�\�;�\r7ͽ\�\�\�>�\���\�\�MFGB�\�o6t.\�v\���y�O\�;�^�\�^�\��}h\�\�i_w\�\�l2~���\�+�N\�\�\�\��dt7Rw��\"G޶��L�³?��Z���#�!K5\�\",�\�b���:��HJڠ�\r븴���v�\���\�\�$B\�뇏\�\�?`\�n\���7n\��\�\�s�a�\�\�\��f\�\�\�)-\��\�n#�}eph\�ܶc�b\��KG\�\�?\�z8�\��݂F\�P_9��\���-a��ݚıuȞ)^\�\\ڳ\�\�i���\��\�\��v�\���!\�&�\�\����7�����]@y\�K\�\�Զ-\�O�r{\"�3@�۫v�\n׶�įΩu��a\Z����6s\�\�Jտh;\'��H\���2�a���Z�9u��>処�\�_Ҧ$�Ͳ\��!R�L�e\�9�;ћv_�V\\u�S�~\���/�\�9��	��[\��HƁ<���܃Z��s�C=<����\�\�\�HkC-�5\�~\�\�A\\.5�v4ٖk�%ZBM�3$\�\�\�,S�}C\��G�%\�l>\��\�k�\Z�+Z\�\�\�^?¥���5\�&���}\'�4/\�|\�\�^z���\�@y�\�ۇ\�k\Z\�}�Pg\�� ͍\rNp��\�u�\0;%�II\0��� \n�n����\'&�\�ϑH�i��&�	�ԫ1��.a��r9��\�f�I�h,N.gP\n\�\�\�\�\�眥x�\�n�դ��:nY��Ym1-a`p��G�V\�w�\�\�\�\�D7P\0\"\�s\�\�\�3�\�w�=>w\�j��JR�/���\r�\0��}KA\�f�9\�\r�苟\�4\�&\�\�t�002\�d\��\�\�\�\�,\�|����\�gi�f\�f\�f�]�H\\1$�z��{o��\�l\�$�\�Lfnƛe�g\�8��\�Hb�+�\"�(� �C\�*H7���>�yk����}O7�&�\�\�\�9\�[o-\�\�y�z\�z�z9\�\�Mk�\�\�g����b�%\�7�����@0\�\�:\�~�\��\�|K�Z@�4Z���Lt!Gܷ��ۼf\�zҙ̙ѣ\��>\�\�\�E^���ixCSC[\�ok+\�^[�\�_�\�#��[i\�Y(\�]K�\�\�%-�׏�$CHi�\�/\�{\�-r\���\�\�V\��3�0\ZQe�*�bVf\�{g\�\�X|\�M�n\�:)�\\\�{\�ԟw���>��\�PͤY\'\�|~\�\��\���/��-�\�K�\�1\�Ƙ�{\�\�T=?$�9z�@�B\�J��\�\��:o��\'� \�򩝸��E\�\�N\n�Yh!�!\�*U\�\��\nA2�槿|�ӭ��p��ə\�\���[E�_����=�\�[������Ǜ��z��j\�\�T���\�K(Qd��q�0��n��.�%8n�\��\�\�#\� h�D�\0}�tu���x�V\���D(\ne\��\�7���$\�s�*~��\�\�\�X5~�={\�=�����OXp�����8�\�\��k]�T\�\�~�8��% V\n��H%PS��A\�1g�9�����\�\�Q�}�u2\�Af:�4A3��?���Y�ݹJfD\�\�ai�!�>\0\0\Z&IDATS)\0YB\�+\�\�|MB���k[�\�/` �\�3�v�v�-��D�4���ac\Z��;\�>eg�s7=�\�Z0{�z�\\\�\"�;�@���,x�/q��J@�Q��d���\�\�5\�9�$Z\�=\�Ϛ\��?}�3TU�a:m�Q\��A��	\��Hbe�\��P\�\�lze+�\�\�\���\'�\�\�nZ��^�\�?݂\�Ϥ�\��߸\�ڳ���j=�\�\��g6M�\�_\�f\�\�H!�񄔶Z\�\�\����MxL���\�tcӤ��\�Vzδ��c\�$!�YCň�(�\�;��q�1U�;\�Ha!b\�\�\�\�+c\�\'@��\�G��_c\��m\�\rM?�����^�Տ\�S���\�ڧ:�\�:9��%ǒ=g��8v|\�\�\�\'�\�\�Q^V�\�(AX\�\�`�9�\�/\0\�\�\�Ӣ9d\���`�l*�](��LB ��\n����SQ3R��ѣx�\�a�v���W�(�DDb\�9�I\�\�o����{�����rl\�##\'\��\�\�\�\�\"\�E�\�Ⱦ�-�>�\��\�׌~\��\�Co�/�{	\�\�e\�&���a���Drx��\0�B`�DKK	\�bD\�ʈV��(�b\��(\���*Dy\�N�E����\�VC���c�\�\�{6�o��l\�\�R9���#/�ɾu�\�\�\"\�E`\�jg��I�\�?~|\�\�ӧ�93�SY^�ShOKXX%*K.\�_\�e��N\�B�|�`��`HmOa�-ez�J7׉�\�+Ŋ\�]m\�g�dߡ\�|毿�\�7\�\�\r�}�n\��\�\�[�\�;j�(tQA��w�����\�\�m\����v\�F��9�Ĉ\�*,�\�z]B �d(��3=����4#�\�\�u�bF���Q�*2P�(�\�\nǐ�\��龦`X��%>w׷\�s��Dո)���4���?��,��nt\�A\��\�C\��B��~\�k�l&\�\�\�1�\�\�[J\�\�(\��`in��)�,u�wX\�8O	\��k\�O�\�贡��c/	:�	��Z�B�\�k�\��.G��\�1|B\�wf\\\�����E\�C\�E\�P��5UQ7\���\�ԩ#\��6m\�9��\�Lk��\�\�*\�	² D����\�2�RyH8���\�N�E�\��A�+^���\�o\0Zζ���\�\��3g\�(����\�\�r\�\��v�� �\�@Hv�g\�f,\�\�8\��\���Bt���lz�5\���\�\�\�\�ے;��\���|HY@\��bD$���>\�є`\�*!\��:T ��%{4��}7>��/D!�\���%:\�����e\�~�����\0$:\����\�-�l�;Xi%����˯�Ω�V&\�O\�N�p4!�\�\�9�2��(�\��ң�9K@�/\�kq�w��\�>�8_�\�e\��75����|���3��:\�kX|���\�,ڹ\�bS�!x?t\�\���i\�Uwd\���\��\�\n+%�Z��\�\�@����K%�:\�~kѨ\�\'\��RQY\�έ\�ٴ�׼s\��x���\�g��\r\�Q?v4>ˬMV9	P籤\���l���+�\���}*\�+C\�h\�;A\nv�}��\�C�p�C�%�2k�5\��EYu\�W9��%�������q�^Φ�P7}\�~����?	�i\�~�\�MO\�G.K�vͶ�\��s�4m!w~\�\�Dc\0��jf\���}�\�)fMk\�W�ɏ\�@��\n���\�j* �\�\��\�;\� �@���\�}NiIOo�\�q���߲��0�\�u,��v.��P�ޞv\��\�\nR\�z�ƻQ\�(i��k+\�ƿ\�r`\�\�z�K\��O�\�\�\��\�*;��b\��C��I> ��Z\�5�W\�`\�\�\�5U\�CE�)\��o\�II0\�\�_���瀖\�\\6M����y�?��S\Z&p\�-�`\�\�fxU%%������Rb	5��(\�e\�mlۦ�����l\�_�5;�\�GZ\Z�\�q\�\�_��f�\��X��\�gx\�gw1��̘{�wp{\�C�Of疵t��&�Ie-��HI4���W\�3n\�\�3k��e�\�{\�\�U/��o\�>#�Iߝ\�\�ܲ|�#G70s�UL����)�q\�<řz�I��\�߳�\�?�\�\�\�b\�u�cY>w\�& �\�g�s��\�H%��N�Xϧ>��]���M��yƅnt\�]e�K��-gϲ�ŗxb\�s<�a��0��-d\�ҏ\�8k1�`o\�{�\�\���\�?f\�\�E�.\�D�OhN	F_O;{�o`\�K�s\�\�~l������i�ǿ���q�\�;�O�\�\�\��v]\�\�#d��GKC�-��n�23\�-gXu��\�&\Z\� \�v\�	���\�\�G\�yvnY����?�O��\�4$~�\�\�(6��w�ͤ\�\�\�\�\�m;xq�\�;\�\�\�\�jF�r\�^�9�ˌwlۦ�l�Y\�w~t/��\�\�\�|��q���\�+\\q\�m����\�\�Wy\��JO\�^\\�kJˆ�\�\�O�+k룝�zV}��_�c�?��\�9�S	ZN6���\�\�\�\'J�~�[;\���ľu��\�\�\�y\�;�*\�\�\'���<�ˤ\r1�;��\�6\�r\�+)�\�g8�k�J\�q��H,J0\��__I2\�\�\���I�׌Ѓt#r*�\�\�\�¦�~Ů\�\�\�n\�֣|�e�h�n��c̛5��>\�Җ6�}	v\�;�s�6�a�$	Gb���\�\�\�7�\��=�\�D$N+v��4�_�f-����\�?bے��~\0\�+*\�\�hEt�D\�p��\�O=Ȇ\'�����l(^��v\�\�o\��\�y#\�\�:\�5qɵU�v~-�I\�>ru�7\�0\�3T\�fg�\Z\�\Z�pX\��\�\�ˀ\��斧ٿ\�e�^�\�Tr08Y9����\�\���Wr\��vvn]\�\�w�Q�m6o\�\�\�ۙ\�PO4�B���N�V�\"\�2\�^�����2q\�Jˇ\�fdT(\�i9\�L>���q�\�%���T:\��dJ��\�Z\�\"�f\"�,��H&z\���%\�\��u�Lj=p\�\��]\�W(^~Gש���c�+o����\�\Z$RJ��}�t��\�\�\�MoO}\�j\�t)A�,uơ�y\�\�Җ`\�o\�A&�b��k��T5�c�\�.�\�rx\�\'Τi\�F��û����7m\n�����\�\ny\�$\����\��s]\�؆\�\�<	�4��K�\�\�66<�\0\�t���,���\�BX�U� j:�����\�\�Nz�{\�\�Q���>d����D��<\�?iG�o���t<\�\�=\�\�۾�Ǔ���g\�z輚r�7\�|���?�mW͘��K.�F\�\n%WɁ$mg)\�Ş��\'�\'\�+\�	G�D�1�zz���r�*�G\�\�z�S\��3a�%\�i�,��\�؊��\�eӺ\�P?y�\�O\�\�\��\�\�W�\�+�H&��s\��	���0j\��{�~\�N�\�\�n&��p\�mF\�\�+ݝ��>\�Lm\�Զ.�\0�\�G_\�TZm4j�q,���d�Y\�*�\r#�xZ�`�+V\��\�G�Z\�\�@\�ѭW\0�\�t\�\�,G�l�<�I5�\"1.��\'�\�3��j\�gow7���\�l�\� ;�\�\�\�\�A[k+\�T��~�(^VEu\���^ZN6#�b�t[�\�:\�a���\��Ƌt��1m\�\�\��6����ŢLU˸\�\Z�\�;\�ߢ�z��2\���k\�g\�+\�`K�DՔe&N̆;\�\�Co�\�fi��\�\� �:{����LZmi\�\�\�s�\0\�t���v����Fe6~\�%\�O�R\�t�s\�\���s��xNP>��]r썗� �͹l#\�&jӢ\�\�#��cF��UQ)\�\�v:�����L:�@bY~\�\'/��m�\�A*\�_\�O	mZ� �\�g\�C\�\�\�\�\�L�<��\�W2b\�D\Z�.eˮ}�ٸ��\�\�:���\��If]���u�Yv\�g�JX�\��xu\�j��4�\��莬 \�x\�iRj\�49B��\�\�5u��;��\�\�js>���k\�<X�����\���-�\��\�\rCq�\�zhW�\�\�\�ƭ)\�/%�h-[H�\�8�\�N�CWK\�]z\�HR7@3CJI\�\�&\�\�2�7�I���p$>ěI�lx\��\�x�\�\�\�,�Э��Q$0y�bN\�÷� �y\�9R�[���f\�\Z\�\0P߸�|.\�\������]y*\�6gjMK{\�Iz�\�P][O$Z�۠�nd\r#�\�mRw�e\�i�m����(��c\Z��V\�\�\�Vղo�9O\�>��\�]��!�\Z�VZVE\�\�)JjQ��\\�l:C�un\�\�\�ZX�\���\�+%!\�O�CWG+\�\�\�\�I&�\�\������G��\Z\��>OeU�S�1���?���ZX�e;/��a��\�C�8\����\Zg.\�C7|�|.ǚ\���m/�!�M\�u�\�\��/�˦�\�H$V��Q�Dxɹ�\�luU�!�w\�?e:kj\�/�D\�v�|\��)\�~��C0r\�\�U/�\�\�)/d3�P$N\��Q \rSՁ-�|ޑ~%\�Z\�zk\�k�\�g�(P߸�\�ϛ�=\�\0+\n9^y~5ϭ��Ţ+o�v�\'\�E�9�Z�\�:�c\�g1r�d�E\'���\�E,�\�JJ\�<���\��\�\�\�s\�u\r)%\�t��\�o\��Q7��\�\�\0�\\��O�m���k��8E�&\Z��j\��R\���#��X�!�dV�|X5�\�\�\�+\�mi�0�֞�8vV��\��r��/m\�+GRY]\�;\'\�\�uV\�iص\�9^x\��,��&L�_d\�\�1��X\\Y�p��\�3���\"�)\��\�2)�;��M\�̥,�\�N2�Ϭ�oly�BA��\�\�\�B\�\�\�Db\�\�\�M�F꽤4dP�\�\�v�\�\�䙞9F��M&j;�\Z���l)�\�\�\0\�\�\\z@���\�^	\Z\�\�m\�\"ZZ\�\�	�ػ}{wld�U�\��\�O�\�\�?\"�˲\�\�;�2s��7��*w):��0��N\�+Gr\��[5n*-\'\�\�y���c�t�\�/	��\��Ii�p\Zg-ö���o�������\�W\�\�鷛ik}�\�s�&һ$)�;�(ҌY�\�\�\�f����|�\�>�0!(�P��&�;\��p* ̯G_���o\�\�\�I\�2\n-5�\�Gϕ�\�/�n\�T\�\�ȉû)+\�ӫ\�!�\�\�\�+oa�˱|>��t�)H�\�\�:���\�5\�;a&\'�\�\�\�׉���nSf.%^QM$R\�<y�\nv�\�\�dÓ�A*9�C8y\Z\Z\�\�h�[k�h�;:z�w\�\"m�L\�&IE�%�N\�r\�\�A\�G4���\�*+�{�\�4���\�-����N���ӈ�\r\�ͭ\�ٽ\�yl)�t��\�^�_ �,\�x\���\�<��0ʆ\�P^1�X\�0�X��lx�com\�Z\�g�\�`�����A,KM#\��Y2�~���|�Xi\�f_I8g�\���*\0\�UTՌw@\�ۉ\Ze1�A��>8V��Qh^P\�^%G.\��\�L�Ќ\�o�\�y摢5\0\��8\Z\�b4�%\�\�\0\��B@���c�c 	���?��5�7{\�J�;\n�����̘{��n}��v�\�z� �l��\��#��������B6=��n���\�Ա=����\�\�d���Lj\0�d\�՟��n\"�S\�\���ټ�Wt��bL�L�0`9g�F���Ei����ၔfgXt\n�\�+\�Ԗ�cC&\�a���U\�\�8j��	�Z�tb\�\���A&7��\�����\�I&O_ʂe7\nG0�S Q\��H\�y\��r�4>���\�\�I�u\���\Z1�`8N*\�K_OBj\�6RV1�@ �/���\Z�\�\�\Zf+�\�\�\�~̨q\���K(��G\�\rW�n�\0G[$\�IgHJ\�\�-��/v\�O\�\0eP\�x\0�A�=.\�I�P1�\�m�t@6�>l\�X�^�i&M��PH��<脏��	�0�\�\�у\�\��\�/\0\�\�KW�����|�\�\�,Xz�*\�\�J�<\r��#�k\��\�\������$^鹯�\�(�\�T\�ãbn����s\�{x?Ř$OG���f�a�1I\�3\Zos<+�(	1}\�5jch)Lv���L���Lt�k\�\�\�s&N��K.�(�Ϗ�P8�\�\�P�\�粞A�ש��/�¼!\�=�\02iH* \���v	p\�A�\�*\�[\�G\�a�&\�8\�\�\�D!��o\�\�1\�Eם�,\��nX��\�\�\�˪��\�&�y�{t����K#\�q�H4F�>\�VHA.�#�ˑN%ɤ\�؅�\\N�4?�i�v¹\�e�JnL�\�?a:�Q)=\�\�;]��\��t�\0�	N�\�@�\�͒�\�5�S���_g p�p\�\Z.a�\�y��w3g[�/�FJ�z��\0JJ�K�Ƣ�~�\�@R�\�Ӟ��\�t��C\�Z�(�\�}\�\�WׯP(�C�\���:\�\�9b_\���Qa��\�\�����(��G}]x\�\��7�\�\0J7/e\�g,EA\�Ƀc�;\�v!\�(\Z\0�@	��r�\�\�)\"G��.E:7<UG�ԩLc\\\�S?\�M3\�\\��ޓ�x�ŭ�b���\�t~�NP\�H�c��\�8p]d���B��2�>�\�l �\�\�\�*G\�\�\�<\��\"�0X(��J�6�\�es��\n\�^^M�\n��L�I���/�\�r\�*�t}�\��(�w��\�}�\�\�\��C�P��h��J\r�yiH<\�C!�?�PHE~X�%�\�\�\�юʋ2�J\��\�E�+��M2�$�H�Kg\�\�r\Z�HY\0\�\���x�\�m�\��\�\�\�d\�q!���b,=\�n\"��b����$��G*��	�z�P�\�$�����P42@uߦ���B��@��N&M\"�(���m�B>O.�#90@*�$�sw\��\n\�瓣Ÿ\�d\�i�i�\�x3nq\�>jx/�Ʌ� �`o\�TH�5\��%*��T��!�!T�wuu/�\�c��.϶I\�e?\�\�@u��\�+\�$d3�\�,�\\�\\6�\"�\�Ȫ\�;\�\�\�:�\�t\�=\�b�N�f�\�Į\"�u\Z�.4��V\�km�sӪ\0H6��$�8E\08�5H\�f��h&�&۞������2B\����4�\�c\nH[r��VR\'\�>\�?@2�t��r\",� ��3�����^���u\�\n%Տ0yKG8U��a1]\�|&3\�q�e	\n^=4e��˃��\�F��<���ZP �JіJ\�/	�D�z|!\�\�:M__\�\Z\��ƑB��>�[���s]�\�\�[}?\�\�|�E?l\�yl;�Z\�\�MT�`� (FTA�SU�[���W�\r��	-{\���U\�W��YT\�\�If�I�񀀶\�cH[RU3�@ID\�#��ͫ\���\�4�\re�\�>Ĺ+Az\��\�̍镨`\� x\�\��$�16\�\0\0\0\0IEND�B`�','image/png','denis.png','Claude','','',0,0),(4,'�\��\�\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\n�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0m\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�)�P@��=l\�!���\�\��a�\�{���c9\�1޼~k����Hv\�w�=:~�d>6	�5���\�\�\'#\"���o��ÌLV|��rY\Z9v��9\�=)�6�.J\���\0�ږ[\�Y��rG��)SL���\�*v�|`c�V����&)�\��D[��\�]ǽN��\�\\g8\�J��\�Y\Z\"\�Ʋ\�\�K�\r\Z�\� VJ\�S\�Z/w\�gK�\�\�$r�iڞ\�ā\�5\�\�7*۞2>��\�\�\�x�U�B\"bx\�\�ӯz\�\�Sp\�Ҍ��,��`�\�i|�\�	$P�ے�:2�A�qQ�\��\\N\�S-��\��\�;o`�\��\'4B<\�a\�Ik7���Jv\�\�tsr�\0�.F\�ݽ�\�[��\0֛)I]J\�\�Ok�2�@g\�\�p8\�\�^��\�~�K��\�U�\�n�P�\�\�X\�\��x\�\\\�7\�=\roA��\�\�+t�#�%	\�\���\�j�\�\�o{�\�\�ٙ���G�{\�)QWm�λ\�DӂU�U�%H�8\�R��s\�z��\�#\�%7$\"r˒��ڪ\�i�\�ڣJ\�\�~RObGNz��ze�\�y��m.\�D��\�\\i\�O��R�⬖�ȸ��K�1ʡ_\�t��Ok���\�\�\r\�\0�\�~\�?�ZߟO)z\�=��{\�FL�)�q\�]U�\�+��2���o�x�\0�\\�\�\�C%Fszjr�M\nC�\�\�Ĳ<R�=�C\�[\�\ruY��m*m�Ar0�{�U�_\�h��\��Z\r�$�\0�	�\��b�C\�;\�*D��w�#\�K\�+��j)��+�j0�N�mht~*Ѵ\�|\�q*\�&O�H*?W5m(�	%F�pXv<\�_j�w�-\�\�p\�V9\�?*\�Я͛?\�O\�V7j�A�+\�\�\�\�Nv\�$2( �	5z	H݀ְc���Ė�\�݇Q[v[Hb0A\0�\�%H8\�c+���\��P}�\n�{#��A\�21\�\�\�?�)\�n\nH#��\�5�\�idyyA@H �H\���+Ѥ�\�q\�Uata5\�\��+&\�\�+�@?7\���F#ʲ�G\Z\0\�\'\�U\0c\0\�c\�U4&�xnw\"�\��\�\�r?\�\�Tu���P�\�\�6\�!F\�?\�f���\�&\�0��{>���x���\�\��l�=��V\r-єf\�rUO^�+˾��\\���Wc�\�\��?\�\�\��0h\�\�*\'W$�\0\�r\�+�\�Q�\�\�\�QR���<\���G\�<y�js&IfX�$�	o�^?\Z���ͯ���`�b�\�E����u-NX\�̃���\�3\�\�\\��\�\�R�0\�\�s\�?5qW\�y��o#������sGQE��(�\�ӽ`kL�ǀ@^N)\�\�\�R��G3�\�T\�WZr\�+\�p�C�@\�p[S��\Z��jR\�\�\�`\�\�x��1�}��\"\�\�vAW0\��O�ӏz\�> ��ޑr\�+(U\'j�zW�Xj�z\\����V\�)\��?��U�\�{4x��*Uy�3���}:\�V�\��>��a+�\�n0:��|ki�-�\�f�\�o�#����O\n�.\�Tg=�b/��*�R��\�ŉ���U\� �zVΧ��t�.C�:U�\0!H����+\n\�\�G�\'{�\�U\�ꯨ��&a�ӎ��}z�\0��\�\'4��1i-L`\�<ϗ�\�W#�\�ڟb\�I˾C�f�\�8\��\nƆ\�VgC���Q\�Kk}#\�?\�\�ghϭu:n\�ji�{òuX\�ʴq4���9�\0_Ox#\�Ӽ6#����m$0\�2G+���iu\�[4���0=K1\�t\�־��Т�\�cl2���dW����V^Ϣ\�\�R4\�Z}O�ީ�\�^[\�\��0\�����A�\Z6\�k�BY�beW9ϧ\�����[\��6��2.ވ��#Y��Z�3\�CXc@�%�\�J暔&�;#8N.}?�оϧ\�]I\�n\�aX�ׄx�\�=NK=C\�f�\�eK���Wث0]CH+�A_?�^�Ѱ�z\�\\A�+�VLd\�V�Ta.m\�y9N6g��H#\�.v���Jw+�v��\�^s!i%��	\'\'��i�Eiz<�\�,_�q^f�)ܠ�\'�l\Z�0/�7{�\�ұkF�[Y���\�iV\\�\�:e�\�\�	PoSǡZ�x\��cd\�\n\�7�\�ѕO\�q\�OJ3W\�E\n���b�	\�08��^�\r9UA_��~=jWG\\\�9YXI,\�r9�\�\�\�*\�\�N\�	/�J\�y�\�px\��G�ǅ<�D[ͧ��\�\�tl1\�{\�q^���A�\�M̨\�\�p\�_GxGY\�\��N���\�A�޹s\n\�RQ�ѝ�*qq\�j\�G\� Яl�\�<\�I\�	�ҽ\�Shm\�\�s���z+��`�\��\�Y|g۫�.#9	\�\�ϣ9A�&vT�jZ-��I�\�`\�6�©�\�\�3,����@\�W���q\��9\�\�\����e4\�4�U\�\�{V�N^�̣\�F:\�ߋt�D}B\�ɨO����#>¼\�\�W��\�\�\�Eh\�W\�\�AV��\�z\�\'��}��$��\��A;.\�68���9|f�)\"���.˓�\�냟L\�Ф\�\��\0�3�\�K_\�\�\�K�4r\0H\\~\�2i/���\�pH$g\�נ\��6�W0�\�r���p85Ӂ\�mu9qj-���\�\�\0��d�`����dg\'\�\�9B\�O0�C�\�Z�\�-��y\�]\�\�\�[�F��\ZD\0\�9�5��v�n\�͓��\�s�v�\���b2{f���+x>\��\04�\�@�\�\'�\�\�XA�\�$�\���f��F��P\�\�Ѓ\��\0\�]\��af�I�\��\�\�\��e\�\������k|u\�,��\��q\�+\�\�;�\�z\�J颸X\�B\�v��y�N�?� �G\�\�]٦��ظ�\�Ѱ9\0��!gU*H\'��\�˞�E\�r��0͝�\��+\��3\�\�-b4���]���\0J�j\�\'I�G�K\Z�L\�u&�\�\��Wڸ\�!}$��\0l�C.r|�!�y׊\�Y��A*\�p\�s��iL`��ӓY\�s���O2��ye�FϨkn\�[��,g�5\�\�\��\r��Ē�;Jȼ^\�\�\�\��­\��\�y>��>�|�Op�,��l`\�ޮr��ԗ&�khs�+p��B@UP\���5Ȗ�$\�\�r�Mj�\�R�l�?\�JŔ0�I#$d\�׹��%4�\�W�4\�-Q�ïjtlC19�*�bW\��4�\��$v\�j��z��\�	9-\�s�\�fkS�\�t\��ӯ󩧼�\�$�\�H\'�V5\�f.�[<gҦ�u��It\"���\��\��\n� �\�\�Iiw�f!�l\�\'\�oOz\�#@�9\�\\�֖\�\�Ky2�T�㨭gMKԘ���KV�\�%�\�(\�\�?*�.\�4\��o��	=~���-Q�\�m����=\�1\�\���\0\�V����\�m�I�{���\0=\�\�H�S[_Q�ĽCL\n�\�\�D?�N\�\�\�|Z��b�\�Ы&F~��׈jv3i�A\�\�\�Tb\�&�k\�\� \'\���\n�\�\�\�eX\�\�뺟�\��g[\�\�\�#�s�4����7ˀA��\0=\�U�H�$��튗t\�>\�Q�``Vp�BR�\�\�)F\��gq�u\�3R][��*��r\rJ��ة9#�Z��H� �#�zW[v9\��*Y\����\���*\�6\��فК|�N\�wg�iĖ��HtVnN\�Ў\�\�g��$\�\���2\�k�*J�\��\�e!�dU\r����\�]\��\�2#�ִ]\�Z�܏y)����\�0y\�;R��\�<cޜq\�+r	-n^\�@\�>\�9pEz�u��X��\���\�cw�}?���=\\\�e�;�x\�\�S8\�	\�H�\��!�*�#1\�ݸ<��\��낚\�jD�\�\�\n�2=*\�\�e�X�ۀc�A�+F\�!�\�\�tp&9��$}}k�W�v.ז{�ޮ,�Ax���{>�Z�.�rQ˽>\�U u�\0\�Wau\�N\��Mc�Kqh\�\n\�P}I�\�\�ڹOi���\�\�}\�#k�J�3�^��!>f�f\�Y\\\�{Ib��\�y\�j����\��Nx�\�c��\�\�v�%�\�\�x\�\�\�M%�\�\n��C2\�I?�\�iNې�*(�^9=x�L��I��	)�\��9\�Md�\��\n\�>f͟�\�','image/jpeg','delacroix.jpg','Eugene','','',0,0),(5,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0e\0\0\0�\0\0\0���\0\0 \0IDATx^��y�U���9Uu�۷o\�{zKg\�\�	Y!!,a�UAP�qw�\�\�q\�epFut|�Ae�%� 	\�\�\�I�ӝ\�׻\�u~���7\�@\���t:�֩�>\�\�y\�s�s�Z����\�=mѡ޿\�\�g>9w�\\�, �L255I2�� %�\\�d*�\�\�X8g6\�]������).Z���\�0zz���\��\�\�}�<��\�_\�\�\�\��\�=\\r\�j��\�\�\��u\�����f\�\"\��\�\�\\~\�Z\�\�b���}�d:\���O,\�×>�A~�\�\�\�<p��s:9\��\�	n�\�j\\�\�#��eߡ�DIʂ!�M\�\�\�.322̞}�I$R��;\�3�\��\�+ξO\�	\�o�\�Эw��e\��$\'�?�KDo���,^��x<�\�\�\�L��Y`zz\n!\\�a-7�\�jn��J�~?A����\�4\�\��\�K/dɼٌMN\�X[CY�O]uA��]�Q_WMwW;�B�\��\�\�\�+Σx�\�EGK;�����\�\�\�c\'���z\�\"\�j*9{�\"\�?{%�\�>\0Rr�\�u,�7���\�bŢ��I�\�p�\�u\�&�\�GE8L�_Fdf�\�\�xGrr�o�Ǿ\���3ކ=gL�OA\�\�ӝɱ��K]=g\�܊\�\�L\�L355I>�\'����ΰv�b���\�7\�\�Ҍa\�\�=|�\�\�q��h\��hkn$O�l�\\�\�\�\��:\��݌LL\�v\�UU�\���~�\�aAW��x=ϙ͎��z\\���j\�¡2tM\�\�\�K\�\�E��/\�d\�\�n\�,[�&��SSU\�\�\�	|��c�f`J�X,F:�!\\�����\�\��\����\�\�\�\���\����2ߎGgB\�\�e8S�\��_��\�c\�g�K\�\�;�]]s\�f�$	������\�}�|\�˟g���x\�n T�\�ٶk/\�T�\�7�c&\Z\�w\�\�\��\�clٶ�t&��ΟCmE%���`�K�\�=���\�JF\�ش�lj*\�in������P�-\�v0���׮\��� \��\�\��$Si\�j��\��\�BH��\�\�\��\�\\ɇ\�}\�T�L:M6�cff��\'�I$�,\�^���\�S�G�ٳ\�k>v϶�f\�\��My\�\�}W;�\�/�\�D��\�\�\�\\?w\�\\F\�ǘ��&�\�135EK}\r\��\�gY�j9�a �\�\�\�\�\�\�\�z�0k�/\�\�vq�CO\�T_C6�cۮ},[0����pY���2^\�w�}���b\�|j�*\�\�d\�%4\�\�P^����\�\�˻�R_SE[K#�my	M,\�K2�������r�\'�@�b\�\�wu.��\�\�MӐR�\�f�y}T\�\�095Q��N7�ٳ���kj�\�\r�՚���\�ޭ�\\�O%�^]]]�h\�B\�8�x��Y ��xN\'?��\�̟Ӊf\�AB\"��\�\�go~�\�Ul۵Cר�(\�x�)�\"Lir�\�/\�\�Ǔ/�DeyC\�\�LGb�d\��E4\�V��Ǩ�#�T*M׬f\�\�d�\�G(L���\�h�Fe���\�:�/ �)K�&��������\�n ��\�f\0p�t�N]m�,\�d!Vjr�k\�\��\�\�\�\��W���*P\�\�ّ�L\�l\�Z\��y\�!�F� �X������[(��!\�\���BIi�\�\�\�\��Ǎ\�4.>�lr�\�� B\n&\�Ƒ�/\�\��	\�B^��\�I\�X7�\rw*N\�믓��`�s/\�s��K\�=�X\"A4�\"\\N[s#�a�>HY��(0$\�\�\�\0�\�t\��2R��B�B�DH\�5�\�\�Yt�wԚ�\�\\:��\�����\������\�|\���\�\�\�\�\�=/~Q���\��\Z\Z\Z�� �J�J&ф\�\���9�\�g)\�\0j��\�\�\Z\�\��zhojD3\�m��\�kP\�\�\�\�\�Gm\�Om\�ˎ�\�Y\�\�Lg}5;���i�fv��\0>]\�m;qI�T2\��\�gͪ\'�NSQ$\\d\�N�~Ja\�Y$�_%�\�\��9�Ȃ\��]�p{<�3����4\�\��\'\'\�ې4F�z�?u\�@����bP�^w\�T\�����\�\�s�\��;::���a&2C�P �J�\���sV.GM�\�L\0�5b!�3\��l\Z#���I`\�2Ԗ����Ɖ&S,\�\�\�\�\�Y0�\�\�\nB>��Y>���\�(e>/[��P0Y\�\�F:�evC5�W!Ü�\Z>h\Z躣��X�\�6�\�\�.7�\�\�\�X_\�N\��x\��\�bQ���uhBc#\�a�\�\'FN\�\�/����\�X��:�tl\��m�Z\�\�Ν\���4\�SS�\�jq77\�p-^�[)��m@M�R*�d>��\� \�QȦ�T�I!q\�\Z\�5U􎌳i\�\"��\�\�ڈKטU[�iJj\�e<��\�>�&���\�Y�h\r�x=A���׃!$\"��l�D3\\\n�cR��%��&\�u��\�&v\�\�K$�\�e�2�,\�t���f\��X0:3�[x\�5�Oxm\�M|z\�s\�%���7==ymbz캚\�\�`WW�c�LNMR@�\�d1�\�\����P ���8k�\�1#�\�̦aj����W�@�&H��\�rn�t��+V/%�/p\�[��2\\�f	᠟�x�]=}���]\\�Ay\�R�	\r��\�\�s�\�4\�\�(d�N\�\�\�\�~J4!-T\��3���/}��i2\�,B���n\�rY:fw�	.\����[\�\�\�;�w\�\�\�Oϊ�\�m�\�v\��\��\�\�U�M��\�\�\�,gng�i̷\04��\�\��(\�\�\ri{@�UX�0�\�\�m\�IGC5\0��x\�݀D\� \��rlh���::\�k�7�\�`鼁TVJHD.\�	\�$�\� \�/�T\�\\Z\��e��t\�z��&)\n��IY����r��\0��{A.JM��y��A1<�\�\�|��kv��1<4L&��l�\�ōW_��\�`�\�*Ҿ.\� 2\r��J�6jV^\��miqF\�5\��\���A&c	�ns[\�)$!��\�W/\�\�6��Ṳ̈̌S�R_	�,D� �q��\�{���	���k�d^G\�X�L*\�\��8\�\�\�\\n\\.\�\�4mUϓ�\��\��r\�n���^W4766�ͦ����T2ɺ��\�\�Pخ���I]\�Rh\"b3\�l\�Ri[��p\�I8L�\r\�l���ӔM�n\��t�\0�aX�\�f�����š�T��GF&�\�:Dya8��*l�)i��\��\�\\A!�\'_ȣ\r�˅\�墡��l2\�<��wH\��H\�b�i\�[g�QV���!�`摀��u�W\����*�tdΖ[d2\n\�B\ng��\�lҚ��q\n@\��zx\�ՔT[BBeY�+\�,LK��\�L�Hu|�bcV�H�(\�!6\r��#J�(�\�\�bE��_��\�K���\�e��\��\�imm�,l\�&#�\�+?l\�\��r\�Oh�w,�zݡp�)%S\�SLNO!��8�ٰۚf�\�U�h�P��.��dSqJ\�\0�P��4\r,\�%�\�EbG\�\�|�b5�[�G\�\�\�\�]�Ӷu-��B1YH\��l���!%Rcy���O~\�F���\�</�`�PY\��x\r!6{��xtƠL?X)�\��|~ʂeM\�r�\�5\r	\�c16mX�\�\��m\�� ��|^%�\� �\�,3��SH+ki$\�5���\�Q�2E�\�Q\�\�P�\�t�D:��\�XfOZ�H�\"[6�P\0�65p\�5\�	�\��c�\n\�Bex�>����\�SgHgJ\�u\�B~qMu-�iB2�$�˓\�d��q\�\�sm�a3�R*��I\�̦6\�Ri�&c�m��\�Fa��,�Z�\����FՂiݵ?-\��4�\�i\�q�684�\0s\�]z!U� �|��H�\�\�a<n�\�m\\<\�{��3�3\�\�]\�e�������\�i\"�&�t:\��\�&\���R\�Cy/��I�M\�w��\�QJ\�dة\��Uuؓ�}�,\�ql��O�H�#\����n\�[[\"��rӭf�X�5��\nN;uNG;K�\�N&�H���d�\��:q0\�\��\����¥>��:Tӑi�R�&$K�\�a\�:E�e\Z���|L%ݎ%�V\�8�۾\�bDQ�\�X�X�Ye�s�ݨ�\�>8u�\n$��E\0\Z�@\�\�T~i�\�\����b�\�\�\����H�H)\�\r�|>OyY�|.=���3�3EI�\�w�\\n���/�\�a�`�,H[K�cilrC	\0�Rc�\ZH˿��K,S\�TfI�BM���%ƶ���K\�l��5����v�Z\�\\��H)���S�\�%ǬR�f]�_}~��B6�\�㣡��p�̂��Mo�\�I΄\��ǋ�\�y��1[�8���)\��]�&\�R2\�\\V�\��6\0�Xʒ��od.\�.�\�ZwX5͓\�Xa\��\�\�R\"?C��oՈȤ�VX\�tXHe�L\�X]n�gw�\�dȤS�RiB�2@TzBU�F��zF��3%�JT&#\�\�F�i�\�L��LE\�p$kN\�\��|�t�\0l�u�\�[�,�7�RoU]2yc1\�\�C\�\�C1��Eؠ\�$\�I\�\�e搙�uEd��=}�����\�\�\�y�G�1\��\nojz���#�*9:#Pd�p��͵��	�x�L*m�-�x*M$W\�\�o{Qg\�t�K#d)K4\�.`k�\0Ǵ8�X����\�Y�Jk�\�\\$�\�\�fI%�����J:j\�\"�\���dNS\�B�QWSC>�\�4%�T�h,ʬY-��\�l_�j1g@o\�-?҈�,	�\��UUU\�r\���\�44k~\�ds\�\�	��\�DZ� %2�����FCl\0p\0�a��t]T�*\�\�PI��\�L\�X�xC^\�\�\0i	C6��(j�f]\�ֶ�!����`�h�FeE]\�	�ø\\\��\�\�\�΀\���S=\�y�\�\�\�\��\�r�hll���\Z�K\�Ed�9b�AI?{��YP{p\Z(Š���8�5\�ӀP|=}��\�ε����.�%�vN_��\n�\0!\�VB.MQ�,wZ�\�v\�^&Si4!0MMh��\�1t�a��Ϝ�[���\�\�\�XX\�m�t]�y\�\�\�\�D\",3�\�\�&��b���+)2�E�\�\�,N\�\n \�y�biiWb�m�2%�\�QY�&��Ҵ�qȩ\�F�\�a�.	h����I#�\�^�J,Q(�ē�C\�b\�\��4�\��\��\�r��L�\�q���r\�Oh��_\�@�~�\��\�\�\�\�Ә��\�\�z\����9�*Ғ�R+%ҩ\�\��q�{\��MޛrY�\�ɍ�\�:J�Y)�3aẃ\�A�fK\�P�\�$�<Rb�I\�V?lA۱�\0n�\r�-\�\�\�AY0��\�\�^����W\��]��Ge:2q��i�\��&��D�Q����暡31=M�4AJgB\�f�iB.s\Z&o$��iPvA��n`{f���ӒN��Z�[:Ro\r�\"L\�\�=��\�\\Fe���*�\0���zz�z<\��e�@&����	�\\;\�t\���\�\�[\�[�\���\�\��--��\�0�D�\\.��\���\�0\��t�ށ!\�|�\Z�-Mj�\"��\� \�U:��\"&\�D/�\�Et�غg��q�\�.[km&;F\�\�Ն⴩dI5]\02�\�\�\�wY2���&�\�\�q{�|*o&�����` ��\�UG���k��sJ6]�)紶�!\�r9jkkq�\\�A<gjf\Z\�\�\�&�\�\���TaK\�@�X�Y(j�s\�\�\�:4\�@�\�Xs�t��\�h\�i�;p�\�C���\��\"x��TKҪ\�\"�\� �Y0<jڱ\Z\�J\�~i\�.\�OQ �������\Zt\� *עã�����hBσD�rUTTP]]M(\"�H055E>�G\�\r2���G�\0��tT��\��#��t�V�%uv\�b�(����`���\�p\�H\�S%���U�$�,�\�\��T�`J�G؍c��\�>�:��߮	)%�\\M\�@uU5f.\��VT�e\��-A\�\rw\��M�B���1&&\'(���+@\�u�G\0���\�\�B�9����I�cVl\��ʗXJ�v\Z�mpdɥ\�\�\r��J5I#����\�i\��\�\0&�*�Ȧ�4ќ�(���#\�898\�l�\��\�\�;y�D*IUU5@��kyz\�u�5b�`�\�\�$S\�\��Ď+\�syB~�\�\�q\�-�&\�|L��\�Y�\�)�\r���ȀR.J~e\�:Ś?�KqZ]%\�+J���\�\�Xu\0\�\\\ZY\�aZx)��|�m;�(!E3j<\�d��\�!\�锪�����s�	y�L&�\�\�\�ON�$$\�t�+.XOc]��b\r	iutpFn�GSNMhVYd�\�]��\ZH\�Z(� Jk�hw\����\�\�\�\�v>RZ����com&K�I�˫�c�Ԙ�D\���v��\�\�H��>\�\�\��@5È����R\�f\�Tg\�#�#\�\�8p3_�,\�\�\��\�\�eXGzl��i5j�sE��\�q���R���Ԝ�bh\�\n}�h\�\���\�ҩ\�b�p\���^\�m��\rDI���N\�\�f�\��\�\�-$�)\�*R�}q]$P��\0f>���[jJ.�LJ�N�LLL�\�劦\�+�pͦ�t��:B--�rb\�/\�=�;��\�\�Ѕ\�\�\��X8����tMGhj\�H\�V�~��ٯn؋\�R��4\�]�zq���\�P\Zf\n�@\�af\"QN��\�\��k��(/\�\�ҙ\�֊�Ϡ\�r\�\��\��#-s~���\'\�,Z\�\�@Я{�#��%(�T��\�0\\.;�rQ��<��\�}W_�\�0lY\�4Mz���\�SO�?�#�S%�\n\�\�V��\�\�L[c=�\�gɜN|^\r5�4\�ՠ���%\�\�V�\r�\�]��\�B��\�\"��\�$�L1<>\�\�\�zzy\��mdp��ʹz�|��\�8\���A�w]pw��d\��>�\�T�@�\�H?�\���z\�\�@1\\q	C�l�\�>���t:ͼ\�\�4\�\�b\"�^ض��\��]v\�\�O��\�\�3����\�\�q\�0;\�wO=GE�����ֆz��֛�\\T��\�ݦʕ�ZΘE1�hk�\0!\�P�)�\�<�\�+\�΃O?O\�az��\��f�	��\��\�7�����\�n�\��\��x�t\�<�\�<^�3\�+ϴ\�?*<���\��dd|M��E#��`\�Heԁ�5�j&O��C��߿�5�D��7�\'\0ʤ\�R)�\�w�\�\�\�\�C	�4�1�\�?<\�\'��\���LG�|�\�\�T[��k8Zc����\�#,M�H��\�\�;85:γ;��&���\��2��\�\�T�N\�\�1�L����G�����Τ��g>�\�\�a\�Y\�x⹭�\�ځV�\�\'R�i�)\�[;�o	J͜%ѩ\�\�G2��\n�I5D�ۨ!Y\�\�iy-���A\�(_�\��\�z*\� 6��\\�v%O\�\�\�\�SC��249M*�\�\�\�Os\�cO�pvw��1>x\�&\�\�RGR\��e\�7�\�N3U87\�fs������\���ojK\�4*�~�Ϣ���\�]\�,jk�*T�G88��.>k1��\�\��\��<��.\�HWG\ru5MFp�߰\�kip6�E������4G���6�%(���\�L\�\�h.�+�:5\�� \��x�HJɢ�sY�b)\"�%>>B�T?\�X��\�R\�\�P\�\'.��X*\�d4N$�\��\�(C�S\�:\�G*�\�f���GzO202F׬f�-6\0)�\��m��\�cӔ��\Z\"�Jr\�YK�Bb���j�\�\�h���\�vQWQN8�\�u���],\�AcM�]q!fЋ�\��X8g6�Ͼ\�\�x��\�5AS\��\nM\�=>S\n���y\rKbԅIEy�\�gł�<T���\�T;)one�D�\�a���T�t�@<�4p�(+���<\�2$\�p=\�~Ú\�\�p{h�7\�y�\0X\n\�0̎\�\�\�\�\\>���\�ǉNL2qj)M�GJR�<3\��l�H\�df*\�4�!�\r.A����\0�p��j��5��\�˗��[(%i	�@��O\�+�z�r�XHiU*1�\�K[�S\�6���m$��t��݇�8p��t.�\�\�\�\�� �\�y\�\�$�S3\�IM�Ǣ\�\Z\�\�T\�qi���\�t�O�)��p\0�a�R�Y8�	VV��ƈ\�DH\�r\��\���IfRY^�\�\�A�Y �ˣk\Z\�d�T:M�\�bټN�\��	ۦ9���\�\n��i\�Pi�\�e�H\�\��Fo��(��Y%\\\�\�4b\�4S�\�f:*.!�L�\�\�;x~\��:ڸ�\�kh���\�\�(d�\�9�i�\�2\�$�ϓˤ920Ȟ\�\'\�zr���U\\T\�H�=��;b�a�\�\�\�/-\�#\�1!M\�=>�\�;\�\��\�\�B�]��y�f\��z0M\�\��	tݠ�\n\�f\�\�Gy\�?��\�a\�\�y�^l1�ԣ(�|^-$mɑ��d�t�\�W^�\�\��7�Ţ7�r�\�|�1��T�$���hRJr\�,�WI�4�\�e��\�1֯<\�.�:&�g�\�\'��\'��odng;���N�+>�y�\\6C>��`1�kjbݪ�8>4\�+�控^\�V1������\�1\\8\�g�\��D�\�\�\�vRW_χ\�o���!!�Ja\n�<��\�*����\�5\�>j��X�j%=���\�\�\�}\�(7\\���\�\n\��$\�1=����&\�h�d:�;X9����\�y+��D�ʧ����\rQB\�\�z\�m\�c/=qSbj�՘�./���uu�T�+��Y�\�b,�?���? Pu�\�0�?��\�\�V\�_w6�\�U�$�J��\�\��M�\�f��YO3K�\�\�,\�\���Y���>\n�\���\�x\�m\\�|�\�v���|�S\�\�\�D26���t�6\�\\]�K`1�\�\�o\�\�Ƶ�\�\�lG��\�H\� {��+\�UTA\�G2L)�y\�lX��\�s:у\�`�\�\�\�\�\�4��j*\�!���\�u#�U\�P��48\Z�06:J6�#�N$I{5�I)�\�\�:\�\�w�\"4;\0\0 \0IDATg�j\�}?z\��\����ͩ�c\�l�U\�\�\�L6�edl��\�q�kj�\�\�7\���\�f2 s�\�W?\�\�ufbq�\�}����\�.�ɰf߽�b\�\�}�5ԑ\�d�}\�u�\'\�$Ri\n��L�T:ME(\�e\�W\�q�8\�\�\�\�?�5k�������I\�ٲ�=\����,W�\�\�\n�P0�\�ذhW�]NkMG�yr�.߸�ΖfN���u�~��$.à�,�&4�\�\��ճ.�B�t&�\�e\�sr�k.\\OUC3:HI._\�\�\�>@\"\�\��\\IY��&+���\�\�\ZI<gpp�\\6\�\�\��T�e�P^V���z���*g\��\�\�_�\�\�\���\�Y`ϣ�Y:3\�w����\�\�}㫬X��L&\�\�\�w\�� �my�l6\��\�(u\r�؇(����)F\�\�i��c\�k�@\�ٴaERJ\�\�\�ġ\�G\���N&f\"\��/uM#�SY\"\��*�\�x\�n�Z[�⼵�\�\�l\�{�ScS\�L�[/;���Z���\ny\���S<�k?�>IsuS�$yϕtZt2�!�J�\�d�`*%k\�.\Z�\�㡾��s�.�\�\�G�\�\�\�e\�\\w\�\����\�r���5K!\�9Ģl6�b�\�\�H��-ﻞ\�|�f*ʕV\�ܳ�/~�ە\�N�]����l\�/�Է�\��\�t!\����?�_y��\Z\�\�u:\�fq�E��{����H�\�\�C\ZBr��\�r<n/��i3\�^\�\�\���Hu�\���\�^��+���L��|��@�l��;{%+�/a:+��sLG��yڛ\�\�u�\�\�\Z��8ɞ�\�kn\�o�<�E\�T�	|��\0�e>\�4ճf~\'GG\�\�;�y�WrβE!��\�x|\�NFcIF��\"���	oU�]z1���f�ں�\�ˁ��(���\�6\�\�W���D�=\�\�q^|�5\�j+����\�3/\���\�4�t:M*�\"�Π\���U��7������f|r�y]d�9�m\�\�\�\���~Y/�ij��\�ZY\����q\�׿�\�����\�\�\�q��\�Z�x\�z��<�t�@0�.\���\0|^{�ؼ�U�g\"��B,]ح\��\�\�/P�\�\"�^x�<�vt��t�5ĒQ�Y��\'`Vg\�h#n��r��a\�z� �J��\�P_Y����> 4�\0�\�bnK=�S�^��ƚj�.A\'\�\�\�^\�X\�CZ��\�$y�\�\np|$J<�d��Z[Z�LN\�XW�\�p�L���6?���\�w�ԋ��\�\�W���h\�\�\�\�v����⶛\�\��\�}\r\��N�\���9?�\�N\��\��Ɠl:=�?�\�k,�\�\��Re.�\�nh1�f���vq\�}�h\"�7~�k��}�\���}�}���\�o\�E0PFum\r��#��4��\�&���45�i:\�\��,dù\�\���\����~�@%\�L�t!\�@�@�x�T�@[����:\Z\�\�c��M��\�*z�F�\����\�.�.\\F�!�\�Z�\���A\�\��\n�nP.w�T\�5P�\"�\�QV��\�\�C-\�?�&ޗD�2\��y�.7\�MMThy܆=\�!��\�\�\�D0���\n�^\�b16?��t*\�՗m\�\�\\\�\����F�\�o�\�\�\�\��K.�\�<�++��\��_�6��z�@h��N^ٹ���K\�\�!��_�̧��c���o�??�>_�\�\'x\�=d<�bтyT�\�1M�f��k�䁧�\�M\�2t+D!\�n���Ntt���\�\�\�A�_06\��Q\�\�\r��<>W�\�\�SS\���B\�\�\�5�\\\�d(>C.Wp��Tz-tHe��L\�\�Ԁ\�\�q\�\�\�	\�i\�^?U�����7\���	\�t\�\�s�C,k�G��`A����\�/:�����\�M]M���v\�����\�p9�����\�_�>$w�\�?R_FJ����\�]̟\�ɾ��C3�}~��~V02\�Oy����\�w��ƥ�\"\�\�5+�\�w�\�?=\�o��\�p����\�\�cɂn@R(���.`br����\�R�	�y�\�\�<�\�s\�\�t<����;��|�GO���K\�,��u�F-�\"\�$n\��\�qYl.�]�\�>��$�J��h+;\Zg\�\�0Ͼv�\�h�h4�p�~K\"�\�\�A&&&�	zݖ�,�o\��\�$��\�\�g�\r\�\�{\0�K.8���z\�\�Av\�\�\�>�܆�\n\�\�\�hepd\�z�mACw{j�\���\Z\�\��D	lݵ�o�����%h��⎻\�e\�\�,�7�\�\�!�\�Xk��QA�\�\�\�\�\�w�K\�?�Ј\�/)%^�\�-W]���=�7�&4C/J?���`�����T���&@A\�i���*\�\�\�4}�#4\�T�\�y-\rt6\�R*�ER�\�5��\���i��X\�$y���]{\�\�l\�p)\�Y�9\�s�`�χn���ޓ���{i��\�\�\�s\�\�\��\07Zo����T�\�j5]�քI \���imib`dP��k/\�����5~��oP\�e9\�s��\�T��\�;K���l\�\\:\�\��E귐�L\ZC\�p�\\x\�.<.7n��ۍ\�\�\�\�v;\�.��=��21=þ#=�w\�jn<o\r+�\"�L*�\'�\r>�����\�<��5�ɴ�M\���ڵ\�w�\�6�]x�kg�:�A����$\'��y��Q\�ZԭFi\�E$��\��m�4\�\�q�\�f6\�\����\�\�k�~�\n��#c��4ّ带Y-220$\'&�\�5��\�O�̤Y�b	���Jf\�j����Mg�\��-\�3���\�\�\n�\�؅Y0Q\�v$BJ:��X�h><�8ӑ��\�&\���`?,dyR��*E�4R\"�df&\�}\�LG}5ל��Ά\Z����\�V_Ե\�\�\��Z��ڀ��y҉\"\r�҈\�fT	˥�n�sZ��O\r���Ǟ\���ikV/��5\��#=D\�qf��Q_W\�[�g\�\�\�VVPSY\�{/;�K֮\"�ɰ��I\�f5319	����hf!�G\�\���X�b)7�kf�~Y5\�2V\�\�Ⅽ�P�`\���g81p\nii�Dy#\�\\FwG�y\�l߻i�\�tY\�;��\�xQ\�2\�\'@�贔�\��	~�ПH\'\�\\�~%�f����HUQR��?,q�tnذ�dt�{}�\�I\0G\�J�\�:��\��\\�|6\��/m\�W���\�\�s8���\�V�\�\��c�Ri:Z[@�ߺ�\�]�\�Ω��\"\�5����Ks��a���Q5�+\�954\\_YQ\�\�}\�&d:Q\"N�\�v\�\�\��\�\r�{�\Z\�kx�h�\'�\�loU!~4���a\�\nꪪؼ\�UN��q��ET�����\�zmIvZ�H,\�\�Ͽ\�\��\�o�e\���=N1)M2�$щq0%޲\0嵖�����\�\�\��\�\��\��?2���K\�YM(X\\w8�\�\�XK\�Jhdd����\�t4\�\�\�c\�\�v4+J*�fp\�\�)�<-�\r<�\�K\r��\�_\�O�,�\�U˜�n��\�>|#TT308�\��)�o�͋ΚIL��LLN\�;\�s�y�\��\02�\���\��77nX\�y�:yt�\�UW�H&9x��7�k\r\�ڕ]\�X\�\���\�j3?�\���451�����JBA�Ś\0R�\�\�\'S�LL�\�HGO�\�^W\�߾\�<*C*6e\�\� !26\�\�ؘ2�\��.�\�Z�8�T�\"\�\�\�sVp^4�\�^\��w�\�=twu\�\�\�Ju��׃\�\�rG�B�D�S#c\�:x���)Κ\�\�-\�~��\�f�]D1\"<5\�p\�q\�.7�Z���\���\�^}1A��\�\��cn�\�Ǹ��5�\� p�8|�8�S\�\�H�3F\�\�u�~h_����\�\'�yM\r6\�MM��fӲ\\�~5O\�\�ã��\�>�M=F:�\�\��bEڋ�|-\�ՋY5���\'N�g\�>f��0y�0�J�1�yܺ`vC�\\|���]�#��0g�	\"\�c\�|ы3\�S3x�tCs�^�y�עiP.\�#�l�wd�=\��x�\�\�$Rx\��ֶ���GǤ\���\�k�P*S/>\�}\nY4���\�+\�\��\�`\�\�c�,]���\�^�\�L��?�+\�ϥ��!%nz�� �H\�9�@\��s\'��Y��\�P��\��P��]{�K\�_�!�4�\r\r308\�g.\�\��\�$�y\�e\��u,�?�_�\�>���3==CcC=V�ib\�#\�A�\�P��t��;K\"�!�ͩ����j�\�\�u�^��ף�&�M�k��\�354J!o2OR�ە��D��\�	���eJ�&\�\")q:s�\�\�j�%�ɒ\�d\�Yn�3�e�=n7���\�שx<�0�R]ME��\r�\"��\�5|�\�u\���{Y\�\�\�e+��\��\�74B]u�\�;4\\��k3�x6XӸ���#�\������\�R2�}\�F\'��\�C/\�O\r\��x�y<l=x��\�\�S�|�E\�s�z��\Z\Z&�9�@X\�\�g�ҷ5��\�\�*����\�\�J�k*h����:LSu�\�\�2B>��YT�u��J$��(\�D�\�H�_ڮ�\�5\�>?\�P���lF�~��\�\�T��\�\�6����\�*�?�4W�몲\0^�zy��J6\�m\�\0\�h��\���F�;��@�\�go���9]\�<v�\�M�\�wpP�\�n\�\�lߵ)\�:\�\�W\�\���8oÕ_�;v\�\� =5A8P�:�c\�\�^>x\�ux<nꪫq\�L�l>_2h\�-��0\0�g�p8%1\�@��\�V�\�p�+�%0&\�x�L.˽Ͻ\�t<Eec#��24��n֫8PP�\�(B��\0+�C\�\�\�t��V.!Md&^��\�0��\�0\0]\�m 5�+/\�\�w\�ú\�mS�r���\��ر{n_\���s/=��;��\��\��VܙH&��\�?Fcs3?}\�QN�˨�Ӥ2��\04]��,H$W�I��V�\�\��c�%\�٥.�F:�\n!�� ��X%HI.�\"��\�˻���h\�9T6\�\�\r�qy<\�\�\�0�}��T�\�MK�ݒ�m��v�h\�PE\�eK`��\r�\'N�ᜳ%\�e��T6O,�\�\�\�(?}\�Q\�u\�\�;?��T��q��;�k�Pb3\��+�p���{��M)��7r\�#OI���fig���\�\�Xm-MD�12�t���	\�~W��:lQ�����\���\�b��\�ŸD4ζ����CO\�\�\�Ȓ9]؛��/l�\n�\�\�N��f\����S�_\��A\�0_\�.\'\��`&���\�\Z9\��\�#,\�ledj�h2\�]�>ŭ7݈)\�ܳ?\�W\�\�$�\��b���\�Oh.��\�|a\�\'���^��\�04>�\�;��a\�<\�����\�e3\�cX>\�b�\�9\r�\�\r�\�PԠ�\�:�t�\�%\��Zb���\�~� \��O�F���j)�\�[�NC\�i�\�ĤrX(���_�J\�\�-TN�E��R�DZ��\�\�\�4\r�\� �\�r\�3\�?����y|\�^\�&Y�`>�^���\�.��n�\�m?\�<\'6倲�\�n�\�\�@e\�_x�ՙ��\�n��\�O�d\�|b�\��u|���\��~\��<Aee��\�{Ol\�\"u\�\�\�g�R�RnX\�~Sv�%N\r���ȁ4\�\�p�՗���$ߟ#)Q\�i\�Vv�8[\�EAqf�\�L�7��\�d4M�\r��U\��N������H�G7o\�\��!�]~M\r5\�ry�.�\�W��i~�?��¶Wg����ᶧ�\��=;�r�k\�Ol6nl=���t��C�+�,䪋/\�\�g�\�ՃG�]��O�\�\�\�q��	b�\�us����9M#\�����F�;\�\0\�\�ˑ\�\��#\�o\�?>N.�\�\rk�赗#��>G\�\�I\�\�\�\��N��\�j\��n�\�8\�Ha\�fZWJ\�\�~�\�g5�����;~}/\'ٹg?�m~�\Z���Pwo\�\�h,����K\�\�\�\�?�/r�<V^\�����\�w��\�7�\����cz\�\�\�\�щ�������s\����G�����Y\�m|��X���\'�}�Ɔz��\�\�\Zk�B�X\�,\�b\�6.@�\�\�{JZE)$�%sf3����C#\�>t�Ϊ\n��*0\\n���\�?u��\�R�8�å�T��J\�F`\��p\��(\n�\�t�|~p{Є	BJ�\�{?������`\��\�\�ryNLE�\�\�\�?��\�954̗�q��%^�\�������\�ⷧ�����\�?�\�y��\�\��f{K�o�\��\�+,�V\���!V\\x\��\��\��2��Rb&c�\�4*2�Ἓ�4��\�.��R\�=	\�\�`o���9\�\�\�?\�t-ݳ;\�4�d<�Y( � TSEyU�\�}:\�m��\�x�3 O\�\�\��!K��W�/�\�		�D��\�kXs\�r~�\�PW]\�V�\��ۿO\��`�_[r��\�\�;�I����g\��ŗ\�x��\�\�N�\�\�|��W*L\�s;;��;\"H�3<�\�F\�\��\�\�oq&~�\Z�(�z\Z\�!A\�@eq��\�+�ޘ�~NqM\�*ظr)�� Om\�E{U�پ`�\�\�fBU�\�F邯\�6I\�����<�_�m� �kHMwo	8r��_\��[\�]��+6]�\�\�B ���\�\�w�_���#c�=����c\��y�\'��\�\�\����:�l+�z\�\�\�ME�G�F�\�o{u{\�\�>\�n\r�5�\�/o\�x\�I\�_w6�͍\�oY�R���L\n��\ZX\�_�5\Za1\�R�\"P*�\"\�3�pn��\�N:ۛ968BCU�ʺ:*\�\'��>*���J�*i�\�J.\0\�*\�\��S	�\�/Ch�Ԡy\�\�\������v\�\n.Z���h�\�\�m\�\���\�o\�\'�ɽ^׵��/�\�\���?�\�\�g~�\��\�_�\��\����\�p��x��\�m{%\�\�ڢ�AOo�|���n�J��)u�\�`\�ԠD	��b�\�s��`\�1���V����d^\�,Z\�\�&x��M�\�JM�\�xU�X�M�\����\\E)rjT���<NUBp����i��#��\�\���\�N�\Z4\'���n_\�@E�\\~���?v��MV)E\�m\��/�0�\�/��\�l*q�,K)5\�\�\�\�민\�{\�~�[�\�% ����L\�r)1KS%Ա�6%ŀѶ\�e��i\�Sm���t\�t�Xa��\��\�%]�\�\�U�Ryv�G\�\�w\�gxt�s#n_`JJ\�-�0��\�s\�?�\�_z�\�|j�3�3Ŧ�o�̬\�\�{j��毨���\�\�g��w\���!sgw\0�|Bt\Z\�1�_�l\�0\�J\�S\��?\�\�\�\�pn;�Xd�+�Lw�\�\�m�#��wa\�8j�B�ˊ`x��Qn�\�\�x�\��\�v�\��\�L\"f\�n�Y?g�\�+����w@o�f�7\�\�w��\���\�?\�z_y\�]G����\��A\�ـ%�./�(�-�%��a�4\�\��m��R\�pPr8V\�d\�AX�\�ٜ�ഩ&��:(�C8\"��:�z�\�\����p\��Q���\�V�\�\�ql\�S�\�};�\�RqC\�/�\�n��9��M��\�\�̓Ͻ@&�-�k�(�\�\�\���},�\�~h\�)\"�@1\"�C$R\�0N%Y\�R<m-�\�7\�\�m�X\�\0��3\�v�\\6ǳ[��L�N5-Z�0%�U�\0H)�\Zno�cO=c\�G��=0]�\r̛\�Y_�5��f�7󘲀�^\�l��\�)��\��\"igV\\@J�y��\��\�%\��\�\�$�\�WGپd4\�\�\'�6����v��:�K\�/�\�u�\�0oi.�J\'G�\�2\\�\��uk��#�$-�t\�^�+9G�l(\�Mp\�\�\0�x�Q^\��:\�\�$I\n�I�4�\�\�ջv�X�\n\��\r! �J3�31\�\�\��\�;Ȗ{ز�5ʃAꭇ����\�(:�tp\Z\�*��J�!�\�w��S[\�+�ڿ���\���l}�\�\�\�\�;�S\�H��/_?o\�Sn�\�?=�e����N\�ۅ�@\�\�E\Znd.�-\�{��*_I�i1\�\�2818\��\�$�{�9\�\r5\��^¡ !���z�\'�\0\�\�%T�ʩd�yN�M$H�Ҥ2�\"1�\�<�� ]m\�\\t�J�y���M\�\�h�\��.G#\�?8\�\���\�	���\�4\�z\��O��\�\�;��\Z�\�E��%&\�~w\���\�\��\�\�C?��\�ԟ�E�ˍ�A~��\�\�\�\"Z&Ki�\ZO{s���\�b�r���(��``d�\�H���i�\�t\n@M\�Rj4\�V�n\�\"ښ\�q�\\/-\�͔�͝y�\\\�y\�����j\�^���\�BB�Pb7�5$x\�ی\�\�\�3\�;;!9\'�$\�0\�\'�\�c{�!\�f��q��\Z�!6	�Ў6�\�z_�ky]\�?\�\�j�\�\�ק�^��\��\�w��$b\�ؖ�L�� \�\�\"�D\� 	jcR,�\�\�\�\�͕�����]o\�/D\�m?\�Yտ\��˿\�݂\��Mw|1�\���]Q)\���{���\�\�>�\�P��\ru;�W��\ZD\�)̡h�W��\�\���<��\�ߜ6\�8\�Fvt#\"�Q�Rg*fP�YL�A���,�WB^{\�M>��;�\�o�����\�M}�iC\�o\n\�O1ph��\�d{\�\�\�\�\��o\�\�\�y\�EkY\�ۣ8Ld4�.\"�Wѝ�����.lj#mH&�\���:)H\�PSF���\"GĒ\�\�צ[�D@8S�V1Qɴ#�RW|n�\�_\�����\�\�cm���\�\�_=�\Zg\�Q\0>x\�\�Gwl\Z�t˛o��\�_͢�\�\�ra\�\�gT�#\�\��\�c\�,v:h?Th<	�D��\�+\�}�k�j����B6tzU^\�v:��A��,D�\r\�\�o�Z����\�\�\�GZHtd\�X�\��S��\�\�]�\�\�mw~+��O\��o\�vݹ���\�\��z����D��\�O#\�^}\0\�\�R�S%h~�m\�A6�����qTG��\"��7\���:Zj�I0�\'\0\�\��s7�\�\'�\�҆H�}BI?\��4w\���\�&6u��濎\�\�v�3g����\0\0\�IDATTR\0�o\�P]���;\���s�\�=˞\��RfQo\����\�,[/\�\�Tl��|G04#L\�\�*��l\�G��4\�\��A\r\�\�\�A	��\Z\�d�xLI�/X!��\�\�\�F�\�\�T+\"�AXJ\r6�d��\�|�\\\�J\�W]���~\�g��\�\'\�L\���o�hv�\�\�\�q��E�\�/\��\�|��\�\'\Z	N�\�Y(�K�M\�/Bnz)\�\�~ϋz�\ZfF\�Q�\�͐ ������\�^�:\�\'���2c�\�gv��Lld�)�Ps��Z�_\�̝�|�7v\�\�\�ѷ�;�\��?��\�.ֻ�3.)\�\�*^��\�>s\����\�\�\�^z559=m_�j%-��pb���&\�\���Bh2\�\�D\�\�S3��\�:.���ڤZ[i\�\���\�	��P>\�Y�~�`Z;�\�[��\�\�M�\�\�\�j\�?t\�`�{\�}\�}\�\�kϝ�~$�5I1p�\�Z?��\�\\[\�M��73y\��u��{\��<W���x<�:)��,\�-�u\�W莠i�VK�ĢQ�R�<dC\�B\�\�\�\�\' \0e]I5Ye�.!�J��j�,d<�Hf���B����I�\�c|�;��Q�ʻ[���9�\�\�h\��ߚ�\��\�#\�\�M^~\���*^1~��C�\�n|�}lb���\�\'�J(\�\�8j^\�l02�=�\�\�Rq�e[D]ǍḮ�\�-b���TQ\�/�(Da��@��!)e%j�=p\�0����\���S�^y\�Y\��J,��~nt茫�0�։b\��?���Ɂ�O��\�\��}��^{c[\�c?ҩ\�\Z�����\�4\�D,	�\�\�OJ��1�\�G��i@\�Uhi\�\n\���C�+Պ���K\rɑ�\���?��\�ˎ���I\����\�\�wWےO\�y\��N\�)Z�;��\�	^z\�\�\��\��9v\�v\Z�\�\�\\~i��|\��\�[o��5��_� �xED\��C@�A��\�Y\�\�\ZZS\�K@,�pc�8�r\�g�㱟?ɯ^z�d\�ё�%\���\�\��\�<|�\�\�8�Ήb\��\�?{{\�S\�z3���rS\�\�\�\�+W,�|�3�\�\�\�.��;KԲhT+P�U\�\�<K)d�5�J�A\"\�\�=ǥ�\�`\��{ER�\�\�W_\�\�{���Б�W�\�uɭ�޾������m~��`_\�\�\0�͈��\��\�ï�xW\�+\�bY�V�\�\�z?�\�r\�X�e[\�\�ܨ��\r\�\�\��D 7���\��A^\��&/����mx����Y\�q�E\����\�\�{z\�W7�o�.��\�{�<�\��*72x\�\�%�928DĶY�r\�]y��\�Ǹ���i��CYNB�g$�\�\��n]\�`��+�\�\�ϱ\��پk�\�9\�ozJ�g�\�\�=窛���\�����\�\�(���c;7<\�7�֫��b�7�\n�#Q+��a�0�\��ό\�\����2�\�\��_ȕ��\�\�,g�-�u\\#\'\�{tb�\�\�Qv\�\�\�K�_g�\���K\�\�E\\�\��\�\�xe˛�:{7dzo?if�\�\���]~��s\���C���\�~���ߘ(7\��E\��\�O_;v`\���˅\\O�^;��qO\01 �嗏\�޹ܴ������\�v���\���>U�SB\�u�\�~�\�����Y�\�\��\�7�\�}\�;U\�\�a\�\�b-�\�¶�?\��7l\�\�\�O�>�ڜ����H_�遯~�:\�]ܨW�\"�h,s���\�\��6�I�Z�\\�CJ\�\��$\�ָ,Y\�\�{ke.;w��޵\�;:\���Ì\�\�4�,�Ϭ	,!ȶ�iM&\�moコ\�\�!=\�W`�g�K^�m\�ttu�{\\$bz[��yF�\Z��n3 U\�MOO�U*ξ�^�߰�?�pv\�\�qS��\�z��U\�E�\��bvӃ_��:\�}�Q���\�#K�/��o)=�=\��\�qfR上/\0\�r���6o~�\�161b�mt�-afdǉ����/Z��Q]!\�J���|^�?�E����Eg\�_2&�y\'�L�v\�:��(�m�t\�R\����\�� 7;þ}�\"{�\�N�_;vp\��\�\�e\�ޥ\��н\�{\��N�\�\�\�\���\�\�\�\�=[~|\�_����%K��\�ʫ\�\�\�&�H(�H\�B[�בR\�\r�azz\Z7\���\�y�Z\�i	A2�!\�L�R\�\�\�5\Z\�\�R\�(�筚�I\��,�LW�:�B@0ʗx%\�r\�\�F˲��~�H\�\�6.�d=˖-g\�\�\�ٵsggab������\r_�\�?N)1�5�\�^y\�\�=\������c�H&��+���o����6�\�f\�Z!�Ym\�\�\�\� \�jUM��S�՘��d�\\frb�R�Hk:\�n�AY\�c\�Q��ib-)��\�nF�|�K;%�?jW*)�Lұh��.5�@\��\'940\�7\�{�\��qz/���!-��LP�s\�\�Ϊ[N�`�Ђ��uB@\"�`ٲ\�dZ[p��lWĉu]x\�G^=�����%>%Qn�\�s��\�\�\��\�>aYV�ob\�ڋ�λ�\�D�e\�y�\"�\�BǡR�055E]6(f���F�\�\�]C[�J�M�%�I\�&�\�	쨃�\���숍�q\�1���t�LG-��\��d�?�oG�\�>�/<�\�@з�lZZR\�݌�XL]y52B�^���ŗ\�4\�<�P֮�.\Z�:\�\�\�I/�\�Ώ=X)v�,��嶿��֦�v\�\�\��ݶeu\\}�\�\\�\�bl[\�=%�:�T*1;;K�PnM���d�!�m�\�\�V�\nJ�\�r\��@Hl+\�\�\�$c\�c.��\�ǭ\�\�Q²�8n<I�%I*�&\�\�A���tg;\�vZ\�\�Hd\�\�SI�X,��@94l��o\�\�{�\�\��4]\�,g/_�mE������\�\�Y\�\�ƨT*�R)R��z�J�B.�#�\�S,�<���5�o>d�ݔJ�#\�1\�q#g���\�\���	/K;)QʥB\�\���;�^�sV�k_u�58�9I�A.�ctl�\�\�I��\"%ϣ\�y\�fs9\�\�\�,\�WY�R�j���P�U)��oO�\�R�Vg���4\Z\r\�.\�#\�:\'��\�\�遖�%l�8ϲ\�9�����I�Z��r�ʳ�m\�s�~�w���F�pM?�d\n�\�\�岺#YwT�D�J�\���8��t[���|�\\.\�\\�L\�q�iؑ���\�{�\�Hiv�#\Z�\�(\�L�PZNJ�LOߍS>\�:N\��～\�\�N\�J\�J��\�.��\�\r��C�ߐ�\�e�\�\"�R)ԑ{\�\�e\�jI����\"7�c˶\�}x�\�\�]d\�[\�f\\�\�O�>\�\�\r���\�cuO�R\���_z\��|�\��\��Q\�a\�y\�\�\�ф��6\� \�r�B�P�\\�Ґ�\�uH��Hʕ\n��2�x�ɨ@\"�djz�\�\��\�h$\�����g_\�,=��5~p��e����o}K�b�f%05=��\0	�\�,� c�\�\�u\n\�\"�b�y9�Lf�\�#cQ��ׯ\��\�o344\�O�\�\�O�}�k׭\����5\�,\�u���\�t��\�賏M��	,\��\�KL\�f\Z\�����\�\�l\�w�zCձ�����Σ��C\�C\�R�\�E�\r@�T \�ɤ)x%&��\�\�\�	�25\�Y�\�B�\�\�\�����s.��\��D��{?���G�eY�\�_� L\�|A�^�\��8+4\�P�\�\�k�\Zn���\�\��\�\'�Ns\�C\n^غ��n�-݂�\�\�\�Jg{�IM(dK\���|��\�&rͪ;Ւ����E��J��X�z��^�0|e\�MB0�AC%�D�^?�I�3d��9:tt��W���_�([7]&\�vue\�\��4���\��Fߛ\�\�\n��:�4ALXԉ�d\�Rz{{���fhh�B�@�\\�\�\�1:=�<��\��_�m۶I�RD\"�\�Yz�{qql;��Z�@���ǃ�~6�`t�r�z�\�[T�x,A������\�\��\�V\�ۏ[?����%7|�S\"�ֶ6}hP\��\�6�\�\�\�ױAg�ӆ\�\�uz%K�K�8�KwO\�\�n\�\�洡P�X,P�Ճ�\�a\�ub��\�O$\���\�<\�$��f\�-\�\rGF\�\�9`1釘/��&���j�\�4\0�\�M{{;�m[�\�Ε@�ypB�L\�AJ\��\�ya�X\�:pR�%�+C\�>\��oC\�(� ����-�\�/jǩ_�ʠ�>���O ��O�P�3օ\�sFŋ\��-EP���4�\�Xؑ�\��ooe��p4Ԩ�C\n;\��F�h�\�T�\�A\��	�H��\�X	\Zz�J^\�s�!\"�;`\�H]\� ,����\��U!���e�\�;��+���I�\�\�\�))IO��o�۶O\��� �|�(5`*��U߲&�i���Q\���ML\�p]tP��n\�0a\�\0\���g��6�$fw��)o�_\�y��\"�\�q�H���D�lY�\�\n\�����\�o`*�Yb���6�����\�Jbd�\�z|$��>B|\��E�9Q�a�{.�0?X�5�Tj,\\�2\�8��\�+����x\\M	T\�\�\��;[Y\0NI�fD\�`I��� hs��$�!\�x\��,I8��)�a$*��1��\r�\�cX\��&�	\�n�\����\\̫���WU�j-�\0]�\��6\�5\�D3��$�hz2�0�\� \�b	���]�\�GG���nL�BY6J\"My2 ���Tb��o	f�!+Q��\�Ȧ\ZA�B\�]�߁K�al�\09!\�I�g\�a\�,�$J\��\�\�\�yE\Z����P���$���(��\�6�xS\�_0֎\�\�M�`�߇\�&R��*��)��bLnP�\�qƉ�N\�o=f�K\n�\"�Zmc24�\�\r���=\�czz��\�߁y\"8eG?80��O�\�q���Sk4�F\"D�Q\�8�X\�q�R�H$\�\�\�`xx\�q\�pۙ+\�\�\�\r>���4\�\�\Z\0�1�\�A	C����\�t�ZB\�iB��,�^���Lt\r\�d�x<N\��9.������u%\'�Z�\�1=9\�\�\�(�B��\�i*\�\n\���W\"�?\�\nn���\��\�䓕J\�\�\�\�Dk*I\�u��T�\�j�\����	�T\�L�Ύ\�;5\�d˲H��/5\�6�Vs���Q�\�5#|\�\���\�\'\�|̚8z\\c^\Z	\n\�f>A\\\�%�\�233Ck&C�Ze\�\�]�����\�\�y����XĢQZ\�1,!���\�h�a=�l����x\�e�������\�m�s���h\�\�\�׽B�\'n��[.\�g2_�X�c\"�g�Xd�Pbt:\�l\�c\"7\�T�@M\���\��Y�b\0�B���CM\�|�5޾�\Z\n��Y&|>����ߤ\�|b�x\�Y� ~�\\���\"X6�����r�L4\��\�ٲYmuL\'b\� \�v:3-tf\�t��iM&X\�\��l�\�\�|\�\�K#�\�\'\\\�tR�U)V$RiAOG\�\�_�\�\�\�}�\�Z�J�N�R�Z�3�/�\�\'6�q\�>|\"I&��[\�L\�ft�\�-\r�m	>�\�y\'ԧ��0�1mrF��\�\�W\�\'h ��(�ˌ\'���!� ��v/+���O�k�-��\�\�u�u�\�s�maqht�\�3�\ZNާ�Ų\�,[�YW]C�\\�^\�S���Q�Q�֨7\�4ju:�%Z�j<�S�F\\G{;�bA�hB\�0`g�\�s\�|\�D\��)>�\�I\"\��Y\'\�ț@�mG\�f�\�H\�7{�vw�r\�\",\�\"bGv+\Z%�\�`�.N\"\�\�\�1��х\��bV4J4\�B4	$�Es���X\����T$��Z��FI�\�LOO\�[*\�K��F\'4�Ig 0$a��\��pI��\�\�XbF���@�L\��\�-u5б��\�eK\�̧m!��\�bu/Rm�+��鰧��E�\Z\�?I\�6fa�k	\"V$\�\�o�\�h066���XR�f�I(���W[FPL8!\�k��imi\��yA	�c����f9�!Wj�RQ\��D\"��䜨\"��HO&u\n\�~!\�eVD�#�\ZNJ�\0��M\�Y�H&Շ\�+P?��\�\���f@��\�o?�_Ds�&�B�qV[��\�P��!�ͣO$b311�\�y��K\�,\��#\�}0\�5�\�Ǒ�\�\��\�\�W�DMcR)@4���MB_tTA�_u31& �RTd�ۡ9]���\�o��j��\�I5\�\�\���%H!���\��L�P@6r�\�$�m#�\�E3�*LtA\���N0/��\�)�\\�]\�\�X>ҍNF��\�\�jk�S�G���%\�D#��\�ZoIM(\�cI�˥ρ��I?��a\�\�\�_-\� @\n??)u\�K��\�ii*jB��@����M����A���~\�5DCHԵ��Z3V�Ɍ��\�\�H@�[���t~�\�\�T\�\�\�\�\���\�y��z�~ \�:\�F�#\�X�\��I�xw�\'�G	x\0\0\0\0IEND�B`�','image/png','romain.png','Gustave','','',0,0),(6,'�\��\�\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\n�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0f\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�i����\�IĆ�A�\0g�HS6>�46\�/�+\�h�\�ph\�\Z��]5��g=\����r@I��}9�\�C�-V\�|\�<��\�q�\�\�|-yyh\�#�\�>fH\�Nz�O\\\�<b\�\�\Zհo�i�m\�wۺ�\�\�VK V \�\�Ҿ��_�\�Y�]F�ςtT�\�\�DD�8 \���fk>\�<S�^j\�m�`��L�A޼�М�q\�8\�\0x\�*�z��\�W�5\�Zj,s\0m`\����$T�>�\"\n��A�\n��ǭ\0F돥\�\�h�\nҏ\���\�\�2s%X�\�\��Auݝ��jto.=���^��g.8�ml�뎹�	�\�Y�\'\06I��\�Zkh�{\'pA\\�=\�ˊ\�\�l\r¶G=+\��=\�\'��9e�Lg�P�\�\��ff \����\���\�18>h�\�\�r���v\��dW�\��0��Q:G����\�<Y���I�,�h\�WNU�\��4���+ź�֡H5\�\�\"\�ule}�~\�\r|�*�\�\�\'-\'i#�\�W�\�Z�7pIgt�nF\�I\n�\�=y�Iǽyn��\�\'�k�%_�$d���@\rBwՍ�U$����H\n\0��=h��\n(��\�qS\�A\�j��\�jEc\�\0X��\�V\�W{#�PC�ڷ|<�[\��M\0t�D(\��\�{׬�E$L\�nH�\'��$u�Yw��C�m\� u8���.�\���DO\�d\�\��@Iڕ\�́�\�\�ZhC�\�7&0A�%�.��\�\�n��7b5\"T\�\�v\�Ү�S\�\�Yne�;�mqG�8�\�\�J\0�K\�H�<Q{ojc�h/dVU@P>8?\�\�^Y⛵��ߔ\��\�#E0\0���W�|\\ѥ�\�\�5$\�!�\�4\n�\��a�\�rO�5\�iw$��rM\0h+r9�սj�mӵX@���ފ��h��\0���f⢑�n)\�	\\\�&���n\�\�\"\�\�{k\�E����<��\0��\�J\�\��c[��\�\�׎\�2\�\"a\�`N@?C�Poe$Y��;YN�J͛OX\�1�����0=kv\�~\�|\�dU{\�G)\�@�q�\�����D�l\�-�!��z�u�[\��;-:\�ZDn$������\�k��C¢h H\">N\�\�g8�>վ�T\�]J���\��\\\�%�S\��\�\�$(;���U\�1�k����M�x\�S.\�\�֓\�mn`Wlrz\�\�4qI!s�;��jL�P�遊��\0x\�\�4P4�R\�>SL�\�z�\0@84\�3��\�Ի`jݬ\\\�\�H\�@��4�\��2\\\r�K�{0\�\�\Z/\�1m9\��3��~\�Xk��\�ԟȻ�\���ʣ���N�Q��h7z\\�n�\�c�ʜ�}�4�\�5k�Im-5\"\�VU.�SH\�0P\�gk_�U�\0��j�Z��I�[��Րa]\�\��}9o�4�})�������F-��T�<\��\�\�,�g�\\_�d\�\�{�\�\�@%HK�bIbrI\�i\�z.��\\�\�l\�\���\�o\��\0�qz��{�\�5Ym�\�\"\�?OZ\0���\"�u�\rH9\�\0�ORĠ\�@&Bf*��U��ޮ�\�[$pn:\��jQ�\�\\\�\�=\ZO�b��+��6�\�K*�>�V\��\�\�X@ˠ\��\0M�\�\Z^�o}dv\�\\�>�}�\�5�g\�\��\�z@�O�l��\�s\�u*z/J�f;V\��\�~5\�?\nuq\�Bw��.v,��N\�\�\'{�ڀ=[\�-��\�\�.\�V�K�����׍v\�C��u\�s?l\�\�ү4�\rl�\�?\�\0��\�����Z\�\���j\�J�\�\��-�eC�I޼\�B�t�a�xm�B\�2��X?��T=>]�㍤g�\0íE�A\�+Y\�\�\�\��GB}�S\�ZF�\�;�+R�Y�|���f�o���\��0�\�\�*A�G��pG\n�\�_����\�Z���kO�F&9d0JO|��\"�>W�6�>��]i�X2@\�\rٗ��Eft\'��?�\Zx�S\�5\0���&�C�\�\�~����\0Y�<QE�py\�\�\�I\�L\�\�\0p~_zt�\�p	^��\0?JˋP�K�T�\\\�\�\n\�$��\�8\�]H\��ހgn�[�pI\�3���Z�n�\�Z\�I��F`\��ק\��^5���\�v$�\�<Qmtf�lr��w*}E\0zQ�\�W���v�\�u\�;r2\���I\r�\�йg\�\�^�\��֏ÏG��6\Z��\0\�\�!���\0\�e�5s�;��OI4_,R�\�{\Z\0]C\�\�xOX�\"��ԧ٥~�Ʈf}qʟBG�eA��OG�֬LFkm�]\��F��\0\Z�\�V�\�\�:ŧ�|Z��\�G�\�o���#ҹ�T�F\�|��\��\\�\�F$s@��>�֗\�n\�$[س���U#�i\�M{��:փ�\�|4rė1c�Þ?\n�[n��\��N�A xZt\\y�Ʉ\'�O\�{�׭|Ԛo\\\���?lҦky�\�\�(��\�-τ-\�\"PL3��\�8\�?:�\�s@\��-e\�\�.m\�w\�\�FPH��5���cguk\� �u�\�\�\�	VS��+���\�π-繏u\�]�[�b6\�R[��!{\�\�\���)\�\�r	��p\\\�\�+����+F\�Z{�\�	Gs\�R⸙/e3YPj\�:��*��r�\�˪�%���� �jͶ����pc\'�[�G-�\�C1\�5j\�\�\�U�Y=�˨ir�6\�6�T��\�\�\Z\�~,�\�\��V�\�m�3\��\�\�ל[kRDpNW\�4\�\�os��F*O��zPW\�]it\�D\�v7\�NS!\���\�,����\�I7B~\�Ǖoȃ\\}\�\�\��dy�y�ssg\0�\�X�ǩN\��?΀,\�7�,��\��KPQ[$�۟N��j��u(\���\�Tt2yk��y5��\�1I!%w\�AZv~!�x��\"\�s��A\�P\�	\�L��݆�fb\�q\�y?\�K\�\�;RMJ\�o㸚ݤ�\�8�2�!B\�3��\�\���5���%����b�\�!\�ǁ^S�˻P�aќ��hϽ\nJ�`\�@�\�','image/jpeg','220px-Cocteau_1923.jpg','Jean','','',0,0),(7,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0^\0\0\0�\0\0\0�\�\�1\0\0 \0IDATx^̽w�\\Wy��>�L\�;���wɲ-\�\�r!`�\�\� �\0��!!\�\0�/�\�q���\0�\ZcCHll�,�X���k��\�\�\�No����ef\�\��}�~�4;�\�S\�9�\�s��r\�^�<�\�O�\��_�ʂQ��_��/�\0))�J��\�\��0طoR\�\�g|��(\n˖-c\�ʕ����z�j&&&8z�(�\\\�J\�_�\�Nww7\�֭C\�4\0��\�\�߿�\�\��__߳\�~޷g\�b�\\J\�+E��]g�n���\�M��H)%���p�\�YB�>��t:M__\�o)%�J���&R���p�\�A������`1�R�D�X\�\��\�v�/\0>269ᒕ\�\�t:��Y]T�\n��o�[)�K��\�\'߻zݚ5---LMM�w\�^N�<\�\�\��D���.����(���\�\�\�J(\�\�ra��!�@J��ZB�T����r�\�\�\��T\�JI^��J%\n��D�@ ��l6˾}����\'�\������{\�\�|�GF\�\�])O[�\n�%�\�M�G\��c$�u\�\�5�\�\�${�\�e~~�j��\�泥��L&\�\�\����\0��nlld\�ڵtvv\�\�Ѐ\�\�&�J�(�C��������\�f��E�\�\�a\�ƍ���9lw�\\���s\�\�9\�\�2\�\�\�J&�M�\�/~��w\�z�\�\������\���<qt\�;�T޾a\�o�Z\�СC,,,8q�\�*\�d���\�\�\�)\n\�\�\�0::\���\0���\�uMӘ��y\���\\.\Z�X,^)���\�\���\�\�\�\�pZ\�\�ܜ\�ʲ\�,\�t\Z�\�MWw�8{�?tzrx\�\�\��֑\'�\�R�W\�0�m�ɉ��\\������}\�?\�\�\�Ģ8�\�5�5\�|>O�R!\Z�\�\�Ӄa����c\����^\�\0�J�D\"�\�\� \�j�J\�_�x<��\�:\�\�ڨT*T�U��<���?~\�1oRJ�\�$�P�\�\�\�/�K\�r��SCWd�v�����<�cϽ*�\�hogrr��\�%�@\�n7---!8q\�gϞ�T*])\�e�\\.���@�|\��9��*�P�H$���b�H>�gaa�!�-��0::\���S\�b��aT*�Eq+�\n\'N�`͚5��ѱ;5E{8\�䲌O\�\�\�f>�q\�Ƹ\�\��\"�N_.\��DX�z5333<x����X1\�\�w)%\�r�l6�a�\�a���\�\�\�u�P.�I�R\�\�͑N�I�\�\��y\n�\�E\�_.��y�\�.W$5���ڛ?�\��>}\�\�|Y\��\��w+>\�-K�.�̥R�9s\�7힞���9p\�\0�L\�J\�/*\�qR\�\�J)�V�\nfgg#�\�\�\�\�B4\Z%�ɼ�VT/\�j�D\"��L�y����;6{��ʥ��濋\�Nnkll�\\.R��/�#�D\"�\�\�E�񋑋����j�\�\�\�G�a~~�%K�\\p���t:�\�\�\�\���\�\�\\��k�\��/\r����S���innƨ\Z\�\�\�\\*\�e\�\���\�f_pK��\��_��J%���I&�455�(�\r\� �\�\�\�\�\�\Z\�+�n�\\��v�\�z\�G=\�����F�Z8�\\.3��`l�T\�b�y\�.\�	\n\���4\����\"��Sz�\�^\�u<��р�r\� 57G,F\�jVՐ��d��\�ܢ�~||�@ ���/�/�\Z�MM�sg�o��\�=q`\�Rq/\n���xdyը\�\�\�ѡ)�B�\\~Q6�P(\��xP�EB\��\�{����ټ|	��J\�`dr���&�T\0I�Z�\\�081I:�\�g�CSU��\�\�9���X\�\�M{S#�p��K�\�li\�\�\�BE`P5$�\"XLbA�Z�P,szx�����=\�svt���$��\�Z��\�O�!�+�[�<v��\0���~X��\�\\Z4*�v����l?qY������E1��\�\�\��\��s@`7)�h�YCH\"ik�p���].TEA\"I\��t\r��[����5�!.���D�[�\���\��{<\�\��\�\����&�}\�D�x<�\�n��h\�\�Sg\��z��\���٥ܾ�566F\\.��f;@*�\"\���\�jm2$HL�S\�* XJ��ǋ�\�\��z-\�\�8B\n;\�b�v13g\�XZ���=ܼi-����y�/�0�U��\�!�7\�Qu-�\�;޸�Rq/\0>W\��gǷ���h6K\�\�\�/Hx�R��)\�bQ\0<.\�\"p�b\"!����D`�\�.��a{8v\�0\�0Da��-J[	�\"M�KK�\�\�C\ZD\�:����\�OtY\�4\r\�j}�X�Ϸ�?v?q\�\�_\0|S�a��\�\�A\�\�/\�gX\�\�\�kﺃ�B�h\�^���MCYWq!!� �\��\�\"k�9�T�<j\�\�\�D8z4�(5唋����W�\�\"\�.-��\�r�B�i\Z�XL\��]�\����Ϟ>�\�\���\��C|!�֭\�;_�,w\��2\�\�B��\�D� �oi�\�R�t\�\�?�\�5y^\�\�\�QK�\�pRP� �\nt\�ݴ6_\�#\\$��c�f�\�\�VM�;\�y��b��\�>\�:7=�,\�v�\�\��/\�_\�\�\�g�;�۴��H�\�\�t��X�\�\�\�:,b�\�65�;�Ŷ6��b�� ���/�76�a�\�3�]��k֭\�jE��(N�\�p�*\�\�\��~��\�_�ƯO>\�\�q�6\�\Z\Z�A�a/h�o��\����m[�CQ\�\� ���j\�@az)6Ȣk\�\\�R\"f���u|�\�\�;��lV\�yH+�3\�k\�\�\��r�h�϶�\�r��\�\���W�H4k\nE�>ud\�\�\�\"\�?���Ym�\�\0�`�\\\�\���x\�����\�}����*	�<�\�\�r\r\�=F|\�\�D �\\��%a%�On�i+ɾh���BBJ�\\`-k\���I\�/�\�f|>/W#RJ\�p�(\n�x\\�\�.���\�/\r�\��E����K��\'�\"�(\�]��\�uH�_H�7�J�b�HS,��uL�\�_\'f�\r>`_�H���.�d�7#E�Z\�\�k�(X\�\�E�!\�\�H�\\^\�\n!d\��ƮD�\����ϝ;\�I�[\�\�PHUk\�\�L&s\�\��\�[��\�����\�d�\0Qȓ\�g)U�HiN�v��,f�5��\�\��\�m䬯Z\'k�\�	MLk\�8\�\�f\�PJ��D+�\�z3�U�R����7r5b3\�9G\���q{<˛�\rמ\�~\�#��at6\�\�\"ԯ,Ջ�\�$	�\���\�vB\�{2d�TZ�Z%�\�\��zX\�\�m�Qc[�}�o�p>)R\�qkh:-l\���\�\Zȵ,\�\�;&H���Q)�z\�2�FJ�\�ޟ\�\�\�\��*�O^�=�C\'}\�B�=�\r�\�*�L\�\�u]GQ�\�\"\�r\�:Wٲy�e$�RF�K\�g�\�\��\�9z\�Z���\�:x��V�f�M8�[\��=�b1\�\�\rn\�%�E��\�\�\�~\�*K!\�\�uk�\�\�J%r�\\�#\"\�5�P(\�鉡%��\�Ӌ�S\�$W\�{r�B$X7b���gjj��\�\�gɒ%��\�i�\��oX�\n��].\"�U�S�2�\�*ׯ[Egs\�yD�cc�8j�\�\0�\�\�3�.�)\��Z|\�sn\�\'�E+U)OS4L$\�jdzz\�qDL.	�� ��u��\\dJ\�;c\�1�\�WU\�)\�ٳg/X��\�\�\�u�|>o�U\��y1�*\�zͱ���dp|�\\�B\�\�\�����@�;\�\Z\�jR�\�ాs;�V�\�\�5!jǵ{\�K\\�\�BJBn��=\�\\��R�E�\�\\RUu��s��q\�\��\�J�\�\�\�4\r�鿏���\�l\�utt\������Xd~t]g\�\�^\"��Y�J�y���\�E!\���߹��\�K\�̯\�\�>8���\�Hq^K�Efƾ���>~\�>\�0��KeՒ�F\�\���Z�`��Q\r\�\�?\�\\\��/\�b\�\�ra{4�\\\��K\�\�\�H$x�^�\�\�ib�\�E�\\f�u�]\�h\�f�\�\�1����\�[\�}����\�N�1\�G�\"���oX\�N\�P�\��x�\�Ȏk��MH�\�	@:��]t6%j������H$\�!\�].T]�����ͦ\�\�n7��!�$�ɠ\�:˖-c\�ڵd2�~?\'N�XԜ\��\�,\�Y�\�ZET�>�\�^/+Z\�j\�V�\��\����d�\�u\�u`�\�\�\�Ib�\�y��	�\r�y?Y\�.:\�\�R߉\nK᪐��6���\Z���0צ\�\�J<�<��O9Dw�\��>M\�ͩlذ��\�\�Y�|9CCC\�\�ն\n!p�\\4D#�vu��(�Z\�Щ3\�:rͨ�WoxM\r@A\��\�Ү��;��Ygӭk餱y)Գ�\�q�S�\�F�VWj\�\�n1`*Y\�S%�uK�h��1\�\�$�͚&Z�0s\�\��<�k͙\�!gN�Ay|n�\�65Bb�(��\�\�\\/>��L&CoW\'+��\"	�<\�b�Ǟ\�Ω�A\���װe�\�\�k�¬5`i9\�f\�`�\�y-�\�l��\�Qv\�\�Q8u�r2�Qw�]DCA�>�3yx)�T*���S,��\0���f�2�\\-�l��櫃��\�s\�]��#R,�i˵��4cT+\�b�]��\�_>\�?�ٛx����*f�k\�6e2\��Эe!�ǀ�@\�x\\?p\�\�\����b�sth�A����79�\�X�}��nނ��\�\��`n�\�\�\��\��(\n\�\�\�\r\r9�s�\\T�J\�\�\���*n����\�j���!�\�\���LUU\"\�.]㦭[̋�C\��\�~\�߾퍼\�\�W��5VQ\��PX��:�\� \�y\��t�P�\\�Cj�\�¹n�&�yiݷ�m]�����wo��r�Dss3�c����\0K�,����\�\�n������GJ�\�\�\\��\�s��\�>\�T\�c{4�a�N�ٿ?��\�\�V��ߏK\�I4ĸ�%�\� \���w���\��׋�\"d��.*�c�\n�V\�\�L.�L�;/XDUQ\�*��X���2�yJ[v|3��廴��7�!��eÆ\r\��?~�j��\�㡽��-[��yKi�\rb�94U+P���v\�3gΰ}�v���/������\�\�,o}\�\�\�\�H\�r�e]\�\�jf.$\�\�T��c�\�V\�\��S?l�I\�E:��W&\�e]�Ӵ\�w�\�\�<US#��Q�\�\�\�\�W��\�\�4~���k\�:k�`\��ӧO#� �\�\��x�\�\�nh�Zq-\�3NSR��{��\�t�\�\�\�n�D\"��^\Z\"a\��&������\�\�F\��\n\�b\�ڱ�6-��C�n��Ò\�\�\�S\�\"\�u\"\�\�\�)]Zݦ�.\�\�Y\�4��\�n��K�r�\�Y\�\�\�X�t\�T\�r���glR?FY\�e\�\'G�97�\n<33s\�]T�x�\�\�&��\�\�\�\��س�BQ�.�T�\�XaQ%-\ZK@Hi\�^\�I`e��\�\�\n�3431����\�8��I	R�J�I-d�T\�:8tU#\��\�u�	��\�ћ��w�oy\��D\"V�Z����8q\���T*��~r��V�r�|TeU�V�\�5\�>W�\�O[[\�\�\�?~�;o��߿�.g�k\�!W�9z�����\�3�L��n\�b���\�OO[��˻:\�lm\�\�1W�j\�[p�����SiE��7��\",Ӓ�Kszp�g�125\�\��ӳ�9\r�}��\�D\���׭]\��\����\�m\�t�f�\�{�X,ƲeːR\�\�\�W\�EJN�:�a�X�EQp�\\,�����6\�\�\�\�\�ʒ%K(�\�\�a$\�l\�/�J>|���V�\�{	X\�bRJR��j\�.����87�Q�R5$\�J�b�L�P�kmQ�K\�\�5\r����x\�\���\�\�^OWk\n\n漉-6�k9IG7\��\�f\�\�yӇ��}\�N�+(U*\��\�i��\�\���k�^TUa6�	��\�\���$\�{\�r\�\�n\�?�~��}\�\�Çټy3+W��Z�r��igT_�V9u\�����^�\ZM\�Z}.OĹ��^1�\�ε\�^블�����q@�\�\�?LW{;3\��CG�\�\�b��lY��;_ym\r1P����\'��Mg99:�ٱ	2��!)K�%\�@\'F\�|�o\�C\�^T\�\�ki;���`66I\�W�vU�ʿ��#<��y\�\0n]�#��)���f\�twX\�цϭ��J�\�\��I�\�;ɧ?��޾����\'�\�\�\�\��\�ٽ��ֳj\�*4M[dv쩗��!\0�~�a�\Z%cH&��v�\�c�\�r���~Μ9C6�\�oy[6�w\�U.��\����>�\�׳���Ǎb1Pڔ4�X�0��&��ahj�Cg81<Ʃ\�	J劓\�ӻ�qzp�\�\�,w\�r}^�\�{�y��Xs8\0H\��q�\�96�v\"h�Jgc�;[Y\�\�E\�\�#��z\�T˥�3_������\�-ܴf%�\�z���n�\�F��\�\��\0\�=�7n���M\�8z�\�~�\\.[��<\�\���*�䘔\�y\�h||����E;ɲ\�L���\�]��k�\�q\�Z]�k� ]�=�=ccO\'�޲\�4S�X\�5Z�u�\�e�7)��^Z���M\nX\�\�\�\��\n����D\�L�tr@ �G\�k�,AQ$\�;Z��\�\�D�nUa\�K�r\�]w�/<ȳ\�>KCC���n֯_\�������\���\�\��J�\�t(\�Hʫ{2\�\�Ӕ\�efgg�����K92>\� *���\�\�d+�\�:ڎ�\0�\�\��-��~�\0s\�y\�\rQ5��#]\�\\v\�X	!\�|T�E�ٌu\0\�Qn�~�lO/�|~4��B�Ra6eN\Z�\�x�\�\�$�H]\�ioo\'�\n�H&�3�\�qg>\�~cǲ\�y\�\��###헛w��M!�\�\��\�nhbvh�r	�\n��`vҹ,��\�\�5슗*\nŒ��0@!�xܠ���D|T*\�rS\�\�2\'5�\�A�;�\�VH/���-�J����# �DJ��|�\�\�v\�vB\��E¡2����_�\�]7��&�P,E�J%FF?zj\�Y�\�4\�~\�ڐU#SU�vjt�Gw\�e��v.#�\\�\�\�<\r\�(�\�,)&Ϥ�q�`\��Wɖ��\���t\�\Z��BS�\�U�L-0��%�VY\�\�N<�TT0�$�wq�d��\�zW�7y,&\�X,\�A���9 )��\�:�FU���x��@�B�D��\��B��\�\�$\�\�(ͧ�T*��cI��DV��n_�[W��\r	�\�H�MC�Ra\�YՈ�\��\\>��\�\0��W\�L{4��\�h|f\�\�\�t�_\�\�q���G��8\�z�M=\�Y\�siCbH�jU�\���\�؎\�>�֥\r47�Y\�-�5j9\�M\�iK4�i*�|�\\��P\"B\�Q�r�\�j>Ñ\�c�\�:\�nN�\nA0\�I06�\��$�7Dih��JI%��\�\��<^���nA�p\�\��\�)\�Gr��&NKoO$�\�t\n\�\��yf3y&gR�,\�D\"P�\�\�щ	\�N\�\Z�\nxY\��\�.rfl�_��^y\�u�@G\�r��U�V\r\�\�3�N�f�M+Y\�؃[w\�7r�\�?;\�\"�<\���\�3}\�c�\Z��\��\�_�\�g\�x\�Ƶ\�˖���]\�\��\�\�E���\�\�QR��\�Y�s�u��ҽ��k$�}�\�;N*���!Α���M1<��R5p\\))YXH��\'� �	^~\�z�1=�f\�\�n:\Z\�\�:\�\�\���:��As)��BC\�M���X2\�\nC\�2$���Tn���@g;�\Zv�����14�DQ�dj>\���O��I>@c4̒�Fb?�mXM<\�\��@�mZ\��7\�@\�\�\�\�&�.Q�\�\�{+��+Yȧ9;\�O��\\:\Zj{GCk�\�s\'\��Cç�����\�^����\�7q\�\�)�<̞3�����7�\�\�\�NG�i�\�\�\�Y���\�um.7��0�͛�<t\�<���kh�Q��)䳦��\�\�\�\�ɓ�\�ޛ�\�s�9�L���S\r7��\�ҕ!Z;�ݦ78��jH�\�$v�\�9#j\�C:_\�\��s\�,g\�\'A�\�\r]\�ݸ\�n�\�\\*Q,�\�\�\�g*5�KSy�\�\�|�\�0T_G��F\��\n����a �*E��\�?p���!��lliij\�/��<���Oݽp��Rf\�_\���\��}\�\�\�,\�\�b��=<\�\�\�{\�uz/#�1����\�\�\\l�u)\�\�U\�\r�\"�݇�081M�j\���ؼy3�\�{/۶\�\�\�\�\0J��p�k_\�>�׼쥷���}�\Z�P54]�����\\4\�O�lU�@P�~:\0a}(\n��\�\�u�DW\�^t���O�\�\�Q&S�KUTY%�\�\�\�\���M�_��P�KwG_�\�W�㥷3�Jqnh�L.\��g���!<>C�a\�\nN=?J�=ļ�\�C\��8�8��S��Z��b�v=�\��\r\�y�[��w \�\���;o�����\0�Ͽ\�}�\\)\���\r�W27?\���Ǹ\�%[QT�b�\�\��$�>�\��\���S\�\�\�\�\0BU@(�\\:\���+e4݅aH�����\�yի^i�[�T&�ˢj*\�|�~\��<�ȏ8u�(\�8��ԧ����D�r���\�b�J�d\��i��3c�[��/�S\�Wk��\�\��Q����\�o��p(��J\�\�\�9��~��eώ\�\r\�v�y\�\�\�\�߾�m>��Иh$_,182\�\�uk\�v\����J0\�\�׬�\�RVʴ�5�\�=\�	\nشn\r\�P�M\�\�������\�\�<�9�\�\�\��vk��_�����w�G 觥�\�ܴj�\��Ɋ%K���A�\�F��E�r�\"p�]H)Y�t	��_�jTp�]�4���4�TJE֯_�\�\�\�\�\�r�[�\�_\�����\��\�TP5�\�cO\�\�f\�.�mn��\�\�d�r��\�o)I�ur\�9w��[GA�J\��\�\���\�\'��_H\�\�\�K�\\Ab>ôz�jʕ2^���t�_=��\�=x���*lټ�\�|\����\�\0\0 \0IDAT3�tv�Շ�ǃ}�\rkV1<<̪�8_�Ʒ��\�?\�\�[�\�۟m/VJ5\��9y0�+�7�_�\�\�\��\�O����\�5T���>��l1\�\�\�$��\�W\�\�܄aH��\��t	�B\�`\�\�5twv�\���\�\�w���!�\�~;=]]\�b\r\�\Z\Zh�7p͖x\�?~@���\�v�\�\�\�hlj\"\n�|/��x�[\�.\�0���%�!5_�ڱ\�ƛ����|�\�l�XC!�\�B\�`��M�\�n��[�y|��qn��?�0\�b�X��\�O�P੧�\����|��\�\�\��=|>/B\�Ĺ$��\��jl\\����WcH\�y@W\�x\�Ky͖k�\�\�>\�\�\�\'ش~-B�\�u=��y|\�\0%���\�J�К+8v\��|�u=�t&\�>\�ω\�g(�J�\�?�Ex�.��y��=-\"DBA�ݰ�m[�e�\�9~�\�#<�w/\�l�����\��\��y�f\�:Z�qy���\�{�BH)ihh`\�Kn�l@�\�\�\�m��?�\�\�\�\�>7��>\r�Oen*�2R�!!\�\�A8 \Z��|\�\Z�<�p؏\�\�F���\�\�mLNM���\��\�3|\�/\�\��l>k\�X\nH�\nx�nT\�\\γ\�svp���a���1��Sg�i�7�Eb\�B\�ٮ����\��\���W26:\�+�߈�*|\�\�_q��5\�$9\�?\�\�؄�\�\�\�\�\�A\��nՅ�\n&��\��p\�X\�\�\�\�s\�\�ޱ�=�w\�\�\�A4\�>JU�\��?~+\�X���A@�k\Z\r�z9Mjx�b�J�\�S#�Mz˼�S\�\nH�˥\�\�`\�\\��u��\�x!����cbͺ���>\��\��3::�\�\�4�\��\n�����g\��#Ax���\�-4\�\"�(d.�r��R\�\�C5k�Y�3��D~�굯\�g\�d��^^��ZD�L$������ë\�Z�Rސ�7(�`�\�\��\'\�08=\�\�\��j~fϝ\�\���\�:\':��{�9��~z7�n��.��\"�Ui\��\���fi7�3\�.�\�\'\'i�*toX��i�\��N�h\�O[\"N���T\�\�\����`\��Pk\�\�y.\�.�%\�m>Ν\�0ޟ�y�����c![�n��i��kW\�%�R�\�\�)V��\�󞷱i\�R\�H\���\�3O$IM�YwK\�\�>^J�G�ny\�-_¯�\�r����W(JJ�\�\�g߁í��ŧ=�|�-S\�5w��\�\�5D��\�\�e�T��)Ns<F<h�[�p�\\��\�\�A\�U6�tG�����>]a���6\�*yT!Q\�.P5�~?ѥ>@P)乹�	�bNY!���RM\�P�Brx�S}sh�\�57DQ�z{\�T\���Yo�B\Zk���\�4�#9zW\�\�y�\�:\�:���j{H:�k�r\�v\�n\�\��c��J)��\�Qzz�\�\��,\�\�ø�6�t	��\�n��\�䙳�+:\�4\'b�_����ۂ!�J\�粒�!D\�lv!\0��\�T\��kV�k\Z\�0ݱƆ(�\�v�\�\��\�4�J��\�)f\�\��z��@(\�\�׮a~*Ϲ#��\�=@1S\�\�D\\\�\�n\�\r�\�\�V�� \r�J�y�!%�b�JY�\�V\�e+d34]\�\���7�\�c�h5�%8Ӿ�\�K��Z;��=\Z��\���1\�n�@H\�\�\�q{.���\n\\nU5[P)[AR�Z�rU��S\n�2\�4$��\��i\�R�9UQ\�\�L�\0\0gF\'AQ��\�-��U\n�\�M$BU�\���N`F�\�B 5Q��\�t7\�8��3�+:;�`j:I{��.!P�X��H\�2�\�2١1*���\"Scy*�JE\�l�T�d %T\�n�B0䦵\�O �\�\�x�*B�ό��*:S��X\�����m4$\�Dbq2er�2�\�\�Er\�2��*h�@�b��\�4��)x�*=\���*�N ��hQ΁+\�\�\�.~�c=64\�lj��\�\�jh\0Rs9ѝ�~@��cG��\�J�\\\��u#\�\�,��)B\� w�\\\�\��SF\�\�ٸn5X��	�(\n>���A���\�6Ӵ�����p\�j��\�\��C\�Z\\\�\\���}	+/�%W5\�\\��.Z\�}�X_\�GZ&\�<�̕�\\\0(u\�1\�}%rpy�\�\�\�\�\�Ӭ\�\�)eg\�)z:\��#�.\r\�^&g�9~$\�n\�,��32:1�݇.7B\�AHM�R��~\�\n�\"���Y,�k\�X\��\�̑��@\�GQ\�!�P@�W\�\� D�\�s��e��\�y\�V|}Q�VJ벨ӊ�\�b�I�� �4�E��ﵱIP+�J	Y�:j\��l�sC�D�A6�\\F�XDU�BU�\�a�\�\�x��}s���\�<��\0eM[\�\��@俿�\�\�\�{�G�� TMǥk�3Y�[�QU�gv\�\�Y��6\�\�/\�=\�)%\�\�^�\�\\�wP��\�	j\�6�\0B.�\'Xk�R\"\�yimE\�9�\�%A�\�\�\�\�\�`)\�)[]Ӽ�\�̄\�#�$gSDC!*\�*A�E\��@\��\�\�|�\Z�Bi \��8\�\�+?;�c,���\��\�\�\'��Ug��h�\�\�Vt�\�\�~��e\�8\�W�X%��P\�\"\����\�A>���a\�)鼰�\�&�\�o)[Jc^��vFu��G\�@���t��+$�bjf�\�\�<�\��s\�Ƶ���4*��⃜<u�Ic��o�\�g\�\n�\�_��K\�\��ͮ=S���B(�\Z\�\�\�\�\�ݲ����Yk�\�\�õNOZ̪���rA�\��\�\\\�\�#��H\�z}>\��s�$\�GR{�\r���\�>\�u���Չ���\rtRQk*�\�G���\��\�0�oXE��<\�\�\�\�\�;������\���/�\�G�5g\�O�\�K�W\�.���.\��\�\�\���f2\�@Z\�p��\�\�\�\�\0\0Oo!\�� \��EE\�OM,b�}T��.��\��\�[�2ŀTx\�uJ��9�\�?@�Z����e=]L��h��c|\��O�r\��ηo���\�:}p\�k��|��\�3\�\Z;>)�\�ݟ��\�972\�p�\���\\�\�\�v<n7���k����\�eCQ@�{]�(\0�Y^˵0�NaE�\�\�.�\�u\��\�N�2lp\�c;gm������E�ǰ\�k�Iw���\0L\�r�<���\�\�܄�z�\�S;\�yz�t�\�?\�\�\�\�\�\�%��G瓎���!�\�X��{�~�3��\�\�׼r\�|\�\�r\�|$�\�\�3�\�\�|�x,\�c���ra�ն\n 3��Y{eX|�:f��v�s�\�\�\�\�\�g�9A�<\�\�u>�yau�e[����V\�	��jB�c\�s��u\�_�\�[xߟ�\r�*�t\���\�|\�s_ɨR|�-�׾�s\��:y\�C3\�\�\�\�M�\�7�\�\��\�c�\��\�\�\�\�u\�\�\�\�\�\�L��\��\"f�@�0g\�\����\�\Z\����Z�\�a7\�!H3�\��[��mX\n�ÀZ?b��\�\�33��u]v\\\�e�ږ\�\��\�W\�\�¥\��\�hin�)�`\����7��q��\�[o��\�/:�<��\�G*�P÷ܪ��O|�\�HΦ��l^����$���\�L���j���\�\�AZ ��\�\�\n\�;\�jvZ\�\�j+V(u,�� \�3\��\�\�\0!)\���.By�W.�\�	����b�\�Ϟ�5]�4\'�I�x�\�����S!��{z뒵_z\�W?pɗ�-^��d,5��\�~p\�c{~Ѱ}\�ގ�\��G\�\'��\�q飫��m7nE״Z5\�r+\n\��P�X��@��`v�u]k]�eK�Tbzz�S���LN\�\�U4�bT+T\�UR\�Y���df&I�\\&-f~� ��S�TZ]� -�H[\�QH\�\�]ef �\��\�\��\�\����\�G&�\�o?�i��ȏs�d<����ӿ<�\�����\��\���\�\�s�\�K�����;�c�N��j\��;�y}!M\�H�㫖���\�y�+�����b�띿g\�r\�\�)~�{�t��Ff~��\�,?�\�;IPS���46\�OT�Ǻ\�\�\�\�\��]�\�\�U\�V��#aP\�0�\�e���c��LNϰ���\�\�7�\�\rK\��\�\�j�\�/!�q��\�\�7jϞ:\����hS\�\����\�o}�\�m�\�\�-d!\0Y\�\�l\�\�6a���u\�\��\�-�?7@._@E\�v���H)\���� 	\�\�Ս\�ѭ�\�=��ܾ�0]L!�oG\�Ҏ�\��\�A#N<	�\���W>z\�/_�\�o�$szjxbC\��̟\���\�\���\\I4� ��\��+�0\�7\�O�\�{�7���q\�[\�-*N�u�\n���Eޅ=9f]��`�xks�\�T\�e\�D(`nwiD��\�ܵWݚ`ׁ\�X:\�\��_���\�@�\�\�`+K��\�\�\���cx5\�\�[��\��_�@\�\�\� �\�}���:\�+\�\�n����~z���3\��9��P@\�j4�+(\�+jWR\�U�b\"\��w���\\E�\�^��>\Z������\'-m�y�l\�\�b�\�\�\�k4n\�4��(\��O�wC\�ŭ�\�������*���\�c\�\�nM�\�e\�w\�cQ��k6����X)#JEVa��\�d���\�	j���\�\�P\�r�	Dcx>\�0��\"M	t�˜u\�L/��\����\��Z��\�Mw��Q\\ng�,��~����\�\�\�B��Ւ/W.\��A\�~��x\�\�۶���?{�W�ML\�Ck	a\�\�R�	�u\�]�z�e�\�O5AQ5\r_(�?v�\�\�NʺO]^��\�2̬�r؎�}_MG�\\f���\�\�\���Ô\�\�\���\\\�\�df��\����(\�_��%gzm�\�y�`\�\�?}¬�m�\�8��\�j�3S	8nV%푯\r�t�L�����\�\�/P,�����B:C:c~\n�U\�@\�eqr�b�ؗ\rp`�Ҭ��B���0;`�\�\�\'O>\�\��}Q6R\�\�\�\���\�_�\�\rLW�K�\�\��5[zw�=��X\"rӎ�<\�jinb1�BJdj�\�:V\�\���Q�d��j\� �͑ZX 5�avn�Tj�\"\�\�]Gj\Z�4�4�T�\�\�\�\�\�\�HK\"J�\�GU58j0g\�J��TuEn?��\�\����?\�\���Ґ\�k��\�\���\�\��\�\\Ջ�_���\�ڞ\�鱹ic29��T*�o�q��>{W�@ ].\�\��1\�\�[\n��\�	9\��C}\�\�w�C}\'�\Z�d~v�\\&\��	��uT�\n�\"!]\'\���z	y<xA.�e`p�\�\�q\�\�1�}� {�b\�\�c��>�\Zb\�O9��/PL�=܀\��RHA�Z\��_{�����D�RN��\��\�=\�\Z}��o.�N^4�}��\�\'\�y\�\���S\�Ǐ�I\�c\�\rkV���\�{iN+�9\�+�joŐ�2+��ͱ}�>�T+\�\�&2(�F\�-��v\�4/��*�BN����I��Ȇf���`�Eg`p�Qů\�D�n�2˗��y�*\�|�@:3�XD�.7D\�f\�$,�I�j�\�O���}��\���v�bT��\�Ʌ\��\�\�+��ɋ65�ܴl\�\�=�}���4���w�Ά\�+�ͽ�m�-\�a.\�L%Ԧ�`08:ίw\�bC{+��\��\�t?m+װ�\�[��Hi�f\�\��!\�T���1\�w!CGC�\�\�\��+��ri7��;)�ps!^����L\"\������\�\���S\�\�^ ���x\�5�\��\�\�_�R\�\�x[�,Y;�/O�NOm\�{�P��k�\r�\�C�\ZTsS�BZ\�4 �՞p(@$\�\��\�L\�h���\�\�{~�4�w=ù�#�fg��� 56¹�\�\�{�\'z�\'ĊiZ�\ZQ�iHN�M�n\�Z����*拊LХU$�PT�׏N 4u��*�s�C�\�]\�\�p\�q�F)cS\�9�\�\�w>�đ]�}��\Z�cc\��\�\��\�\�Prr\��S[��8�\�\�-D#a+�\�jLFin(�0\�&�\�H\��C2:>AC0��jx].�B>\"��X�#3t�\�P?��a<�9:V��0�%009��n\�\n4\�ZжW�,������R�[��\�\�\��|\�S�r\�N.�\�y\"*Պ{&�phtvj\�r�\��<qdW�C�z멁\�X\��\�K\��۰^D\�!�BE�<�fn!����1\�VB4�d�Z�\�\�-\�\�\�a��x8D\�n��4v4a�*�>�R�b�\�Xj��!�\�k�z<�Z`%H� B1�/�P\��\�$XHgx��>\�O�x�J\��ٯJ�A)\�\�[�ݽo\�\�#��p~+�<qtg��U\�\�V��݇-۽�@Ò\�.��\�CuD`�\�w�f�D\�ri$\r��\"�\�S��q�tT�8\�]~/\�\\�\�\��B��B��\�\�\�i�?�\�nي\�\�v�4oj\�C\��sFֺ�]�\��$��\��>�ӫ~o�y�+\�B��c|~f\�R�~k���?t\�IM��<�u\�s\���t���\�a�-BSM\�S)aO���+�\�E[s#\�\Z�}gO�\���\�Y&\�g���e`b��\�$\�|�`,\��\�Y�b��X�X�!\"	p{\�^	\0�@��\�8\��ۏ�\�\'I\�Ł@\�0�e��\�J���T�z,~k��X�\�Οm�\�̿\�\���\�/�\�\�\�;\��F�\�`vr�2r!�(\0{:\��1��\Z\���l�t\�zrI$\�\�q�s\'��~\'\�ҟ3\0\n\�\�`�\�\�f�J%v\�{��~�c=~��7\�E�S��V|\�n|\��\��r����2ޖgN4\�~\�k\�\�\�f��\�Lݼc\�>12>�\�UˉǢXF\�l��fn��T��W�p\0UUQU��l�#$\�\�$\�t\�E<\Zvޕ�\�aQK�\��!B1s3Rm�@�\�e�\�o��:{\�\�ʼH��\�eb�B�\�g\�����7]���뗬�\�;w�cc3��w�G\�n7�\�7;���Y\�\�en�\�EA�\�73�j�Zs0���w�a\��\�\�\���!�\�\r�Ig�n\�jTkS���\�\�\\�/�E\�~\�	\�J���p��\�[?�!\�\�YTU%\Z�R.�/�c�R�F\��_éQ�V\�\'�+OL�\�;��\���Z\���rmϪ\�\�\�ԣ�\��\�lذ�\�\�Yv\�\�A�P@�\�\�xo�\�ul�f���p!sDf\�\ZhY>�eZ\�g�\�ML:*��$:;�mѶ\�0\�J!�?d\�ssV�j��O��\��ſ|�ߘ�I:\��x<lذ�d2I�e��ÄB!\�\�\�1�h4J2Y˫^�.��\r\�\���}\�\�\�>�.\��\�\�X{��XHn+	cckk+��2>>N>�\�\�\�cl\���r�\rkV\�vYO�Y�G\�n�����\��<��\0�h4B �\��R\0\rBQ�/�\�L$<�?O�\�O}�\���1ҋQ�R�23=\���\�庤gS*�\�\�蠥��\�\�Y����_�8_*\�jg��_2�0��\�\�\�,��\�m��5\�p\�l6�e|n����\�ʭ[�\"� �N�w\�^�ɤ\�,��^����=\���\�q�\�δ��riȧM�o�\�lXk�D\�UEAj.D8n����3�\�`\��#|�\�\�\�\���$ hllDUU���.&�P�e˖111�\�\�\���u�\�\�x\�\�\�\�\�(n��Ç��C�%��\�}�u��m\�\��[c��\�|c\�O\���|%�&Wл�X.\�E���\�y]4\Z%�\�.�\�\�\�\�,�ٹ�B�\�\�\�.B�2�ݍ\�=H�Qq\06M�\�\�@\�B�\�d�Yz�Q�\�>ï�\�M,\��\�իY�b\�\�\�?_�\�\"�D��\�\��D�z��\�\\!`�B���b�\�p���\���<<>\n\�\"��\�c�\��\\��[�\�\�^�=�\�\�7��\�믿>\�\�\�\�\�\����466\���~�\�㡹��r��\�G_r�<{�?\�\��-MM�67��\"&(*\�\���4��}L�檘O]���j.ߕ\�e\�\��4>�=��9�.]\�ƍ�\�\�$�I�=z\�AR6�\�\��\��zill������v���\�\�\�2_\�\\�\n�\�u�P(\�\�\���ir����\�\��ʥT�Z-\�\�Y\�g+�fs\�ʵ�&��г|\��r�\�a\�7��� \�\\s\r���N\�_�V����t:�(/�\�\�]/��\�\�}�s\�M�}>\�ƛ,�\�*䳈j\�T�ǋЭ}��CÁ#G�����/�\�w�_H�\�Y�j���I\�L�\�{v�L^\�v�\�C�\\��B\\.��\�\�V��\�\�<6���㟪��\�\�v�\��\�;\�sfggw�ID�\0aC���	A	\"!B@$�MD!@Y��$$� ����Bv\��eg�\��Ό\�9<�\�n�\�>����\�\�.w{\�{#�,�\�U��~\��~\��~\�w���b�\��\�\���\\.�\�j%�s\�\�C\�O���\����?�ղ�\�\���9����A\�SW\��n�^76vµ��\�ztg�\\�VI�\��A\�v==�\�d\�\���V�Cbh�\�\�\�\�<�ӟ��\Z\�\�`?\�\�\�:�\�\�+\�\�:�˦�d�He��\�\�~����e��_���\�cll�ߏ$IT�U._�L,\�P=w\�y\'����\�\�=\'\�@ @ `ii	�\�J �ei%�\�\�ܤ���F�a\�)W+���]\��\��q\�\�c�\�>�\�	�\�[?�X\�俾�\�\�v\�{O�<\���|�ER�T�*V�V\�\�\�\�\��\�p8����W\�\�\�\�\�\�t�\�娵e=-�+\�\\�\�o|�D2��9\�\�6ks��#�\�0sy�G��\�<��\��~B�\�```��g\��`n��\�\�\Z�ss,,, ��\��z9}�4�N�����\�\�m֚�\��\������\�\�\�\n.�M\�(�\�4\�\r\n���;\�j�\Z��\�z\�z:~塷�\�\�]��� �\"�\��k�?6{\�N��5�O���\�n�\�S\'.,,077w\�p�z��\�i��T*\�\�\�¾ZF(\�\�̩i�\�O\�ݥ�,��p\�ϝ�D*�\�n����\�\�a�M�\�\0\0QIDAT\�nw\�\"�\�h���\���\�\�4\r�\�\�\�\�G��\�L,Z�׹t\�W�^\�xv \�\�\�i����\�\�\�\�ܹs�Ec�SQ$I�F�&��:\�����M\�_�{,�����o\���ǿ\�\n�\�}\�]\'g�(ck�i\Z[[[\�\�ϓ\�d:�\�\�p099Ioo���u��iD�Q�]�F�P\�s��L&\�͏�7\�H��\�墯����~�N��\�\�X�	�\�\�\n/^�R�t\��������\�3\��$I099�\�\�4\�	!X\\\\\��K��\�\�O���\�\�\�\�Nݻ��zO�^�O�%\�P�7��ܰ\�E\�c�\��~�+�\���\�\�\��\�g����D3�ִj\�\�t\��\�T��$���\�\�!��(\n\�j\�Ёk�\Z�X�b��\�\�2\�$I�\�\�\�\�\�\��b�\�\r��=m�V�cR������`||�p8��ڸ�%�\�$/���,s\�\�1&\'\'��|\�dߺ�T*177g0J8\�̙3z�~i�M\��\���D�T*=��7�\�\�/=���D>�\��~�ɂZ\�Z\�f\�4}�\�\��wj�Z�Z�F��ݥD>�?�\n#�6��X�r����\�R:��\��\�v�\rn\0�\�f3�P���,�|M\�B�\�\�H�RX,\\.}Ĵ�(\n^��p8L8&��r\�\�\�\�(\�\�í\�b{���|>\�\�\�N��\�\�iCl�c\�\0�T\�(@\�p8���2�﷌ڱX������)\n&�b�x�\'^\\�+\0\\\�\\\��\�/��%!��@(|\�3?�r�ѱ\�\�j%����\�G��\�|�G�\�\��[\��\��\'�]��g�_}\�(�\�\�\�\�b�\��x<{r�\�j������!L&��Q�B���52��^�Y�u�,˘\�f.��`0H(\"\nu��v\�NpUUY]]eee���!���p�\\�G�\�ׯ�N��e��\'O2ж�#�`ss��_�!\nO&�T��٤$\�Z�эl¨\���k��h\�مK���V��\�\rWS1ϽwL]�ޅ�\�C~!���[�Ի\�v��\ro|����bss�\�\�U���Q;��\�Z\�f��\�\�n\"�===�B!|>�z�d2I*�B\�4\�f���~/����cA�Ӌ��,//�����\�\��}b���EUU߹�IΟ��\�>\�\�?�I�,,��\�es<�����\���KO\�ҥ㥕+\���C\�|\�pQ�_|\�\��Ks�\�kg\�\�4\'\�Ƒe]�H�L\"�`ee�\�a�\��C\�f3N��\�GWW�H�H$�\�\�P(���D:��R��\�\�\��]�T��#�ϳ��n\�koU��D\"�\�mj�\0\�t���%\"�SSS\�}�z��V���\�wz�/<�i&\�N\�h4x�guQ���>\�\���=4�\�7�8\�jBn�볥�7�nW�\�o~�\�\�>@/���LP,x�\�y\�Z�S�N�D�{�\�\�\���|>�\'�J\��}�\�Q��ѣ(\n�J�͆\�b�\��\Zj\�~\�\�r�\���<\�j����f��h�p_\�ꕫ\�r���ܟp\�\�H2�l�_yۃ\\��\Z\nF޳�\���\�ӎ\�&\0<�\�O+�\�\����-\�ݭ�NQUݙN���I\�fg���A�$\�a��\�\�\�HKD\�>\��ǃ\�\�\�h\�Y�Dߕ\��\���v�/�\�\�\�\�v�9~�8�C��sy\�\�\�I\'��u�\�S�� G�>�U�,6>gNMqy�j \������?��	9}��\�և2\�ܽSӧ�\�vA��H�\�n\'�L$X[]\�\�t\��xn�Ż\�\�^h��EdY�1�L\�I�����n��i������\�\�ؘ���T*lllp\�\�9�+�����\��\�\�L�\�@H&\�\\�U�\��\�G&�Q���\�7�}\�8\�/&6�J�\�\r\�ӣs{�Ѡ��W��~]N\'N�q\�\�E^~�el6�P��o���a?1uж�B�Z\�ƍ\�j5&&&p:�p�\\.\�\�\��X�_{\�=|\�=\�\�\�\�	=��:wi�zD�`\���\0$�\�C�h\�	_kh4�P@�ށn�S��\�&����i�\�\�r\�\�9<^/fEatt�\�\�\�^�\�V\�\���\�^\�\n!\�f�,//\���\�d2Q*�X[[\�ڵkzQ\Z\��\�8\�\�9�@\�F �q\�m�L&\���\�\�>�y\�\��\�N\�\�\�\�@�	�+ȴ\�Q&Y\�H��\�\�gbj\n\�lasCW7��y\�\�֌k��\�Pc;\�\�\�n�\�2G����t!\�h�\�{��/b�\�824�$IUI��~4�]`|�^J.\��ဴl\�@\�n\r�ZW�\�\�\�abb���Y\�i]C�p\��T�\�Ǐ�\�W�\�u��\�L$���\��x�f��\�癝�%�S�TP�\�\�I*�\n\�h�D&Cw�\�\�\�=�Äu�Nv;�*7Y\�n���m�\�W�C\\�x|>&�O27{�Ts\����\�D�QFFF\�\�\�\�f�z�\�&\\cN٥�!ݾ�\�\�e666h4\Z���\���H�\�\\�~���%\�~$\�2###tuu�F��mg#0��דHg��\�j�M\�\�;�rp1$|\�\�old\�Y��ct0.m��\�\�d|r�t2E&�\"��S*��|�2�����Z�X,�\�\�\�D�e�Vk\�BH\�$\�\��k�\Z\�r���,\����z\�\�l�.�\�:���n�>z��a��d��x��#m.v�\�\�\�\�&\0\��F4\�08\�G\�\�\�\�u@�Ƿ�\�Ǐ�$a�Mh\�\�\��$�D;O\�\��\����2Z��\�n�\�\�\�dIe2\�4͐��\�\�\����FC\0\�&\�\�\�\�j*p�\�U.\\Г�\�\�\'c2����0j��\�fL��d6�k2\�4s\�\�\�2U��\n���?\�\��fJ��@.�H\�u�z���P�5\Z�;���\��f*I6a�:\�	\�\�\���e\��+.;\�kT\�Iʥb+��[�S涐H$�ZmT��۶144D$1:\�b� \�2ѭ��΢��mml\�Ķ(\�5���_��F\��Y��\�Βɤ��2\�	�\�P\�6\�mv�B�PЉ`|��,�\�\� \�@�>�_\0O<�����B\�p�CA,\�b1��\niI�9=F\�����\�ߖ\�P�\�\�Q`gΰX,\�&���ǷD���\�5�_l\�\�\0\�RE�rS\����{^����>�QQ\�\�B�@ \�w�n!\�v;�\�e\�\��\�fF{�\�L&\�f3�ۉ�P\�\�tB0�G�-@o�\0\�T�@(�,\�\�\�!��ǳ/�\�\�z��\�\�LLL\��z;�#�M�c\�6\�\�\Z6\�F$tkF�`��\r\0mnc��\�p`\�sr\�XZ�\�\�TU�P\�#I�\�>w�(:\���Q�\�N(��K�S\\jF\���\n\�J�d�GC��\�\�\n����,˄���%=�cy��D\�\��Z�.\�֟e6�7�~\�\�!�a��\�fI&\�;#T�����=[�$\�j�\�Z\��u\�h?��^�;WѪ���\�\�\�fn\�{M��\�\n���8N�GH\�s;�3;�ŒH\�h\�*��u\�x]�&\�\�o��Z?М��\0M��1a=\�\�@4N�\�&��^�f7$I�����￟\�\�\�=UWI��\�S�^�F��G\n	�M���w\"��Z�a�X�\�??¿\�+�`0\�\Z۹m\�ZEVto_�O�-��\�:�\n\�j�ߡ���\�BB��\"$�:<@�\�܇m]\�F\�T,\nW�Y\Z�\�K0�\�\nB](���t�\�\�ѣG���\�\�ٳ���`�\0�|�\\:ՌL!+z*t`#��Z�`6)鉾\�C��2\�\�+K�(�|�z����0I2u괂\��f\�	Ѝi�b��h4��$I\�E�mV\�G�����TFn\�8�J@C��I!\��\�߃j�rly�����i\�f�c�\�\�D8rDw߰Z�M�N��\�Z\����)�\�w��ŋ<��_f|\�(\�P7vw�\�1T��ER\�=�;Βġ��wȦ\�\�@�V\�f�!�L�����d��N�Z�F����l�\��v]~8J%�\�*��	\�>/M�ҝ\�\�\��0z$\�D�a#\���w9f�9����)\�Z�/\��,\�v�	�÷4-t���\�f����1sc��\�|��?\�a�rfz���LO��\�/Q�\�ԆT�\����\��\"���;��b�h4\Z(&E\�U\�$�IQ�=W\�ϵV��\�DFs�\�.Wq�+\�]NN\\_!\�s�\�a�\'�s�uIB=\�ëQ��\"M\�S$u<���\��\��\�\�\�g\�P\�����\�\�s/����Р��a2[\no�㇋\�䐄�ß�Z�Z\�j�RI�^/6��BQq�\�X1�\�̕JeGo�CkA��V��MfG�I�\�Y\�\�\��%�M1!�\Zg��\�hkD�\�-�\�Ѽ\�l�080HWw7�����D,�In;K*�\"�Na�M\�\�;&��?\�6���\'\���]\�\0\�L\0�\�lд%bZ08kK�k-\��\'�!�\�fe B\�eGgIś+\�\���z9\r\Z�f�ӟ��o�\�~�����mE6�Ƿ(��8�.�\�qN�	�:\�{\�\�lM��~�\�\Z@*�$\�\�m0�S�79Y�$�@\��\�\�^��`d9��R\�\�\�>�Mͤ��H��墭a��\'P�(���&n���\�J�����\�108@ D1[H�R�j!\Z\�`(ܑ���84\�B\\J\�T\n!\� \��מ\\�u\�l6\��k�]r��`\���p\�[Z\'\�rr\�A�]\Z\�.!�Ex�C\�}]��\�,�?q?��\�yU-7�\'\�;Z\�\�t\�v�tw� ��!\Z�ў��\�/%��@.�\�Q�TtS�bA\���\�-�.�ڨ�{A$\��\�6w�l��~t@O�\�IH�m��\�*��\�No\�\�°�\"\rZv\�F�^\���L!6Vۡux��`Ot<T�\�\0\0\0\0IEND�B`�','image/png','leonie-transparent.png','Frida','','',0,0),(8,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0`\0\0\0�\0\0\0�\�l�\0\0 \0IDATx^Խw�\\Wy��=�\�\�mg��vW�ҪKV�\�n\�ۀ馘J !�8	�@x��B	%\���b\��ʖd\�\�uWZm�3;�\�r\�?\�3��]َ\��yy>�ٝ{\�O?\�y\��s�k�\��m\'�ٛ�b>��|\�F��~�\�\�߸a#===\�rB��y �\\����})%B�s\�u\�[�?�r�\�����\�\Z\Z\ZhiiA\�4,\�bjf�����}9k����\�Z�\�О��/��\�	\�\�\������g��\�\�\�Z7l���}^9w\"�SD��p>�.Vf1Ճ�ix<�\��ǃ����Y%�\�\��B�@�9hn/,\�\�x^\�\�z\�MF)�\�2?w�\�V�4���_,^\n	x>x> �D\�uE\�1(��\�Xt\�\��\�k\�ԩ~CQ\�\\����[�\���+\���|�\\��\��\�\�-�^|ז.X\�\�Ҋ\�j�B� $=,l}��n�˸זeQ�TB��*����*��,�|��Bc�Q4\�c��l�\�\���\�r&�\�X�zp|�_?��\r\�%�櫯o*gS�hf\�M[7o\�iiiYr/A�x!\�?_	�R\"��\\.�\�fI�R$�I�\�\"�`U��\�9�w�!���1+��\��.]���|�_4�.\�}��j�ڀ\��������\���#\�[/�����aщ\�l����RbY\�<q�)%�i����X,��\n�`�h4:OG/���\�v�XD\�4�^o��a��a�T*ʥ\�R�R��e͟W<\�\��T���(�ʌ�����%�͐J\�M�oX\Z\�+O>��\\\��uwS\�C�?��.��\�O�(\�\�/�\�N[G\�\�\�$�S�x�^���\�T���r=�\\.�\�\�G\�4\n��B�X,�\�ﯖu!�\�05=�\�\�\�f�(�B$9�}�!&�\�P,I$\�r9fff\�\�\��R�033�a�\r]ױ,��1�)T�>?�P��,\�AUAJ,\�$�Nsv�,(\ZZ �ǭk�\�W�O6�ؐ�\�n0X\�QA-˺�\�\����Q.��E�X889=ّJ%C��F\Z��`1�\�\�\�\�l\�K\0�\'\'\'QU�\�\�\�\�����Ū^U\�4����T.W]i\�F0\n�:Dw�aH�B��\�\��T\n�\�G�Xdff\�4�\�\�!\'�\�P�T0Lsq)^p],\�d2\�r9\�\�2��u%l1�x�475\���\�̥�=\�\�{\��\�����K\�;�\0�{6g��I�����\�w�b\�̱3\�\�\�k�V�5��\\UE\�b0����Q\�\�QU�ǃ\�\�%��#�J\��z)\n�J%2\�4�R	\�4�,�T*�)k\�)�UG �J�eY\��yffg����\\.���I6�\�\�o8\Z!��#�\�RE�b�S�{[J�n�+\n�\�t��^A�hx=5\�T\�R��\��PPPH�f7\�g\'��P���_�\�a�\�\���٩J\�b;�lެz��(KhKJ��<\�b�B>O�R��(\�y��]Ǵ�*�*�N�P _\�c��,�}\�|L\�$�Q�T���b&iK�[V\"1Ls^%	�3$�\�\�b �x$@�mI(W\�\��y���ϷX\r2�9�=J&�ƴL�e\�=\�l2�|\�\�d\��-#��\�w\�\���\�yu�\\�]�m�<�\�Ӎ���\�[�{=�����*��B��n��2i\�4\�\�\����*���\�0�DR�Xddt�|>�aZK#�2�\�s9/����`\��B�p8<O	!�z����$\ns\�\�R�9�����W\�^N\'[�N	笎�\�\���\�§s\�;\�\'�j�֭=MM\�Ni���\�f\�e�!\�<\ZB(hB�\�\�4\�p\�0\�r�CĚn�\rD�s�����n\���!���{V߽��$	\Z��}�R�\�f8t� S�\�=\�h\�kW\��ş|��W\�Y�\Z���^��_P~{\�\�r\�#�^�fmO,ր�\�H	��!�T*:��3�\�?\�l�L6C�\\�%E��Du���Ť�jW\��\�c\�\�>Ļ�\�|u}J@S\�\�ډ9.1����������~2\�\�\\:�m�\�S\�K\���\'��\�9�s�Y�\�ى�\ndO:�fdh�\�a¡�hw��\�\�0�Q\�i\�\�\�M���\�]��\�\�.��\n\�@H\� [\�ua\�i\�[J\0�G��W\��ry\n�\�b�R�D�RAJ�\�c�9��s\����\��6~[�x�z���3��Y\0\�؀hGτ���\0R���s�J�\�\�6�3UU	�ö!t�\rP?EH��GE\�41MY�\0�ʼ]]\���]A�[��\�����)\�\�.^\�MWKO9\�\��ILӖ���;�k#Bhokw\�[��(455\��z�o\�kn}\��\�\�.5��a�u�ْ��\�[�n\�\�\���:u�\�\�\� ���VdM��\"X\�\�\��������\�9\�?\�L&\�l�HY7p�\�VY���#	\0\�\0�\"����\�Bt\�#l\�ja��.\r!�\\Y\��>\�o�c��m�\�6���H�\�\�V|>_\��\�~:55ɾg�\"��n�Э?�\�-�\�\�\�\�\�[\Z\"����\\\��x< �\�\r&\'\'\�f�縍P\�\�|�U;\�\�\�Bs,Ⱥ�&z\"ֶ\�Y\�\'	�)*�iR֭�8�@\0��\�{\�\�\�\�\�U뺹rU7[��\�	�)�ߋP^�\�\��F��\"\�\�s\�\�\�\��.��tC�]hݰ�^(� �y�\�\�\�ຩSG����~:�￿{��/9ի�\�\�k��=�o7lܹ|�r���\�#�I\�.\��W\n��(l\�m\�/\�p9\r!��n�%Rӎk(��\�E�!-R��b�ѹ<�\��\�٢N\�41-�%%�e�/阖�yP\���\�k!\�T�\"�{4�^�D\�OK4LoS��x��_CU�RSI`#5\�\��V%%�/����\�\�3��.�g.1$�p(Lgǲ�\�\r��8q�8\�N�<\�	\�n��v>��\���]�\�\�(�\�S;\����\�\�V�\�LZ��B0$�\�\�b\']\\\��}ug3\�\�B\Z\���\�g\�b�\n���T4<B�x\�GX\�\�\�\���|Y��[�A���\�g8;��P�9�p�\�7�\��E\�\�4B>/���h������\�\0�.w�h?�mV�X��\"\n4����\�\��\�00��W\�Gu*�ʹ�1!z��\�?0�G\����G��UaQ�z\�\��\�\�j�\�\�숦Y���Q!) 	�\�\�\�$\�1��ib\�B��\�g�Pkz\��j_!�4\�>/H������\Z�\�i>6DK4H\"b\��f6�7�\�DU0j�\�0G�\�]vYG:�ؒ\Z��\�!�)\�\�\�n\��\�f:���\�6�\\\"L/�bZs\�|8\�\�{\�Z\��\�/>ϙ]�^ ,}cgW���\�d2K%���0s8��f\�\�\�}7\\Ěe�NK�}�D�\�n/V\0�@��\�,\\�WQ&�\�\�:W�jn��1FK4Dc\�O{Cx�\Zq\����B\��\�|��\'P��\�Q_Ha{=\�\n���6G\�Wu��\�7��_=�n���5\�·B����@A���u\�>��{�\�2\�,\�F�?�X��\�����@ \0\�\�?11A2��Tq\\Y�\�4�k��`\�\�e6\��`VL,KΗ=\�U�-\�\�)\�\�\��.\�e+h�¦\�f:\�aTET��r�\��\nQ#\'Լ,���bd\�K8��KQwO�k6�`mg85�\�z\n@Qϕ\0M\�P5\�4o �\�J�\�{֭�\�\�%\�AUX�����\�\��v�,`��V\�r\�&^\rw2g�RR.U�\�%@H�j�E(U\n)@��Kq`{�ss�\�\�s]��+A.\�\ZM\�k���_�Il�,��ttð�B\�#�@\�\�\�=\�o�!��%\�$\�yҙt�w�\�Kg{GPAy\��ۿ\�\�\"p\��?��p$�V\�<���333@$F���ݿ@Un�|ѐߝn	��4-\�es�\�ըKD��@\�\�y�\�<�9v\�8�{\nb�G(\�}�J@ܶ\\˺6ݶtâR6p�\�r\�,��)\�%k�P.p��I�\Z!�Nc��\�X�iT:�\�#=\��\��\�\�\�w�i�Y.oHϥ\��\�N����U0��ak��\\�q9뺛�Ŝ� @/X�������TJ\�\�T\n@\��h\\����p\0�k�쐹eZս\r!l\�+\�\�\�\�#\r�\r��\���\�x�\�~�\�ނ�vK�\�\�\�R\�\�\�#�v��n�\rA;/X�_� �R-U,�~��\�B�X�2m�D\�܄�\r\�[X\�\�\�H518\�bM\�{4���e\��\�􅱮�Ănjм~��mOG\�{>�\�u\����M$\Z��G�J�ZG@o[�޶�m��\�\Z���QYr7\��i0M�Jɉ�\�c,�j*;\�-�ݐ�#B\�ߣ�(`�\���+X\0UDۻ�m\�e�\�8~�W?O`TVw�w\0�Z��v�v۪NbAww�~��J\�^��~���+\�\�x\0jF��u\�HD a��\�\�H���x\�\�g\n\�J\�Rr✍�*���\��\�\�/\���uT��\�\�Q\���V?�0:\�\�\���j���PIi�����\0`\��n\�Hv�\�\�ƣ�l\�n\�\�i�\Z=\�O�d�\�[�\�]���\�\�v\��0�\�W�Q*ܔhl\�P����\�ک\�uͱ\�h�F�\�`�z��S��`�\�Ry�zuԊ���\�jAJ\�6,pD$�iR�\��\�y�ο�0\������<7����Is3 \�L\0H\�\�ӆ��\\.����^\�}��(�\�<�\�<��(��cD��7\���������e�\�\�c��rѰ�#�B�K\0`]WrQ\�ڜbT,���\�\"\�(X\��TwVM� M�\�Z��\�Ki\�+%�b,��u2��PSǮ\�\�L\�0\�:^�oU~/�MѪ�s\��\�+\�\���ũ�{\0�67M{M\�NV��\'\�\�]ם�B\�:/.�sнc�%q\�l29\�\�\���h�&�\�}!3$�\"۲ll�fQ\��=[\��e绨![\��!Qo�R�\�\�ؘ\�K��\��s�s\�\'\�K��c�b��LƎ�!h�\�\�[�*�\�O9@��Wۖ\�\�Jr\�B�0�m��zT��Ң��/�\�H��\��\�C�\��|\�\�yʴ\�\�M�r\�\rw\�}r.\�\�\\�ڄ\�&�DV��\\$BP��g\�\�\�3RZc3�\�\�{��⩳CSi~��O��Is|x�;?\�\�\�,s�\��K)ґ	!��\�+��\0�P}�ゔ5\�٠ ��M\�\�\���HiQ*\�6�Y`f.\�t:_kQ\�\�b����%(\��\�\�9��E7d+6,\�8�\�\�_\rx+�\n���T*\� �-~\�@�\'��\�\�~�J4`\�\�e\�e׉Q���m�l\�n�%\Z£h�\�r��	�\�\�\�{\��F�ˢ�}w\0�.\�uo{�ᄷ\�%��i���\0-`4��P\�\� EQ�!�T*XR\��I\�\�b�(���*}\�\�O\�ͥ\�4�\�\�\�\n\�kONgV�cY\�?M,\�5\�@\"\�;\�\��Ĝ�\�\�x�����9\ZbǊ\�v4�,!\�\�pc)��e��	�n�x5W��\�AA��\'i�%l�:�/Q\�\r�\�\0^M\�\�g�r[���-4-�t��WU)���eY�\�i\"\�0�R	i�h>ߒ�)-�\Z\�\�0T\Z=ed�\�\�q���7��վ~\�~/�\�\�����\�!�E}\Zm\�\��\�\�ìn�sAw:[z��\�\"�b\�`�\�ӳ46&�ֽh�\�݇�����b��̦99�b,�et.G�l\�\�u6EY\�ވnZ\��\�a^{\�z:�\Z\�T�W\�X�nXܻ\�F݊?���֊\�\"�i�ξ��ctaItn��\���\�t:�4E\�e[V���	\�N���1���0LEM\�t�=0[�- ]*�wp��#\�$B\\�n9\�\�I��(U�Y�\n�v�(Ț�q.r�<�Bhij\�\�\���iR�d�e\�\�r�fp&C�X����bWI2_\��\�,�\�\�l[��[��m�:�U�V�k�\��Ӈ�+\�\��o�\�ytCτ[�%Y�$@ۺ\��,�\'�\��á\�<�c!�ݼ�\�\����̩Q�\�\">\r�l\�Q��I	��\�T�L���v\r���n0�\�s\�\�c4G�l\�mc\��Vڣ����J#����2RB6�G�74�-\��O�K\�Nf83�F7j\�H\�\�\07����irxx�LY\�ʍ=:3A�b`Y�붭f��ZB\'\�=	����a<n\�\\R\�+\�\\��\�E5󓍉\�@HA0��\�+6r��\��ʺ��\�\�\�?9䄬k\�J))\�&%\�d2[b<[d0��X�0����E�)`Es7lZAK$�PD\�^\�bp�9\�)\')WF&�(�Jd�:��9\��:��A*_�l�\�{F\n�]_q������dXd\�:RZHi;�ͱ�{Zȗ\r�Wl\\\�\�\���tջ�NSS\�����v��9cw\���5o}Ui���˖-�V%ݡp_G��|\�N\�\�ap:L�2�<q�|\�^	�\�b����\�\n��ɑ-�ɖm��ϣ����\�Wu��9F\�\�A�\�<f\�\����Dpvz�_\�\��T��nc����D��\�Cȣ\��j�T�搗�\�KK\�G\�\��\�kRJ\n��|��L�d�Bٔ\�B~.\\��`(���I��S�L�\�\�\�\�uF\�FPB\r�\���~\�ο��\�yߔώ\r�4\n�1˲����lC�*P,k��be\'NR\��\�@�`y}H\�ks�\�%A`����uҙS���M\�26;G���h�S�)�Z\�ܸ��Φ��\�hI\'\�ȴ,�Lqh\"U\�\�B@ԧxi���Fc\�b\r�\"����uy	 z	L�@�H�?M_s�X<J8р)�[\ZB�����t�o޻��TmQ�(*�p�\�\�\�7\r<t\�\�Uoz�ݛ\�������\�yc\�\0bm]-���&i�J0\�\\Yyɵ3�\�-j\�\�d\�Ssskq{7M����r\�ѐ-tKP�^Nj�\���P��\�2Q��D�\�\�5\�\�,J��7M*�dlx���YΞ\�?�\�\�\��Mqu�}���y�cAZ\"A\Z\"$�[�6w��#h�(�\�1Z&ZUu\�i��)-CG���\�Dv�]-\r|�bA�R9\�\\!!��r�f\�_Ȍhw�SS�\�\����={����茶�oK�\��\�_Ii�\�*�\\n�\�G\�o\�\���X\�\�\��C\'K�\�+D�j\�\�\�1\��K�Ѳ�9���\"ʴPF\�\�,�a`9��\�۔\�J-�\���ۛ\Z	��B׊6\n}=d.\�\��\�\�J��\�G@/�\��\�ՙ\�\"���\r��V�5�\�\�\�\'\rT+O2�%�\���6\��U��,gd!��p8B�\�񐶂(��5�V�D�RDU,g9#\�	!�B�\�\�\��H\��O�8�\��̤3t1k\�\�\���v\�_�6ʅ7����+����\�\��{\nsɝ\���>3�1g\�\�ɣ�h*�\"\�[\Z\'*q�?�!��\"��.�L\�y�h?#3�yR\�/�\�\�n������\�lYK\�\�AZ���\�(T:ۣ�6\�\r�\�\�Ӥ~����� _.�\�).\�h��\�\�VS�g2Yv:A2�õP�,zT��{�>�\�\�\�\�uw\�L�\�(\�\�y?Y]c����\�6-�L\�L#�\�\�J��\����\"��\�\���\���\\�p����~����\�t\�;^w�����\0��\�Wr��;�?�v\��ѯ���!+y*��\�c\���G�`\nLEe}*l]<�\�<�\�#\�)�[�\�h_�aY\�A�Tdjb��R�\�H4�051��OpنU}>T$�4�b��9��PR�.\�q\r?\0�\r\�O\�ҟ,�S��2�ؒ �+�ۃ\�	F\�\�\�\�Ha63Gjv�j�$m��Ř\�ɣ\�\�\\�n%���O#\�h�)/Rќ��0{P.\�f2\�L\�\�\�\�3���\�ף��\�\�i\��>�\�\�\�Z0ڸ)\�\�\�e[\�\"�|�❯fÊN>�[��\"�ͭD�1��\�-�9<\�-��\"�n\�s\�~\�F�\�\�+���Khoo\'�˓\�8;p��we\�\\{G{�\�x�\��\�I~\�A�eǺ^o�֟�*�\�D��UA�\�\�\��\�\�\�\r�¸\�\���8�/\�\�\�LcS3\�ӳ\0<�\�C���\�l�w���\�ٻ�\�\�a�޻�\�CX\�\�\�ս��vV�_�\�Ș>r��\�\r\�\�h�\�X*�hli�T,�{�\���\����	ښ\Zذ��_<�4\rˣ\Z�\0)%7�\�<{t�������u\��\�ew>�������)\�4����B�\��I)H�2\��-[ƫn�7�\�\�+�>y�\�8\�{6�|^���h�\�\�5k(�\�z\�Q6�.#跥\�\��:��`	��\�4=gs�s��݇FY}�\�@�\�,i����$s9\��\��\�\�сeY$\'\�س\�Qr٬��m)\n�Bt��\��z\�[\�GsS#w\���d�E\nNn�i\��#\'�\�7��<	.|y��V-\�\�2M�\�ac0Oo{\��\�\�9;>Õ\�\�\�\�\�\0\�\�	�:�r>\�	��8t�,x\�˸�|\�Gw�?}��$��\�A��\n\r�8x=\�t\�F��D\0{�����w�\�Ϯ\'cŊ�\0�}^r\�$�\\�@H�\�\�c�ŗ�v\�\ZMSi\�y�r\�9\�\�F��oj�M�e�\�\�!To�\�\�zt|\�}\Z\"!n��j���\�\�6\�Y���3�g�#�i�hl\�+����͑P�\�\�\�t&\"lZ\�β\�&\�(�PХ$�tk9R��>y�r\�~c(�L	h|\���P\�\�>�:\�qn���{\�oX��+o ԫ�z903���!µ\�6�rY+���Nn��\�\�x�ET�\�\�d�A*E�[�+��\�I\�u�\�]�ͼ�\��\��B3\�`�p$\�ˮ{]\�˙K%B��c�+W:��.\�\�km�(\�*�\�O���x��+`{)R\�J�D�\�hkk\�\�\�\0\0 \0IDAT[ɂ7\�\�&DS4�\'�bV\��d_��iim�R*�z��Y���f�HiY\�L�aΌ�c�r�u��Q�D��!�	�O��c�9�i�n\Z���r��6z���T	|\��JtäT�G�\ZΦL*�\'\Z�yٱ~��\����\�%��)`\"S�#��\'�\�\�\'ټ~\rH;�VʚQ�|�@zˈc�\n\�0Y\�\�mN)Iqv��seUʤ\'FыEۇV5B� B@�X\"�z��R�spl�\�\�[�ɤ)\�,y�)����\Z{�\�\�<���k\�D���\��U\�GZ:ى\0J\�4���\Z�455\��y>�κG�	\�;���($�\�!6�-\����d��|��\�5ghb\n�%\�9�b\��-�(Ut�N<&�-�_��\�\�vܷ[�3�ӓ)&fR�Ѹ=0\��vkRJ0*ȹ	J\�\�N�\\�R�8�߮Z#�]_\��y	��xT��X,\"|�t�|\�)+�)0���_E�\\\��K4U��(���\�)��v��]��jx=\Z\�p�X,�\�\�#p\'Z4$>,F�\�83QkS�xH46ђ�q\�}��T*sh`�X8@Ű\�m\�:Є#\�\�\�xT��d�O~�ǘ�\�\��x�\�_a\�{\\)(�\r�9v�U/�`H�^w�	��AoY�\�\�4?��Ӱ0�3{\\o\�UU�J����@/䱔2�\�0��۾5�c\�o˲an\�\"� oV�E#ڄӗ�\����	©5\0\�u�U��N\�]�t����ı!Je\�l�Cz�t&\�k���;\�\�\���\�|#��	�\�AR�\"�\�\�e�\�\�7�\��ch�ƿ|�=�\�++\�[H�\��kI\�@$v��\�\�q*\�\�\�|�lI�RR*T\��D)p�US�zm.�x<��<\r�WCQD��SG\�\�h��Rr.(nW	�abYF>�R.P\�\�\�F\�\���i�y��Gu$���\�Xvz�+\�Nc�e�+��\�,�\'l�\"�]C\�\�~�\�w���7����������T*\�\�}\�-�ĝ-��i^O�\��rՎ�x����#	�-�h�\�ȖJ$B1�fU\r��\����D\��b>[���E\�)ކa:\\$ꄣ�9�=0Y�WY\�b�\�\�ʍ�J\�iQ�v-�Ä�9�b\��0�k\'�T[�\�HC7�z��\�\Z�\�!|\�k�i�\�BP,\�M�\�\���5�#oE[�\�?\�ʖ���H�O���,kK����cvH²\�I\��\r�%�s\�U�\�h\�O\�\�Ͼ�~�\�]��ʎ�\�qgbOD�ɗ<�O\�؇-9yDRJ*�r\�t��.q\�\�Ŗt\�\�\�\�yfK��\�\r�sI�YA�zu�UT\�\Z���ސ\�б�R�\�y��h)1ӎ�\��댫zY��\�z�L6��\�Ls\�\�鼓�_e0�ʎF�\�\n_��_�G��-�\�g\�\�.z��\�x9;>P�r#��\��`L�䑓�\���k��ÿ�E�%�Hˢ>.oGO�\�}׬\�(��)\��\�C*岁�h\�\n�� l\�\�p\�s��Ē&\�|_%�Z��V�6b\rӘ�la\�d�F�\�:�P\�\��$�\�J?\'R�gt�y\rL�Q\�$�\Z|�\�\�\���Q���^/ߺ�RE\�|���wpa\�j@P�\0�|rrJ+�f�sN6��ꋐ�v�}\�p\�F^}\�V~��\�\�#a�~��ӧink�����\\,��T�g�G�bCP�0�\�Lg)*T�I.E��(�\�_�*P� \0Hw}	��\�V#�e2���-р@�V��Sg\�!��(��d\�	q\�\�\�%�\ZB4ă(>{\�\�#��%s lb\n,�\�=�1V�5\��\�\�<�e\�E�\�7O��a\��5\0B(�aT*%%9<���c#\�|��T�M+:�MgM\�񪫶��1K&\��󮝛�\����6�*\n{O\�\�\'��-�n\�S|\nx�+bя\��x��~\��Te\�9�_\�DR���h\Z�^ˁu\�\�VM\n�b�i�T�/1>�\n>U\�S^\�R\�0i�\�{bMU\�i�s\�Y\�\�\�\��}x\�-�\�}ݵ>;J�XfSO\'N\rV���&��\�ɖ\�rZ�eY��N\��<\�`J\�T*M\�\�1\�\�\'p\�Eٱ��\�\�$+��H\�+N\�qɆ^.]\�\�\\�\�\�\�\�b	�B���7�=}�\�n\�K�\�s3�#�h5�\�\�4;�!\���Qq�i�~�\�6ڎð�\�տ�nR.\��e\neV�\�\�yA/�P����쑓tu��zE7M\�-kټn�\���}˙\�\�Q���If\�9T�w�uզ�Ҿn˜7��J\�141C�\�eE[3�b�#\��\�	���$b4\'�\�&�r�\�G\�N�\�H�J��lO�}o�\�..���(�K)Ղ\�<#i\�c)AJ;�\�\�Tr\��9P5\�.�A<\�P\�rZ����Гε$�+a���A<\�g6S\�\�\�g\�f8=8L&3G4�4-\�?7\\���O\r\��jl_\��\�\���Bɒ�<ݺfsF\�\�E(����\�\�C�t��\�/\'�\�\��zزv��4F�Je��33W\�\�\r\�\�޷��D��σ\�g\�u�\�v\�#^ ��\�lpW\�\�8:v���p��tz�˙H\� Ssi\\\�\n\\\":u�H8H0�\�\�N�;7�\�\�MJ�2~�FG\"ʶ�e\\���B\�$kB?o\�s\�!X\�m�c��;_~9B³\�ΐ+�*�Y9\�^�Q\��\�Ǔ�׷;_�d~��>\n�2k���yT*�\��l\Z�@\n뗷��Kas�lo\��g�y\��J���@(�\"���^f?\0B:�-ۯ��P�7Gi\�\��ۨ\�\�\�y�Z��8S\�l�XԴ��!\Z���v螨\�\�\��G\�\�BQPx\�\�i\�~�M2tv��غ�\�\�\�002�a�D�~�;Z��\�W{bJ1�\�eox��y�e�!�^v?����>¡�!ZZ\ZY\�Ӊ\���3�k(`ۺ��\'R\�=9\�\�뺸t]7�b�L��\�Q�\�����\��RP\�UY��8�@���^U���\'@U4��\0��\�Ifr���\���v��1��ػ�\�%\��g�����\��%f3v�\�\�\�u\�9=�\�\ZWl]\�^\\��9\��\�nV�7���ijj`\�\�~�<�/ٳ\�\�7��\��\�6\�б��T&��\�/~K$\Z\"�\�lX\���\��5O:	֯\�!`߁ÄI�\�,O��1j��	B~�U�\�k!p.�\"[�ے\��jX�Ef.G��W\�\"� \r� z:\�u�Ҫp�\�GKs^UsPj9\�j�X���\�\�B>�\"h�\�j���\�\�\�{�db|�+��\�\�\'�=ήg����8�J���ן\�K����\��\����#����\������]ƞ#���Iq�����}��<y��q\�%�1�g��\�m�x�%뙞\�3�\� -ͧ��	���`��;yv�S#6�T*�T�b��ԋ�w��ٶ��C\�\�:\�l�\�x<v\�\�E��N�{`�\n��)��?\�C\n�\�He��ꢵl\�\�\�����GCl_��B�̭�>\��\'+ۚ\�u\�4-m��ׯw��h%�h~\�\�\�q���g��SB(?-�+���\�>^\�6�\�t�C�\���\r��[��\�1,�|bŒm�v�餯�	EUPU�\�k_�x! AJ�߸\�~&�)G%ف�r�=2�E�t��v\�uE{3\�`��\�I\��E~�\�\��Q\r{\�G����=\0�W�wB\�\�\����\���*\�;\�\�\�k{�q�CO�\�������\�\��\�Oo~%\�ۛ�\��h\��\�x�;\���j�\\5y�\�a�w\�2<;t�g\�\�ٍ���|\��o��%��\�\�ظ�\'\����\\\�I\�l[\�\�ꞎ�98QS(\�ʎ\n/\\\n�Or\�o�\�mb\"�\��\�$�rUQ\�4\��\0Kb���9\�2ʺ���A��o9>}�M+�\�hi�\��\�!���J0�± ^��)c?7\r���n�:x�\�tӴx\�+.\�ݯ\�\���m\�\�o�o^ǧ��c\��l.\�\��C��\�\�}?��\�S��?�iY�q<9:t\��3��\�\\u\�]���m\��V�\�.deW\�ώ2>5G\"\��K�\�V�n\�*��u�|^\�R`sr&�\�\�\�QNO`\�:�?����r�B�T\"�/�\�Hg�\�\nEt\�䁽�8|v�-+�928\��t�7����\���\�涂}�_�\�Nc�OΌN�\�\�#�\��\�o\�s���+��cEW\�{;i�G�\�/\�_n�E\�nص�\�\��\���]�rD\�9�r\�\�\�=^ʤ�\�\�C���\��/�t3ဝ��i*kz�\�\�\�{�\�\�\�]�D\��\�+\�߁b�\��p\r\�I�AoK#g&�y\�\�I\�t��+��{5>��N�\\�\�\���\�\'�\�/!\Z0<�D\"�\�M�`\�\�^\'M��I����\�6�\�\��\�\�>\��\��5�m]×?��b�\�\Z@J\�c\�\�_��5�)k^\�\'�J\�Pfbx^\�\�\�3�Y��\�ӥ\�\�桱���BI\\�iuuG�\�\��?{��GX\�\�ζ�+�C`\�~U��uL\�Z �\�\�N�y���\Z}-�%���J26�\�C\'Q\r�İL\n�2\�|�=\��k\�>��`\rWm^Ǜ����_~%=����>磨�HCͣ:7m)(\�:_�\�\�;~��\�\\}\���\��с!>�\�r\��\�x������O\�\���\�yUi\�\�\���C�~\�>wf\�\�=?���\�\�0�����h6�BA?Wn[\�O\�\�g�?λ_s\r�P-kM\"Qcl�\�\�;Y�M��w.\�+[MSiJ4��inl\�u}�29�\�݇�{׾j�͒���M7pՖ��T\�\ZP	R9O���r�\�\�E�hU\�/�?<1\�=�>\r@8`��\�nH\r�\��g��=�<x\�\n&Z\r\'Z��\�\��f\����k\�e׽\�\�3�����V��5\�h\�yݵDC�\'f�\�\�\�#O\��\��ꫜZ�\�U\n[�S\�^\�Y\�\�\�\�\�\�\�~\�OJ(K�\�e;n$\��χ\�k�l��\�c/D\��<�h\"B0b\��`���\��\�?�\�[\���7^GgK����r\�=\ZJz|�]mk�|hx���%:9?6���\��\�ǎ>�)i\��ۚ	��L͒\�\�g��ơRnn\�U�\�4�\�>FSC\�ٱrxOBj*M�>@V�N����`9��\�8jͩN\�1ػg\�-�B\��� Q5�\�\�[�{B\�\�ӣ����h�O���Å|rj}�\�\�\�%��T�e\�\�\�7}\��\�\�˖\�\�gGO�16\��cBU\�2\r\�?=;�\�f�\�)����\��\�W|:31\�115����Yl^\�\�B�P���P�ϹHZ�\0��\�r��^\�O\�؄\\�˝H�[�EB \�s�\��\Z�\�\��0w>�\'\�\rǿij��\�\�r\�d���\�-�\�\�ܴ\�\�\���8q`b�]?:_\��\���\�\�\��=mŹ�&O P	\���~\�R\�\�K_?rp��vn_\��\�~��\�cѤ\�R\�N\�aT\'>\�.�\�XW}UC�\�W�5O����>�IċIS[^��n,���)\���/p\��\��/û\�w\�I��\�N?ޟ\����\�)\�}E�~�ޝ0\�|�p��n�\�\��û\��\�\��)\�{�+n6�E\�z\�Uܝ*7Ҿ8�,`ljMS	�\�T@UQP�wp\�MW\nj\\_\�\�/<^�N�\� �\�\�{\�p�ٙ\�\�r�𓏼��;�\�Ϋ���z�~�{\�\���\�O���\�\�	�5N�\�X/XN�^�za1x\�C�\�\�\�=��a\�\�N��\�\�\�3\��RӲ���f�k\��w���gq�u���ǈ��晑	>�\�%�����\�ܒ\��>_x\�\0X�i\�lvzl\�\\*yA8\�W.߲vުQ(\�\�\�9�>�j!!hj�28>\�\�\�47_���\�\���\�����\�gx�\�12\�>��x8�{ ��z�6N?nԋ�3^MSG���R-mZ&\��\�}<��`��~s�\�+=5px\�\�|��\�\��l�073�\Z\�4pv�\�\�\�\���G�\nB�b^����S@`��ض��CC�6�sAO\�\�-�������-=�X\�\�\�\�3�<�� �\�z��i�\rK:\'���.����X�\�\Z�l\�����c|m\'\�}\����\"]4~�����r\����\�%���\0������\�M\�#C�Je\�\�\�Q�\�[��R̗\�US\�%Z�	\�h��гHg�,kl�n�{5\r�\�K_\�2.\�[\�Ʈ��C�F9|z�]G�svr\Z�\�C,���%��!�&\�hZ\r5�i�\�ů�:0_\��o��z\��E\Z��KB\0\�\�l9SHͼ��\�p\���+E_w;���ҔT�\��\�\�Ɏ\�noL������I~�{�a�)\nA\�00,;\�W\n�\���m\�~��\�<=\�\�\�e�u�\�ۤ.�ڞ�K!�F$n7\�V9x\�,��,<�-}�65rf\��^(,������w*��\�_�~v\�ԗ6�\\\��\�\��U\�m\�\�z\� 5�\�8o|���\�]�\�G\�0�\�#��N\�(�\"~?���`ò86:Dgk���\�\n�ښ\�\\XW\�\�\�\���! \�v|[�\�\�ey\�\'�̣Ϟ8޴|\�\'^~\�?��\'}\�y�\�^��\0X}\�+C���,\�\��W\�y�����׃\"lQN\�\�(\�WƮ_o��\�\��\�)@5�ȕJT*��S\�\�TB\�[�Si�V�W\�&k�xK��[e�\�{~\�Ǿ��P��}\�\�\�~\�\�\��\��\�K��\0f����\�OO�\�wվc��Wl[\���f�\���K\�~�d���r>1Lˢ\\1\�4�>\�C\�\�#\�����}��^痌��_\�^\����p�C�a�\��3�|\�K?`\"�=��u\���C�\�6\�K/9\0�<9\�\�\�����r:������<v����Ρ\�FՅwg\\\�\�%AB2�\�g���O\�2�\�������\�[�\�V5\n8t�\�\Z�K��ꄝk�f��\�m<�\�\�\\��\�\�g�>��s\Z|	\�wB\0��-����s+\���5\�#\�ֵ+lc(�\�\�0-]�{\�W�F�\�N\"-S\�	x,K2=�\�W{�ġ��\�j\'�QE��\�\\ �xbMQ|~W�H\�{b��\�%%�\�.���3\�ӋT~\��;#�\�ٓ\�@,�\�g\�;όL4l^\�\��f�E�\�� e���N\�bHr���ϋWUi�i�Gپj9\�ۚ\�nmrư럓��p���b�^�7��\�\��\�����\�\��x\�?�|\�\���b\�wF\0��>���S�G|ç.|\�\����}t�\��:!\�]/\�9�\�Vˋ�\�V\�\�|>\'$�y<�5\�3�\��K��uচh^�xs�\�N�B�\��Ӽ\�3_\�\�ٱ�־�\�\��G�\�c��\�wv\n�\�\0�\���\�Գ��P\�\�\�\�\�·�:ioN\�\�Ն\��\�?\�s~��tP\�kU{\�\ZK��y��C4D��\�!<u?hW�\�~)B\�E�\�P���ih�:.A�T\��w���\���;ٶf�߬�\�5�~\�?���\'��;%\0@z|��\��\�B\�G\�\\�����9c�\�.���ǫaT��7%ݨ��ݕ7�w\�\�}�Ѓn\�:��h�h,�\�v��\n_��>���\"�+\rŗ�|좷��/�\�_�\�\�\��\�9\0���\�\�\�m\�N\r�1_��]��a����yP�׃Y\�1\�:/�>dq�r.\����zK�*\�h�HCE��\�\�\���\�$W,�z<��\�����>QX�\�\Z��\�\�7�Q\��o\��H0ݼ\�\�뙙�\�7O=\�\�\�,�lZM8@U�S71��:Q\��Ŏ���\����\�X���$�O�\�?�M\�~d/m]kh\�\�avbXT�\��\�\�\�\�\�\�\�%��+H���ƨ�>\�ݻ!v����\�\����sft�\�k�\�\�AU|>���e�DXگ_\Z\\ؒ��\n�x�`8\0\�~O�?\�\�_}\�G<{\�,�7]ƛ\��״w�\�ԑ\��\�\�l�\�}\�\�\����\�\�\�\�\��\0�\�Oڎ�\�\�p��O��c�\Z\�yޖijs#g.)�g/�\�\'�\�߰\�j�?͝y|ŕǿ==�\�Ҍ$\�,Y�|\�\���mlǜ&�C6C\r\�\�nvIv\�$�\�\�I��H�	0!`p��#_����-Y�m\�\�Hshfz���\�e\�6�$��|F3����~\�իW��\�ڏeӓ�qp\�[��(\�\�^\�\�g˽�	�`H\��d���T�9�:\�3˞U��`w\�:z�\�\�\��\�ƭ丼,���_q\��\�\�w��*}\�\'B�y���W^e͖\���Me\�.i:�\�\�sr؝3�^��\�c\�m�X.\�b\�~ +�\�h�\�/PZQg��������)�\�\�LEQ����b\�\�8\�6�Z�d\�\�Q4�\nRN�&@_�7�Q,���������Sl~k7NO����E�}\�*\�$o��$\�?�4\�\r�>{��Y�\�+�\����]�8+>�\�6��\���ٜ\�5\�;_�2�Z�.�\�\���),�F�\��J�\�5l�J\�\�\�\�ɶ\�\\��/��\�;#\�i42\�[/o\��-�cS\�\�q\�*\�\�z<.\�)��g�)�F/\�\�\r�[BK�\�p����44��l\�$����P3i.�*\���\�o�\�\����\�o�\�+8��35EKj9��C\�I��+�\��jw\�\������\�\�~\�3:�\��x\�gO�|+�J�R���B�]���s�Q3a�˔\�L�y�2P`ߎWx\���Q^5�\�\��9.�OVH�	�\�~����+z:��\�\�5\����L\ZW�gL=\�b�y��_d4����m\�\�[�y��\�~&L[�ڛ�Bq\�8�7\n\n�]\'�\�7o\�bQ��_n�՜rS\���\�\�8\�\�\�w^ ��\0\0ZIDATb\�_�\�\�\�0\�+*�Œ\�}������wK�X\�\�y��\�:\����o�XT��y�X��ӌ���ݡ\'yF�Mi�KC�X,�\�㡫��\��\�n\"� 7�^j\'\�\�\�)F1D2ɱ#{y\�\�\�y�C�\�\n�.-bjmcK�pdFA7\�f����o�\�^��]}t��CZ;z\�\�b�\�Y~��\��M�\Z[�\�x�G~�e��$7\��M�7�f\����\�j�@����s�\�6>�-Z��K+\�_\�L\��Od\�\�ȫ�)�u\�~ƛ�o����X�\�\�i�	�?��g�\rh�FW{;(\n~��M~\��ן\�u��ʵ���VSWI	�X�����\��\�\�\�l%3B:�ł\�\�\�\�\��\�1o\�Z��A\�J���`̐��?q`�6\��\�/�<c1�x�`p�ۍ\�e�t�\� 3���\�C�>�l|����-����z������sھ��/����=	]�\��Y�X��\�[�c\�Dd<SOf6K��q28�;\�AE\�,�o\�H\��X��F\�\�\0\�\�-\�p8]��\�_\�no��\��\�|�\��\�MF�[6�͊�L�g����C-\'�XT\nK���\�JJ*Ǔ(W�\�_��uR���P����;DQ\�8�\�\Z`08DJ���\�S��Щ�	̺�kO�5\�\�E�I\�\�\��u\�<q�՛���֐Y\�48����7}AQ�/^�w\�_~�)��B�\'�F	\r�̔&\n`�\�\�q�p{<��	���\�\��d�\�:|�B\Z?|�`_�l�\�\�BT\�JI�x�Jk�8s	��N^\�p?\��i5�\�x\�B�=2�A\�� ��\�\�q�s�\�ߡ����\�J3���\�F9IP@\Z����P?\�\�f�i\n�==�8sr�X,25U8B4&�g��Պ\�\�\�\�veT<>?׮�\nm͇\�\�X��3�-�\�\�_{�\��fV�q}\�=�{\Z\�}��\"�,[;\��5���ʰ�\n2vNg{;ݝ�D#�DB��l}=��hk�����p�Ӊ\�*u�\�b�fҥ\�c\�wo\�\�\�T	\0\�h�7�<\�\�?����\�\���\�7w�\�ɱ\�ɱ\�q8\�oleWC��\����8~\�`F��U�T\�R�%H&5�\�&�J\��\�4\�l�{zio;NoW7�p���\�IM#�iĆ�\�\�젻��D<����\�Z\�+(e��뱨�5\r/kܾm\�b@㻯N\�b\��6��y�on@\� ��\�c�S\�l\�c�A�::\�\� ]\�*kga�;9\\��9w��ם\"Ů�_\�?��\�#��珥�b\"M\�]�s\�C���T*ţ�_\'�%����֦\�w�\��O\�G\�fݒ}\�]\�I3�io;�\�\�b\�4\�\0�I\�\�\��2���F��H(LOw�\�l|-V��isVPX\\��Յ��g^��̘e&��\�c�\�}ۧ\'���Uu3�:{9�E���x,Fxh2gx#\�\�EL�����M?Z^AE���?\�\�\�\n�R	����7��\�Ŋ��@�\�\��yk�\�Slܶ�=$��wv�����53���ô�k�<k%M\r�x\��{8\�|HJ�\�\�Vt�c\��\'�\�r�\0��r��\�A\0Y��$�a�6�\�\������WO�f\�<�R���/?\�7��ho\�\�q����pN���\�DYIl8�sW\�zt$�H!�/�!ȇw{�(*�%6\�p�yT�\�\Zhؿ�\�\����H2{\�Z*��P1n:E��\��\�{7\�d\�ۻ�b�v�B\\n?no�E+?ø	�h>��\��>]�-j\�h�\�t\n���Ć\�T\�\�ѿW\�\�>?�E\�9�%�dX��S\�(\n���;�\�Di\��/\�׵TQ,։\��]\�ЛѰa��\Z\�,/\�oe�QO�b\�t,��Ɔ]���1\�I�H�ho;ʳ��6=]m\�^��Y�\�j�K�V;s�\\G<��^a\�\�}l�?LY\�T&N_�4no�\�W\�ɤ\�8vx/�m\�\�1�\�I\"�b\����V;\�\�.AQg\�\�;�\�gC*�J��D�\�!����EUI%5W\�\�e�F)�\"�t\�#!��(�T\�\�K\�bV-s\�K��\�\�\�^(I?D�הUN\�\�ͧ����\�6\�\Z\"EK\��|\��w�3a\�f-�\ZU5ԥ�������3y��1~��f�q���\�n\�\�j*�\�a�\�[?y!G?\�\�Ƈ�MWG\�G���\�x�!J+\'\�t�\�ų1:2i�J�dpr\�\�B ���8�n\\1�WQS\0\���4\�Q�L��\�\�|�h���͑Cy�T�;i\�-\�\�igӓ�\�v\� ��.e�\�\�\�\�I\'5:�\�ᤤ|\"�\�Jw����)�����H\�x4L(؇\�W�\�\�멝���\�<�\�wh?~�<�ְ\�m\0ʪ�`wx�\�r\�PL�d�\�몔T\�vF��ʌ\�<@QU��@rT\�e5-s�\�B\Z�\�k&L_ƾ�/��\�M,Zu#}]\'�\��NS\�\�\�\�ⲵ_\�\�t�B`\�26a�;\����/�Sf�bޒ\�fh����:O4	�S3y>s^�7w+��<���{^屟\�\�\r�~���Ө\����\��\�\��� ]Y$�)��\�X�\n��\n��V%Ld\�\�\��,UbH��\"S�\n�yE�\�\�z\� ��y��\�\�|x\�\�\�X��[q8]��� ��\� ��u�E�\�s���\0G��[�A ��dڜ��sȕ\������7�9ְ�\���]GOW+�@!c��\�&��=�a\�D\�\��\�+@ _��L7~z&��\0S\�\�{��DdM�\��4\����꺹��5�\�w\�$RV5��_�%<>���\��or\���N7��%��c�\�a\�W\���9��k��\�C\\�\����݁�\�m�)!HĢ���\�baT�\r�/��\�\�Ů@��_\��\���dRc�%�\��\�e�ȅ�p\�$a\�`\�M\nV�y\�ݵ��?����HZe��ʘ�)\�R/\�h\���\�\�7��E�P\\^�\� 4\�GA\�X��o\��N[6v\nnOC�BC��5\�g8\Z\�\�	0}\�j�9\�}\�	\�|�,�)�W\�zt?}=\�	\r�18\�\�px������K��\�\�\�c\�e7��v�n!��\�3r���0�T2I\�$Ӥe&\�*�ذH3\�L�\��~FƘ\�j�y%\�sYv\���\���\��\�\�\�\�\�X�Ѵ8�\�0)�\"��\�yB\�2v�s)(�¡~�\� o%ux��Xm\�N9N�ݞü�\�p��\�߱�ұS\�\�\��7�	\�h?\�1*E��9*r\�>&\�ZAqy��\�\rG�0>�\�fG�\�\�=���\�\��\�jY~\��\�\0�I3�A�\n\�usv��\�u�\�k������>\Z.L-K�z��\�\��A0i\�rs��J!M�́[1�uˑ��݃j��h\�z�\�\���V9�PHj\ZZ\"N*�q\�\�|��U�JQy-\�\\\�b�FE��ge@���\�â\��-\��&\Z�&\�w\�,���\0\�\Zv\�\�\�D\�\�((��J^A��j\"$\����0\�pMK�Ԍ��\�h� g\��	��\�Yf�&\�\�\�Fx	C�>*2U��r9�NK�b\�\�l\�\��3}\�\Z�.-G\�\'\Z�[w4M&QP\�Y��8�N|�~�JK))/cLq1�����h\��\"��I\�D\"qNćQ`H~��t�`\�\�|\�-��\�ڐ�\09s��	�	��\�iHN\�F�F�\�=PP@Aaz�pq�d�2��	ge�HKo�D�(8�sK�V\�t\�Y,VT�\r�É�ZQU��2��!��!E�\�t\�p5�b��0\�$��L�F�D\"g��_�y-�\�\�j�b\�\��8NI(��EUQ-z��H�\"�2����8srP\�9\�Ӳ(	M#\n�+x�_p\��Z�R�qN=kt�0�{<\n\nǠ�#mYĆc\�\"\�$�	�;�q8\�8�nT��+G�VH+Hӈņ��#G�R�\�.1B\�;��Y%c<�h\�?��h4JoO/��\06��&\Z\"�J\�\�\�&\'\\�cpy�)��1&��H\�\�\��\�%��\�+\\K�\�\0\�\�#{DB�\�h�GTG#<w2�148H4\Z!\�\�\�\��a�Y�(\�߉\'\�[> \nR3qno�d2I_w/A�`ě�\�\���A �f�\�O�[1ߍ+g\��+(2)Z\"q\Z;*Z\"\�`�P0�\�\��\�t\�p8IjI�8]�M��b��4�He�\�pф?K&4-�z��,\�N�32@:\�\0ł\"�\r0\��5 �mŢ1b�u!R\�cz۱�V}|�\�����T_\�\�\�\"�^!�?��\Z�܉\'\0\0\0\0IEND�B`�','image/png','christophe.png','Jean-Paul','','',0,0),(9,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0g\0\0\0�\0\0\0\0w\�\0\0 \0IDATx^̝w|ՙ��gf\�\�~\�{uor\�k0d!��,IH#u�ɦ�ͦ\�lB:�dI!$$$$$��t�q��-[�$K��t�\�\���33w�,����?�{\�\�<�\�y\�s\�\��B��\�� ��/��c�\�_���r\�g �\0@J	\�~wҼ\�gK?\���\�Ŷ\�\��\�-\�Œ�˲طo�\"Z\�t\�y\��\�7\��\�ǧ^�\�\�H�/�^��\�}뛆;|qΜ\��6|>�+\�\�+����7\�!˲H�R�R)2�Lџ]\�\�23A�\�3�\r\��S;3\�ᵼ�M\�\�\�\�Z4\�yh�U��_o|0\�K�LEf�kn����\�\�{\�H\��/�47��\\�R��| 9m\�i�lyr��L�x<\�\�\�(\�\�\�LOO�\�\�,��\�Z\�4�h�FEE\r\r\r\�\�\�\���\�zO\�\�\�8�\�\�\�\�\�\�m\��J\�[���«~�\�\�~��5�Ћ\�\��\�_m\�\�\�SW\���\�\�\�\�\�\�\�0}>�.ϴ�C���\�$���\r\r���T\n�\�\\p���~�\�,\�h���\�\�NJJ�D�w\�^�\�W\�h��Ƚ��\���\�Z��\�l��ֵ�\'�njj�_�b\�\nL\�,d\Zx4t65[\�,ˢ���={�\�\�\�\�\�\�\�l��C�\\�\�\�F:��\�\�R\0��kM\�t�3�g�=�!(//\'�HDFG�JZμd\��\��\�\�\���N�\�3\�O���$X~�\�g��i\"(�/pj �r���<���l۶�����e�JQ?\�\�Ӵ���o\�>�n\�J<\'\n<��Q3��\�%z\�u]��������\�\�+��\�L��C\�K\�\�u�n\�sɫW�Z�\�b��{�z1�<x�={�099\��\r\�\��B!B�����|>\���8\�\�\��AJJJ��]ܩ\0�y���@\�u���q��X�%N\�Ƿ�\�?Ί�\�j<����=39�\�\�\�\�\�\�\�\�x&���R�L&ٱc/\�}�e2�����*V\�t:\���0�@�X,��i\�\��\�\�?\�=�!C\�r������W_�i\�\��V8�x�\ZX�O�\�\�X_kimq;\�0\���j\�L7\0J��\�\�Coo\�+\�\�NER�\�o6J&����3444\���4Ӎ94S!u]���E�m\�>����t\�\�NA�8\\�im�\���뜳`\�Sh\Z\�\�r:�\��\�M;z�(ǎ#�ϟ�\��UJ$\�ٳ�\\.7��O���1\�^4\Z���\�LMM\\}���\�s?\�\�\�?N\�\�-We�ǯX�`�YZZ\nA\�f�\�N���!<��b1����r��\��:\�u\��\�q�^\�1�\�ڊ�l\�$�\�6\�\�]͋�=\�\\p��\�;�}\�Ѡ][[�f��)��\�:ʝ:t��/\�������T*EUU�@\0���\�\�)���XB�\����y\�x\�\�\�h\�\�\�==���/\n�\�|\�l�\�&\'F>�j\�ʲ���b��G\�\ZeXE\�$%A|*\�Ν;��qg3)�N#����M gX�y:w>c\Z\�PeE��%��\�Υc\�\�\�;\���=G�s\nzQn�k\�Ӧ\�|M$����9i\�6/���\�5\n8q\��\�K^r�_�cǎ�\�qx�I^�\�~\���͍@\�u��TUU\�t�/6\�yp`\�\�m2Nw\�!˲J\����X�pA\�YP�I\�ļ�\��\�vDgY9\�bph��\�)�\�1\�\�\�\�9-�Z���+��N�ٰy��t�J�\�~\�D0��+XLMM\�\�\�O V�s\�Uo�\�o�ԶC/\n���c���\�\�\�\�:�}�H(Hۢy�w\�*j�*�\�\�\�\�;�\�@/~$�C#$\�\�\��?�\�\�R�6�|�<.��.^����rw�Y�l	{v��\�g\�\�q�\\>o\0/���Ue�9�\�(�\�\�W=\�\�o�\��O߻�\�\�\�\�\�6\�\�~�����\���*/{\�y睇�\�\'���n.\Z	�~=m\�\n�J\�{9\�\�\�\�\�}l޽��CG\����i���\n��Z\�kY�l!+\�g��4\�PU�\�g@(���!5\�DU���I6n\�\��\r\��\'��\�I���\��8������m\�G��m�g�|/h9���\�5��_TWW�ץ9T�\�3�5U�\�W�|�|Ŭ\'�\0H\'�-�R[����/\�\�.&�˓��ħ�\�>1Hωav\�;\�\�\�8�\�� �͒Je��\07<:Nz�M\��M��#�D\�AL���i\n��Y���\�S_U\��\�&\�A?>\��4��ᚉq�@BH\n�*\�J��U3���\���^���<��׵ͼG\�!���M\�\�\�ӽm\�I��a9f(�v�M߼\�\�Jc%jr;{�\�H����Z\�\�MpR�R\"\�c�\�	�����ڔJg\Zgrj���I7r�����\rI$�[t���\�3y\�.\��)�k���$��$FEy��߮C\�\�YZ�!�A�C��o��?p��\��\�>���T}^�W��R)�l\�\�D*��\�\��u��Nk9��\�\�\�;:ߚ7\"ш�>�[3�\�\\z!\�ͷ)\�[\�&oY�l\�\�`@\"B����i\�X]\r5��l�5\�V�xn3?���\�q\�]��\�\�\�};\�u�\0!��m�c�%\��mf�3�Z6hNS�\�@6��=t�Ia�)X8��k���[\��3�\�\����>�H2<<L��s96��)������Y���\�\�e�&`3\�0t.>\�L\�]pB��F0\��\�\\�M��QH\�z��\��)���\�c\�9ag�\�i�\�w�3o���ܶ�w\\}9A\�D\�t�\�Ln\�\�<�\�R��\�i�U�˂t�(`;�4\0]c\�\�E\\qѹ�\�\�\r*H�`=\'�7G!�u\�-�ӂ\�\��\\(�I7ϩ[\\�>ӭ5\�Vs\�E\�l\��\0@dӪ�.v>[MU�6X\�\�\���#DH\rS��dN��0�=� \�2�4�z\nR���o�*+3I��R��R\��\\v\�Z:�zع����$�A ���k9\r�vZ=oi��\�\�\�\�\�l\�=y�\�u��\\u9\r5����\�\\k\0�RH���F�J���[�?\�~W����-!$�\�HJ\�y\��\�\�2\���-���\�N=�d3\�r�[�$e\��gQ	�w��� %�a�\�[\�i\�\�覿UӴJ�\�Gx�\'\�4Ѷh>R()\�\"�\�P\�\�|Nuν!U\�%\�kOz\�T5:�P����a	%8Y0<5¢`��bN��(\�\�H�%餧97���`\���̟\�\\�o\���D`�u�!9]\�g�Ӄc�*�~?���\�;m�\��\\�v\r>�\���\�˺\0H%]���ɂ����\�Mq�`k�\�\�z>�u�YJ/\�V��z8JN\�<*f\�@�P�\n�`\�J��0JE�\0Mh��\�`_#��ӂ�����I����TZ,PB���f\�f�\�\0^���R�3�$ŐT\��F�T\�\�Ii�Ӿ\�\�\n\�N�Ҟ_q\�	�7U2\�	Hd!\�s��yd*Q\\�-Om�\���\�U4)1t�@ ���\���>qJN\�\�d�i�=��wuՕTU�S\�<\�\�^r\�e\�L!�}\�Dd�NI�P\�\�\�Ha_�@\�l+\�\�\�\�ɬ�\��8Z��H&\�pȫ,~�\�\�ys)F��>B-�\nM�\�&�N\�\�N�*mW�Vpi������	�=\�+�P�\�\�l����\\�t\�%7\�nב�G;a\�y]={�,\�U\0©�����Y*S.\rY\�z`�\�\"�@\�55G؆啎�\�@ �a�b���\�<Y1��-!�ണ\�\Z\�\�x�oq![�,�̤\\�x�\�����B\�;\�u\�]8E\�<X�`.+\�\�;�zfs�n�P��|2i�V\�\�e\�4M�+\�0}�R羪\�Aa�tw\�s\n:=83� p�ah:u\�Un�\"�;c�\�Ra���΅,�C�\0�.+�\Z\� \�������=\�x]�\�Z�j�0�뱯���@�}�*b!�T<�`Y�/��\�q��X$Li,\�i\�CB\n��\�T�%Z�(4\�&\�\�u��\�2G�ԧݛ\�,X\"2)��\���W�4��,\�#�\�r<\�\nǝ*\�\�}Wm�{�\�<�\'i�\�\�\�$lp*t�pg�NY4e9���S�\� �]ˆ#��q\�/[nJ\�\�O�65r\�%�9� ��F:�\�p��\nχ��vB*�\��\�Z�GH�bz>\n�\�B}v��\��i���(	p.r�N�v\�\n\Z/���I��\�Դ\'O�l	���\�3�\�\�\n�\�n��=\�a�5\��t\�_bYy[�����\�!���.�\�qI\�`]R\�iIq\�\n��7\�ڋ�<�\�Lr\�)p\�=:\�᭠HH�H%��\�P��T\�KA&�%�ɺE%�qu�M�|>J^p?ǻ�\�%@6�\�\�\�.�Ο\�N�\n\Zl�o��S�0\�D��8**\\\r�b\'%+�.��=���-\���VlW(<e���\�\�I:{�\�w�\�\�Y�r=����\"\�	>B\"-ɦ�9\�\�o[�(\��4��a��\��χ�{W\0@HH�\����Gyϛ_Kc]�Z\��\"�\� �$7>Fzb�P��\�4\�<��wֺ��R�@���t̮\�\�iUP��\�drL%��L�`�U\Zǅ��=u؂�,���\��xv\�^�\�dס��#�ΐL����\�������*++8\�u�7^yB\�x\�ɍ|�K_�u\�JK\�\�4\�e�ДD�\�\�\�\�\��˫z�:\�岘~_��kB�\�\�\�\�\���B�\�SӀ\�\�����\�\�\�\�\�v2���ڊ\n4\�\�PS͢9��E�veJ\�\�\��BI倢���ۨ��d�&�\�\�8�\�8\�����{\�U,Y�\�g\��:�n\�\���\�(w?�4<�?�U�p\�B}�\�����Ϥ8\�\�ó\�o\�\�\�БNn����\�\�Qzz��h\�\"�[Z�BnY�$�L�˝�h\�i�\�4} �J���/V�������\�{ؼi3s��\�\�\�\�\�;�Hsc=�?�8�r\�5\���cl\�w\�-[�R�\�RW\�5\�.\�͗_Byi\r\�P��5�ӖJf\��v�o\����\�\�i*�\�\�\�\\���G��\�\�}\\�LQ\�Po�T\�+�z&ht2\�o��0\��;�&�:����d�\�\�\�Y�x\�{28<\��C\����9|��\�i�\�\�K_?K�.���\�\�Ӳ$��m\Z>U�\'91֝\�fSy+p\�}p�\�\�	u�����L\'<�ē�\�\�k�,��\�N\�-�ol2\�\�d����<�e\'��\�_q��\��s\�dł9TW��\\Erv(\�\�IR�\��\�\��\��Oa\�\Zե1&�F���D+\�A\n&�\�`��ìz\�\�B\"9\�Ӂ�\����m�q\�\�6~�\��\\��-;ڹ\�uW\�?8Į��u�uhx�\�͓\\q\��B!�d2I.�\�U�\�?婖ӂ3\�l8�N\�s�\�\\.GOO�w\�&�LPUQ\�>�Q�\�=\�\�\�\�C&�\�0�>va\�޲=�NĹ\��������z�\�]��K\�XE\��V�\�\�\�\�$f��\"(�)Da�3>\'�\�#ȼEgG\�\�\�\�y�m�q���C\�z\�\�Ow^{v�p��YD6CyY	ãc|��\�fU\�Rn��O��\�\'\�؊\�\�\�@(Rc�PVe\��}\���4p\"e��\�\�\�8B�\�\�\�\�\�\�\�Ͽ�\r.8\�Lt]����3W,�������\��;NW�KRJ��G\�߸�G6m\�\�]�FÜ�l1\�X\�\�y�\�WWP\Z	\�[yuHі�י�F�jfxb���	��ǿ\�\�\�M�\�0\�\\�d:S\�g�iԖ�PY\�̅s������>\�+\�1t!����o�\�{h\\�a�\�u�UmK�\�M\�\�އ\�\���#�̛7PVnY�D�|>?���YϬ��S�`yj�s�@\"�\\\�\�\�JMM\r�D�\�˗��\�\���.:G<眱�UK��{\�e\�9\�5g�FZ��iR�\�l�ѩiF\�\�\��tA6�s]_\��\�zx\0���\�1����\�Q\�KJ�}�&]SJg�$\�)F\�S\���\�-&T�\�hkm\�\�Ex�˩�(\�\0\��L!E����k\Z�X�hJKKx��^\�s[��ۻ�F__~��P(D&�azz�PY\��>��S�\�i��h]�\Z\�=:�Ǚ��frr\�@%\�\\�lV�1!$�h��\�d\�\�yd\�F��\�\�p\�\�d&K>�\'\'-�,�\�	\�\'xd�n6\�\�G.��\�ζ 	�He\�Ծ�M\��(��	��X��J��t2\�x�\�O`@\�\rJB\�\�4q�Y�Y\�PKMY��h\��&\�~ګ\n�\�N5M#TYM\��\��\�\�S͔\���o�\�\�����J�ؿ?�Z��|>\�\�\�\�s\�vM���I�\"p\\xee&1Uo�~��qnw�\�Չ�O\�;0<>\�\�g�a\�~\\o\�\�=�\�\�\�\�|��ĿRS]e�V�����3D�ir\�4�t���^�Tg�:k5��$[e�ôw�p|x���\��S����\�As\�I:�#�)��]������2Zk�8o\�\�_��p���pt\�塂\�q��F�hi\�\�Ќ0\nOd;���d\�\�}L\'\�0 �$\Z����$�Ja�FϽ\�\�̓G�\��\�f\"}Ϯw�7�\�W^9qx\�{\'OB\���\�x*�Iߕ�\�gN+-i�H&l\�Q��~*���\�\�\�)&��8|\02YŴM�3\�,\rY�z��\\\�\��\��\�cOg;�t�\�d\Z�d*�\"�d*\��D\�\�\�\r\n�@\�(\�JiQ�0���p0���:��6����\�\�\nJ�at\�\�\�\�f��;\��NN1n\�\�B\�2d]#��1k\�E�\��ï}�\��9�xf�p�իV�� \Z�0o�|:w|p\��w\\`\�s�2\�\����_y\�Ow��\�x����:��#\ruՍee�\r�\��\�]�B\�l\��{\�|\�K����\�,�\�Ao\�\�����o\�>�H�OI$J\�Aw��-+E\�5M��$B4`\�¹\\}�jR\�RJr�<G�9\�7@\�\�0���l>�O7fؐ��rPWY\�?�a��v�\�e1\r��\�\�m��0��\�\�1�SiN�M��$c\�L�\�$\�F\'�B-df�9J\�Ab� ����\�A>���q\�yg�\�(\n�\�4Ѷx!O<��D2\�\�#���\"�DZ���i\�E������[Ǐ��Wo�8\�]��\�曾���\�R\����\��\�|��m\�FkV,�\�~\�\��Y���	���[X\�\�\�\�\�\�q��l^�QA�\�t*�\�3\�u��\�8AӇ�$�{����,j����\�0p�XQ\�\�s1AjZ[�\�:E:.\��\���\��5\r�cr\��T*MG\�	�\�4\�\���X8H޲�-�1����\�\�%1\�4��i,)ik�gɢ��鞿326Ƶ�\r\����	�b>�g\�} �x�Ç;8��U��G>\�e�ǃ�m\�\��o:z\�:�\�\�\�\�c�\�{��z�W,\'\n�\�+^ES}���/�ܖ\�\'\r\�奅\�Y<\nhh�{�Y\\q�\�Ceˎv0��Z�\r�M4!\�5��\�CAE4BE,B<q�\�\�J�67`\�\��]�\�Tc� \�\�D�\\ݐj\�FJ\�}O>\�\�\�{y��/.�0��\'�tr\�\�\��y\�\�<\�\\KJR�,�e�g�gg~�5�s\�kH�Ӫ~{\�fu�T\�j\�E>�\�\�U\��э_fղ�H$�W,c�\�\�<�c\�\�7\�x{\�\�Ͽk\�\08���4\�h[�l	u5U\�5HX�l	?�����\�HWwQC�55`;%�\�\�X���\�u\��ǻٵ\��\r�C!��I�s��-�\\\ZC�DC~\�\�ǋ�vBca}-�gO!\\ZJ��\���H*p�H{\�::1\�ݏ?\�kV,q\���L6\��\�\�{d�9s\�059\����\�G@@Ui�\�s�Fcl\�w��[�&۷o\�\�G�䋟�h\�\�6\Z\�eJ03\�Ϥ\�[���\�RV,]����f\�\�lm\�\�v������8l�\�Zh��]\�?�g�Zɹg���\�\�X�j\�I\� �n�\"\r���~\����\\�\�wr\�uב�$o�܏(\�#��\�|�מ��\�^����A\�߸�5[x䁿�؎\�|썯&\�3\0�\�7�UU\��\�B�Ƌ���fzj�e-�>\Z��`ww��ǹ�uo\�\�w=ēۏ�G\�}�y�\�Z\�\�\�z9�X���\�\�4ו�7\\\�\�?ίo�%]=�-Y���\�|�lz��Nj7(#�����G�\�_?��9��t-t���m�S\�\��W����!\Z�\�\�\�އ\�[?����j�\�o�v�*j���\�\�Z\�u�Sإ<>6ſ}\�3�[��@�\�\�\\�m$�b\�<��C�rY\�\�\�\�\�K_\�X<�Ç&Xy\�y\\���q\�׿ή\�A.XЂ&4J��	�\�\\�}\�s�\�\Z\�\��$�@��\�+���\�u�|\�7�\�k\�\Z�s,O��	Mә��`,>́\�\�S�N\�81���c\��\��[����6�F�m;�L6\�\�\'&�I\�H��\�j�\�\�ͧ>�%&\�S��f%�\�\�%�\�L\�\��7\�8qhw\�-\r�����\�W������B|�Ƿ��\������\Zh��S\���ך�Ug�O$Z���bt3\\����Lt �\�\�ǞG�1�\'�ش��K\�.\�\�[\�W��UvmxF{	�D���yZ��\�#t���\�d��\�C\�\r۬g慶s/`�@.?BF�\�\�\�A:9I\�\��\�杌\��DBe\�\�\"&�N�)	������:�\�>Ȧ\�A�j\�d�\Z�F�B\��ӟ�\�u����{z���\�Z����\�ҁ��\"Fo�\�r����&�:��\�\�]FkM��͟�\�}\�iiT\�65�\�+.\�-\�)��R�\��g�\0�\�O8-j\�bȪF��D6Cxz�\��	d�;\�\��f���B@iI	g�!�͏�*w�8+L�]x\�i�\�\�>>\��͢7o]C�\��f�\0\0 \0IDAT~B?\�e$\��@�h H:�!�\�\�eU�\�\"��s�z�ݧ�q\\�\�֤�\����\'�NS��s�^\�t�7��\�#SSUA(`,�\�ݵ�\�8�o[,���lX:\�4�\�\�Ă\�:M\���˷�;>�\� �\��\�|�R\�\�Jw6\�\r<�1v\�\��\�{\�oC\�\�ň�Ѱ�*�\�i�P�\�\�4AsCms\�1B@ \�l�s\�*r_�8�q���*R\�4�\�\�\�nNy/eF�	\�(ū�,\��y�ܱw_��X\�bMK\�6d>\��X?oy�Y�~�.��!e^�\�Qu-X�p>͍��^\�\��]���Ow�:��\�>��W\���8c���M!�����\�\�\�\��o�iS\��\\&Y�x-��|�?>N}k3~��\��8{���\�h���!F\�\�ա8Ԕ,��\�P[A�YŬG�\Zjx\�\�V\�o!�I�&�H)�\�\�L��\�\�ΛϞOSM�\�C\�\�l9��^y��t@:=%��\�k\�g��W�\�B�8㝻�rY{+�a�c\�\�	^љv�02�R\0z�\�\��07�\�\�oa2�V6��ٹ\�\0�C#規�+\��\�G\�GYi)m��K�B\�\��z~[�`\�sNs#�.h�*G4\�P��~q�\�k�\���}���涶\0�`Tt\�؊DB>�LMA ػ����k��]�\�\�ͫ��5iQ���ҧ\��YK\�kj���Xc�^E�8�Ǆ�,K\�e�qh�\�(��fT�r,l�\�\��z���I\�o\�\�tN\�\��|�ڳy݅g�{]%L�����6�W�55	\�cclڶ��\�q�45�������-��\0e� \�\Z�͍\0f��e��a��K\�G ��ʥ�q\�\�y|\�>4�:��ug;W��\�\�`�-0	$G��~j\�\�<\�\�.>�W/\�h\�	��<~\�ǂ�Zbᐪ\�q��1\���\�Q;:�l0\�/v�\\&Kaq�(��$3w=O\�\�A4\�\�o���\\}\�)@R�\n�]\r�D\"I\�\�\�̩�\�d�<l\�q&\�Bp���\�U7U%Q.Y����8�PP�� -�%\��\Zf`���`NK2�G8΁щI*c\�\�U\�1:���}\�G��\�-��\\�.�\���?2��\�q|�#�P(DSS�\�crt�\�\�W\�}\�0�b����+\�b`<\�.\�>k !�͡�$g�\ZU^J�c;�\�oOo��m%��\�wU+�\���㌏��TCow7\�\\q�*\�z�UL\nQ�C�W��OlP\�5���\Z�K��N\�qj����\�\�lW&*��\�d+�\��r\�\�\�\�zL�X8H�Щ�\��N������\�bq\�\�\���x\�\��/�G\���GF\'ۚ�4M\�\�/a\�/�g��>i����+�\�\�SrG��\\&�\�p\�\�\n\0I�?\'\��\�\�~�\��㪧\�M\�VEV-]ąkW��f�#�D2�O=��飡���h�p$�\�o�\�F�\r�\�~!lzj�հr9���\n\�g:���\�O~�J����\�\�F2\�,\�\��8\�y�0ϱI}*V���\�O�V:U�\�.��Lj#K\r�0\\-V\�r�!O\0�T\0A\"\�g�HC+�\�B=3}\�\�g�\��7^��[\�\�\�w+�J \�Q�KX.�v)\r\��\�(�\�#TWU2��M\�y��gs\�E\�%�\�@\�1M�ښ*\���i\0L%XVt\rL\�\�S�[�\�:F.�����T:M��<r��\�?\�f\�+�)�\�\�(\�\0��SygL�t\��m�#������ɻ,∪0޻�!�\�\�\���q�9ç�\�+��\� ����(����T���$\n|��\�\�\�\�9\�+\��©G�\�\�aF\�\�i������\�\�e�\0�\Z�\�#M!��\�t\"���\�*�fpxD5h�\�J�t�L\"\��\�-�\r�67�\�d8|�����f\�VM�r S�QC�J\�\�\�]�rN`�Z��T��\�y\�O\��\n�I\�g3Ԕ��\�\�\�{\��H�mJ	�PXin��_\�\�Y����Ƕ|R	�6#\�,�\�ǎ\'>5Emu%˗,fhb�d<N>�\�u��x:4<B<>�n��?$��g�#\�@\�jw3�\�bY�\�T��R֮Z�\���p\��V#]@Z\�\�8$�\�w8\\z�v�:ь]\�a\�j�\n�W@)0�A�km�0:\Z\nR?\\\�l\�]\'�\�\�\�,�_+�:X\�\��N\"��� %yK\�\�w�d*EUE9s���N�\�\�r\��\r?\�0H����\�f0�^�7ñ}�?��ubhX5\�� ��0M�&���\�4kW�\�o�\�\�&/�||I�L�S`YJ됸o\�p�IW�\��ݙbK\�I(�K�œ\\�%%�lC\�H��ȼWs�\n��E	D\"-\�\���\Z\�\�\�\�\�e1\�VS�J�\�K`br���;\�u��%�He҄~�O\�鄀P�\�\���=��\�\��	�=�\�9\�.\�0:\�՝�g�CH�]\�����\�r:�z�������c�Ǚ���\�\��w\�\�-���:\��y�,\�^\�P�\� ���\�O��\�C�@����I2�&�Ϲ�,A�\�:%U���a9����f�-X�R(�_*	�\�\�>�$�\'\�u��\�Z:��0��\Z_ �\�\�m�`@\�y\�a�tug�f<4\�K��g~��\�y\��\�\�2y�ԯ~�A��X��\�G���+׮䁇\�-[XӶT����X�(�0|np\�*v�p\�ʓ6c��#h_Y�hW,�\�By��\Z��}\0\�0�[WM&�\��ȘQz��\0\�oP\�\�L0�k	*bt�ry��\�\�\\ބ�\\Z�~E�,\�Q`rz�\�\�\�>�l�\'6<\�\�\�[K��\�\�!C���\�\��D&\�S\��S�o�\�)\r\��gwY\�\��;\���\�}\�C���K� ��J\�^����r\�Ϳ��E�\�߾k�bB:ݲ?ut\�eP)�2\�1y/ NwT\� �~ډ\�+TO{\r!���;�	D\�T���r^\����M��\�e5�\ni7�$�3\na\�\�.\�\�͹W��&\�\�EalB�N�Ò�\�\�y�,�ê�\�D\�J���_\�{�\�\�{\�˛\��\'_\���\rDJ�\�\�v\�t\�/��\�.�a J*�E�\�45�\�K\�CLMp\�\��<�m\'\�\\\�(M�Ha�W�\�i�D H,\'�-\�\�_\�\�Z��!�\0��\�\�49�tߴ+ЄF���+\�,g_�q��\�l(\0ʪ�����\�EA�*\�eٹ#\n�.i>�=O,Ԣ�\�\�$�L�L$)�\�-\�.���-R\n�r��s�\�߿\�V\�\�v\"�v�u..����He\�͓\�Ɏ�\����\�3������\�ϥ�\�x����>##c:\�\�r\�j���}\n�\�8E�;\�L\�A(K\Z\�\�w��\�x&��D\�GV\�\�k�\Z��(s\Z\�X\�\�\�\�{��{�gh<N \Zv{�Hi�R3�F(3>\�,\�}>�}�Pzn`ˮ]�Z�~͹g�\�}\�X)2Z\n��D|���\�GLN\';\"�57���\�}m�;>�F����Q)\�=�7mU0LR���\�v~�\���\�\�2\�4\�{�>\�8�����l\�(2v)]�\�=-��H\�Ⱨ6�Ǟ²�/��*Jʫ\'�\�ժ��S�^q\�r�w�2�\�\�\�\�<�� 	\�/�\�\��yyv��/	�>\�u\�ŷ$\�v\� oI~|σ|�g�%\��}~n\�\�<�\�\�H\�ƒ�\�G���7����!G6>4~\�;?���ɩ��~\�!�p4\�w\������m����\�]J&�c[{;Ғ��)��(2q\�w-L�\�\�\�QLJN_�d�[��\��\�\�\�\�\�ma�������N&��XX�,�d��\��\�\�\\�ѩi\�	��+9\�7@*�.X�\�xD�ǓG�$�&RU�!aW��:06gρC47\���;n\�\�n\�/���@(��\�w\�\�\�Ԟs\��o\�9��֓�w�o>,)�\�֝�\�����|\�A ��,�?!`��fL����n&�\�ĢJ\�\�\�n�&�*�Oik{��\�\0�V&ǒ�*��\�&\Z\�K\�\�Po?7^-\�x3th\��d3i2\�4\'F\��ՃXX_G\�\��l\�ͥ��+�����\0ՠ\�\�[\�\�\r�mޜI��ʍ�+/\"lݹ�t:\�\�e�Y�p>��\�\�e����.�\�\�=���m\�\�M�G\0m:\�u�o���d|��716R{`߾%�[���\�|�\��t2\��\�6�\�fYw\��TWU\�\�㰨!\�I\�\�W�Eߥ�fcS\0JYf�������?�RBkm%\'\�\'���\�,�D�t2I6�&�\�qbt�\��\�~�t���l9\�ŵ\�.\�o��Ҳ2lCW+.NZ�\��\�\�@����0�\r�mTw\��w6<�W_~W_q��#P/�}�\r|�39#pW�\��o����\�y\�o�\�I�s\�{\�tU�,�\��\�]\�|\�_^�/\�~;|\�ۨ(/cl|����\�\�\�<\�ñ\�}�-Y�\�[�\�i\��_\�U GCU<�Q�ϱ\"\�\�\��飶��H$\�7\�eî�\�\�\�a��\�\�u笡,\ZV\�C09�\�Wm �\��׿����z\�B\Z\�j\�t\�\�ՠg�J�j�\�\�] =(\�\��P]�\�Հ\�d�]{�aY�\�$�\�\�7�L\�\���W�\�g��������ƹ�\��\�_��?�Wf�\�t��\���\�w]��J�4��ryd�t\�c\��vkt|ܒR\Z\��\��\��ߍ�[:ʄ\�\�؉Bҕ�ݙ\�54%GPN!)\�\��\�$����\�\� yz3\�c*�T3n\�\\�+\�=��\��46\�`�|���F�\�\"fᡈ7\'ٹo��t�\�b{\�]���\�j�*Y��Mk��\��\�.�߾k*�\��T\�|\�o���\�\�{٬P��\\x\�Ҟ]�ޖϤߚM%\�5]�2C\�}��p|h\�����\�~�#L\�DH�v;��L\Z96hﬂ3\�s;3�!��!$�\�\��O.�!1\'�v\�-�a�\�\��yg�£\��\�ء��9<8Yf��F��� 5d8�������$�Q\���O�\�[\�f�+;=�O�eE|�Шn�\�l\\y\�:�^��\�\�i�l8���}W�\��~�O�\�?xhw�\��g�W�\�>z�hnzl�\�[�\�Z�\�\�0M\�]��\�t�n\�+Ӗ\�WW�ց\�?�s\�Q��K\�ɾ0L�Xy�#���j�Qݓ�*�V\�3\�\�bW\�\�<�#M�\�D\�<z�\���\��\�{�J$�[�\�pE�m}\�/V*a�7\�^�\������}\�E�i���\rw�m�x\�6\��g\�3WS0��㣐�Fb��\�\�=�E\�\�h�7_�.\�j\�6<�6�N�1�\"p\�mO�J)���낲�\�\��� p\�r\��tTԂ\'Pr(�Jq\�5ױi\�\�\�W���\�����@E��ZV_��V�!`���\�\�>�`�`�\�ۂ+�\���Ooftr���\�\�G\�M8W���Bw�;�ڄC._��\�.�&���\�C�\�?e\�\�]�*,<�۾@��\�x`ʡ��1�\�ڃ/\Z?�̃]�DzA�v*z\�\'���T\�v\�>3�eG;�t��߯܂�\�3;:rɻ�V\�V6�\�\�G�\����K\�^\�EkV\�6o���\�\Z�\�瞎q�]�r�\�V쪼\�&%\�s�l�l6\�\��8=���\�Ly,\�k/9��\�\\�\�RU�^\�\��m\�\�|{�\rds9���uk㊳2\�����B/�\�W��c\�=�\�\�\�\�\�Ѿ��֞YPL\0��~A#�\�\�\\�V�ɧ�VSQ\�-��Iv8\�7�\�\�D�~�]7g,YDsm5Ue%\�NY4j\�\�H���t+tH=�?1�`:�bx|���~\�e:�����\�\��\�>\�\�\"e�E�\'\nc����\�C�\�֤$�\��\�O\"4m4�\�7�?����E+�\�\��C\�\�l\�\�9s\r\Z\'����r���4BbGs\0�R\�\��\�k�-b\�ŌMN\�78B<�\�X\�	�\�\��g� �z�Ƨ\��\r���8b�\�[j��S���\�DX۶��,}5�\�\�RW�n�Z�pK\�^n���\�����G�K�\�c=\�8�/����\�\�\�{/�^8w\�=�\�W�\�o{�\�շ��Omg����׬*\�?�\�ȒrH�X�c��*g\�(p\�$)/�Q^\�\\\�5���$���\�#�T/��%�f\�\�Y���>����\�\�\'\�Y�~,T4&\�{\�va�P��!�x\�q\�`Y���x�\�\�K3�����-Ƕo\�ҋ��\�\�\�\�\�=��XYE���{�V-[J}m\r�	�\�0վG>2�ոH\np^$\�*BHt�a:>\��o��>�~\�����	L�?A���w��|�},\�Ӝ��T\�|	�m���\�4d��\�\�v�������[n\�@\�\�\�����\�۟\�e\�\�`\�EW�\'&�eoO\�\�g�\�\Z���d^K�{F\�9��L0�\�\\-�/\0#p�\�\�zw$�\�Kp]bџp�Ω�\�{\�\��sW\�\�I�p\�8\�4�f\�m��\�NEq�c\�\��Û��뭼%w\�=\�/v\�\�5T/�^p��\�O]��{�\�\��tM�юs\�}�Q2��M����\��U\�tD �&�9�\\�H!<�w\'A۽~O\�\�M\�� \�T\Z�\�<~��BG\�\�L���Q�ttr�w��&G\�.0.9�pC4/��0f\0gZ�	�\�\�g�r#w\��w��\�wκO\�����LzYc��\��\�\�Ϝ\Z\\\�\�\�o�\�<�y_�\�\r\\x\�Y�t�Ij:\"V�&pS��A[\�B���M���\�\�\�NO���T&�^��\n��>���X\�\�\�\�5Z����T֪��R�\�D_�\0�C\�\�SӐ�Z8�\��\�\"�\�\��\��\�\�o����^\�cI�@��\�\���B3�\�%т�\�;��;\�#\'\�PQYZ��,\�w\�bp�\�P��\�m|��w\�\�\�`�\���R\"Sӈ�8\�9�i\�l�\�2F�O�� �\�\�A��D\rg\�G7t�~?�\�J��\�MgԞI(>*\�\�:\"Z\�\�t�\�C��a\�\�v��\��ĳ�\�\�-\�\�\�#�\�7�>��\�\�\�\�\�ˤWĭe�ӋcC�a\Z��K_�*�,]FCC#�D���A�ٲ�]�\�\�\�@S]BSs~)�\���ͪ�\0^��AD�z4]\'RZB$%\r�	E#�c\"Ѩ�!VVJYu%��5D\�\��\�\�߮\�UMWa�{>?\"V����d.	�\�d�\�\�}/��\�7x~\�.�,k[Ϋ.��T*\�\���L\"�\�\�\�;y��S=\��=o�ڥ��C7FGG	���124D\�\�N{j##\�\�,Y��p8\\�\�\�Z~�\�� !5\�ũ\�\�\�?\��0L \Z&��E	y����`\�P������žt�\�P��i�8\�\02\�,�\��\��\�-�����a\�\�+h[��֖9TWWٷo�T2�\�o�\����xC\�����\�%M\�\�C\��@�T*\�D|t��\�Rb%��!�G\��֏n\�\r\�� >�\�d\nW����\n*Q\nQ�,4\�\"�2	M�\�\�4���\�\�ױ\�p\�P�\�\�e=\�t)GDˑ�z	�3��\r�\�\�«\��.���\�ħ���|,X���\�J������� ��\�ˤW����\�k��+54M\�m[���\�Rv�\�\���<��\�o19\�<Z(�P\"%-Q�69�W\�HTJ�\�H?�UI���[�=��֠r\n�\"u�:C��I�H��\�[l\�\�\�?�9��Û\�\�鱗��X,�\�3�D\"�	�{JP�\���ċ�W�|.\��=�Fۼ�t�ښZ睖�uι\�[����?��\�8\��\�s˯\�`tl̶\r.A�Հ\�[8����\��wՌ��mqn�\�`Be�vMҶۂa(�V\�\�\�`e2�<\�>�9.}\�\�x艧���X��h$F2�b����h���iX\�²P��ͺ���\�+J\�\�A`R@L�zJ\�!!��������\�	��\�[����rz��\�<\�ͧ��u�ۺ��\�휵f5>CW�Ւ\n\�\�8�Ճ�n�\�\�G�t��?\�0�#~\���\�\�&CDb��J	C##���\��\�{\�c��#A\�̛OUeC�\'8\�\�C뜹\�\�\�\�<Ç�\�d2��\�\r/���_pF�����\�	�\�h�\�d\��X�h1�7=ˡX�r%啕\�JJ������(w��>6<��\�\��f>�wQ^Z�n�PZS���nԦ\�\�l��K�Cjg2��r\�<\�݇��@ l/FG\�x�\�\��\�\�?c\��C\��\r��45��J�8x�\0\�\�4˖/���\�~$�q0���\�!��dM,�k\�\�e\�+�Y�l5�\�0\"K�-#\n�\�\�H��������A��%�\n�))-���d�CClxf�݌@0���P8��N�aD0\n\��\"�@�!u�=B\�*\�3̠�4|`��\��@�-B�\�T���x�/\�|\�\'?c`h���\n.^Liy9�\�=tu�����m\�)���\�(\�4}>\�j\�\�u�-[6344DIm\�\�-w�\�\�K\�\���	�Oۗ��25=M\�y�&���\���\�ݾ���7!�\r�A.^��9|��;\�9t\�(<�����9\�\�5�>g;�\��lղ�\�0f\�+\�p��������\r��\n��;wUU�ӹw/y+ςE����\�\��u:\�VyY9��#%�(O*��\�ن�\�-\�5���*���\�;�(T^�.=5y��k���Ze\�BYK2�T+�&�#TU\�011N\�\�#$Ì�`0\��\��\�	���\"�N��\�\�\�/��{\�j��	\�곮i\�p^�\0	�}\�p!��i�I&\�q\�䧷\�·>���\�Q�s\�\�\�4��B�\0\0`IDATܿ��\�ǩ��c\�\�3��?��yldIy���v\�n_\�>\��x<���3\�\�첄\r(($�CJ�\"%\n\"R\�(\�_(H�)�HB�(\"	��$��\�\0K�C�;�Ǟ�\�cw�mw�\�\�����Q\�l�\�&\�g=�����\�;\����jh\�\�}J\0]�vGmj\�\�u*\�2\�J�;�o�\�:��\�D }wf᱌\�{\�\�j۷��\���\��\0\��\�\��\�˟��nG�\�\�Q�9C\�$�$@8&�H$�\�DL�G\\�m	�V�\��6\�\�H)���\�\�[\�ᵗ�@(\���|�寳Tc<3\�\�+��\�f`\";��\�_�/fe\�\�\�J%Z\�6�\�e�\\�\�\�i5[�\�󬬮��Gy�/��J����e\�\�0�V�x\"�\�\��	s�\�\\\�\�6�R�Jy�F�A�\�\�\�j�\��B\�\��\�K�>�\����\�7N�\�~*\�,�\�X����\�\�\�\�\�[OHi$���?\Z�299E6;N>��Z=\�vD�\�B\�u5��J15�#�H1;Q\�j<\�oR\�)\�i�\�4�\�|����\"�����𙯽\�7o-Sk6\�u\�0���\�\�ݦb=JI�\�!hn�\�\�4~?A��H$\�\�/���6�t���\�\'y�\�^\"���err\Z�釓H���\�Mv��i�Zh� \n���Ω3\n�D\�����\�\�\�\�\�\�ܠR.��\�`\���\�\�\�E\�\���|�������\�\�\�Id\'\�5\��\�\�\�oH)\'c��\�9fff���7��ˡ\�hP,\�\�\�dcc�\�b)%�T��\\�ѱ�\�\���G�;\�\�\�\�l4x�\�k�\���\\\"\r�_9\�\�z�J혃�c\�֦��\\�g�U�����\�t8\�p2�\�\�$��)��ൻ\�|�>\�\�{���e���&1����e\�\�\�`�\�KT\�e�\�$s��e��`0�T\�*�!�\�cn޼��\�B�\��\�|��p\"�y(�\�ja\��g\�\�\��#\�F��\'\�{\�_\�419;;�=�Ƨ\�d��j�\�\�@J\�\�\�.���Y�{�\�\�]�� \�\�\�\�f��#K\�g\�f�\�\�CJ\�\"��}\����1��\�M�/�ܣ�|~|Bx� �\�-�\�3\��v�\�\��v�o��&7ﭓ\�\�#�2�ˑJ\�7נY�׭\�\rV\�ߧ\�jq\�\�e�z�L&��\�U�Sv\'G�IuD\�n�o}�X]]E\�^z�\�G\�\��Yy�\�T\�\���\�F+;k��j8\�<���\�\�\�k�%�}\�L\Z\r\�`+�\�\�Ji�\�\���\�*\�P�����e����+@�]\�)\�\�qP\�\�\\�Ѩ34\�\�x�w>}�\�\�]\�D:���\�:\�]~to�o\�Yaik�\�\�\�p�H$J*�d||�X\"��/s�ªj77\�\�\\_\'O��3י���\�n�\�d�\�	�\�\ZW�DJ\�%�tT�@\��\�W��;wn#��f���\�[\��ů�\�O=�䡽���\�G\�n~\�\�+\�#�\�<�f��\�	��;��%�/\��Mi\���1\�X�d:�\��Q=<���K�\�`p0I�jG�\�k>�h<\�\�\�(#�c�\�i���k7\��\�w��;<��#\Z\������h?�\�X\�\���%>�ʫ��TZ:��3�Y&����\�1�\��\�$XiCJJ\�]�n\�b�X$�\��웟#��R)3P��S�nM|���\Z�P,P��G\��Z�`\�\�+�\�}g\��^|�\0�_y\�\�\��\�2���\�ן՞��,��\�C�t:�\�\�AZ�\�b�P(D<\'\Z�(׆�\�,//cH\�t\�\Z�j�۷nrT=\"�s\�+��vwX�M�hYE�ۥ\�h���F�X\�����\�~��\�,\�*��\���_|�fW�Ɏ3�\�4\�+\�\�5Z�\�\�1�jGl��R,�R2�\��\'��\�\�\�\�:BJ&&&�F�f/\�z��\�:Curn*�\"�\���\�*�dsk��t:\�\��#o�\��\�\��5��C-��w>\�>�>?:6*\�����v(�lmmQ�Th�\�t�.��\�?kw:\�j5�\�*�y\ZU �\�l\�j��&�p���Q�\�\�-\�+��B$j\�@�N\�bi��iA�FF�\�ܸ�½\�-\��ƫ|\�_\�O?�\"ɑQ}\�*\�##A5��i�L�H\�\�\�\�6�s���\�bq�pa��ޱ]P�P+�\n{{{4\Z\r:��vm7��a\�4\�\�4���:x\�V-A\"9\�n����~�qxy�}~i\�{�\�w�\�S���\��\�ܽo��H9y��g���Fl\�(�J֎TK#0��,M�!%\�f�\��1�V�`(\�q�n\�\�SI�>\�B�J�L$!�!\\\�\�Mb��D�\��\�G�o�\��\�`�����\�2��\0i\�j5\�Z_cyi�b�@����\�\�]`j6��U+�P\�~�բ\�n�6\����I��NH	�\�\��#��\�E\��x�|�V\�\��S�S�S\�/��Q\�{\���P\���g�D��\��:Ž�\��/��\�k\�\�\�j��\�\���\�*�\04MP>8\�vRR(\� ��)\�L�gF\�Mc \Z�\�\��\���V\�\�\�\�\'�8d\�͡r�֪U\�W\�s�\�\rv�E�\0�\�8��\\�kt)LLN\���m�lt\�m_8va�\�G/�F�\�࠽}�5�\n�(�v9\�\��7���\�\���\�־�_\':};\��G���.K\��g�\�\�\�	��_o\�\�\�`�`!ե��~ {$p��O~k��\\�Ǯ>�\�\�cm�>{{\�S\Z\�ޫ�X��tJ�\0ק��*�\�(l\�s�Z\������\�Ue%�s\\}\�I.]y�d:\�\�\��a� �G��I]=\�`�Y\�)���U�t�K�\�^��(�\�d�4M�\��׿;}�)��iZ��&���W��\�f���v�]\�eǡ�0\�1*)�9;j)��V=\�\�\�[$I.^\\$O�\���N<� f��֋L�W��~?\�h�\�\�$�x̫\�\�Mt�C�\�ft,\�\�+W\�d�D\�vA��E)�\"�t�P(\�S��{df�f\�i�\"�ѨM8�/am��h\�\�ji�\�n�}\�S\�\�r�\��8��\Z��`�\�a\�EN�\���\��P\�i]6����&\�?�5�\�\�.+\�w1�...���H!\Z\�Mן!coU�RXcMJ+ˑ�\�a�gr���Hw	H��h,\�#W\�\�\�\�h\�׳[��13��\�鰝\�{TB\�\'\�\�Q��B:���΅H�\��!���ē\�_�\�?\�}�S\�\�\�4	�\�g?�@\r��N\�yj\�K�[�T;\�H\�Z�jH�͍u�GU.^R\'����N}8��\�ч��\�d\���X�ɩ)��6i�\�9��\� �/>�\�\�үz�F�o��\��֖NȢ�p�\�\�@�\r3Ceh�8A��U�_L\n�Hv����\���FFGMKpc�F�\�\���g�w�N�\�:-��i\ZSSĢ1VV�Ѝ��������\�\�\�t<4Z�i\ZIur�_o5��֗\�\'/<T\'M�%\��ܭ��q\\\��\�\nCCÌON���\�V��Ix�\���:\�̫7�{h\�\�.20��\�{����,w�\��]�ۃj)ͭ��Ӭ�k{\'��-�Sdc@*��ej��Ve`q]�l�}\��p��\�E���K���ghu\��B?\n��`/^�RڴZ��zvi�gr�!6\�\�\�t\\mlO\��UW\�J\�\�z,\�[�\�\�y��\�L\�0�}��\�\�\�n �۬{Y��л�ݿ\�q\�\�\�K��\�N\�\�f�\�w��=���7Gk�\�\�\�x�B\���lf��Ocn��T�e[&h���\���:�\�*WW:̀��ó���L\�\0&\�\�\�?%�.m6�HR\r.�[[\�/\\P>4p�\�F\�	p�\�^�\�\�\�\�Ɲ�ޔ�\�\'=<Lzh���V\�N�@)��$\���\�K��Ҟ)u[M?Z{\�|\��)\�K\���\�.\�!;>NvbҦN\"�\��\0g\��\�!P\���8\r�<\n����\�l�\�A�{lŶS	//N\�y↟R8&v鹩gW\�:\�L\�j6YY^&\Z����\'`�3R`�KV����\Zz\"/y\�[?�ȓ�R:ep2�\�\�\�\�l\�h��s+�,��29\�%	&�\���\�\�FzG͊q��\�N�{\�w9:��\�\�kD\�%�\�>�:z�\�;n8	\�c&���\�\n8t		BӘ��@�\�`\����)�T	�u�݊\��{9�\�\�\\\�Q�V�\�\�6ar\�.�I�\�_���(�vY��Hd@l\�\�=\�Q-�tr�>��^8&\\\�8���\�L�QI)2arj���u\�M�\�J�\�\�5@\r�\�s>��}�y\�\\\�,.!��NQ[߭/\�y.\�ﳾz�lv�\����DE𚏷��\�-��[�\'�˞~c�^Pm�pUI.\�ۋ�Pq4\�Gvb�P8\�\�\�\Z�y&�\�V�\�\�6L¤\�Fe#�\����F`5\�w�׎YZ�C4c�\�Eu���\'�=	�;�J׫{\�r\Z>�\\�\"Xկ�ƌd�\�ܐ�ř��c;��rp\�\r\�G\�\�Ӟ��s^8�pLM��\�\�\0�\��E���\�\�\�YX\\TS\�V��0�]³i�\�2!\�.\�N��[���rH��><\�d\�	�\�loc���N)���g\�\�qr\�4\r�\�;\�`��D�+VW\�qp�ϥ\�\�$⃎FZ��\�,��Fz\"8�z7x��af�ia�P�eb\�� \�\�c\�\�E��uTX�\�\�g\�9�p���<5s��G�$��R��\�5�gfC3-\�\�@\�\�ُ�&�\��\�]}:5��d�,�\�\�\�~q�{�Z�+ �\"�N��z\�\�\0v\�\�C\�\�T��3��\\ \�Į��\�\�*4\�u��n�Ǚ��C�}v\�\��m�7�(@���Kivջ�fZ��	��{-�����\'@	ܛ\�7+z  ���~\\cwg\�)�M\n\�ե\�=\�RMwH�vm4�\�\�g\n���Z[\'�\�8�\�j�t\�6>\�\�\�+W�������\rV�\��M�N\ZW���\�W�!\�0	�ء\�\�Q�L\'��q��=i= \�!���\�\�ܤ\�h�8q\�@)�Pռ���\�%OZh?8S8�\�i��ր�\�B�F���\r�_X` Sօ@X\�dߥ�Q*ܔ��ͥqv\\��JP\�G\�a\Z^�>\r\�\�%A3\�h=q�Ѡ�yKW\\����z��R\�d��WB�3�\�\�=\r�\����M~\0\0\0\0IEND�B`�','image/png','guillaume-transparent.png','Jules','','',0,0),(10,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0r\0\0\0�\0\0\0ׇ=o\0\0 \0IDATx^��y\�&Gu\��=\�\�\��\�˼�μ3�Ϊ\�hF�ZXl@\�\�c�8q\�86�u\�&1�c�:7��}�&\�&���1&�\�\0	$�6$\�h�E���\���,\�u\�U\�\�\�H���-靧��S�\�\�S������ү]�Z31u\�_\�[k�\�ۻ�����Jf9\�LY������\0\�I@@\�_W�\n\�e�n1�FB�1�\ZA\�\�Rh(i�Y�J[-K�,�Rh)l1��GU*F\�Gl�ĨB�0�YN�S�����\��e�H\�_\'�UvVF�DI��\�`!�ݷ��~c\�\�\���{o9��?��U��R�r^i��\��z\�ѓ_�6�\�J�}C!p����A�D�%\�����_AؑČW\"F\�c�\Z��\�R���b-�jiZ%C�&\�\Z�!�A$��.#\�H\�\'8\�\�d+\�l��zxO�\�	�C\�ྸ�\�x\�7BE� l�#\�4\�J\��4\�\�\�.L�\��\�[\�x���-��\n��=Ӈ\��\�\�\�\�\�\�����|[�\�U�\��k*qM��T;\�d;��y1(hn%�M��!cPv%	\�\�c�<�\n2˩Vʲ�V�\�\�R�\\���D\��RA8PK�FuP^N-K\�2o--u\�d\��\Z��`�Xv�\0�e\�E�j	\�\�KUYA�\�2��٥j�\��\�����\����\�\'\�/�\�\�\�\�Ȧ��?z��^[[�\��I��K�Qc6i\�|ji�,[Ţ��A{5Wu�	�J\�\�1�^�-��6�\�\rWK�\�-�mp���>5D\�\�\�^c⮄��8b\�-]�\�2f3˚�\�\�\�T�J%gXQ˪U�#�(��\0��X\�ECO����������\r\�,\�G��]릴��xy�߼�V�*�\�`bz�\�d;\�|+eE�f.Eā��C�w<�\"BE��8b$��=`M+,�e\�#dr˄D�zdXH3R��L���R�.`(̹?2F�e\�*-1\�\��\Z�#a0���M\�\�\��.Y�D�a(2Ԍ\0��2�9`#��\�tͶ\Z\�\�--�\�s뛎�ʛߵ�?�x��O��,�\��\�\�_>�\�\�w\�fh02�\�\��\�2�fX\���( �(@���H#ʹ\�B;+\�\�\�:b\�	:2�G}F\�]M8\�l\�B bJ3VղQ\�{&Ҍ\�,C�\rQ\�Pl�\�,�-K������+]\�D\�\r,g>\0\����(�6\�Z�i+\�Zm�mĖ$�G�\�\�k_X^��Oz�yq\�\��4�{�\�\�V\�\ZJ\���A\"6רU�T\��\�%\��k\r�\�~2�\�+��|!�\�\�qD�y�\�ٌZ�1֙�\rq\�\�4%A\�E\�h�\�K\�M2`\�VU�j�i�\��{�`�\�.�d�0o��\�@A�\�:@�rLe\�[\\hgT0�%\�\�\�X�|���\��1\�A��d\"�<�Y+V\�\�1B\�WT�4HA�������\�)�ڪ!Uh���6�\0�`\r.��Ұp9�i��\�2*�n,B��z��P�+=k-S�s\�V�-\�U�UeA�������z\��\�\�*M,���\n\�[�H�\�63��6����Q��\�\�s\��ݻ\�9�\�#}_@&qu9��؊Zǹ\\��!.9��]\�)�%\�9q�赩ʒZ&I��S�1��)͘Ԍ˚1��/Xo>�d��-o��.\�h\�e��\�\�#X%�Lf�)�\�Pw�%JX��I�̪\�V\�J*Yv�!u���o��M3,�BS\�\\�\�\�\�W\'q�f�N�9v�W�\�xŸ|_�u�杋Y\�~\�(C\�P5T�\�䧼ƕ�84\�u�L��ZUfP\�T�*�\��(\"�@C�,�\n�DԼy+�KT)\rq(E͂�.�T�����q\�ɱQ2Z\�\�f\Z��6)\�\�\�(p��2gS�\nF.4r.Y\�r��\�\�\�xl�N�-�\�߾�\�\"� }_Q\�\���޳\��\�\�w��a:�\�\Z�3i\��\�6��\��)\�HTXo\"�\�P5B\"��)��u�k\"�>8+���h\�\r\�`%�c�\'8 ϏUa�R�K��Q5B$�G��\"q�t�!f��uL�������%LD(A�\\eU��$\"\�c�6֢T�֓��_\��Wl\�W�k�\��ĪU��e6\�8\�nӶJE���\��7�:׷̨���!c�\�\�Q-��#�/�\"��!E����t\�\�?\�\�\�T�\�Zf4��\�\�D��\�\��?��uaD\r,�\ni\�B�y�2h\�Oq(�UX�p3M#�k�W��\�@\����?x\�\�u>~pH\r�x!^N-Kj�P�\�v�t�\�e��i��^�\����\�7X< \�ܪ���g���^\�(q\�Z��|9&9:\�ZC-�j�߻�L]\���\�?�\�\�\����2�.\�Q�b�1�\�[�\�q=\0��,YP�*0E}����>���\�\�)�\�>���\�\�cg��}꾏\�\�\�F���-�Oi�ȅ�U0Υ�2\�\r\�]\�D��ʐ��\���\n�;\0Q\��J�M�ʐD\�\��	39\�m\����>�\�\�+B7�e��\�\�\rK*Մ\��^D�\"X�[D[m���P\�W�&\"�ʣh>YR8/��\�ߖ��F(\�o5��\�\�8p�\�1}\�@�̦]��n����\���(�Qmv}�jϮ8\����nL嚾lm1�\���\n��\�w\�Ds\�IӬ$4�j/}�l޺�� �i�Sf\'g8{\�Y�E��ѕ)�\�(sj\�gě�\�nֺ\�\n�s\�\n��\�ʝ7����\r�6R�W�T+\�7�o5\Z���8v�<g�?\�\�\�O�-/\�j6I\��Կ�c�0_�\�*ăS\�>1T1ێ�:��h aǁx��v\�Ͻgw�yCdL5�X�.\\\�n\�Y˪�\�g\�	�1��\�ԃ\�\�BO�^\��=;صk6o`\�\�Q*��+[\�\�_���)gO�\�\�sG9�\�sL?G\��sY\�\"�^\�rA�\n�jY����6r\�o\�\�7\�\�\���|��w�:�f\���7ޅ$U\0�\�W�\�\�|�\�\�\"5S؛��/����9~\�]�;cpAM;m\�x\�{r�Ȧ/�9�\�*�k�F�9\�\�8���\�u�>F\05�\�4#�n�S���[�܁[o\�u?��\�:����`\��\�i�8ڄ�&@\�l�j+ۯ\�\�\�w��S\�\��/�\�gV--�^�H�E\�hVb\���o\���^Ͷ\�`\�4���C=\�Ǻ��i6r �_�����,\�.\0�\�:�pE\n2)�\�+� d\�b�������\�\�_U��7���=�7�h�\�L�]\�6܁x�=����~�\�\�\��\�\�{\�m`3��\�\'\\n��:\Z\��`����s�-ױ\��\�\\w��|�\��q�\�9Z*T\�\�r\�ݷs\�\��qyf���H9(A�\�V����Z�R\�\�b\�?k\�Y���~�̰�\�Г.\��2g-k\���-���\�\��^\�\�ya����\�Q��)sY��Z4;	a^4w\'n9\�qAE\\�1�}�YY�Џ�X��!�@\�#�e�eWkU^�;ٶk�?��O���\��\�,\�F���7EQJ��\�s\�D�.\�s�\�Z\r�Z�Z�\�\�\�C�\�Ɛ��Ae\�xJ\0�G��E��JK\�[7\�8\�+H/\�\�\�\�n�,�v��0\�\�\n�\�5Z\�=��\�\ZJ���\�,��#���\\E\�����-���ҕ\�+y]\�`�-���fy\�\�ǹ\�k�\�\�Y\�5\�W2Pw-4 �ݢH(���E0���b���\�\�`�=\"$�Z��\�\�>��?�\�+z\n�@^^Z\��+(\��\0�V�\�h~��`\�]E����\�n���F�/ՠ\��!zUo�^�!kp\�\���\�u��a\�ޝ�yW���w���+���ڭ6q�@����P莛SVg�n��ː�,XKwW��\���I[0��G�!�V@��\��p\"!o\�0�!�y������\���%�R�\������\�S�\��	9��\�\�5�cu�V8D�u\�H\�H\�J#[\r`�+\��\nH1.*\�=Ou�T��\�+B\�O/\�-�ϛ\�\\��\�?[\�i��~<Ϲ\�t�s:�KS\�2�-�w��\\��y�\�:Lhv�A� )\�D��z����\�\\�J@I(\�S\�qJ�z�%�P���m�:B9�R+{�ϳV]�CQD��\�ҌF��aeuy\'�0�,�F\�N�\�\�O�1\�ǒ��\�kwhp\�\n0\04H7�rYS��#\���{<�kE^��+�\�%Bn\�Ԙ/���\\���^@4!���3�\�_T�\n�\"�\�I�A\�$�\n)B��ڜ���w<\�ǝ-U.�n$0E�-\�\���ޱ�W�^�\�\�}ǟY�{����幽\�\"�M\��z,N�\r�Vi��nD\�c\�ѭ�_ee\�Ư\�\�{~\�9p�\�n�\�\�\"di! �{\���P�\�\�5(�\�s�u�\�\�\�4$T\��u\�Z�\�<Y%�w3?�\����Aک[�#\�y�?qO[D�B$\"\�&D\"\�e\�\�u\�ͤ\�\�م�����;\�w\�|�ĳe\�|\���@\�Է\���\�\�tORi�2\�$�U���T��SGs�eR\�7\��/}��`˞1\�n�\�*�~mN�6�e���)Jч��R7kR��\�%q\�2����\�B_\\s\nPJ\�\�a�\rײ��\��\�\�\�,uQ�^�S�\�.1lIb\�X+eջ��$bcU�[���+�7M\�L\�߳\�\�\�ߺ���>�ؗ�\�\��\��\��S\�\�ԥ�ɵ\�7����s]�а\�L����3�\�7dJ-�\�\�{?�K�m�C�4נ�\�\\��\�\�B\'V\�rE� x\�,�Qt?^��\0\\�U**ޒ}\�9���:u�_4�\�{ضo*±c\'h�ZTfY\�{�0�8C8\�\�@�L�#�G��QTK�l\�\�f\�Ӌ��.L�m=:y\�(K����\��G���枵3g\�2�l`CSa>s�\n(�qk`��\����\�\�\�݆H��\�\������@\���\�s\��:\n��#\�_���\�\�iQ\0\�y\\���.$\nkU$�P\�\�\�[o`݆Q�z�i\Z\�]\�K�[\�5�$4T�\�WRX\�Æ.c\�7����-6��L��Y�\�s\��\�?��\�/���ۦ\�;�L���vB�<=ѥJ�\"\���i�Űb\��\��\�B,Wbv�:w_\�E\�M�	W	B��z*\�\�\�\�s\����+�_J����$?�T\�\�x\�1\�l8K6w��M�\��\�M��Ʋ*�[��%�)0��$<�`�d3eU-\"n�\�k\�^S�\�8\�Z��S/��\�8W�\�	\�\��s\�ܱkkis����S�=\�֖\\�P̘x7\�ݟ��\�e\��9\�6�hp��\�4�K\�!`?o��<J���)�W\�ER\�G���\�G��\n4\���\�|� ��\�\�ʁ\�oaN\�\�j�SY7�v�X�s\�5Uj8�\�+\��|�\�t�b�k\�Xl��Z\�\�\�n\��\�\��\�o\����2?\��K+��\�v�G\�l�\�DnI�\�Բ�\�5>X�oa$@\�hq�\�\�Y�\�\"n6\�[G�b抡\�i9\����\��^ԹR|\�ʼ>�D\n�\��_��\�R(\n6E�\rg}\"�\r�֟yQw+j]?�\r\\*n!\�\�f�\�yw\�i�X\�h3\�b���\�k�WW���m�̅��o��\��z�\�\�����PϹK�\�]��o��Ra\�8\�9��L�Y����\�b�*Yʑ\'�avb\�\�:MoE���\n\�\�H\��2X}��-Trn���T>\�s���|\�h�\�\�y`Cc�4(\�蔍/�n�S���\�HΦ)sYX�=\�2\�P���\���P��\�򗯾�\�\���ɿ�7\�~��Zm`8�\�δۜj����Y\�lr\�Ƈ$\���#z\�I��\�n�6,�*50X\�c\�\�\�B-\�P\�RY�B	�\�\\\\�d\��:���R\�)gY\�h\�B[ͼKI\�-�v�\n\�ܺA��\�_���k|.7F?\�\�h\�����Rm��*J�|\�\�\�rz~�\'\�־\�j\�\�g��*\'�mη��K\��В0P͕6�f���\�_\�Zk@��\�\0�8�A(�����,����_в\�Qf\�+��u��&��^O:\�\�O XEZ�<O�f<x\0Fʁ`\�\�\\ɠ �Y\�ֽ\�\�\�S�\�0l\�m�\�\�\�|������򞱝?ݛ�\�}k%޷�DL���\����� p��!\n)\��qy�\�p\���|뾿A�u\r	\Z��[a@.��>^{a�?�\�a#\�\Z|\��ϋ1yɇq+�:Br+\�=���A\���$\����Z\rԻ�\��9�\�\�\�qB.錫?P(����Pl.��\"�\��w<��\�3�@~�\r\�0\"rw��ﾡRy��8�\\jgk�\��\�\��q�&A0\��\�\�鋙\�B�Z\��eW �G}�\n����+�\�\�C\�>)6�yaM/\�\��LPʇ~yW�b\�\�\0J\��\�,8­�mV�����1�3st�7\�	B\"�ʊƾ�K\�_�T܁���\�^�xz�\��\�z�k\��\�\�\�\�}�xl\�\�\�r6�~\�o`&��$!%o�\�Y��\�Z�1\\8y�\��.�vn\�\�\�#�8{�C������U����-c�ߴ���.Ʒlaۦ͈\��\�#�\�v�)�������:����4\�8~\�4\�.\\drv�\�&��Y]]����v\�\�ꫯ\�]��cE�6{����CVH��ڋ\n%\�^A	Ӌ%�E\�0L�\"\�y\0U�b̮V�1\0Lv\0�\�w�j\�K_�\�/lT��\�UV�r����EO�G�\�*\��{mɯx�����[��y�k�p\����n��][�r˞=�<{�C�Nr��)>\�\�9�,�^��s\�6�^��[���\�\�\�4�\"}r�wL\�:�\ZEE|Tۉb��e~q�\�\�\���w�\��}�\��y\�8f\��:\�7ld\���\\\�^\�\�\�Y7���\��k�F#�\�|\�\�T���jm0Z�e�綬w�}�hΝ�E\�}(��a6�\���\�Cǟ\�%�\�uuS5�B3�o5)`�\�z\�r�)����\"L\��B�ǟ9\�J�\���*\�M����208\�\�[���\�5.MO�\�\�EN_<ϓG�\�б#<\�(_��+\�ھ�\��\�O�w\�\�\\S��B��-\"d�\�|�S<w\�0GO�bjz��\�>\�\�\�lߴ�][\�ext���*���^>�:\�|\�q.?\�XXS[�G�\�\�M	\�^ݩk���I!na\�*��\���^������ȟ�\�xW�]��V�i��,<�(!�3\�>X9jgZ��2�P\�0?=˹39��J�\�M2Z�\�\�O25M�Rg\��1\�\��\�q�Μ\�[\�<\�\�\�9~�\�\��E\�{\�;1&4:�X\�B8XSBtze�Vy�o�\���\�H\�ݛ�r\�\�\�f\���Ի�U�t��\�;<D�ZE�A3E�_�2��Ϳ�k��]:N�ނlJb�\�\�}1rg, 1T\�x\��2c-$\���\�o5�l��&2�ؠ\�cp�|eA\�=3!�kjr|\�	\r�C�\n\�*��<¾�Ʊ�&6SԂ\�34J\\]fe~Y[��\�Ý�n\��}\��ܩ\�|\��A�\�C\��W�{GJia�\�땜c��\nD�-*\\��\�_�\"7]��[�\��\�{�0�@W\�\0�\��\�ul&���\\��1�1D�uN<\�\�c\�\�\�M>�\�T�)\nʖǴ�\� p/�\rqĖ\�P�`$��\�\�4�\�[�\�~.�\�@:�i ����7�P]\��[D`\�hJP�\�\�\�?y\'\�z��t\�\"k\r�]i�e�n ��o��;cmy�Ʋ[Vq`\�nvm\�ʡ3\�9|�0\�6o�RIr\�-q�.��_ETɬ\�䩓��\�W�u�F��ulQ�FWo?�zU��\�Fm�-&�0�\�\rggaz�-*^V��4\�M�\�\�WzCP���$\���D��\�v6�R�q(�\�ʁ|\��e�\�wN�(��2��v|�4�$����̹ӐWAC�V�\�\�\�\�\r���\�\�6�\�*\�w������\�\�\�\�\Z	17_��k\r*IBp\�<D\�\� \�ؒ���\�\Z#[v`�`�*��^��.lfY[n�\�:���@A\�@\�V�[Y\���\'�\�&�b\n��\�(Ը_��[\n9WE\�]I�\r�[���\�%�9ky*m��\�\�\'~\�\�oN�\n:���#/_>\�hhg�\�g\�DFy_̜xF�}B� Lu/����\�QZ��t�\��h�ڎ���RI*�R�U���j\�\0I���ՠ\�ZCҔ\�r���n�8\0�t\n��T\r<zE�\�@�J\\�8�R\�&N�n?�F�����3�\�--�\�\"\�W%���~x��]afb�JIA:pt�\�\�V�\�*��{�ok\�.�3.�3�EH0��<\�j׻�x\��[��ع#�B\'�Wm��\�\�\��\��\�R�&n��^KsK	�\\h@\�[�J*A\�\n\��Ųm\��z�y\���<}�94M�Ű\�j��\����\�*���\�ټ��۶0<8@���\�d\�\�	\�V�H�)\�W\�\�\�#�|��B�Z4�\�6\�n[Җ%m���4879\�\�G��\�\'h�\�l\\��&	k�&W�oe|\�6VW��RR��\��\n\0�\�<���\�$a$�8\�J���u�\�D�\�\�r\�f\�\�r\�\�~\�O,�j\�r�xު���\��(\"L\�\�\�B\�ĭ�\�(�\'E#rSu\0���\�Ԣ�*\�\�z+S��>�\�\�6015ɹ�)&\�\�\����\�\�UG{-\�Ν\�ԥ�\\�c;7\\���1$�\n�����FB%�KP�XJN�\�Z%m�\�\�2\�ږ��rij��z\�1��W\�`}\� g&\'x�\�\�\�}�.vn\�\��\�)&\�i7\�a\�.o�?ʽA\�\�\ne���\�ƒ�\�\�\�\�\"p.I>��\�\�\�\��)J�\��\�6-��}dE+tC�K\��hq��\�\�BYɥ�Z\0[��\�&sj\�6�\r\Zdqi�\�\�\��\�>\�\�\�2��^z7a����H\��_\��\'�q\��v~�\�Ws�\�X\"v\�\0\0 \0IDAT�ӔW؋�#�4\�f�\n\\ܕ v$\��ə��\���-���\�p\�\�V�^\�g�gΜa�\�@D�V\�\�4\�P�<r\�yF�X\�\�\�.k�/\r�*p�0g�\�a)�f4v/�NxKD��V0��\���c\�M�\�}\��٫�\�y\�\��\\\ne��\�Û>�#�~\�\�Z��\�r�٦K�]՘\�Ͷ\�\�c)\��{똰́\�\�\Zd.ZK\�\�:�\�y�/\\\�K�>\��\�<��}�\�\�|�={��\�۰Y\�έ}�㟼�G{��\��\�z��\�\�\�\�3\�޺�7\�|=�\�\���j-�\�c�bR\�z��d1Lj5۴\Zm\�O����[\�_��\�aM\�\�\�N��\�g\�\�[h6\Z���\�}B\�W��4����\�\'9x� ��{���:{L�q1E�\��U@J�_\�\��8�/6i�ix�� \�F����7\nϵ[�3{�\�7�Go����#�\�Ƌ_]\�\���Ac^�#��\ZCú\r�\'	��|\�B��%�\\�w��UK�~?���2\�n���\�\�\�$���|\�\�W\��~�x\�y\�^N�ջ��|�K\�I\�J�(SK	?�\�w�\�3O�od�s\�S�ղm\�F\�$\"Jq\�vz\�9��Î���k6U�4ö3旖�o_�2\�\�o`~m��\�oc\�[\�\�\�f\\:�\�96n\�\�\�U^8?\�=?�\Z~��\�\�\�\�fhx�o~\�k��n#$\� \�+��\������xd0��\�2R\��\�D��(�4I�\n[^X^�\��\�\�G�Y�=�@�ܵ!�^�5��p[�\�[˺8�\��\�Y.�B\�\0���\\��\�\�6��\�����4^u3�ôZ-N]�\�/����گ�o\�q\�\�㧹4�����\�\�\"\�.\\f~-&��Y][\�\�\�vw��\�|�_\��W\�\��U;�wU���(��+\"�t\��d��Z�,æ���ex\�K\�D;w�\����sKPd�\� +K3,-7iF똜�$��M��S�U\�\�\�\���\��\�\�S\�\�4\�\�\�b�Z\�1�\�K�~(�ׂ\"��GTm\��\n�`\���U\�6#ʰ�HD�\'\�\�7l\�s�\��\�\�u33�\�\�E��EI\�d\�P\�m`\"\�Ȑ�)Ap\�NNByGd�m	6m-�_u#o}�;�D�\�U�ݹ�\�z7��r��k\�炙�\�\�\�=�^͝�\�\�\�Z\�G7c��\�˫o\���uC\\s\�\0�o�����\�jD�D\�I\�^^-�*�\���Z\\��\�b�\�K��<��\�?�����AVVV9wi���q/��\�Ϊ�o`�fc��ٷ{|\��\����5���\�\�ogym�s�e\�\�YeP~�\�H~\�\��\�T��M#t�\"�e\�\�a\�=\�2�n��7\��\������?}�G�������G\�J1LfÑ!\�r\�˵K$gDr\� �\�E ٸ����_`hd�o�\"ưk\�f��>��ϳ\�Xc||\�U\�cO\�\�D�j,\�Mq䙇�-r�����~�Ǿ�\0[�����H*�jL\\IJn�<\�\��c�\'(�T�p�\�i�⁯133C\�lc��|\���*\�L�x\�$��\���v�\�\�\��?�n5\�\�\�\��ƍt�v�s�^\�,\�ԙ0��\"d�\�s�\�S� d�qv�u,Ž2E$&x�\0z�\�n\�7t*o\�{7]�\�\\��kk\�7Ǧ� p����\Z�(��6\�p\�:\�B`F|�\�nX�s����o�\�{\�Ti�Rڍi�M\�LI[)Ys�\�}�K\\\\[eǾ��6-\�~\�0K��$\�2c�u�m\�ʵ���w�6\�JLR��+1\�ZLT��\���~\�y)�̷�,�\�Hi7ڴ[��\��>v�玟b9\�X?ʑ&�ZXØ��M\�ٽc#SgN3,1�?p���u\�]\�D���\Z�\�*Hd���c��֫\��+\�\�B�����T-\� lOb�TbT��v�c���\�\0��G��\�_�\�w\�J�\"S(�H�q�<��ףU�m\�E\�7A�UX\�\�34\�5���joY��Dc\�\r���\�$K�y\�^\�j�\�\�\�9\�q��^s-&�\�\�c���(vM�xWꁌ+q\�\�4F@-�\�u\�\�Dq\�R\�\�\�\�\�kp랽�i\�\�\�\n�ݴ��\�Ug���%\�\�fj\�\nql01\��\nQ�\�x�&\�Մ{~�],\�\�r��\'���Z���z~\�\�`\�i�ʲ�n�o\�\�D>.��\�\�n\�\�\�\��%Ձ0K\�G#�[\�\�f\Z\�ZU$\'\�R\�\�j\�]��\�O�j�(qn0n�\�Z)\�\�\n�&ؤN-�28\�G�\�E1��cQl�\�(��A��8-ʣi	�C}[�$0\�ҒJ��`Q$�\�\�\�\�Έ�C�}X?�oUs#\��#����\�]\�UKH\�MC[y\�/�<4=\�\��3�\����|�À[��\�p�EQڸ}\�o��۝:l��?������};�\�zM)U��\ru��,e!��\����8\n�\�Sk���!��\Z���d�\��԰Y�U\�W��b@\� \�\�[�	]�\�Qg�\�\�\�\Z�ݵ ׊�t�\�xOb�A\"d�D�\��\Z\�,BSu Z��\�!\��2�E)Qw�\�{�(I�bî�x�Ͼ���\�ߦK�\�]�:�or�8��A�T���.�\�,��2?�\�\��ѭq\�f��<ۭ\�R\�\\jiP�\�0��F\�P#�.\�dM�ŅE^8z��\�c`�J4�Dim�`j�gֺؒ-�Mn;��~�`r\�\�-N]�\�u�w\�\�+�)\Z��]��\'Մ(Q\�J�\�,Y�93g��\�b�b$\�\��\��D�Q/!\�\�7��\�}�\�E\�\�s\�\���\�\��`bp�(��=[i60�\�ڶ�\�\�<lL�2!�G݆���-\�\�,\'S\�v�8#\�\�\�\�\���\��\�\�\�ӹ˓V�8\�ޗA�\�Y�&v�`�>^�]��\�Jh�h|�\r�\�3�<3\�z\�[J �Xq\"s��<�DT\�	\�\�\n՞\n�\�*]�U�zkF��J��J��B��ۦ�R�#\�~WO7������]�=�W&ρc	�����sW\�5B�V.�YڪTֺ�\�\Z�7�Df,�����<\�\�VƢ{\�\�\�	\n\Z,�G��3(1��\�3�q\�\���K�H\�v�: \�؃J�\��n\�n�\"��+\�]\�J�<\�5�k}5�o��\��B,\�%�[E1Q\'	q�\���$!�c�`\�Oɵ�\�\\-,��ᛶoexl��7�\�}�KN�	¦$ʃ#P��|\�?\�n��\�\�\�1~\�y\�Xk����\'v�n(\�9�Zf�{	%�+\�k��\�q\�3����\�,<��G�\�\'?G:7\�_\�!h�LO�Hh�\�\�.+\'\�]\�ؙsW�C�9����\�^\�Z:\�@#\�\�X�\�X��^�\0���5\�\Z4q\�w[L��\�*��uK�\�bC�\Z��󭔹(�\�k^�\�\��\�}��aW\�z��F9i\'\�E\�τ���Y� $�\��Bt�\�Pm��͟�s��ys�\�hk�f��\�!\���\�p\�n<��VD�R�#iI)�Hk�\�O�səR�aW�X!\�y\�2�S��UHsU�Ć\�XX�\�3P��mLbW���폤퉸V�\�/|῟0դ�\�\�\��a��R�F/�\\\0�A\�Ha\��qB2�af\�]\�\�_~\0�9��E�`\�\�\�q�\�rb�\rW�\�:S\�wa�\���	�\�e\�$�/\\\�@�J��;RX��k�U�kh\�\��m..r\��+kt�4��I@\�7��\�1\�R;u\�>�Ubj\�}_\�B�5i�g�\��W\�\��\�@����]U�p\�ǂ���B��[\�K�S�p�\��H\��Џ��W�\�\�\�$*\�\\�\n�鴜\\1�8-�+.�9ԅ�%�8M��\�nY^\�?8\�0\�|z\�������	\�1��W�vc�g�� ���,�&�\�k���B�p\��0�Z�8��1��\�.e\��\��\�Ժ\�޷�\�\��O\�_�3\��\��=�bs���S����k\���\�s���\�tȔ�������y\�R�&�S\�X)\�,�Pw^�����\�\�ؾq��\�D��\�9��\�\'y�+YQ_NrT\\&51\Z\�h��\��\�\�>�?��0Ɉ�\\\�`y��\��%�2p�6\�1��l�G�\�9��e\�}o�\��ʼ�əˏ\\�:�\�P��>�\�\�E-̵JK\0򞳤i\0\�\�\��!<��Af�\�]N\�rJR��J�����f\�Y�EUy\�g8r\�,\�\�]9݂�B;�D��Ԓ�s\\�;�4������\n` vc\��\�~>�ۿ\�څI��q��{\�$Bl\Z<����JD\"�by�\�j�\�}�\�\��_�\�œ\�9uW\�ޝ�.�T<\�n�,����8v;J��R\�c-�&��#�a�\\V��\�\�4���\nM\�U[\0\"�\�ȕ�>Hr\"p\�\�Z�\�\0\�42�\�\r�䑪�B�\�\�EBn\��\�I��ە\�7*J1\r�ax\�����_��4�%\n��|&\'Xrm�\�\�_����\r;�\�YeFm�qd\�w�\�\\\�%��q�\�\�7|����N�ӆ-in�6%q>\�	\�\�%\�L�q�(�$�Rre�\�eN>E\�n]A2h�ǞX�\����CO>˓\�`�\�1�[B�@�\��;�N6\��u������K��pC�\�<�m>�{\�L\�1,a�+oUgu�������1G�Wb�W���]7��c\�\\9��\��\�C\��f\�\��ߟN���2�K���l�\�WTE�B�[��7\�-;!́΋�+RU8\��F�pi�AP�����]V/_\�\�\�\n�\�\�+\���{���\�B\��\�\\L\�yy�=�K��\�L\��r\"@X�N_\�\��q�\����V9\�,w�!r�\�����\��	D�!#�*�>}}x��ʔ_\�\�|�W>�t�5�\���xvTb�V\�\�Ŀޥ^�\�\�\�	۷�$�\�\�a\�\�e��fg�\��\�\�a\\Y�\�\�\"\�\��\�Ϟ`ǖ1����۞W\�ܲ��\\i��\�j^/��Pb\n�w9��\�\�<��\�gY8w�uޝ�4�#\n\�xK�\�\�\�vX\�5agU\Z��w\��\�_��]�ʕ)_!�\�g\���\��;>q�j\��\��md\�\�1\�P�.�h�[G\�\�)9\n�;��%�A�\�^�\�;]`߱Rߟp��\�)W�\�qU����^\�y\�\�LL\�\0\��\�\�\�`ea�\��*\�	G��\�@A� \�t<\�7�\�#^!¹�\�������\�_?\�\�>�M�\r9�+��m�\�\�2\�vC��!\�\�n�Dr�\�\�_������\�COu<kv�p��\�;7l[�[]�k4�����m��\�\�\�5�W�~�h5_ ���	B��;V\�~�\�Z�W\�q}Ã�\0�  ռ�Sߪܭz�+�vws׭7P�#�\�_�?�n\�h�5H������8燢��\�9\�)�\n�k�OW޵gea��GO��\Z�\�y\n\�uyr2hB!�МPce!s\�w���\�:��\�\�j�w`\�_<\�����{����\�\Z�W%\�\�u#QE\",X\�\\�2�<\�?S�m@SQ�\�\Z��k���í�\�\�0\�\�{�38�c��j\�\�I\����\�K�^�pS�&\\�{7\�\�\���böq�\�\r;)w/��u\\��U�,\�<�\"�\r�\�_\����ķ�bH\�#WB=5��h\�A.w�M�*\"�F.\�Ò\�\�S�3ُ\�{գ߸x*\���E\�\�\�\�R�O�N��n��2\Z�e}mU.��\�m��\�A�8�\�[\�X�\���<o\n����ae�}/\��gnH\�\�A�\�ǂ�\0ٟ\�E���n\�o3\����DRp[p��Z\��\�VY�\����0\��\�\�\��F�\�{�J\�V�\�\�h�脑J��.ˤP%\��Dݚ��\�U�1�X���RW�S�So�\��\����^\�[����v�N/\�\�r\\U񝷢L�ʊ͈q�� \�r\�9��۶�6\�\�\r�\�H�^��\��jFp_�P�?��\�\Z�]ᚂ�P�TH*Ig9\r�5+߄�,t)�\�\r�`�A�\��\�,\�F��\�Yj\"�\'�\�P^\n/�P�\�\nū�3��0�f�\�v8�$\�f~\�\�\��ͺP\�K���w_?-M.dnF��Н�,\�\�v\�ao�J\��NH�(3�\��ֻ����a\�]T��\�\����+\�e�\�	�\�\�\�A�,�r���B`�\��\� �\�\�%BE���O\�m\�j���U�J%XU>_㎃\�xZew\��N-�q�E�Ȭ���\"��8�G`���\��B��rzn��h�m�U������n�ZLe9��FB�w���b\�\�]�\�\�\� �\�I�1���Dq%\r\�\�p��@�Н\�*x\���5\�w8��x\���<�}���E�+�\n`LĆ�\�l\�\�^vU�����L��b�\�!�S�<�C\�xS\�\�Pe\�?�B��]b\���*/�ݏK�\�z\�f}]�{;\�V�v�KWxwW�c^K%�����p\�u�1<6��Mh���\�W]n�Sq�M\�j\r��:�,������&\�]u�D\�Msz�Z�8�	\�\nb\n����;yQ�(����#lؾ��g��\�{\0\�S���\�	w?R\\\�`�\n��V�\n��B\��\���\�@\�%��0q��ט�z5fU-\r�y[B�r(||q#츯\�?��\�7����9ˮ�ۡ\�\r�K%:���v�\�0�>�\�2��)KK,,,���\�\�\�$\�\�2ݢhd\�\��Vi--���H\�w\�\�a�\�Q���׻}�t\0(EC�p\0QT\�\�ϛ\��c|�\�QV�b_| P(g	��\�er����]\�\�\��!닀�\�=\�3GN<�k`����e붛D\�(��H���%otΚ��γ��O\�\��~�_s������\�-\�\�lPq�eGcjr��˓�-��d�Մ�F�z\�U�QL�e�.\�\�\�,�8��$~wh6֘:~�g���\nki\�j�bU\�\�\��ox=6x�\��eç<�@��Ի\�u\�6ް��\��5��\�\��\'�\�\njDU�^r\�\�\�֌\�\�*\�\��\�q\�%K���fL\�\�\�\"7�ɬ��\�\�ZҪ+50�oȪ\�\r�L�\'.�\�_}�\�۷�{\��\�\�,�>O\��h\0\�7\�\�\��<�\�\�k�H\�V�4��Tf\�\r�1;���~gM�2a>���tq1\�fit++��0���\�\rLY\��\�\��ܾn}\�f�n�\�V\�\�7_�z��[\�4RI�\��\����>�\�\�_\�\"V����\�\�\'j \�\"����\0\n�B$��$f]\�w��\�p�ݞ\�\Z���N��6��EN\�L�\��+1��\nP8�\�	��Ӽe�P\'�A\��F�\no�\�U|�\�A~�C�\'\�+�������f��s/\�\�JG�`\"\��7^K%�9�\�wx\�\�q\�M\�L\�|�o���=אTk�Z\Z++\�,#�֨\�j��Ϝ\��c\�d��\��{�2\�\�\�J�͡�&o��6o݌oy?�\�\�I�\�7\�\�\�9~\�w�?�䧩��׼�=L�f.]b��x�Ü5?\r+3\��=\�O�\���57ņ�8&\�G��\�Z{�fӯ�/\�fm��1	���͡r�]B1$\�1+�3\��Wх[\����\�׼�\�|\�>~�\���G�7�\�}�E�\�*Sp z��8�9pݵ,\�/�\�\�ܼi=Dh4\���\�y.�V���M�ܸ�$I�#\�\�\�sL=L}u��\�S�Q��f;\�\�\�\n7�\��\�\�/�ͮ��ȧU I�}����\�����c��^o\�\�gG\� o�\��\'��,\�\�1�\�$\�_;\�.��#�W�3�r�.\�x��>6ԕZ�\�j�i\�{�\�\'g\��֛GMU\�;7��߸�r&s\�K�%��W$��| \��\�\�\�_ɹ\�\�\�Ez�Y�Z\�,/�o?�\�\�\Z{�����.$Mq>ʻ\�m��\��N_�L�դ�Z%�\r��\nc՘��\Z�\�y�\'���:Lt\�4Í%�d\�ƍ\�\�w`�K�<31\�\��ײe۸o�o��4\"���\�\�\�\'�\�_|�C|\�\�O�9��Aƒ*\�%���ݘ\�\Z\'�=DoPk�� � ߬n#\�$T�p9ͨ\ZaG%a(v\����y�|�\�\�x��/����\'�\�\�[_䛷\�\"\�޲޶���5$�YF[\���x\�*A��͉*����$\�gdV�_[c��ٔT�\�Z<�\�A�8\�-�����>$k�$�!%�����~\�0��\�~�ֈ\�UI\�\�btp��\�^\�\����m&A\�][�9=����v\�d�\r\���v\�n\�c8b�f��\�\�� ��\�\�\�c\'��R\�M=��\�	�\�^�\'ڸ��\�[9�\�\�Tۙs{�d���`D\�SM�\rV��\�\'n6-Z\n�6\�T��t�u�\"\�\�\�\����|�\�d��\0�\r�����\�\�n7oXE\�ZVY�\n\�}{�p=SH\�,7\�sw+��\nl���vq�\�\�铧x\�;O�{\�^�lތ�)�_u\�\'Wu\��\�}�rU\�\�j�[��B\�`�c^\�qX�q`v<\�|�\�|�f\�Y�\�\�1\�6��!��Bʩ��:��\�\�ｻ\��^Uc� $>�\�#u��\���\'\�s\�=�<[V2R�.�\�\�\�\�=\�G�PDC0t�C�,X�5t;9�=p�ٱa�;\�@�D\�ʕ�Y�\�Pi]�0����˹\�\r�\�\��\�O�_���\�LNsV(\�e\�\Zb�\��\�HR�{qjj8�g!\����Wb��\0\Z]�N���\�%@HFl�#�\���5��T\�\�㣺��d~\\WS�o�\�}�Ϫ��Yw�\�\�Oj�{w.2=��K¡FS( ��#�*���7���_�?~��\��\0I)�pT��Z���K��M��8K\��y\��7�W\\�i�]b.�Fs$H\�ar|�ɑQ����\Z�:h��TG\n)\�s$�9l!VW\�\�\�Iۂ\�\�\�\\\�sA���9\�}�@��L��n��x��eqY��E�0�+e�[��B\0\0BIDAT:��zf�a\�g��J\�l�\�^{\�@�i\�h\�>\�\�:�\�\"���ψ\�\�cU/�M�l��פ\�_<�~\�yC\�v\�	]O䃟�\'y��ՙL�G\�\�5���%\�!\'U�$G�\�9I\�u�����\n�\�\�\��oP\�%�	�\0*�z[.ͦ\\\Z\'\���z>�\�\�h�ƛnC	Q��|��`\�6�\� �T2E�X\�\0\rM�j��\����~\��c@z\�� +5ٲ�[n�>��}tA.�VS��x%{\�34*CXH;Q!h��f�\�b\"\�2u��@\�(8O\�\�\'5������[viϒ\�N\"Zc}��\�\�?�?\�߮����_}��N\��\��B��\�\�6�o<\�;�\nE���P��VwQ�ď\�\�I�\�M�P\�G�*\�\�b�\�gӤ��/���\�M,mk�\�\��\�\��ꚶcsh\�(\�c\�H�u+�P���P�\�^\�iu�\�3s|z��>�?�\�nJ�΋$X�\�*D����Ì�5ą\�/J\�}Հ��I����k\r\�)Yl-Z�mhh�\�m�_\�\�$\�E\�\�\�Y�vչ��S��X�\�t5�u��[\�\��0e��^�*y��\�e\�\n�x\�\�sH�@\�=�\�\�&]���\�\�\�m;h�?��\�N\�FE�{g�\�\�v\�b�;\��\�}�\�9\���^\Zk,�\�^66�tb�[�hY<�\����\�偍�SW��<V\�\�`���XݯDe�sAL�\� 4���\�\�\�	�B@\�M��P\�74	��}���\�\�� o�^�Z\�3\�{F\�mYX\�g�%KO9N̈́#I9*\r�)Ժ��J;J\��P���\�\�\�\�1�\�\�ҡ\�[��ږ���0BG�kh��|��t/]F\"\��e\�ൖ@����k\�9��mX\�eg���k�pػ���Sf���q~x�Fn�\�\��g�\��X\r��\�Qa�\�H55�\Z\�Ih\�\�\��S\�ѻ7�\�4\"�Ɛ�TKT\��2��i[r\�i\��.�\0�7W*l\rT\�\rNk\�Ġe=�/�����l\�f��\\GӶM\�5=[���\�O\�\�!T������^�V3@T\�\�\�fxa\�vz�X�b���\�՛$�	B�0�x�hM�j\"�\�T^���M}z\�n���ܻ�I\�E�\�b՜��4Ԣ���0-%\�B#\�\"�g\�\\��B%i�\�4&m���C�������ܡ\�����K��x.\�\r\�\r�|~�\�z551��goׄx�P*\�[(~���~��rO\�L�.\"��z\�ԧ�\�LEL����9��B �*ٛ*��? wI�#@w \�D��+�z�\�\�\�kj��p1\�@\0�\�vECj��a���\0F0��˓\�^Uv[\�\�:x�[~|\'�t\�/\Z\'_(�\�\�&ڌ\0�&�&�����Y!i::�C\�\� \��+\�*]\�Ԅ�Z\��l2Rb��F�\�\�;�|��޽c�$�!�=9�_�0\�/�\'ǝ}�\��\�%��-�*\�\�6�D\�vT�:O\�\0�-\�0G�	ճR2+%u�\��\Z\��B\�4:!��C_f�\�6�\���~.^Lkk\�\�\�+ϝ\��G\�:��041�]=\�W~���e;\�\�\\\�Uﺔ-\�wpN8���\�^\�\�H�T�Ӽ@\r��Q\�W\�bu�׹c�`\�-�(�\Z:GJ�JN��#=����7\�\�\�>��3Ο\Z����\�^o H9�\�%A\����H�#!��R\�5\Z�\�\\\�\��\0A��u�\�!�;\�\��\�v6>�9[Һ`�X\�V\r\�D�Ϛ��`tj���~�\����<��hR�����f���{�6�>�e5\\\�½�iT�\�h\�>\�^��Ǘ孳\�\��r�\�\�:�ҶF�\�k\����\�\�|\�\�\�[\�OR�C�q�\��F\�vp�!\�ܟߏ]Q끃\�L\�P+t\�\r%D�\��\�܆���Z\��\���\Z\�R���\�{�	~�\�\�\�(\��;I44!�!E�(\"�p�\�<�\�f��?\�\�\�OH\�x\�\�k�\�uW�/��{��} ��\�\�\�\\`e0\�R�\�\�I\��K\�\�J�����k�Z�\�\�B�A\'>�X\�\�r\�7A\'�8Rj�D����U\�,\�$�FN\��\�� F�\�*V\�j�\�� ))���\�\�]����Ǘ��^\�\���=�(�\�5|\��RWS�D�N\���<\�=<\�+�\�b6�a\�҅�����P0�\�u������w\�\��D�\�!�\�\�\�{J\�\�se+\�vJ�\�\�Y\r��DGP�i8ҎMNO��Ro�NH�OC��R (U9�A�F��J�w��#iy�\nUSy��=\�\�?h1� �a�\�mM\��W�K\�\�\��>®\�n�\��\���|�y�-!868L6���:��\�>�\�X\�5\�w�bQ��\��vo��\���tUu�\"\�%*0���rS\"\\��؎D 	\n��p�\�\�f[�\�M��OL�\�s7}_��/��E+�Q�Y\���R~I�ţ@%�o\�tƥ̈́��ϒ���1-�-��D)ͪ傍5U|\�\�q�\�\�\�\�ώ\�NN\�\0]M�\\�r	g-Y\�\��D�&\�\�\r�@�Hu\rH��������ɩ7�	�fl���t�\�b\�\�\'��T�lrI��k\��|\�v�z��\�M\�)9��h�v^Th\\7�;A�\��DM�\�\�\0\Z�Nɀ�[\�X��`$\�޽{��L\�sg\�+�����K&�hX���}�\�g���ɚ���\�hg�P�\�\�\�34�x$�\�O@J7ٓ�S\�\�D0�mX��?\��\�&&��,$�H���i\���m\\w\�uj����^a\�/\�,wd�]�=\��k�S��!1\rZL��dK�.\�\�0\'C�\�\��D��k�U� k˲�Xw)���=��\0�\�Auh�\�q��\�\�Xt\�\�\�tӍ\\�\��\���I\0邠�!\0�����\��3SIGE��N����ZV�8P\0�0�ij\"^W\�\�`0�9\�ֺ�OQv|����H��\�9.�\�\�U+\�ކ&�\�s/v��!�.+\�<\�k\0�\��\r�N����\�a�d\r3�}q\��$_\�d蔀tp41W�\0(\�\�Yz���\�#t�$�`||�{~��p*\�\�\��\�\�*J���=�:���\�\�fФ���HU5��Qrn�\�	^�#u]$���ǩmn\"�se3\�ı*\�\��\�>�Ͳ�?\�M&�ђ\"F�\�uM�<�!��(\�ώ�*�\�j\�4�*G�D�8\�vF\�O�7\�Or�tJ@\"�;�%	5~�+��:L�ΠA\�r8\\,��\�ww�CVI��\�\�pb-řY�\�;?�)�;\�Y�t	K-d��v�\Z\�}^Q�E���ģ�c�d3��\�Ǳ�l�ڞ膁i�Q�U\��<\�-�\�X�I!�Yd�\n\�E�KT\�#]\n�cx1��y`:EK\�`�u\"TG5�\�\�Ղ\� ���Qk(/�zx�)\�\�B!�\ro�\�5���\�\�9��\Z�P]�3�\�1!!h5Uz�j]0\�4\�)Z\�z��BBL��\�&����j9\�u&�fˎ]l޺���i�tw����K\�?�ym-`�`���q4#�P\�\�-e\�4\��\\\�Vq\�H�\�.\\SD\n��8�\�`�Q|\�Y|i;\��F�\�:�t^}�ı@\�:5:�\"\\U\"�a\rP��A\�bg��\�B��fə���ޜ\��\Z:E M5S�U,�qA�	�_�\nAL\�		[%\��yV�nH\��F�F#��I[K3�-\�\\t\�fs9�\�4\�o~��CC\��[hin\�Kq\�\��ģa�\�U����F\�kxS^.PR�+\�R�\�\��B�\��IQ0>\�C2��w\�(\�\�#L�pΒ.:ZZHG�(�l#�Ƙ��H\0X��B\�Q%UTCQ:L\�\�\�W�\�S�-Ѫ��;\�[hml?i�\�\�)��HqxƱ׷\�\ZAMPt\��y\�aՄ\�\��*\�oY���@\�L�5��\r\�)\�\����T��TG�Yp\��A@f6˖\�;\�9\�˝|S���>x�\�\�\�኉b@HƧS<�y+�c�H	\�P�\�\��Pn;4�\���\�ꩭ�挕+�\�\�w\Z=��\�<���pMM�\0�\�\�}�3S5�\�?��!\�\�\�\�b�\"`Kɔ\�L��\�\�\�\�hl{���{����#ؼ��J�d}M\�T\�*\�N�jb��s\�q�\���e��\�_�!��\�e\\\�n�󘃕�����{\r<w�\�5bh\\���KWtQȝ\�t2\rB2����K%�\�Y\�&�\�?�\�%]�_���x�P @0�j�D\"t]#\Z�`\�kHHr\��&��\�2�|�\�s\�p\�\"tM�\�d��gO�\��u\nԸ\�F��Ɍ\�_$\Z\�\�\�ۏc\�-\�\�߯]�|\�\�Oݗ\�\'8U:% ��ї�\�/\\=4<3E^�4�\�Sr�d��*�(mC���9GRpʶ��_I)hkmb\�\�\03��j�#[MU�+&�z��FsC5\0�-INM039\�l>\�\�C�<�s7~�:\�^\�BC�hj,\�\�Ii[Ho9�\�\�\�s`��\�47\��\�W	GHMN�݆5p�zQa��\�5��`_��.U�\"�\�՟���\�WIOe�V\�\�\�\�yݼ9\'K���\�\�\�5Ϥy`ض@���8�\�\��!K7R�\�,\�i\�\�	(�\��y\�]��1�g2`ixl��H/�\�V�\��-\�T56P2&l�/}���z�:�\�{�\��A%%\�m&\�S\�\�\0����Y�j%�p�|6˽\��.\�\�s/uR�\�d�\�\�P�+\�FS	�u�|.G<\Z����\�\��T\�;MtJ	PS]<Q\�zǶ\�\�OI8�\�\�5�(\�\�1%\�A\�v|\�\���J�n}4\�:�il\�\�\�{�x\�\Z��\�h{\r�X��\� Pe&��j�g\�\�M�\��ޱ\��>�\'\�j\�ٙ4\�\�,[{��ƍ_²J<y\�y\�_Sg9ļ\��7t�!]#c9,h�B彭ml�����*5PiLԮ�\�4\�)s\�\�\����\�cT7\��B��\��|�m�\"{K%r@D]���\�*�xJ�Y�P4C|\��ͼtd�\�^\�Eɲ\�`����]o�;��ֺA0`ι��/�݃��s\�{T\�f��Ev�E��cժU\�z�Y���-���&T\�8��A�S�f�C\�\�V�UbޢN�\�\�ڤ�9I)O\�1�Ft\�@|k�SSK��\�7�n~9�ڔ\��Ub\�\�7\�g)�U\Z>�������0�rh8\�疫�>\�\�Tp#s<\'\�np�\�w\�\�\rˀJ\�Jh\�_˱%�\�4�\\���\�d6:���ٳ\��/\�GNM��6j4�\�A�\��\Z\�M\Z(\�d�m�\�\������\�Z&��\�[\Z/�� �v\�/��z63\���qbM�\�\n�MJ�4\��/A74\�m� ��th\�����MK�\�W�1=3�\�\�L�M�\��q{YT�8Qm�XU�o��,�蔔�\�\�\�dSi2\�\�<��\0OI2F#���ܞm\�!ͦ`e(@��r�+\��9@�e��d���s�\�}\�Fh�q\�o9�>N#������ƶ�D:9���i\��+B\ZO\nj�Zw\�,Tp�T\�\�5�Nn����\�2::į~�[B�\�\��q.��b.z\����aR�\�5Q�\0d>¿Hٙ�\�y��)ߍ԰�\"\�\�1��G�\�\�S�\�<�p��ݏ�\Z!!\�5A�\�\�.%�#��\�I\��b��\�a�\��/_�+<:>�f5�\r���	\�7I�\�\�M��b\�P*;\�N<\�\�|�U�Pn��A���)\���)\�AC0OJ\�\�c\�QS@�}Mh4�5\�\�9\�gG\��t\�u�y`x�k�!	�Ѹr\�ͤ�?�m�\Z\Z��� ?~�YT7. �\Z!�\�P/��\�\�b�ꀠ�\�M\�6��\�1\��N�\�.\�ʏ^K��!}ǎS(1u#?5��\�X�:�@�չ,�o�\�\�;\�1�NͰ\�t\�\�\"сeA�q\�fG�b��5�T\�t���_���\�>7�<�\�	��rJu\�\�.��D\r��e!�9(\��t$\�\�\��\�㛿\�Ȟ\\�D\�Y\�IBH�L�}�EIJ���T�<7/\n��7�~\�b֬[\�\�֣\�c^0\�##8��!^34��%��\�.N�V ;j�2\�ɉ�RJ��g�XͶC/Yt��{1�!ͦ��,�,��E\�Դ�`K\�\�T��PU�����^îC��\�ɇi�\�ʥg�%P�>n�	~+���\"5%��a�׀��H\n\r\�w\�v�\�\�\��\�#b��K�\�!595�\�8�~� w\�\�r2\�02�\�\�b�=\��՝\\x�z\�u5h��BU\�\�q\�Ђ�\�\���@~\�\�8+ۺ{�K&g2\��\��F\�l��F��<�L�\ZM�\�,��f�)\�!Q]\�u�x3�/\��p�\\�4\�Pm^���\�f�~\�\��\�K۸\��9{�2�	��*\�s\�u<�t�\�\'\�:~u@(�<\�\�CO��c����\�\��\���u�R�R�쪥ɸcSB帳�H�ī.@\Zز�\�?p\r�\�0@3}�\�\�\�q�\�ݍ\�~B�\�A�y\"�\�\�\�\n\�>\��c\�^~\�\\~��T57�����\�)FlIH����&�\�uz�g\��/r��!D0D����\��T\�],[��=}\�y\�\�پw?�&\�hmV!@�zPP�Ae0U�\�\�B�?\�f����\�}?߿���jQ>�\�7�\�\��	����]\�ij���[^�`\�\�\�\��s60t��.\�\��Y��\�fJ%j�t��Q]_��\'T���\��\�y\�\�]�L��n�����=uچ ��#\�Y�\�Џ��\"76\�=84Lp\�z.�\�\n֝��\�o�_<�ċL\�U\�\�d0%4J&8����jmc\��e\��\�\�\�G	Bc�\�n>w\�\�L�\�<����\�\���Ͳyͼc\�\"\�.[HU4F8h\�G(&Īad\�\�zd|��#}l\��*=�\�\�\�^\�ǾxK��T\�\�\\�\�P��i\�2�N�X`պ���\�=�꥗\�?3C���\�4�v�$t�\�O�\��?m\��/�\r\�~\�/�Rb\�6#�H)NN�\r\�r\�i�#?�j&�Le�Y��`;����#\�I�o�\�\�\��Wңc̦RX�E\�Qf3Y�|�lrZ�B\�\�\�,�D�P3����|�7��\�r\�\�~���\�\�!�p\�\�8\����WѼ��%�\�h�t�tå��\�\�\�\�T=���U\�`�\�^HݢE\�܉�\�~\�Z.��\'�㭷q̲хZ�e\0\�a��U,]�\�?\�t2E2�F\�4+\Z�䯽㋯m�S�\�$�\�y\�;6�\�j�\�\��%B\� ��Ů\��h�.\�\�\�6&��KD>�YW�\�0t�\"\�\�\�\�9\�7DmU\�\�04Mt]C\n��\�`�\�\�`\�\�wP,\�\�df��E,ەXr.\0�aGG�n>�\ne��;l�خ\�~\�<u\��%\�\�\��H\"\�\�6��\�\�4uu�\�?ǻ\�XJM{�:�L%�$S)�F ���clk\�i��=@�l[����]_޽\�\0Œr6�\�\��>\�\����f��rF��P^���o�\�*Cר��1M���\0uUQLC#4��G\\)(tB�\0ʷ�\Z��[�$!���Φ�4�\�$(Y6\�|� ���9�Z~�oH�4q�\�8�&\����\�\'�AݱH|\�\�z�E)�ϐNϐ�ɠkzzyk\�\��@;���\� �\�,�x��\�Ch\�8fUC��\�Ar�\��\�)o�cY6\�\�Y�04��8���)`��sj:J0\rƛ�\�<\�R�m9\�E��q�@0`\�7��\�%\�\�Bb\�J�ذ�\�3խ�N���$�\n\�N\�d�\�\�d;j�\�\\��I\�\�\�\�\�lc��,=�`׾��67�\�eь�2>p�	�\�\��6t\r�Q�P7JFP1\r\���\�V�l5k�~<�w�\��RY<Kfsb\�l@ͨ�i3Q\n0��\�r\�\�\�&�����FZ�\��\'�\�)\�is�W\���VS�v����^�כ���F]U\�\�\n\�%�Β\�\�J��Ϗ$\�\����\�\�ǉ~��\�J��/±9��\�W�\���;f\�q��²mJ�UL�\�\�=o�\�:WX�\�lعg?J<U<��.��\�0\�\�k\�Xx���;{xb\0Ĝ�QI�2��\��\��g.\0	A�do\�	\�!U�\n\�\r��m��Q�\�\���\���\�6~�\�m�7�\�V\�4��М��k\��n �UM!,�T\�Å6\n\��\�kB\�r�\�(Y%fsn���������\�`o�����۱*��VTp�\�\�B\�0�\�\��K�JKW�c[[�0]\�l\�6n��5�\�\�\���Sz[�X\�ؑ<65:�J\�\��\�\�ފ�\���e1\�{E��;\�\�\�hC��\�\�8�B	\�v(Jd�E�ҳd�y�3�3Yf���M\������_\��x�\�\�k!��\�f\�=�2��Mx�ђesx`\0��\�\��o����\0�l��&\0\0\0\0IEND�B`�','image/png','axelle-transparent.png','Marguerite','','',0,0),(11,'�\��\�\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\n�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0n\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�$�\���\�Zպ\�$�\���9 ��\0�\��/\���w�\�	C��~f�\�\�j�\�l\�\�#\�\��\0\�@Wa��Ȱ:��$��\�\��$�\0*\��\0�������n��c��v�@$F�{L��2}\�>\�Þ�]��.��\�ԟ̊.4m\�l�J�a\�n�\�R:�\�J:t�0/��^\���\�1\����q�W%��\"�H\�躋#�ܮG\�p\��W�l��8����Y\�}_ò\�U��(\�\�\�>h\�\�\�?�rW,\�Hv�Wڷ嬖��\�<\r���Xzk\�~%�&�<Sj^���4�C\�d\�wa\�ր<EmR`wu�\��p�\ri\0ȥH �5�t�\\@^�\�a�\��b\�\�k�[\Z}ˢ`�\�|J宇4�n��/M G+aԃZ\�\�eM�+y�\�_�F�k<���s\'�Fd���\�Fk�mWUK���\���|(\�+]b\�\�1�\�\���4,��˟s־��g�l�L��q]>��G\�\�8�\�\'�Õ����l�S�4\�O�\���4�\0�B� l\�4{�\����BO\�E]�s��\�^�1��\���P�A\�Gp\�\�qɯ	O���\�WF��\����y\��J�\�\�D��\�\�Ǡ�\��\���LV�;{ԋ�7\0��n\�\�\Z=\������nҵE\�HP��A�r(Ͼ\'�3�^I�=	#�հY\�\��\0�{�=�k\�HKis5�\�o�1GG*A\�_o�͆>\�ל�[�kk\�\�F��\�k��F\������:\0|\�e \���/�k�[�[\\鷓Z_@�\\\�\�7*k�\�u\�\0{\�\�h��\'@W>�����\�t�x��|�|�\��\�{J�8\�\�D1��p�I\�z��d�h��p�h\�c\��\��j>I�ud�Ҹ�_\�ꄔ�I=g�{��\"L\�x\�z\�uѐ\�+�P�\0\�\�\�\��_���7*{;pZV>%񎊀��^\\�ϼ{����-<\�H�n2ۇ��\�q<Ѣ�\�37\'�G�_�լ,o\�\�|�O\�l�6�^��\�\���\�\�P��V��f\�\�\�\�~H�\0h�~�\�\�^]͵Ӄ\��\0]�\��\�M�\�\�\'ԴiO���BW镭�<��HQ&�g�\�\�f�\�\�^iừf%@e\�8\�U\�Յ\�\��\�\"wV#�\"�=�M�ѩiw�e-��pVx��@�\0\�k\�<3�{\���ا�!fX���\�+��5\�NM(��s\�*���\�V`@<�\�5\n_\�iW�]\�\�X͹s뵺}\0}9���7��Eդ\����~\�\�~ea\�+\��\�?J�\�VW:f�ucz�.m\�\�\"��v��\�χ%�;[���pHQ*$v\�\��r6\�\���/uY\�H��`v\'@�^��W�M�I&�\�Ҥm\�N\�I�v�H���\�A�c yaO<��s^g\�kͷ\�Y9�\0��?\�\\�\0Bk�\�\��\�O\�2۬���ppT1铟\�\�\�d�5\r3/\0�\�8��5\�\��=ծ\�~\��\�\�$�Nd \��\0~5\�>վ	�z\�\�\npz�\��\�\�R�R,J+�\��~9�5��ĺ��\�\�#o0\"C\�\�\�@;�S�\�\�\Z\�|h\�P�)~\�8\�sϱ�\�\�h\�<�\�19\�t�\�\�\�,�q\�oz\0�?\���Ζ��;��\�j�����g\nN\�8u*�\�\�zƾ��\"��{�#Em�#{�\�\\|��4\�8brW8���\n�\��r�V\�\�glЏ�ч�Vf���YdeĄt�\��\0\�\�w#��:��z\�u�0[I���v���(�\�t�\�m��X��1�C�ߕcj�lz~�4H��RG�\�?\�Ws���\�\�5�)�+\'˒F8�?¹ψ��\�+e��nz(]��\��(�G+�Ui\�_5aGZo�@�g�F\�\�\�)�{g�ҽ�\�w�n�R\��epT�\�\�b�~�\�k\�|-\�[y��M.m\�z@�����\�\�@*\�b-8#�ҵt	Ĳ���ܞs\�\\�̌��rĜ�\��\�\�\�;i\' U,sڀ7�I�������c�\�3\�轇\�⺿\n��\�Z`B��>�準�3\�\�ʑ��\���z�\��t�6-k\�\�u�y�!\�B��@H\�(�l)1�\�\�h��-���G7V\�Q��;�y^�{\��Z�\'�d��#�;\�r��z;\n�e\�Bn��2 �\��1\�h��2\���?\�\\N���`�\�w?J�mnѤL\�`O�`�\�9#��\�\�D�θ\�8�:>�ᢻ�dKKT/\�\�;�\�\�O`\0��\�~*\�\�V\�\�a]���\�(��\��\�x\�tMcB���s�1�N7s��W�h\n�_\���\�Kt�a\�!�\�\n\0\�3�U\�u}��\�~&�+���٩\�iH�\0���N���\�,�\0ix�\�G�\0�*Ԛ\0�#/\'�д�]R\�n5\r\�\�+�\�9d\'��\�<��\�H>\�{9\��\�\�w��\0��/�i�zխ�\�5�km;DI0?v\��{f�=Y�RB3\�f�4�Q�+�\�܃\��?�yv�\��鶷�ݰo\\tn�W�xwS�{�p\�\�ʟ\�@.�q�\���ʣ};g�\0�Z�f�\�mv\�M����C?z\�5�N��\�P��]��\��\��\�\�;\�O��%\�}sf\�r�\\�\�hִ�oFuU����T�qڧ�\�\�%\�2�\��x9\��!�]�\��\�c�{\�~����\0n��\�y�\\o��\�\�[�rp(��\�̰��\�;(\��\�j��L�!S��c>ަ��ԔiqF��k��\�7x��-	#�\�Z\�P�9a�nUpx\'��E\0{<\��<%es���m\�\��lWv?\�<��M\��_}�\�\�3��\�W�r8<\�7\�\rDx�\0�zt��2][��\�L1\�H��߮q\�]\�VVH9U#Ҁ:�vW=�Z_&U?t\�(��U\�>�e5�6\�J��\0�@�s\�riF\�\�^�̌�$wwbW#�8>�r&{\�\�i<�)P���U�`G�\0��ҽ+_ӣ�\�>\�sok��NCF�;�\�AҰ�K\�M2\��\�[k�\�\�$1�\0�\�\�\�8\�_|\�ހ<�\\\�\��}�}��i�1\��r;�\�𦿵�\�Q���R��\0��\�.��X\�i:��)怇t\�=�z��6״\�\�	j\�ea,\'��3�D=(\�\Z\�\rb\�)\�\\�P\��\�\�j7�r�r�#�Ka�\�I�x߂�y�F\�|�s�\�kҬ�*,_2H�c\�t�\�C�o\r�\�\�-\�\\:�g�z\�l\�<\�@�^8_¼\�~*D쭕�\�X�\��m�T\�[5���\�7˻�=h_k�i�Α8,�\�#���ּ����#�\�\�\���:�q\�y95�&�<��up\�\�yO\�\�`�~u�\�\"\�\����x�Ƕ\'e\�V<�=:}sڀ>��Ǚ�_\�W�@\��Ko|��@�l��H���z\��e�\�-�S��|;�n}F\�f��\�w�\�>�;�\�2C\�K�Dj��)��2*��<qy��ٯU�h�%H9+\�\0���%�������\�c\�$�Qj\��)�����h\�s�_,�k�kkA\����uu#�CZb�<ƗV�zܑ�Y��\�0eI��g\�g\�e}\�5\��ѧ���V@U\�s\�=}�\�\�k\�?P\�����[>\�n�I!F:�ܓ\�N*�\�\��\�Y\r���\��\�d�\��\��\�\�\�\�pKñ\�,(�\�B;Ԓ\�o�Z���B\�\�5\\�\��\�O\'\�s\�+��ehX�(��_̛��S��Ls׿Ҽ\�[���\�K5��o�t2�\��Jz�9c\�c�S@i\�/\r\��_Y�8�\�\�\�*z\ZÒ\�Y��\�һ	|}s��\����\�\�\�$P�\�v\�;O�9y\�PiZ,Z͡�	;�n\�͆Q�N\�ހ9�8\���K�y�A\�|;u\"�\�d8Y\�C\�\nM/�W�\�m\�spHٸǵ{ǁ<>� �\�I\'�5ދ#������5\�M\��47�`�\��{g�c�f\��bu	d��$خA\�$\�t\�=9<ں+��mkn��ۇl\��\�\�Ҹ}SR�\0�{\�A\�h\�̥�\\\��\�\'@0\0�\��e~!\�x&\�H\'`�3J\�\�Fs����\�\�صO\�\�n\�Vr\�h\�<ĝ��a��\n��\�}��9a(\�s��\���u�V�X[��c$q�\�0�۵\0y����>jKpb��I�\"W�R�G9\�v�	\�#��\r�K�\����\��;\��ݓ\"G	�\0*{�\�\0�Į\�i\0�\�����[�\0�mv��vv�K�\�	n3\�H\�\���\�','image/jpeg','picasso.jpg','Pablo','','',2,0),(12,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0�\0\0\0\�,N\0\0 \0IDATx^��w�$e���~��s�LO;a�l`3,\�.9g/\n�#�׬\�+*\\0�($II,,�؅\�;9OO\�\�\�U����\�=��{����ٮ�z\���s�s�P-�_\��ٳnS@�o��V�����ȕ\�b1��!���\�K���t} �R\�EV�V=��a\�v��\�w\��FGG\�\�.��ByYUUU��	�\�lݶ���țj0r�Iߺ�\�\�r�y\�\Z&�r�S�c\�ޫ�\�s\�V}�DuUGy�6�a5\Z�.\�k\�\\H���H��9���������\��94�\�\�RJ!�*�@��H���\n\�kj	C`J��`ll��\�8%��0��_�\�9\\�R�\��o�ݷ�tmb���h\�\�\�ˏ����!��T\�b��p�m�v�0\�4X��J5�܃\�\�����4\�K�@�X,FeE%�X���2�\�(�P�@ ���N\�)���\�H&\'�%��N�\�\�\�k]�t{\�\�r��ǡ\rЗ\�_��~뷏\�3��\�jk/_�\���@XZC$\�\�R6XL�\�Y�V~�M��\�e;X���\�<NM3��ah����!�x<(���(.\�S˒E-+���֣\�zU��{����/Z\�\�\�;��KOVJ\�\�%�R���˷\�\�_���qCmM\�\�E�	�B-����\�\0Qb\�X\�p\��-\��k�.\�\'\�\�\ZT,���n\�3]\�\�\�r\�r9�\�,��\��zijj\�/߁\�\���P$̢#Q]]S�m\�{��uN,O�_}wG�Ȟiձ\�^��:XY�hWG�\��w^<?=\��\�--�K/CU=X�Lڽ��FR\�}1�{��i\"�@�\�,\���\��P^^N0t\�%�Le�a(�Uv.gY\'/X�t\�4д�|�\\.O.��`\�\�S��\�jD6�\�w]\�ddd��\�c	P}��X��\��}�?�\�\'O�v��\��/�H�\�\�/�W�\�_�\�\�\�;���}e^��}\�{AJ\"����v\�R\0lB��d�YTU\�\��i\Z�\�aB��\�L�L\�d``�t6�Ff�Y����z�ńb�\0H��|�\�\�JR��x���*�� �i2::J6�%�0�B�0)�\�������\�:\�X�\�e\�\�\�&�\�Q3�H��qN�[\�IGL*�\�͝\�2~����d&ޔ\Z�\�0��?0�\�\�*�z�\�T2\��\�3l�TJ\�\�\�d2$	�^/�!\�l���~��@ @\"�d$>B\"�pm�c\�\�:c�`\�RJ\�\��~L4M�L&\�\�\� ccc2�\�##\�N4\Z\�\���\�&�i膎iZ��\�\�\�}p\�H\�$�H�J&I�R\��yw�*X��(\n�X���j&&$G�;{�y\�+2\\y\�\�\���f�\�C�\����`q(1�G\�^{��-�\\�d	���v\�N� s�===(�BEEeeeH)\�\�\�%�\��D�\�\�\�q\n��^\"��H���	�R\�L�VM~��\�\�f�~?`Ip:�&�H0����EQ�z�h�fi\�P߀)M������~8�@b�7��(��VW[;Y���\0\n\Zh�F>�g_�>L$�\�Z����}\�\�?�I��9�>tP�\�Cyq2V�\��?�<�o׶�.XijjFQJ�\�\�\��t:M&�%�ɐ\�\�xU�D2��i\�r9\�DJL\�$�ˑN�]\�:Ltxf�U%�\�\�$��\�f\�\�\�4%�aPJH$���\�AJ�\�:t@p�O\�+)!�\�\�gs�|��d�/\n\�ܹ���A4]\�\�uR�\��\�\�\�̓V�L\�o��\�n\� 3�!\0\Z��\�\�\�\�\�Ǉ�~\�6��n\�9�L\��HQ\�\�\�|C�h�\�ds9L\�1+&�\�#,�	0�\�\��+�\0�d�l.G6�cpx�\\>�)%�����%M\�\n��9n:$O\�Vؚlc\�\nB$q\�\�|*� �\�\�\�@>�#�N\�	�1{��em3Ŀ�a\�\�=��\�~�_�T	|�\�4yI�\��O����3g.���EJI<gl|\�Ғ|�L&CA\�\�k\ZyM#�˻^����F��9��R]\�\�WNl5)ޒM\�(��3\�~r d�\�n:Y\�6p�)�?��PSSCUU\�!\�\"�W����P0\�\�@R\�q\�G/�᲏}\�\�o}���jFx�>\�?NN�u\�\��ȦK�\�\���(�@ �\�*�3088Y�I\�\�����8\�pY\�\�;�0\�1q\�#\�\�\��t��ܛDҪ��V\��(H\'h+Ѹb\�)Jj�\�x�*�յD������\�:\�\\�\�\��\�ݍT}�\���f\�ѧ>{�\�t\n\�n�\�\�Ѳ\���M�7�~o����,ZƲe\��\�\0D�Q���0l J>(�9\��3��kqW�\�I\�r\n)�\�]&=�T��Z^-\�4��@�\��\"v\�(�\'&H��\�\�B\�\�糃y�\�\�\�y������j���mz^{��I%�0�lJ\�\0\�+\�`E\���*U��9+;1�֖V�b!�ېd:�;\�c=ug�N�^/�ǃ�\�\rž\�4)l\�K(\�\�R����\�\�\�e\'�N*15O�\�6sR�`�/ի\�\�XϪe�)��x�_�\�;8��^\�е�\�\�\�B��uu�R4\Z%\"a\n\�\���ϸ\�\�ޠ�{\�~E��\� �\�K\�Rýψ\\�\�SO>՚\�\�\�0H$�\rL\�\�j��x0���N;�\�i�ly;�\�w`����l\�=S�)-�\��T\�~��\�Y��[�]3;�~/��2jcQ�Ncq\�lf\�_�\�\��h�;|�M\�,:���B464\��\�4�w\�~ی\'�}�X\�g7��\��>@\'\\�\��{\�}�Ʌ\�6w�{?�N�\�\�\r�Ln�+\�0R\n�\�\�\���\�g\��I�A~d���AzGFieO\�\0}#c�Y���\�Yn�ұfR}�3S�\nGC.c\�B~\�NcfC--ՕL��Q]!�P Z���[.�����ۿ>{@�R��(D\"�\0RJ<eeeE�011��M\�t^\�ܰd�g�}\�\�\�q:,@��ϡ��\�KA\�\\u\�Q+��#\�3M\�\�\�\�&�w�DK�S��c�Z\�>~e\�MS\�#Ɔ�Б�)MCb�&��F|��D���8C\�t���\�tt\�@7$R�\�N\"�\�0l\�$�*%>�\�\Z�UQ�*���W%\Z\�RcZMmM\rT��	��x�P�,\�\n�\��\�A�\�G�\�}��郝\�\�\�\�\�\�\�ހ\�GSS�@�⎝ �\��ƛo�\�}�j\�\�Ͻ��]�8v�t`\���|ff���\�@�\�?Y-�\� `�\�|����,�Z�I;(-h`��\�\�#<\�\����*��K	�a2�ɑ\�\�\�\�u��x*\�#�n`h|�d6�bkW}e�\�,#\��\"\0�\�O4䧪,L,&\��N\�@	E�\�\�6\�\0�:h9�]i���\��\�x*\�\�\�^&RZ����(���\�\�P��\�f\��>X5޵���t\�\�W�}ﾾƃ�nij...،6�\���`\�[��\�c\�\�XW\r+\��|\�N�@�e�^ri\�?^���,����l�iJ\�y�\��̞V�WU9u���\�:I��Eʒ�)(	�>\'���H\�g!\�q\�f�6s�E\�q\�w�\n��a��P>�\�m\�\�\n\Z}}=f���\��w�\�5F�(\�\�5O��?\�PY�D\"�\0͞�Ig2�3i\n�1\�N\n�F\�\\�\��h�\�R\�\�hi��\�Y<&B\n�\�9\�2ƎU\0�\�xd��\�)Kڐ~��1�kc���p�Z���-\�~f��­\��\�K��CGx}H3�\�fs\��g��?���/�|prN\� �\�;;Hd�Cu���\�\�\�/A	rO�\�X�g�M---H,\�\'�\�008\�D2�n%��\�d!8\�\�\�Y4o6�	�DKq��\�\"\0�p{\"l@�]RQҭ�n\0%�Xm�(T�\�1�f2��\�g\���t�))׉yd1h\�	\��v\�0l3Gq����Wɢ����lr\��#\�~\�\�\�#�\�	�$t\�\0}���T]\�6\�\�S^i\"�$N�\n\�@#Q�	+�sΉk�( !A䲸ƺ\�Q�\�f\�$\�9\�5\'K��%�8\�p\�DXa�t\np��\�e��e�B�ظeeSv^��	�,�򩏜MY��:-UU�L6\�\�訽\�d\�o���W��=[?�\�\�\�*\�tP�z\�}u��M6\�*b\r\r�g\���<^��P0H�_\�H����3OXMY$\\|,7�40�m�\�J�\�[�+�R�8�\�y$�pM�u-���vʓN���ʶ˝B��\��o��4\nŲ(Nc͜\�̚��\���Ȧ\�i�zz�f\�!^����\�\n]1��A\�\�oެv��ܧ\n�|h\�\�]lظ��\�(�j-��\�a\�n���RNZu$m3Z-��\�tY���a�^:qEQ\�KRNu�\�g\�0☙Rf8�#�Tڤ噄�(���fK�{���\'�:�h8\\�\�\�۠\�:H\�N;	���\�\�bߺm\��@�\�L�\�\�X�çǚ\�(���RYQ�\�U1êt��R+\�W���k���XL)\�l�\�y\�4Y���\�8y&?��d��\�`v��nq�����\�\��\�X�e��<�\�\�knl`\�\�\�\�v�\�-��M�c�%\�h��\�*&�l�8���\0�H\�o_�7}\�S-G��\����)�\�ˑ�wMǡ��AyY�\"s-W\\8,�&h\Z�/\�A��QJN�W+�\�\�R\�frE��WN{�L�\�\�!��޿\���� %����sg��(�� \��\�룢���ޮ#>u\�\�.�@��F9�\�W\��\�n�\�ڊ9��ww����r�\�\��3\r��rV/[�_UH\0W�,�U�\�Z#��\rX\�q�\�~�)u���.m�M)�)yIr\�\�\�0 ���(U!+�,����h5l���$Z��\�m\�ػ�ݔB\�6ڳ�86�}�\�6�̚s>ڢx�g\�\�7\���|>��(��VW\����\�fw\�K�M-���A�\�8��S�릖h�;\�8\�(�eIL�N�\�\0\�t\0\��֤g%_�B�H\�\�W��,\Zf\��f���\���Eq\�a%cc�tv�衺����藟�\��g�K\�qP*���O\'g\�\�ֹ*��U�\��\�ln�<\Zw\0�I\"��\�\�j��է\�ZK[��FZ�J\�Gj\'�S\"\�-\�\�9�:���4�}C@in\�aH=��Ws��\��_�|a�e�J(B����Y\�\�\�KU\�<\��w�y��\��a\0RT����I�laG\0BZ\��٭�d\�vx#V��kL\Z9K\�5u6	7b�b]���R.\�t��K�3.Y$�M�\�,)G\�6��@�7�> �\'�GAHӗO�Vr:4@�G��i��V#T_\�\�KS\�fX\0Mf�#\��\��4\0�Dq/)J���R�\�\�^ڝ�S\�\0�Ax@X��AH\�\�.�H]/��D�\0-�\r�s\�\09�i� U\�4��\�\�!��\�F\�\��7?\n�\�l�#\�e\�05\��I`�\�rֱ��V�)��&S\�\�\�d�\\	S-\�d:�v\�OS\��\0�L\�}.M�LQo���\"���4\�\�N\�\�4MR��i&\�TiJ���\0t\�Q��eL��c��\�}֠\'�H4�\�Q�\�0L\�\�I׆�Lv�aX\�N��i�F8e\�7\�*��8\�PE��y`\�DI�*]v	��\�\��q\�gN�\�0�\�\�\�����!h4�8q_!�zjxd\�}���,XmN�\�<�\�tk\�OLP��w@�� ��\���\�~��@\�L��<;D\'\'a\�\�\�\�	�J�Ը\�\�\"X1�a\�\�\�}���s_g	\�\�XJ��\�N�\�%+�=е@_\\RɕK*\0x\�G�\�\�`0^0Lӊ\0E\���\\�JJ\�[��\��\��Z��RB.k}�T��N��\�!i\'*^Y�$6����ryP��DD��\�t�}\�}f1��ת\�m���\�w���2�L$R�[wlA��/\�\'�����S���\����\Z�kɥ{�\�\�\\\�\�#>6j\�\�i\�_E(��\��	�ZM\�M�:AMy�H `�)E�\Z�t�\�\�\�	9i�̭�\"V%M��\��Dx�I�\"�%%H�^\�.G�S\n\�=u\��pt����\�-I))5\��ۧ\�\��\r=U9s^��\�T;k\�ƽ=�F\�FG\�� ����Җ7i���^ɢ��-�즚�x\"ɫonⅷ7\�;<�a�\�\�Yk]%-�U\�UĘ\�XC]E�\�D���i��\�.�\�d�\�\��aK\�ĉ�|�<�ێ\�<\�J\�D:\�X*\�x*K6_�}`����\�#�&\�i�0���+.�(m��\�Q=`|\"�ϧR\�tWL �ɐ\�kC!R�����a�B�ʙ�\�\��\��\�&\�\�\Z\Z��.BZ\��g��\���M���%�<�\�s��\�z\n��7��sp�\��Q\0��6VFkM͵�,hmd^S��\�d���\�\�SJEM80%2R��U\��灐�%3�\��gh��\�QF&�\'�\�����YuIvu��?�<\����� �\�ǭ\"�\��\�WגJe]}\�t�t:�\�\�G/蘆���g&�+|\n�_\0,>��W�Z\��ŋ\�\�\�kY$~��+.��sN\\\�6D\0��1~s\�\�ع�ݰ�٥\�\0\�t%X\�}�[\"��\0�y	�}4\�Tp\�\�lݽ���\�\�\�\�\�=\�|\�3Q����`\�rqF\�y���~E0����=t���w�x\"��t��aX��c��~\�C\�\�%�Q\��#�`<�c<�\'��\�/_AsC (4�\�\�\�\�y����+N~{�ϻ6��*���ŧN\�0tX\r�lm�\�Ж׏O\����,j�\�1ˏ��=&I)\�fzE�9f�饄�i�\�k.0\�B���3�\�3�Α\�\n\�Xۯ�9�LNcx\"\�H\"\�iK\�x\�\r���=��݃qf4\�څ\���fI�\�\�A��\�?)�X\�6��7leKg?k\�\�S\�c�;Kp�ِ��R\nP_�.�:\Z�9�\"跗\�jG�Y\���\�\�>\��� ^���ӛi�Vg{\�\Zc��C��\�)j\�V�ʇ�P�}�+�\\\�Kd��\�\'g(\�M�\�,�\�2<�!�\�(�0\�\�<�\\�8�!�Q/>�U�\�ڐ�jR\�5�F\�|\�;��{l��a`\"��\�\'\�L���\�cZM;�z�\0ai�;\�\�^CA\�yq�rZ�#fְ~�n͙\�\�\�a��V\��!\��~����(�M��޸�q�\'\�\�$�U��	��ܽ�a�D��Բ\�\�ů\���0I���\�e�\�Ҹ\�\�;\'\�.n+?���P\0yg�)��}}\�GԦl\�,�h��}��fy�wB\�hlfI\�x�\��R\"��\��\r�����\�E\'�xjsU5\�\�ڷ�ƺF���\"�^f�b\�Th��\�d\�\�$�΂7\�p��\�OgR%gH\�*YS\�@��\��\�CY�\�?\�\�!K:i��¾�k��\�Dt�;w�z՗ɼ�\�\�w]��ÎA��\�+O�B^\�P$��:�h=�D?��\�\���#\�R@m\�OH)�d,o�\�Hl ]�\"�\\ji\�\�J\�P7�\�D|=_C|�FmT%�vǷ\�1���\��\r�l�Ww�\�v\r�r:֏\�7&\���YN����\�\�*�{\�\�Ye6DT|��Pj �T&r#i�\�\�z�唀\�5D!6ϔ\nߘ~\�\�3|\�co\�z\�\rXPeMm\�\�\�\�\� # P\Z:=X���[\r���\�y\�l>r\�<�\�RH��\�\�!72�Q\��.m�l�du��T̀�t��f2�-�}$\�x\� ���\�\rt\�d\"/\0?餤+U`\�S[	��\�U\�^AkU�d�@\�X\�4\�2Z̀�yA\�\�!�\����:@s���\�C�O�&l\�7z��\�\�\0�\nB\�	�_�5ZS�w`��������x2�t���$A��n*G��j\�\�s�Z\�q+4\����v\��B:\�bb�՛)��\�\�\�)\�J>\n�\Z��}`�n3.;y߻\�8��DT�Hy2�\0\�T��[��\�e]�$h��T\Z\�>J\�\"\��\�	�c�$5�\r\�hOl�g\�\Z��D���@9RHB#{\���\�1y�NH(�)\�faM�9�~\�T�i\�\�s��D�@/�AcU̍�$�r\�U�1���G\��@0pk[\r�dFc���\�\�ek�8�\�h�)Db\�]{\�\�1�\�\�~k��\��G\��}ǵPB.@+/�ZK\��W�]{��\�Q�eX��\��Ges���\�\�$5:�?5������\�ex�8\�@+\�5�HJ\�L�k\��A�xǝ���\�\�9;\�j[���\�hX6{:��\�Y^bY}%ZA\�\���v�̖^L$F��\\���R#x�/Q�AL�r\�\�f��C\�g�iK{?��1\��]��\�?XU\�\�p��kP�~\�|ٙ���z�\�PQ\�;�l�i�`R^SK \���\�\�I�ńPT)%������=;kթ?\�\��\r\�\'n{<�\�\�{dp�֕���\�\�܌�\�aoGWmv���<Qu�\�\�\0\r\�0#J%YT@	x=V4m,���~ΣO?GSS3+�-Ô�\�\�\�i:\�� L+�.1�����w�\�{懗|�\�\�Zj\Z�	D\�|��E�\�\�5��%qfL��Ne1�8�;��cg�c�\�ꤐ\�\�\�7��\��;M-��b�L)%�\�	z�dm�!h��Q�i\����G\�t��|%~,Ɨ�\��8sx�\�	$�@��#7ڍG��L�\�O=*dR�W,9�h\�:�\�\�\�;��s�gޥ�?�\��� �lz����\�۱x\�\����b\�b�|���a\�y\�Q\�{\�q�>�\�h�X4D�\'NX\�\�ȔO>l%q�IH�\��Ƶ\��̿^\�#��k���+�3<������\rr۰�\�I\0\0 \0IDAT\�ޤ`/\�		\',�\�g\�Y���\�\�g?�!���&�|�k�C!��9u嬚U\�\�1<Z֊�\�t!ܫ\"]z�LB?f]=;>\�����i-�\�?Q\�8�\�{;\�\nw>�6\�\�~\� �*W�{$G̨\�\�_\��{�\��z=R\����2Օ� \'{�\0��T�\�H\�E�\'�dl,îm[�.�\�%\\}\�唗[N˻���\�ľ�=��<y߹�\�\n����\\�`.�\�|V,]LOo?�|��sg���}\�\Z<F�\�0u�B>K�7G�\�ޥ#�e߁�\�\�->:No� �f\�\�\�\�c��\��\nol\�\�oE7M�\rN8\�\�\��}^֬Y͗�v����\�d�8�y\rց*O.�o���M4gzi�i���\�gy}�]�*\�\�\�\n6��c`�_�\��������#\�\��\�\��F{\�vZM9�g5��9\�\�s��\�	G�\�j\�`$>�@�\�H``4i\�-��_����k\Z�@rl����\��\�F~�\�ki��c\"������Ks\�E\�\��lϛϟq\�\�o���=sn\�\��+c���\�\���>�4��rV�Xƕ����^�I2\��>�\0����$�j��\�Xk8�zF�K>R\�6{&�\��+n�󽼿u+�\�\�GJ�$\��F�8x�\�i\��\�I+�{U�>/���e��\���5@Hk\�P\�1W\�Ҕle�\�Z>�f1\�\�\0 y{\�0�k�#�F N\�l�,��l\�\\~�ӟp\�1\�X�>/\�.k\�\�mݼ�\�>kX��\�qͥ\'�t\�4�7_x��~\�>s\�\�i���\�S!RJv�\�\�	J��\�ړ�/h\�A\�\�\�{W}��\�?�]{\��ý�\�\�ML�M��˙��\�\�{�4�\���s\�\\\�\�يԏ���)yg��<���\�d�\�\���\��?㶟���>9�\�=t��P}*\n��\'O@	�2�󘻺�\�0����Y3���;\�`_w?�#�UTR\rr��\'����]�CH�\�q⊹D\�EϨ\\�\�\�8��\�븊ag��*\��\�#KX\�T\�2\�\�\�5(B�\�n#W0�\�M\�)�\0<rAG\�\�^k{\�\�R\�uW�Ó�l!�\�(�9\�\�y\�h���9K���\�sTC�gO�<\�P\�OId\�cϘ�\�#\0��f�3N:�O|��z��\��?��Nq\�\�?O$\�{���3N>�\�\�\n\�]}��6�ި�\�\�\r����\�w7R[ei\�\\�{o�>\���v���\�\�n\�_�2_���Q=��A�7G*\�G]\�	F9*˜\�Ҭ�h���炞F�d@Q�Dp�\�:X\\�+��qdޒt\�\�al\�>�a\�e@X1ԦN[J�d͜Z5U\��=R�\�#8jz5\�A?y=�D��w��\�\�\�\�e�\� V\��<�����6�wV��k�\�$h\�\�4\�nFD\"Ep�\'��w�dF	aR\����b�c���\�s5B�\�n �\nn�\��\�UY�{j\�#��\�&\�ϝ\�\�\�;U�\�Rkf-�\��\�\�e��`f+�gTY\�\�U+�\�������\�\�_�^\�ۅTyst\�\�\� �=#�Y\�l;Pp�#cJ\��0\�R��w9f�E�\�&�\�\��\�\n#i\�9vN-�Iq8�\�TA]Y���5]����\�׻倄\�29�m�\�ֆI+����(�{VU8��tv�3�΃�rO�}�\�0MB\�\���i�u���Gشe߾�cxU\�\�[0��ށAbe։�\�.����?\r\�\�T\���Her �o|�s��!w>�4M�5\�u\�C\�\�袩�\�iB�W1���уgu\�\�\�E��� Q\\��Y����~ۅ��V��\�\�ٍiߒ���$������5s\�p�EJ\' �h�\���Yz%\�\��\�e�V���@ڌr\�9\�-\\\�\n2��{\0��&\�y\�m\�&�ix0��\�kq\�XV���{۹뾇h��\�\�\�_\��˿\�\�^xْ�L�\�G]����1\�S\�nR�|Lo�F\�\��ˠO>�~-���z�Q`��\�,�3\�>�\�\�<ż9|f��?\�+[:K�(\�[4E*a\'�d��(�\�m\�,\�8;�v$�Ȃ?��H�\�\�\n�-�g-j\"\nbz|�e\�K\��.GL��\���fY���\�&KzoQ{_�׶v!%D<\ZUs�$�`��\�j�\�\�z�\�~}=��\�:~��OR�\�=8Lk�4|^kLپ�vex\�=\0\��Q��4�mo\'�|�\�/\�\�;�\�͍\�T\�8k\�Q<�\�\�X�p>y-g1͖��G\'�D�԰�=\�\�]}v��\�I)1�id&�\�H\�T؛4,\\�,\n�$[(�\�\�!�9�h\�\�i\�0S	�:�\�\�b��������:\��sТut�f\�\�9�,�ʖnGűô�\�\�X\�\�Vg�\�)�\�y+�	k�\\�7���\nj�+�����ʫ�}\�J�+b\�TƸ\�\�S8}�Qd�\Z\��v1�y\Z\������\�\�Q\n��&�B{WG�X\�\'\�;\�9Zb3\�\���\�\�\�ޡ���\�\�\Z�\�V�}�I����\�s\�\�M؞��ڸ�GH�?�\n0؀��\rY�����\�4/\�\�GJɴ�\�4s�\�n��1R�\�L\�G\�\�$=a\�,��^Μ_����Q\�\��:I\�l\�\�#��-0�Tl&��]|!�:d\� ��v���\�\�G!O�*o�RܑP_S�a�}\�mϙ�G�֟,�x�\�\\p+�,����(��)\�\�\��\�\�\�\�\"\�;��$\�P�\�,�k\�\�g���\�>\�o\�LMU�+QRR\�\�ɍ`�|П\�//lB7L\�uDr\�4\��,%*a�\�+��\��\�Ģ3J?�nݣi+\�)W̢5�%^\Z�\�\�~2I	\'�հ8����\�k;�\�\�1H�\�Jjܟ\\�[m��,:c\�znY\�:�_\�\�\�x\�vK���\�\�w7\�\�?\�-���\�7n�8\�I|>�k>s)�\�\�t��㏔\�\�\�\�£�ϔW\�&\��1v\�ڃ�x-�ֱ�g\�X\�U7\�\�K\�s�g�\�\�oR\�e\�\�\����,B\"�I�ė%Y9�\�<��_ڂ1G�)q�X�;[N�O�\�R�P,!�����\�\�ws\�[��R`&�X]#�{=xT\�\�\�\��\"+OA\�3\�\�Ej|�\�X��/\r\��\�Í�\�\�\�=�\�,�X:L��\�j�\��$FG�\�\�7x\�\�](Ba\��r��	�\n\Zc#\�TD�<���|��39w\�\\uӭ<��k\\s\�\�\�aǞ=\�G\����MG�PB-s��Ba[*�f\�\�v�(�\��	��\�?8e�|.9�\�+btu��\�d\�\�\�\�+\\q���~\�\�\�\�VQ\�+p�:H@\�\n7s\�\�yj\�N��$Qjʜ��v`�U1q��\�w;���$sL-�gd\'���`4JU\�4j��P\�\�BM\�4b���UU�U \r\�\��\�K�qV]-ZϮ���}\���:�b���)�-�k-,��$�\�������(&��\�p¼j<\�\�Tqښ����\�\�%F\�\�\�!�N�{o�\�k�\�\���w\n\�ˮ=�H�\���ͭˎ\�P����}\�ZZ\�JgV��a�r\�)ǣ���t\r\�\�\�\�W\�8��\�Q|\�-.�\�|Ν\�\��w�0�Hq։k8�\�c\�\�bx\"͋�\�<�\�d�h\��O}���>�f6�e!\"~\�\n\�I86\�J+�t���\�\�\�<����lYȣ�n\�KgŒ\��G�;h�#�t�L;e�A\�\�\�\�|{k\�x)\�O\����\�#X\�\\IY\�\�nq�%p�-X�\�\r�T��֞q~�\��\�;�fH\�5\��ϝ\��`+\�\�\�P�@�\�{[Q�A���r��\'\�?0\�\�>ƒY\�9g\�R���\�\Z���!��u63�ʘ\�\�Ɓ���	�n\�i\�<y\�\�\�l\��3-\��|��ݽ�|>B~�n\�AV��\�}�D2�߯\�\�ׇ��ޮ4�@�:\�ͫ�3穷�wK�v��\�o\�o\�_\�Y\�,k�䈦�aGS�v>$#�<:\�<�����5��$\�\�v.Z\�\�\�.9\�\�+rύ_��Hnђ�ߋ��-�G\�j\�IY\�{��zh\'�TN�_\���r�^OQ����\�&Y6v��~\�0[�\�\�\r�G�ӎh\�ۗ�Ȍ�\n�\�\�ds9�\�i\�\��\�\n��]̛3��h�o}\��y���s\�\��|>�v�rԂ6�/\��p�w6m�$fs\��w�dS�w¹�l\�\�w7�۲}\'\�����:fT���~\�^.�\�G��\n�F._`��8y�ѬZz\�L�t&K8\�㫧.น�\�}��\� ��<���\��R��&\�u\�U�L�����X�\�/o���O���\�^�1\�*+�d��bn�9s/%t�\'>ʏ~{7�}�\"���p\�k�\�5U�\�Wy�k���_U\\*%ݔ�e�\�\�E0���\�V\�\��\�\�\�7��y<\�VU\r)�F�`�>�u-\�`\��6��x\�9\�d�z�V͟X%n�qt_��ysyw�V|�pb\��羸\�\�wYv\\uAn\�qg�z\�\�~��\�~\���\Z\��\�_�\�I\�52��\�܊���z�������-�<\Z\��^����\�:$�@�\�ѳ�9zf5=c�\�\�\�{\�\�\�7��;�F7�Q	XN�\�ԗ�5��ճk�\��V~�{�X1�\�r9呰=\�\��\�0vҌ\0 g�9�g׾\�\�/�\��_���X\�\�k;xzK7[{M�\��\�\"�	a�JM\�\�\�\�kX\�\�E\�X\�R���n <\�\�aۮ}�\r\r3\������+\��wV\�4M�y�t^������*��Ὸ\�ߐ\�d�s\�	�\��9(Y�\�%\'��\�\�}uÖm�u]\����\���4M�/>\�\�Y\�y\�\��/D�x�\�2�]�:x{\���T\�\�!�\�\�?<Ls}-~!\���ia>w�\\>�f6}v$\�\�\�>��`\�R��<\�.`VM�ٵeԕ\0����s\��K4T����\��^�����H���[\�}�t.O8\�\�EM����=CI�&�\�\�3��\�6Z	��5Ę^fAC��?g��\�5���!Z�ճp\�Lv\�\�`GG^\�ˌ�f\0C\�\��x��Z鋏�\�\�\�\��\��\�0L6l\�F$V�nsu\�c�\�H��9�\�e�{&��X0\�\r��\�/�[o�	\�\�o\��\�^\�w7��N煍���ߟ\�\�ë��R)\�fLcެ鼻�<���\�\��y�d#�mü��\�\��U$�`�FX�\�Q����$P&c�$\��5\�Iiikŕ\�\"I�8��,K\�\�$�N����#\�!�΋Ϋ/�%�.\�6Y(X?\�T�	]\�E\�w~��٭�l޾U�0\�<�A&�\�\��i\Z=�\�}�\��\�\�\�;4g�\�\�\'��\�x�D��;��K�\0Sa�\0������n|\�\�G\��֯�\�_\�\��\��\Z\�=�$\�j��\�\�\'��[\�@Ae,@O\�\0;��M�����s_\'\�C]\�c��xÚB��0\��ڿ�\�\Z~\�S\"\�:掄p0@W�0�d�\���\�B�C��[�I.�B\�\�HT�\�zK�a�\�\�l m�&�9T\�W�cQ�mN\�\�{�*y���Yz�8z\�TƬ��\�]\�\0�T�\'��?���s\�4\�Ր\��.Z\����\Z��\�_y}\�;�׵\�Zv\�g��\�\�sw\�\�\'��mKV��\�x\�\�Q\���\�\�45\����\�h�e3Zxy�6:\�H	���\�?\���{\�l�3)\n\�\\\Z9nd*��\�\�*��@\'ݏ��t����\�\���=\�l����)N=\�\�+:�\�F�a0�����\���7\�SU~s\�x��\r<�\�:�\��\�\�\�Nw��\�\���6�T\� V��N;�M\�>`\�\��$�I\Z�!NZ��M��\�Oe��KO\�\0W�\�z����sn�\�\�7�$s��	x���?��?޹g\��P\�I\�\�o��f���\�10�dKg/��-|ᓗ�r\�b�}\�jk���G\�ug���WS\r\�~7\\�\"Yk9��\�\0[6\�9�b�4���ֽ\�[\�\�eK�xy\�VZʢ\�\�b(��\�ML]\'�ɰk�.�\�\�x�\�7Y:k:�a�\�\�o�eo�|�+,�3����A��#(Nx�\�w�@	��� T\����Lp������\�n��V,#�\�\�K�`\�B��\�7\�\�\�\�;\�\�L2�m���ʣ.���o��8߭7�L;�l���\�\"\�^x��]�\��N\�F\�u߽�O|�I��\�\�ˢ\�\�`֌Vv��\�IB\'\0S\�\��\�\��|��N֠\"@\�b�E`݃#\��\�s��\�&V\�la_\�\0\�#q\�_��#\���A�t�r߿^#�8��\�\�ۅnHV/]�\�+��l\�\\T��;A�_\�?<I@�>Dy\r\�Wbn��op��Gς��x���\��hU��G\�\�?�5��z\��coYx\�\��\�\�W\��K\\mѱ��f�k�[�\�ٺ��X$�\��\�󟺄ڪJ����AN�\�2�{��\�\�L \�\�}\�\�^�FrE{5��H\�5�8�I\�\�Aa�\�&�\�\���Ѿ>\�n~��^^\�\�XG\�\�	Kp\�y�\�:�](��\�c���^z�ǡ��Ym*\n�{������/��U��N\��\�W_\�K�\����\�\�\�������jdd�?\�� ���OL�2��\�G?ܲd\�Uk\�倿\�pн\�k\��e攫n��4\�;�s\��o��M\�>\�ҋ\�\�\�5��̝5��\�n\�ް�֬��nP�\n�IZ\"\0Yd\�d\r\�2G��y9(+�\�\�\�\�y�\�\�\������TU�S[]�\�\�\�O�\r­��Jd�#(�Z%�\�1�(֟U��\�\�;1����U�2<2\�\�u\��\�\��๗^AGI4-:�\�s֜u\�K���?�q\�\��/\��\�\�9߿��B6�g���Ǟy>�\�\��-��^v��cJ\�\���qUE\r�\�8$u�\�\�)\�\n��\�\�ʇ=�ىā\�b�4<	G����y9%�t\�\0Q�)�y���b�r\�\�L�Y:$�<O1��@��d\�mH)y�ŗٹw�\\��\�\�\��?\�U5\��\�3/~ᙛ�>\��y�\�k�+�\�C\�\��\�-w\rw�oj�lh,\�54\�0\nJ8�u:�\�cyrv{�)�\�w�\�1�$\rr���\�) �\��bz\�\�\�\��\�:��p\�	�\��q�m��\���{n�baVZ� \��o\��::�ý24:��?\�?2\�H\"�7\�\�pe\�=\'|\�{�\��\�=\�\�^�σ���CS\�水�S\�ѿ}�\\]ϫ�Xec熵ߘ\�\�\��\�\���ms,fb�)���cM/\���\�\\W��ð�s\��8Yj4d	06��f�P8�$�ִE��\�EP���\��S��7�	x��\�~]s���\�W�\�\�\�f4�\�غ��\�t�����Kw�y߭��)��t\��AS\�\��n\�l8\����\�\�_?mOGgˆ�\�3�m6�HaZ\�S��x�A�\�j{��\�_��P�Z\�\�Z_�%���)sW?\�\�I@�\�+\�A\�QY�:֟�\\hl�\n��\�ܠ@+X�i\��Q\�\�,޵��=\�\�\��\�+�oI\������j}\�	\�>�\�dy�\�\�f�� \���\0��2���?UXK�&:L&9X{ϊ\�hX�s���\��j\�d*�cΩ{jZQ\��\�EAKg2���\�H)��挟��H�\�\��{��pe�Cj �?�\�W\�\�iMm���\�/\��PѵH\�9 �����u\�mgh|�T6CVˡi:��\�iJ-a��L����\�\�I�2�\'S$SYLimQ.Il�P�ݝ�\�\�\�H\"`������\�=�ذe+\�\r-\�{\��\�A\��[\'�\�։�=v\�p&.�aކ���V5\�|`p��O\���?�\�@ \���Vz}���֒���4Ip�\���{x海0LIs}\�ꪙVWMSm\r\��D\"��vw��\�ض��-;w346βysx\�\�k�\�\��Po�J7�V;,\�\�\�\�b+RBA׸\�O�����\�i�X|�%\�37_�_\0W.*?\���T*B�g��h屣]{��\�\��?�\���O�:(R��C�S�?M�F��m\'\�m\�\�H2I{�0\�\�\�M$\�\Za<}\�0£\Z�*�\n[Z�\�Pô\�J��\�9\�\�(�����!7���\"1D�lR�7\�\��%W~�D��\�\�/\���s\�\\؇�\�iЇ��yK\�%��\�\��ϛn��:����\�3q�A�\�[�<����K\�L�e\�Τ��\n\�4\�\�rhZ��V�0%��\�\� Y�\�n\��y}�^�\�G0&TEU��K^\'�c�J\�p\�0��(���9v��\�\��\�{1#5��\�\�9\�]�?\��+���A\0\�|��\�\������=���Op\�\r\�Z?�*앛l91�p~hv\nMҞRNY.�u\�\�� \�zV\Z�ȒIPg��\�\\Q6OE\�@*T\�Z\�-\�e���d�\�����?A\r��.��ǽ�\�_L:��\���v��g2\\YۮeSn߹\�\�Q=,_��W���v\�qvV\����\�^�\�i\Zi��4B]BQdlp\�`bcDq\�$�b\�&�1^�O\�ٔ]\'��1��Nc��\� @\r$�\�\�\�H�>wn/\��=�\��\�2\�H�\��|F�\�\�=\���s\�s\�M�w^�˹@͸�	���J\�x\��3\�@Y\"������7\�J_�	\�}��|�%��s\�\��#Ǹ�/&�H�f\��\��מ��Eǡ� �[�\�g\�J�\r_�{\�W0\�g\�\�v���6���(\�\�.�\�i�ľ��\�_��\���U*�\�e��L�H�3$Rr�n���:\�:����d�T�F\n\�]�p=R\�lF\�w���������\�)W�M������\�Х\��C\�\r�Cx\�+�~\�\�=[ml�\�o~�\���\�04���Ȥ w��H�U]^���\�ɶ��)�\�<��\�w\�aÞ��\�b<Y�Β�峦�/ވ�nsu_\0\0\�IDAT\�p\0\�p]�\�HEҪ�,��\��M��N\�c<\�4�����ß>�\��l����z����¥|x�H%\�ئ\�r\�o��b>[\�\�|݆ͮ\�x�E\�\��z@�n�ۋ,�\�h�2\�Kv<\0BT;\�\�d��Q��Wu\�d�\�xu�\�\�8>C\'�N�\�ν4���b�$�ppr;\�(��T�\�߸\�n�5��#�2\�,�\�\��ؓ?Dh\�\�\���֕��\�{�_�\�\��\�#\�\�������{\�\��\�\�F>�ޮ�Ձ�aν��:[E�i�(��r\�Z�t	\�7UM\�cY\�lk�\�\��ջ;Ș>�d��}\�c\�\�\"[4�p�G���\�sAp�{jk8A\0(H���\�6��d���\�O�Ŀ���\�RS�\\�ȴ�W��\�\\l��?D��\0�n|%��G�z�\�{\�M���}�ܛ�\�m\�ML�Ҏ�i6H�4\�\�o#-G�\�+��Op\�\�}�z�\�Q0�T�����3�\�\'{\�r\�(W͛͌\�\�uv\�\�\�B��\"��Wfj�&�!g9\�VyC#����<��gɘ�\�\�ū�\�_\��Ħg�\�o���h収�}\�,=�\�o&Gn\�T��\�u\'w\��yf͘�\�\�H�X�mS6��*�[W\�~(�d)r\�f\�\�*��%�s\�\�2G���纶�ɞN��#�!tW5����a3�\�?�a\�{\�\�@\�\�+�\��\�\��l��?2��IP-�\�5��ӷm\�ģV!�[�e�{\�ƭ\�	�tw9��TQ�&˂R\�1\�\n\�NoJ�P�׃7\�\��B�\�A��a���|{e�\�9Q:�f[��]v�\�\�\����\�\���_�\�7�k�<�;X�e΢\�g_��u\�6����:��\"Ae�y\�\�(]+��b\�S�1��*���h\�\\�\�\�/s\�\�Wv\�ɤe!�\�$EgMKֈυ¡�}Ay�jۛ\�\n:x\��b\�\�	��\��(��\�\���	v\�?�\��T�u\�n�/��O=���O\��	~\���\n\�\r�cd\�O�\�X\�>��\�btt�\�\�\�~\�zn�\�\�ẏ\��ym@�\�e �tNyw��!	�M�\�P��v>�.�=�tN\��i�\�+o�\�^\���H�\�(�N��\�e�w׫o�\�_~\��\��\�\0��\�7�\�SG�����O\�\�\�/d\�^\�\��\�\�\�-�\�]�q\�n7;w\�\�ԉ�\�)~�\�]\�\�w�W�\\NcC=�3.�I{_(\�\0T�Qrb\�\�\�\rv �\�n�}p�b\�P\��&\�X��;\�\�{�-\�w�L�+�pg2Y:W\\�S}\��\�ﾾ\��S�ȵ]�,\�8mf\�\'�}\�#�\�\�#\�Χ\�\�\���ٳm�\�}SG{��\�\�;�TM_���,͌�\Z�U\�0�\���\�\�aFFGțy6��|\�\�vX�`kn�]��b9\�-�\r}�`�uA\�\�t\����Ub`h����\�歬\��.�\�\'�C!:;;Y�t��gy\�\�7*�\n!p�\Z����\�e{��g�j�3\��n���d\�\�ˏ�\�}7]4\�R\�\�莧\�\'6��[�\�z\����O\�^��jS�f�\�̤&�)\�:�[o��b\�\�T\�I̼I�T\�\�\�^\�:\�\�0�\�\�ʵW�\��[nf\�\�Ev`\nԸ\��$\�L��7oe\�\�\�س�\'{���WR���2k\�\�\�:�Ϙ\��\� /���L&�\�\�&��O:�%U7,\�\�O���\�\�\�\�M��c;��X�//�ϯ��[�K�\�\�\�{^{뻏\�\�<�/���\'��0��\\.\\.7��\�EsK�P���1v\�x�ի�e\�W0�188�eY����\�\�\�̟?�\��\�\�\�V�\�\�93b�N�l\��-^@{[+\�;\�	C[P\�GL$��\�\�ɓ��q\�Xu5S��E�X�|9?���9k63��B\�\�֎\�e��_<G*�\�ӟ��Ʀ&��Gatt��\��\\�L&K.���1��\�\��\�.\�cBQ^=�gK�\�\�]�>�zж�>q�x��?33�9RJtà����pu����~|^?�`йVZE �կ�G\�u\"�RB.��$-\�hT��\�_�:}}}��k�\r\����\�y��w�d\�\��\�\�s\�{a/��^fNg\��S\0L�6�����\��\�\�\�M�Sԇ�P_W\�\�� �x��)ttL��þ]\�4\�c�\��8\�T�X,F,\�\�ٳ\�\�1��\�]���?V]\�_^w\�]��7/9�\��̚\�=�o�\�\�x�,�uuu\�_����.�~?����\�)\�*Q(\�f���#\n\�RS,V���1tww�\�c�q�\�w��֝\�\�I�r\�g��Vs���\��$�9z�F)�Mt\rj�V�\�l\�\���:FI�ݰ\rEQ�:u*O=��\�\�X�v-\0��\"�\�\\˲�:u\Z��\�epp������\n!0ð\�E�\�m�/�\�1\�?�\�ݻ\�Wr\�\�\�\��\���\�TT�ս/���Kh\�՟r\��{�~��?Q�\�܅�Y�b%���=Ӌ=cY�i�\�\�\�\��\��9�<��R)��f�(�!@\�u\'*HpŪU<�\�\�s\�=lܱ��~\�\�|a�J>�l_<��P^T��\'���%\�\�O�L�đ�<�q;k�\�\"�\�s\�7�\�#��d\������(\n�\�r<C{�x�P`\�i\0�>\�ǉS\'14�ۍ\��s�n��*����`�]3طw;w�Gld`q\�΍\�t���M��|\0}\�L�d\��\�ֻw\�å|^_��\nV������_�\�T��\�\�ƣ\�	��$y\�\�gll�\�\�n:;g�\�\��V�-R\�\��##\�|\�k_\�\��\�\�\�ʕ�V100���\�\�\�1v;Z\�\�5�\��(KP͒KJ,��\�\��?^�����\��x�\�W�·��mfϞ��T*\�\�?\�Xt��)S�z�vN��\��\���8p`?\�d��)�P�J\��yҙ�t�d2E\"�Ĳ,!\��F\�]|�����8q�8�D̗:3\���#﬽\�\�\�E��\�q��\�/\�?�\�\'�J�K�.e�\�k+fY�t6Ù�g#�\�S,�*��B�\�\�\�^L3\�\�+V\n���\�dlwYؑ�\�cc���s\�-�\�\�ֆ�\"\�\�|�_��kg��9p\�/o\�\�\�\�oaω>0�5��\�A��\�\�<�\�k<��~\�S��é�Q\�\"�Y����~�[׬!\�2p�\�I~���\�\�i\�\�\�\�\�\�\�\��14\�\�\�\�\r����w�\�\�5\�4I�R����\�eA��ih�J8����ӧ�Ȧ�3��\�k���[\�\�?��!�Uqo���;6x�.i\�ζ�6�-[�\��\�C\�C�E\�e�-kF!��I:�\�\�r\�\�܌���:TԔ�sW\�\�\�Ȅ:H)Y�f\rW]u�6m\�\�cݺu�۽�c���^��\�k\�-\�\�|J$o\�?̿�߂Y��;w.�\�~;\�\\s\r˖-è\�\�\�\�\�\�\�lM\�\�\�+�v(\�����v<\��x�\�\�\�e�\�C:\�\�\ZS\��T�@�OS$�\�p1uZ\'�,b��-�\��\��\�o|�\�\"\�E\���\�\�6Ӊ[5Ua\�\��\�<�D\"��\�\0%g�V\�P�:	\�L�d2I��9躎eY���*���N�81a�S6ĝ��L�:�믿���!�\�ü��K�{���>����-�DY�8�P��~���g\�\�\�e_B%\�)�����$	�>.èVOB�4)��4E\"x�^�ccH˲g!j��5\�YV\�6#\')�JLim\�0�/_\�\�C�Ţ\�֙s���ñ����\��c\�.\ZY*�\�ё\�P(Ĭ��Y�`߃32:Zǡ\�-(N����!���c\ZB@\��\�\�\�	]G����y�@�oۉ\��\�#�p\�\�?O(\���}��d\ZU\�P5E\�ټ�\0�\�\�Ǭ\�9��9\�C=ľ}�&�#�����\�(�|�ˍ��Ժ��R	˲���\�a��<\�t��:ڙM�LB&�!�J�\�ü�\0\�;��3�X��\�Uc\�\��\'.НϼEf|�~�\�\�\�+��K)�\�b/�\���\�w\��&����*---� �\�T~�m��k\�N�y\\.�\�>��g�\�w�æ\�\�≴\�=\'N�㵯�u\��\�\�\�����\�O~N\�,�d\�U�߲�^x�|�cǎM\0�L\�{NM\�\�\�.۞\�\�B�b��\�\�\'\\WG�X$�>�3%\�ջB\�\�T*iG\�Jɴi\�QU�b>\�>�\�K�S�(�8\� ���\�\�:CgEa\�\�َr���I<�t��J�|�\nhf.O,����@ `��\�䜧\�:��s\���J>e*��\�Z|�A��7޲�۶��ǉ�R<�\�;\'37���\���455\�\�\�Λo�\����\�}�y�\�8u�$�Iz{{Q�@\�q�\�k�HeU\�hii\�\�#\�\�q��[\�<�aSK\�tY*\"�P(HkkgΞq\��\�5\�L�=�\�\�]���n�\�\r�۾I&��4\�u:\�ڕ+Y+�!����	\�0(\n��i��-RM\�*v\�a�R�i\�&�ַC\�u\�~�e��\�e�v>�F�̄�)\�_=�.��xn�(\0�6m\�\��\'�����\��\\�\�\�Q\�YqW\�\�.��l\���|D�[\�4�T*I�T@W��J:�\\�\\.�\�\�\�\�v�D8s\�4�\\\�{\�c\�{����.�3w^.�e�\�a\�>\0H�%X�����\nIp�i!��ޚ\"tݰU(\�\�VM#��h�=\�\�f������,�\'Nr\��r���Y(\�;ut�\�aƕ0k5�\�5)!��	B`�\����\�k��\�/�\�|\�;,X0�=\�\�\�C�\�\�;ۦ�d*I]]M�\� �L�\�\�\�u�\�\�=�ʿ[8@{�h�F]]��\��g�\�y�8/\Z��\0��\�\0��\0�aMXRڣ}�X�2\�PY<�`�$	\�n\r\r\rH)\�\�rΔ�\�\�T�4ME\�t2���Ctu\�d߾}\���9z�\�G&��\��5\��5б|\rv����AHڟٸ�y!S� ���\�\�\�~�y\�_�\�9\�)s\�\�1tc�\�\\�L&�eYx<n\Z\Z\�\�\�!�\�\��&�&PM�\\�\Z[\�\�u�pr\��E�K�ꑕ?A�4\��*�^8\�\�&�ΐ\�d�BD�\"Hiٕ+��G���h�F&�bhh���|�!6o~�%+�\�s_���_��\�^\�4\�\�\�CɄ�mpt=���tJ�s\�Ӗ�HK+_��/1cV7��\��ٸq_�\��w��D�Qb�\r\r���TQڎD&��\��3eJ�N�$�L\�i�Tj�*9�+\�\�b\�1\�q�\�4�b�l>~�zcb\r} @64v!����T�B�C\��$�N�\�e�s\�e�\\.��\�\�[B\�\��\�q��g\�~�\���\�1\�R\�}\�Ba.[��O~\�wy\�\�_���K�����x$\�Sڟ\�]H6N�o3M�f>y\�g�\�wnD\n�\����8/��KN�\�\�ꫯ\�E:{E��\r\�\�UL�R��::��(\ncc#tvu\�M(;H5M�}\�Nd{��%\�!T���e�\���X\\@�\����]\�L��\����$��cYmm퀽w\�tΚ�\�L}��\�\�&�\���\�?I<c\��\�y\�}��\0N(\n�\�\�gڌ�����9M]0\�:h\�P^� �$bE�\�;~�\�H3�\�\�JG54E���{H\�b\�ڱ�\'O\0\���	*w\\�+�\�,��\�n�Ba\�8�R\�7QMw.B�G\��T*�(�\�����\��_*�v\�͊tvgWz^P���$��2�e122���ttL\�t�*�5�&pvu#p�\�H)�kv7_}��in\�6�g\�\�\rx}>�\�\�p�\Z`�M��fplՖK@j\n9$�`v�%˯�d�\�fҤ�Ig\�\�M}c�<�0?��3�{�E\0��@�-\�z2�Y�g\�\�n7---9r�x<N}}}E\ZD��j^�|����\�\�4)@�z\�\�,8ߙQk�f.\��85)\��)Z[\�q�\��L�\�~\�\�7e�@ @ؓ�B\Z�\"\����hni\��Jfϝ�?dtx�\�\�L��\�Aѡ�\0�|FOAb��\�\��m^\�e|t�\��\�qJE�\�y�\�?�!\���vm\�\�\�\�0�\�e�\r\���eJ%�\�>o\r\r\r\0\�\�ǩ���\n���\����w�.M\�Ҝ=�\�A�\r�p�Qa�\�x)%S:���\nf!���\�N\��5�Q�En�!\�mmL�9�\�m��\rM\�76U@m\�Ͱ��Ӕ�\n����+ɪ���#��1y	76\�v���|x�>@\�v{(�&�a���\r�S�rg\��x&�A\�u��\�A<��Y˪��$Hd\��� q���\0���]�}w7ԚF!axhM\�hkkGA.��d�&�~u��Z7�˅�(dR)\�BVw\�\�\�{3�fz�C\�\�a2�b��\��G�\��tR9;[{{˙�L3�\�\�C׍	\�?�3�\�d)K46F��|d��^�w�R\�\�\�\�B?M:�\��\�pM\�CU�j�\�FLb:��Pع<\���K�\�\�G)\�{\�m�\�\���\�0M�y��N\'K\r!?K]���\�i�Hs\�ͥ����\�:\�~��\"��\�\�\�`|̞�\�uE�\\s\�p���eYd�\�\�0>��\\6K6��ߛL\n\�6�\"��ªsO>-:�IKSUM)aO��%GsV\�4e��\r|�n�D3�����p��R�dO�\�J����T\��x\�\�\�D��U����j*mS:�qD\\A�B\�<\�XD2\����f\��\0(�Jdryb\���ټI&�g��,�b	�\�\�WV.R�ױ\�0\�	B\�z:�L\�t_\�T���\�*����ϣj檠\�\�\�Ic�\'H\�,\��\��\�ؠ�����U!)I$\�\nE\Z\Z1\�*\�v�QRI��Y�~\�%l�BJ\\n`��V(kʭ\�Dtd��\�Y+�s�=rA\�[�\�vY��\�\n\�\��Lo�P,��&S�\"�BJ�\�U��e�mZ\���f����}�\��\�h�ځ\�t�,��2\�y U䊒��\�1��\�>[*o�Ž\"�\���b���X(�J$PA[\��(\n��\r�%\�bQ��G	��SU��|\0Dǆ+���-��#9�\�5�\�\�B��\�\�\�\�*\�\�\�\\�4M�!觐I!�\�L`��\��I6M���t]�\�+Jh�j�f��<���+��M�\�$\�\�\�	[\�m�(\n\�q��|~G\�l�\"��b�D\�9^\�\\n\�\�r,���^\�dYIo�oh:٢$:�z���\�8�\�c\�\�(\�Q>�	�,Uʩ-�܎��a\��\�g\�yj�b&\�K\�Q\�4\"M|>?f!OCC����ϣhj�\�\�]UY;7\�s�\0~\n �f.�\�J�\�!��R,Y�\�[�X��\�\�3lIR\�H�lv��mpyl\�ddp�\�c��>|n7uA���)\n�\�&�\�|�o��|J&[�s9CS���Z�ݵkV\�\\���q\�߻���AU\�p��\�\�c\�O\�uZ\"\�L3\�Ν;G(�b�h�A�-�@\�\�<\�aջ5\��$\�>@\�\�NW:ّ&�\�\��+9~\�(gϜ\�\���\�+V�x��~?�a\�\�>��\�}\�\�TB�M\�\�r�Fi��x\��\�rvå�\��ҷa�{v{\�\�\�}=�\�\�\�xȃ��)Yf�@\�,K��1�HR�,�\��GS\�JL�\�0&t`YN혊�j�q\�N��Y�p1�`Q~\���%U\�\�q�gox\�\�\�\r�	[[.	�27�\�\�Au��B��\\t_6�@ \�\�\�ؾm\�C\�\\�jmm\�\�AKs3\�s��{U�0tF��&R\�?\�\�\�6^\��̥d2Y��;0\�\Zh�\�\���\���\�\��g\�\�$\ZH\�r��y�9�b셔�RI���EU\'�!�@�Hc���Gؼycc����2�{~�����K \���)ו7�↵\'?��+XY��@����\Z�\���sUTY���(�J[\�\�\�9�?==\'fժ+�5�2�>?��f\�P�9�Y\0BQ\�u�|>\�\�� f���\"u!�5G�\�{Uƥ�\�\�w�\����=G\�F�律�s�\�\'0\�,*\�S\�sRR\�\�t�Ʀ�jϖm����BD��)��\�z�\�\�s\�S1\\�s�W5�s͋�\���p̅=&\�\�Ż�s��\�o,�-�X\�ъp	\0e3�\�\"�aT��% \�JVo����\�\�g\�\�\�\�\����7\�x�\�\�^��\�j\�\�\�i.\Z�g����i�\\.r�\�c�445�͙�\�78B}0H\�\�\�dJ!\�j\�;���=\�\��\��\�d8\Z��\"\�L��,���g�R\��;�\�\���)*\r\r\r\�\�\�144Ėw7s\�\�I���\�t\�if�_t�����P��K\"�U\�[E�\�~ j\�n�h�v��~`;\\@�b)-����\�\�q\�Ȋ��V%K\�5:g\� r\�\�!:H,gժ+\�\�\�\�4M�\�(�tB��@\�T��E,:f?��sKJ\�\�qF\�	��\�\�-��\�\\���\�^��\�\�\�9RJ\�\�\�v\�n\�jk�\�E�����?��\�\�ٰ~=�\�8m\�\�\�蚅/\�:e$j\�FN,R8��\�R�r0�\�\�G��H,�e��_x�7\��\�i\�\��9\�`r4\�y\0\0\0\0IEND�B`�','image/png','alain.png','Salvador','','',2,0),(13,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0�\0\0\0\�>a\�\0\0 \0IDATx^Խw�$Wy\��=Uչ���\'�\�9g\�*\'�D�0\n��m,�\r0�\�\�\\.\�\�c�1&	$��( ��vW�\�l�\�ى\�=���\�T\�\�\�ՆY��ﳽ\�]]u\��y\�y�\��G�ݗ����{~|�^,$��\�\�r�0?	�|\�r������h\��!����ٶ/�DqB�^{\'�@�T\�\���~\�\�\�Lss3��aY\�\�\�l|m\�Xl_C\"y\�S�=�y\�\��\�;\�\\�ϟ�\�\���\��\�\���\�\���ڈ��x�\":::ǝ\�\r\�\�j2q*�Nt\�DR�@ ��ih�F0�\�۶\r�eY�\�Ǩv��\�HGgO������\�[߶��\��0�\�,�\���d2�rB�+L�8U�\�����\�\�[��(��Z��w\�^:`\�\�#�V��e\�Y[����p�$C}�\�W\\��u\�\��\r��`\��JKK+B�\r@�\��	�^Ƿ7m{mN\�W\�m\����(��\�E9)�\�Piii!ѐ�\�h\�\�\�޷粙�\�\�>wp\�ㄋ&\�.��\�Ks\�\�Ol�:{Ų���\"\�\� Щp>ڗR\"�D\�ur�\�L��\�(���FQ\�?�t\�/� �\�\�\�B�X�\�?�ִ���擟ٜjk\�\�ؼ��\�\�`\�\�\�7)\�V��G�T�\�Y{�Z��M�@r�w�&�,�Ķ\�q\Z���M�I�\��E����\�\�RJ,\��ߗJ%���:\���aP�T\�\nd�Y���$�ɐ/\�u\�2�7\�I$\ZL\�׉P\�\�:t����9\�\�\�\�hڎ\�\�\nR=ػY\"ٴi�\�\�\�k\�l0�N\�/�}�/��\�]�\�d���ɮ�N��E �BL�6ͱ��\��\�\��D�QTU�X,�\�:����B�q�XJ\�\�\�C#\���B����\�b�ڇ\Za�\�,�J�\�\�fr�###L�6\r\0]\�I�Ә�IŬR�V}\�\�ijrA$F���\� <H)��$�\�\�\�wU\�\�\�\�\�\�_����\�K��M��O\�t\�y�&Uئ\�qhߞo��9Ֆ\�`�\\\�%�٬\�\�\�NS�	����J�L&C0���T*144���2��������e1::J\�0|#-\�4�\�\����a\�\�R��cd�Y\"��|�\�\�Ql\�&�J\�\�\�O>��b��5�x�O)�J\��y\�J\��N�	B� ��-h� ccYŶ�ج9��E`\�\�\��\�\�I/�L*\�ز�024��L:�>��\�\�޵s �\�^;{\�\�Ȍ\�3|�8\�X��\�\�c���E�Ȍe\�d3���%\�\�\�r躎eYX�\�\�\����N\�:\Z�\n�\0\�I\�\n��0<<�Q1@T\�*\�R)	mhh`dt�|�PklB\�\�\�\�RJ�j��aP*�\�\�\�0�U�@��8�\r�R�#G�\�T�m��G�gF�/\���\�6m\�y\�E��Ie�z\�ݷvt�\�����ڗ,ZB \0N>߷�M�X�\\.S,|\�\�\�\�uL\�\�t\�5�a��EJ��i:��M{����D\"�a0�I�\�R��pzhKI.���w2\�\'�J�t���J�B�H8\"�?U$�L&\�\�];\�\�\�\�\�\�K��\\���K�\�W�۸kۖ�\�=I8/�\�\�>�\��ާ¡P\�ꕫ	�C�/��T!A/�)W*\�H\��\�X\�0|���P\�K\�0�7\�u�A\0�iR\�u���(W*�5��T*�w���@L�\"�\�	�����R\�4440�\�bU�ϙ��gڌߙ\�\�@ �׶-\�\�1�N �\����\�>�/Zf5�|\�2\�\�\'�\�H�\�\�bѱ���P_5Z\�vD:d\�v\�\�r�͗\�\�\�x%���m�\\!?\�9g�\�o)���{\�\�H��% h�FKs3�TjB\'��ΎN���7�F��\�ccO�\�?}���/Ynr�0�\Z\�C��3\�g�\����u�\�%j<�Z5��q\�P0�\n###�J%��2\�R�\\>O�P�R�\�<<\�ڗ Q���0�\n\�4ʸ�\�>�\�U���%R\n�Cj\��ҽ�@httt\�\�\�p�i\��\���j�B!2\�Qr�\�\�_\�\�÷?��o=/3�Ie\0U��\r�����\�f\�;|��G�\�\�\�@�!ᜣj\��yG���TI)}��	\�}W�\�w�)|\�@�I�\�O\�\�?���\'�\�4��aP,)����\�\�e\�a�@����8p�-[���ds\�c�P\�UUնoz\�\�\"\��j�̜�1\�\�z�@\"m{�@�\�O*�\�\�\�\�i\�ܼR�8�\�#��_���B(��^��m�v^\�H�8r&\0\�\�z�|A\�8&�����F���W.��%\�3\�7�{�!,ۦb8�)�3!� \Z�\���f@�(\nmmm\�ݻ�TK[\�\�K��ė���=O=�\�	}�,��!�\�\�7�Y��?�`�j\�\�;\0��`\�\�r���>,)O`\0	��Sy\�[\�H<a�\�=\�ڵ��\�C\��i\�1�\�\�u&@U�)�����\�\�\\06�/\"�h�R���\�>^ڴ˲|F\�\�\"\�T����`0X\�:w\�\�?\�\�͛\�>\�+7�\��?��w��n>:��T\rP���\���$\�d\�=�`e���j\��q�T�\�%x\�MoeJg;��S\�-�\�p&\���������\��bg\"u�@8D\�inb\�\�)t7��\�\�LG��\�XU`i�Ph�Dyύ\�cY6�lڊ�\�6�UU%3\�d~C� �D\��\�\�\�̝;���v|\�o}m��\�l�\�͗�8/\���2j\��\�\�7��\�o\�[�tY���\�0��I�Q�W��Ɲ�MeŢ�\���w�D}c \�Ȏ\0˒ضĒ�\�<\�b��#dr�ɗt*UӲ��Ĵ,�%۪��綅�� \'�RU�� �`����$�v\�\�\�L2\Z\"��(BE�R�(\�\�Z\�o?=6\�7\��9\�\�p\�\�8\�(R`H\�\�\�\��@�R�u�6zԛ��?�ʳ\����I\�\0?�\�s����\�\�\��[[[G���\�4�H4B��$5\'@(��sf�\�x�hėi)A\�%\���E\�\�[�-@+fO\�y�\n��A\�0�,�bY\�Ͼ\�\�Q\ne\�z\�\�\�n�t-����\�H�\�dM�(M��\�u\�\��3mE:o�^�x\��͂�\�$~�\r�f9t�X\�pm�\�1^\���0c�<N����\�	\'M&�\��wwM�C�^ Ƕ-�\0�P1��O|�����\�|=��\�\�%\�BZ\�4�^_IG�J!�\r�h�B2�1\Z�\�&�\�}\��Y���\�\�$	._2�e3{������w\�l!��\��X�\�n\�|.�F���0���w��\Z�s\�/Ɍ\�N�]��\�\nH)\�\�\�C\�4\�4�\�\�\�&R�H!\�\�\��M\�N�\n�� TOj�>���=���\�T+��==S�\�)�\�S.�)�N\�wݱk�\���w��9Ӧ�Z\0�:Ҳ\�Ε<܀���U�Ɵ8\n\�g��pj]�3;\�\�H%PP�\�v��¡�t.�H-�DJ!�#���}`�HC�P\�\�P.Z���\�Q~�\�G�n�\�o?�\�R,9p��H,�����\���ÿ��<\0!\"���\�\�d�\�f�.T�pŲOz\��g�N \��{���UhY��*U\'[WO䀦q\�\��t\�\�\�qWc �j\�q��=�\n\���9��\��\�n�PAM\�\�Es\�jnr�\�Ij���4K�!�@z\�\��\Z\�]fn\�%��\�\�CQ\�]~ӧv՚�\�D&@PT�J��G\Z\ZN	B\�\ra���\�\0�j!J�%�Ecb&\�\��\�vuw�8?TJ4M#\Z������6k�,\�\�7^A0��\�Ȅ\"\�W����\�s�\�k\�N\�\�\�\�\Z�H\�^;Q7gJ\�8�e�����\�\��b+q\�GN\�\�\�\�6t�i\�\�\�A<ᶛo��!�^Ы4.�\n�\�\�\�\"�\�p\���c>ǡjY��abA���g�\0\0!U�(y\�>�|\�ܲ��M�MEa\�\�=�\�iE!����Ձ4-�\�oy�x�Z�M ����*\�ԩW�J��z�\�K:��{\��y9.�\����ݶ��¹\��\Z�k�p\�{\�w�6�H�\��%~W�\�Ӧ�r\���(����,}G��͍aۖ�]w\�r��\�lzdq]3TM;\�A\�\�ψ\0bAŎS\�UӎK)��|\�o(sGFGY�\�+8x\�W�\�ht\\\ZT\n�\0W_t���\��P7hn&�-$\��N��m!\�ts\�\0���d\�R\�ш\\\�d,mi;A#\�]� �!��)��̏\r�b\�Ҫ�T�)1	8c�\r(��\nÒ2���~޹u\�\�\Z��:._I0#\Z	\�\�؈�ҏy{H�\Z\\}\�~���RB�\���z�QFJ\�X՝*X�hӺ:��\��\�m\�6�\��\n�`0H{G;�\�Y���\n� �hP\��3w�&\�Y3\0�°����s��\����\�~�[\��A��[hJ����\�\�\�\�%0o\�4�;Z�\�(	H\�D�������\�%�?V�Z\�\�\�@(d\��\�\'��\���6M\��p4��\����`\�B\��\�qN\0TTs�\�م�{çW�X1\�\�;�\�\�\���m�6�G\"�j�|\Z�Q<\�\�~\�F��#\�Ia��B\��\"��\�\��*\�\�a.^����\�D�\�\�```���7bq\�\��\�MU\�\�\�;Ι\0\�!\�nkYu�?����\�~U@2\�8��ά��H4\�\��s�s�8�FHJ0\r\0�g�\�\�K���ew\�y���3É��3I\�ç�d�\����3�/�춗�{��L\nx�\�\�wh\��g�m(�3��V��>\0-)\�[R�g\�}\��\�t\�x5�\�\r���r!-i\���\��$�CA\�N\��g$�\�Hj1	)�\�*Ҷ_y\�\�\��\�	�\�\0��֩C\�\�\�\���i\�\��d\�9(J]\�<\�5�4�P�TS�_��\��,]\'QQ�vw�&���!a�P��Pز\�ӎ؞)&�Jż���.n>���g\0��TKMJ��j�͉�\���1Q1|?�fٝWGk\�\�ĸ(��iuA�aT(�����\��&\r�\�\0�`p�{\��-CC�H\��e�Ph\\�5�\�\�\�\n\�|\0d�&\�K�\�\�\�-��	�	�\n��\�-�F\Z\�\�q<n��;�QxLs~�`RG�\�\�\�P0�\�O�GF��U\���i\�gN\\\�bm�\�\�qI��1\0\n��RBm>\�x��\�}\�7�\�e�����\�y�陒��K�\�FJV7�����,�&���\�6��Lݢ���B.��UQH&hn��b�\�\��\�B���\�$\��7��9������ǼS\�/\��9\r�-�bٽ\�x\�\��J�a�\��\�9߱�Nd�\\,`W*ƝD\�\�\�̘\��y���FH�Z��\�3,r�qXv��KK�5�h\�Aݔ6H;�)g=_�j\�};v\�m�\��4\�Y\�eV\�\�s\�0\�m\�\�.Y7�b	R/�ݫ\�\���K\�!}&n�P\n�.\�8/S{RH|MS5M\�ǎ\�\�\�N$�\�$�\�\��z\�-@7�q�\�\0�b��L�l�\�\�X�k���P,Fw{z�¼9�\Z!3��^\�K �l��\0US�V���}�\rtSj����f\�h���\��O��b覭��l\�0R\�6���\�\�N�Y�����-�:F\�]�S�\�Ԏ��Ģ\�\Z�\�이�\�jl\�\�\�yI�\���\�L\�W\�lRG\���:��Į\ZT+�c�hS�A(H\�$�\�1�p�\\Œο\��\0/�����aF�cT*�b\�M\�˕�5}:���mK��\�����a*��C�\����8��JM\�쮞i���8a�\'B\�t\nm,D�.�N��Hd;\�I���2�D)��)vX���\�M�\�\�-ZRͦ��o��ǭ\�X�t�\\�^۱è2<:\�\�\�O�\�I,Ӥ�-EG��iݝ�55\�\�\��6¡ ��t	\�ϛ�Uo\r5Mp\��ͫV-�\�;@5�����ѣGi�2USpR�N}ᱡQ�>\�\�ϼ�ݏ��ѱ\�\��p�\��/�k�\�\'�?Ȕ�Nz&_,�i\n�Y3]�m366F<�����4C\�ةw�\�-�A�ll)%\�rZɢ�\�/Ú0tS*H4!��DS\�i5:g�\�޾\�\�v�XT�\�楒	\�zեx{�/�9\�\�s/�\'����;���\�3�tq\�\�U��\�+�?c*���p��N��\�l\���X�MO{\�	m�\'\�6B&W\�\�߾�k�\�\�-��8�#&\�َ�6\�l�M�����[ya\�V�\�\�%=V+nu01\�\r���i\�\Z\Z\� a��׸�\��-�G�z~��*�E3�R	�4m\�\�\Z<��\�T\�\�\nh\�� :e���z�b٦%�f\�vJJr(��\����u�_��};��M>�{\�$N�ϛ����=�-\���\�\�1X0o6������cd,\�\�X�M���\�e��Y�\�\�K�r\�r�\r\rģaB� ����\�\��cr�?�ҧ&4\�!�	t�\�޾~�Y2�\�ãT�U\��`�\�����\���\nŲ\�P��$\�\\03:Z\�Z����5c�\�kxe\�f�\�\�\�GSI\�{\�\r$\r<��\')�u�X�E6��P(`�F���\� ���&�5E��-\�*B\�B����\�iE�B�b�6,RjqM�+�4B�8!H�`\�\�͖�\�\\�����}0���K׬@\r86ihd�L.Gs��9SzK�\�Ly\���%\�B\�M&UM��\�����\�_\�@{*ɲy��?��YݝL\�jg\���t��\"%\�%r�\" �\��� \�\�\"Aմ\�d�\�ÿ�X��\�э\�/Ue��NM�\�\�\�S�?��%3��zE���%HL�N�g�̣�\0�b��Y>6ϭ\�H�^��Yr��\\��^)tuO�����2nK��(�b�s�i1@=��(馥(B�[�� H��M��2.}õ�\n��҆���ѱ1^ݺ�T��H8\�\�\�\�ϭ�X������]�\�Zs����#���춝\�=:@ղ�m\�`:\�o_\��o_\�@8 \�#\�\�@C,F@U\�{��\�\�\�Q\�\���\�\�\�)F�\�0Lѱr�\�K��BOK�u�\�r��Lkk�=\�H$\�3!><�\"���D�D�wuil ��ϒN�\�H&÷~zG��\�l�T.�˒jk7��͗tǱS\n	��q6<Θ\0j:��M+�\�/9��\�\�+�\�g\�_�\�����=-\��ܽ}��G��\\�\�w\�}��6m\�c\�}7�\�\�e���\0ؖE�\�ud��ן�\�\�\�A\n>��kyu\�A\�\�\�eˁ\��b0��X1ЫU\�Y\�\�LR\0\�	+_\�p�@\�\��\�(k\�F�\�T��T#M�����S��\�\�\�\r�o5m�r�\�!\�y\Z\'\�\�J��	DM#`p$�nT��\�%��Jՠ�W\�j\�\Z��[���_��ࡥC��\\�X���\�9#;*�\�#��\�EW\\���w���Rٵg\�\�\�\���{�\�\�V(��\��O,\�FQ�}s�\�\�\Z�}Z�R\�}��=���gR�T\��4\��ݽ�߳��G\�\� 0�\�\�O%\�_`�߭]��o\��!*�<I7r\��y��\��Yk\�#x�oe\�lTP\�\�\�r��I��4�d�ܙ��\�\���{\�P:\��QU5\Z\r��\�\�߾��wU+�̡���(\Z�V��LZj�\�VL����\\���\��UM!\�\�\�\"�R�k\�W�\�����UE!	\�E��	n߭tw� H\�bt\�r�WL\�b�_G��J[c�Y�\�\\�`\�_��[���˖\�\�y�I\�\�̛\�Ews;%\Z\�\�Z���U�\�v ��ljB�-LËY�v�q�\�]+���P\�x6g�iVt�C�\�ڻЂA�%p��mܱ�L6W\�T�\n�B!дٶi47DÌ�s��o\�_\�\�x\�\�\'����x\�޻\�\'���\�O�\�\�|�\r[��\����\�S-�\�bq\Z�I$N�ی)]�57\�\�$`�j$J��}d�B�Lo� z��7\�@�R%S(�idG(\\�x.-�	�\�M� \�\�K/@���?��\'\�obł\�N\r��n_��CA��:\�=�U5\�{8�\�\�\�\�C<\�\��\�Tm�[OW�5&�\�ڌ��!�bOU��\�D\�{��T(�i�\�\�\��\'7^ό�=|�S�\�\���\�}�\�\�`pN�\��<����\�\�-��r���D�d\�\Z̙�-m�xa=�^\�DФpj\�D\�\"H�@8Jr\�,\n�!�\��w\�Ǧ�����\n(�iY\�\�*\�W\n�y\�r���\�F,��h\"Asg;Kf\�`Î�~?����O8	E�4u��>6�mz>�dˁC|�\�_rp`��\r %�p��\�N2㝗_\�]��X(H��\r5\����\��\�H)ƨ\Z�ѵWq\�;nd�\�\0�����\�W+c\�̴��\��\����s^6~N�\�c��\�\�;ۚY�x�;��\�T��O��\��#[�\�ì�h�\0BB*\�8W�zo\���\��y\'\�w\�e\�,\\��r\�@�du�}�e4Y���!Ȕ\�/l}�����㦷\��\"�h� ɎV�\0M�z��c�o�\�3�\r\�\�X�Mvpl\�ޣ|��_\�2e\Z׬ZG�TF\��G\�t*�9����[6m\������4�\�7\�\�\�6���������U�r�\�\��\�\�~�x<\�k�K׮&�kH��\�\��\Z�\���΍~�X[!�k�r\�J�?��# mnz\�hmnⲵ�\�}\�0z�B<8a̝\�W\�\�oݱ���\�Wظ{?�\�~;�\�z+,�o`���4O\�rߖl�U�_\�\�usS<�\��\�7�ƌ�W�\�+@H\�&\�g�l��\�\\�\r�71�3�klmA/\�\�\�\�_x��)\��\���GGW7;�ưm~�a\0�Xϱj\n���e�!^y\�E\�\�G��\�\�%|\�>#�\0\0 \0IDATv\�j\Z&��^�Pp�~H\�\�NRM���\��\�Ì\���\�\�b��%�\��K�>��-;�ueӣ��9\�\�ۿxL�\�nK��j\�b\�o\�\�\��o\�Ke��72s�T�J�L�!\���׀���`���(�׬᳟�,�p�D�\ZO\��}l���d4Ȳ\�F��\0\�\��6��,�\�}o�h5ݝ\�4����	j�cy\���6�\�xx�UUi\�\�\�?<\�ޑ,?�\�w�7o�\�ά\�O\�&[��\�hO�X\�\�H,��\�k�a\�\�\�|�刺Pf��3��\�41*U�\'\�岛\�@׫�\�7�\�=�\�\�\�Ӧ2g\�LV.[\�\�_c\�\�\�]鑡�\�k\0vm{-\�\�ٵ`<��f47�\�\�]��t}��4��a�\�\�ϗl�\�\�Ą����\�K��_e\�\�.�o\�\�\�E\��q���.Y8k\��p�\�.�\�\�\�f3wz+\�\�w�\�[�D\"$\�;�];\\ʴ4%il�q�\�`�П\�\�ڟ`(\�Ek\������\�B\n�d�T\�u69�]�\�\�\�߾q1\�\�Lc��nf�t2x���_��o��X�\�\�v\'\�қfJIE/јh�%�\�\�׶�\��\��\�w����v\�\�ǂ9�\0h\�\�z\�\�N��\�X\�R�rՊ\�Ò�R�P�lJ;�:\�\�_{�\�`!��\n����~���fq�\�yl\�=\�7�w\'}�{�*F�\�oz#c9RM�\�\�\\o��AQT�5˗2c\�T���QΏ�\'\�LF�\�[��Į�eKh�`\�\�f�\r��?(�V\n��\��ǢN.\�wʜ��@�W*\��<�����\�-`�-��2J\�q\�f�\'���\��\�\�\�u��p��v2�%�*Ҳ8�m3=f�>�A�{�Pc�	n,%�\"0�&ժIw{��\�w��Y��Usf25\�ȡ\�G�3k\0\�\�n\0>tbcʆ�5��e�vΰ��*\�ժ]��$�h��Z\�U$ � �RR\�ꦙ*a!�R��<nQ\��\��\\jkmNјh \�\�\�\�i�5��z�ռ\��\�\������\���t\�,��\�\�::\���T-�&\�ǰe�P aT��v�\�w�rȣc�@\�4�`n�\�\�6�Pݱ�y��\��P�޾~\�,v°\'��x8>JX����H�\n�mCpkH!��\�Q*%EQ12\�D�r�\�WL5\�\�~\�-{�\nY4g��8Ͽ�2Y<.?��Az�\�\��TEp劥Hi\�ڜ\"٘\�\�\�ݾ0V� ����%\�U[\�Ҷ�@\'b[J8�:��妨\nP[\�	ܓu���������i\���XR\�\�DB)\n\\�n\r�M)\��\��d)qhh��\����L�\�\�/o\�\�^�<G\��\'l;?�<vt7��tM�+\���P\�U�u\�Z.l	z��m\�\�F\�U�ۗ���\� � lW�\�ŲLl\�		)A�!������R�]]�D\�g��ݩ����|\�۱,�\��c\��D�~\�/Lg\�\�>��\�\��G�\�]\��iS��ڶ\�\�\�D8W-\�0�Ţ6nAD$���<N\�4�4[Q���T�l(\0Y m\��\�\���t�Tڒ\r4��h�6���hN\�\��\�+ģ1l)ٵ��ԚWJ�s	�DX&��J8\'��5�ǉ\�cD\�	\"�W-{�U\nw�R��T)f���).\�\"��jA±�D#�\�&�:\�i\�l\'\�\�N���h\"N8#	QTpv\r�|��\nijLP(ؼu;m--H$�L$\�\�1�\�\�R�8�p�ζfU\�\�{\�`\�ZCQ����t�w\�4��xH#��x9簦\�\��\�\0sfL#��\�j)	\�\ZͲj\�����-\�^ܰ[\�\'�\�����,\�g�\�\�QԑV�w	\�\n/�\�~\�\�\�%\�l�Zu-����~Ù�cW�>��\0,�6\�?׶@/\��N\r	\�\�� �Yɋ61����]\�%��n4�!eJW�\�\�׶,B\�AM�1tv�\�b��P,\�g\0L\�\�BUlˋ\�I2��`��=���G\�\�\�\�W7R�c\�\'�	$Ҷ�0\�\n~�w���ި��\�\�����F�|&�eKl�t��}��ǽN�\�\�\�/�\�]\����r\�Y#^�x��\rX�\�\�kW�}\�\�M\�D\�4�Ņ\�t۶�\�t���Zztd\�)=\r�5ܷg8\�\����+�imD�\��R�\�.\\K�b�u\�\�S�)p\�#JE(9[\�:;\�+So�\�I���S��6�\�4F�\�h.O�X\"�$\�?@�\� ��3~�p\�\�d�~���\�\��\��^8\�mYʻW���\��\�^$��x�<FFF�E\"46\�\�TG��;�\�.\�\ZH�\�پe\�)=\r��\�\0*�nL4�L8�@#\�t����\�\�2Y~�g	�̞1\r�\���fŲ	\�s�G@\�@����\�=mԴE�T\"�΀�F\�4	\�:١!`\�Z���j*5�a�\�.g!\�v��Y�e�z�Mgٽo?�fL���!Z@\���1\�\�&�n��\�F[K�H$\\+�=��*�J\�@\n\"p�]3��\�\�1-UӘ6�����ҫ�x\"���\�F�ypP`U-���:i]	#��$cnPBql�|:M=\�\�9\�\0)�\�]LbZP\�s|��l\�Lv,Ǣ�s\�loÖ��^avg=�m�BQ4\�r�D�jrj�uz8k�\�\ZF�J�c���s�\�X:ˬR\�\�\�\�4���\�\�E[k;v\�!{�j)�Ŝ�,\�ӮgA\r۲H�*\�Q���<�$��H,��CØ�\�r�gq\� $\�ݭ$Ttǩ=	6o\�I��\�\�\�F<��1I�T��N\�\�*�\Z\0M�j���`�&�\�\�iUi�\ng\�\03\�-���(�执�[ \�r�S\�j[6��AS2Ikk��\�FFF38\�7�o;Y\�#\�ź������(\�\��>=+U�]}�,�9\r��qN�U5=v\�t\��d��ݦZ�gǣ\\\�\�{\�\0��0c\�4E�!\�@Ŭ��)\�1O�0(*�\�#��a#BQJk.�\�\Z<C�5\�ؼ\�\�i3��y�zr/$Z@CQ��JŨ\�\�\�AKs�\�l�\�G��Ж�Q,\�m�t��\�\�UwCJ	��\n[��z\�L�@���$�m)-\�4�6�j*Uw=\��HXP\�M��\�cY��\r\���r�B$`\ZUB�\0o�*Q\'��e�N6m\�\��\�s�\�?�\�	\r�!Κ.��ʒ����W��\�:�5\�\�\�2ӑJ\�\�w�d\"�\�\�S\�\�\�=\�\�L�\\\�Υ�\�˪\�B\"%T\r\�<\���}G	j*3;\�i\�\�e\�TZzzh�\�MKO7\�ݝ#�Z��Z�[ZU�\�lm_��\�}G��h��|\�b����\�\�\�@8w\�P\�\�D��;��&\�H��\'\�\�,p\��\�|���=��ή�~�\��\�S\�9\�O�PhH��h\�\\�\�~\�e]�mK\�o\�\�X\�B!���K� �)m,�\��m�\�˛X1g&+V.%�l\�\�C\�\� �S�\�i�Ic\�Y����y���mH\�;r���q�\�\�(�\��\�4��U�\�M$@\��Fl[��_=\��ʌ9�}\�\�n�\�;pz8+��\�X\�\���S\�_�vͽC#�\�]�=\�X�\�(2#�ldѼ9�\�\��\�\�$\n�(�-;�P�c\0�ց\�qgN\r!J-�\�?�a\�\�\�|م$RM��ox�<v\�H\�B5-\��\�\��0M�UK񻧞\�\'w\�\�\�n���g��BK��\�?8\�v?��5{֏?�ww�{1\0�x�f�hGΪe+Җ���\"����R�x@Q\ZJJ�|\����i\��\�\�\��ۧ�E(*\"�B�%HvvpŪ���\�ů�;�O\�ao\�\�n�!%�D:O���\���\ZB4oGR)Y�{?�8\�]q��i��^)�\�sƷ<9$8L,�BE���Ͱ%�nن�\�\�f���\��΋W�h\�<�MM�dD��\�\�z��_x�Y�fm�᷿�RC\�n�m\�%��_�e��38�[ژn1�[Jմ۶5ۖ�m\�Z�j)c�*cU�\�	��-a�\�B��ps�����)�r���c\���K?G�\�W��\��K�PS\��5�f�aëL�ҍeY<�\�<����\�\�$_r�\�BK$T�&�d��9H�B\��p\�.[��Q\��2�\�5\�&A�\�u�P\�!\�Ͼ�\n��\�?p�\�h�e\�0j⤞#1�\�;\�W�\�\�I�������Eri0$��_���B�\��\�\�6$���Ws_(��؊��˺\��i>!��ɞ\�\�y\�w�*�!\�\�x�/\��\�F3�Z\�\�y��+�:\��4� \\�q�\�k�����~o\��#\�B\�M�.\\0�W�\�\��^a��\0��alh�Ⴧ\����>\�G�b8s\�z.8\�$���\�}]�\�I;\��u-��_\�\�\�\�\�\�\����ށ!>����\�\�n�Ӷm���38<��j_9v��N�!\�l�fcX5�ZR%�(\"�(J:P�\�P�l�g(b��\���K\����\'R{~�\��uN]~ղ\�=\�G8dx4\�M�}EQ\��\�o��ø\n\�!vq�c�\�\�K�\�\�n�՟\�\�\�g!iCR)\�r\�o�\����q\�\�oevO\'��\0\0n��D���M����\�\���m\�%~}�\�\�b\�⿑�\�p�\�\��(\�j(\�\�~�{\�~\��\�\�ŧ>�a��PU�Yӧ�|�q>����xb\�;n{��_�\�\'N�Ng�8��?�ܒ�k�i\�Ɨ��߾�}֭ZN0BSU\�eL\n*�gLg��=\�ܳ��K��^\nZ�4��\�]��AoA7\�2�^592<\�`f�t��iZ�U�xkU���������H0���t�`؈h[Q1G\�\�\�sc	�4�TCUu�\�\�AJ$�y�wI�*��5fw�q\�6�\�\�)=ģQ\�Κ\�\'�\�\����3<:j�[�⋓M|�D\0X�|\�\�$�G�\�\�s��ӟ�\'7������֖sfL\�\�W7�~\�k�\\Z\�_\0�\Z@*\n�m^e�7d\�`\n\�K�^�2�\��\�{yv\�nr\�\n�ea�I�DH���u\��ܺ�k�/�j\�\�\�|d�\�����tW��q\�+B�)\nMaVW;s�۹`�\�\�j \�h!�g�\�Z�Xj��\��\�ժɆ-\�hjj���)%�P��2�_�\�yq\�fV�������\�~�\�S\'n�q�8絁�ؾiC)�j٠\�嫞|湦�\�4��M����j\�\�\�\�^䗏��}}tu�q\�����#�Gz�2\��@DM\�\\�\�Ѯ�C�#\��\�~��ٰ\� �r�j\�Ĵ�Y�S ���H�1\�Hނ\\\�\�վA\�u��9*��^5�&FդR5\�\�U��I٨R�\��\n��\�l\���ǆ�\�c�\'�WיP��k@#���z��{\�\�H�\0e�9�I5%Q�m;�\�W�\��ﾏh<�9��w�\�F9�@��\���\�\�7����ֿ�\�C\�fr\�\��]��|�\�s/m`p\�Id\\y�:~��/\�\�\�EM׃̎ J\�\�\�}�)\�M��w\�\�/l\���!l[RS\�\'\n��NcK\�\n4\�̽w�-%���\�F�pR�o�`W/�As<Z3G�@֘8\�\�\�\�\�\�\�^ⶏ\��сA�̝5�Kh<��F\�C��,]�����\�\�o{\�.<�8�I0\�\�\�\�_ط\�\����\0\�\�\�C.|t\�\��UM�\�\�d\�\�~B�,݇Dz4\0\�O�q�!�z�c��&ȅK\�M�H\�ұ~��g6�̟>�[/YJ{\"V\�\�5&Ph\�`�ƠR�\�\�G>�\�x͵G\�\��\�͛7_5<<h\�\�\ZH���\�\�\��(=�\�\'g	<<�𯆶���#\�{\�m��5s\�\��ܶf͚?}�\�\'o[�|\�桑Q=\�ѵ&\��~�ԛZI\0�ãc\��\�fƊB�v۪?(�\r��\n\����S5��\\.G�H�gv\��-�*\�e-� ݅0\�WF�\�\�ރ��\n�/�ׇ~��W]}��-Zt\�ʕ+?q\�=?\��\�{�\�\��0IN�nJ4!�B�ؒ�*��\�`0��\��\�{���\�1ݶ�M\n[;;\�m��\�^\��\�7��>EurߖY\�\�@���-{\�}�\�\�\Z��\�\�!�Y��߬\�\�\�$\��\�\�\'i\�8�\�eJ\�2�\�\�2�5\��\��z\�Z��R�Mۜ\�OsW^|g(\�+��IP��i���xHڶ�%eV\�3�\��T�\r8G(\Z�\�D\\`�m�&�P*�2w�L�����\�\�<�\�KL���SE\�\�T�@��ޣ�ؖ]3�ǡ\�\�{�H��Aw��/]ͅg�(\n��\Z�\�\�ׯ\�iK��\"�r�ޡ\�ZܙA}3�B\�*�$P.Wؽ\�\0M-�|\�\�\�F\0B�R\����d\\UKI0�e٦D4��˾_g\�\09\�\"�	�b\�ZXSR�HIAQ\�!�U\�H�Fy�\�W�\�ܿ{{v׶M\�\�\�QZ��kc&v(�Ћni�\�\�M\�sJ�^WQBPB�Y�m\�\�j\�\��\�L%\�4��.YMC$̽O�L\�\�]\�Q#���ײl���\r�x8\�Ǒ��`\�8���p��+\�]�g�\�S�\r���\0���RͰ�Pe�i\�6�����\�<\��\���\�\�yllT�%M T۰\�HX;�g\�\\v훆vn}�\'�i}��^\�\�\�<��\"t�B�Cۖ\�`���L\�\�z�Rb\�*�\�\�93�d\�|\�-�M��t\�ZI<\�\�KVq\�Y\�92�\�t��\�\n��\�!re�BIGQUgSJ߾\�\�/T�U�P+P2b�\0��� \�\�\�\�ww\�\�\�X�E\�4��\�@XSM�\�B�\\Q\ZC��t\�[�m�4\"ڙ?@�`�VPS��e\�4�*0U9\�:7[����KoL5\�\��_�������\�p\���t��iמ�\�!�*L\�h�)d4�fw\�0{w\�8\�ώm[�Y,F<����h(8n�W\�HҖM\�74B\��0�r�BY\'�2���%\�\n�Hg\�}S5�1�Rò\\�-=\�\�P���m��Ʈ-�\�*�\�	\�8����Hj ��m\'�R\�v\�\0�%��m+��-�\�\�M�TE؊8qC\�s�[oz\�\�\�~0�i˶d&�������N&L/�mac�.�ǥ��\�\r�\�Mk���FP�p@�i�q\�$W(\�{��L.Gv��\�D��.\�X4k:W]��֦&��dsS\�Z\�l\�Y\�.$\�b\��#\��\�KN�����\�\�N68-\n\�\�80>�iT�lxm-\�\��\�9���炀����@7MS�l;U�\�%MULˆH�\�Z(Weд-\���4���)Hմ�\r7��\�\��\�\�\�\�E�b�\�\0�����j\0Ŷ)�\�z\Z�1\Z\�K\��x���֬t?&\�@ڍ*�e���X��\�Yؑs\�  ��\�F7��\�\�p\�\�\\�+{�bKP4?�Q��{�12�F�7\\t�u�Ε<�5N\�ҙ���(�6�\r�i�\�o\�H	Ǿh�0�\�\�\�US����*t]�j�f\�я��m���x�ٕ�Pȕ+�\�p\�4��\�!�8N���\�\�x�\\\�gU�_����`\�qB�U���o/�\�\�@J�1�\�u\��$�����.�\�ރ�\�e\n\�̞\�\�}\�\0\�	MQ���葠�G쀊�\�\�`�X�\�p6�nig\��!2eKQ\�P\�T�(��\�U�]�;�R\��W^�7^�#�@�\�(�V[�(~��%��\�U7\�\�b���\���S�\�/>�p��Β��\0r�Jy�my����\n5Z�	�X(\n��\�`2\�},�\�ܒ{�`T�\�_���3��ض7�\'>�{2ք*��|G#�=\�\�؃iɰ2	�![�Rc(`\�ǿ�\�o�ۗ��\r3;6m\�uBՐ� �lj^I���~\�nB:\��^J\'\�[\�\����\�ܭ\�k\�@�u�}\�\�\\΂�\��5�\�	O\�%\�=\�\�$U��E�\�6(!�\�F\n?֑/�ع�K\�\�ܥ+\�K)G$\"��ĥ�Cb��=S�W0-���*��i�Sǡ�����ͮ�\�m�׿��_�\Z\��\�?;���d<	�QγtgOrt$xB\�I�;���~!\�u�G�z�|�~�\�:\�\0W�\\\���ӝc\�)�\�<&��\�`\�Y\�+�\�b�騖x©n�.u�\�=t�\�vS5���+����;�8)�s\�OUoӳ\�8\�3��@�,��\�h���x\�Q���\�ׅ׫q��\�\����\�7\�%�/z\�eqW@`��a`6f\�޻�\�\�?�����a�&�7?>3CUw��:\�r��\�<\�JUUC]6)�,Ì\��zn�q2\��5ݥ\n@��&\�I�&δ��\n�J\��`\�+W�\�ǳ��ϝ�\�8s\�y�\���Z�^\n�2�d�@\�\\� \'��/���D\nX���\�\�d\�\�\�\�\�����L\n�ڻ\�4�s��v2�陦r�1�\�䅗�DU�n\rYw\�Of7\08T\�\��]9\nJ��ɀ\�ַ\�g�3w!�\0�a��n(Q]˳)\"O3�v�\�6�8\��\�37-�x=�\�\�cϼ�\�\r_�iU�bJ���ŧ.�56��h\Z�U\�\�\��l\�\\@R�H|�!@�\��\"Q|��p_8�?�F����?�\��\�O�;)��\�ٸ\�\�w2��B`�3��\�C)%u��\���c�\�\�Ud\�\�{\nK�?x|\�.��Eu\��KQdNT7r\"ڹ�\r \�\Z��*nE�!�b�lp\�O\�0Z�\�\�B�²�#mu\rG\��W�\�}�+��0VTE`��D5p�\\D�~4\�`ݖjF�s�y�k�-V\�	)\�u�w�\�\�W\�\0I4��MȘq�:\�anj1��_̼��\��n\�W*��·��\"\0\0�IDAT�\�?̺-�@���\�\�?]\�i�tQ��c\�R�{\�~|\���\��%9�uE\��7~�ɗ�\0.�Y��+�7�ۅ[B�n]ި\�郋�L�\r\��*�n\�HA�\"D�MUZ\�} ~2.\�\�\�]x\�#�΂�㵷\�%���]�P\�\�p�tw:\n�\�շu�?�1�޴\�TЦ*\�WHC[��Z|AZ|A�}A�}��!�ڻhl�P\�։M��\�r�x6�A��\�{�\�\�/h��A�\�\���ƞ\ZK-�����^\�\������O^AѼ�\�;\����q\�r���(>�\�%��a�4\�)\�Y1@gXC7�[U��!N�\�{Þ�U\���k\�+~\���<w>�?xb\�hm\�\0!\�\�6=l\�\�$��hl\�W\�\�\��be\�bzY������e�\'~b\r$K\�M\�:���\�Z<�ٲ�\��\�7x\�\�Եx\�m�≢AUr�3\�\r�7\���\�~v;_|��Q�\���e\�&!>\�4`Wm!!�\'�ѥz^(���Zj\�\�\�͝>C\�ŀ,E@D7�܎3�\\�Zԭ(�#�K\�M?��\�\�\�t��\�\�#\�!?�\�z}`!����Ͷ\�D�G\��c�n����L.]\�\�\�\�i�\��\�}�����)�BgҲ\Z$\�]��\�fژ\n\ns�@\ZtBii����#-m\�F�A,����bF\�y���\�\�yc\�*z\�\�;�<�\�+{��y7��\�c�V�\�O�D~*DiÐ��\�\�_v��6�\�\0�a(a]\��\�\�\r\�n@�k\n�\�p	�#�ː�H�C\��yα��)\�?x��H8X>e\�8~�\�>߶i���\�\�֊!\�0ls\�o.e�\�*\�$\nc\�\�\�2F&0�\rU1=|�a`\�f5t�\�\�qVT����2za\�P�wl\��y���\��t\�5�\��\�\��nm�<�\r8`.��\"E4�tיWy�\�d�@԰\�\�R�P�Q\�\�v�9G�#�MU�K\Z2\"%�q��c&L\Z���zY(�2����ҩ8].� G\�\�F�(X: )\�N{� \�籎��=>C\�\�	�����F\�R�N\'�p�C{kX�\�Hfv\�\�\���\�\�߽�\�R\�0B(��	\0���!%�M%�(g�,�a�\�v��u��MQ�RA|�*\nCFt){�j�5-���Tﮡ��PHs�p�\�=�q,	NƩ�o!y�@&�N�ex\"b�\n�\�\�\�\��u\��\�~�wFƑ\�\�?[9z\�n\�+\nRJCJ�ag?��\��\�&\"]:�=�R\�\�\�=�\�\�ѥ#*�H�\�vƜ�\�;\���\�^�\�rNOw9\�j[\�5;bñ %��E2\�\�=\�\�\�ɛ>m\Z�\�.�\\|)v��P(ġC1,\�-	\"\�o<��$�)�\�\�\�\�\�ߵ\�~զR6�g���\�\�_�---`fT\�m%5s�f�\�%)�\\\�\�ֶdĨ6�|\�\�\�Z��Fu�G\� �\�<���^�1°�\�\ZNƬ�n��\�\�\�禹\�\���/\r\�r\0�.��O>���>��Ʀf���Ҡ���\�,��\�-X����	,�X@$�!$��BaA!X�n\r;�o\�V ��!9�y��i+�]3{\��\�_}�T�$�#�\�\�Pp\�\�>\�n�\�O(�E\�Bhg�ꗯ�Fy\�\�\�\�\�\��\�\�kV]%\r�\0�9�2l\�0�Ξs\�d���]�ؿ?\�?�<��\�/y�\��ر�\ZC\ZD\"\Z���\'d\00\�D\�|2XR��\'H�MU)\�/ 77�h4ʞ=�)0�\�\�jv\�\�\��\�?Oaaa�v��\�p8\�ڵkY�f\rMMMD�Q\�\���~^����/��̢>\'�Fu(!\�@a�%}l�g\���g�\�/�qe\�\����6O��A\�������9s&�^zi�Lz2D�{ߖ.]ʽ�\�\��\�\�Y�lN��\�laݺ��|>B�G��K߉:\�8\rH�@��3+jqa\�YY�|>�>\�e�]\��\�Ә={6\�\�\�lݺռ.\� a7pr��u\�6\�|�\r�/_Nmm-\0�cǿz\��\�^�����\\\�+:B\Z \�-�<nv4<A]\�v\�8\�/_����yU��[\�\�\�0Ŧڸy\�<^]��\'�|��3g���\��x4��c�q\�\�ѿjj�PSS�\�\�d\�E1{\�5���\�餰�\�~bn\�m�?��f\'��\�\�ן��tjkkټi#\�ł�PUUűcǸ\�\Zk��@7tÜBZ\�\�\��p\�ر<��\�,[��Q�\�\�\"5;�\��\�\�W�\�C\���\�*N�\�:#u���~{\�Ç��\�\��L\�߿?\�=��\�\�NL�\�ma�\�(�`o]G�\�\\:�1c\���\�+ظq#\�Ǐ\�fS;v,�P�g�}�@0HFF�D\"\�\����\0�\�NVz:.w\Z�\����R�{����e\��Jy�Y|\��\�_\�\�p0{\�)���jhf`I~l]�*H��\�%�\\\�ڵky\�\�X�t�c\�Ϳ��\�>`ᩚ8��S�\�?�^9+���\�c\r�S���x\�\�g��a\�$��GN�$��MU\��hhk������W\�p8�3g�!d�\�Ѽ�\�r��\�|^/c*G0�|�H�@,FO$�\�o��u>\�場_1C�\�K&1m\��N\�\�\�زu+o��`\�ܹ<��\�>���6y\�\�\�˙?>\���k\�	G�\�W�ͦƝU潏c����L�8��7R[[K�\�w\�\�7~��H1N\�\"��\�ܼ���_3UQ\��~\�\�|3��j6�\�!ں�Է�\�6w\nAf��\��s�q9��Bq^6\rmD4�a�\�_X\���\�ikk###Q1����\�_�\��+V��G�\�}w�����\�\��X�dv�3a�؊�MUq:��d\�\�]<�\�l�\�;\Z\�=�\�\����*�������~Ǝ���\�^���h�NI^6U�\�\�\�\�\�XG�Y�<i\�\�v:1h\0�Yf��d\�(.)aɒ%̞3���FǊ\���;x\�\�?.~�E&#e\Z`ѿ�R�\�\���\�\�\�ʟz\�T/^L�;-\��F�n\�^�k%��<tM\��\�4wtQ\�\�N$\Z%\�\�\";\�M]KQMGU\Z\�\�ص��aÆ1q\�D �Erss�4i����\�\rl��[���M�~\�\�fg\�v9Iw�\�Ns��\�\�\�r����Ks:q9�\�\�v\Z���\�+���\'��j\'�\'Ofٲe\\}�\�q�EJI4\Z\�\�_|���\Z&M��\�A\�W$��9\���>t�\�6�PM\�\�t]3\�t�`8BC[�P�\�7v��S\�dg\�\�\�\�\�\�æ\���C�\�\rGאB�L|�~\���p�,\�\�\�\�n%#3#.i�n���_0�0\�-\�M~I8�q���f��\�9\'Ӎ?BQTFO�Ȇ\��~�z\�\�n\�\"�`��<�\�\�\�\�\��%,��W�o��_�Y=�{^\0?�82\�\����\�!l6,\�\�{\�e\��\�}�\�u�\�Q�\�Ԑ�_H��\�$�\�\�Yv�\�y`Bb�)\��\�Щon)7b���@J\�\�Ҹ��\�Y�b�\�\n���ˋZ�\�[�<\�?R\�\0K��\��p�\�s̚u-3f\�@I\Z\�Z;�Է�\�3\��n\�8\�k�\��>���C4dUUU\�\�\�PQQ\�c<\�\�\�\��\�\�\�\�ŋin�\��\�\�\��t\�W8�zj�\�s7G\�_a\�SJɶm\�رs\'\�&N����sӇa>~�\�3\\L\�FIc���\�6\�bU\�-Ceʔ\�L�4�\�\�ZB�\�����Y�Ͼ�S!%��jKYnA�U��.���X�\\�e\rà\�\�E\�Ƥ=N�\�ޜXG�]!�����$(.\�\�\�a#�f\�\'|��\�TVVr<]\�\�W�\���۝\�u?�ǐ�\�q\�[�ҋ\�\�\�회�L.�5��eC!6e�b\�j��\�ħ�~\�u\�]\�\���\�߷4��i|���>\�09>ԙ�(�|�0YA�S��\'0�N�\�0P\�\�\�\�~�6m\Z˗/\�\��\�\�#�I%Rb4\�\�\rk=\��[�\�΢E�(..�KJT\�\�_\�H0NH$�Lt�84�UQ\�4��7|JVV&ӧO�{�4	�q\�F\�\�v\�\�\��\�ۙu\�\\D�ҁ�PJzF:���\Z#)w���3�\�\��1����#F2d\�*F�����\�>]Ou�..�pE�E\�\�\����\�\�\�\�\��\�<�\�ه���RI�1�\�rR����v_�KKK\�\�_F\�4\�޶`[զow�\"�y5�7\�T5\�\�Չ\�n���<.RJà\�H�k��É��\�?�\�޺\�\�\'���×_~I}}}\\��4�ꫯ��\�;ihldƕ\�2s�?$J\�\�0j\�xF�I�\�Qm6��\�F�N1\�m%��3�B.�8�5kVs\�\��\�\�k\0����c\�.�p<.WZ\�Q,�&���遤���F��\�\�\�())��\�ص\'h\�q\�\�Ш��(B`w$�\�f�-]���é \�r�gR9z,���l߾0;iϞ�<��\�\�޽�K�\�d\�mw\�LKH����YY/�@U\�zM���\�Mg��\�BA�^/�m����\�c��)|�a����ٷo_l��իW0v\�E\�\�f^�^\�8C�W$S=F�㡪*\0\�>4�\�\���awt\��-$�Y��\�b�i�\n��\�ˮ��/ׯeٲe\�t\�M\�ۿ�y�\�QUU\�\�\�.\�\��\rin7�\�\�1#\�\���Ɵ_aݪ��;\�̸f�0��:@K�1j�\�\�\��}tvt0u\�U\\>\�G�+ȝ�?\�җ���\�ˑ�G�\�\�����?����b���ʱ��O��qD�\�n\Z�\ZF�q\rP��&4�\�\�uی+\��c�&�\�z1\�/\�\�+\�5���%J\�\�<l8�6m\�o�\�\���\�\�w0�����\��\�6ձ�}?yDi�;J0 \'/�I?��\�\�\�\�\���\����C�9�:\n��)\�\�ˊ+(*\�gw,�\�\�ɖ͛X�p!7\�tuuu�\ZD\��b\�jq=g\�03��Fd�!EQ(--��4f2}�Y3\0\�Mm�Ҟxx�L\�t\'\��^�D<K	\�\�\�s���xo�k\\;k��\\\���-�EH$\�W�d維�gf\�o`)EE%\��?�9E%%|�v5\\�7\�2�\�~u?��݆PT]\'�\��z	x}\�]���w��֫�\���W�y��\�\�E�L%+\'sZg=\�	ޣ7$1NoKF���b�\�mo}�>\�G3.=I��\�CJ\�x�|�x&�Ӕѣ?U����. =3���v��,gޭw�WX�\�I.?��\�\�Z[ik>\�\�\�\�����\�Ǭ��\�ͻ\�_\�[�+\�~�él��k\Z\�\�\�hm�����N�fPq�h��\�<��\�\0�\��\�m��<�g�\�E�kQ-\�N7-\�M�6G�\'�ER%��9a�s���Χ���~r\�_1h\�Є$IAQq?\nK��\�(!\Z���A \��\�\Z�\�\�\�S����og\'�\�\�T^0�\��|\\.\��p5B�����\�\�\"\'��o>����z}ξA\�k��a�Z���}\�\�%d\�\�qՏ�gԘq�4�$1J\�Rć�Á\�\�\����\�\�S�}�\�_=@ɀR�\\>kN\�NA\�4�$v\�\�r) 3+�n�&]�ݞ\�gv�nd�\Z5�4,�c��h\n0\�\�\�6,(D�p!\���i��m��3vn\�BfV6�\�v\�\r�\�N\�\�A0\�\n�i\Z\�7\�\�p�j�1��\"���4D�Jj��\�ݫ��7���L֦O,M\0q\�\�+�eO�N���r�\�F�\r�6;����3�\Z�i:�p��.?m�^����\�$\Z5YI���\�1l�4��� �0L�gi��\Zi.\�E{\��lIĤ4�\�-�\�]pM\� �����\�\\�\�f�\��M��>@���F�\"��\�\��(\�\�aL>$\�Ffp�\"TUMh�T��L�+\�B�K�sP-K6�u\�D�2�B\�u�\�\0\��1M$\'/���:<\�m	v��ҋD\�U���*\�2�l`J螌��e���\"��?\�`�\�W�JH!M\�	�K�N�w��\�t7v��\�\�_\�@:=~?I~NV<t+961~$�H��.-���nh��=ι\r�5f�آN*�\�x{��dg��d�ݤ��\�\�2K�\�T��`SU�����+f��\�\�\�6\n�c�?�\�)%�P��\�v\Z\�;�C�#Z\�\�q����s\�\0B(��\�g�k\�0տ���RYV�=i\�\\�7@(�wzi\�����=��̬l\�\�t\�9\�<\�0(�h����Vm^��D:y���&��\�s\�\0�k�B\�\�ڡ\�+X��։�6B����\�JZ	��rG��\"�\�\�޽|>���$3;]7VZ:����!��0�p$>$[u!e�m\���#%pJ�J\�q9e]&\�7�Z\rE�\�66\�\�\�$?��p:\�\�U%6�a;�~O0`\�ȑd\�\��D\�y�(��r\�\�M~)!�{\�\�za*M\�{,��$ewO\r$:�\�C!�\�lH���<�w\�ɭBa\�5q���\�\��2\�p��D4~?��aw8�=E���Q-��\�\�\�>y��1���!6\�MR\�\0N\� ��i%M\"\�V=��0\�{j�N���\�./UE\�5�]�475\�r�1x��S5�7�eG��Qٻ���o\�&o�\r\�j�\�\�,$\�\0\0\0\0IEND�B`�','image/png','erwan-transparent.png','Victor','','',0,0),(18,'','','','kacsa','','',0,0),(19,'','','','dsaasdsdasad','','',0,0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicaldevice`
--

DROP TABLE IF EXISTS `physicaldevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicaldevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `status` enum('implementation','obsolete','production','stock') COLLATE utf8_unicode_ci DEFAULT 'production',
  `brand_id` int(11) DEFAULT '0',
  `model_id` int(11) DEFAULT '0',
  `asset_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `purchase_date` date DEFAULT NULL,
  `end_of_warranty` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `brand_id` (`brand_id`),
  KEY `model_id` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicaldevice`
--

LOCK TABLES `physicaldevice` WRITE;
/*!40000 ALTER TABLE `physicaldevice` DISABLE KEYS */;
INSERT INTO `physicaldevice` VALUES (1,'',1,'production',2,4,'',NULL,NULL),(2,'',2,'production',0,0,'',NULL,NULL),(3,'',0,'production',2,4,'',NULL,NULL),(4,'US3215687014',0,'production',2,4,'','2011-05-22','2013-05-21'),(5,'',1,'production',1,0,'',NULL,NULL),(6,'',2,'production',2,5,'',NULL,NULL),(15,'',2,'production',0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `physicaldevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicalinterface`
--

DROP TABLE IF EXISTS `physicalinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicalinterface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectableci_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `connectableci_id` (`connectableci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicalinterface`
--

LOCK TABLES `physicalinterface` WRITE;
/*!40000 ALTER TABLE `physicalinterface` DISABLE KEYS */;
/*!40000 ALTER TABLE `physicalinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerconnection`
--

DROP TABLE IF EXISTS `powerconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerconnection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerconnection`
--

LOCK TABLES `powerconnection` WRITE;
/*!40000 ALTER TABLE `powerconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `powerconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powersource`
--

DROP TABLE IF EXISTS `powersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powersource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powersource`
--

LOCK TABLES `powersource` WRITE;
/*!40000 ALTER TABLE `powersource` DISABLE KEYS */;
/*!40000 ALTER TABLE `powersource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer`
--

LOCK TABLES `printer` WRITE;
/*!40000 ALTER TABLE `printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_action`
--

DROP TABLE IF EXISTS `priv_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('test','enabled','disabled') COLLATE utf8_unicode_ci DEFAULT 'test',
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Action',
  PRIMARY KEY (`id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_action`
--

LOCK TABLES `priv_action` WRITE;
/*!40000 ALTER TABLE `priv_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_action_email`
--

DROP TABLE IF EXISTS `priv_action_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_action_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_recipient` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `reply_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `to` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `body` text COLLATE utf8_unicode_ci,
  `importance` enum('high','low','normal') COLLATE utf8_unicode_ci DEFAULT 'normal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_action_email`
--

LOCK TABLES `priv_action_email` WRITE;
/*!40000 ALTER TABLE `priv_action_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_action_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_action_notification`
--

DROP TABLE IF EXISTS `priv_action_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_action_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_action_notification`
--

LOCK TABLES `priv_action_notification` WRITE;
/*!40000 ALTER TABLE `priv_action_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_action_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_app_dashboards`
--

DROP TABLE IF EXISTS `priv_app_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_app_dashboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `menu_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `contents` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_app_dashboards`
--

LOCK TABLES `priv_app_dashboards` WRITE;
/*!40000 ALTER TABLE `priv_app_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_app_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_app_preferences`
--

DROP TABLE IF EXISTS `priv_app_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_app_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0',
  `preferences` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_app_preferences`
--

LOCK TABLES `priv_app_preferences` WRITE;
/*!40000 ALTER TABLE `priv_app_preferences` DISABLE KEYS */;
INSERT INTO `priv_app_preferences` VALUES (1,1,'a:2:{s:13:\"welcome_popup\";s:1:\"1\";s:9:\"menu_size\";s:3:\"300\";}');
/*!40000 ALTER TABLE `priv_app_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_async_send_email`
--

DROP TABLE IF EXISTS `priv_async_send_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_async_send_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT '1',
  `to` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci,
  `message` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_async_send_email`
--

LOCK TABLES `priv_async_send_email` WRITE;
/*!40000 ALTER TABLE `priv_async_send_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_async_send_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_async_task`
--

DROP TABLE IF EXISTS `priv_async_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_async_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('error','idle','planned','running') COLLATE utf8_unicode_ci DEFAULT 'planned',
  `created` datetime DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `planned` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT '0',
  `remaining_retries` int(11) DEFAULT '0',
  `last_error_code` int(11) DEFAULT '0',
  `last_error` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `last_attempt` datetime DEFAULT NULL,
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'AsyncTask',
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_async_task`
--

LOCK TABLES `priv_async_task` WRITE;
/*!40000 ALTER TABLE `priv_async_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_async_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_auditcategory`
--

DROP TABLE IF EXISTS `priv_auditcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_auditcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `definition_set` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_auditcategory`
--

LOCK TABLES `priv_auditcategory` WRITE;
/*!40000 ALTER TABLE `priv_auditcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_auditcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_auditrule`
--

DROP TABLE IF EXISTS `priv_auditrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_auditrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `query` text COLLATE utf8_unicode_ci,
  `valid_flag` enum('false','true') COLLATE utf8_unicode_ci DEFAULT 'true',
  `category_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_auditrule`
--

LOCK TABLES `priv_auditrule` WRITE;
/*!40000 ALTER TABLE `priv_auditrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_auditrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_backgroundtask`
--

DROP TABLE IF EXISTS `priv_backgroundtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_backgroundtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `first_run_date` datetime DEFAULT NULL,
  `latest_run_date` datetime DEFAULT NULL,
  `next_run_date` datetime DEFAULT NULL,
  `total_exec_count` int(11) DEFAULT '0',
  `latest_run_duration` decimal(8,3) DEFAULT '0.000',
  `min_run_duration` decimal(8,3) DEFAULT '0.000',
  `max_run_duration` decimal(8,3) DEFAULT '0.000',
  `average_run_duration` decimal(8,3) DEFAULT '0.000',
  `running` tinyint(1) DEFAULT '0',
  `status` enum('active','paused') COLLATE utf8_unicode_ci DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_backgroundtask`
--

LOCK TABLES `priv_backgroundtask` WRITE;
/*!40000 ALTER TABLE `priv_backgroundtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_backgroundtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_bulk_export_result`
--

DROP TABLE IF EXISTS `priv_bulk_export_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_bulk_export_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `chunk_size` int(11) DEFAULT '0',
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `temp_file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `search` longtext COLLATE utf8_unicode_ci,
  `status_info` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_bulk_export_result`
--

LOCK TABLES `priv_bulk_export_result` WRITE;
/*!40000 ALTER TABLE `priv_bulk_export_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_bulk_export_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_change`
--

DROP TABLE IF EXISTS `priv_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_change` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `userinfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `origin` enum('csv-import.php','csv-interactive','custom-extension','email-processing','interactive','synchro-data-source','webservice-rest','webservice-soap') COLLATE utf8_unicode_ci DEFAULT 'interactive',
  PRIMARY KEY (`id`),
  KEY `origin` (`origin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_change`
--

LOCK TABLES `priv_change` WRITE;
/*!40000 ALTER TABLE `priv_change` DISABLE KEYS */;
INSERT INTO `priv_change` VALUES (1,'2016-10-28 12:02:08','','interactive'),(2,'2016-10-28 12:02:11','Initialization','interactive'),(3,'2016-10-28 12:02:57','','interactive'),(4,'2016-10-28 12:20:58','My first name My last name','interactive'),(5,'2016-10-28 12:48:21','My first name My last name','interactive'),(6,'2016-10-28 12:54:20','My first name My last name','interactive'),(7,'2016-10-28 12:56:55','My first name My last name','interactive'),(8,'2016-10-28 13:10:40','My first name My last name','interactive');
/*!40000 ALTER TABLE `priv_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop`
--

DROP TABLE IF EXISTS `priv_changeop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeid` int(11) DEFAULT '0',
  `objclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `objkey` int(11) DEFAULT '0',
  `optype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'CMDBChangeOp',
  PRIMARY KEY (`id`),
  KEY `changeid` (`changeid`),
  KEY `optype` (`optype`),
  KEY `objclass_objkey` (`objclass`,`objkey`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop`
--

LOCK TABLES `priv_changeop` WRITE;
/*!40000 ALTER TABLE `priv_changeop` DISABLE KEYS */;
INSERT INTO `priv_changeop` VALUES (1,1,'URP_Profiles',1,'CMDBChangeOpCreate'),(2,1,'URP_Profiles',3,'CMDBChangeOpCreate'),(3,1,'URP_Profiles',4,'CMDBChangeOpCreate'),(4,1,'URP_Profiles',5,'CMDBChangeOpCreate'),(5,1,'URP_Profiles',6,'CMDBChangeOpCreate'),(6,1,'URP_Profiles',7,'CMDBChangeOpCreate'),(7,1,'URP_Profiles',8,'CMDBChangeOpCreate'),(8,1,'URP_Profiles',9,'CMDBChangeOpCreate'),(9,1,'URP_Profiles',10,'CMDBChangeOpCreate'),(10,1,'URP_Profiles',11,'CMDBChangeOpCreate'),(11,1,'URP_Profiles',2,'CMDBChangeOpCreate'),(12,1,'URP_Profiles',12,'CMDBChangeOpCreate'),(13,1,'Organization',1,'CMDBChangeOpCreate'),(14,1,'Person',1,'CMDBChangeOpCreate'),(16,1,'URP_Profiles',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(17,1,'URP_UserProfile',1,'CMDBChangeOpCreate'),(18,1,'UserLocal',1,'CMDBChangeOpCreate'),(19,2,'Organization',2,'CMDBChangeOpCreate'),(20,2,'Organization',3,'CMDBChangeOpCreate'),(21,2,'Brand',1,'CMDBChangeOpCreate'),(22,2,'Brand',2,'CMDBChangeOpCreate'),(23,2,'Model',3,'CMDBChangeOpCreate'),(24,2,'Model',4,'CMDBChangeOpCreate'),(25,2,'Model',5,'CMDBChangeOpCreate'),(26,2,'OSFamily',6,'CMDBChangeOpCreate'),(27,2,'OSFamily',7,'CMDBChangeOpCreate'),(28,2,'OSVersion',8,'CMDBChangeOpCreate'),(29,2,'OSVersion',9,'CMDBChangeOpCreate'),(30,2,'NetworkDeviceType',10,'CMDBChangeOpCreate'),(31,2,'NetworkDeviceType',11,'CMDBChangeOpCreate'),(32,2,'ContactType',12,'CMDBChangeOpCreate'),(33,2,'ContactType',13,'CMDBChangeOpCreate'),(34,2,'ContactType',14,'CMDBChangeOpCreate'),(35,2,'ContactType',15,'CMDBChangeOpCreate'),(36,2,'ContactType',16,'CMDBChangeOpCreate'),(37,2,'ContactType',17,'CMDBChangeOpCreate'),(38,2,'Location',1,'CMDBChangeOpCreate'),(39,2,'Location',2,'CMDBChangeOpCreate'),(40,2,'Location',3,'CMDBChangeOpCreate'),(41,2,'Person',2,'CMDBChangeOpCreate'),(42,2,'Person',3,'CMDBChangeOpCreate'),(43,2,'Person',4,'CMDBChangeOpCreate'),(44,2,'Person',5,'CMDBChangeOpCreate'),(45,2,'Person',6,'CMDBChangeOpCreate'),(46,2,'Person',7,'CMDBChangeOpCreate'),(47,2,'Person',8,'CMDBChangeOpCreate'),(48,2,'Person',9,'CMDBChangeOpCreate'),(49,2,'Person',10,'CMDBChangeOpCreate'),(50,2,'Location',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(51,2,'Person',11,'CMDBChangeOpCreate'),(52,2,'Location',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(53,2,'Person',12,'CMDBChangeOpCreate'),(54,2,'Person',13,'CMDBChangeOpCreate'),(55,2,'Person',7,'CMDBChangeOpSetAttributeScalar'),(56,2,'Person',7,'CMDBChangeOpSetAttributeScalar'),(57,2,'Person',7,'CMDBChangeOpSetAttributeScalar'),(58,2,'Person',7,'CMDBChangeOpSetAttributeBlob'),(59,2,'Person',7,'CMDBChangeOpSetAttributeScalar'),(60,2,'Team',14,'CMDBChangeOpCreate'),(61,2,'Team',15,'CMDBChangeOpCreate'),(62,2,'Team',16,'CMDBChangeOpCreate'),(63,2,'Team',17,'CMDBChangeOpCreate'),(64,2,'Team',17,'CMDBChangeOpSetAttributeLinksAddRemove'),(65,2,'Person',9,'CMDBChangeOpSetAttributeLinksAddRemove'),(66,2,'lnkPersonToTeam',1,'CMDBChangeOpCreate'),(67,2,'Team',17,'CMDBChangeOpSetAttributeLinksAddRemove'),(68,2,'Person',8,'CMDBChangeOpSetAttributeLinksAddRemove'),(69,2,'lnkPersonToTeam',2,'CMDBChangeOpCreate'),(70,2,'Team',15,'CMDBChangeOpSetAttributeLinksAddRemove'),(71,2,'Person',9,'CMDBChangeOpSetAttributeLinksAddRemove'),(72,2,'lnkPersonToTeam',3,'CMDBChangeOpCreate'),(73,2,'Team',15,'CMDBChangeOpSetAttributeLinksAddRemove'),(74,2,'Person',10,'CMDBChangeOpSetAttributeLinksAddRemove'),(75,2,'lnkPersonToTeam',4,'CMDBChangeOpCreate'),(76,2,'Team',15,'CMDBChangeOpSetAttributeLinksAddRemove'),(77,2,'Person',13,'CMDBChangeOpSetAttributeLinksAddRemove'),(78,2,'lnkPersonToTeam',5,'CMDBChangeOpCreate'),(79,2,'Team',14,'CMDBChangeOpSetAttributeLinksAddRemove'),(80,2,'Person',5,'CMDBChangeOpSetAttributeLinksAddRemove'),(81,2,'lnkPersonToTeam',6,'CMDBChangeOpCreate'),(82,2,'Team',14,'CMDBChangeOpSetAttributeLinksAddRemove'),(83,2,'Person',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(84,2,'lnkPersonToTeam',7,'CMDBChangeOpCreate'),(85,2,'Team',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(86,2,'Person',6,'CMDBChangeOpSetAttributeLinksAddRemove'),(87,2,'lnkPersonToTeam',8,'CMDBChangeOpCreate'),(88,2,'Team',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(89,2,'Person',7,'CMDBChangeOpSetAttributeLinksAddRemove'),(90,2,'lnkPersonToTeam',9,'CMDBChangeOpCreate'),(91,2,'Location',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(92,2,'Brand',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(93,2,'Model',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(94,2,'Server',1,'CMDBChangeOpCreate'),(95,2,'Location',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(96,2,'Server',2,'CMDBChangeOpCreate'),(97,2,'Brand',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(98,2,'Model',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(99,2,'Server',3,'CMDBChangeOpCreate'),(100,2,'Brand',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(101,2,'Model',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(102,2,'Server',4,'CMDBChangeOpCreate'),(103,2,'Location',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(104,2,'Brand',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(105,2,'NetworkDeviceType',10,'CMDBChangeOpSetAttributeLinksAddRemove'),(106,2,'NetworkDevice',5,'CMDBChangeOpCreate'),(107,2,'Location',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(108,2,'Brand',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(109,2,'Model',5,'CMDBChangeOpSetAttributeLinksAddRemove'),(110,2,'NetworkDeviceType',11,'CMDBChangeOpSetAttributeLinksAddRemove'),(111,2,'NetworkDevice',6,'CMDBChangeOpCreate'),(112,2,'Software',1,'CMDBChangeOpCreate'),(113,2,'Software',2,'CMDBChangeOpCreate'),(114,2,'Server',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(115,2,'Software',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(116,2,'DBServer',7,'CMDBChangeOpCreate'),(117,2,'DBServer',7,'CMDBChangeOpSetAttributeLinksAddRemove'),(118,2,'DatabaseSchema',8,'CMDBChangeOpCreate'),(119,2,'Server',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(120,2,'WebServer',9,'CMDBChangeOpCreate'),(121,2,'WebServer',9,'CMDBChangeOpSetAttributeLinksAddRemove'),(122,2,'WebApplication',10,'CMDBChangeOpCreate'),(123,2,'ApplicationSolution',11,'CMDBChangeOpCreate'),(124,2,'ApplicationSolution',12,'CMDBChangeOpCreate'),(125,2,'ApplicationSolution',13,'CMDBChangeOpCreate'),(126,2,'ApplicationSolution',14,'CMDBChangeOpCreate'),(127,2,'ApplicationSolution',12,'CMDBChangeOpSetAttributeLinksAddRemove'),(128,2,'DatabaseSchema',8,'CMDBChangeOpSetAttributeLinksAddRemove'),(129,2,'lnkApplicationSolutionToFunctionalCI',1,'CMDBChangeOpCreate'),(130,2,'ApplicationSolution',13,'CMDBChangeOpSetAttributeLinksAddRemove'),(131,2,'Server',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(132,2,'lnkApplicationSolutionToFunctionalCI',2,'CMDBChangeOpCreate'),(133,2,'ApplicationSolution',14,'CMDBChangeOpSetAttributeLinksAddRemove'),(134,2,'ApplicationSolution',11,'CMDBChangeOpSetAttributeLinksAddRemove'),(135,2,'lnkApplicationSolutionToFunctionalCI',3,'CMDBChangeOpCreate'),(136,2,'ApplicationSolution',14,'CMDBChangeOpSetAttributeLinksAddRemove'),(137,2,'ApplicationSolution',12,'CMDBChangeOpSetAttributeLinksAddRemove'),(138,2,'lnkApplicationSolutionToFunctionalCI',4,'CMDBChangeOpCreate'),(139,2,'Location',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(140,2,'Rack',15,'CMDBChangeOpCreate'),(141,2,'Farm',16,'CMDBChangeOpCreate'),(142,2,'Farm',17,'CMDBChangeOpCreate'),(143,2,'Farm',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(144,2,'Hypervisor',18,'CMDBChangeOpCreate'),(145,2,'Farm',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(146,2,'Hypervisor',19,'CMDBChangeOpCreate'),(147,2,'Farm',17,'CMDBChangeOpSetAttributeLinksAddRemove'),(148,2,'Hypervisor',20,'CMDBChangeOpCreate'),(149,2,'Farm',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(150,2,'VirtualMachine',21,'CMDBChangeOpCreate'),(151,2,'Farm',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(152,2,'VirtualMachine',22,'CMDBChangeOpCreate'),(153,2,'Farm',16,'CMDBChangeOpSetAttributeLinksAddRemove'),(154,2,'VirtualMachine',23,'CMDBChangeOpCreate'),(155,2,'Farm',17,'CMDBChangeOpSetAttributeLinksAddRemove'),(156,2,'VirtualMachine',24,'CMDBChangeOpCreate'),(157,2,'VirtualMachine',22,'CMDBChangeOpSetAttributeLinksAddRemove'),(158,2,'Software',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(159,2,'DBServer',25,'CMDBChangeOpCreate'),(160,2,'VirtualMachine',23,'CMDBChangeOpSetAttributeLinksAddRemove'),(161,2,'Software',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(162,2,'DBServer',26,'CMDBChangeOpCreate'),(163,2,'DBServer',25,'CMDBChangeOpSetAttributeLinksAddRemove'),(164,2,'DatabaseSchema',27,'CMDBChangeOpCreate'),(165,2,'DBServer',26,'CMDBChangeOpSetAttributeLinksAddRemove'),(166,2,'DatabaseSchema',28,'CMDBChangeOpCreate'),(167,2,'VirtualMachine',21,'CMDBChangeOpSetAttributeLinksAddRemove'),(168,2,'WebServer',29,'CMDBChangeOpCreate'),(169,2,'WebServer',29,'CMDBChangeOpSetAttributeLinksAddRemove'),(170,2,'WebApplication',30,'CMDBChangeOpCreate'),(171,2,'WebServer',29,'CMDBChangeOpSetAttributeLinksAddRemove'),(172,2,'WebApplication',31,'CMDBChangeOpCreate'),(173,2,'ApplicationSolution',11,'CMDBChangeOpSetAttributeLinksAddRemove'),(174,2,'DatabaseSchema',28,'CMDBChangeOpSetAttributeLinksAddRemove'),(175,2,'lnkApplicationSolutionToFunctionalCI',5,'CMDBChangeOpCreate'),(176,2,'ApplicationSolution',11,'CMDBChangeOpSetAttributeLinksAddRemove'),(177,2,'WebApplication',31,'CMDBChangeOpSetAttributeLinksAddRemove'),(178,2,'lnkApplicationSolutionToFunctionalCI',6,'CMDBChangeOpCreate'),(179,2,'ApplicationSolution',12,'CMDBChangeOpSetAttributeLinksAddRemove'),(180,2,'WebApplication',30,'CMDBChangeOpSetAttributeLinksAddRemove'),(181,2,'lnkApplicationSolutionToFunctionalCI',7,'CMDBChangeOpCreate'),(182,2,'ApplicationSolution',13,'CMDBChangeOpSetAttributeLinksAddRemove'),(183,2,'DatabaseSchema',27,'CMDBChangeOpSetAttributeLinksAddRemove'),(184,2,'lnkApplicationSolutionToFunctionalCI',8,'CMDBChangeOpCreate'),(185,2,'ApplicationSolution',13,'CMDBChangeOpSetAttributeLinksTune'),(186,2,'WebServer',29,'CMDBChangeOpSetAttributeLinksAddRemove'),(187,2,'Server',4,'CMDBChangeOpSetAttributeLinksAddRemove'),(188,2,'lnkApplicationSolutionToFunctionalCI',2,'CMDBChangeOpSetAttributeScalar'),(189,2,'DeliveryModel',1,'CMDBChangeOpCreate'),(190,2,'DeliveryModel',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(191,2,'Organization',3,'CMDBChangeOpSetAttributeScalar'),(192,2,'CustomerContract',1,'CMDBChangeOpCreate'),(193,2,'ServiceFamily',1,'CMDBChangeOpCreate'),(194,2,'ServiceFamily',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(195,2,'Service',1,'CMDBChangeOpCreate'),(196,2,'ServiceFamily',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(197,2,'Service',2,'CMDBChangeOpCreate'),(198,2,'ServiceFamily',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(199,2,'Service',3,'CMDBChangeOpCreate'),(200,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(201,2,'ServiceSubcategory',1,'CMDBChangeOpCreate'),(202,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(203,2,'ServiceSubcategory',2,'CMDBChangeOpCreate'),(204,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(205,2,'ServiceSubcategory',3,'CMDBChangeOpCreate'),(206,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(207,2,'ServiceSubcategory',4,'CMDBChangeOpCreate'),(208,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(209,2,'ServiceSubcategory',5,'CMDBChangeOpCreate'),(210,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(211,2,'ServiceSubcategory',6,'CMDBChangeOpCreate'),(212,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(213,2,'ServiceSubcategory',7,'CMDBChangeOpCreate'),(214,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(215,2,'ServiceSubcategory',8,'CMDBChangeOpCreate'),(216,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(217,2,'ServiceSubcategory',9,'CMDBChangeOpCreate'),(218,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(219,2,'ServiceSubcategory',10,'CMDBChangeOpCreate'),(220,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(221,2,'ServiceSubcategory',11,'CMDBChangeOpCreate'),(222,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(223,2,'ServiceSubcategory',12,'CMDBChangeOpCreate'),(224,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(225,2,'ServiceSubcategory',13,'CMDBChangeOpCreate'),(226,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(227,2,'ServiceSubcategory',14,'CMDBChangeOpCreate'),(228,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(229,2,'ServiceSubcategory',15,'CMDBChangeOpCreate'),(230,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(231,2,'ServiceSubcategory',16,'CMDBChangeOpCreate'),(232,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(233,2,'ServiceSubcategory',17,'CMDBChangeOpCreate'),(234,2,'SLA',1,'CMDBChangeOpCreate'),(235,2,'SLT',1,'CMDBChangeOpCreate'),(236,2,'SLT',2,'CMDBChangeOpCreate'),(237,2,'SLA',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(238,2,'lnkSLAToSLT',1,'CMDBChangeOpCreate'),(239,2,'SLA',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(240,2,'lnkSLAToSLT',2,'CMDBChangeOpCreate'),(241,2,'CustomerContract',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(242,2,'Service',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(243,2,'SLA',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(244,2,'lnkCustomerContractToService',1,'CMDBChangeOpCreate'),(245,2,'CustomerContract',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(246,2,'Service',2,'CMDBChangeOpSetAttributeLinksAddRemove'),(247,2,'SLA',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(248,2,'lnkCustomerContractToService',2,'CMDBChangeOpCreate'),(249,2,'CustomerContract',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(250,2,'Service',3,'CMDBChangeOpSetAttributeLinksAddRemove'),(251,2,'SLA',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(252,2,'lnkCustomerContractToService',3,'CMDBChangeOpCreate'),(253,2,'DeliveryModel',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(254,2,'lnkDeliveryModelToContact',1,'CMDBChangeOpCreate'),(255,2,'DeliveryModel',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(256,2,'lnkDeliveryModelToContact',2,'CMDBChangeOpCreate'),(257,2,'DeliveryModel',1,'CMDBChangeOpSetAttributeLinksAddRemove'),(258,2,'lnkDeliveryModelToContact',3,'CMDBChangeOpCreate'),(259,3,'ModuleInstallation',1,'CMDBChangeOpCreate'),(260,3,'ModuleInstallation',2,'CMDBChangeOpCreate'),(261,3,'ModuleInstallation',3,'CMDBChangeOpCreate'),(262,3,'ModuleInstallation',4,'CMDBChangeOpCreate'),(263,3,'ModuleInstallation',5,'CMDBChangeOpCreate'),(264,3,'ModuleInstallation',6,'CMDBChangeOpCreate'),(265,3,'ModuleInstallation',7,'CMDBChangeOpCreate'),(266,3,'ModuleInstallation',8,'CMDBChangeOpCreate'),(267,3,'ModuleInstallation',9,'CMDBChangeOpCreate'),(268,3,'ModuleInstallation',10,'CMDBChangeOpCreate'),(269,3,'ModuleInstallation',11,'CMDBChangeOpCreate'),(270,3,'ModuleInstallation',12,'CMDBChangeOpCreate'),(271,3,'ModuleInstallation',13,'CMDBChangeOpCreate'),(272,3,'ModuleInstallation',14,'CMDBChangeOpCreate'),(273,3,'ModuleInstallation',15,'CMDBChangeOpCreate'),(274,3,'ModuleInstallation',16,'CMDBChangeOpCreate'),(275,3,'ModuleInstallation',17,'CMDBChangeOpCreate'),(276,3,'ModuleInstallation',18,'CMDBChangeOpCreate'),(277,3,'ModuleInstallation',19,'CMDBChangeOpCreate'),(278,3,'ModuleInstallation',20,'CMDBChangeOpCreate'),(279,3,'ModuleInstallation',21,'CMDBChangeOpCreate'),(280,3,'ModuleInstallation',22,'CMDBChangeOpCreate'),(281,3,'ModuleInstallation',23,'CMDBChangeOpCreate'),(282,3,'ModuleInstallation',24,'CMDBChangeOpCreate'),(283,3,'ModuleInstallation',25,'CMDBChangeOpCreate'),(284,4,'Person',18,'CMDBChangeOpCreate'),(285,5,'Person',18,'CMDBChangeOpSetAttributeScalar'),(286,6,'Person',19,'CMDBChangeOpCreate'),(287,7,'Person',19,'CMDBChangeOpSetAttributeScalar'),(288,8,'Person',19,'CMDBChangeOpSetAttributeScalar');
/*!40000 ALTER TABLE `priv_changeop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_attachment_added`
--

DROP TABLE IF EXISTS `priv_changeop_attachment_added`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_attachment_added` (
  `id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT '0',
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `attachment_id` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_attachment_added`
--

LOCK TABLES `priv_changeop_attachment_added` WRITE;
/*!40000 ALTER TABLE `priv_changeop_attachment_added` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_attachment_added` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_attachment_removed`
--

DROP TABLE IF EXISTS `priv_changeop_attachment_removed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_attachment_removed` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_attachment_removed`
--

LOCK TABLES `priv_changeop_attachment_removed` WRITE;
/*!40000 ALTER TABLE `priv_changeop_attachment_removed` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_attachment_removed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_create`
--

DROP TABLE IF EXISTS `priv_changeop_create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_create` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_create`
--

LOCK TABLES `priv_changeop_create` WRITE;
/*!40000 ALTER TABLE `priv_changeop_create` DISABLE KEYS */;
INSERT INTO `priv_changeop_create` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(51),(53),(54),(60),(61),(62),(63),(66),(69),(72),(75),(78),(81),(84),(87),(90),(94),(96),(99),(102),(106),(111),(112),(113),(116),(118),(120),(122),(123),(124),(125),(126),(129),(132),(135),(138),(140),(141),(142),(144),(146),(148),(150),(152),(154),(156),(159),(162),(164),(166),(168),(170),(172),(175),(178),(181),(184),(189),(192),(193),(195),(197),(199),(201),(203),(205),(207),(209),(211),(213),(215),(217),(219),(221),(223),(225),(227),(229),(231),(233),(234),(235),(236),(238),(240),(244),(248),(252),(254),(256),(258),(259),(260),(261),(262),(263),(264),(265),(266),(267),(268),(269),(270),(271),(272),(273),(274),(275),(276),(277),(278),(279),(280),(281),(282),(283),(284),(286);
/*!40000 ALTER TABLE `priv_changeop_create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_delete`
--

DROP TABLE IF EXISTS `priv_changeop_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_delete` (
  `id` int(11) NOT NULL,
  `fclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_delete`
--

LOCK TABLES `priv_changeop_delete` WRITE;
/*!40000 ALTER TABLE `priv_changeop_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_links`
--

DROP TABLE IF EXISTS `priv_changeop_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_links` (
  `id` int(11) NOT NULL,
  `item_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `item_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_links`
--

LOCK TABLES `priv_changeop_links` WRITE;
/*!40000 ALTER TABLE `priv_changeop_links` DISABLE KEYS */;
INSERT INTO `priv_changeop_links` VALUES (16,'User',1),(50,'Person',11),(52,'Person',12),(64,'Person',9),(65,'Team',17),(67,'Person',8),(68,'Team',17),(70,'Person',9),(71,'Team',15),(73,'Person',10),(74,'Team',15),(76,'Person',13),(77,'Team',15),(79,'Person',5),(80,'Team',14),(82,'Person',2),(83,'Team',14),(85,'Person',6),(86,'Team',16),(88,'Person',7),(89,'Team',16),(91,'Server',1),(92,'Server',1),(93,'Server',1),(95,'Server',2),(97,'Server',3),(98,'Server',3),(100,'Server',4),(101,'Server',4),(103,'NetworkDevice',5),(104,'NetworkDevice',5),(105,'NetworkDevice',5),(107,'NetworkDevice',6),(108,'NetworkDevice',6),(109,'NetworkDevice',6),(110,'NetworkDevice',6),(114,'DBServer',7),(115,'DBServer',7),(117,'DatabaseSchema',8),(119,'WebServer',9),(121,'WebApplication',10),(127,'FunctionalCI',8),(128,'ApplicationSolution',12),(130,'FunctionalCI',4),(131,'ApplicationSolution',13),(133,'FunctionalCI',11),(134,'ApplicationSolution',14),(136,'FunctionalCI',12),(137,'ApplicationSolution',14),(139,'Rack',15),(143,'Hypervisor',18),(145,'Hypervisor',19),(147,'Hypervisor',20),(149,'VirtualMachine',21),(151,'VirtualMachine',22),(153,'VirtualMachine',23),(155,'VirtualMachine',24),(157,'DBServer',25),(158,'DBServer',25),(160,'DBServer',26),(161,'DBServer',26),(163,'DatabaseSchema',27),(165,'DatabaseSchema',28),(167,'WebServer',29),(169,'WebApplication',30),(171,'WebApplication',31),(173,'FunctionalCI',28),(174,'ApplicationSolution',11),(176,'FunctionalCI',31),(177,'ApplicationSolution',11),(179,'FunctionalCI',30),(180,'ApplicationSolution',12),(182,'FunctionalCI',27),(183,'ApplicationSolution',13),(185,'FunctionalCI',29),(186,'ApplicationSolution',13),(187,'ApplicationSolution',13),(190,'Organization',3),(194,'Service',1),(196,'Service',2),(198,'Service',3),(200,'ServiceSubcategory',1),(202,'ServiceSubcategory',2),(204,'ServiceSubcategory',3),(206,'ServiceSubcategory',4),(208,'ServiceSubcategory',5),(210,'ServiceSubcategory',6),(212,'ServiceSubcategory',7),(214,'ServiceSubcategory',8),(216,'ServiceSubcategory',9),(218,'ServiceSubcategory',10),(220,'ServiceSubcategory',11),(222,'ServiceSubcategory',12),(224,'ServiceSubcategory',13),(226,'ServiceSubcategory',14),(228,'ServiceSubcategory',15),(230,'ServiceSubcategory',16),(232,'ServiceSubcategory',17),(237,'SLT',1),(239,'SLT',2),(241,'Service',1),(242,'CustomerContract',1),(243,'CustomerContract',1),(245,'Service',2),(246,'CustomerContract',1),(247,'CustomerContract',1),(249,'Service',3),(250,'CustomerContract',1),(251,'CustomerContract',1),(253,'Contact',8),(255,'Contact',17),(257,'Contact',15);
/*!40000 ALTER TABLE `priv_changeop_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_links_addremove`
--

DROP TABLE IF EXISTS `priv_changeop_links_addremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_links_addremove` (
  `id` int(11) NOT NULL,
  `type` enum('added','removed') COLLATE utf8_unicode_ci DEFAULT 'added',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_links_addremove`
--

LOCK TABLES `priv_changeop_links_addremove` WRITE;
/*!40000 ALTER TABLE `priv_changeop_links_addremove` DISABLE KEYS */;
INSERT INTO `priv_changeop_links_addremove` VALUES (16,'added'),(50,'added'),(52,'added'),(64,'added'),(65,'added'),(67,'added'),(68,'added'),(70,'added'),(71,'added'),(73,'added'),(74,'added'),(76,'added'),(77,'added'),(79,'added'),(80,'added'),(82,'added'),(83,'added'),(85,'added'),(86,'added'),(88,'added'),(89,'added'),(91,'added'),(92,'added'),(93,'added'),(95,'added'),(97,'added'),(98,'added'),(100,'added'),(101,'added'),(103,'added'),(104,'added'),(105,'added'),(107,'added'),(108,'added'),(109,'added'),(110,'added'),(114,'added'),(115,'added'),(117,'added'),(119,'added'),(121,'added'),(127,'added'),(128,'added'),(130,'added'),(131,'added'),(133,'added'),(134,'added'),(136,'added'),(137,'added'),(139,'added'),(143,'added'),(145,'added'),(147,'added'),(149,'added'),(151,'added'),(153,'added'),(155,'added'),(157,'added'),(158,'added'),(160,'added'),(161,'added'),(163,'added'),(165,'added'),(167,'added'),(169,'added'),(171,'added'),(173,'added'),(174,'added'),(176,'added'),(177,'added'),(179,'added'),(180,'added'),(182,'added'),(183,'added'),(186,'added'),(187,'removed'),(190,'added'),(194,'added'),(196,'added'),(198,'added'),(200,'added'),(202,'added'),(204,'added'),(206,'added'),(208,'added'),(210,'added'),(212,'added'),(214,'added'),(216,'added'),(218,'added'),(220,'added'),(222,'added'),(224,'added'),(226,'added'),(228,'added'),(230,'added'),(232,'added'),(237,'added'),(239,'added'),(241,'added'),(242,'added'),(243,'added'),(245,'added'),(246,'added'),(247,'added'),(249,'added'),(250,'added'),(251,'added'),(253,'added'),(255,'added'),(257,'added');
/*!40000 ALTER TABLE `priv_changeop_links_addremove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_links_tune`
--

DROP TABLE IF EXISTS `priv_changeop_links_tune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_links_tune` (
  `id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_links_tune`
--

LOCK TABLES `priv_changeop_links_tune` WRITE;
/*!40000 ALTER TABLE `priv_changeop_links_tune` DISABLE KEYS */;
INSERT INTO `priv_changeop_links_tune` VALUES (185,2);
/*!40000 ALTER TABLE `priv_changeop_links_tune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_plugin`
--

DROP TABLE IF EXISTS `priv_changeop_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_plugin` (
  `id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_plugin`
--

LOCK TABLES `priv_changeop_plugin` WRITE;
/*!40000 ALTER TABLE `priv_changeop_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt`
--

DROP TABLE IF EXISTS `priv_changeop_setatt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt` (
  `id` int(11) NOT NULL,
  `attcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt`
--

LOCK TABLES `priv_changeop_setatt` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt` DISABLE KEYS */;
INSERT INTO `priv_changeop_setatt` VALUES (16,'user_list'),(50,'person_list'),(52,'person_list'),(55,'name'),(56,'org_id'),(57,'email'),(58,'picture'),(59,'first_name'),(64,'persons_list'),(65,'team_list'),(67,'persons_list'),(68,'team_list'),(70,'persons_list'),(71,'team_list'),(73,'persons_list'),(74,'team_list'),(76,'persons_list'),(77,'team_list'),(79,'persons_list'),(80,'team_list'),(82,'persons_list'),(83,'team_list'),(85,'persons_list'),(86,'team_list'),(88,'persons_list'),(89,'team_list'),(91,'physicaldevice_list'),(92,'physicaldevices_list'),(93,'physicaldevices_list'),(95,'physicaldevice_list'),(97,'physicaldevices_list'),(98,'physicaldevices_list'),(100,'physicaldevices_list'),(101,'physicaldevices_list'),(103,'physicaldevice_list'),(104,'physicaldevices_list'),(105,'networkdevicesdevices_list'),(107,'physicaldevice_list'),(108,'physicaldevices_list'),(109,'physicaldevices_list'),(110,'networkdevicesdevices_list'),(114,'softwares_list'),(115,'softwareinstance_list'),(117,'dbschema_list'),(119,'softwares_list'),(121,'webapp_list'),(127,'functionalcis_list'),(128,'applicationsolution_list'),(130,'functionalcis_list'),(131,'applicationsolution_list'),(133,'functionalcis_list'),(134,'applicationsolution_list'),(136,'functionalcis_list'),(137,'applicationsolution_list'),(139,'physicaldevice_list'),(143,'hypervisor_list'),(145,'hypervisor_list'),(147,'hypervisor_list'),(149,'virtualmachine_list'),(151,'virtualmachine_list'),(153,'virtualmachine_list'),(155,'virtualmachine_list'),(157,'softwares_list'),(158,'softwareinstance_list'),(160,'softwares_list'),(161,'softwareinstance_list'),(163,'dbschema_list'),(165,'dbschema_list'),(167,'softwares_list'),(169,'webapp_list'),(171,'webapp_list'),(173,'functionalcis_list'),(174,'applicationsolution_list'),(176,'functionalcis_list'),(177,'applicationsolution_list'),(179,'functionalcis_list'),(180,'applicationsolution_list'),(182,'functionalcis_list'),(183,'applicationsolution_list'),(185,'functionalcis_list'),(186,'applicationsolution_list'),(187,'applicationsolution_list'),(188,'functionalci_id'),(190,'customers_list'),(191,'deliverymodel_id'),(194,'services_list'),(196,'services_list'),(198,'services_list'),(200,'servicesubcategories_list'),(202,'servicesubcategories_list'),(204,'servicesubcategories_list'),(206,'servicesubcategories_list'),(208,'servicesubcategories_list'),(210,'servicesubcategories_list'),(212,'servicesubcategories_list'),(214,'servicesubcategories_list'),(216,'servicesubcategories_list'),(218,'servicesubcategories_list'),(220,'servicesubcategories_list'),(222,'servicesubcategories_list'),(224,'servicesubcategories_list'),(226,'servicesubcategories_list'),(228,'servicesubcategories_list'),(230,'servicesubcategories_list'),(232,'servicesubcategories_list'),(237,'slts_list'),(239,'slts_list'),(241,'services_list'),(242,'customercontracts_list'),(243,'customercontracts_list'),(245,'services_list'),(246,'customercontracts_list'),(247,'customercontracts_list'),(249,'services_list'),(250,'customercontracts_list'),(251,'customercontracts_list'),(253,'contacts_list'),(255,'contacts_list'),(257,'contacts_list'),(285,'name'),(287,'name'),(288,'name');
/*!40000 ALTER TABLE `priv_changeop_setatt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_custfields`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_custfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_custfields` (
  `id` int(11) NOT NULL,
  `prevdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_custfields`
--

LOCK TABLES `priv_changeop_setatt_custfields` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_custfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_custfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_data`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_data` (
  `id` int(11) NOT NULL,
  `prevdata_data` longblob,
  `prevdata_mimetype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prevdata_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_data`
--

LOCK TABLES `priv_changeop_setatt_data` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_data` DISABLE KEYS */;
INSERT INTO `priv_changeop_setatt_data` VALUES (58,'�\��\�\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\n�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�̸\�\�83�\�C��Op8\�ր,@�@;�\rki:e\�\�(@o\�c�?\Z\��7��\�.T\�\"\��n$\��a��\�B5�T`(�\�8�(���\�:GȞR���g��w�w�-\r�u�H��\�\�]�6��RCq�ģl{d$g���\0=�45Է�<Ya�~W��4�q\�ueEgx\�#�\��\0\�\\���lX5�\�wR�q��\��+\��[\�\�(�vV�\n:�\��y��$���\��UF\�\�\�<�}I��\0p�Vw6�$w*\�\�q\�?�F]׀H�8�\�M�k\ZU\����\�n�S\�\'޸�F	\�gx$h�ia\�#�4߳q#\�3\�*];\�p\��=H�\�$�\�\�\�C޵\�Q�\�<����\�\0IJ���\��g��\�V.�.�\��e^N3ڊ\0�N	\�]��\�\��H\�m�\�\�\�\�v�k`��\�^�\�����Z#ߙDgc`��s����\��\�\�\r�%�G\'fE\�\0�?�vh2\�?g�͊��|�\�\������k[//|f���w\'\'��\�5\��p���E \�dtOZ\0�B�\�\��ǺFi?��Z\�F�IZD�>����\�֥�r\�@�\�)B�\�|�\�\�\��\�z\\�d�F���ZO\�\�^��SRɠ�|G�͠_�\�壵E?*�1���oV���\�i\����s���ʽ�\�\�\�.��k�A\�^3\'�k�C����@\�\�`ߐ1����=(�\�&S\�\�㞟�\\�\�J��3�y\�t\�M�ZE<l\�v��\�L�U�4\�e�p�9\� ΀9�\�J\�\�\�<\�z+��\�8�?1/��\�N���\r\�Ӥ\�/c�FT.~�t\�O��;m\\i\�ŦC��X\�B;{r+μ?;Aw@۳���{W�Ykױ	>ҒFd\0��H\� ��h��\�>ɧ[J\�\�w$�Ǻ\�X/#��\�\�o�f9g�\0G\�$C�����J\�<5a�{��f��cV!\\\�\�]�Z��\�v\�!;��\0����F���z3T���2\�\�\�\�l�\�q�\�\�\��Ǒ�<��+\�\�\�\�w�BGj���l�Kqwg�\'ڭ��ďn�G��d�c϶}�\�;\�.�4��z2� \�MO_\�t\�ۨ_[[�Y�?\Z\�>x}tK|��/8�\�P}Eq�<\�u\rG\�ڥ豗Q{)p\�\�\0F�?\�gNJ\0\�<y\�}S��\�I��yې~l�׏i\�\�F\'�w!\�\�uBd�1���\�Aֵ�h\�\�-�^X��\Z�\�}F;�\rp�,�x��?3\�2w\'h\��\�\�4�\�\�\�<gheݟ�u�\0=�v\�H��V\�\�H\�\\߆ѭ��\�;\�䯜�\�����\�B�$eN\�({[fiv�Fs���\�Ei\�1H�}ܯ*r}=:Q@.xD\�/�;@�\�\�J�+\�O�� ؄\�:�\�?Oּ^\�3���;rG5\�ɡ.�-mmQUg#\�w\��4\�Z7٭�����2+G��\�\�I�ꑮ�m\n�\�\�p�\'��^�Dt\�x����)\rl:\�q\�kú����LLQ�#�\�\�V2%\�e�\�#\�\�8X��\�@f��\�\��+��$U�J\�o��[�\�\�\Z\0\�H��D�}\�d\��5���\�4ψV\� A�l�\�΄����\�#\�6C���\��I&\�\�\����\�y�\�OC����cm)ԭ[͓�\���\\�Ҁ=7\�WZu��=\�{\�!Uv\'+\�oJ��e�\�p̡��\�2>l�\0Uw�/֤Լ�\�(x\�@�zs޼�G�K�\\HT��W\�h\�<8\��\\�qI�aYf���e��\�޺��rI\�`3\��u\�x\"\�K=\"h\�ds\�7\���Z\�\��\n��r�=hB45U@\� rp}�\�r��z\�\�n(��\�\��\rv^\�$���D>dʘTc�9�q�\��\�L֖�p������\r_\�ד~��\�X\�\�?\�5��\�\�K�/\�;���) \�\�7Ө�+�\�n�\�I+�\�+\�f�Hg�Լ�VG(�s�<P�h�!M\�<c�kSU�tӧ�\�\�U\�)Xڞ�q�\�X\0�\�9\r��~�sK\� �\0�+P\Zm\�`�	wgg,\�s\�}��>\�ۑ\\\'�^�R\�m�,���=\�r\�)fy\��������ݠ��@��cX�\�ea4\��c�j\0�_\�q��R}�4\�B\�s\�q�3\�e�;\�O\�w��j9v\�8��k��\��W�w�D�\\g��\��U\�E�\�al�F\0Nr@4j0\��\�gf�t�\�[\�V5dpW�\'�_z\��3F�\��T�9\�\��{\�\��w���zq\�@\�\\\�[$�n	8d�\���\�\�PS\0�ފ\0�	�cMF\�s\�қ!朑e�^hi��F\�8=�j�\�ٻdV��6I�\��q��\�^cnJ\�>x��\��\�2�|��u\��8\��\�\�!H�H��y��>\�Fn�<�y6嶓�\�z�\�Wg�\�\�ykŴ�,2(dt9B\r]$�\�>�񞵤����[yS�.�*x\�\�8?�Im�j�\��\�iч+:�ܒ\0�`��w�l��^۲?\\\Z\��Y\�yi*\�2\�\�,x�4�m\�\�A��TE�b}�MOp\�H\0�\�\'�μ\�\�>7��ǌM�щ���\�(\�9�\�<\Z\�-�x5.\�\�[wROo�\0i�ט�[\'�9\�=x��!E.H�\�7u\�\�7�x_\'\�%�\�g��\0ִ\'0$,O�\�\�&�.*H\�X��4SlbVc� E |\�d�\�s�\0\�\�E\0|��\�8\���X�jWB>n�JF?xg<� c��p9�\�9`��\�1In	v_\�\�O\�\\n��\0\��|M\�|�݇\��� �w<��C\��ӡ��|/�C�1���\"�\�<��VϷ�|g\�Fs�\�Z��\ri 1�Q\�Jg�\�Ҁ>\�b\�2c!�Q\�Z\�:l�\�^K8\�$�\��~g��\�l\�|w�\�p�\�oݑ&)��\�ӭz�>/\�2��w>1%�\���\0�\0g|[�Es�\�ɫ\�\Z�G��vHd\�\��N�ھv\���WE�[�\�db\Z\"N3Ђ��^��[k:B\�\�7���Ђ:��5�G\�].}#ƚͥ\���\Zu`8es�v8=(�\�~%�;u;vB\��l\'�\�O��A�\�\�\�;�9Ƿ�\�\��\0_�\0�_9D���a\�ֺ\�\0kϥ_Y܋I�nF�{g�\0{\�\�\�I\��\�F9��\0\�\Z*�\�M�]����@\�=�4P\��@(	\��ڨ��<�rS��q��R\�1@\�|�[�\0�\�\�|q���~W\'\�4\�\�%�~y�	w�yX\�j\��P�g�z͖C\�sO�]�\0�hB\�R\�i�\�jk\rrkY��i@q�\�\�ͻ\�\��V<�\�Vi��\�I\�4\�?|o-��_M��:~�v���f\�F=3�~^���F�H��\�i�=�%G袼\�\��\�ʲBJH�2�B �V\�\�ox��X.\�4+��YP\� \�#��2���\'>]\�ȼ�|\��wer50r\�\�!\�@�\����4ۢxW1�2Y==?�\�\Zu\�\�7QOãd{�\�\�@�\�','image/jpeg','jjrousseau.jpg');
/*!40000 ALTER TABLE `priv_changeop_setatt_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_encrypted`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_encrypted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_encrypted` (
  `id` int(11) NOT NULL,
  `data` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_encrypted`
--

LOCK TABLES `priv_changeop_setatt_encrypted` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_encrypted` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_encrypted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_html`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_html`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_html` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_html`
--

LOCK TABLES `priv_changeop_setatt_html` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_html` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_html` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_log`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_log` (
  `id` int(11) NOT NULL,
  `lastentry` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_log`
--

LOCK TABLES `priv_changeop_setatt_log` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_longtext`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_longtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_longtext` (
  `id` int(11) NOT NULL,
  `prevdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_longtext`
--

LOCK TABLES `priv_changeop_setatt_longtext` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_longtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_longtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_pwd`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_pwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_pwd` (
  `id` int(11) NOT NULL,
  `prev_pwd_hash` tinyblob,
  `prev_pwd_salt` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_pwd`
--

LOCK TABLES `priv_changeop_setatt_pwd` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_pwd` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_pwd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_scalar`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_scalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_scalar` (
  `id` int(11) NOT NULL,
  `oldvalue` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `newvalue` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_scalar`
--

LOCK TABLES `priv_changeop_setatt_scalar` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_scalar` DISABLE KEYS */;
INSERT INTO `priv_changeop_setatt_scalar` VALUES (55,'Rousseau','Kahlo'),(56,'2','3'),(57,'rousseau@it.com','frida.kahlo@demo.com'),(59,'Jean-Jacques','Frida'),(188,'4','29'),(191,'0','1'),(285,'kacsa','kutya'),(287,'adsasdsad','dsadsasadadsasdsad'),(288,'dsadsasadadsasdsad','dsa');
/*!40000 ALTER TABLE `priv_changeop_setatt_scalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_text`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_text` (
  `id` int(11) NOT NULL,
  `prevdata` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_text`
--

LOCK TABLES `priv_changeop_setatt_text` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_changeop_setatt_url`
--

DROP TABLE IF EXISTS `priv_changeop_setatt_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_changeop_setatt_url` (
  `id` int(11) NOT NULL,
  `oldvalue` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  `newvalue` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_changeop_setatt_url`
--

LOCK TABLES `priv_changeop_setatt_url` WRITE;
/*!40000 ALTER TABLE `priv_changeop_setatt_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_changeop_setatt_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_db_properties`
--

DROP TABLE IF EXISTS `priv_db_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_db_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `change_date` datetime DEFAULT NULL,
  `change_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_db_properties`
--

LOCK TABLES `priv_db_properties` WRITE;
/*!40000 ALTER TABLE `priv_db_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_db_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event`
--

DROP TABLE IF EXISTS `priv_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `userinfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Event',
  PRIMARY KEY (`id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event`
--

LOCK TABLES `priv_event` WRITE;
/*!40000 ALTER TABLE `priv_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_email`
--

DROP TABLE IF EXISTS `priv_event_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `from` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci,
  `body` longtext COLLATE utf8_unicode_ci,
  `attachments` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_email`
--

LOCK TABLES `priv_event_email` WRITE;
/*!40000 ALTER TABLE `priv_event_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_issue`
--

DROP TABLE IF EXISTS `priv_event_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `impact` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `page` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `arguments_post` longtext COLLATE utf8_unicode_ci,
  `arguments_get` longtext COLLATE utf8_unicode_ci,
  `callstack` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_issue`
--

LOCK TABLES `priv_event_issue` WRITE;
/*!40000 ALTER TABLE `priv_event_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_loginusage`
--

DROP TABLE IF EXISTS `priv_event_loginusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_loginusage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_loginusage`
--

LOCK TABLES `priv_event_loginusage` WRITE;
/*!40000 ALTER TABLE `priv_event_loginusage` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_loginusage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_notification`
--

DROP TABLE IF EXISTS `priv_event_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_id` int(11) DEFAULT '0',
  `action_id` int(11) DEFAULT '0',
  `object_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `trigger_id` (`trigger_id`),
  KEY `action_id` (`action_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_notification`
--

LOCK TABLES `priv_event_notification` WRITE;
/*!40000 ALTER TABLE `priv_event_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_restservice`
--

DROP TABLE IF EXISTS `priv_event_restservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_restservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `json_input` text COLLATE utf8_unicode_ci,
  `code` int(11) DEFAULT '0',
  `json_output` text COLLATE utf8_unicode_ci,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_restservice`
--

LOCK TABLES `priv_event_restservice` WRITE;
/*!40000 ALTER TABLE `priv_event_restservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_restservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_event_webservice`
--

DROP TABLE IF EXISTS `priv_event_webservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_event_webservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verb` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `result` tinyint(1) DEFAULT '0',
  `log_info` text COLLATE utf8_unicode_ci,
  `log_warning` text COLLATE utf8_unicode_ci,
  `log_error` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_event_webservice`
--

LOCK TABLES `priv_event_webservice` WRITE;
/*!40000 ALTER TABLE `priv_event_webservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_event_webservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_internaluser`
--

DROP TABLE IF EXISTS `priv_internaluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_internaluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reset_pwd_token_hash` tinyblob,
  `reset_pwd_token_salt` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_internaluser`
--

LOCK TABLES `priv_internaluser` WRITE;
/*!40000 ALTER TABLE `priv_internaluser` DISABLE KEYS */;
INSERT INTO `priv_internaluser` VALUES (1,'','');
/*!40000 ALTER TABLE `priv_internaluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_link_action_trigger`
--

DROP TABLE IF EXISTS `priv_link_action_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_link_action_trigger` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT '0',
  `trigger_id` int(11) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`link_id`),
  KEY `action_id` (`action_id`),
  KEY `trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_link_action_trigger`
--

LOCK TABLES `priv_link_action_trigger` WRITE;
/*!40000 ALTER TABLE `priv_link_action_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_link_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_module_install`
--

DROP TABLE IF EXISTS `priv_module_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_module_install` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `installed` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_module_install`
--

LOCK TABLES `priv_module_install` WRITE;
/*!40000 ALTER TABLE `priv_module_install` DISABLE KEYS */;
INSERT INTO `priv_module_install` VALUES (1,'datamodel','2.3.0','2016-10-28 12:02:57','{\"source_dir\":\"datamodels\\/2.x\\/\"}',0),(2,'iTop','2.3.1.2832','2016-10-28 12:02:57','Done by the setup program\nBuilt on 2016-07-08 15:33:14',0),(3,'authent-external','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)',2),(4,'authent-ldap','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)',2),(5,'authent-local','2.2.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nVisible (during the setup)',2),(6,'itop-backup','2.2.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)',2),(7,'itop-config','1.0.2','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)',2),(8,'itop-profiles-itil','2.3.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)',2),(9,'itop-sla-computation','1.0.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)',2),(10,'itop-tickets','2.3.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)\nDepends on module: itop-config-mgmt/2.2.0',2),(11,'itop-welcome-itil','2.2.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nHidden (selected automatically)',2),(12,'itop-config-mgmt','2.3.0','2016-10-28 12:02:57','Done by the setup program\nMandatory\nVisible (during the setup)',2),(13,'itop-attachments','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)',2),(14,'itop-datacenter-mgmt','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0',2),(15,'itop-endusers-devices','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0',2),(16,'itop-storage-mgmt','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0',2),(17,'itop-virtualization-mgmt','2.2.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0',2),(18,'itop-bridge-virtualization-storage','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nHidden (selected automatically)\nDepends on module: itop-storage-mgmt/2.2.0\nDepends on module: itop-virtualization-mgmt/2.2.0',2),(19,'itop-service-mgmt','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0\nDepends on module: itop-tickets/2.0.0',2),(20,'itop-request-mgmt-itil','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0\nDepends on module: itop-tickets/2.3.0',2),(21,'itop-incident-mgmt-itil','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0\nDepends on module: itop-tickets/2.3.0\nDepends on module: itop-profiles-itil/1.0.0',2),(22,'itop-portal','1.0.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-portal-base/1.0.0',2),(23,'itop-portal-base','1.0.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)',2),(24,'itop-full-itil','1.0.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nHidden (selected automatically)\nDepends on module: itop-request-mgmt-itil/2.3.0\nDepends on module: itop-incident-mgmt-itil/2.3.0',2),(25,'itop-change-mgmt-itil','2.3.0','2016-10-28 12:02:57','Done by the setup program\nOptional\nVisible (during the setup)\nDepends on module: itop-config-mgmt/2.2.0\nDepends on module: itop-tickets/2.0.0',2);
/*!40000 ALTER TABLE `priv_module_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_ownership_token`
--

DROP TABLE IF EXISTS `priv_ownership_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_ownership_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acquired` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `obj_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `obj_key` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_ownership_token`
--

LOCK TABLES `priv_ownership_token` WRITE;
/*!40000 ALTER TABLE `priv_ownership_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_ownership_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_query`
--

DROP TABLE IF EXISTS `priv_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `fields` text COLLATE utf8_unicode_ci,
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Query',
  PRIMARY KEY (`id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_query`
--

LOCK TABLES `priv_query` WRITE;
/*!40000 ALTER TABLE `priv_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_query_oql`
--

DROP TABLE IF EXISTS `priv_query_oql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_query_oql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oql` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_query_oql`
--

LOCK TABLES `priv_query_oql` WRITE;
/*!40000 ALTER TABLE `priv_query_oql` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_query_oql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_shortcut`
--

DROP TABLE IF EXISTS `priv_shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_shortcut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `context` text COLLATE utf8_unicode_ci,
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Shortcut',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_shortcut`
--

LOCK TABLES `priv_shortcut` WRITE;
/*!40000 ALTER TABLE `priv_shortcut` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_shortcut_oql`
--

DROP TABLE IF EXISTS `priv_shortcut_oql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_shortcut_oql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oql` text COLLATE utf8_unicode_ci,
  `auto_reload` enum('custom','none') COLLATE utf8_unicode_ci DEFAULT 'none',
  `auto_reload_sec` int(11) DEFAULT '60',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_shortcut_oql`
--

LOCK TABLES `priv_shortcut_oql` WRITE;
/*!40000 ALTER TABLE `priv_shortcut_oql` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_shortcut_oql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_att`
--

DROP TABLE IF EXISTS `priv_sync_att`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_att` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_source_id` int(11) DEFAULT '0',
  `attcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `update` tinyint(1) DEFAULT '1',
  `reconcile` tinyint(1) DEFAULT '0',
  `update_policy` enum('master_locked','master_unlocked','write_if_empty') COLLATE utf8_unicode_ci DEFAULT 'master_locked',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'SynchroAttribute',
  PRIMARY KEY (`id`),
  KEY `sync_source_id` (`sync_source_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_att`
--

LOCK TABLES `priv_sync_att` WRITE;
/*!40000 ALTER TABLE `priv_sync_att` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_att` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_att_extkey`
--

DROP TABLE IF EXISTS `priv_sync_att_extkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_att_extkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reconciliation_attcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_att_extkey`
--

LOCK TABLES `priv_sync_att_extkey` WRITE;
/*!40000 ALTER TABLE `priv_sync_att_extkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_att_extkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_att_linkset`
--

DROP TABLE IF EXISTS `priv_sync_att_linkset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_att_linkset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_separator` varchar(255) COLLATE utf8_unicode_ci DEFAULT '|',
  `attribute_separator` varchar(255) COLLATE utf8_unicode_ci DEFAULT ';',
  `value_separator` varchar(255) COLLATE utf8_unicode_ci DEFAULT ':',
  `attribute_qualifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT '''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_att_linkset`
--

LOCK TABLES `priv_sync_att_linkset` WRITE;
/*!40000 ALTER TABLE `priv_sync_att_linkset` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_att_linkset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_datasource`
--

DROP TABLE IF EXISTS `priv_sync_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_datasource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('implementation','obsolete','production') COLLATE utf8_unicode_ci DEFAULT 'implementation',
  `user_id` int(11) DEFAULT '0',
  `notify_contact_id` int(11) DEFAULT '0',
  `scope_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ApplicationSolution',
  `database_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `scope_restriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `full_load_periodicity` int(11) unsigned DEFAULT NULL,
  `reconciliation_policy` enum('use_attributes','use_primary_key') COLLATE utf8_unicode_ci DEFAULT 'use_attributes',
  `action_on_zero` enum('create','error') COLLATE utf8_unicode_ci DEFAULT 'create',
  `action_on_one` enum('error','update') COLLATE utf8_unicode_ci DEFAULT 'update',
  `action_on_multiple` enum('create','error','take_first') COLLATE utf8_unicode_ci DEFAULT 'error',
  `delete_policy` enum('delete','ignore','update','update_then_delete') COLLATE utf8_unicode_ci DEFAULT 'ignore',
  `delete_policy_update` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `delete_policy_retention` int(11) unsigned DEFAULT NULL,
  `user_delete_policy` enum('administrators','everybody','nobody') COLLATE utf8_unicode_ci DEFAULT 'nobody',
  `url_icon` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  `url_application` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `notify_contact_id` (`notify_contact_id`),
  KEY `scope_class` (`scope_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_datasource`
--

LOCK TABLES `priv_sync_datasource` WRITE;
/*!40000 ALTER TABLE `priv_sync_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_log`
--

DROP TABLE IF EXISTS `priv_sync_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_source_id` int(11) DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('completed','error','running') COLLATE utf8_unicode_ci DEFAULT 'running',
  `status_curr_job` int(11) DEFAULT '0',
  `status_curr_pos` int(11) DEFAULT '0',
  `stats_nb_replica_seen` int(11) DEFAULT '0',
  `stats_nb_replica_total` int(11) DEFAULT '0',
  `stats_nb_obj_deleted` int(11) DEFAULT '0',
  `stats_deleted_errors` int(11) DEFAULT '0',
  `stats_nb_obj_obsoleted` int(11) DEFAULT '0',
  `stats_nb_obj_obsoleted_errors` int(11) DEFAULT '0',
  `stats_nb_obj_created` int(11) DEFAULT '0',
  `stats_nb_obj_created_errors` int(11) DEFAULT '0',
  `stats_nb_obj_created_warnings` int(11) DEFAULT '0',
  `stats_nb_obj_updated` int(11) DEFAULT '0',
  `stats_nb_obj_updated_errors` int(11) DEFAULT '0',
  `stats_nb_obj_updated_warnings` int(11) DEFAULT '0',
  `stats_nb_obj_unchanged_warnings` int(11) DEFAULT '0',
  `stats_nb_replica_reconciled_errors` int(11) DEFAULT '0',
  `stats_nb_replica_disappeared_no_action` int(11) DEFAULT '0',
  `stats_nb_obj_new_updated` int(11) DEFAULT '0',
  `stats_nb_obj_new_updated_warnings` int(11) DEFAULT '0',
  `stats_nb_obj_new_unchanged` int(11) DEFAULT '0',
  `stats_nb_obj_new_unchanged_warnings` int(11) DEFAULT '0',
  `last_error` text COLLATE utf8_unicode_ci,
  `traces` longtext COLLATE utf8_unicode_ci,
  `memory_usage_peak` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sync_source_id` (`sync_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_log`
--

LOCK TABLES `priv_sync_log` WRITE;
/*!40000 ALTER TABLE `priv_sync_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_sync_replica`
--

DROP TABLE IF EXISTS `priv_sync_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_sync_replica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_source_id` int(11) DEFAULT '0',
  `dest_id` int(11) DEFAULT '0',
  `dest_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Organization',
  `status_last_seen` datetime DEFAULT NULL,
  `status` enum('modified','new','obsolete','orphan','synchronized') COLLATE utf8_unicode_ci DEFAULT 'new',
  `status_dest_creator` tinyint(1) DEFAULT '0',
  `status_last_error` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status_last_warning` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `info_creation_date` datetime DEFAULT NULL,
  `info_last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sync_source_id` (`sync_source_id`),
  KEY `dest_class` (`dest_class`),
  KEY `dest_class_dest_id` (`dest_class`,`dest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_sync_replica`
--

LOCK TABLES `priv_sync_replica` WRITE;
/*!40000 ALTER TABLE `priv_sync_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_sync_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger`
--

DROP TABLE IF EXISTS `priv_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `realclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Trigger',
  PRIMARY KEY (`id`),
  KEY `realclass` (`realclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger`
--

LOCK TABLES `priv_trigger` WRITE;
/*!40000 ALTER TABLE `priv_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onobjcreate`
--

DROP TABLE IF EXISTS `priv_trigger_onobjcreate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onobjcreate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onobjcreate`
--

LOCK TABLES `priv_trigger_onobjcreate` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onobjcreate` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onobjcreate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onobject`
--

DROP TABLE IF EXISTS `priv_trigger_onobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ApplicationSolution',
  `filter` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `target_class` (`target_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onobject`
--

LOCK TABLES `priv_trigger_onobject` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onportalupdate`
--

DROP TABLE IF EXISTS `priv_trigger_onportalupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onportalupdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onportalupdate`
--

LOCK TABLES `priv_trigger_onportalupdate` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onportalupdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onportalupdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onstatechange`
--

DROP TABLE IF EXISTS `priv_trigger_onstatechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onstatechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onstatechange`
--

LOCK TABLES `priv_trigger_onstatechange` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onstatechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onstatechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onstateenter`
--

DROP TABLE IF EXISTS `priv_trigger_onstateenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onstateenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onstateenter`
--

LOCK TABLES `priv_trigger_onstateenter` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onstateenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onstateenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_onstateleave`
--

DROP TABLE IF EXISTS `priv_trigger_onstateleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_onstateleave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_onstateleave`
--

LOCK TABLES `priv_trigger_onstateleave` WRITE;
/*!40000 ALTER TABLE `priv_trigger_onstateleave` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_onstateleave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_trigger_threshold`
--

DROP TABLE IF EXISTS `priv_trigger_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_trigger_threshold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stop_watch_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `threshold_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_trigger_threshold`
--

LOCK TABLES `priv_trigger_threshold` WRITE;
/*!40000 ALTER TABLE `priv_trigger_threshold` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_trigger_threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_urp_profiles`
--

DROP TABLE IF EXISTS `priv_urp_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_urp_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_urp_profiles`
--

LOCK TABLES `priv_urp_profiles` WRITE;
/*!40000 ALTER TABLE `priv_urp_profiles` DISABLE KEYS */;
INSERT INTO `priv_urp_profiles` VALUES (1,'Administrator','Has the rights on everything (bypassing any control)'),(2,'Portal user','Has the rights to access to the user portal. People having this profile will not be allowed to access the standard application, they will be automatically redirected to the user portal.'),(3,'Configuration Manager','Person in charge of the documentation of the managed CIs'),(4,'Service Desk Agent','Person in charge of creating incident reports'),(5,'Support Agent','Person analyzing and solving the current incidents'),(6,'Problem Manager','Person analyzing and solving the current problems'),(7,'Change Implementor','Person executing the changes'),(8,'Change Supervisor','Person responsible for the overall change execution'),(9,'Change Approver','Person who could be impacted by some changes'),(10,'Service Manager','Person responsible for the service delivered to the [internal] customer'),(11,'Document author','Any person who could contribute to documentation'),(12,'Portal power user','Users having this profile will have the rights to see all the tickets for a customer in the portal. Must be used in conjunction with other profiles (e.g. Portal User).');
/*!40000 ALTER TABLE `priv_urp_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_urp_userorg`
--

DROP TABLE IF EXISTS `priv_urp_userorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_urp_userorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0',
  `allowed_org_id` int(11) DEFAULT '0',
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `allowed_org_id` (`allowed_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_urp_userorg`
--

LOCK TABLES `priv_urp_userorg` WRITE;
/*!40000 ALTER TABLE `priv_urp_userorg` DISABLE KEYS */;
/*!40000 ALTER TABLE `priv_urp_userorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_urp_userprofile`
--

DROP TABLE IF EXISTS `priv_urp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_urp_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0',
  `profileid` int(11) DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `profileid` (`profileid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_urp_userprofile`
--

LOCK TABLES `priv_urp_userprofile` WRITE;
/*!40000 ALTER TABLE `priv_urp_userprofile` DISABLE KEYS */;
INSERT INTO `priv_urp_userprofile` VALUES (1,1,1,'By definition, the administrator must have the administrator profile');
/*!40000 ALTER TABLE `priv_urp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_user`
--

DROP TABLE IF EXISTS `priv_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) DEFAULT '0',
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'EN US',
  `status` enum('disabled','enabled') COLLATE utf8_unicode_ci DEFAULT 'enabled',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'User',
  PRIMARY KEY (`id`),
  KEY `contactid` (`contactid`),
  KEY `language` (`language`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_user`
--

LOCK TABLES `priv_user` WRITE;
/*!40000 ALTER TABLE `priv_user` DISABLE KEYS */;
INSERT INTO `priv_user` VALUES (1,1,'itop','EN US','enabled','UserLocal');
/*!40000 ALTER TABLE `priv_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priv_user_local`
--

DROP TABLE IF EXISTS `priv_user_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priv_user_local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password_hash` tinyblob,
  `password_salt` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priv_user_local`
--

LOCK TABLES `priv_user_local` WRITE;
/*!40000 ALTER TABLE `priv_user_local` DISABLE KEYS */;
INSERT INTO `priv_user_local` VALUES (1,'158cedd7937600e14b59faa80c58eb19538a7443ad6e37dd805bd59dab7baf51','.є`t\0\�sΰkH5d');
/*!40000 ALTER TABLE `priv_user_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providercontract`
--

DROP TABLE IF EXISTS `providercontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providercontract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sla` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `coverage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providercontract`
--

LOCK TABLES `providercontract` WRITE;
/*!40000 ALTER TABLE `providercontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `providercontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_u` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES (15,NULL);
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanswitch`
--

DROP TABLE IF EXISTS `sanswitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanswitch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanswitch`
--

LOCK TABLES `sanswitch` WRITE;
/*!40000 ALTER TABLE `sanswitch` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanswitch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osfamily_id` int(11) DEFAULT '0',
  `osversion_id` int(11) DEFAULT '0',
  `oslicence_id` int(11) DEFAULT '0',
  `cpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `osfamily_id` (`osfamily_id`),
  KEY `osversion_id` (`osversion_id`),
  KEY `oslicence_id` (`oslicence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,6,8,0,'',''),(2,0,0,0,'',''),(3,6,8,0,'',''),(4,6,8,0,'','');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `servicefamily_id` int(11) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('implementation','obsolete','production') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `servicefamily_id` (`servicefamily_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Computers and peripherals',2,1,'Ordering of new hardware (Desktop computer, laptop computer, monitor, mouse, keyboard...) and support in case of hardware failure.','production'),(2,'Software',2,1,'Management of computer software and applications. Installation, upgrade, troubleshooting and removal of software.','production'),(3,'Telecom and connectivity',2,1,'Ordering and configuration of new mobile phones, computer connectivity requests, cabling, etc...','production');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicefamily`
--

DROP TABLE IF EXISTS `servicefamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicefamily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicefamily`
--

LOCK TABLES `servicefamily` WRITE;
/*!40000 ALTER TABLE `servicefamily` DISABLE KEYS */;
INSERT INTO `servicefamily` VALUES (1,'IT Services');
/*!40000 ALTER TABLE `servicefamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicesubcategory`
--

DROP TABLE IF EXISTS `servicesubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicesubcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `service_id` int(11) DEFAULT '0',
  `request_type` enum('incident','service_request') COLLATE utf8_unicode_ci DEFAULT 'incident',
  `status` enum('implementation','obsolete','production') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicesubcategory`
--

LOCK TABLES `servicesubcategory` WRITE;
/*!40000 ALTER TABLE `servicesubcategory` DISABLE KEYS */;
INSERT INTO `servicesubcategory` VALUES (1,'Microsoft Office Support','Request assistance about MS Office software: Word, Excel, PowerPoint, Outlook, SharePoint.',2,'service_request','production'),(2,'Mobile phone/SIM locking','Request for locking the SIM when a mobile phone has been lost or stolen.',3,'service_request','production'),(3,'Mobile phone/SIM unlocking','Request for unlocking the SIM of your mobile phone.',3,'incident','production'),(4,'Network Troubleshooting','Ask for help troubleshooting a network related issue.',3,'incident','production'),(5,'New desktop ordering','Order a new desktop computer, for a new employee or for replacing an old system.',1,'service_request','production'),(6,'New DNS name','Request a new DNS name for a fixed system (Desktop computer or server).',3,'service_request','production'),(7,'New IP address','Request a new IP address for a fixed system (Desktop computer or server)',3,'service_request','production'),(8,'New laptop ordering','Order a new laptop computer, for a new mobile employee or for replacing an old laptop.',1,'service_request','production'),(9,'New LCD monitor ordering','Order a new LCD monitor, for a new employee or for replacing an old monitor.',1,'service_request','production'),(10,'New mobile phone ordering','Order a new mobile phone, for a new employee or for replacing a broken phone.',3,'service_request','production'),(11,'New peripheral','Order a peripheral: keyboard, mouse, personal printer...',1,'service_request','production'),(12,'Repair','Ask for assistance about a hardware failure.',1,'incident','production'),(13,'Software Installation / Upgrade','Ask for installing or upgrading software on a computer.',2,'service_request','production'),(14,'Software removal','Ask for removing software from your computer.',2,'service_request','production'),(15,'Troubleshooting','Ask for assistance about a software related issue.',2,'incident','production'),(16,'Troubleshooting','Ask for help troubleshooting a hardware issue.',1,'incident','production'),(17,'Windows installation/upgrade','Ask for installing or upgrading Windows on a computer.',2,'service_request','production');
/*!40000 ALTER TABLE `servicesubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `org_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
INSERT INTO `sla` VALUES (1,'Standard SLA','',3);
/*!40000 ALTER TABLE `sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slt`
--

DROP TABLE IF EXISTS `slt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `priority` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_type` enum('incident','service_request') COLLATE utf8_unicode_ci DEFAULT NULL,
  `metric` enum('tto','ttr') COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `unit` enum('hours','minutes') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slt`
--

LOCK TABLES `slt` WRITE;
/*!40000 ALTER TABLE `slt` DISABLE KEYS */;
INSERT INTO `slt` VALUES (1,'TTO priority high Incident 5mn','1','incident','tto',5,'minutes'),(2,'TTR priority high incident 15 mn','1','incident','ttr',15,'minutes');
/*!40000 ALTER TABLE `slt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` enum('DBServer','Middleware','OtherSoftware','PCSoftware','WebServer') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES (1,'MySql','Oracle','5.3','DBServer'),(2,'Oracle DB engine','Oracle','11i','DBServer');
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softwareinstance`
--

DROP TABLE IF EXISTS `softwareinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softwareinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionalci_id` int(11) DEFAULT '0',
  `software_id` int(11) DEFAULT '0',
  `softwarelicence_id` int(11) DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `functionalci_id` (`functionalci_id`),
  KEY `software_id` (`software_id`),
  KEY `softwarelicence_id` (`softwarelicence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softwareinstance`
--

LOCK TABLES `softwareinstance` WRITE;
/*!40000 ALTER TABLE `softwareinstance` DISABLE KEYS */;
INSERT INTO `softwareinstance` VALUES (7,2,1,0,'',NULL),(9,4,0,0,'','active'),(25,22,2,0,'',NULL),(26,23,1,0,'',NULL),(29,21,0,0,'',NULL);
/*!40000 ALTER TABLE `softwareinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softwarelicence`
--

DROP TABLE IF EXISTS `softwarelicence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softwarelicence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `software_id` (`software_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softwarelicence`
--

LOCK TABLES `softwarelicence` WRITE;
/*!40000 ALTER TABLE `softwarelicence` DISABLE KEYS */;
/*!40000 ALTER TABLE `softwarelicence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softwarepatch`
--

DROP TABLE IF EXISTS `softwarepatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softwarepatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `software_id` (`software_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softwarepatch`
--

LOCK TABLES `softwarepatch` WRITE;
/*!40000 ALTER TABLE `softwarepatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `softwarepatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagesystem`
--

DROP TABLE IF EXISTS `storagesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storagesystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagesystem`
--

LOCK TABLES `storagesystem` WRITE;
/*!40000 ALTER TABLE `storagesystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `storagesystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnet`
--

DROP TABLE IF EXISTS `subnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `subnet_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ip_mask` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnet`
--

LOCK TABLES `subnet` WRITE;
/*!40000 ALTER TABLE `subnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `subnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablet`
--

DROP TABLE IF EXISTS `tablet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablet`
--

LOCK TABLES `tablet` WRITE;
/*!40000 ALTER TABLE `tablet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tape`
--

DROP TABLE IF EXISTS `tape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tape` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tapelibrary_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tapelibrary_id` (`tapelibrary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tape`
--

LOCK TABLES `tape` WRITE;
/*!40000 ALTER TABLE `tape` DISABLE KEYS */;
/*!40000 ALTER TABLE `tape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tapelibrary`
--

DROP TABLE IF EXISTS `tapelibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tapelibrary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tapelibrary`
--

LOCK TABLES `tapelibrary` WRITE;
/*!40000 ALTER TABLE `tapelibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tapelibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (14),(15),(16),(17);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephonyci`
--

DROP TABLE IF EXISTS `telephonyci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephonyci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephonyci`
--

LOCK TABLES `telephonyci` WRITE;
/*!40000 ALTER TABLE `telephonyci` DISABLE KEYS */;
/*!40000 ALTER TABLE `telephonyci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operational_status` enum('closed','ongoing','resolved') COLLATE utf8_unicode_ci DEFAULT 'ongoing',
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `org_id` int(11) DEFAULT '0',
  `caller_id` int(11) DEFAULT '0',
  `team_id` int(11) DEFAULT '0',
  `agent_id` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `description_format` enum('text','html') COLLATE utf8_unicode_ci DEFAULT 'text',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `private_log` longtext COLLATE utf8_unicode_ci,
  `private_log_index` blob,
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Ticket',
  PRIMARY KEY (`id`),
  KEY `operational_status` (`operational_status`),
  KEY `org_id` (`org_id`),
  KEY `caller_id` (`caller_id`),
  KEY `team_id` (`team_id`),
  KEY `agent_id` (`agent_id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_incident`
--

DROP TABLE IF EXISTS `ticket_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_incident` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('assigned','closed','escalated_tto','escalated_ttr','new','pending','resolved') COLLATE utf8_unicode_ci DEFAULT 'new',
  `impact` enum('1','2','3') COLLATE utf8_unicode_ci DEFAULT '1',
  `priority` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '4',
  `urgency` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '4',
  `origin` enum('mail','monitoring','phone','portal') COLLATE utf8_unicode_ci DEFAULT 'phone',
  `service_id` int(11) DEFAULT '0',
  `servicesubcategory_id` int(11) DEFAULT '0',
  `escalation_flag` enum('no','yes') COLLATE utf8_unicode_ci DEFAULT 'no',
  `escalation_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `assignment_date` datetime DEFAULT NULL,
  `resolution_date` datetime DEFAULT NULL,
  `last_pending_date` datetime DEFAULT NULL,
  `cumulatedpending_timespent` int(11) unsigned DEFAULT NULL,
  `cumulatedpending_started` datetime DEFAULT NULL,
  `cumulatedpending_laststart` datetime DEFAULT NULL,
  `cumulatedpending_stopped` datetime DEFAULT NULL,
  `tto_timespent` int(11) unsigned DEFAULT NULL,
  `tto_started` datetime DEFAULT NULL,
  `tto_laststart` datetime DEFAULT NULL,
  `tto_stopped` datetime DEFAULT NULL,
  `tto_75_deadline` datetime DEFAULT NULL,
  `tto_75_passed` tinyint(1) unsigned DEFAULT NULL,
  `tto_75_triggered` tinyint(1) DEFAULT NULL,
  `tto_75_overrun` int(11) unsigned DEFAULT NULL,
  `tto_100_deadline` datetime DEFAULT NULL,
  `tto_100_passed` tinyint(1) unsigned DEFAULT NULL,
  `tto_100_triggered` tinyint(1) DEFAULT NULL,
  `tto_100_overrun` int(11) unsigned DEFAULT NULL,
  `ttr_timespent` int(11) unsigned DEFAULT NULL,
  `ttr_started` datetime DEFAULT NULL,
  `ttr_laststart` datetime DEFAULT NULL,
  `ttr_stopped` datetime DEFAULT NULL,
  `ttr_75_deadline` datetime DEFAULT NULL,
  `ttr_75_passed` tinyint(1) unsigned DEFAULT NULL,
  `ttr_75_triggered` tinyint(1) DEFAULT NULL,
  `ttr_75_overrun` int(11) unsigned DEFAULT NULL,
  `ttr_100_deadline` datetime DEFAULT NULL,
  `ttr_100_passed` tinyint(1) unsigned DEFAULT NULL,
  `ttr_100_triggered` tinyint(1) DEFAULT NULL,
  `ttr_100_overrun` int(11) unsigned DEFAULT NULL,
  `time_spent` int(11) unsigned DEFAULT NULL,
  `resolution_code` enum('assistance','bug fixed','hardware repair','other','software patch','system update','training') COLLATE utf8_unicode_ci DEFAULT 'assistance',
  `solution` text COLLATE utf8_unicode_ci,
  `pending_reason` text COLLATE utf8_unicode_ci,
  `parent_incident_id` int(11) DEFAULT '0',
  `parent_change_id` int(11) DEFAULT '0',
  `public_log` longtext COLLATE utf8_unicode_ci,
  `public_log_index` blob,
  `user_satisfaction` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '1',
  `user_commment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `servicesubcategory_id` (`servicesubcategory_id`),
  KEY `parent_incident_id` (`parent_incident_id`),
  KEY `parent_change_id` (`parent_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_incident`
--

LOCK TABLES `ticket_incident` WRITE;
/*!40000 ALTER TABLE `ticket_incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_request`
--

DROP TABLE IF EXISTS `ticket_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('approved','assigned','closed','escalated_tto','escalated_ttr','new','pending','rejected','resolved','waiting_for_approval') COLLATE utf8_unicode_ci DEFAULT 'new',
  `request_type` enum('service_request') COLLATE utf8_unicode_ci DEFAULT 'service_request',
  `impact` enum('1','2','3') COLLATE utf8_unicode_ci DEFAULT '1',
  `priority` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '4',
  `urgency` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '4',
  `origin` enum('mail','phone','portal') COLLATE utf8_unicode_ci DEFAULT 'phone',
  `approver_id` int(11) DEFAULT '0',
  `service_id` int(11) DEFAULT '0',
  `servicesubcategory_id` int(11) DEFAULT '0',
  `escalation_flag` enum('no','yes') COLLATE utf8_unicode_ci DEFAULT 'no',
  `escalation_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `assignment_date` datetime DEFAULT NULL,
  `resolution_date` datetime DEFAULT NULL,
  `last_pending_date` datetime DEFAULT NULL,
  `cumulatedpending_timespent` int(11) unsigned DEFAULT NULL,
  `cumulatedpending_started` datetime DEFAULT NULL,
  `cumulatedpending_laststart` datetime DEFAULT NULL,
  `cumulatedpending_stopped` datetime DEFAULT NULL,
  `tto_timespent` int(11) unsigned DEFAULT NULL,
  `tto_started` datetime DEFAULT NULL,
  `tto_laststart` datetime DEFAULT NULL,
  `tto_stopped` datetime DEFAULT NULL,
  `tto_75_deadline` datetime DEFAULT NULL,
  `tto_75_passed` tinyint(1) unsigned DEFAULT NULL,
  `tto_75_triggered` tinyint(1) DEFAULT NULL,
  `tto_75_overrun` int(11) unsigned DEFAULT NULL,
  `tto_100_deadline` datetime DEFAULT NULL,
  `tto_100_passed` tinyint(1) unsigned DEFAULT NULL,
  `tto_100_triggered` tinyint(1) DEFAULT NULL,
  `tto_100_overrun` int(11) unsigned DEFAULT NULL,
  `ttr_timespent` int(11) unsigned DEFAULT NULL,
  `ttr_started` datetime DEFAULT NULL,
  `ttr_laststart` datetime DEFAULT NULL,
  `ttr_stopped` datetime DEFAULT NULL,
  `ttr_75_deadline` datetime DEFAULT NULL,
  `ttr_75_passed` tinyint(1) unsigned DEFAULT NULL,
  `ttr_75_triggered` tinyint(1) DEFAULT NULL,
  `ttr_75_overrun` int(11) unsigned DEFAULT NULL,
  `ttr_100_deadline` datetime DEFAULT NULL,
  `ttr_100_passed` tinyint(1) unsigned DEFAULT NULL,
  `ttr_100_triggered` tinyint(1) DEFAULT NULL,
  `ttr_100_overrun` int(11) unsigned DEFAULT NULL,
  `time_spent` int(11) unsigned DEFAULT NULL,
  `resolution_code` enum('assistance','bug fixed','hardware repair','other','software patch','system update','training') COLLATE utf8_unicode_ci DEFAULT 'assistance',
  `solution` text COLLATE utf8_unicode_ci,
  `pending_reason` text COLLATE utf8_unicode_ci,
  `parent_request_id` int(11) DEFAULT '0',
  `parent_incident_id` int(11) DEFAULT '0',
  `parent_change_id` int(11) DEFAULT '0',
  `public_log` longtext COLLATE utf8_unicode_ci,
  `public_log_index` blob,
  `user_satisfaction` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '1',
  `user_commment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `approver_id` (`approver_id`),
  KEY `service_id` (`service_id`),
  KEY `servicesubcategory_id` (`servicesubcategory_id`),
  KEY `parent_request_id` (`parent_request_id`),
  KEY `parent_incident_id` (`parent_incident_id`),
  KEY `parent_change_id` (`parent_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_request`
--

LOCK TABLES `ticket_request` WRITE;
/*!40000 ALTER TABLE `ticket_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typology`
--

DROP TABLE IF EXISTS `typology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `finalclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Typology',
  PRIMARY KEY (`id`),
  KEY `finalclass` (`finalclass`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typology`
--

LOCK TABLES `typology` WRITE;
/*!40000 ALTER TABLE `typology` DISABLE KEYS */;
INSERT INTO `typology` VALUES (1,'Cisco','Brand'),(2,'HP','Brand'),(3,'Cisco 6500','Model'),(4,'DL380','Model'),(5,'Procurve 2450','Model'),(6,'Linux','OSFamily'),(7,'Windows','OSFamily'),(8,'Unbuntu 11.10','OSVersion'),(9,'Windows 2008 Server','OSVersion'),(10,'Router','NetworkDeviceType'),(11,'Switch','NetworkDeviceType'),(12,'Customer manager','ContactType'),(13,'Helpdesk','ContactType'),(14,'Manager','ContactType'),(15,'Support Agent','ContactType'),(16,'Support level1','ContactType'),(17,'Team leader','ContactType');
/*!40000 ALTER TABLE `typology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'webmaster@python.org','very-secret');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_ApplicationSolution`
--

DROP TABLE IF EXISTS `view_ApplicationSolution`;
/*!50001 DROP VIEW IF EXISTS `view_ApplicationSolution`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ApplicationSolution` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ApprovedChange`
--

DROP TABLE IF EXISTS `view_ApprovedChange`;
/*!50001 DROP VIEW IF EXISTS `view_ApprovedChange`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ApprovedChange` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `reason`,
 1 AS `requestor_id`,
 1 AS `requestor_email`,
 1 AS `creation_date`,
 1 AS `impact`,
 1 AS `supervisor_group_id`,
 1 AS `supervisor_group_name`,
 1 AS `supervisor_id`,
 1 AS `supervisor_email`,
 1 AS `manager_group_id`,
 1 AS `manager_group_name`,
 1 AS `manager_id`,
 1 AS `manager_email`,
 1 AS `outage`,
 1 AS `fallback`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `approval_date`,
 1 AS `approval_comment`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `requestor_id_friendlyname`,
 1 AS `supervisor_group_id_friendlyname`,
 1 AS `supervisor_id_friendlyname`,
 1 AS `manager_group_id_friendlyname`,
 1 AS `manager_id_friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `parent_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Attachment`
--

DROP TABLE IF EXISTS `view_Attachment`;
/*!50001 DROP VIEW IF EXISTS `view_Attachment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Attachment` AS SELECT 
 1 AS `id`,
 1 AS `expire`,
 1 AS `temp_id`,
 1 AS `item_class`,
 1 AS `item_id`,
 1 AS `item_org_id`,
 1 AS `contents`,
 1 AS `contents_data`,
 1 AS `contents_filename`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Brand`
--

DROP TABLE IF EXISTS `view_Brand`;
/*!50001 DROP VIEW IF EXISTS `view_Brand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Brand` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_BusinessProcess`
--

DROP TABLE IF EXISTS `view_BusinessProcess`;
/*!50001 DROP VIEW IF EXISTS `view_BusinessProcess`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_BusinessProcess` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Change`
--

DROP TABLE IF EXISTS `view_Change`;
/*!50001 DROP VIEW IF EXISTS `view_Change`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Change` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `reason`,
 1 AS `requestor_id`,
 1 AS `requestor_email`,
 1 AS `creation_date`,
 1 AS `impact`,
 1 AS `supervisor_group_id`,
 1 AS `supervisor_group_name`,
 1 AS `supervisor_id`,
 1 AS `supervisor_email`,
 1 AS `manager_group_id`,
 1 AS `manager_group_name`,
 1 AS `manager_id`,
 1 AS `manager_email`,
 1 AS `outage`,
 1 AS `fallback`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `requestor_id_friendlyname`,
 1 AS `supervisor_group_id_friendlyname`,
 1 AS `supervisor_id_friendlyname`,
 1 AS `manager_group_id_friendlyname`,
 1 AS `manager_id_friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `parent_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ConnectableCI`
--

DROP TABLE IF EXISTS `view_ConnectableCI`;
/*!50001 DROP VIEW IF EXISTS `view_ConnectableCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ConnectableCI` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Contact`
--

DROP TABLE IF EXISTS `view_Contact`;
/*!50001 DROP VIEW IF EXISTS `view_Contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Contact` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `notify`,
 1 AS `function`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ContactType`
--

DROP TABLE IF EXISTS `view_ContactType`;
/*!50001 DROP VIEW IF EXISTS `view_ContactType`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ContactType` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Contract`
--

DROP TABLE IF EXISTS `view_Contract`;
/*!50001 DROP VIEW IF EXISTS `view_Contract`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Contract` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `cost`,
 1 AS `cost_currency`,
 1 AS `contracttype_id`,
 1 AS `contracttype_name`,
 1 AS `billing_frequency`,
 1 AS `cost_unit`,
 1 AS `provider_id`,
 1 AS `provider_name`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `contracttype_id_friendlyname`,
 1 AS `provider_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ContractType`
--

DROP TABLE IF EXISTS `view_ContractType`;
/*!50001 DROP VIEW IF EXISTS `view_ContractType`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ContractType` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_CustomerContract`
--

DROP TABLE IF EXISTS `view_CustomerContract`;
/*!50001 DROP VIEW IF EXISTS `view_CustomerContract`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_CustomerContract` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `cost`,
 1 AS `cost_currency`,
 1 AS `contracttype_id`,
 1 AS `contracttype_name`,
 1 AS `billing_frequency`,
 1 AS `cost_unit`,
 1 AS `provider_id`,
 1 AS `provider_name`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `contracttype_id_friendlyname`,
 1 AS `provider_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DBServer`
--

DROP TABLE IF EXISTS `view_DBServer`;
/*!50001 DROP VIEW IF EXISTS `view_DBServer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DBServer` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DatabaseSchema`
--

DROP TABLE IF EXISTS `view_DatabaseSchema`;
/*!50001 DROP VIEW IF EXISTS `view_DatabaseSchema`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DatabaseSchema` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `dbserver_id`,
 1 AS `dbserver_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `dbserver_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DatacenterDevice`
--

DROP TABLE IF EXISTS `view_DatacenterDevice`;
/*!50001 DROP VIEW IF EXISTS `view_DatacenterDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DatacenterDevice` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DeliveryModel`
--

DROP TABLE IF EXISTS `view_DeliveryModel`;
/*!50001 DROP VIEW IF EXISTS `view_DeliveryModel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DeliveryModel` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `description`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Document`
--

DROP TABLE IF EXISTS `view_Document`;
/*!50001 DROP VIEW IF EXISTS `view_Document`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Document` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `documenttype_id`,
 1 AS `documenttype_name`,
 1 AS `version`,
 1 AS `description`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `documenttype_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DocumentFile`
--

DROP TABLE IF EXISTS `view_DocumentFile`;
/*!50001 DROP VIEW IF EXISTS `view_DocumentFile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DocumentFile` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `documenttype_id`,
 1 AS `documenttype_name`,
 1 AS `version`,
 1 AS `description`,
 1 AS `status`,
 1 AS `file`,
 1 AS `file_data`,
 1 AS `file_filename`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `documenttype_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DocumentNote`
--

DROP TABLE IF EXISTS `view_DocumentNote`;
/*!50001 DROP VIEW IF EXISTS `view_DocumentNote`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DocumentNote` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `documenttype_id`,
 1 AS `documenttype_name`,
 1 AS `version`,
 1 AS `description`,
 1 AS `status`,
 1 AS `text`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `documenttype_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DocumentType`
--

DROP TABLE IF EXISTS `view_DocumentType`;
/*!50001 DROP VIEW IF EXISTS `view_DocumentType`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DocumentType` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_DocumentWeb`
--

DROP TABLE IF EXISTS `view_DocumentWeb`;
/*!50001 DROP VIEW IF EXISTS `view_DocumentWeb`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_DocumentWeb` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `documenttype_id`,
 1 AS `documenttype_name`,
 1 AS `version`,
 1 AS `description`,
 1 AS `status`,
 1 AS `url`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `documenttype_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_EmergencyChange`
--

DROP TABLE IF EXISTS `view_EmergencyChange`;
/*!50001 DROP VIEW IF EXISTS `view_EmergencyChange`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_EmergencyChange` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `reason`,
 1 AS `requestor_id`,
 1 AS `requestor_email`,
 1 AS `creation_date`,
 1 AS `impact`,
 1 AS `supervisor_group_id`,
 1 AS `supervisor_group_name`,
 1 AS `supervisor_id`,
 1 AS `supervisor_email`,
 1 AS `manager_group_id`,
 1 AS `manager_group_name`,
 1 AS `manager_id`,
 1 AS `manager_email`,
 1 AS `outage`,
 1 AS `fallback`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `approval_date`,
 1 AS `approval_comment`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `requestor_id_friendlyname`,
 1 AS `supervisor_group_id_friendlyname`,
 1 AS `supervisor_id_friendlyname`,
 1 AS `manager_group_id_friendlyname`,
 1 AS `manager_id_friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `parent_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Enclosure`
--

DROP TABLE IF EXISTS `view_Enclosure`;
/*!50001 DROP VIEW IF EXISTS `view_Enclosure`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Enclosure` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `nb_u`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Farm`
--

DROP TABLE IF EXISTS `view_Farm`;
/*!50001 DROP VIEW IF EXISTS `view_Farm`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Farm` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_FiberChannelInterface`
--

DROP TABLE IF EXISTS `view_FiberChannelInterface`;
/*!50001 DROP VIEW IF EXISTS `view_FiberChannelInterface`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_FiberChannelInterface` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `speed`,
 1 AS `topology`,
 1 AS `wwn`,
 1 AS `datacenterdevice_id`,
 1 AS `datacenterdevice_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `datacenterdevice_id_friendlyname`,
 1 AS `datacenterdevice_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_FunctionalCI`
--

DROP TABLE IF EXISTS `view_FunctionalCI`;
/*!50001 DROP VIEW IF EXISTS `view_FunctionalCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_FunctionalCI` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Group`
--

DROP TABLE IF EXISTS `view_Group`;
/*!50001 DROP VIEW IF EXISTS `view_Group`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Group` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `org_id`,
 1 AS `owner_name`,
 1 AS `description`,
 1 AS `type`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `parent_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Hypervisor`
--

DROP TABLE IF EXISTS `view_Hypervisor`;
/*!50001 DROP VIEW IF EXISTS `view_Hypervisor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Hypervisor` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `farm_id`,
 1 AS `farm_name`,
 1 AS `server_id`,
 1 AS `server_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `farm_id_friendlyname`,
 1 AS `server_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_IOSVersion`
--

DROP TABLE IF EXISTS `view_IOSVersion`;
/*!50001 DROP VIEW IF EXISTS `view_IOSVersion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_IOSVersion` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `brand_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_IPInterface`
--

DROP TABLE IF EXISTS `view_IPInterface`;
/*!50001 DROP VIEW IF EXISTS `view_IPInterface`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_IPInterface` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `ipaddress`,
 1 AS `macaddress`,
 1 AS `comment`,
 1 AS `ipgateway`,
 1 AS `ipmask`,
 1 AS `speed`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_IPPhone`
--

DROP TABLE IF EXISTS `view_IPPhone`;
/*!50001 DROP VIEW IF EXISTS `view_IPPhone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_IPPhone` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `phonenumber`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Incident`
--

DROP TABLE IF EXISTS `view_Incident`;
/*!50001 DROP VIEW IF EXISTS `view_Incident`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Incident` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `impact`,
 1 AS `priority`,
 1 AS `urgency`,
 1 AS `origin`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `servicesubcategory_id`,
 1 AS `servicesubcategory_name`,
 1 AS `escalation_flag`,
 1 AS `escalation_reason`,
 1 AS `assignment_date`,
 1 AS `resolution_date`,
 1 AS `last_pending_date`,
 1 AS `cumulatedpending`,
 1 AS `cumulatedpending_started`,
 1 AS `cumulatedpending_laststart`,
 1 AS `cumulatedpending_stopped`,
 1 AS `tto`,
 1 AS `tto_started`,
 1 AS `tto_laststart`,
 1 AS `tto_stopped`,
 1 AS `tto_75_deadline`,
 1 AS `tto_75_passed`,
 1 AS `tto_75_triggered`,
 1 AS `tto_75_overrun`,
 1 AS `tto_100_deadline`,
 1 AS `tto_100_passed`,
 1 AS `tto_100_triggered`,
 1 AS `tto_100_overrun`,
 1 AS `ttr`,
 1 AS `ttr_started`,
 1 AS `ttr_laststart`,
 1 AS `ttr_stopped`,
 1 AS `ttr_75_deadline`,
 1 AS `ttr_75_passed`,
 1 AS `ttr_75_triggered`,
 1 AS `ttr_75_overrun`,
 1 AS `ttr_100_deadline`,
 1 AS `ttr_100_passed`,
 1 AS `ttr_100_triggered`,
 1 AS `ttr_100_overrun`,
 1 AS `tto_escalation_deadline`,
 1 AS `sla_tto_passed`,
 1 AS `sla_tto_over`,
 1 AS `ttr_escalation_deadline`,
 1 AS `sla_ttr_passed`,
 1 AS `sla_ttr_over`,
 1 AS `time_spent`,
 1 AS `resolution_code`,
 1 AS `solution`,
 1 AS `pending_reason`,
 1 AS `parent_incident_id`,
 1 AS `parent_incident_ref`,
 1 AS `parent_change_id`,
 1 AS `parent_change_ref`,
 1 AS `public_log`,
 1 AS `public_log_index`,
 1 AS `user_satisfaction`,
 1 AS `user_comment`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `servicesubcategory_id_friendlyname`,
 1 AS `parent_incident_id_friendlyname`,
 1 AS `parent_change_id_friendlyname`,
 1 AS `parent_change_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Licence`
--

DROP TABLE IF EXISTS `view_Licence`;
/*!50001 DROP VIEW IF EXISTS `view_Licence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Licence` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `usage_limit`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `licence_key`,
 1 AS `perpetual`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Location`
--

DROP TABLE IF EXISTS `view_Location`;
/*!50001 DROP VIEW IF EXISTS `view_Location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Location` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `address`,
 1 AS `postal_code`,
 1 AS `city`,
 1 AS `country`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_LogicalInterface`
--

DROP TABLE IF EXISTS `view_LogicalInterface`;
/*!50001 DROP VIEW IF EXISTS `view_LogicalInterface`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_LogicalInterface` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `ipaddress`,
 1 AS `macaddress`,
 1 AS `comment`,
 1 AS `ipgateway`,
 1 AS `ipmask`,
 1 AS `speed`,
 1 AS `virtualmachine_id`,
 1 AS `virtualmachine_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `virtualmachine_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_LogicalVolume`
--

DROP TABLE IF EXISTS `view_LogicalVolume`;
/*!50001 DROP VIEW IF EXISTS `view_LogicalVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_LogicalVolume` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `lun_id`,
 1 AS `description`,
 1 AS `raid_level`,
 1 AS `size`,
 1 AS `storagesystem_id`,
 1 AS `storagesystem_name`,
 1 AS `friendlyname`,
 1 AS `storagesystem_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Middleware`
--

DROP TABLE IF EXISTS `view_Middleware`;
/*!50001 DROP VIEW IF EXISTS `view_Middleware`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Middleware` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_MiddlewareInstance`
--

DROP TABLE IF EXISTS `view_MiddlewareInstance`;
/*!50001 DROP VIEW IF EXISTS `view_MiddlewareInstance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_MiddlewareInstance` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `middleware_id`,
 1 AS `middleware_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `middleware_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_MobilePhone`
--

DROP TABLE IF EXISTS `view_MobilePhone`;
/*!50001 DROP VIEW IF EXISTS `view_MobilePhone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_MobilePhone` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `phonenumber`,
 1 AS `imei`,
 1 AS `hw_pin`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Model`
--

DROP TABLE IF EXISTS `view_Model`;
/*!50001 DROP VIEW IF EXISTS `view_Model`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Model` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `type`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `brand_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NAS`
--

DROP TABLE IF EXISTS `view_NAS`;
/*!50001 DROP VIEW IF EXISTS `view_NAS`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NAS` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NASFileSystem`
--

DROP TABLE IF EXISTS `view_NASFileSystem`;
/*!50001 DROP VIEW IF EXISTS `view_NASFileSystem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NASFileSystem` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `raid_level`,
 1 AS `size`,
 1 AS `nas_id`,
 1 AS `nas_name`,
 1 AS `friendlyname`,
 1 AS `nas_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NetworkDevice`
--

DROP TABLE IF EXISTS `view_NetworkDevice`;
/*!50001 DROP VIEW IF EXISTS `view_NetworkDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NetworkDevice` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `networkdevicetype_id`,
 1 AS `networkdevicetype_name`,
 1 AS `iosversion_id`,
 1 AS `iosversion_name`,
 1 AS `ram`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`,
 1 AS `networkdevicetype_id_friendlyname`,
 1 AS `iosversion_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NetworkDeviceType`
--

DROP TABLE IF EXISTS `view_NetworkDeviceType`;
/*!50001 DROP VIEW IF EXISTS `view_NetworkDeviceType`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NetworkDeviceType` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NetworkInterface`
--

DROP TABLE IF EXISTS `view_NetworkInterface`;
/*!50001 DROP VIEW IF EXISTS `view_NetworkInterface`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NetworkInterface` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_NormalChange`
--

DROP TABLE IF EXISTS `view_NormalChange`;
/*!50001 DROP VIEW IF EXISTS `view_NormalChange`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_NormalChange` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `reason`,
 1 AS `requestor_id`,
 1 AS `requestor_email`,
 1 AS `creation_date`,
 1 AS `impact`,
 1 AS `supervisor_group_id`,
 1 AS `supervisor_group_name`,
 1 AS `supervisor_id`,
 1 AS `supervisor_email`,
 1 AS `manager_group_id`,
 1 AS `manager_group_name`,
 1 AS `manager_id`,
 1 AS `manager_email`,
 1 AS `outage`,
 1 AS `fallback`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `approval_date`,
 1 AS `approval_comment`,
 1 AS `acceptance_date`,
 1 AS `acceptance_comment`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `requestor_id_friendlyname`,
 1 AS `supervisor_group_id_friendlyname`,
 1 AS `supervisor_id_friendlyname`,
 1 AS `manager_group_id_friendlyname`,
 1 AS `manager_id_friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `parent_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_OSFamily`
--

DROP TABLE IF EXISTS `view_OSFamily`;
/*!50001 DROP VIEW IF EXISTS `view_OSFamily`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_OSFamily` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_OSLicence`
--

DROP TABLE IF EXISTS `view_OSLicence`;
/*!50001 DROP VIEW IF EXISTS `view_OSLicence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_OSLicence` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `usage_limit`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `licence_key`,
 1 AS `perpetual`,
 1 AS `osversion_id`,
 1 AS `osversion_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `osversion_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_OSPatch`
--

DROP TABLE IF EXISTS `view_OSPatch`;
/*!50001 DROP VIEW IF EXISTS `view_OSPatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_OSPatch` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `osversion_id`,
 1 AS `osversion_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `osversion_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_OSVersion`
--

DROP TABLE IF EXISTS `view_OSVersion`;
/*!50001 DROP VIEW IF EXISTS `view_OSVersion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_OSVersion` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `osfamily_id`,
 1 AS `osfamily_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `osfamily_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Organization`
--

DROP TABLE IF EXISTS `view_Organization`;
/*!50001 DROP VIEW IF EXISTS `view_Organization`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Organization` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `code`,
 1 AS `status`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `deliverymodel_id`,
 1 AS `deliverymodel_name`,
 1 AS `friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `deliverymodel_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_OtherSoftware`
--

DROP TABLE IF EXISTS `view_OtherSoftware`;
/*!50001 DROP VIEW IF EXISTS `view_OtherSoftware`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_OtherSoftware` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PC`
--

DROP TABLE IF EXISTS `view_PC`;
/*!50001 DROP VIEW IF EXISTS `view_PC`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PC` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `osfamily_id`,
 1 AS `osfamily_name`,
 1 AS `osversion_id`,
 1 AS `osversion_name`,
 1 AS `cpu`,
 1 AS `ram`,
 1 AS `type`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `osfamily_id_friendlyname`,
 1 AS `osversion_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PCSoftware`
--

DROP TABLE IF EXISTS `view_PCSoftware`;
/*!50001 DROP VIEW IF EXISTS `view_PCSoftware`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PCSoftware` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PDU`
--

DROP TABLE IF EXISTS `view_PDU`;
/*!50001 DROP VIEW IF EXISTS `view_PDU`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PDU` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `powerstart_id`,
 1 AS `powerstart_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `powerstart_id_friendlyname`,
 1 AS `powerstart_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Patch`
--

DROP TABLE IF EXISTS `view_Patch`;
/*!50001 DROP VIEW IF EXISTS `view_Patch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Patch` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Peripheral`
--

DROP TABLE IF EXISTS `view_Peripheral`;
/*!50001 DROP VIEW IF EXISTS `view_Peripheral`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Peripheral` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Person`
--

DROP TABLE IF EXISTS `view_Person`;
/*!50001 DROP VIEW IF EXISTS `view_Person`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Person` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `notify`,
 1 AS `function`,
 1 AS `picture`,
 1 AS `picture_data`,
 1 AS `picture_filename`,
 1 AS `first_name`,
 1 AS `employee_number`,
 1 AS `mobile_phone`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `manager_id`,
 1 AS `manager_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `manager_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Phone`
--

DROP TABLE IF EXISTS `view_Phone`;
/*!50001 DROP VIEW IF EXISTS `view_Phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Phone` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `phonenumber`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PhysicalDevice`
--

DROP TABLE IF EXISTS `view_PhysicalDevice`;
/*!50001 DROP VIEW IF EXISTS `view_PhysicalDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PhysicalDevice` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PhysicalInterface`
--

DROP TABLE IF EXISTS `view_PhysicalInterface`;
/*!50001 DROP VIEW IF EXISTS `view_PhysicalInterface`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PhysicalInterface` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `ipaddress`,
 1 AS `macaddress`,
 1 AS `comment`,
 1 AS `ipgateway`,
 1 AS `ipmask`,
 1 AS `speed`,
 1 AS `connectableci_id`,
 1 AS `connectableci_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `connectableci_id_friendlyname`,
 1 AS `connectableci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PowerConnection`
--

DROP TABLE IF EXISTS `view_PowerConnection`;
/*!50001 DROP VIEW IF EXISTS `view_PowerConnection`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PowerConnection` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_PowerSource`
--

DROP TABLE IF EXISTS `view_PowerSource`;
/*!50001 DROP VIEW IF EXISTS `view_PowerSource`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_PowerSource` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Printer`
--

DROP TABLE IF EXISTS `view_Printer`;
/*!50001 DROP VIEW IF EXISTS `view_Printer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Printer` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ProviderContract`
--

DROP TABLE IF EXISTS `view_ProviderContract`;
/*!50001 DROP VIEW IF EXISTS `view_ProviderContract`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ProviderContract` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `cost`,
 1 AS `cost_currency`,
 1 AS `contracttype_id`,
 1 AS `contracttype_name`,
 1 AS `billing_frequency`,
 1 AS `cost_unit`,
 1 AS `provider_id`,
 1 AS `provider_name`,
 1 AS `status`,
 1 AS `sla`,
 1 AS `coverage`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `contracttype_id_friendlyname`,
 1 AS `provider_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Rack`
--

DROP TABLE IF EXISTS `view_Rack`;
/*!50001 DROP VIEW IF EXISTS `view_Rack`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Rack` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `nb_u`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_RoutineChange`
--

DROP TABLE IF EXISTS `view_RoutineChange`;
/*!50001 DROP VIEW IF EXISTS `view_RoutineChange`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_RoutineChange` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `reason`,
 1 AS `requestor_id`,
 1 AS `requestor_email`,
 1 AS `creation_date`,
 1 AS `impact`,
 1 AS `supervisor_group_id`,
 1 AS `supervisor_group_name`,
 1 AS `supervisor_id`,
 1 AS `supervisor_email`,
 1 AS `manager_group_id`,
 1 AS `manager_group_name`,
 1 AS `manager_id`,
 1 AS `manager_email`,
 1 AS `outage`,
 1 AS `fallback`,
 1 AS `parent_id`,
 1 AS `parent_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `requestor_id_friendlyname`,
 1 AS `supervisor_group_id_friendlyname`,
 1 AS `supervisor_id_friendlyname`,
 1 AS `manager_group_id_friendlyname`,
 1 AS `manager_id_friendlyname`,
 1 AS `parent_id_friendlyname`,
 1 AS `parent_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SANSwitch`
--

DROP TABLE IF EXISTS `view_SANSwitch`;
/*!50001 DROP VIEW IF EXISTS `view_SANSwitch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SANSwitch` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SLA`
--

DROP TABLE IF EXISTS `view_SLA`;
/*!50001 DROP VIEW IF EXISTS `view_SLA`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SLA` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SLT`
--

DROP TABLE IF EXISTS `view_SLT`;
/*!50001 DROP VIEW IF EXISTS `view_SLT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SLT` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `priority`,
 1 AS `request_type`,
 1 AS `metric`,
 1 AS `value`,
 1 AS `unit`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Server`
--

DROP TABLE IF EXISTS `view_Server`;
/*!50001 DROP VIEW IF EXISTS `view_Server`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Server` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `osfamily_id`,
 1 AS `osfamily_name`,
 1 AS `osversion_id`,
 1 AS `osversion_name`,
 1 AS `oslicence_id`,
 1 AS `oslicence_name`,
 1 AS `cpu`,
 1 AS `ram`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`,
 1 AS `osfamily_id_friendlyname`,
 1 AS `osversion_id_friendlyname`,
 1 AS `oslicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Service`
--

DROP TABLE IF EXISTS `view_Service`;
/*!50001 DROP VIEW IF EXISTS `view_Service`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Service` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `servicefamily_id`,
 1 AS `servicefamily_name`,
 1 AS `description`,
 1 AS `status`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `servicefamily_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ServiceFamily`
--

DROP TABLE IF EXISTS `view_ServiceFamily`;
/*!50001 DROP VIEW IF EXISTS `view_ServiceFamily`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ServiceFamily` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_ServiceSubcategory`
--

DROP TABLE IF EXISTS `view_ServiceSubcategory`;
/*!50001 DROP VIEW IF EXISTS `view_ServiceSubcategory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_ServiceSubcategory` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `service_id`,
 1 AS `service_org_id`,
 1 AS `service_name`,
 1 AS `service_provider`,
 1 AS `request_type`,
 1 AS `status`,
 1 AS `friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `service_org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Software`
--

DROP TABLE IF EXISTS `view_Software`;
/*!50001 DROP VIEW IF EXISTS `view_Software`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Software` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `vendor`,
 1 AS `version`,
 1 AS `type`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SoftwareInstance`
--

DROP TABLE IF EXISTS `view_SoftwareInstance`;
/*!50001 DROP VIEW IF EXISTS `view_SoftwareInstance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SoftwareInstance` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SoftwareLicence`
--

DROP TABLE IF EXISTS `view_SoftwareLicence`;
/*!50001 DROP VIEW IF EXISTS `view_SoftwareLicence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SoftwareLicence` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `usage_limit`,
 1 AS `description`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `licence_key`,
 1 AS `perpetual`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `software_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_SoftwarePatch`
--

DROP TABLE IF EXISTS `view_SoftwarePatch`;
/*!50001 DROP VIEW IF EXISTS `view_SoftwarePatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_SoftwarePatch` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `software_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_StorageSystem`
--

DROP TABLE IF EXISTS `view_StorageSystem`;
/*!50001 DROP VIEW IF EXISTS `view_StorageSystem`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_StorageSystem` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Subnet`
--

DROP TABLE IF EXISTS `view_Subnet`;
/*!50001 DROP VIEW IF EXISTS `view_Subnet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Subnet` AS SELECT 
 1 AS `id`,
 1 AS `description`,
 1 AS `subnet_name`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `ip`,
 1 AS `ip_mask`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Tablet`
--

DROP TABLE IF EXISTS `view_Tablet`;
/*!50001 DROP VIEW IF EXISTS `view_Tablet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Tablet` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Tape`
--

DROP TABLE IF EXISTS `view_Tape`;
/*!50001 DROP VIEW IF EXISTS `view_Tape`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Tape` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `size`,
 1 AS `tapelibrary_id`,
 1 AS `tapelibrary_name`,
 1 AS `friendlyname`,
 1 AS `tapelibrary_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_TapeLibrary`
--

DROP TABLE IF EXISTS `view_TapeLibrary`;
/*!50001 DROP VIEW IF EXISTS `view_TapeLibrary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_TapeLibrary` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `rack_id`,
 1 AS `rack_name`,
 1 AS `enclosure_id`,
 1 AS `enclosure_name`,
 1 AS `nb_u`,
 1 AS `managementip`,
 1 AS `powerA_id`,
 1 AS `powerA_name`,
 1 AS `powerB_id`,
 1 AS `powerB_name`,
 1 AS `redundancy`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`,
 1 AS `rack_id_friendlyname`,
 1 AS `enclosure_id_friendlyname`,
 1 AS `powerA_id_friendlyname`,
 1 AS `powerA_id_finalclass_recall`,
 1 AS `powerB_id_friendlyname`,
 1 AS `powerB_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Team`
--

DROP TABLE IF EXISTS `view_Team`;
/*!50001 DROP VIEW IF EXISTS `view_Team`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Team` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `notify`,
 1 AS `function`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_TelephonyCI`
--

DROP TABLE IF EXISTS `view_TelephonyCI`;
/*!50001 DROP VIEW IF EXISTS `view_TelephonyCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_TelephonyCI` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `serialnumber`,
 1 AS `location_id`,
 1 AS `location_name`,
 1 AS `status`,
 1 AS `brand_id`,
 1 AS `brand_name`,
 1 AS `model_id`,
 1 AS `model_name`,
 1 AS `asset_number`,
 1 AS `purchase_date`,
 1 AS `end_of_warranty`,
 1 AS `phonenumber`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `location_id_friendlyname`,
 1 AS `brand_id_friendlyname`,
 1 AS `model_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Ticket`
--

DROP TABLE IF EXISTS `view_Ticket`;
/*!50001 DROP VIEW IF EXISTS `view_Ticket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Ticket` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_Typology`
--

DROP TABLE IF EXISTS `view_Typology`;
/*!50001 DROP VIEW IF EXISTS `view_Typology`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_Typology` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `finalclass`,
 1 AS `friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_UserRequest`
--

DROP TABLE IF EXISTS `view_UserRequest`;
/*!50001 DROP VIEW IF EXISTS `view_UserRequest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_UserRequest` AS SELECT 
 1 AS `id`,
 1 AS `operational_status`,
 1 AS `ref`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `caller_id`,
 1 AS `caller_name`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_name`,
 1 AS `title`,
 1 AS `description`,
 1 AS `description_format`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `last_update`,
 1 AS `close_date`,
 1 AS `private_log`,
 1 AS `private_log_index`,
 1 AS `status`,
 1 AS `request_type`,
 1 AS `impact`,
 1 AS `priority`,
 1 AS `urgency`,
 1 AS `origin`,
 1 AS `approver_id`,
 1 AS `approver_email`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `servicesubcategory_id`,
 1 AS `servicesubcategory_name`,
 1 AS `escalation_flag`,
 1 AS `escalation_reason`,
 1 AS `assignment_date`,
 1 AS `resolution_date`,
 1 AS `last_pending_date`,
 1 AS `cumulatedpending`,
 1 AS `cumulatedpending_started`,
 1 AS `cumulatedpending_laststart`,
 1 AS `cumulatedpending_stopped`,
 1 AS `tto`,
 1 AS `tto_started`,
 1 AS `tto_laststart`,
 1 AS `tto_stopped`,
 1 AS `tto_75_deadline`,
 1 AS `tto_75_passed`,
 1 AS `tto_75_triggered`,
 1 AS `tto_75_overrun`,
 1 AS `tto_100_deadline`,
 1 AS `tto_100_passed`,
 1 AS `tto_100_triggered`,
 1 AS `tto_100_overrun`,
 1 AS `ttr`,
 1 AS `ttr_started`,
 1 AS `ttr_laststart`,
 1 AS `ttr_stopped`,
 1 AS `ttr_75_deadline`,
 1 AS `ttr_75_passed`,
 1 AS `ttr_75_triggered`,
 1 AS `ttr_75_overrun`,
 1 AS `ttr_100_deadline`,
 1 AS `ttr_100_passed`,
 1 AS `ttr_100_triggered`,
 1 AS `ttr_100_overrun`,
 1 AS `tto_escalation_deadline`,
 1 AS `sla_tto_passed`,
 1 AS `sla_tto_over`,
 1 AS `ttr_escalation_deadline`,
 1 AS `sla_ttr_passed`,
 1 AS `sla_ttr_over`,
 1 AS `time_spent`,
 1 AS `resolution_code`,
 1 AS `solution`,
 1 AS `pending_reason`,
 1 AS `parent_request_id`,
 1 AS `parent_request_ref`,
 1 AS `parent_incident_id`,
 1 AS `parent_incident_ref`,
 1 AS `parent_change_id`,
 1 AS `parent_change_ref`,
 1 AS `public_log`,
 1 AS `public_log_index`,
 1 AS `user_satisfaction`,
 1 AS `user_comment`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `caller_id_friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`,
 1 AS `approver_id_friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `servicesubcategory_id_friendlyname`,
 1 AS `parent_request_id_friendlyname`,
 1 AS `parent_incident_id_friendlyname`,
 1 AS `parent_change_id_friendlyname`,
 1 AS `parent_change_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_VLAN`
--

DROP TABLE IF EXISTS `view_VLAN`;
/*!50001 DROP VIEW IF EXISTS `view_VLAN`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_VLAN` AS SELECT 
 1 AS `id`,
 1 AS `vlan_tag`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `org_name`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_VirtualDevice`
--

DROP TABLE IF EXISTS `view_VirtualDevice`;
/*!50001 DROP VIEW IF EXISTS `view_VirtualDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_VirtualDevice` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_VirtualHost`
--

DROP TABLE IF EXISTS `view_VirtualHost`;
/*!50001 DROP VIEW IF EXISTS `view_VirtualHost`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_VirtualHost` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_VirtualMachine`
--

DROP TABLE IF EXISTS `view_VirtualMachine`;
/*!50001 DROP VIEW IF EXISTS `view_VirtualMachine`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_VirtualMachine` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `status`,
 1 AS `virtualhost_id`,
 1 AS `virtualhost_name`,
 1 AS `osfamily_id`,
 1 AS `osfamily_name`,
 1 AS `osversion_id`,
 1 AS `osversion_name`,
 1 AS `oslicence_id`,
 1 AS `oslicence_name`,
 1 AS `cpu`,
 1 AS `ram`,
 1 AS `managementip`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `virtualhost_id_friendlyname`,
 1 AS `virtualhost_id_finalclass_recall`,
 1 AS `osfamily_id_friendlyname`,
 1 AS `osversion_id_friendlyname`,
 1 AS `oslicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_WebApplication`
--

DROP TABLE IF EXISTS `view_WebApplication`;
/*!50001 DROP VIEW IF EXISTS `view_WebApplication`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_WebApplication` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `webserver_id`,
 1 AS `webserver_name`,
 1 AS `url`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `webserver_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_WebServer`
--

DROP TABLE IF EXISTS `view_WebServer`;
/*!50001 DROP VIEW IF EXISTS `view_WebServer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_WebServer` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `org_id`,
 1 AS `organization_name`,
 1 AS `business_criticity`,
 1 AS `move2production`,
 1 AS `system_id`,
 1 AS `system_name`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `softwarelicence_id`,
 1 AS `softwarelicence_name`,
 1 AS `path`,
 1 AS `status`,
 1 AS `finalclass`,
 1 AS `friendlyname`,
 1 AS `org_id_friendlyname`,
 1 AS `system_id_friendlyname`,
 1 AS `system_id_finalclass_recall`,
 1 AS `software_id_friendlyname`,
 1 AS `softwarelicence_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_WorkOrder`
--

DROP TABLE IF EXISTS `view_WorkOrder`;
/*!50001 DROP VIEW IF EXISTS `view_WorkOrder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_WorkOrder` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `status`,
 1 AS `description`,
 1 AS `ticket_id`,
 1 AS `ticket_ref`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `agent_id`,
 1 AS `agent_email`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `log`,
 1 AS `log_index`,
 1 AS `friendlyname`,
 1 AS `ticket_id_friendlyname`,
 1 AS `ticket_id_finalclass_recall`,
 1 AS `team_id_friendlyname`,
 1 AS `agent_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkApplicationSolutionToBusinessProcess`
--

DROP TABLE IF EXISTS `view_lnkApplicationSolutionToBusinessProcess`;
/*!50001 DROP VIEW IF EXISTS `view_lnkApplicationSolutionToBusinessProcess`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkApplicationSolutionToBusinessProcess` AS SELECT 
 1 AS `id`,
 1 AS `businessprocess_id`,
 1 AS `businessprocess_name`,
 1 AS `applicationsolution_id`,
 1 AS `applicationsolution_name`,
 1 AS `friendlyname`,
 1 AS `businessprocess_id_friendlyname`,
 1 AS `applicationsolution_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkApplicationSolutionToFunctionalCI`
--

DROP TABLE IF EXISTS `view_lnkApplicationSolutionToFunctionalCI`;
/*!50001 DROP VIEW IF EXISTS `view_lnkApplicationSolutionToFunctionalCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkApplicationSolutionToFunctionalCI` AS SELECT 
 1 AS `id`,
 1 AS `applicationsolution_id`,
 1 AS `applicationsolution_name`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `friendlyname`,
 1 AS `applicationsolution_id_friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkConnectableCIToNetworkDevice`
--

DROP TABLE IF EXISTS `view_lnkConnectableCIToNetworkDevice`;
/*!50001 DROP VIEW IF EXISTS `view_lnkConnectableCIToNetworkDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkConnectableCIToNetworkDevice` AS SELECT 
 1 AS `id`,
 1 AS `networkdevice_id`,
 1 AS `networkdevice_name`,
 1 AS `connectableci_id`,
 1 AS `connectableci_name`,
 1 AS `network_port`,
 1 AS `device_port`,
 1 AS `connection_type`,
 1 AS `friendlyname`,
 1 AS `networkdevice_id_friendlyname`,
 1 AS `connectableci_id_friendlyname`,
 1 AS `connectableci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkContactToContract`
--

DROP TABLE IF EXISTS `view_lnkContactToContract`;
/*!50001 DROP VIEW IF EXISTS `view_lnkContactToContract`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkContactToContract` AS SELECT 
 1 AS `id`,
 1 AS `contract_id`,
 1 AS `contract_name`,
 1 AS `contact_id`,
 1 AS `contact_name`,
 1 AS `friendlyname`,
 1 AS `contract_id_friendlyname`,
 1 AS `contract_id_finalclass_recall`,
 1 AS `contact_id_friendlyname`,
 1 AS `contact_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkContactToFunctionalCI`
--

DROP TABLE IF EXISTS `view_lnkContactToFunctionalCI`;
/*!50001 DROP VIEW IF EXISTS `view_lnkContactToFunctionalCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkContactToFunctionalCI` AS SELECT 
 1 AS `id`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `contact_id`,
 1 AS `contact_name`,
 1 AS `friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`,
 1 AS `contact_id_friendlyname`,
 1 AS `contact_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkContactToService`
--

DROP TABLE IF EXISTS `view_lnkContactToService`;
/*!50001 DROP VIEW IF EXISTS `view_lnkContactToService`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkContactToService` AS SELECT 
 1 AS `id`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `contact_id`,
 1 AS `contact_name`,
 1 AS `friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `contact_id_friendlyname`,
 1 AS `contact_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkContactToTicket`
--

DROP TABLE IF EXISTS `view_lnkContactToTicket`;
/*!50001 DROP VIEW IF EXISTS `view_lnkContactToTicket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkContactToTicket` AS SELECT 
 1 AS `id`,
 1 AS `ticket_id`,
 1 AS `ticket_ref`,
 1 AS `contact_id`,
 1 AS `contact_email`,
 1 AS `role`,
 1 AS `role_code`,
 1 AS `friendlyname`,
 1 AS `ticket_id_friendlyname`,
 1 AS `ticket_id_finalclass_recall`,
 1 AS `contact_id_friendlyname`,
 1 AS `contact_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkContractToDocument`
--

DROP TABLE IF EXISTS `view_lnkContractToDocument`;
/*!50001 DROP VIEW IF EXISTS `view_lnkContractToDocument`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkContractToDocument` AS SELECT 
 1 AS `id`,
 1 AS `contract_id`,
 1 AS `contract_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `contract_id_friendlyname`,
 1 AS `contract_id_finalclass_recall`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkCustomerContractToService`
--

DROP TABLE IF EXISTS `view_lnkCustomerContractToService`;
/*!50001 DROP VIEW IF EXISTS `view_lnkCustomerContractToService`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkCustomerContractToService` AS SELECT 
 1 AS `id`,
 1 AS `customercontract_id`,
 1 AS `customercontract_name`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `sla_id`,
 1 AS `sla_name`,
 1 AS `friendlyname`,
 1 AS `customercontract_id_friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `sla_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDeliveryModelToContact`
--

DROP TABLE IF EXISTS `view_lnkDeliveryModelToContact`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDeliveryModelToContact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDeliveryModelToContact` AS SELECT 
 1 AS `id`,
 1 AS `deliverymodel_id`,
 1 AS `deliverymodel_name`,
 1 AS `contact_id`,
 1 AS `contact_name`,
 1 AS `role_id`,
 1 AS `role_name`,
 1 AS `friendlyname`,
 1 AS `deliverymodel_id_friendlyname`,
 1 AS `contact_id_friendlyname`,
 1 AS `contact_id_finalclass_recall`,
 1 AS `role_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDocumentToFunctionalCI`
--

DROP TABLE IF EXISTS `view_lnkDocumentToFunctionalCI`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToFunctionalCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDocumentToFunctionalCI` AS SELECT 
 1 AS `id`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDocumentToLicence`
--

DROP TABLE IF EXISTS `view_lnkDocumentToLicence`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToLicence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDocumentToLicence` AS SELECT 
 1 AS `id`,
 1 AS `licence_id`,
 1 AS `licence_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `licence_id_friendlyname`,
 1 AS `licence_id_finalclass_recall`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDocumentToPatch`
--

DROP TABLE IF EXISTS `view_lnkDocumentToPatch`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToPatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDocumentToPatch` AS SELECT 
 1 AS `id`,
 1 AS `patch_id`,
 1 AS `patch_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `patch_id_friendlyname`,
 1 AS `patch_id_finalclass_recall`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDocumentToService`
--

DROP TABLE IF EXISTS `view_lnkDocumentToService`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToService`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDocumentToService` AS SELECT 
 1 AS `id`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkDocumentToSoftware`
--

DROP TABLE IF EXISTS `view_lnkDocumentToSoftware`;
/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToSoftware`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkDocumentToSoftware` AS SELECT 
 1 AS `id`,
 1 AS `software_id`,
 1 AS `software_name`,
 1 AS `document_id`,
 1 AS `document_name`,
 1 AS `friendlyname`,
 1 AS `software_id_friendlyname`,
 1 AS `document_id_friendlyname`,
 1 AS `document_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkFunctionalCIToOSPatch`
--

DROP TABLE IF EXISTS `view_lnkFunctionalCIToOSPatch`;
/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToOSPatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkFunctionalCIToOSPatch` AS SELECT 
 1 AS `id`,
 1 AS `ospatch_id`,
 1 AS `ospatch_name`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `friendlyname`,
 1 AS `ospatch_id_friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkFunctionalCIToProviderContract`
--

DROP TABLE IF EXISTS `view_lnkFunctionalCIToProviderContract`;
/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToProviderContract`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkFunctionalCIToProviderContract` AS SELECT 
 1 AS `id`,
 1 AS `providercontract_id`,
 1 AS `providercontract_name`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `friendlyname`,
 1 AS `providercontract_id_friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkFunctionalCIToService`
--

DROP TABLE IF EXISTS `view_lnkFunctionalCIToService`;
/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToService`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkFunctionalCIToService` AS SELECT 
 1 AS `id`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkFunctionalCIToTicket`
--

DROP TABLE IF EXISTS `view_lnkFunctionalCIToTicket`;
/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToTicket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkFunctionalCIToTicket` AS SELECT 
 1 AS `id`,
 1 AS `ticket_id`,
 1 AS `ticket_ref`,
 1 AS `ticket_title`,
 1 AS `functionalci_id`,
 1 AS `functionalci_name`,
 1 AS `impact`,
 1 AS `impact_code`,
 1 AS `friendlyname`,
 1 AS `ticket_id_friendlyname`,
 1 AS `ticket_id_finalclass_recall`,
 1 AS `functionalci_id_friendlyname`,
 1 AS `functionalci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkGroupToCI`
--

DROP TABLE IF EXISTS `view_lnkGroupToCI`;
/*!50001 DROP VIEW IF EXISTS `view_lnkGroupToCI`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkGroupToCI` AS SELECT 
 1 AS `id`,
 1 AS `group_id`,
 1 AS `group_name`,
 1 AS `ci_id`,
 1 AS `ci_name`,
 1 AS `reason`,
 1 AS `friendlyname`,
 1 AS `group_id_friendlyname`,
 1 AS `ci_id_friendlyname`,
 1 AS `ci_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkPersonToTeam`
--

DROP TABLE IF EXISTS `view_lnkPersonToTeam`;
/*!50001 DROP VIEW IF EXISTS `view_lnkPersonToTeam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkPersonToTeam` AS SELECT 
 1 AS `id`,
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `role_id`,
 1 AS `role_name`,
 1 AS `friendlyname`,
 1 AS `team_id_friendlyname`,
 1 AS `person_id_friendlyname`,
 1 AS `role_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkPhysicalInterfaceToVLAN`
--

DROP TABLE IF EXISTS `view_lnkPhysicalInterfaceToVLAN`;
/*!50001 DROP VIEW IF EXISTS `view_lnkPhysicalInterfaceToVLAN`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkPhysicalInterfaceToVLAN` AS SELECT 
 1 AS `id`,
 1 AS `physicalinterface_id`,
 1 AS `physicalinterface_name`,
 1 AS `physicalinterface_device_id`,
 1 AS `physicalinterface_device_name`,
 1 AS `vlan_id`,
 1 AS `vlan_tag`,
 1 AS `friendlyname`,
 1 AS `physicalinterface_id_friendlyname`,
 1 AS `physicalinterface_device_id_friendlyname`,
 1 AS `vlan_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkProviderContractToService`
--

DROP TABLE IF EXISTS `view_lnkProviderContractToService`;
/*!50001 DROP VIEW IF EXISTS `view_lnkProviderContractToService`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkProviderContractToService` AS SELECT 
 1 AS `id`,
 1 AS `service_id`,
 1 AS `service_name`,
 1 AS `providercontract_id`,
 1 AS `providercontract_name`,
 1 AS `friendlyname`,
 1 AS `service_id_friendlyname`,
 1 AS `providercontract_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkSLAToSLT`
--

DROP TABLE IF EXISTS `view_lnkSLAToSLT`;
/*!50001 DROP VIEW IF EXISTS `view_lnkSLAToSLT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkSLAToSLT` AS SELECT 
 1 AS `id`,
 1 AS `sla_id`,
 1 AS `sla_name`,
 1 AS `slt_id`,
 1 AS `slt_name`,
 1 AS `slt_metric`,
 1 AS `slt_request_type`,
 1 AS `slt_ticket_priority`,
 1 AS `slt_value`,
 1 AS `slt_value_unit`,
 1 AS `friendlyname`,
 1 AS `sla_id_friendlyname`,
 1 AS `slt_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkSanToDatacenterDevice`
--

DROP TABLE IF EXISTS `view_lnkSanToDatacenterDevice`;
/*!50001 DROP VIEW IF EXISTS `view_lnkSanToDatacenterDevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkSanToDatacenterDevice` AS SELECT 
 1 AS `id`,
 1 AS `san_id`,
 1 AS `san_name`,
 1 AS `datacenterdevice_id`,
 1 AS `datacenterdevice_name`,
 1 AS `san_port`,
 1 AS `datacenterdevice_port`,
 1 AS `friendlyname`,
 1 AS `san_id_friendlyname`,
 1 AS `datacenterdevice_id_friendlyname`,
 1 AS `datacenterdevice_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkServerToVolume`
--

DROP TABLE IF EXISTS `view_lnkServerToVolume`;
/*!50001 DROP VIEW IF EXISTS `view_lnkServerToVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkServerToVolume` AS SELECT 
 1 AS `id`,
 1 AS `volume_id`,
 1 AS `volume_name`,
 1 AS `server_id`,
 1 AS `server_name`,
 1 AS `size_used`,
 1 AS `friendlyname`,
 1 AS `volume_id_friendlyname`,
 1 AS `server_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkSoftwareInstanceToSoftwarePatch`
--

DROP TABLE IF EXISTS `view_lnkSoftwareInstanceToSoftwarePatch`;
/*!50001 DROP VIEW IF EXISTS `view_lnkSoftwareInstanceToSoftwarePatch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkSoftwareInstanceToSoftwarePatch` AS SELECT 
 1 AS `id`,
 1 AS `softwarepatch_id`,
 1 AS `softwarepatch_name`,
 1 AS `softwareinstance_id`,
 1 AS `softwareinstance_name`,
 1 AS `friendlyname`,
 1 AS `softwarepatch_id_friendlyname`,
 1 AS `softwareinstance_id_friendlyname`,
 1 AS `softwareinstance_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkSubnetToVLAN`
--

DROP TABLE IF EXISTS `view_lnkSubnetToVLAN`;
/*!50001 DROP VIEW IF EXISTS `view_lnkSubnetToVLAN`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkSubnetToVLAN` AS SELECT 
 1 AS `id`,
 1 AS `subnet_id`,
 1 AS `subnet_ip`,
 1 AS `subnet_name`,
 1 AS `vlan_id`,
 1 AS `vlan_tag`,
 1 AS `friendlyname`,
 1 AS `subnet_id_friendlyname`,
 1 AS `vlan_id_friendlyname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_lnkVirtualDeviceToVolume`
--

DROP TABLE IF EXISTS `view_lnkVirtualDeviceToVolume`;
/*!50001 DROP VIEW IF EXISTS `view_lnkVirtualDeviceToVolume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_lnkVirtualDeviceToVolume` AS SELECT 
 1 AS `id`,
 1 AS `volume_id`,
 1 AS `volume_name`,
 1 AS `virtualdevice_id`,
 1 AS `virtualdevice_name`,
 1 AS `size_used`,
 1 AS `friendlyname`,
 1 AS `volume_id_friendlyname`,
 1 AS `virtualdevice_id_friendlyname`,
 1 AS `virtualdevice_id_finalclass_recall`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `virtualdevice`
--

DROP TABLE IF EXISTS `virtualdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('implementation','obsolete','production','stock') COLLATE utf8_unicode_ci DEFAULT 'production',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualdevice`
--

LOCK TABLES `virtualdevice` WRITE;
/*!40000 ALTER TABLE `virtualdevice` DISABLE KEYS */;
INSERT INTO `virtualdevice` VALUES (16,'production'),(17,'production'),(18,'production'),(19,'production'),(20,'production'),(21,'production'),(22,'production'),(23,'production'),(24,'production');
/*!40000 ALTER TABLE `virtualdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualhost`
--

DROP TABLE IF EXISTS `virtualhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualhost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualhost`
--

LOCK TABLES `virtualhost` WRITE;
/*!40000 ALTER TABLE `virtualhost` DISABLE KEYS */;
INSERT INTO `virtualhost` VALUES (16),(17),(18),(19),(20);
/*!40000 ALTER TABLE `virtualhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualmachine`
--

DROP TABLE IF EXISTS `virtualmachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualmachine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualhost_id` int(11) DEFAULT '0',
  `osfamily_id` int(11) DEFAULT '0',
  `osversion_id` int(11) DEFAULT '0',
  `oslicence_id` int(11) DEFAULT '0',
  `cpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `managementip` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `virtualhost_id` (`virtualhost_id`),
  KEY `osfamily_id` (`osfamily_id`),
  KEY `osversion_id` (`osversion_id`),
  KEY `oslicence_id` (`oslicence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualmachine`
--

LOCK TABLES `virtualmachine` WRITE;
/*!40000 ALTER TABLE `virtualmachine` DISABLE KEYS */;
INSERT INTO `virtualmachine` VALUES (21,16,6,8,0,'','',''),(22,16,7,9,0,'','',''),(23,16,6,8,0,'','',''),(24,17,7,9,0,'','','');
/*!40000 ALTER TABLE `virtualmachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlan`
--

DROP TABLE IF EXISTS `vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlan_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `org_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlan`
--

LOCK TABLES `vlan` WRITE;
/*!40000 ALTER TABLE `vlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webapplication`
--

DROP TABLE IF EXISTS `webapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webserver_id` int(11) DEFAULT '0',
  `url` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `webserver_id` (`webserver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webapplication`
--

LOCK TABLES `webapplication` WRITE;
/*!40000 ALTER TABLE `webapplication` DISABLE KEYS */;
INSERT INTO `webapplication` VALUES (10,9,''),(30,29,''),(31,29,'');
/*!40000 ALTER TABLE `webapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webserver`
--

DROP TABLE IF EXISTS `webserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webserver`
--

LOCK TABLES `webserver` WRITE;
/*!40000 ALTER TABLE `webserver` DISABLE KEYS */;
INSERT INTO `webserver` VALUES (9),(29);
/*!40000 ALTER TABLE `webserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workorder`
--

DROP TABLE IF EXISTS `workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` enum('closed','open') COLLATE utf8_unicode_ci DEFAULT 'open',
  `description` text COLLATE utf8_unicode_ci,
  `ticket_id` int(11) DEFAULT '0',
  `team_id` int(11) DEFAULT '0',
  `owner_id` int(11) DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `log` longtext COLLATE utf8_unicode_ci,
  `log_index` blob,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `team_id` (`team_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workorder`
--

LOCK TABLES `workorder` WRITE;
/*!40000 ALTER TABLE `workorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `workorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_ApplicationSolution`
--

/*!50001 DROP VIEW IF EXISTS `view_ApplicationSolution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ApplicationSolution` AS select distinct `_applicationsolution`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_applicationsolution`.`status` AS `status`,`_applicationsolution`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`applicationsolution` `_applicationsolution` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_applicationsolution`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ApprovedChange`
--

/*!50001 DROP VIEW IF EXISTS `view_ApprovedChange`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ApprovedChange` AS select distinct `_change_approved`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_change`.`status` AS `status`,`_change`.`reason` AS `reason`,`_change`.`requestor_id` AS `requestor_id`,`Person_requestor_id_contact`.`email` AS `requestor_email`,`_change`.`creation_date` AS `creation_date`,`_change`.`impact` AS `impact`,`_change`.`supervisor_group_id` AS `supervisor_group_id`,`Team_supervisor_group_id_contact`.`name` AS `supervisor_group_name`,`_change`.`supervisor_id` AS `supervisor_id`,`Person_supervisor_id_contact`.`email` AS `supervisor_email`,`_change`.`manager_group_id` AS `manager_group_id`,`Team_manager_group_id_contact`.`name` AS `manager_group_name`,`_change`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`email` AS `manager_email`,`_change`.`outage` AS `outage`,`_change`.`fallback` AS `fallback`,`_change`.`parent_id` AS `parent_id`,`Change_parent_id_ticket`.`ref` AS `parent_name`,`_change_approved`.`approval_date` AS `approval_date`,`_change_approved`.`approval_comment` AS `approval_comment`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_requestor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_requestor_id_contact`.`name`,'')) as char charset utf8) AS `requestor_id_friendlyname`,cast(concat(coalesce(`Team_supervisor_group_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_group_id_friendlyname`,cast(concat(coalesce(`Person_supervisor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_supervisor_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_id_friendlyname`,cast(concat(coalesce(`Team_manager_group_id_contact`.`name`,'')) as char charset utf8) AS `manager_group_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname`,cast(concat(coalesce(`Change_parent_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_id_friendlyname`,`Change_parent_id_ticket`.`finalclass` AS `parent_id_finalclass_recall` from ((`change_approved` `_change_approved` join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_change_approved`.`id` = `_ticket`.`id`))) join ((((((`change` `_change` left join (`person` `Person_requestor_id_person` join `contact` `Person_requestor_id_contact` on((`Person_requestor_id_person`.`id` = `Person_requestor_id_contact`.`id`))) on((`_change`.`requestor_id` = `Person_requestor_id_person`.`id`))) left join (`team` `Team_supervisor_group_id_team` join `contact` `Team_supervisor_group_id_contact` on((`Team_supervisor_group_id_team`.`id` = `Team_supervisor_group_id_contact`.`id`))) on((`_change`.`supervisor_group_id` = `Team_supervisor_group_id_team`.`id`))) left join (`person` `Person_supervisor_id_person` join `contact` `Person_supervisor_id_contact` on((`Person_supervisor_id_person`.`id` = `Person_supervisor_id_contact`.`id`))) on((`_change`.`supervisor_id` = `Person_supervisor_id_person`.`id`))) left join (`team` `Team_manager_group_id_team` join `contact` `Team_manager_group_id_contact` on((`Team_manager_group_id_team`.`id` = `Team_manager_group_id_contact`.`id`))) on((`_change`.`manager_group_id` = `Team_manager_group_id_team`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_change`.`manager_id` = `Person_manager_id_person`.`id`))) left join (`change` `Change_parent_id_change` join `ticket` `Change_parent_id_ticket` on((`Change_parent_id_change`.`id` = `Change_parent_id_ticket`.`id`))) on((`_change`.`parent_id` = `Change_parent_id_change`.`id`))) on((`_change_approved`.`id` = `_change`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Attachment`
--

/*!50001 DROP VIEW IF EXISTS `view_Attachment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Attachment` AS select distinct `_attachment`.`id` AS `id`,`_attachment`.`expire` AS `expire`,`_attachment`.`temp_id` AS `temp_id`,`_attachment`.`item_class` AS `item_class`,`_attachment`.`item_id` AS `item_id`,`_attachment`.`item_org_id` AS `item_org_id`,`_attachment`.`contents_mimetype` AS `contents`,`_attachment`.`contents_data` AS `contents_data`,`_attachment`.`contents_filename` AS `contents_filename`,cast(concat(coalesce(`_attachment`.`item_class`,''),coalesce(' ',''),coalesce(`_attachment`.`temp_id`,'')) as char charset utf8) AS `friendlyname` from `attachment` `_attachment` where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Brand`
--

/*!50001 DROP VIEW IF EXISTS `view_Brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Brand` AS select distinct `_brand`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`brand` `_brand` join `typology` `_typology` on((`_brand`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_BusinessProcess`
--

/*!50001 DROP VIEW IF EXISTS `view_BusinessProcess`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_BusinessProcess` AS select distinct `_businessprocess`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_businessprocess`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`businessprocess` `_businessprocess` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_businessprocess`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Change`
--

/*!50001 DROP VIEW IF EXISTS `view_Change`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Change` AS select distinct `_change`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_change`.`status` AS `status`,`_change`.`reason` AS `reason`,`_change`.`requestor_id` AS `requestor_id`,`Person_requestor_id_contact`.`email` AS `requestor_email`,`_change`.`creation_date` AS `creation_date`,`_change`.`impact` AS `impact`,`_change`.`supervisor_group_id` AS `supervisor_group_id`,`Team_supervisor_group_id_contact`.`name` AS `supervisor_group_name`,`_change`.`supervisor_id` AS `supervisor_id`,`Person_supervisor_id_contact`.`email` AS `supervisor_email`,`_change`.`manager_group_id` AS `manager_group_id`,`Team_manager_group_id_contact`.`name` AS `manager_group_name`,`_change`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`email` AS `manager_email`,`_change`.`outage` AS `outage`,`_change`.`fallback` AS `fallback`,`_change`.`parent_id` AS `parent_id`,`Change_parent_id_ticket`.`ref` AS `parent_name`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_requestor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_requestor_id_contact`.`name`,'')) as char charset utf8) AS `requestor_id_friendlyname`,cast(concat(coalesce(`Team_supervisor_group_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_group_id_friendlyname`,cast(concat(coalesce(`Person_supervisor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_supervisor_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_id_friendlyname`,cast(concat(coalesce(`Team_manager_group_id_contact`.`name`,'')) as char charset utf8) AS `manager_group_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname`,cast(concat(coalesce(`Change_parent_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_id_friendlyname`,`Change_parent_id_ticket`.`finalclass` AS `parent_id_finalclass_recall` from (((((((`change` `_change` left join (`person` `Person_requestor_id_person` join `contact` `Person_requestor_id_contact` on((`Person_requestor_id_person`.`id` = `Person_requestor_id_contact`.`id`))) on((`_change`.`requestor_id` = `Person_requestor_id_person`.`id`))) left join (`team` `Team_supervisor_group_id_team` join `contact` `Team_supervisor_group_id_contact` on((`Team_supervisor_group_id_team`.`id` = `Team_supervisor_group_id_contact`.`id`))) on((`_change`.`supervisor_group_id` = `Team_supervisor_group_id_team`.`id`))) left join (`person` `Person_supervisor_id_person` join `contact` `Person_supervisor_id_contact` on((`Person_supervisor_id_person`.`id` = `Person_supervisor_id_contact`.`id`))) on((`_change`.`supervisor_id` = `Person_supervisor_id_person`.`id`))) left join (`team` `Team_manager_group_id_team` join `contact` `Team_manager_group_id_contact` on((`Team_manager_group_id_team`.`id` = `Team_manager_group_id_contact`.`id`))) on((`_change`.`manager_group_id` = `Team_manager_group_id_team`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_change`.`manager_id` = `Person_manager_id_person`.`id`))) left join (`change` `Change_parent_id_change` join `ticket` `Change_parent_id_ticket` on((`Change_parent_id_change`.`id` = `Change_parent_id_ticket`.`id`))) on((`_change`.`parent_id` = `Change_parent_id_change`.`id`))) join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_change`.`id` = `_ticket`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ConnectableCI`
--

/*!50001 DROP VIEW IF EXISTS `view_ConnectableCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ConnectableCI` AS select distinct `_connectableci`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`connectableci` `_connectableci` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_connectableci`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_connectableci`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Contact`
--

/*!50001 DROP VIEW IF EXISTS `view_Contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Contact` AS select distinct `_contact`.`id` AS `id`,`_contact`.`name` AS `name`,`_contact`.`status` AS `status`,`_contact`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_contact`.`email` AS `email`,`_contact`.`phone` AS `phone`,`_contact`.`notify` AS `notify`,`_contact`.`function` AS `function`,`_contact`.`finalclass` AS `finalclass`,if((`_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`_contact`.`name`,'')) as char charset utf8)) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from ((`contact` `_contact` join `organization` `Organization_org_id_organization` on((`_contact`.`org_id` = `Organization_org_id_organization`.`id`))) left join `person` `_fn_Person_person` on((`_contact`.`id` = `_fn_Person_person`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ContactType`
--

/*!50001 DROP VIEW IF EXISTS `view_ContactType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ContactType` AS select distinct `_contacttype`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`contacttype` `_contacttype` join `typology` `_typology` on((`_contacttype`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Contract`
--

/*!50001 DROP VIEW IF EXISTS `view_Contract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Contract` AS select distinct `_contract`.`id` AS `id`,`_contract`.`name` AS `name`,`_contract`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_contract`.`description` AS `description`,`_contract`.`start_date` AS `start_date`,`_contract`.`end_date` AS `end_date`,`_contract`.`cost` AS `cost`,`_contract`.`cost_currency` AS `cost_currency`,`_contract`.`contracttype_id` AS `contracttype_id`,`ContractType_contracttype_id_typology`.`name` AS `contracttype_name`,`_contract`.`billing_frequency` AS `billing_frequency`,`_contract`.`cost_unit` AS `cost_unit`,`_contract`.`provider_id` AS `provider_id`,`Organization_provider_id_organization`.`name` AS `provider_name`,`_contract`.`status` AS `status`,`_contract`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_contract`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`ContractType_contracttype_id_typology`.`name`,'')) as char charset utf8) AS `contracttype_id_friendlyname`,cast(concat(coalesce(`Organization_provider_id_organization`.`name`,'')) as char charset utf8) AS `provider_id_friendlyname` from (((`contract` `_contract` join `organization` `Organization_org_id_organization` on((`_contract`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`contracttype` `ContractType_contracttype_id_contracttype` join `typology` `ContractType_contracttype_id_typology` on((`ContractType_contracttype_id_contracttype`.`id` = `ContractType_contracttype_id_typology`.`id`))) on((`_contract`.`contracttype_id` = `ContractType_contracttype_id_contracttype`.`id`))) join `organization` `Organization_provider_id_organization` on((`_contract`.`provider_id` = `Organization_provider_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ContractType`
--

/*!50001 DROP VIEW IF EXISTS `view_ContractType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ContractType` AS select distinct `_contracttype`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`contracttype` `_contracttype` join `typology` `_typology` on((`_contracttype`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_CustomerContract`
--

/*!50001 DROP VIEW IF EXISTS `view_CustomerContract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_CustomerContract` AS select distinct `_customercontract`.`id` AS `id`,`_contract`.`name` AS `name`,`_contract`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_contract`.`description` AS `description`,`_contract`.`start_date` AS `start_date`,`_contract`.`end_date` AS `end_date`,`_contract`.`cost` AS `cost`,`_contract`.`cost_currency` AS `cost_currency`,`_contract`.`contracttype_id` AS `contracttype_id`,`ContractType_contracttype_id_typology`.`name` AS `contracttype_name`,`_contract`.`billing_frequency` AS `billing_frequency`,`_contract`.`cost_unit` AS `cost_unit`,`_contract`.`provider_id` AS `provider_id`,`Organization_provider_id_organization`.`name` AS `provider_name`,`_contract`.`status` AS `status`,`_contract`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_contract`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`ContractType_contracttype_id_typology`.`name`,'')) as char charset utf8) AS `contracttype_id_friendlyname`,cast(concat(coalesce(`Organization_provider_id_organization`.`name`,'')) as char charset utf8) AS `provider_id_friendlyname` from (`customercontract` `_customercontract` join (((`contract` `_contract` join `organization` `Organization_org_id_organization` on((`_contract`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`contracttype` `ContractType_contracttype_id_contracttype` join `typology` `ContractType_contracttype_id_typology` on((`ContractType_contracttype_id_contracttype`.`id` = `ContractType_contracttype_id_typology`.`id`))) on((`_contract`.`contracttype_id` = `ContractType_contracttype_id_contracttype`.`id`))) join `organization` `Organization_provider_id_organization` on((`_contract`.`provider_id` = `Organization_provider_id_organization`.`id`))) on((`_customercontract`.`id` = `_contract`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DBServer`
--

/*!50001 DROP VIEW IF EXISTS `view_DBServer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DBServer` AS select distinct `_dbserver`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((`dbserver` `_dbserver` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_dbserver`.`id` = `_functionalci`.`id`))) join (((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) on((`_dbserver`.`id` = `_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DatabaseSchema`
--

/*!50001 DROP VIEW IF EXISTS `view_DatabaseSchema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DatabaseSchema` AS select distinct `_databaseschema`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_databaseschema`.`dbserver_id` AS `dbserver_id`,`DBServer_dbserver_id_functionalci`.`name` AS `dbserver_name`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`DBServer_dbserver_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `dbserver_id_friendlyname` from ((`databaseschema` `_databaseschema` join ((`dbserver` `DBServer_dbserver_id_dbserver` join `functionalci` `DBServer_dbserver_id_functionalci` on((`DBServer_dbserver_id_dbserver`.`id` = `DBServer_dbserver_id_functionalci`.`id`))) join (`softwareinstance` `DBServer_dbserver_id_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`DBServer_dbserver_id_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`DBServer_dbserver_id_dbserver`.`id` = `DBServer_dbserver_id_softwareinstance`.`id`))) on((`_databaseschema`.`dbserver_id` = `DBServer_dbserver_id_dbserver`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_databaseschema`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DatacenterDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_DatacenterDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DatacenterDevice` AS select distinct `_datacenterdevice`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall` from ((((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_datacenterdevice`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_datacenterdevice`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DeliveryModel`
--

/*!50001 DROP VIEW IF EXISTS `view_DeliveryModel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DeliveryModel` AS select distinct `_deliverymodel`.`id` AS `id`,`_deliverymodel`.`name` AS `name`,`_deliverymodel`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_deliverymodel`.`description` AS `description`,cast(concat(coalesce(`_deliverymodel`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`deliverymodel` `_deliverymodel` join `organization` `Organization_org_id_organization` on((`_deliverymodel`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Document`
--

/*!50001 DROP VIEW IF EXISTS `view_Document`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Document` AS select distinct `_document`.`id` AS `id`,`_document`.`name` AS `name`,`_document`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_document`.`documenttype_id` AS `documenttype_id`,`DocumentType_documenttype_id_typology`.`name` AS `documenttype_name`,`_document`.`version` AS `version`,`_document`.`description` AS `description`,`_document`.`status` AS `status`,`_document`.`finalclass` AS `finalclass`,if((`_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`_document`.`name`,'')) as char charset utf8)) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`DocumentType_documenttype_id_typology`.`name`,'')) as char charset utf8) AS `documenttype_id_friendlyname` from ((`document` `_document` join `organization` `Organization_org_id_organization` on((`_document`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`documenttype` `DocumentType_documenttype_id_documenttype` join `typology` `DocumentType_documenttype_id_typology` on((`DocumentType_documenttype_id_documenttype`.`id` = `DocumentType_documenttype_id_typology`.`id`))) on((`_document`.`documenttype_id` = `DocumentType_documenttype_id_documenttype`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DocumentFile`
--

/*!50001 DROP VIEW IF EXISTS `view_DocumentFile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DocumentFile` AS select distinct `_documentfile`.`id` AS `id`,`_document`.`name` AS `name`,`_document`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_document`.`documenttype_id` AS `documenttype_id`,`DocumentType_documenttype_id_typology`.`name` AS `documenttype_name`,`_document`.`version` AS `version`,`_document`.`description` AS `description`,`_document`.`status` AS `status`,`_documentfile`.`file_mimetype` AS `file`,`_documentfile`.`file_data` AS `file_data`,`_documentfile`.`file_filename` AS `file_filename`,`_document`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_document`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`DocumentType_documenttype_id_typology`.`name`,'')) as char charset utf8) AS `documenttype_id_friendlyname` from (`documentfile` `_documentfile` join ((`document` `_document` join `organization` `Organization_org_id_organization` on((`_document`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`documenttype` `DocumentType_documenttype_id_documenttype` join `typology` `DocumentType_documenttype_id_typology` on((`DocumentType_documenttype_id_documenttype`.`id` = `DocumentType_documenttype_id_typology`.`id`))) on((`_document`.`documenttype_id` = `DocumentType_documenttype_id_documenttype`.`id`))) on((`_documentfile`.`id` = `_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DocumentNote`
--

/*!50001 DROP VIEW IF EXISTS `view_DocumentNote`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DocumentNote` AS select distinct `_documentnote`.`id` AS `id`,`_document`.`name` AS `name`,`_document`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_document`.`documenttype_id` AS `documenttype_id`,`DocumentType_documenttype_id_typology`.`name` AS `documenttype_name`,`_document`.`version` AS `version`,`_document`.`description` AS `description`,`_document`.`status` AS `status`,`_documentnote`.`text` AS `text`,`_document`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_document`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`DocumentType_documenttype_id_typology`.`name`,'')) as char charset utf8) AS `documenttype_id_friendlyname` from (`documentnote` `_documentnote` join ((`document` `_document` join `organization` `Organization_org_id_organization` on((`_document`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`documenttype` `DocumentType_documenttype_id_documenttype` join `typology` `DocumentType_documenttype_id_typology` on((`DocumentType_documenttype_id_documenttype`.`id` = `DocumentType_documenttype_id_typology`.`id`))) on((`_document`.`documenttype_id` = `DocumentType_documenttype_id_documenttype`.`id`))) on((`_documentnote`.`id` = `_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DocumentType`
--

/*!50001 DROP VIEW IF EXISTS `view_DocumentType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DocumentType` AS select distinct `_documenttype`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`documenttype` `_documenttype` join `typology` `_typology` on((`_documenttype`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_DocumentWeb`
--

/*!50001 DROP VIEW IF EXISTS `view_DocumentWeb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_DocumentWeb` AS select distinct `_documentweb`.`id` AS `id`,`_document`.`name` AS `name`,`_document`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_document`.`documenttype_id` AS `documenttype_id`,`DocumentType_documenttype_id_typology`.`name` AS `documenttype_name`,`_document`.`version` AS `version`,`_document`.`description` AS `description`,`_document`.`status` AS `status`,`_documentweb`.`url` AS `url`,`_document`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_document`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`DocumentType_documenttype_id_typology`.`name`,'')) as char charset utf8) AS `documenttype_id_friendlyname` from (`documentweb` `_documentweb` join ((`document` `_document` join `organization` `Organization_org_id_organization` on((`_document`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`documenttype` `DocumentType_documenttype_id_documenttype` join `typology` `DocumentType_documenttype_id_typology` on((`DocumentType_documenttype_id_documenttype`.`id` = `DocumentType_documenttype_id_typology`.`id`))) on((`_document`.`documenttype_id` = `DocumentType_documenttype_id_documenttype`.`id`))) on((`_documentweb`.`id` = `_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_EmergencyChange`
--

/*!50001 DROP VIEW IF EXISTS `view_EmergencyChange`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_EmergencyChange` AS select distinct `_change_emergency`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_change`.`status` AS `status`,`_change`.`reason` AS `reason`,`_change`.`requestor_id` AS `requestor_id`,`Person_requestor_id_contact`.`email` AS `requestor_email`,`_change`.`creation_date` AS `creation_date`,`_change`.`impact` AS `impact`,`_change`.`supervisor_group_id` AS `supervisor_group_id`,`Team_supervisor_group_id_contact`.`name` AS `supervisor_group_name`,`_change`.`supervisor_id` AS `supervisor_id`,`Person_supervisor_id_contact`.`email` AS `supervisor_email`,`_change`.`manager_group_id` AS `manager_group_id`,`Team_manager_group_id_contact`.`name` AS `manager_group_name`,`_change`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`email` AS `manager_email`,`_change`.`outage` AS `outage`,`_change`.`fallback` AS `fallback`,`_change`.`parent_id` AS `parent_id`,`Change_parent_id_ticket`.`ref` AS `parent_name`,`_change_approved`.`approval_date` AS `approval_date`,`_change_approved`.`approval_comment` AS `approval_comment`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_requestor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_requestor_id_contact`.`name`,'')) as char charset utf8) AS `requestor_id_friendlyname`,cast(concat(coalesce(`Team_supervisor_group_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_group_id_friendlyname`,cast(concat(coalesce(`Person_supervisor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_supervisor_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_id_friendlyname`,cast(concat(coalesce(`Team_manager_group_id_contact`.`name`,'')) as char charset utf8) AS `manager_group_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname`,cast(concat(coalesce(`Change_parent_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_id_friendlyname`,`Change_parent_id_ticket`.`finalclass` AS `parent_id_finalclass_recall` from (((`change_emergency` `_change_emergency` join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_change_emergency`.`id` = `_ticket`.`id`))) join ((((((`change` `_change` left join (`person` `Person_requestor_id_person` join `contact` `Person_requestor_id_contact` on((`Person_requestor_id_person`.`id` = `Person_requestor_id_contact`.`id`))) on((`_change`.`requestor_id` = `Person_requestor_id_person`.`id`))) left join (`team` `Team_supervisor_group_id_team` join `contact` `Team_supervisor_group_id_contact` on((`Team_supervisor_group_id_team`.`id` = `Team_supervisor_group_id_contact`.`id`))) on((`_change`.`supervisor_group_id` = `Team_supervisor_group_id_team`.`id`))) left join (`person` `Person_supervisor_id_person` join `contact` `Person_supervisor_id_contact` on((`Person_supervisor_id_person`.`id` = `Person_supervisor_id_contact`.`id`))) on((`_change`.`supervisor_id` = `Person_supervisor_id_person`.`id`))) left join (`team` `Team_manager_group_id_team` join `contact` `Team_manager_group_id_contact` on((`Team_manager_group_id_team`.`id` = `Team_manager_group_id_contact`.`id`))) on((`_change`.`manager_group_id` = `Team_manager_group_id_team`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_change`.`manager_id` = `Person_manager_id_person`.`id`))) left join (`change` `Change_parent_id_change` join `ticket` `Change_parent_id_ticket` on((`Change_parent_id_change`.`id` = `Change_parent_id_ticket`.`id`))) on((`_change`.`parent_id` = `Change_parent_id_change`.`id`))) on((`_change_emergency`.`id` = `_change`.`id`))) join `change_approved` `_change_approved` on((`_change_emergency`.`id` = `_change_approved`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Enclosure`
--

/*!50001 DROP VIEW IF EXISTS `view_Enclosure`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Enclosure` AS select distinct `_enclosure`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_enclosure`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_enclosure`.`nb_u` AS `nb_u`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname` from (((`enclosure` `_enclosure` join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_enclosure`.`rack_id` = `Rack_rack_id_rack`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_enclosure`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_enclosure`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Farm`
--

/*!50001 DROP VIEW IF EXISTS `view_Farm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Farm` AS select distinct `_farm`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_virtualdevice`.`status` AS `status`,`_farm`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from ((`farm` `_farm` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_farm`.`id` = `_functionalci`.`id`))) join `virtualdevice` `_virtualdevice` on((`_farm`.`id` = `_virtualdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_FiberChannelInterface`
--

/*!50001 DROP VIEW IF EXISTS `view_FiberChannelInterface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_FiberChannelInterface` AS select distinct `_fiberchannelinterface`.`id` AS `id`,`_networkinterface`.`name` AS `name`,`_fiberchannelinterface`.`speed` AS `speed`,`_fiberchannelinterface`.`topology` AS `topology`,`_fiberchannelinterface`.`wwn` AS `wwn`,`_fiberchannelinterface`.`datacenterdevice_id` AS `datacenterdevice_id`,`DatacenterDevice_datacenterdevice_id_functionalci`.`name` AS `datacenterdevice_name`,`_networkinterface`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`DatacenterDevice_datacenterdevice_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`DatacenterDevice_datacenterdevice_id_functionalci`.`name`,'')) as char charset utf8) AS `datacenterdevice_id_friendlyname`,`DatacenterDevice_datacenterdevice_id_functionalci`.`finalclass` AS `datacenterdevice_id_finalclass_recall` from ((`fiberchannelinterface` `_fiberchannelinterface` join (`datacenterdevice` `DatacenterDevice_datacenterdevice_id_datacenterdevice` join `functionalci` `DatacenterDevice_datacenterdevice_id_functionalci` on((`DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id` = `DatacenterDevice_datacenterdevice_id_functionalci`.`id`))) on((`_fiberchannelinterface`.`datacenterdevice_id` = `DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id`))) join `networkinterface` `_networkinterface` on((`_fiberchannelinterface`.`id` = `_networkinterface`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_FunctionalCI`
--

/*!50001 DROP VIEW IF EXISTS `view_FunctionalCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_FunctionalCI` AS select distinct `_functionalci`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_functionalci`.`finalclass` AS `finalclass`,if((`_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8)) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from ((`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`softwareinstance` `_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`_functionalci`.`id` = `_fn_SoftwareInstance_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Group`
--

/*!50001 DROP VIEW IF EXISTS `view_Group`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Group` AS select distinct `_group`.`id` AS `id`,`_group`.`name` AS `name`,`_group`.`status` AS `status`,`_group`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `owner_name`,`_group`.`description` AS `description`,`_group`.`type` AS `type`,`_group`.`parent_id` AS `parent_id`,`Group_parent_id_group`.`name` AS `parent_name`,cast(concat(coalesce(`_group`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Group_parent_id_group`.`name`,'')) as char charset utf8) AS `parent_id_friendlyname` from ((`group` `_group` join `organization` `Organization_org_id_organization` on((`_group`.`org_id` = `Organization_org_id_organization`.`id`))) left join `group` `Group_parent_id_group` on((`_group`.`parent_id` = `Group_parent_id_group`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Hypervisor`
--

/*!50001 DROP VIEW IF EXISTS `view_Hypervisor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Hypervisor` AS select distinct `_hypervisor`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_virtualdevice`.`status` AS `status`,`_hypervisor`.`farm_id` AS `farm_id`,`Farm_farm_id_functionalci`.`name` AS `farm_name`,`_hypervisor`.`server_id` AS `server_id`,`Server_server_id_functionalci`.`name` AS `server_name`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Farm_farm_id_functionalci`.`name`,'')) as char charset utf8) AS `farm_id_friendlyname`,cast(concat(coalesce(`Server_server_id_functionalci`.`name`,'')) as char charset utf8) AS `server_id_friendlyname` from ((((`hypervisor` `_hypervisor` left join (`farm` `Farm_farm_id_farm` join `functionalci` `Farm_farm_id_functionalci` on((`Farm_farm_id_farm`.`id` = `Farm_farm_id_functionalci`.`id`))) on((`_hypervisor`.`farm_id` = `Farm_farm_id_farm`.`id`))) left join (`server` `Server_server_id_server` join `functionalci` `Server_server_id_functionalci` on((`Server_server_id_server`.`id` = `Server_server_id_functionalci`.`id`))) on((`_hypervisor`.`server_id` = `Server_server_id_server`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_hypervisor`.`id` = `_functionalci`.`id`))) join `virtualdevice` `_virtualdevice` on((`_hypervisor`.`id` = `_virtualdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_IOSVersion`
--

/*!50001 DROP VIEW IF EXISTS `view_IOSVersion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_IOSVersion` AS select distinct `_iosversion`.`id` AS `id`,`_typology`.`name` AS `name`,`_iosversion`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,''),coalesce(' ',''),coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname` from ((`iosversion` `_iosversion` join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_iosversion`.`brand_id` = `Brand_brand_id_brand`.`id`))) join `typology` `_typology` on((`_iosversion`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_IPInterface`
--

/*!50001 DROP VIEW IF EXISTS `view_IPInterface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_IPInterface` AS select distinct `_ipinterface`.`id` AS `id`,`_networkinterface`.`name` AS `name`,`_ipinterface`.`ipaddress` AS `ipaddress`,`_ipinterface`.`macaddress` AS `macaddress`,`_ipinterface`.`comment` AS `comment`,`_ipinterface`.`ipgateway` AS `ipgateway`,`_ipinterface`.`ipmask` AS `ipmask`,`_ipinterface`.`speed` AS `speed`,`_networkinterface`.`finalclass` AS `finalclass`,if((`_networkinterface`.`finalclass` = 'IPInterface'),cast(concat(coalesce(`_networkinterface`.`name`,'')) as char charset utf8),if((`_networkinterface`.`finalclass` = 'LogicalInterface'),cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`VirtualMachine_virtualmachine_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8))) AS `friendlyname` from (((`ipinterface` `_ipinterface` join `networkinterface` `_networkinterface` on((`_ipinterface`.`id` = `_networkinterface`.`id`))) left join (`logicalinterface` `_fn_LogicalInterface_logicalinterface` join (`virtualmachine` `VirtualMachine_virtualmachine_id_virtualmachine` join `functionalci` `VirtualMachine_virtualmachine_id_functionalci` on((`VirtualMachine_virtualmachine_id_virtualmachine`.`id` = `VirtualMachine_virtualmachine_id_functionalci`.`id`))) on((`_fn_LogicalInterface_logicalinterface`.`virtualmachine_id` = `VirtualMachine_virtualmachine_id_virtualmachine`.`id`))) on((`_ipinterface`.`id` = `_fn_LogicalInterface_logicalinterface`.`id`))) left join (`physicalinterface` `_fn_PhysicalInterface_physicalinterface` join (`connectableci` `ConnectableCI_connectableci_id_connectableci` join `functionalci` `ConnectableCI_connectableci_id_functionalci` on((`ConnectableCI_connectableci_id_connectableci`.`id` = `ConnectableCI_connectableci_id_functionalci`.`id`))) on((`_fn_PhysicalInterface_physicalinterface`.`connectableci_id` = `ConnectableCI_connectableci_id_connectableci`.`id`))) on((`_ipinterface`.`id` = `_fn_PhysicalInterface_physicalinterface`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_IPPhone`
--

/*!50001 DROP VIEW IF EXISTS `view_IPPhone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_IPPhone` AS select distinct `_ipphone`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_telephonyci`.`phonenumber` AS `phonenumber`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from (((`ipphone` `_ipphone` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_ipphone`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_ipphone`.`id` = `_physicaldevice`.`id`))) join `telephonyci` `_telephonyci` on((`_ipphone`.`id` = `_telephonyci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Incident`
--

/*!50001 DROP VIEW IF EXISTS `view_Incident`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Incident` AS select distinct `_ticket_incident`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_ticket_incident`.`status` AS `status`,`_ticket_incident`.`impact` AS `impact`,`_ticket_incident`.`priority` AS `priority`,`_ticket_incident`.`urgency` AS `urgency`,`_ticket_incident`.`origin` AS `origin`,`_ticket_incident`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_ticket_incident`.`servicesubcategory_id` AS `servicesubcategory_id`,`ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`name` AS `servicesubcategory_name`,`_ticket_incident`.`escalation_flag` AS `escalation_flag`,`_ticket_incident`.`escalation_reason` AS `escalation_reason`,`_ticket_incident`.`assignment_date` AS `assignment_date`,`_ticket_incident`.`resolution_date` AS `resolution_date`,`_ticket_incident`.`last_pending_date` AS `last_pending_date`,`_ticket_incident`.`cumulatedpending_timespent` AS `cumulatedpending`,`_ticket_incident`.`cumulatedpending_started` AS `cumulatedpending_started`,`_ticket_incident`.`cumulatedpending_laststart` AS `cumulatedpending_laststart`,`_ticket_incident`.`cumulatedpending_stopped` AS `cumulatedpending_stopped`,`_ticket_incident`.`tto_timespent` AS `tto`,`_ticket_incident`.`tto_started` AS `tto_started`,`_ticket_incident`.`tto_laststart` AS `tto_laststart`,`_ticket_incident`.`tto_stopped` AS `tto_stopped`,`_ticket_incident`.`tto_75_deadline` AS `tto_75_deadline`,`_ticket_incident`.`tto_75_passed` AS `tto_75_passed`,`_ticket_incident`.`tto_75_triggered` AS `tto_75_triggered`,`_ticket_incident`.`tto_75_overrun` AS `tto_75_overrun`,`_ticket_incident`.`tto_100_deadline` AS `tto_100_deadline`,`_ticket_incident`.`tto_100_passed` AS `tto_100_passed`,`_ticket_incident`.`tto_100_triggered` AS `tto_100_triggered`,`_ticket_incident`.`tto_100_overrun` AS `tto_100_overrun`,`_ticket_incident`.`ttr_timespent` AS `ttr`,`_ticket_incident`.`ttr_started` AS `ttr_started`,`_ticket_incident`.`ttr_laststart` AS `ttr_laststart`,`_ticket_incident`.`ttr_stopped` AS `ttr_stopped`,`_ticket_incident`.`ttr_75_deadline` AS `ttr_75_deadline`,`_ticket_incident`.`ttr_75_passed` AS `ttr_75_passed`,`_ticket_incident`.`ttr_75_triggered` AS `ttr_75_triggered`,`_ticket_incident`.`ttr_75_overrun` AS `ttr_75_overrun`,`_ticket_incident`.`ttr_100_deadline` AS `ttr_100_deadline`,`_ticket_incident`.`ttr_100_passed` AS `ttr_100_passed`,`_ticket_incident`.`ttr_100_triggered` AS `ttr_100_triggered`,`_ticket_incident`.`ttr_100_overrun` AS `ttr_100_overrun`,`_ticket_incident`.`tto_100_deadline` AS `tto_escalation_deadline`,`_ticket_incident`.`tto_100_passed` AS `sla_tto_passed`,`_ticket_incident`.`tto_100_overrun` AS `sla_tto_over`,`_ticket_incident`.`ttr_100_deadline` AS `ttr_escalation_deadline`,`_ticket_incident`.`ttr_100_passed` AS `sla_ttr_passed`,`_ticket_incident`.`ttr_100_overrun` AS `sla_ttr_over`,`_ticket_incident`.`time_spent` AS `time_spent`,`_ticket_incident`.`resolution_code` AS `resolution_code`,`_ticket_incident`.`solution` AS `solution`,`_ticket_incident`.`pending_reason` AS `pending_reason`,`_ticket_incident`.`parent_incident_id` AS `parent_incident_id`,`Incident_parent_incident_id_ticket`.`ref` AS `parent_incident_ref`,`_ticket_incident`.`parent_change_id` AS `parent_change_id`,`Change_parent_change_id_ticket`.`ref` AS `parent_change_ref`,`_ticket_incident`.`public_log` AS `public_log`,`_ticket_incident`.`public_log_index` AS `public_log_index`,`_ticket_incident`.`user_satisfaction` AS `user_satisfaction`,`_ticket_incident`.`user_commment` AS `user_comment`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,cast(concat(coalesce(`ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`name`,'')) as char charset utf8) AS `servicesubcategory_id_friendlyname`,cast(concat(coalesce(`Incident_parent_incident_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_incident_id_friendlyname`,cast(concat(coalesce(`Change_parent_change_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_change_id_friendlyname`,`Change_parent_change_id_ticket`.`finalclass` AS `parent_change_id_finalclass_recall` from (((((`ticket_incident` `_ticket_incident` left join `service` `Service_service_id_service` on((`_ticket_incident`.`service_id` = `Service_service_id_service`.`id`))) left join `servicesubcategory` `ServiceSubcategory_servicesubcategory_id_servicesubcategory` on((`_ticket_incident`.`servicesubcategory_id` = `ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`id`))) left join (`ticket_incident` `Incident_parent_incident_id_ticket_incident` join `ticket` `Incident_parent_incident_id_ticket` on((`Incident_parent_incident_id_ticket_incident`.`id` = `Incident_parent_incident_id_ticket`.`id`))) on((`_ticket_incident`.`parent_incident_id` = `Incident_parent_incident_id_ticket_incident`.`id`))) left join (`change` `Change_parent_change_id_change` join `ticket` `Change_parent_change_id_ticket` on((`Change_parent_change_id_change`.`id` = `Change_parent_change_id_ticket`.`id`))) on((`_ticket_incident`.`parent_change_id` = `Change_parent_change_id_change`.`id`))) join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_ticket_incident`.`id` = `_ticket`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Licence`
--

/*!50001 DROP VIEW IF EXISTS `view_Licence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Licence` AS select distinct `_licence`.`id` AS `id`,`_licence`.`name` AS `name`,`_licence`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_licence`.`usage_limit` AS `usage_limit`,`_licence`.`description` AS `description`,`_licence`.`start_date` AS `start_date`,`_licence`.`end_date` AS `end_date`,`_licence`.`licence_key` AS `licence_key`,`_licence`.`perpetual` AS `perpetual`,`_licence`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_licence`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`licence` `_licence` join `organization` `Organization_org_id_organization` on((`_licence`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Location`
--

/*!50001 DROP VIEW IF EXISTS `view_Location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Location` AS select distinct `_location`.`id` AS `id`,`_location`.`name` AS `name`,`_location`.`status` AS `status`,`_location`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_location`.`address` AS `address`,`_location`.`postal_code` AS `postal_code`,`_location`.`city` AS `city`,`_location`.`country` AS `country`,cast(concat(coalesce(`_location`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`location` `_location` join `organization` `Organization_org_id_organization` on((`_location`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_LogicalInterface`
--

/*!50001 DROP VIEW IF EXISTS `view_LogicalInterface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_LogicalInterface` AS select distinct `_logicalinterface`.`id` AS `id`,`_networkinterface`.`name` AS `name`,`_ipinterface`.`ipaddress` AS `ipaddress`,`_ipinterface`.`macaddress` AS `macaddress`,`_ipinterface`.`comment` AS `comment`,`_ipinterface`.`ipgateway` AS `ipgateway`,`_ipinterface`.`ipmask` AS `ipmask`,`_ipinterface`.`speed` AS `speed`,`_logicalinterface`.`virtualmachine_id` AS `virtualmachine_id`,`VirtualMachine_virtualmachine_id_functionalci`.`name` AS `virtualmachine_name`,`_networkinterface`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`VirtualMachine_virtualmachine_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`VirtualMachine_virtualmachine_id_functionalci`.`name`,'')) as char charset utf8) AS `virtualmachine_id_friendlyname` from (((`logicalinterface` `_logicalinterface` join (`virtualmachine` `VirtualMachine_virtualmachine_id_virtualmachine` join `functionalci` `VirtualMachine_virtualmachine_id_functionalci` on((`VirtualMachine_virtualmachine_id_virtualmachine`.`id` = `VirtualMachine_virtualmachine_id_functionalci`.`id`))) on((`_logicalinterface`.`virtualmachine_id` = `VirtualMachine_virtualmachine_id_virtualmachine`.`id`))) join `networkinterface` `_networkinterface` on((`_logicalinterface`.`id` = `_networkinterface`.`id`))) join `ipinterface` `_ipinterface` on((`_logicalinterface`.`id` = `_ipinterface`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_LogicalVolume`
--

/*!50001 DROP VIEW IF EXISTS `view_LogicalVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_LogicalVolume` AS select distinct `_logicalvolume`.`id` AS `id`,`_logicalvolume`.`name` AS `name`,`_logicalvolume`.`lun_id` AS `lun_id`,`_logicalvolume`.`description` AS `description`,`_logicalvolume`.`raid_level` AS `raid_level`,`_logicalvolume`.`size` AS `size`,`_logicalvolume`.`storagesystem_id` AS `storagesystem_id`,`StorageSystem_storagesystem_id_functionalci`.`name` AS `storagesystem_name`,cast(concat(coalesce(`StorageSystem_storagesystem_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`_logicalvolume`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`StorageSystem_storagesystem_id_functionalci`.`name`,'')) as char charset utf8) AS `storagesystem_id_friendlyname` from (`logicalvolume` `_logicalvolume` join (`storagesystem` `StorageSystem_storagesystem_id_storagesystem` join `functionalci` `StorageSystem_storagesystem_id_functionalci` on((`StorageSystem_storagesystem_id_storagesystem`.`id` = `StorageSystem_storagesystem_id_functionalci`.`id`))) on((`_logicalvolume`.`storagesystem_id` = `StorageSystem_storagesystem_id_storagesystem`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Middleware`
--

/*!50001 DROP VIEW IF EXISTS `view_Middleware`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Middleware` AS select distinct `_middleware`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((`middleware` `_middleware` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_middleware`.`id` = `_functionalci`.`id`))) join (((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) on((`_middleware`.`id` = `_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_MiddlewareInstance`
--

/*!50001 DROP VIEW IF EXISTS `view_MiddlewareInstance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_MiddlewareInstance` AS select distinct `_middlewareinstance`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_middlewareinstance`.`middleware_id` AS `middleware_id`,`Middleware_middleware_id_functionalci`.`name` AS `middleware_name`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Middleware_middleware_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `middleware_id_friendlyname` from ((`middlewareinstance` `_middlewareinstance` join ((`middleware` `Middleware_middleware_id_middleware` join `functionalci` `Middleware_middleware_id_functionalci` on((`Middleware_middleware_id_middleware`.`id` = `Middleware_middleware_id_functionalci`.`id`))) join (`softwareinstance` `Middleware_middleware_id_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`Middleware_middleware_id_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`Middleware_middleware_id_middleware`.`id` = `Middleware_middleware_id_softwareinstance`.`id`))) on((`_middlewareinstance`.`middleware_id` = `Middleware_middleware_id_middleware`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_middlewareinstance`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_MobilePhone`
--

/*!50001 DROP VIEW IF EXISTS `view_MobilePhone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_MobilePhone` AS select distinct `_mobilephone`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_telephonyci`.`phonenumber` AS `phonenumber`,`_mobilephone`.`imei` AS `imei`,`_mobilephone`.`hw_pin` AS `hw_pin`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from (((`mobilephone` `_mobilephone` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_mobilephone`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_mobilephone`.`id` = `_physicaldevice`.`id`))) join `telephonyci` `_telephonyci` on((`_mobilephone`.`id` = `_telephonyci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Model`
--

/*!50001 DROP VIEW IF EXISTS `view_Model`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Model` AS select distinct `_model`.`id` AS `id`,`_typology`.`name` AS `name`,`_model`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_model`.`type` AS `type`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname` from ((`model` `_model` join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_model`.`brand_id` = `Brand_brand_id_brand`.`id`))) join `typology` `_typology` on((`_model`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NAS`
--

/*!50001 DROP VIEW IF EXISTS `view_NAS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NAS` AS select distinct `_nas`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall` from (((`nas` `_nas` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_nas`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_nas`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_nas`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NASFileSystem`
--

/*!50001 DROP VIEW IF EXISTS `view_NASFileSystem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NASFileSystem` AS select distinct `_nasfilesystem`.`id` AS `id`,`_nasfilesystem`.`name` AS `name`,`_nasfilesystem`.`description` AS `description`,`_nasfilesystem`.`raid_level` AS `raid_level`,`_nasfilesystem`.`size` AS `size`,`_nasfilesystem`.`nas_id` AS `nas_id`,`NAS_nas_id_functionalci`.`name` AS `nas_name`,cast(concat(coalesce(`_nasfilesystem`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`NAS_nas_id_functionalci`.`name`,'')) as char charset utf8) AS `nas_id_friendlyname` from (`nasfilesystem` `_nasfilesystem` join (`nas` `NAS_nas_id_nas` join `functionalci` `NAS_nas_id_functionalci` on((`NAS_nas_id_nas`.`id` = `NAS_nas_id_functionalci`.`id`))) on((`_nasfilesystem`.`nas_id` = `NAS_nas_id_nas`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NetworkDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_NetworkDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NetworkDevice` AS select distinct `_networkdevice`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id1_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_networkdevice`.`networkdevicetype_id` AS `networkdevicetype_id`,`NetworkDeviceType_networkdevicetype_id_typology`.`name` AS `networkdevicetype_name`,`_networkdevice`.`iosversion_id` AS `iosversion_id`,`IOSVersion_iosversion_id_typology`.`name` AS `iosversion_name`,`_networkdevice`.`ram` AS `ram`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id1_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall`,cast(concat(coalesce(`NetworkDeviceType_networkdevicetype_id_typology`.`name`,'')) as char charset utf8) AS `networkdevicetype_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,''),coalesce(' ',''),coalesce(`IOSVersion_iosversion_id_typology`.`name`,'')) as char charset utf8) AS `iosversion_id_friendlyname` from (((((`networkdevice` `_networkdevice` join (`networkdevicetype` `NetworkDeviceType_networkdevicetype_id_networkdevicetype` join `typology` `NetworkDeviceType_networkdevicetype_id_typology` on((`NetworkDeviceType_networkdevicetype_id_networkdevicetype`.`id` = `NetworkDeviceType_networkdevicetype_id_typology`.`id`))) on((`_networkdevice`.`networkdevicetype_id` = `NetworkDeviceType_networkdevicetype_id_networkdevicetype`.`id`))) left join ((`iosversion` `IOSVersion_iosversion_id_iosversion` join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`IOSVersion_iosversion_id_iosversion`.`brand_id` = `Brand_brand_id_brand`.`id`))) join `typology` `IOSVersion_iosversion_id_typology` on((`IOSVersion_iosversion_id_iosversion`.`id` = `IOSVersion_iosversion_id_typology`.`id`))) on((`_networkdevice`.`iosversion_id` = `IOSVersion_iosversion_id_iosversion`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_networkdevice`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id1_brand` join `typology` `Brand_brand_id1_typology` on((`Brand_brand_id1_brand`.`id` = `Brand_brand_id1_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id1_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_networkdevice`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_networkdevice`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NetworkDeviceType`
--

/*!50001 DROP VIEW IF EXISTS `view_NetworkDeviceType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NetworkDeviceType` AS select distinct `_networkdevicetype`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`networkdevicetype` `_networkdevicetype` join `typology` `_typology` on((`_networkdevicetype`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NetworkInterface`
--

/*!50001 DROP VIEW IF EXISTS `view_NetworkInterface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NetworkInterface` AS select distinct `_networkinterface`.`id` AS `id`,`_networkinterface`.`name` AS `name`,`_networkinterface`.`finalclass` AS `finalclass`,if((`_networkinterface`.`finalclass` = 'NetworkInterface'),cast(concat(coalesce(`_networkinterface`.`name`,'')) as char charset utf8),if((`_networkinterface`.`finalclass` = 'LogicalInterface'),cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`VirtualMachine_virtualmachine_id_functionalci`.`name`,'')) as char charset utf8),if((`_networkinterface`.`finalclass` = 'FiberChannelInterface'),cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`DatacenterDevice_datacenterdevice_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8)))) AS `friendlyname` from (((`networkinterface` `_networkinterface` left join (`logicalinterface` `_fn_LogicalInterface_logicalinterface` join (`virtualmachine` `VirtualMachine_virtualmachine_id_virtualmachine` join `functionalci` `VirtualMachine_virtualmachine_id_functionalci` on((`VirtualMachine_virtualmachine_id_virtualmachine`.`id` = `VirtualMachine_virtualmachine_id_functionalci`.`id`))) on((`_fn_LogicalInterface_logicalinterface`.`virtualmachine_id` = `VirtualMachine_virtualmachine_id_virtualmachine`.`id`))) on((`_networkinterface`.`id` = `_fn_LogicalInterface_logicalinterface`.`id`))) left join (`fiberchannelinterface` `_fn_FiberChannelInterface_fiberchannelinterface` join (`datacenterdevice` `DatacenterDevice_datacenterdevice_id_datacenterdevice` join `functionalci` `DatacenterDevice_datacenterdevice_id_functionalci` on((`DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id` = `DatacenterDevice_datacenterdevice_id_functionalci`.`id`))) on((`_fn_FiberChannelInterface_fiberchannelinterface`.`datacenterdevice_id` = `DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id`))) on((`_networkinterface`.`id` = `_fn_FiberChannelInterface_fiberchannelinterface`.`id`))) left join (`physicalinterface` `_fn_PhysicalInterface_physicalinterface` join (`connectableci` `ConnectableCI_connectableci_id_connectableci` join `functionalci` `ConnectableCI_connectableci_id_functionalci` on((`ConnectableCI_connectableci_id_connectableci`.`id` = `ConnectableCI_connectableci_id_functionalci`.`id`))) on((`_fn_PhysicalInterface_physicalinterface`.`connectableci_id` = `ConnectableCI_connectableci_id_connectableci`.`id`))) on((`_networkinterface`.`id` = `_fn_PhysicalInterface_physicalinterface`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_NormalChange`
--

/*!50001 DROP VIEW IF EXISTS `view_NormalChange`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_NormalChange` AS select distinct `_change_normal`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_change`.`status` AS `status`,`_change`.`reason` AS `reason`,`_change`.`requestor_id` AS `requestor_id`,`Person_requestor_id_contact`.`email` AS `requestor_email`,`_change`.`creation_date` AS `creation_date`,`_change`.`impact` AS `impact`,`_change`.`supervisor_group_id` AS `supervisor_group_id`,`Team_supervisor_group_id_contact`.`name` AS `supervisor_group_name`,`_change`.`supervisor_id` AS `supervisor_id`,`Person_supervisor_id_contact`.`email` AS `supervisor_email`,`_change`.`manager_group_id` AS `manager_group_id`,`Team_manager_group_id_contact`.`name` AS `manager_group_name`,`_change`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`email` AS `manager_email`,`_change`.`outage` AS `outage`,`_change`.`fallback` AS `fallback`,`_change`.`parent_id` AS `parent_id`,`Change_parent_id_ticket`.`ref` AS `parent_name`,`_change_approved`.`approval_date` AS `approval_date`,`_change_approved`.`approval_comment` AS `approval_comment`,`_change_normal`.`acceptance_date` AS `acceptance_date`,`_change_normal`.`acceptance_comment` AS `acceptance_comment`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_requestor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_requestor_id_contact`.`name`,'')) as char charset utf8) AS `requestor_id_friendlyname`,cast(concat(coalesce(`Team_supervisor_group_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_group_id_friendlyname`,cast(concat(coalesce(`Person_supervisor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_supervisor_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_id_friendlyname`,cast(concat(coalesce(`Team_manager_group_id_contact`.`name`,'')) as char charset utf8) AS `manager_group_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname`,cast(concat(coalesce(`Change_parent_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_id_friendlyname`,`Change_parent_id_ticket`.`finalclass` AS `parent_id_finalclass_recall` from (((`change_normal` `_change_normal` join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_change_normal`.`id` = `_ticket`.`id`))) join ((((((`change` `_change` left join (`person` `Person_requestor_id_person` join `contact` `Person_requestor_id_contact` on((`Person_requestor_id_person`.`id` = `Person_requestor_id_contact`.`id`))) on((`_change`.`requestor_id` = `Person_requestor_id_person`.`id`))) left join (`team` `Team_supervisor_group_id_team` join `contact` `Team_supervisor_group_id_contact` on((`Team_supervisor_group_id_team`.`id` = `Team_supervisor_group_id_contact`.`id`))) on((`_change`.`supervisor_group_id` = `Team_supervisor_group_id_team`.`id`))) left join (`person` `Person_supervisor_id_person` join `contact` `Person_supervisor_id_contact` on((`Person_supervisor_id_person`.`id` = `Person_supervisor_id_contact`.`id`))) on((`_change`.`supervisor_id` = `Person_supervisor_id_person`.`id`))) left join (`team` `Team_manager_group_id_team` join `contact` `Team_manager_group_id_contact` on((`Team_manager_group_id_team`.`id` = `Team_manager_group_id_contact`.`id`))) on((`_change`.`manager_group_id` = `Team_manager_group_id_team`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_change`.`manager_id` = `Person_manager_id_person`.`id`))) left join (`change` `Change_parent_id_change` join `ticket` `Change_parent_id_ticket` on((`Change_parent_id_change`.`id` = `Change_parent_id_ticket`.`id`))) on((`_change`.`parent_id` = `Change_parent_id_change`.`id`))) on((`_change_normal`.`id` = `_change`.`id`))) join `change_approved` `_change_approved` on((`_change_normal`.`id` = `_change_approved`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_OSFamily`
--

/*!50001 DROP VIEW IF EXISTS `view_OSFamily`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_OSFamily` AS select distinct `_osfamily`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname` from (`osfamily` `_osfamily` join `typology` `_typology` on((`_osfamily`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_OSLicence`
--

/*!50001 DROP VIEW IF EXISTS `view_OSLicence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_OSLicence` AS select distinct `_oslicence`.`id` AS `id`,`_licence`.`name` AS `name`,`_licence`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_licence`.`usage_limit` AS `usage_limit`,`_licence`.`description` AS `description`,`_licence`.`start_date` AS `start_date`,`_licence`.`end_date` AS `end_date`,`_licence`.`licence_key` AS `licence_key`,`_licence`.`perpetual` AS `perpetual`,`_oslicence`.`osversion_id` AS `osversion_id`,`OSVersion_osversion_id_typology`.`name` AS `osversion_name`,`_licence`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_licence`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`OSVersion_osversion_id_typology`.`name`,'')) as char charset utf8) AS `osversion_id_friendlyname` from ((`oslicence` `_oslicence` join (`osversion` `OSVersion_osversion_id_osversion` join `typology` `OSVersion_osversion_id_typology` on((`OSVersion_osversion_id_osversion`.`id` = `OSVersion_osversion_id_typology`.`id`))) on((`_oslicence`.`osversion_id` = `OSVersion_osversion_id_osversion`.`id`))) join (`licence` `_licence` join `organization` `Organization_org_id_organization` on((`_licence`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_oslicence`.`id` = `_licence`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_OSPatch`
--

/*!50001 DROP VIEW IF EXISTS `view_OSPatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_OSPatch` AS select distinct `_ospatch`.`id` AS `id`,`_patch`.`name` AS `name`,`_patch`.`description` AS `description`,`_ospatch`.`osversion_id` AS `osversion_id`,`OSVersion_osversion_id_typology`.`name` AS `osversion_name`,`_patch`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_patch`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`OSVersion_osversion_id_typology`.`name`,'')) as char charset utf8) AS `osversion_id_friendlyname` from ((`ospatch` `_ospatch` join (`osversion` `OSVersion_osversion_id_osversion` join `typology` `OSVersion_osversion_id_typology` on((`OSVersion_osversion_id_osversion`.`id` = `OSVersion_osversion_id_typology`.`id`))) on((`_ospatch`.`osversion_id` = `OSVersion_osversion_id_osversion`.`id`))) join `patch` `_patch` on((`_ospatch`.`id` = `_patch`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_OSVersion`
--

/*!50001 DROP VIEW IF EXISTS `view_OSVersion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_OSVersion` AS select distinct `_osversion`.`id` AS `id`,`_typology`.`name` AS `name`,`_osversion`.`osfamily_id` AS `osfamily_id`,`OSFamily_osfamily_id_typology`.`name` AS `osfamily_name`,`_typology`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`OSFamily_osfamily_id_typology`.`name`,'')) as char charset utf8) AS `osfamily_id_friendlyname` from ((`osversion` `_osversion` join (`osfamily` `OSFamily_osfamily_id_osfamily` join `typology` `OSFamily_osfamily_id_typology` on((`OSFamily_osfamily_id_osfamily`.`id` = `OSFamily_osfamily_id_typology`.`id`))) on((`_osversion`.`osfamily_id` = `OSFamily_osfamily_id_osfamily`.`id`))) join `typology` `_typology` on((`_osversion`.`id` = `_typology`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Organization`
--

/*!50001 DROP VIEW IF EXISTS `view_Organization`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Organization` AS select distinct `_organization`.`id` AS `id`,`_organization`.`name` AS `name`,`_organization`.`code` AS `code`,`_organization`.`status` AS `status`,`_organization`.`parent_id` AS `parent_id`,`Organization_parent_id_organization`.`name` AS `parent_name`,`_organization`.`deliverymodel_id` AS `deliverymodel_id`,`DeliveryModel_deliverymodel_id_deliverymodel`.`name` AS `deliverymodel_name`,cast(concat(coalesce(`_organization`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_parent_id_organization`.`name`,'')) as char charset utf8) AS `parent_id_friendlyname`,cast(concat(coalesce(`DeliveryModel_deliverymodel_id_deliverymodel`.`name`,'')) as char charset utf8) AS `deliverymodel_id_friendlyname` from ((`organization` `_organization` left join `organization` `Organization_parent_id_organization` on((`_organization`.`parent_id` = `Organization_parent_id_organization`.`id`))) left join `deliverymodel` `DeliveryModel_deliverymodel_id_deliverymodel` on((`_organization`.`deliverymodel_id` = `DeliveryModel_deliverymodel_id_deliverymodel`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_OtherSoftware`
--

/*!50001 DROP VIEW IF EXISTS `view_OtherSoftware`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_OtherSoftware` AS select distinct `_othersoftware`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((`othersoftware` `_othersoftware` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_othersoftware`.`id` = `_functionalci`.`id`))) join (((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) on((`_othersoftware`.`id` = `_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PC`
--

/*!50001 DROP VIEW IF EXISTS `view_PC`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PC` AS select distinct `_pc`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_pc`.`osfamily_id` AS `osfamily_id`,`OSFamily_osfamily_id_typology`.`name` AS `osfamily_name`,`_pc`.`osversion_id` AS `osversion_id`,`OSVersion_osversion_id_typology`.`name` AS `osversion_name`,`_pc`.`cpu` AS `cpu`,`_pc`.`ram` AS `ram`,`_pc`.`type` AS `type`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`OSFamily_osfamily_id_typology`.`name`,'')) as char charset utf8) AS `osfamily_id_friendlyname`,cast(concat(coalesce(`OSVersion_osversion_id_typology`.`name`,'')) as char charset utf8) AS `osversion_id_friendlyname` from ((((`pc` `_pc` left join (`osfamily` `OSFamily_osfamily_id_osfamily` join `typology` `OSFamily_osfamily_id_typology` on((`OSFamily_osfamily_id_osfamily`.`id` = `OSFamily_osfamily_id_typology`.`id`))) on((`_pc`.`osfamily_id` = `OSFamily_osfamily_id_osfamily`.`id`))) left join (`osversion` `OSVersion_osversion_id_osversion` join `typology` `OSVersion_osversion_id_typology` on((`OSVersion_osversion_id_osversion`.`id` = `OSVersion_osversion_id_typology`.`id`))) on((`_pc`.`osversion_id` = `OSVersion_osversion_id_osversion`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_pc`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_pc`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PCSoftware`
--

/*!50001 DROP VIEW IF EXISTS `view_PCSoftware`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PCSoftware` AS select distinct `_pcsoftware`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((`pcsoftware` `_pcsoftware` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_pcsoftware`.`id` = `_functionalci`.`id`))) join (((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) on((`_pcsoftware`.`id` = `_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PDU`
--

/*!50001 DROP VIEW IF EXISTS `view_PDU`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PDU` AS select distinct `_pdu`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_pdu`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_pdu`.`powerstart_id` AS `powerstart_id`,`PowerConnection_powerstart_id_functionalci`.`name` AS `powerstart_name`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerstart_id_functionalci`.`name`,'')) as char charset utf8) AS `powerstart_id_friendlyname`,`PowerConnection_powerstart_id_functionalci`.`finalclass` AS `powerstart_id_finalclass_recall` from ((((`pdu` `_pdu` join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_pdu`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`powerconnection` `PowerConnection_powerstart_id_powerconnection` join `functionalci` `PowerConnection_powerstart_id_functionalci` on((`PowerConnection_powerstart_id_powerconnection`.`id` = `PowerConnection_powerstart_id_functionalci`.`id`))) on((`_pdu`.`powerstart_id` = `PowerConnection_powerstart_id_powerconnection`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_pdu`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_pdu`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Patch`
--

/*!50001 DROP VIEW IF EXISTS `view_Patch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Patch` AS select distinct `_patch`.`id` AS `id`,`_patch`.`name` AS `name`,`_patch`.`description` AS `description`,`_patch`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_patch`.`name`,'')) as char charset utf8) AS `friendlyname` from `patch` `_patch` where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Peripheral`
--

/*!50001 DROP VIEW IF EXISTS `view_Peripheral`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Peripheral` AS select distinct `_peripheral`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`peripheral` `_peripheral` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_peripheral`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_peripheral`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Person`
--

/*!50001 DROP VIEW IF EXISTS `view_Person`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Person` AS select distinct `_person`.`id` AS `id`,`_contact`.`name` AS `name`,`_contact`.`status` AS `status`,`_contact`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_contact`.`email` AS `email`,`_contact`.`phone` AS `phone`,`_contact`.`notify` AS `notify`,`_contact`.`function` AS `function`,`_person`.`picture_mimetype` AS `picture`,`_person`.`picture_data` AS `picture_data`,`_person`.`picture_filename` AS `picture_filename`,`_person`.`first_name` AS `first_name`,`_person`.`employee_number` AS `employee_number`,`_person`.`mobile_phone` AS `mobile_phone`,`_person`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_person`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`name` AS `manager_name`,`_contact`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_person`.`first_name`,''),coalesce(' ',''),coalesce(`_contact`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname` from (((`person` `_person` left join `location` `Location_location_id_location` on((`_person`.`location_id` = `Location_location_id_location`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_person`.`manager_id` = `Person_manager_id_person`.`id`))) join (`contact` `_contact` join `organization` `Organization_org_id_organization` on((`_contact`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_person`.`id` = `_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Phone`
--

/*!50001 DROP VIEW IF EXISTS `view_Phone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Phone` AS select distinct `_phone`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_telephonyci`.`phonenumber` AS `phonenumber`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from (((`phone` `_phone` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_phone`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_phone`.`id` = `_physicaldevice`.`id`))) join `telephonyci` `_telephonyci` on((`_phone`.`id` = `_telephonyci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PhysicalDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_PhysicalDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PhysicalDevice` AS select distinct `_physicaldevice`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_physicaldevice`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PhysicalInterface`
--

/*!50001 DROP VIEW IF EXISTS `view_PhysicalInterface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PhysicalInterface` AS select distinct `_physicalinterface`.`id` AS `id`,`_networkinterface`.`name` AS `name`,`_ipinterface`.`ipaddress` AS `ipaddress`,`_ipinterface`.`macaddress` AS `macaddress`,`_ipinterface`.`comment` AS `comment`,`_ipinterface`.`ipgateway` AS `ipgateway`,`_ipinterface`.`ipmask` AS `ipmask`,`_ipinterface`.`speed` AS `speed`,`_physicalinterface`.`connectableci_id` AS `connectableci_id`,`ConnectableCI_connectableci_id_functionalci`.`name` AS `connectableci_name`,`_networkinterface`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8) AS `connectableci_id_friendlyname`,`ConnectableCI_connectableci_id_functionalci`.`finalclass` AS `connectableci_id_finalclass_recall` from (((`physicalinterface` `_physicalinterface` join (`connectableci` `ConnectableCI_connectableci_id_connectableci` join `functionalci` `ConnectableCI_connectableci_id_functionalci` on((`ConnectableCI_connectableci_id_connectableci`.`id` = `ConnectableCI_connectableci_id_functionalci`.`id`))) on((`_physicalinterface`.`connectableci_id` = `ConnectableCI_connectableci_id_connectableci`.`id`))) join `networkinterface` `_networkinterface` on((`_physicalinterface`.`id` = `_networkinterface`.`id`))) join `ipinterface` `_ipinterface` on((`_physicalinterface`.`id` = `_ipinterface`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PowerConnection`
--

/*!50001 DROP VIEW IF EXISTS `view_PowerConnection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PowerConnection` AS select distinct `_powerconnection`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`powerconnection` `_powerconnection` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_powerconnection`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_powerconnection`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_PowerSource`
--

/*!50001 DROP VIEW IF EXISTS `view_PowerSource`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_PowerSource` AS select distinct `_powersource`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`powersource` `_powersource` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_powersource`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_powersource`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Printer`
--

/*!50001 DROP VIEW IF EXISTS `view_Printer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Printer` AS select distinct `_printer`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`printer` `_printer` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_printer`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_printer`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ProviderContract`
--

/*!50001 DROP VIEW IF EXISTS `view_ProviderContract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ProviderContract` AS select distinct `_providercontract`.`id` AS `id`,`_contract`.`name` AS `name`,`_contract`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_contract`.`description` AS `description`,`_contract`.`start_date` AS `start_date`,`_contract`.`end_date` AS `end_date`,`_contract`.`cost` AS `cost`,`_contract`.`cost_currency` AS `cost_currency`,`_contract`.`contracttype_id` AS `contracttype_id`,`ContractType_contracttype_id_typology`.`name` AS `contracttype_name`,`_contract`.`billing_frequency` AS `billing_frequency`,`_contract`.`cost_unit` AS `cost_unit`,`_contract`.`provider_id` AS `provider_id`,`Organization_provider_id_organization`.`name` AS `provider_name`,`_contract`.`status` AS `status`,`_providercontract`.`sla` AS `sla`,`_providercontract`.`coverage` AS `coverage`,`_contract`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_contract`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`ContractType_contracttype_id_typology`.`name`,'')) as char charset utf8) AS `contracttype_id_friendlyname`,cast(concat(coalesce(`Organization_provider_id_organization`.`name`,'')) as char charset utf8) AS `provider_id_friendlyname` from (`providercontract` `_providercontract` join (((`contract` `_contract` join `organization` `Organization_org_id_organization` on((`_contract`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`contracttype` `ContractType_contracttype_id_contracttype` join `typology` `ContractType_contracttype_id_typology` on((`ContractType_contracttype_id_contracttype`.`id` = `ContractType_contracttype_id_typology`.`id`))) on((`_contract`.`contracttype_id` = `ContractType_contracttype_id_contracttype`.`id`))) join `organization` `Organization_provider_id_organization` on((`_contract`.`provider_id` = `Organization_provider_id_organization`.`id`))) on((`_providercontract`.`id` = `_contract`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Rack`
--

/*!50001 DROP VIEW IF EXISTS `view_Rack`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Rack` AS select distinct `_rack`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_rack`.`nb_u` AS `nb_u`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`rack` `_rack` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_rack`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_rack`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_RoutineChange`
--

/*!50001 DROP VIEW IF EXISTS `view_RoutineChange`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_RoutineChange` AS select distinct `_change_routine`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_change`.`status` AS `status`,`_change`.`reason` AS `reason`,`_change`.`requestor_id` AS `requestor_id`,`Person_requestor_id_contact`.`email` AS `requestor_email`,`_change`.`creation_date` AS `creation_date`,`_change`.`impact` AS `impact`,`_change`.`supervisor_group_id` AS `supervisor_group_id`,`Team_supervisor_group_id_contact`.`name` AS `supervisor_group_name`,`_change`.`supervisor_id` AS `supervisor_id`,`Person_supervisor_id_contact`.`email` AS `supervisor_email`,`_change`.`manager_group_id` AS `manager_group_id`,`Team_manager_group_id_contact`.`name` AS `manager_group_name`,`_change`.`manager_id` AS `manager_id`,`Person_manager_id_contact`.`email` AS `manager_email`,`_change`.`outage` AS `outage`,`_change`.`fallback` AS `fallback`,`_change`.`parent_id` AS `parent_id`,`Change_parent_id_ticket`.`ref` AS `parent_name`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_requestor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_requestor_id_contact`.`name`,'')) as char charset utf8) AS `requestor_id_friendlyname`,cast(concat(coalesce(`Team_supervisor_group_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_group_id_friendlyname`,cast(concat(coalesce(`Person_supervisor_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_supervisor_id_contact`.`name`,'')) as char charset utf8) AS `supervisor_id_friendlyname`,cast(concat(coalesce(`Team_manager_group_id_contact`.`name`,'')) as char charset utf8) AS `manager_group_id_friendlyname`,cast(concat(coalesce(`Person_manager_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_manager_id_contact`.`name`,'')) as char charset utf8) AS `manager_id_friendlyname`,cast(concat(coalesce(`Change_parent_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_id_friendlyname`,`Change_parent_id_ticket`.`finalclass` AS `parent_id_finalclass_recall` from ((`change_routine` `_change_routine` join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_change_routine`.`id` = `_ticket`.`id`))) join ((((((`change` `_change` left join (`person` `Person_requestor_id_person` join `contact` `Person_requestor_id_contact` on((`Person_requestor_id_person`.`id` = `Person_requestor_id_contact`.`id`))) on((`_change`.`requestor_id` = `Person_requestor_id_person`.`id`))) left join (`team` `Team_supervisor_group_id_team` join `contact` `Team_supervisor_group_id_contact` on((`Team_supervisor_group_id_team`.`id` = `Team_supervisor_group_id_contact`.`id`))) on((`_change`.`supervisor_group_id` = `Team_supervisor_group_id_team`.`id`))) left join (`person` `Person_supervisor_id_person` join `contact` `Person_supervisor_id_contact` on((`Person_supervisor_id_person`.`id` = `Person_supervisor_id_contact`.`id`))) on((`_change`.`supervisor_id` = `Person_supervisor_id_person`.`id`))) left join (`team` `Team_manager_group_id_team` join `contact` `Team_manager_group_id_contact` on((`Team_manager_group_id_team`.`id` = `Team_manager_group_id_contact`.`id`))) on((`_change`.`manager_group_id` = `Team_manager_group_id_team`.`id`))) left join (`person` `Person_manager_id_person` join `contact` `Person_manager_id_contact` on((`Person_manager_id_person`.`id` = `Person_manager_id_contact`.`id`))) on((`_change`.`manager_id` = `Person_manager_id_person`.`id`))) left join (`change` `Change_parent_id_change` join `ticket` `Change_parent_id_ticket` on((`Change_parent_id_change`.`id` = `Change_parent_id_ticket`.`id`))) on((`_change`.`parent_id` = `Change_parent_id_change`.`id`))) on((`_change_routine`.`id` = `_change`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SANSwitch`
--

/*!50001 DROP VIEW IF EXISTS `view_SANSwitch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SANSwitch` AS select distinct `_sanswitch`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall` from (((`sanswitch` `_sanswitch` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_sanswitch`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_sanswitch`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_sanswitch`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SLA`
--

/*!50001 DROP VIEW IF EXISTS `view_SLA`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SLA` AS select distinct `_sla`.`id` AS `id`,`_sla`.`name` AS `name`,`_sla`.`description` AS `description`,`_sla`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,cast(concat(coalesce(`_sla`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`sla` `_sla` join `organization` `Organization_org_id_organization` on((`_sla`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SLT`
--

/*!50001 DROP VIEW IF EXISTS `view_SLT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SLT` AS select distinct `_slt`.`id` AS `id`,`_slt`.`name` AS `name`,`_slt`.`priority` AS `priority`,`_slt`.`request_type` AS `request_type`,`_slt`.`metric` AS `metric`,`_slt`.`value` AS `value`,`_slt`.`unit` AS `unit`,cast(concat(coalesce(`_slt`.`name`,'')) as char charset utf8) AS `friendlyname` from `slt` `_slt` where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Server`
--

/*!50001 DROP VIEW IF EXISTS `view_Server`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Server` AS select distinct `_server`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_server`.`osfamily_id` AS `osfamily_id`,`OSFamily_osfamily_id_typology`.`name` AS `osfamily_name`,`_server`.`osversion_id` AS `osversion_id`,`OSVersion_osversion_id_typology`.`name` AS `osversion_name`,`_server`.`oslicence_id` AS `oslicence_id`,`OSLicence_oslicence_id_licence`.`name` AS `oslicence_name`,`_server`.`cpu` AS `cpu`,`_server`.`ram` AS `ram`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall`,cast(concat(coalesce(`OSFamily_osfamily_id_typology`.`name`,'')) as char charset utf8) AS `osfamily_id_friendlyname`,cast(concat(coalesce(`OSVersion_osversion_id_typology`.`name`,'')) as char charset utf8) AS `osversion_id_friendlyname`,cast(concat(coalesce(`OSLicence_oslicence_id_licence`.`name`,'')) as char charset utf8) AS `oslicence_id_friendlyname` from ((((((`server` `_server` left join (`osfamily` `OSFamily_osfamily_id_osfamily` join `typology` `OSFamily_osfamily_id_typology` on((`OSFamily_osfamily_id_osfamily`.`id` = `OSFamily_osfamily_id_typology`.`id`))) on((`_server`.`osfamily_id` = `OSFamily_osfamily_id_osfamily`.`id`))) left join (`osversion` `OSVersion_osversion_id_osversion` join `typology` `OSVersion_osversion_id_typology` on((`OSVersion_osversion_id_osversion`.`id` = `OSVersion_osversion_id_typology`.`id`))) on((`_server`.`osversion_id` = `OSVersion_osversion_id_osversion`.`id`))) left join (`oslicence` `OSLicence_oslicence_id_oslicence` join `licence` `OSLicence_oslicence_id_licence` on((`OSLicence_oslicence_id_oslicence`.`id` = `OSLicence_oslicence_id_licence`.`id`))) on((`_server`.`oslicence_id` = `OSLicence_oslicence_id_oslicence`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_server`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_server`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_server`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Service`
--

/*!50001 DROP VIEW IF EXISTS `view_Service`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Service` AS select distinct `_service`.`id` AS `id`,`_service`.`name` AS `name`,`_service`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_service`.`servicefamily_id` AS `servicefamily_id`,`ServiceFamily_servicefamily_id_servicefamily`.`name` AS `servicefamily_name`,`_service`.`description` AS `description`,`_service`.`status` AS `status`,cast(concat(coalesce(`_service`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`ServiceFamily_servicefamily_id_servicefamily`.`name`,'')) as char charset utf8) AS `servicefamily_id_friendlyname` from ((`service` `_service` join `organization` `Organization_org_id_organization` on((`_service`.`org_id` = `Organization_org_id_organization`.`id`))) left join `servicefamily` `ServiceFamily_servicefamily_id_servicefamily` on((`_service`.`servicefamily_id` = `ServiceFamily_servicefamily_id_servicefamily`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ServiceFamily`
--

/*!50001 DROP VIEW IF EXISTS `view_ServiceFamily`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ServiceFamily` AS select distinct `_servicefamily`.`id` AS `id`,`_servicefamily`.`name` AS `name`,cast(concat(coalesce(`_servicefamily`.`name`,'')) as char charset utf8) AS `friendlyname` from `servicefamily` `_servicefamily` where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ServiceSubcategory`
--

/*!50001 DROP VIEW IF EXISTS `view_ServiceSubcategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ServiceSubcategory` AS select distinct `_servicesubcategory`.`id` AS `id`,`_servicesubcategory`.`name` AS `name`,`_servicesubcategory`.`description` AS `description`,`_servicesubcategory`.`service_id` AS `service_id`,`Service_service_id_service`.`org_id` AS `service_org_id`,`Service_service_id_service`.`name` AS `service_name`,`Organization_org_id_organization`.`name` AS `service_provider`,`_servicesubcategory`.`request_type` AS `request_type`,`_servicesubcategory`.`status` AS `status`,cast(concat(coalesce(`_servicesubcategory`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `service_org_id_friendlyname` from (`servicesubcategory` `_servicesubcategory` join (`service` `Service_service_id_service` join `organization` `Organization_org_id_organization` on((`Service_service_id_service`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_servicesubcategory`.`service_id` = `Service_service_id_service`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Software`
--

/*!50001 DROP VIEW IF EXISTS `view_Software`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Software` AS select distinct `_software`.`id` AS `id`,`_software`.`name` AS `name`,`_software`.`vendor` AS `vendor`,`_software`.`version` AS `version`,`_software`.`type` AS `type`,cast(concat(coalesce(`_software`.`name`,''),coalesce(' ',''),coalesce(`_software`.`version`,'')) as char charset utf8) AS `friendlyname` from `software` `_software` where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SoftwareInstance`
--

/*!50001 DROP VIEW IF EXISTS `view_SoftwareInstance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SoftwareInstance` AS select distinct `_softwareinstance`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_softwareinstance`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SoftwareLicence`
--

/*!50001 DROP VIEW IF EXISTS `view_SoftwareLicence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SoftwareLicence` AS select distinct `_softwarelicence`.`id` AS `id`,`_licence`.`name` AS `name`,`_licence`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_licence`.`usage_limit` AS `usage_limit`,`_licence`.`description` AS `description`,`_licence`.`start_date` AS `start_date`,`_licence`.`end_date` AS `end_date`,`_licence`.`licence_key` AS `licence_key`,`_licence`.`perpetual` AS `perpetual`,`_softwarelicence`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_licence`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_licence`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname` from ((`softwarelicence` `_softwarelicence` join `software` `Software_software_id_software` on((`_softwarelicence`.`software_id` = `Software_software_id_software`.`id`))) join (`licence` `_licence` join `organization` `Organization_org_id_organization` on((`_licence`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_softwarelicence`.`id` = `_licence`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_SoftwarePatch`
--

/*!50001 DROP VIEW IF EXISTS `view_SoftwarePatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_SoftwarePatch` AS select distinct `_softwarepatch`.`id` AS `id`,`_patch`.`name` AS `name`,`_patch`.`description` AS `description`,`_softwarepatch`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_patch`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_patch`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname` from ((`softwarepatch` `_softwarepatch` join `software` `Software_software_id_software` on((`_softwarepatch`.`software_id` = `Software_software_id_software`.`id`))) join `patch` `_patch` on((`_softwarepatch`.`id` = `_patch`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_StorageSystem`
--

/*!50001 DROP VIEW IF EXISTS `view_StorageSystem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_StorageSystem` AS select distinct `_storagesystem`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall` from (((`storagesystem` `_storagesystem` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_storagesystem`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_storagesystem`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_storagesystem`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Subnet`
--

/*!50001 DROP VIEW IF EXISTS `view_Subnet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Subnet` AS select distinct `_subnet`.`id` AS `id`,`_subnet`.`description` AS `description`,`_subnet`.`subnet_name` AS `subnet_name`,`_subnet`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_subnet`.`ip` AS `ip`,`_subnet`.`ip_mask` AS `ip_mask`,cast(concat(coalesce(`_subnet`.`ip`,''),coalesce(' ',''),coalesce(`_subnet`.`ip_mask`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`subnet` `_subnet` join `organization` `Organization_org_id_organization` on((`_subnet`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Tablet`
--

/*!50001 DROP VIEW IF EXISTS `view_Tablet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Tablet` AS select distinct `_tablet`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`tablet` `_tablet` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_tablet`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_tablet`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Tape`
--

/*!50001 DROP VIEW IF EXISTS `view_Tape`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Tape` AS select distinct `_tape`.`id` AS `id`,`_tape`.`name` AS `name`,`_tape`.`description` AS `description`,`_tape`.`size` AS `size`,`_tape`.`tapelibrary_id` AS `tapelibrary_id`,`TapeLibrary_tapelibrary_id_functionalci`.`name` AS `tapelibrary_name`,cast(concat(coalesce(`_tape`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`TapeLibrary_tapelibrary_id_functionalci`.`name`,'')) as char charset utf8) AS `tapelibrary_id_friendlyname` from (`tape` `_tape` join (`tapelibrary` `TapeLibrary_tapelibrary_id_tapelibrary` join `functionalci` `TapeLibrary_tapelibrary_id_functionalci` on((`TapeLibrary_tapelibrary_id_tapelibrary`.`id` = `TapeLibrary_tapelibrary_id_functionalci`.`id`))) on((`_tape`.`tapelibrary_id` = `TapeLibrary_tapelibrary_id_tapelibrary`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_TapeLibrary`
--

/*!50001 DROP VIEW IF EXISTS `view_TapeLibrary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_TapeLibrary` AS select distinct `_tapelibrary`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_datacenterdevice`.`rack_id` AS `rack_id`,`Rack_rack_id_functionalci`.`name` AS `rack_name`,`_datacenterdevice`.`enclosure_id` AS `enclosure_id`,`Enclosure_enclosure_id_functionalci`.`name` AS `enclosure_name`,`_datacenterdevice`.`nb_u` AS `nb_u`,`_datacenterdevice`.`managementip` AS `managementip`,`_datacenterdevice`.`powera_id` AS `powerA_id`,`PowerConnection_powerA_id_functionalci`.`name` AS `powerA_name`,`_datacenterdevice`.`powerB_id` AS `powerB_id`,`PowerConnection_powerB_id_functionalci`.`name` AS `powerB_name`,`_datacenterdevice`.`redundancy` AS `redundancy`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname`,cast(concat(coalesce(`Rack_rack_id_functionalci`.`name`,'')) as char charset utf8) AS `rack_id_friendlyname`,cast(concat(coalesce(`Enclosure_enclosure_id_functionalci`.`name`,'')) as char charset utf8) AS `enclosure_id_friendlyname`,cast(concat(coalesce(`PowerConnection_powerA_id_functionalci`.`name`,'')) as char charset utf8) AS `powerA_id_friendlyname`,`PowerConnection_powerA_id_functionalci`.`finalclass` AS `powerA_id_finalclass_recall`,cast(concat(coalesce(`PowerConnection_powerB_id_functionalci`.`name`,'')) as char charset utf8) AS `powerB_id_friendlyname`,`PowerConnection_powerB_id_functionalci`.`finalclass` AS `powerB_id_finalclass_recall` from (((`tapelibrary` `_tapelibrary` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_tapelibrary`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_tapelibrary`.`id` = `_physicaldevice`.`id`))) join ((((`datacenterdevice` `_datacenterdevice` left join (`rack` `Rack_rack_id_rack` join `functionalci` `Rack_rack_id_functionalci` on((`Rack_rack_id_rack`.`id` = `Rack_rack_id_functionalci`.`id`))) on((`_datacenterdevice`.`rack_id` = `Rack_rack_id_rack`.`id`))) left join (`enclosure` `Enclosure_enclosure_id_enclosure` join `functionalci` `Enclosure_enclosure_id_functionalci` on((`Enclosure_enclosure_id_enclosure`.`id` = `Enclosure_enclosure_id_functionalci`.`id`))) on((`_datacenterdevice`.`enclosure_id` = `Enclosure_enclosure_id_enclosure`.`id`))) left join (`powerconnection` `PowerConnection_powerA_id_powerconnection` join `functionalci` `PowerConnection_powerA_id_functionalci` on((`PowerConnection_powerA_id_powerconnection`.`id` = `PowerConnection_powerA_id_functionalci`.`id`))) on((`_datacenterdevice`.`powera_id` = `PowerConnection_powerA_id_powerconnection`.`id`))) left join (`powerconnection` `PowerConnection_powerB_id_powerconnection` join `functionalci` `PowerConnection_powerB_id_functionalci` on((`PowerConnection_powerB_id_powerconnection`.`id` = `PowerConnection_powerB_id_functionalci`.`id`))) on((`_datacenterdevice`.`powerB_id` = `PowerConnection_powerB_id_powerconnection`.`id`))) on((`_tapelibrary`.`id` = `_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Team`
--

/*!50001 DROP VIEW IF EXISTS `view_Team`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Team` AS select distinct `_team`.`id` AS `id`,`_contact`.`name` AS `name`,`_contact`.`status` AS `status`,`_contact`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_contact`.`email` AS `email`,`_contact`.`phone` AS `phone`,`_contact`.`notify` AS `notify`,`_contact`.`function` AS `function`,`_contact`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_contact`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`team` `_team` join (`contact` `_contact` join `organization` `Organization_org_id_organization` on((`_contact`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_team`.`id` = `_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_TelephonyCI`
--

/*!50001 DROP VIEW IF EXISTS `view_TelephonyCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_TelephonyCI` AS select distinct `_telephonyci`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_physicaldevice`.`serialnumber` AS `serialnumber`,`_physicaldevice`.`location_id` AS `location_id`,`Location_location_id_location`.`name` AS `location_name`,`_physicaldevice`.`status` AS `status`,`_physicaldevice`.`brand_id` AS `brand_id`,`Brand_brand_id_typology`.`name` AS `brand_name`,`_physicaldevice`.`model_id` AS `model_id`,`Model_model_id_typology`.`name` AS `model_name`,`_physicaldevice`.`asset_number` AS `asset_number`,`_physicaldevice`.`purchase_date` AS `purchase_date`,`_physicaldevice`.`end_of_warranty` AS `end_of_warranty`,`_telephonyci`.`phonenumber` AS `phonenumber`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Location_location_id_location`.`name`,'')) as char charset utf8) AS `location_id_friendlyname`,cast(concat(coalesce(`Brand_brand_id_typology`.`name`,'')) as char charset utf8) AS `brand_id_friendlyname`,cast(concat(coalesce(`Model_model_id_typology`.`name`,'')) as char charset utf8) AS `model_id_friendlyname` from ((`telephonyci` `_telephonyci` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_telephonyci`.`id` = `_functionalci`.`id`))) join (((`physicaldevice` `_physicaldevice` left join `location` `Location_location_id_location` on((`_physicaldevice`.`location_id` = `Location_location_id_location`.`id`))) left join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_physicaldevice`.`brand_id` = `Brand_brand_id_brand`.`id`))) left join (`model` `Model_model_id_model` join `typology` `Model_model_id_typology` on((`Model_model_id_model`.`id` = `Model_model_id_typology`.`id`))) on((`_physicaldevice`.`model_id` = `Model_model_id_model`.`id`))) on((`_telephonyci`.`id` = `_physicaldevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Ticket`
--

/*!50001 DROP VIEW IF EXISTS `view_Ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Ticket` AS select distinct `_ticket`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname` from ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_Typology`
--

/*!50001 DROP VIEW IF EXISTS `view_Typology`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_Typology` AS select distinct `_typology`.`id` AS `id`,`_typology`.`name` AS `name`,`_typology`.`finalclass` AS `finalclass`,if((`_typology`.`finalclass` = 'IOSVersion'),cast(concat(coalesce(`Brand_brand_id_typology`.`name`,''),coalesce(' ',''),coalesce(`_typology`.`name`,'')) as char charset utf8),cast(concat(coalesce(`_typology`.`name`,'')) as char charset utf8)) AS `friendlyname` from (`typology` `_typology` left join (`iosversion` `_fn_IOSVersion_iosversion` join (`brand` `Brand_brand_id_brand` join `typology` `Brand_brand_id_typology` on((`Brand_brand_id_brand`.`id` = `Brand_brand_id_typology`.`id`))) on((`_fn_IOSVersion_iosversion`.`brand_id` = `Brand_brand_id_brand`.`id`))) on((`_typology`.`id` = `_fn_IOSVersion_iosversion`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_UserRequest`
--

/*!50001 DROP VIEW IF EXISTS `view_UserRequest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_UserRequest` AS select distinct `_ticket_request`.`id` AS `id`,`_ticket`.`operational_status` AS `operational_status`,`_ticket`.`ref` AS `ref`,`_ticket`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,`_ticket`.`caller_id` AS `caller_id`,`Person_caller_id_contact`.`name` AS `caller_name`,`_ticket`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_ticket`.`agent_id` AS `agent_id`,`Person_agent_id_contact`.`name` AS `agent_name`,`_ticket`.`title` AS `title`,`_ticket`.`description` AS `description`,`_ticket`.`description_format` AS `description_format`,`_ticket`.`start_date` AS `start_date`,`_ticket`.`end_date` AS `end_date`,`_ticket`.`last_update` AS `last_update`,`_ticket`.`close_date` AS `close_date`,`_ticket`.`private_log` AS `private_log`,`_ticket`.`private_log_index` AS `private_log_index`,`_ticket_request`.`status` AS `status`,`_ticket_request`.`request_type` AS `request_type`,`_ticket_request`.`impact` AS `impact`,`_ticket_request`.`priority` AS `priority`,`_ticket_request`.`urgency` AS `urgency`,`_ticket_request`.`origin` AS `origin`,`_ticket_request`.`approver_id` AS `approver_id`,`Person_approver_id_contact`.`email` AS `approver_email`,`_ticket_request`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_ticket_request`.`servicesubcategory_id` AS `servicesubcategory_id`,`ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`name` AS `servicesubcategory_name`,`_ticket_request`.`escalation_flag` AS `escalation_flag`,`_ticket_request`.`escalation_reason` AS `escalation_reason`,`_ticket_request`.`assignment_date` AS `assignment_date`,`_ticket_request`.`resolution_date` AS `resolution_date`,`_ticket_request`.`last_pending_date` AS `last_pending_date`,`_ticket_request`.`cumulatedpending_timespent` AS `cumulatedpending`,`_ticket_request`.`cumulatedpending_started` AS `cumulatedpending_started`,`_ticket_request`.`cumulatedpending_laststart` AS `cumulatedpending_laststart`,`_ticket_request`.`cumulatedpending_stopped` AS `cumulatedpending_stopped`,`_ticket_request`.`tto_timespent` AS `tto`,`_ticket_request`.`tto_started` AS `tto_started`,`_ticket_request`.`tto_laststart` AS `tto_laststart`,`_ticket_request`.`tto_stopped` AS `tto_stopped`,`_ticket_request`.`tto_75_deadline` AS `tto_75_deadline`,`_ticket_request`.`tto_75_passed` AS `tto_75_passed`,`_ticket_request`.`tto_75_triggered` AS `tto_75_triggered`,`_ticket_request`.`tto_75_overrun` AS `tto_75_overrun`,`_ticket_request`.`tto_100_deadline` AS `tto_100_deadline`,`_ticket_request`.`tto_100_passed` AS `tto_100_passed`,`_ticket_request`.`tto_100_triggered` AS `tto_100_triggered`,`_ticket_request`.`tto_100_overrun` AS `tto_100_overrun`,`_ticket_request`.`ttr_timespent` AS `ttr`,`_ticket_request`.`ttr_started` AS `ttr_started`,`_ticket_request`.`ttr_laststart` AS `ttr_laststart`,`_ticket_request`.`ttr_stopped` AS `ttr_stopped`,`_ticket_request`.`ttr_75_deadline` AS `ttr_75_deadline`,`_ticket_request`.`ttr_75_passed` AS `ttr_75_passed`,`_ticket_request`.`ttr_75_triggered` AS `ttr_75_triggered`,`_ticket_request`.`ttr_75_overrun` AS `ttr_75_overrun`,`_ticket_request`.`ttr_100_deadline` AS `ttr_100_deadline`,`_ticket_request`.`ttr_100_passed` AS `ttr_100_passed`,`_ticket_request`.`ttr_100_triggered` AS `ttr_100_triggered`,`_ticket_request`.`ttr_100_overrun` AS `ttr_100_overrun`,`_ticket_request`.`tto_100_deadline` AS `tto_escalation_deadline`,`_ticket_request`.`tto_100_passed` AS `sla_tto_passed`,`_ticket_request`.`tto_100_overrun` AS `sla_tto_over`,`_ticket_request`.`ttr_100_deadline` AS `ttr_escalation_deadline`,`_ticket_request`.`ttr_100_passed` AS `sla_ttr_passed`,`_ticket_request`.`ttr_100_overrun` AS `sla_ttr_over`,`_ticket_request`.`time_spent` AS `time_spent`,`_ticket_request`.`resolution_code` AS `resolution_code`,`_ticket_request`.`solution` AS `solution`,`_ticket_request`.`pending_reason` AS `pending_reason`,`_ticket_request`.`parent_request_id` AS `parent_request_id`,`UserRequest_parent_request_id_ticket`.`ref` AS `parent_request_ref`,`_ticket_request`.`parent_incident_id` AS `parent_incident_id`,`Incident_parent_incident_id_ticket`.`ref` AS `parent_incident_ref`,`_ticket_request`.`parent_change_id` AS `parent_change_id`,`Change_parent_change_id_ticket`.`ref` AS `parent_change_ref`,`_ticket_request`.`public_log` AS `public_log`,`_ticket_request`.`public_log_index` AS `public_log_index`,`_ticket_request`.`user_satisfaction` AS `user_satisfaction`,`_ticket_request`.`user_commment` AS `user_comment`,`_ticket`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_ticket`.`ref`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`Person_caller_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_caller_id_contact`.`name`,'')) as char charset utf8) AS `caller_id_friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname`,cast(concat(coalesce(`Person_approver_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_approver_id_contact`.`name`,'')) as char charset utf8) AS `approver_id_friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,cast(concat(coalesce(`ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`name`,'')) as char charset utf8) AS `servicesubcategory_id_friendlyname`,cast(concat(coalesce(`UserRequest_parent_request_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_request_id_friendlyname`,cast(concat(coalesce(`Incident_parent_incident_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_incident_id_friendlyname`,cast(concat(coalesce(`Change_parent_change_id_ticket`.`ref`,'')) as char charset utf8) AS `parent_change_id_friendlyname`,`Change_parent_change_id_ticket`.`finalclass` AS `parent_change_id_finalclass_recall` from (((((((`ticket_request` `_ticket_request` left join (`person` `Person_approver_id_person` join `contact` `Person_approver_id_contact` on((`Person_approver_id_person`.`id` = `Person_approver_id_contact`.`id`))) on((`_ticket_request`.`approver_id` = `Person_approver_id_person`.`id`))) left join `service` `Service_service_id_service` on((`_ticket_request`.`service_id` = `Service_service_id_service`.`id`))) left join `servicesubcategory` `ServiceSubcategory_servicesubcategory_id_servicesubcategory` on((`_ticket_request`.`servicesubcategory_id` = `ServiceSubcategory_servicesubcategory_id_servicesubcategory`.`id`))) left join (`ticket_request` `UserRequest_parent_request_id_ticket_request` join `ticket` `UserRequest_parent_request_id_ticket` on((`UserRequest_parent_request_id_ticket_request`.`id` = `UserRequest_parent_request_id_ticket`.`id`))) on((`_ticket_request`.`parent_request_id` = `UserRequest_parent_request_id_ticket_request`.`id`))) left join (`ticket_incident` `Incident_parent_incident_id_ticket_incident` join `ticket` `Incident_parent_incident_id_ticket` on((`Incident_parent_incident_id_ticket_incident`.`id` = `Incident_parent_incident_id_ticket`.`id`))) on((`_ticket_request`.`parent_incident_id` = `Incident_parent_incident_id_ticket_incident`.`id`))) left join (`change` `Change_parent_change_id_change` join `ticket` `Change_parent_change_id_ticket` on((`Change_parent_change_id_change`.`id` = `Change_parent_change_id_ticket`.`id`))) on((`_ticket_request`.`parent_change_id` = `Change_parent_change_id_change`.`id`))) join ((((`ticket` `_ticket` join `organization` `Organization_org_id_organization` on((`_ticket`.`org_id` = `Organization_org_id_organization`.`id`))) left join (`person` `Person_caller_id_person` join `contact` `Person_caller_id_contact` on((`Person_caller_id_person`.`id` = `Person_caller_id_contact`.`id`))) on((`_ticket`.`caller_id` = `Person_caller_id_person`.`id`))) left join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_ticket`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_ticket`.`agent_id` = `Person_agent_id_person`.`id`))) on((`_ticket_request`.`id` = `_ticket`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_VLAN`
--

/*!50001 DROP VIEW IF EXISTS `view_VLAN`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_VLAN` AS select distinct `_vlan`.`id` AS `id`,`_vlan`.`vlan_tag` AS `vlan_tag`,`_vlan`.`description` AS `description`,`_vlan`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `org_name`,cast(concat(coalesce(`_vlan`.`vlan_tag`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`vlan` `_vlan` join `organization` `Organization_org_id_organization` on((`_vlan`.`org_id` = `Organization_org_id_organization`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_VirtualDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_VirtualDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_VirtualDevice` AS select distinct `_virtualdevice`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_virtualdevice`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from (`virtualdevice` `_virtualdevice` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_virtualdevice`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_VirtualHost`
--

/*!50001 DROP VIEW IF EXISTS `view_VirtualHost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_VirtualHost` AS select distinct `_virtualhost`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_virtualdevice`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname` from ((`virtualhost` `_virtualhost` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_virtualhost`.`id` = `_functionalci`.`id`))) join `virtualdevice` `_virtualdevice` on((`_virtualhost`.`id` = `_virtualdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_VirtualMachine`
--

/*!50001 DROP VIEW IF EXISTS `view_VirtualMachine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_VirtualMachine` AS select distinct `_virtualmachine`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_virtualdevice`.`status` AS `status`,`_virtualmachine`.`virtualhost_id` AS `virtualhost_id`,`VirtualHost_virtualhost_id_functionalci`.`name` AS `virtualhost_name`,`_virtualmachine`.`osfamily_id` AS `osfamily_id`,`OSFamily_osfamily_id_typology`.`name` AS `osfamily_name`,`_virtualmachine`.`osversion_id` AS `osversion_id`,`OSVersion_osversion_id_typology`.`name` AS `osversion_name`,`_virtualmachine`.`oslicence_id` AS `oslicence_id`,`OSLicence_oslicence_id_licence`.`name` AS `oslicence_name`,`_virtualmachine`.`cpu` AS `cpu`,`_virtualmachine`.`ram` AS `ram`,`_virtualmachine`.`managementip` AS `managementip`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`VirtualHost_virtualhost_id_functionalci`.`name`,'')) as char charset utf8) AS `virtualhost_id_friendlyname`,`VirtualHost_virtualhost_id_functionalci`.`finalclass` AS `virtualhost_id_finalclass_recall`,cast(concat(coalesce(`OSFamily_osfamily_id_typology`.`name`,'')) as char charset utf8) AS `osfamily_id_friendlyname`,cast(concat(coalesce(`OSVersion_osversion_id_typology`.`name`,'')) as char charset utf8) AS `osversion_id_friendlyname`,cast(concat(coalesce(`OSLicence_oslicence_id_licence`.`name`,'')) as char charset utf8) AS `oslicence_id_friendlyname` from ((((((`virtualmachine` `_virtualmachine` join (`virtualhost` `VirtualHost_virtualhost_id_virtualhost` join `functionalci` `VirtualHost_virtualhost_id_functionalci` on((`VirtualHost_virtualhost_id_virtualhost`.`id` = `VirtualHost_virtualhost_id_functionalci`.`id`))) on((`_virtualmachine`.`virtualhost_id` = `VirtualHost_virtualhost_id_virtualhost`.`id`))) left join (`osfamily` `OSFamily_osfamily_id_osfamily` join `typology` `OSFamily_osfamily_id_typology` on((`OSFamily_osfamily_id_osfamily`.`id` = `OSFamily_osfamily_id_typology`.`id`))) on((`_virtualmachine`.`osfamily_id` = `OSFamily_osfamily_id_osfamily`.`id`))) left join (`osversion` `OSVersion_osversion_id_osversion` join `typology` `OSVersion_osversion_id_typology` on((`OSVersion_osversion_id_osversion`.`id` = `OSVersion_osversion_id_typology`.`id`))) on((`_virtualmachine`.`osversion_id` = `OSVersion_osversion_id_osversion`.`id`))) left join (`oslicence` `OSLicence_oslicence_id_oslicence` join `licence` `OSLicence_oslicence_id_licence` on((`OSLicence_oslicence_id_oslicence`.`id` = `OSLicence_oslicence_id_licence`.`id`))) on((`_virtualmachine`.`oslicence_id` = `OSLicence_oslicence_id_oslicence`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_virtualmachine`.`id` = `_functionalci`.`id`))) join `virtualdevice` `_virtualdevice` on((`_virtualmachine`.`id` = `_virtualdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_WebApplication`
--

/*!50001 DROP VIEW IF EXISTS `view_WebApplication`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_WebApplication` AS select distinct `_webapplication`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_webapplication`.`webserver_id` AS `webserver_id`,`WebServer_webserver_id_functionalci`.`name` AS `webserver_name`,`_webapplication`.`url` AS `url`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,cast(concat(coalesce(`WebServer_webserver_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `webserver_id_friendlyname` from ((`webapplication` `_webapplication` join ((`webserver` `WebServer_webserver_id_webserver` join `functionalci` `WebServer_webserver_id_functionalci` on((`WebServer_webserver_id_webserver`.`id` = `WebServer_webserver_id_functionalci`.`id`))) join (`softwareinstance` `WebServer_webserver_id_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`WebServer_webserver_id_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`WebServer_webserver_id_webserver`.`id` = `WebServer_webserver_id_softwareinstance`.`id`))) on((`_webapplication`.`webserver_id` = `WebServer_webserver_id_webserver`.`id`))) join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_webapplication`.`id` = `_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_WebServer`
--

/*!50001 DROP VIEW IF EXISTS `view_WebServer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_WebServer` AS select distinct `_webserver`.`id` AS `id`,`_functionalci`.`name` AS `name`,`_functionalci`.`description` AS `description`,`_functionalci`.`org_id` AS `org_id`,`Organization_org_id_organization`.`name` AS `organization_name`,`_functionalci`.`business_criticity` AS `business_criticity`,`_functionalci`.`move2production` AS `move2production`,`_softwareinstance`.`functionalci_id` AS `system_id`,`FunctionalCI_system_id_functionalci`.`name` AS `system_name`,`_softwareinstance`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_softwareinstance`.`softwarelicence_id` AS `softwarelicence_id`,`SoftwareLicence_softwarelicence_id_licence`.`name` AS `softwarelicence_name`,`_softwareinstance`.`path` AS `path`,`_softwareinstance`.`status` AS `status`,`_functionalci`.`finalclass` AS `finalclass`,cast(concat(coalesce(`_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Organization_org_id_organization`.`name`,'')) as char charset utf8) AS `org_id_friendlyname`,if((`FunctionalCI_system_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id1_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8)) AS `system_id_friendlyname`,`FunctionalCI_system_id_functionalci`.`finalclass` AS `system_id_finalclass_recall`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,cast(concat(coalesce(`SoftwareLicence_softwarelicence_id_licence`.`name`,'')) as char charset utf8) AS `softwarelicence_id_friendlyname` from ((`webserver` `_webserver` join (`functionalci` `_functionalci` join `organization` `Organization_org_id_organization` on((`_functionalci`.`org_id` = `Organization_org_id_organization`.`id`))) on((`_webserver`.`id` = `_functionalci`.`id`))) join (((`softwareinstance` `_softwareinstance` join (`functionalci` `FunctionalCI_system_id_functionalci` left join (`softwareinstance` `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id1_functionalci` on((`FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id1_functionalci`.`id`))) on((`FunctionalCI_system_id_functionalci`.`id` = `FunctionalCI_system_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) left join `software` `Software_software_id_software` on((`_softwareinstance`.`software_id` = `Software_software_id_software`.`id`))) left join (`softwarelicence` `SoftwareLicence_softwarelicence_id_softwarelicence` join `licence` `SoftwareLicence_softwarelicence_id_licence` on((`SoftwareLicence_softwarelicence_id_softwarelicence`.`id` = `SoftwareLicence_softwarelicence_id_licence`.`id`))) on((`_softwareinstance`.`softwarelicence_id` = `SoftwareLicence_softwarelicence_id_softwarelicence`.`id`))) on((`_webserver`.`id` = `_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_WorkOrder`
--

/*!50001 DROP VIEW IF EXISTS `view_WorkOrder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_WorkOrder` AS select distinct `_workorder`.`id` AS `id`,`_workorder`.`name` AS `name`,`_workorder`.`status` AS `status`,`_workorder`.`description` AS `description`,`_workorder`.`ticket_id` AS `ticket_id`,`Ticket_ticket_id_ticket`.`ref` AS `ticket_ref`,`_workorder`.`team_id` AS `team_id`,`Team_team_id_contact`.`email` AS `team_name`,`_workorder`.`owner_id` AS `agent_id`,`Person_agent_id_contact`.`email` AS `agent_email`,`_workorder`.`start_date` AS `start_date`,`_workorder`.`end_date` AS `end_date`,`_workorder`.`log` AS `log`,`_workorder`.`log_index` AS `log_index`,cast(concat(coalesce(`_workorder`.`name`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Ticket_ticket_id_ticket`.`ref`,'')) as char charset utf8) AS `ticket_id_friendlyname`,`Ticket_ticket_id_ticket`.`finalclass` AS `ticket_id_finalclass_recall`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_agent_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_agent_id_contact`.`name`,'')) as char charset utf8) AS `agent_id_friendlyname` from (((`workorder` `_workorder` join `ticket` `Ticket_ticket_id_ticket` on((`_workorder`.`ticket_id` = `Ticket_ticket_id_ticket`.`id`))) join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_workorder`.`team_id` = `Team_team_id_team`.`id`))) left join (`person` `Person_agent_id_person` join `contact` `Person_agent_id_contact` on((`Person_agent_id_person`.`id` = `Person_agent_id_contact`.`id`))) on((`_workorder`.`owner_id` = `Person_agent_id_person`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkApplicationSolutionToBusinessProcess`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkApplicationSolutionToBusinessProcess`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkApplicationSolutionToBusinessProcess` AS select distinct `_lnkapplicationsolutiontobusinessprocess`.`id` AS `id`,`_lnkapplicationsolutiontobusinessprocess`.`businessprocess_id` AS `businessprocess_id`,`BusinessProcess_businessprocess_id_functionalci`.`name` AS `businessprocess_name`,`_lnkapplicationsolutiontobusinessprocess`.`applicationsolution_id` AS `applicationsolution_id`,`ApplicationSolution_applicationsolution_id_functionalci`.`name` AS `applicationsolution_name`,cast(concat(coalesce(`_lnkapplicationsolutiontobusinessprocess`.`businessprocess_id`,''),coalesce(' ',''),coalesce(`_lnkapplicationsolutiontobusinessprocess`.`applicationsolution_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`BusinessProcess_businessprocess_id_functionalci`.`name`,'')) as char charset utf8) AS `businessprocess_id_friendlyname`,cast(concat(coalesce(`ApplicationSolution_applicationsolution_id_functionalci`.`name`,'')) as char charset utf8) AS `applicationsolution_id_friendlyname` from ((`lnkapplicationsolutiontobusinessprocess` `_lnkapplicationsolutiontobusinessprocess` join (`businessprocess` `BusinessProcess_businessprocess_id_businessprocess` join `functionalci` `BusinessProcess_businessprocess_id_functionalci` on((`BusinessProcess_businessprocess_id_businessprocess`.`id` = `BusinessProcess_businessprocess_id_functionalci`.`id`))) on((`_lnkapplicationsolutiontobusinessprocess`.`businessprocess_id` = `BusinessProcess_businessprocess_id_businessprocess`.`id`))) join (`applicationsolution` `ApplicationSolution_applicationsolution_id_applicationsolution` join `functionalci` `ApplicationSolution_applicationsolution_id_functionalci` on((`ApplicationSolution_applicationsolution_id_applicationsolution`.`id` = `ApplicationSolution_applicationsolution_id_functionalci`.`id`))) on((`_lnkapplicationsolutiontobusinessprocess`.`applicationsolution_id` = `ApplicationSolution_applicationsolution_id_applicationsolution`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkApplicationSolutionToFunctionalCI`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkApplicationSolutionToFunctionalCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkApplicationSolutionToFunctionalCI` AS select distinct `_lnkapplicationsolutiontofunctionalci`.`id` AS `id`,`_lnkapplicationsolutiontofunctionalci`.`applicationsolution_id` AS `applicationsolution_id`,`ApplicationSolution_applicationsolution_id_functionalci`.`name` AS `applicationsolution_name`,`_lnkapplicationsolutiontofunctionalci`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,cast(concat(coalesce(`_lnkapplicationsolutiontofunctionalci`.`applicationsolution_id`,''),coalesce(' ',''),coalesce(`_lnkapplicationsolutiontofunctionalci`.`functionalci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`ApplicationSolution_applicationsolution_id_functionalci`.`name`,'')) as char charset utf8) AS `applicationsolution_id_friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall` from ((`lnkapplicationsolutiontofunctionalci` `_lnkapplicationsolutiontofunctionalci` join (`applicationsolution` `ApplicationSolution_applicationsolution_id_applicationsolution` join `functionalci` `ApplicationSolution_applicationsolution_id_functionalci` on((`ApplicationSolution_applicationsolution_id_applicationsolution`.`id` = `ApplicationSolution_applicationsolution_id_functionalci`.`id`))) on((`_lnkapplicationsolutiontofunctionalci`.`applicationsolution_id` = `ApplicationSolution_applicationsolution_id_applicationsolution`.`id`))) join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkapplicationsolutiontofunctionalci`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkConnectableCIToNetworkDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkConnectableCIToNetworkDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkConnectableCIToNetworkDevice` AS select distinct `_lnkconnectablecitonetworkdevice`.`id` AS `id`,`_lnkconnectablecitonetworkdevice`.`networkdevice_id` AS `networkdevice_id`,`NetworkDevice_networkdevice_id_functionalci`.`name` AS `networkdevice_name`,`_lnkconnectablecitonetworkdevice`.`connectableci_id` AS `connectableci_id`,`ConnectableCI_connectableci_id_functionalci`.`name` AS `connectableci_name`,`_lnkconnectablecitonetworkdevice`.`network_port` AS `network_port`,`_lnkconnectablecitonetworkdevice`.`device_port` AS `device_port`,`_lnkconnectablecitonetworkdevice`.`type` AS `connection_type`,cast(concat(coalesce(`_lnkconnectablecitonetworkdevice`.`networkdevice_id`,''),coalesce(' ',''),coalesce(`_lnkconnectablecitonetworkdevice`.`connectableci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`NetworkDevice_networkdevice_id_functionalci`.`name`,'')) as char charset utf8) AS `networkdevice_id_friendlyname`,cast(concat(coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8) AS `connectableci_id_friendlyname`,`ConnectableCI_connectableci_id_functionalci`.`finalclass` AS `connectableci_id_finalclass_recall` from ((`lnkconnectablecitonetworkdevice` `_lnkconnectablecitonetworkdevice` join (`networkdevice` `NetworkDevice_networkdevice_id_networkdevice` join `functionalci` `NetworkDevice_networkdevice_id_functionalci` on((`NetworkDevice_networkdevice_id_networkdevice`.`id` = `NetworkDevice_networkdevice_id_functionalci`.`id`))) on((`_lnkconnectablecitonetworkdevice`.`networkdevice_id` = `NetworkDevice_networkdevice_id_networkdevice`.`id`))) join (`connectableci` `ConnectableCI_connectableci_id_connectableci` join `functionalci` `ConnectableCI_connectableci_id_functionalci` on((`ConnectableCI_connectableci_id_connectableci`.`id` = `ConnectableCI_connectableci_id_functionalci`.`id`))) on((`_lnkconnectablecitonetworkdevice`.`connectableci_id` = `ConnectableCI_connectableci_id_connectableci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkContactToContract`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkContactToContract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkContactToContract` AS select distinct `_lnkcontacttocontract`.`id` AS `id`,`_lnkcontacttocontract`.`contract_id` AS `contract_id`,`Contract_contract_id_contract`.`name` AS `contract_name`,`_lnkcontacttocontract`.`contact_id` AS `contact_id`,`Contact_contact_id_contact`.`name` AS `contact_name`,cast(concat(coalesce(`_lnkcontacttocontract`.`contract_id`,''),coalesce(' ',''),coalesce(`_lnkcontacttocontract`.`contact_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Contract_contract_id_contract`.`name`,'')) as char charset utf8) AS `contract_id_friendlyname`,`Contract_contract_id_contract`.`finalclass` AS `contract_id_finalclass_recall`,if((`Contact_contact_id_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`Contact_contact_id_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8)) AS `contact_id_friendlyname`,`Contact_contact_id_contact`.`finalclass` AS `contact_id_finalclass_recall` from ((`lnkcontacttocontract` `_lnkcontacttocontract` join `contract` `Contract_contract_id_contract` on((`_lnkcontacttocontract`.`contract_id` = `Contract_contract_id_contract`.`id`))) join (`contact` `Contact_contact_id_contact` left join `person` `Contact_contact_id_fn_Person_person` on((`Contact_contact_id_contact`.`id` = `Contact_contact_id_fn_Person_person`.`id`))) on((`_lnkcontacttocontract`.`contact_id` = `Contact_contact_id_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkContactToFunctionalCI`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkContactToFunctionalCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkContactToFunctionalCI` AS select distinct `_lnkcontacttofunctionalci`.`id` AS `id`,`_lnkcontacttofunctionalci`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,`_lnkcontacttofunctionalci`.`contact_id` AS `contact_id`,`Contact_contact_id_contact`.`name` AS `contact_name`,cast(concat(coalesce(`_lnkcontacttofunctionalci`.`functionalci_id`,''),coalesce(' ',''),coalesce(`_lnkcontacttofunctionalci`.`contact_id`,'')) as char charset utf8) AS `friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall`,if((`Contact_contact_id_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`Contact_contact_id_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8)) AS `contact_id_friendlyname`,`Contact_contact_id_contact`.`finalclass` AS `contact_id_finalclass_recall` from ((`lnkcontacttofunctionalci` `_lnkcontacttofunctionalci` join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkcontacttofunctionalci`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) join (`contact` `Contact_contact_id_contact` left join `person` `Contact_contact_id_fn_Person_person` on((`Contact_contact_id_contact`.`id` = `Contact_contact_id_fn_Person_person`.`id`))) on((`_lnkcontacttofunctionalci`.`contact_id` = `Contact_contact_id_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkContactToService`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkContactToService`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkContactToService` AS select distinct `_lnkcontacttoservice`.`id` AS `id`,`_lnkcontacttoservice`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_lnkcontacttoservice`.`contact_id` AS `contact_id`,`Contact_contact_id_contact`.`name` AS `contact_name`,cast(concat(coalesce(`_lnkcontacttoservice`.`service_id`,''),coalesce(' ',''),coalesce(`_lnkcontacttoservice`.`contact_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,if((`Contact_contact_id_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`Contact_contact_id_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8)) AS `contact_id_friendlyname`,`Contact_contact_id_contact`.`finalclass` AS `contact_id_finalclass_recall` from ((`lnkcontacttoservice` `_lnkcontacttoservice` join `service` `Service_service_id_service` on((`_lnkcontacttoservice`.`service_id` = `Service_service_id_service`.`id`))) join (`contact` `Contact_contact_id_contact` left join `person` `Contact_contact_id_fn_Person_person` on((`Contact_contact_id_contact`.`id` = `Contact_contact_id_fn_Person_person`.`id`))) on((`_lnkcontacttoservice`.`contact_id` = `Contact_contact_id_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkContactToTicket`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkContactToTicket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkContactToTicket` AS select distinct `_lnkcontacttoticket`.`id` AS `id`,`_lnkcontacttoticket`.`ticket_id` AS `ticket_id`,`Ticket_ticket_id_ticket`.`ref` AS `ticket_ref`,`_lnkcontacttoticket`.`contact_id` AS `contact_id`,`Contact_contact_id_contact`.`email` AS `contact_email`,`_lnkcontacttoticket`.`role` AS `role`,`_lnkcontacttoticket`.`impact_code` AS `role_code`,cast(concat(coalesce(`_lnkcontacttoticket`.`ticket_id`,''),coalesce(' ',''),coalesce(`_lnkcontacttoticket`.`contact_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Ticket_ticket_id_ticket`.`ref`,'')) as char charset utf8) AS `ticket_id_friendlyname`,`Ticket_ticket_id_ticket`.`finalclass` AS `ticket_id_finalclass_recall`,if((`Contact_contact_id_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`Contact_contact_id_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8)) AS `contact_id_friendlyname`,`Contact_contact_id_contact`.`finalclass` AS `contact_id_finalclass_recall` from ((`lnkcontacttoticket` `_lnkcontacttoticket` join `ticket` `Ticket_ticket_id_ticket` on((`_lnkcontacttoticket`.`ticket_id` = `Ticket_ticket_id_ticket`.`id`))) join (`contact` `Contact_contact_id_contact` left join `person` `Contact_contact_id_fn_Person_person` on((`Contact_contact_id_contact`.`id` = `Contact_contact_id_fn_Person_person`.`id`))) on((`_lnkcontacttoticket`.`contact_id` = `Contact_contact_id_contact`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkContractToDocument`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkContractToDocument`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkContractToDocument` AS select distinct `_lnkcontracttodocument`.`id` AS `id`,`_lnkcontracttodocument`.`contract_id` AS `contract_id`,`Contract_contract_id_contract`.`name` AS `contract_name`,`_lnkcontracttodocument`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkcontracttodocument`.`contract_id`,''),coalesce(' ',''),coalesce(`_lnkcontracttodocument`.`document_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Contract_contract_id_contract`.`name`,'')) as char charset utf8) AS `contract_id_friendlyname`,`Contract_contract_id_contract`.`finalclass` AS `contract_id_finalclass_recall`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkcontracttodocument` `_lnkcontracttodocument` join `contract` `Contract_contract_id_contract` on((`_lnkcontracttodocument`.`contract_id` = `Contract_contract_id_contract`.`id`))) join `document` `Document_document_id_document` on((`_lnkcontracttodocument`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkCustomerContractToService`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkCustomerContractToService`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkCustomerContractToService` AS select distinct `_lnkcustomercontracttoservice`.`id` AS `id`,`_lnkcustomercontracttoservice`.`customercontract_id` AS `customercontract_id`,`CustomerContract_customercontract_id_contract`.`name` AS `customercontract_name`,`_lnkcustomercontracttoservice`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_lnkcustomercontracttoservice`.`sla_id` AS `sla_id`,`SLA_sla_id_sla`.`name` AS `sla_name`,cast(concat(coalesce(`_lnkcustomercontracttoservice`.`customercontract_id`,''),coalesce(' ',''),coalesce(`_lnkcustomercontracttoservice`.`service_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`CustomerContract_customercontract_id_contract`.`name`,'')) as char charset utf8) AS `customercontract_id_friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,cast(concat(coalesce(`SLA_sla_id_sla`.`name`,'')) as char charset utf8) AS `sla_id_friendlyname` from (((`lnkcustomercontracttoservice` `_lnkcustomercontracttoservice` join (`customercontract` `CustomerContract_customercontract_id_customercontract` join `contract` `CustomerContract_customercontract_id_contract` on((`CustomerContract_customercontract_id_customercontract`.`id` = `CustomerContract_customercontract_id_contract`.`id`))) on((`_lnkcustomercontracttoservice`.`customercontract_id` = `CustomerContract_customercontract_id_customercontract`.`id`))) join `service` `Service_service_id_service` on((`_lnkcustomercontracttoservice`.`service_id` = `Service_service_id_service`.`id`))) left join `sla` `SLA_sla_id_sla` on((`_lnkcustomercontracttoservice`.`sla_id` = `SLA_sla_id_sla`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDeliveryModelToContact`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDeliveryModelToContact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDeliveryModelToContact` AS select distinct `_lnkdeliverymodeltocontact`.`id` AS `id`,`_lnkdeliverymodeltocontact`.`deliverymodel_id` AS `deliverymodel_id`,`DeliveryModel_deliverymodel_id_deliverymodel`.`name` AS `deliverymodel_name`,`_lnkdeliverymodeltocontact`.`contact_id` AS `contact_id`,`Contact_contact_id_contact`.`name` AS `contact_name`,`_lnkdeliverymodeltocontact`.`role_id` AS `role_id`,`ContactType_role_id_typology`.`name` AS `role_name`,cast(concat(coalesce(`_lnkdeliverymodeltocontact`.`deliverymodel_id`,''),coalesce(' ',''),coalesce(`_lnkdeliverymodeltocontact`.`contact_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`DeliveryModel_deliverymodel_id_deliverymodel`.`name`,'')) as char charset utf8) AS `deliverymodel_id_friendlyname`,if((`Contact_contact_id_contact`.`finalclass` in ('Team','Contact')),cast(concat(coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8),cast(concat(coalesce(`Contact_contact_id_fn_Person_person`.`first_name`,''),coalesce(' ',''),coalesce(`Contact_contact_id_contact`.`name`,'')) as char charset utf8)) AS `contact_id_friendlyname`,`Contact_contact_id_contact`.`finalclass` AS `contact_id_finalclass_recall`,cast(concat(coalesce(`ContactType_role_id_typology`.`name`,'')) as char charset utf8) AS `role_id_friendlyname` from (((`lnkdeliverymodeltocontact` `_lnkdeliverymodeltocontact` join `deliverymodel` `DeliveryModel_deliverymodel_id_deliverymodel` on((`_lnkdeliverymodeltocontact`.`deliverymodel_id` = `DeliveryModel_deliverymodel_id_deliverymodel`.`id`))) join (`contact` `Contact_contact_id_contact` left join `person` `Contact_contact_id_fn_Person_person` on((`Contact_contact_id_contact`.`id` = `Contact_contact_id_fn_Person_person`.`id`))) on((`_lnkdeliverymodeltocontact`.`contact_id` = `Contact_contact_id_contact`.`id`))) left join (`contacttype` `ContactType_role_id_contacttype` join `typology` `ContactType_role_id_typology` on((`ContactType_role_id_contacttype`.`id` = `ContactType_role_id_typology`.`id`))) on((`_lnkdeliverymodeltocontact`.`role_id` = `ContactType_role_id_contacttype`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDocumentToFunctionalCI`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToFunctionalCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDocumentToFunctionalCI` AS select distinct `_lnkdocumenttofunctionalci`.`id` AS `id`,`_lnkdocumenttofunctionalci`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,`_lnkdocumenttofunctionalci`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkdocumenttofunctionalci`.`functionalci_id`,''),coalesce(' ',''),coalesce(`_lnkdocumenttofunctionalci`.`document_id`,'')) as char charset utf8) AS `friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkdocumenttofunctionalci` `_lnkdocumenttofunctionalci` join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkdocumenttofunctionalci`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) join `document` `Document_document_id_document` on((`_lnkdocumenttofunctionalci`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDocumentToLicence`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToLicence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDocumentToLicence` AS select distinct `_lnkdocumenttolicence`.`id` AS `id`,`_lnkdocumenttolicence`.`licence_id` AS `licence_id`,`Licence_licence_id_licence`.`name` AS `licence_name`,`_lnkdocumenttolicence`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkdocumenttolicence`.`licence_id`,''),coalesce(' ',''),coalesce(`_lnkdocumenttolicence`.`document_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Licence_licence_id_licence`.`name`,'')) as char charset utf8) AS `licence_id_friendlyname`,`Licence_licence_id_licence`.`finalclass` AS `licence_id_finalclass_recall`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkdocumenttolicence` `_lnkdocumenttolicence` join `licence` `Licence_licence_id_licence` on((`_lnkdocumenttolicence`.`licence_id` = `Licence_licence_id_licence`.`id`))) join `document` `Document_document_id_document` on((`_lnkdocumenttolicence`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDocumentToPatch`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToPatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDocumentToPatch` AS select distinct `_lnkdocumenttopatch`.`id` AS `id`,`_lnkdocumenttopatch`.`patch_id` AS `patch_id`,`Patch_patch_id_patch`.`name` AS `patch_name`,`_lnkdocumenttopatch`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkdocumenttopatch`.`patch_id`,''),coalesce(' ',''),coalesce(`_lnkdocumenttopatch`.`document_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Patch_patch_id_patch`.`name`,'')) as char charset utf8) AS `patch_id_friendlyname`,`Patch_patch_id_patch`.`finalclass` AS `patch_id_finalclass_recall`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkdocumenttopatch` `_lnkdocumenttopatch` join `patch` `Patch_patch_id_patch` on((`_lnkdocumenttopatch`.`patch_id` = `Patch_patch_id_patch`.`id`))) join `document` `Document_document_id_document` on((`_lnkdocumenttopatch`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDocumentToService`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToService`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDocumentToService` AS select distinct `_lnkdocumenttoservice`.`id` AS `id`,`_lnkdocumenttoservice`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_lnkdocumenttoservice`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkdocumenttoservice`.`service_id`,''),coalesce(' ',''),coalesce(`_lnkdocumenttoservice`.`document_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkdocumenttoservice` `_lnkdocumenttoservice` join `service` `Service_service_id_service` on((`_lnkdocumenttoservice`.`service_id` = `Service_service_id_service`.`id`))) join `document` `Document_document_id_document` on((`_lnkdocumenttoservice`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkDocumentToSoftware`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkDocumentToSoftware`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkDocumentToSoftware` AS select distinct `_lnkdocumenttosoftware`.`id` AS `id`,`_lnkdocumenttosoftware`.`software_id` AS `software_id`,`Software_software_id_software`.`name` AS `software_name`,`_lnkdocumenttosoftware`.`document_id` AS `document_id`,`Document_document_id_document`.`name` AS `document_name`,cast(concat(coalesce(`_lnkdocumenttosoftware`.`software_id`,''),coalesce(' ',''),coalesce(`_lnkdocumenttosoftware`.`document_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Software_software_id_software`.`name`,''),coalesce(' ',''),coalesce(`Software_software_id_software`.`version`,'')) as char charset utf8) AS `software_id_friendlyname`,if((`Document_document_id_document`.`finalclass` = 'Document'),cast(concat(coalesce('Document','')) as char charset utf8),cast(concat(coalesce(`Document_document_id_document`.`name`,'')) as char charset utf8)) AS `document_id_friendlyname`,`Document_document_id_document`.`finalclass` AS `document_id_finalclass_recall` from ((`lnkdocumenttosoftware` `_lnkdocumenttosoftware` join `software` `Software_software_id_software` on((`_lnkdocumenttosoftware`.`software_id` = `Software_software_id_software`.`id`))) join `document` `Document_document_id_document` on((`_lnkdocumenttosoftware`.`document_id` = `Document_document_id_document`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkFunctionalCIToOSPatch`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToOSPatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkFunctionalCIToOSPatch` AS select distinct `_lnkfunctionalcitoospatch`.`id` AS `id`,`_lnkfunctionalcitoospatch`.`ospatch_id` AS `ospatch_id`,`OSPatch_ospatch_id_patch`.`name` AS `ospatch_name`,`_lnkfunctionalcitoospatch`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,cast(concat(coalesce(`_lnkfunctionalcitoospatch`.`ospatch_id`,''),coalesce(' ',''),coalesce(`_lnkfunctionalcitoospatch`.`functionalci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`OSPatch_ospatch_id_patch`.`name`,'')) as char charset utf8) AS `ospatch_id_friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall` from ((`lnkfunctionalcitoospatch` `_lnkfunctionalcitoospatch` join (`ospatch` `OSPatch_ospatch_id_ospatch` join `patch` `OSPatch_ospatch_id_patch` on((`OSPatch_ospatch_id_ospatch`.`id` = `OSPatch_ospatch_id_patch`.`id`))) on((`_lnkfunctionalcitoospatch`.`ospatch_id` = `OSPatch_ospatch_id_ospatch`.`id`))) join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkfunctionalcitoospatch`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkFunctionalCIToProviderContract`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToProviderContract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkFunctionalCIToProviderContract` AS select distinct `_lnkfunctionalcitoprovidercontract`.`id` AS `id`,`_lnkfunctionalcitoprovidercontract`.`providercontract_id` AS `providercontract_id`,`ProviderContract_providercontract_id_contract`.`name` AS `providercontract_name`,`_lnkfunctionalcitoprovidercontract`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,cast(concat(coalesce(`_lnkfunctionalcitoprovidercontract`.`providercontract_id`,''),coalesce(' ',''),coalesce(`_lnkfunctionalcitoprovidercontract`.`functionalci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`ProviderContract_providercontract_id_contract`.`name`,'')) as char charset utf8) AS `providercontract_id_friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall` from ((`lnkfunctionalcitoprovidercontract` `_lnkfunctionalcitoprovidercontract` join (`providercontract` `ProviderContract_providercontract_id_providercontract` join `contract` `ProviderContract_providercontract_id_contract` on((`ProviderContract_providercontract_id_providercontract`.`id` = `ProviderContract_providercontract_id_contract`.`id`))) on((`_lnkfunctionalcitoprovidercontract`.`providercontract_id` = `ProviderContract_providercontract_id_providercontract`.`id`))) join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkfunctionalcitoprovidercontract`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkFunctionalCIToService`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToService`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkFunctionalCIToService` AS select distinct `_lnkfunctionalcitoservice`.`id` AS `id`,`_lnkfunctionalcitoservice`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_lnkfunctionalcitoservice`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,cast(concat(coalesce(`_lnkfunctionalcitoservice`.`service_id`,''),coalesce(' ',''),coalesce(`_lnkfunctionalcitoservice`.`functionalci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall` from ((`lnkfunctionalcitoservice` `_lnkfunctionalcitoservice` join `service` `Service_service_id_service` on((`_lnkfunctionalcitoservice`.`service_id` = `Service_service_id_service`.`id`))) join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkfunctionalcitoservice`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkFunctionalCIToTicket`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkFunctionalCIToTicket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkFunctionalCIToTicket` AS select distinct `_lnkfunctionalcitoticket`.`id` AS `id`,`_lnkfunctionalcitoticket`.`ticket_id` AS `ticket_id`,`Ticket_ticket_id_ticket`.`ref` AS `ticket_ref`,`Ticket_ticket_id_ticket`.`title` AS `ticket_title`,`_lnkfunctionalcitoticket`.`functionalci_id` AS `functionalci_id`,`FunctionalCI_functionalci_id_functionalci`.`name` AS `functionalci_name`,`_lnkfunctionalcitoticket`.`impact` AS `impact`,`_lnkfunctionalcitoticket`.`impact_code` AS `impact_code`,cast(concat(coalesce(`_lnkfunctionalcitoticket`.`ticket_id`,''),coalesce(' ',''),coalesce(`_lnkfunctionalcitoticket`.`functionalci_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Ticket_ticket_id_ticket`.`ref`,'')) as char charset utf8) AS `ticket_id_friendlyname`,`Ticket_ticket_id_ticket`.`finalclass` AS `ticket_id_finalclass_recall`,if((`FunctionalCI_functionalci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_functionalci_id_functionalci`.`name`,'')) as char charset utf8)) AS `functionalci_id_friendlyname`,`FunctionalCI_functionalci_id_functionalci`.`finalclass` AS `functionalci_id_finalclass_recall` from ((`lnkfunctionalcitoticket` `_lnkfunctionalcitoticket` join `ticket` `Ticket_ticket_id_ticket` on((`_lnkfunctionalcitoticket`.`ticket_id` = `Ticket_ticket_id_ticket`.`id`))) join (`functionalci` `FunctionalCI_functionalci_id_functionalci` left join (`softwareinstance` `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_functionalci_id_functionalci`.`id` = `FunctionalCI_functionalci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkfunctionalcitoticket`.`functionalci_id` = `FunctionalCI_functionalci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkGroupToCI`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkGroupToCI`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkGroupToCI` AS select distinct `_lnkgrouptoci`.`id` AS `id`,`_lnkgrouptoci`.`group_id` AS `group_id`,`Group_group_id_group`.`name` AS `group_name`,`_lnkgrouptoci`.`ci_id` AS `ci_id`,`FunctionalCI_ci_id_functionalci`.`name` AS `ci_name`,`_lnkgrouptoci`.`reason` AS `reason`,cast(concat(coalesce(`_lnkgrouptoci`.`group_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Group_group_id_group`.`name`,'')) as char charset utf8) AS `group_id_friendlyname`,if((`FunctionalCI_ci_id_functionalci`.`finalclass` in ('Middleware','DBServer','WebServer','PCSoftware','OtherSoftware')),cast(concat(coalesce(`FunctionalCI_ci_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8),cast(concat(coalesce(`FunctionalCI_ci_id_functionalci`.`name`,'')) as char charset utf8)) AS `ci_id_friendlyname`,`FunctionalCI_ci_id_functionalci`.`finalclass` AS `ci_id_finalclass_recall` from ((`lnkgrouptoci` `_lnkgrouptoci` join `group` `Group_group_id_group` on((`_lnkgrouptoci`.`group_id` = `Group_group_id_group`.`id`))) join (`functionalci` `FunctionalCI_ci_id_functionalci` left join (`softwareinstance` `FunctionalCI_ci_id_fn_SoftwareInstance_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`FunctionalCI_ci_id_fn_SoftwareInstance_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) on((`FunctionalCI_ci_id_functionalci`.`id` = `FunctionalCI_ci_id_fn_SoftwareInstance_softwareinstance`.`id`))) on((`_lnkgrouptoci`.`ci_id` = `FunctionalCI_ci_id_functionalci`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkPersonToTeam`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkPersonToTeam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkPersonToTeam` AS select distinct `_lnkpersontoteam`.`id` AS `id`,`_lnkpersontoteam`.`team_id` AS `team_id`,`Team_team_id_contact`.`name` AS `team_name`,`_lnkpersontoteam`.`person_id` AS `person_id`,`Person_person_id_contact`.`name` AS `person_name`,`_lnkpersontoteam`.`role_id` AS `role_id`,`ContactType_role_id_typology`.`name` AS `role_name`,cast(concat(coalesce(`_lnkpersontoteam`.`team_id`,''),coalesce(' ',''),coalesce(`_lnkpersontoteam`.`person_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Team_team_id_contact`.`name`,'')) as char charset utf8) AS `team_id_friendlyname`,cast(concat(coalesce(`Person_person_id_person`.`first_name`,''),coalesce(' ',''),coalesce(`Person_person_id_contact`.`name`,'')) as char charset utf8) AS `person_id_friendlyname`,cast(concat(coalesce(`ContactType_role_id_typology`.`name`,'')) as char charset utf8) AS `role_id_friendlyname` from (((`lnkpersontoteam` `_lnkpersontoteam` join (`team` `Team_team_id_team` join `contact` `Team_team_id_contact` on((`Team_team_id_team`.`id` = `Team_team_id_contact`.`id`))) on((`_lnkpersontoteam`.`team_id` = `Team_team_id_team`.`id`))) join (`person` `Person_person_id_person` join `contact` `Person_person_id_contact` on((`Person_person_id_person`.`id` = `Person_person_id_contact`.`id`))) on((`_lnkpersontoteam`.`person_id` = `Person_person_id_person`.`id`))) left join (`contacttype` `ContactType_role_id_contacttype` join `typology` `ContactType_role_id_typology` on((`ContactType_role_id_contacttype`.`id` = `ContactType_role_id_typology`.`id`))) on((`_lnkpersontoteam`.`role_id` = `ContactType_role_id_contacttype`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkPhysicalInterfaceToVLAN`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkPhysicalInterfaceToVLAN`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkPhysicalInterfaceToVLAN` AS select distinct `_lnkphysicalinterfacetovlan`.`id` AS `id`,`_lnkphysicalinterfacetovlan`.`physicalinterface_id` AS `physicalinterface_id`,`PhysicalInterface_physicalinterface_id_networkinterface`.`name` AS `physicalinterface_name`,`PhysicalInterface_physicalinterface_id_physicalinterface`.`connectableci_id` AS `physicalinterface_device_id`,`ConnectableCI_connectableci_id_functionalci`.`name` AS `physicalinterface_device_name`,`_lnkphysicalinterfacetovlan`.`vlan_id` AS `vlan_id`,`VLAN_vlan_id_vlan`.`vlan_tag` AS `vlan_tag`,cast(concat(coalesce(`_lnkphysicalinterfacetovlan`.`physicalinterface_id`,''),coalesce(' ',''),coalesce(`_lnkphysicalinterfacetovlan`.`vlan_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`PhysicalInterface_physicalinterface_id_networkinterface`.`name`,''),coalesce(' ',''),coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8) AS `physicalinterface_id_friendlyname`,cast(concat(coalesce(`ConnectableCI_connectableci_id_functionalci`.`name`,'')) as char charset utf8) AS `physicalinterface_device_id_friendlyname`,cast(concat(coalesce(`VLAN_vlan_id_vlan`.`vlan_tag`,'')) as char charset utf8) AS `vlan_id_friendlyname` from ((`lnkphysicalinterfacetovlan` `_lnkphysicalinterfacetovlan` join ((`physicalinterface` `PhysicalInterface_physicalinterface_id_physicalinterface` join (`connectableci` `ConnectableCI_connectableci_id_connectableci` join `functionalci` `ConnectableCI_connectableci_id_functionalci` on((`ConnectableCI_connectableci_id_connectableci`.`id` = `ConnectableCI_connectableci_id_functionalci`.`id`))) on((`PhysicalInterface_physicalinterface_id_physicalinterface`.`connectableci_id` = `ConnectableCI_connectableci_id_connectableci`.`id`))) join `networkinterface` `PhysicalInterface_physicalinterface_id_networkinterface` on((`PhysicalInterface_physicalinterface_id_physicalinterface`.`id` = `PhysicalInterface_physicalinterface_id_networkinterface`.`id`))) on((`_lnkphysicalinterfacetovlan`.`physicalinterface_id` = `PhysicalInterface_physicalinterface_id_physicalinterface`.`id`))) join `vlan` `VLAN_vlan_id_vlan` on((`_lnkphysicalinterfacetovlan`.`vlan_id` = `VLAN_vlan_id_vlan`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkProviderContractToService`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkProviderContractToService`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkProviderContractToService` AS select distinct `_lnkprovidercontracttoservice`.`id` AS `id`,`_lnkprovidercontracttoservice`.`service_id` AS `service_id`,`Service_service_id_service`.`name` AS `service_name`,`_lnkprovidercontracttoservice`.`providercontract_id` AS `providercontract_id`,`ProviderContract_providercontract_id_contract`.`name` AS `providercontract_name`,cast(concat(coalesce(`_lnkprovidercontracttoservice`.`service_id`,''),coalesce(' ',''),coalesce(`_lnkprovidercontracttoservice`.`providercontract_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Service_service_id_service`.`name`,'')) as char charset utf8) AS `service_id_friendlyname`,cast(concat(coalesce(`ProviderContract_providercontract_id_contract`.`name`,'')) as char charset utf8) AS `providercontract_id_friendlyname` from ((`lnkprovidercontracttoservice` `_lnkprovidercontracttoservice` join `service` `Service_service_id_service` on((`_lnkprovidercontracttoservice`.`service_id` = `Service_service_id_service`.`id`))) join (`providercontract` `ProviderContract_providercontract_id_providercontract` join `contract` `ProviderContract_providercontract_id_contract` on((`ProviderContract_providercontract_id_providercontract`.`id` = `ProviderContract_providercontract_id_contract`.`id`))) on((`_lnkprovidercontracttoservice`.`providercontract_id` = `ProviderContract_providercontract_id_providercontract`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkSLAToSLT`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkSLAToSLT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkSLAToSLT` AS select distinct `_lnkslatoslt`.`id` AS `id`,`_lnkslatoslt`.`sla_id` AS `sla_id`,`SLA_sla_id_sla`.`name` AS `sla_name`,`_lnkslatoslt`.`slt_id` AS `slt_id`,`SLT_slt_id_slt`.`name` AS `slt_name`,`SLT_slt_id_slt`.`metric` AS `slt_metric`,`SLT_slt_id_slt`.`request_type` AS `slt_request_type`,`SLT_slt_id_slt`.`priority` AS `slt_ticket_priority`,`SLT_slt_id_slt`.`value` AS `slt_value`,`SLT_slt_id_slt`.`unit` AS `slt_value_unit`,cast(concat(coalesce(`_lnkslatoslt`.`sla_id`,''),coalesce(' ',''),coalesce(`_lnkslatoslt`.`slt_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`SLA_sla_id_sla`.`name`,'')) as char charset utf8) AS `sla_id_friendlyname`,cast(concat(coalesce(`SLT_slt_id_slt`.`name`,'')) as char charset utf8) AS `slt_id_friendlyname` from ((`lnkslatoslt` `_lnkslatoslt` join `sla` `SLA_sla_id_sla` on((`_lnkslatoslt`.`sla_id` = `SLA_sla_id_sla`.`id`))) join `slt` `SLT_slt_id_slt` on((`_lnkslatoslt`.`slt_id` = `SLT_slt_id_slt`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkSanToDatacenterDevice`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkSanToDatacenterDevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkSanToDatacenterDevice` AS select distinct `_lnkdatacenterdevicetosan`.`id` AS `id`,`_lnkdatacenterdevicetosan`.`san_id` AS `san_id`,`SANSwitch_san_id_functionalci`.`name` AS `san_name`,`_lnkdatacenterdevicetosan`.`datacenterdevice_id` AS `datacenterdevice_id`,`DatacenterDevice_datacenterdevice_id_functionalci`.`name` AS `datacenterdevice_name`,`_lnkdatacenterdevicetosan`.`san_port` AS `san_port`,`_lnkdatacenterdevicetosan`.`datacenterdevice_port` AS `datacenterdevice_port`,cast(concat(coalesce(`_lnkdatacenterdevicetosan`.`san_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`SANSwitch_san_id_functionalci`.`name`,'')) as char charset utf8) AS `san_id_friendlyname`,cast(concat(coalesce(`DatacenterDevice_datacenterdevice_id_functionalci`.`name`,'')) as char charset utf8) AS `datacenterdevice_id_friendlyname`,`DatacenterDevice_datacenterdevice_id_functionalci`.`finalclass` AS `datacenterdevice_id_finalclass_recall` from ((`lnkdatacenterdevicetosan` `_lnkdatacenterdevicetosan` join (`sanswitch` `SANSwitch_san_id_sanswitch` join `functionalci` `SANSwitch_san_id_functionalci` on((`SANSwitch_san_id_sanswitch`.`id` = `SANSwitch_san_id_functionalci`.`id`))) on((`_lnkdatacenterdevicetosan`.`san_id` = `SANSwitch_san_id_sanswitch`.`id`))) join (`datacenterdevice` `DatacenterDevice_datacenterdevice_id_datacenterdevice` join `functionalci` `DatacenterDevice_datacenterdevice_id_functionalci` on((`DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id` = `DatacenterDevice_datacenterdevice_id_functionalci`.`id`))) on((`_lnkdatacenterdevicetosan`.`datacenterdevice_id` = `DatacenterDevice_datacenterdevice_id_datacenterdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkServerToVolume`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkServerToVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkServerToVolume` AS select distinct `_lnkservertovolume`.`id` AS `id`,`_lnkservertovolume`.`volume_id` AS `volume_id`,`LogicalVolume_volume_id_logicalvolume`.`name` AS `volume_name`,`_lnkservertovolume`.`server_id` AS `server_id`,`Server_server_id_functionalci`.`name` AS `server_name`,`_lnkservertovolume`.`size_used` AS `size_used`,cast(concat(coalesce(`_lnkservertovolume`.`volume_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`StorageSystem_storagesystem_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`LogicalVolume_volume_id_logicalvolume`.`name`,'')) as char charset utf8) AS `volume_id_friendlyname`,cast(concat(coalesce(`Server_server_id_functionalci`.`name`,'')) as char charset utf8) AS `server_id_friendlyname` from ((`lnkservertovolume` `_lnkservertovolume` join (`logicalvolume` `LogicalVolume_volume_id_logicalvolume` join (`storagesystem` `StorageSystem_storagesystem_id_storagesystem` join `functionalci` `StorageSystem_storagesystem_id_functionalci` on((`StorageSystem_storagesystem_id_storagesystem`.`id` = `StorageSystem_storagesystem_id_functionalci`.`id`))) on((`LogicalVolume_volume_id_logicalvolume`.`storagesystem_id` = `StorageSystem_storagesystem_id_storagesystem`.`id`))) on((`_lnkservertovolume`.`volume_id` = `LogicalVolume_volume_id_logicalvolume`.`id`))) join (`server` `Server_server_id_server` join `functionalci` `Server_server_id_functionalci` on((`Server_server_id_server`.`id` = `Server_server_id_functionalci`.`id`))) on((`_lnkservertovolume`.`server_id` = `Server_server_id_server`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkSoftwareInstanceToSoftwarePatch`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkSoftwareInstanceToSoftwarePatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkSoftwareInstanceToSoftwarePatch` AS select distinct `_lnksoftwareinstancetosoftwarepatch`.`id` AS `id`,`_lnksoftwareinstancetosoftwarepatch`.`softwarepatch_id` AS `softwarepatch_id`,`SoftwarePatch_softwarepatch_id_patch`.`name` AS `softwarepatch_name`,`_lnksoftwareinstancetosoftwarepatch`.`softwareinstance_id` AS `softwareinstance_id`,`SoftwareInstance_softwareinstance_id_functionalci`.`name` AS `softwareinstance_name`,cast(concat(coalesce(`_lnksoftwareinstancetosoftwarepatch`.`softwarepatch_id`,''),coalesce(' ',''),coalesce(`_lnksoftwareinstancetosoftwarepatch`.`softwareinstance_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`SoftwarePatch_softwarepatch_id_patch`.`name`,'')) as char charset utf8) AS `softwarepatch_id_friendlyname`,cast(concat(coalesce(`SoftwareInstance_softwareinstance_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`FunctionalCI_system_id_functionalci`.`name`,'')) as char charset utf8) AS `softwareinstance_id_friendlyname`,`SoftwareInstance_softwareinstance_id_functionalci`.`finalclass` AS `softwareinstance_id_finalclass_recall` from ((`lnksoftwareinstancetosoftwarepatch` `_lnksoftwareinstancetosoftwarepatch` join (`softwarepatch` `SoftwarePatch_softwarepatch_id_softwarepatch` join `patch` `SoftwarePatch_softwarepatch_id_patch` on((`SoftwarePatch_softwarepatch_id_softwarepatch`.`id` = `SoftwarePatch_softwarepatch_id_patch`.`id`))) on((`_lnksoftwareinstancetosoftwarepatch`.`softwarepatch_id` = `SoftwarePatch_softwarepatch_id_softwarepatch`.`id`))) join ((`softwareinstance` `SoftwareInstance_softwareinstance_id_softwareinstance` join `functionalci` `FunctionalCI_system_id_functionalci` on((`SoftwareInstance_softwareinstance_id_softwareinstance`.`functionalci_id` = `FunctionalCI_system_id_functionalci`.`id`))) join `functionalci` `SoftwareInstance_softwareinstance_id_functionalci` on((`SoftwareInstance_softwareinstance_id_softwareinstance`.`id` = `SoftwareInstance_softwareinstance_id_functionalci`.`id`))) on((`_lnksoftwareinstancetosoftwarepatch`.`softwareinstance_id` = `SoftwareInstance_softwareinstance_id_softwareinstance`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkSubnetToVLAN`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkSubnetToVLAN`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkSubnetToVLAN` AS select distinct `_lnksubnettovlan`.`id` AS `id`,`_lnksubnettovlan`.`subnet_id` AS `subnet_id`,`Subnet_subnet_id_subnet`.`ip` AS `subnet_ip`,`Subnet_subnet_id_subnet`.`subnet_name` AS `subnet_name`,`_lnksubnettovlan`.`vlan_id` AS `vlan_id`,`VLAN_vlan_id_vlan`.`vlan_tag` AS `vlan_tag`,cast(concat(coalesce(`_lnksubnettovlan`.`subnet_id`,''),coalesce(' ',''),coalesce(`_lnksubnettovlan`.`vlan_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`Subnet_subnet_id_subnet`.`ip`,''),coalesce(' ',''),coalesce(`Subnet_subnet_id_subnet`.`ip_mask`,'')) as char charset utf8) AS `subnet_id_friendlyname`,cast(concat(coalesce(`VLAN_vlan_id_vlan`.`vlan_tag`,'')) as char charset utf8) AS `vlan_id_friendlyname` from ((`lnksubnettovlan` `_lnksubnettovlan` join `subnet` `Subnet_subnet_id_subnet` on((`_lnksubnettovlan`.`subnet_id` = `Subnet_subnet_id_subnet`.`id`))) join `vlan` `VLAN_vlan_id_vlan` on((`_lnksubnettovlan`.`vlan_id` = `VLAN_vlan_id_vlan`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lnkVirtualDeviceToVolume`
--

/*!50001 DROP VIEW IF EXISTS `view_lnkVirtualDeviceToVolume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`itop`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lnkVirtualDeviceToVolume` AS select distinct `_lnkvirtualdevicetovolume`.`id` AS `id`,`_lnkvirtualdevicetovolume`.`volume_id` AS `volume_id`,`LogicalVolume_volume_id_logicalvolume`.`name` AS `volume_name`,`_lnkvirtualdevicetovolume`.`virtualdevice_id` AS `virtualdevice_id`,`VirtualDevice_virtualdevice_id_functionalci`.`name` AS `virtualdevice_name`,`_lnkvirtualdevicetovolume`.`size_used` AS `size_used`,cast(concat(coalesce(`_lnkvirtualdevicetovolume`.`volume_id`,'')) as char charset utf8) AS `friendlyname`,cast(concat(coalesce(`StorageSystem_storagesystem_id_functionalci`.`name`,''),coalesce(' ',''),coalesce(`LogicalVolume_volume_id_logicalvolume`.`name`,'')) as char charset utf8) AS `volume_id_friendlyname`,cast(concat(coalesce(`VirtualDevice_virtualdevice_id_functionalci`.`name`,'')) as char charset utf8) AS `virtualdevice_id_friendlyname`,`VirtualDevice_virtualdevice_id_functionalci`.`finalclass` AS `virtualdevice_id_finalclass_recall` from ((`lnkvirtualdevicetovolume` `_lnkvirtualdevicetovolume` join (`logicalvolume` `LogicalVolume_volume_id_logicalvolume` join (`storagesystem` `StorageSystem_storagesystem_id_storagesystem` join `functionalci` `StorageSystem_storagesystem_id_functionalci` on((`StorageSystem_storagesystem_id_storagesystem`.`id` = `StorageSystem_storagesystem_id_functionalci`.`id`))) on((`LogicalVolume_volume_id_logicalvolume`.`storagesystem_id` = `StorageSystem_storagesystem_id_storagesystem`.`id`))) on((`_lnkvirtualdevicetovolume`.`volume_id` = `LogicalVolume_volume_id_logicalvolume`.`id`))) join (`virtualdevice` `VirtualDevice_virtualdevice_id_virtualdevice` join `functionalci` `VirtualDevice_virtualdevice_id_functionalci` on((`VirtualDevice_virtualdevice_id_virtualdevice`.`id` = `VirtualDevice_virtualdevice_id_functionalci`.`id`))) on((`_lnkvirtualdevicetovolume`.`virtualdevice_id` = `VirtualDevice_virtualdevice_id_virtualdevice`.`id`))) where 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-28 14:44:25
