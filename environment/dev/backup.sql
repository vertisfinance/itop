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
INSERT INTO `person` VALUES (1,'','','','My first name','','',0,0),(2,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0`\0\0\0€\0\0\0ô\Ülº\0\0 \0IDATx^Ü½wœW•\èÿ½U\Õ9÷ôä¤™‘F£œ%[\Î9`ŒÆ€Û°x·\ë,–g“`³&\Ø\Û,€8[¶,\É\ÊY¤\É9w\î®ûş¨ª\îF2f\ïı\Î\Ç#ß®:7t\Ï=7”\à„\ÓV¸uô+v;øS‡\ËY²b\Å\n***ˆ\Åb´¶¶r\è\Ğ!²\Ù\ì\\\Åü‡ƒeË–Q^^\Û\ífdd„mÛ¶1<<Œ\Ï\éy!\â\r~üıòÑ‹¾ÿ)}®²\æu.„Sˆ/ø½]\Íÿ\Z‡\æ­ZµJ)))¡§§‡]»v\Ñ\ŞŞ®ÿ\Í\íıol6K__###8NŠŠŠ‡\ÃD£QF\ÆG©lf\å+G\Ş\ÚùÀ\'¿\Û\ï\ëO\ÎU\Ü	\áaÀû\Ö]d/ö‡Şµ³ı\ĞJ\ËË–¯ZµJóx<´¶¶²c\Ç&&&\æ*\âÿ:RF\é\í\íebb‚\Ò\ÒRª««I¥R®Á¡¡y“‰\Ø\Ú}İ­/w\ÏUÖ‰\àofÀ\Í\ç¼Gi\é\ï¼r\Û\Ñ_pû¼kV®\\©ªª\ÊÎ;inn&“\É\ÌU\ÄÿÕ\Ífe``\0\ÇC]]ñD\\­šLÄ‚\r\ÅU;&FF\ç*g6ø›ğğ-·\Ñ\Òß¹è™½›¿‹*Ö¬[·N\Ó4\íÛ·\Ó\ÕÕ…”r®\"şŸD\"ÁÀÀ\0º®\Ó\Ø\ØH<gpx¸\Øi·{N›¿t[Kg|®2\Şq8·im½MÕq¹\\ò\Ì3Ï”—\\r‰‡\Ãøÿõ_uuµ¼\ì²KeII‰–\Õ\Şú\Çş_\ZoŞ¶l˜¿\"\Ø\Ú\ßù™\Édü=‹59«««Ù»w/½½½seı¢\Ñ(šf£¾¾w\ß\ÈP\ã\îÎ–]ƒ#ms\åo›¢÷5÷w|¶¢²²x\é²e¢­­#G¼c\Ç\ãa\ãÆlØ°»\İN2™$›Írù6›\r¿ß\Ó\éDUU2™Š¢ ª*Š¢¼-3)¥dxx˜úúzü~?ıı\îL&­]´x\ÃöC½\Ç\Æ\æ\Ê_o‹—.\İ8ÿÍ¶½_r{=«V­Z%\Æ\Ç\ÆÙ»g\ÉTj®¬\0\Ø\ívB¡^¯—¢¢\"\Ê\Ë\Ë\Ñ4-÷®¸¸˜eË–Q__\Ãá ¬¬Œ\Ê\ÊJ\Â\á0@\0¿\ß\Ïøøøf\Øl6\\.v»\0]\×B°xñb\Î;\ï<.\\Huu5N§“\ê\êjjjj¨ªª\"‰ „`rrò¸m\r¤”d2.\\H<W»ûzb\é\äğx|r\Ó\\y\á”\íÖ·®ù¤÷®~¿\\]__\Ë\íb\ëÖ­Dc±¹²\æ ›\Í‹\ÅB\Éd…B¬[·!ªª\æ¤udd„`0ˆ¢(ø|>ü~?B‰™L†¶¶6œN\'MMMTUU¡i\ZB’\É$}}}¤R),X@:¦µµ•\ê\êj–/_NWW\İ\İ\İH)q»\İTVV¢ª*§¤}}}\Ğ\Ø\ØHOo¯·ol\è_y÷\Í~\ëñ_+¯§¬½cCgv÷}³¤¤´lÙŠ\å>|ˆöc\íse›RJ\Ò\é4\étšx<N__---\Ä\ãqü~?‡ğ\Úk¯\n…hii!\Z\âr¹p:$	:::ğz½466RRR‚\×\ëEJ‰‚`0H(¢¿¿Ÿ—^z‰¶¶6zzzhiiaß¾}088HOO\İ\İİŒ\Ï\Ñê™\ÍfI$\Ô\Ô\Ô`³\Û\è\í\ë+\Û\ß\İûÎµŸ~ı\é=¯Ÿ”ÿ}\Ê\Z0Ÿü°,i\\\Ø\È\ä\Ä\íse9	d³Y;F?\áp˜¡¡!\Ò\é4»v\íbhhˆ\á\áa’\É$µµµ,[¶!BÀ\Ø\è(¯½ö\Z¥¥¥hšF4\Z%‘H\0†ŠF£¤\Ói\0FFFNÔˆ·ô÷÷SYQÉ±£\ÇŸŒ^ü\ëWû3°m®¼§<\íÒµŠ-õõõò\Ê+¯”õõõsºl\ïôŸBº]nY]U%UUÿ¿\ã\Ï\ï÷\Ë+¯¼R~ú\é›_Rı\Õ[.¼\Î\ÉIÀI› {núšó?_üã§¥*®X¼d1‰x‚}ûö²Wb\×4ÊŠø=nü~“€Ç\Ï\ã\Ä\çv“H¦\Ğ\ç°\Ã\éLšñññS²\×OH§\Ó8]NjkjioowLÆ£–ş\Î\'“ñ9Æ“6Aw¿ò\È\âx*qq¤´˜P(\Ä¯¿‘S\í\ÙÀ¦©ø=nš\æU²q\åB\Ö45\àµ\Ùqj\Z( %R€@\"X\"\ÅD4\ÎÁc]\ì;\ÚAkw?Í½d²YR™\ìI]P„‚¦)¨ŠŠ*v›Feq§\Ã@Àã¢¢(„”\Ğ58\ÂD<†D €¶\î~)C\Ò\é,\él†U«\ë:TVTR[[\Ëşıû#\ë\êŸ\Ù;6ô\È\ì¹8)|üì«´?oim,•˜·¾¡ş†††f\ÅW…µ‹x\ß\ÅgpùYk˜_S&Ç¢LŒ\Ä@\êH!d«c9&„„³V,!2K[÷ v²yÿa¶h\ápG7º>•\"B|n\'¥¡ ‹\ëªXPUN}E	õ\å%”„ü| Œ²¥0\ØSŒ\çù0>c8>\É\îöN¶\ímfÇ¡6´v‘%¶544DWW•••;v¬fgû\á«\ï¹ñkO\ßx\Ï7\Ç\Í`\ÂI1\àÖ½~!\Ä\Õ^¯\×\n…Øµk×¬A6\ÓÁ\Í\×\\\ÄÇ¯½ˆ5\å(B`\r²‰xÊ”`“`ô‹¢€ ‚‚ú\Êb\Z*J¸ü´•¼²û\0ÿò\Ó\ß1‹£\ë’t6Ë’º*®9g\rå¥”¨.‰\à÷¸Lú\nÀ2“)+	(!‘Ò¨S(À\ïsûØ¸~	©+/\àHG›¶\à\îGş\ÊöƒmL)%-\Í-\Ô\Õ\Õ\n…\è\í[½©yg#°{rœ\Ô°¡~é†‡?5şü \Ó\é\äà¡ƒ¤S3\Í\Ïi\Ë\Z¹óKŸ\àÆ«. ´(ˆV\Ç L3M¢(\Èd2(÷Pş¿ \0Bš\Ò#\ã“l\\\Ú\È/:“]-\ÇøÆ\ï\ã=g­¥¡¢Œ’‡İS,«‰@˜e\Z¹\× F*¥\èº\Ä\î´\ãp\Ø)	Xµ¨÷_rEA?\Û:N¿¥R)\Â\á0‡\Ş\Ş^w\ë`\×ş;?ü\Å\îxyVvRHfRŸLdS—.Z¼˜±±±~¿¢(œ»f	w~ùœ¶¼MUÁôÇ¥\ÙÁ\èxœT2]\Ğa¦\Äz.e>Y\Â\È!Š€•\êX½°¦šJ‚^—lXª(n\è’ET!ò6\Î\âm.-$Rš83m`X\íS8]v#\"°\ÛmlXº€¦º*^Ú¶‡\É\ØT“\Éd˜7o\í\í\íŠ\×\æ\Z¨D^y½y÷¬fH™\í…w~øşÑ¦@0ˆ\Ç\ã9n˜ùŒ•MüğÖ±¨®*/y\Â\ì„=+I\Æ\Óy\é6\rƒ4±\r\"3KZš<\Ë[h¯Ë…\Ï\åD\ÓT®>gŠ¢ 9\â«–=;nz.\Ò\É™L¶ ¨ª\Â%Wòƒı¥\á\0…066F2™\Ä\ëõj‰\Øú‡·¿X\Â	`N<±\ã\ÕÕŠ¢®‡\Ã\Øl6¦¼_4¯’»şıŸXº L\Ûn4Ö²÷ñh=\çÁ†´ŠñTJih€I\0+-¥)	\Í\Ùk\ãÏ¦ª€iÇ¥õ\Â\è–È‹ü, §\àLIHI6%J=’yE\\~\Ö\Z.?kÍ”c±½½½”••1™ŒE²ŒÀœxõÈz\é\r‡\Ã\Ï|ÿñºKh¬-L’\na\Ğ4+Y=K*F/0-S|ºi\È\Ùf\n’û¿ñ\0„\Ìk‘\0\ÃÔ™x–\0‚U–, b¡¤$º„T\Ü\ì³\È3YHp;,ª«\ÂaŸ\ê\Ëôôô\0\ÂEÀ™œ\0NÈ€\ï¿ÿ_¼^§g¡¦ªZQQÄ”ş|£—/¨\å¢\ÓWš¿Lû)%õ§\éT–TÂ´ıR\0:†‰ e!R\Ê)Ú“3u\Ò|j¾—HôùA\na9S)òÖ¢€\Ñy³99…\Â0E0~J	ñX‚¬e†L&X˜\ë–\Ì\'\äó–\È\Ø\Ø\Ùl·\Û\íl\ì\ŞÀ	\à„x\é\à¶`VÏ®u¹\İN§\Óa.®U!8c\Õ\"ªK‹r­1„cªt%I²º$\×#CKL<!D.˜ö|F\Úü³\æ\Åx.\r&\ÈY\ÚPÀn¿	…Z\Ç4M¥•†a\ÖQ¥©®Ÿ\×\Åt\Ä\ï÷381Zö\Ç[nŸ5,qB¼x`[xhr¼>‰\ä\"—ø=.\Î\\Ù„\Ëi\Äß§v\nÀ°Ë±‰†·‘#O\ÔR\\¨SÒ³\á\ç˜i¾/H\çÿ•&=\ß&¾ù\Ìò¢\â\ÑdA›¤)Dø¦j\03·Ûb~s_G\ÕNÈ€º\âò\n]fƒ\Å\ÅÅ¤\Ó\é)ö?òs\Ö\ê\Å\ÆAA\ã\ÍN\"HD¹«\årš?¦J\é,\Ú0+~AS\ÓZAŞ¿\ß0‰„$ÎN¦s¹-F)ŠÂ¢ºj¦C:F\Ó4¡¸_o\Ş\Õ8Á„2À\çp7©ª\Zôx<¤R©)hª­¤¼84k^©K\â±$ \n\Ù`P¡}/´\Íù\ç…ï‡/\nò¦9Nş\é8\'‹Ÿ\Ã0ş\Óu’‰”‰j2L‚’š²\Ó!“ÉN§QTE\Ù\×\ÕV3Á„2 {lp\Û\í\Æf³\ÍX=ıò\ÜÀ7©dšT2ƒ\å\ÕKóyNò\npóB™B|5—mÊœ‚\\o¿P\é¤4\æ22“%\Ï\Ã	ğ¹LKXm6›\Ò\Ü\ßQ>Á„2 wl¨\Â\ét¢(\n‰D‚TÁš\ïÒ†‚I\×õ5$,™L#³\Æ\ä)O=C\Úò¦Æ”>Qğº \ÔYñY0JtaS¥û\Ôğó’®˜y\éT†t&k´E’“Ê²b¦ƒ%¬ªªb\×lö?\Şr»}\'`ÀSÿòSg2\nz<TUelllJø¹®ºÓ´Àè€®\ë$b	y\\`I˜9\á²z£‹0¥\ÎÀ91¾\åÕ˜B˜\ïgÁV)oŸ)yM\ïGJbQ3ª òù<Î™\Z \ë:RJE\Ñ4E?41vj\è\é\Ä|§Ó‰®\ë\ç·@z]\ìfLßŠ\å#\ÉùÇ©dšL\ÒPAİ˜\ç†D\Íw\ÎxÃ”ôlø\ä˜OO}nåœŠóN\à§\â)ô¬š(d\ÔL°\Ùl¨ªŠC³—\êmgV´öw•	b·\Û\Ñ4\Ír©\0(\Ñ4Õ~‰a…\È}Qsğ%ß¼|3<\çdğiöúøD8î¬š¿\r?›•\Æ`œƒ<§ƒµ÷’\ã¯\ÎÊ€¡^¿¦\Ùp8X!\Ëv¶uõK$±Fªœ:A:™!\Ï0•œ\ï<\Ìôdƒ\ÃñqşVüD,eÃ³÷Oc‹\r€”\Ò\Ş;>|j&¨y°«\n¦A4\Z¥½cjº«o¤aC…0ÍŒ”$\ã)²z\Ö§¦zL\íÀô\îş>if>›=ˆv|x\çğ¥„t*C&•1~Ì¢\0ªª\âv»\È\êYk·ÿxx³C}A‹Àc££$\É)\ïŸŞ´‰58\Z \0\è\æ)ÁŒ\Ø\0 ´ H\ÌÁ[šL´Ê\ÆJºñ\'¥‘/\×Q¯\ĞOgJÚ¨Ğ¬[XeR@¬ÂŒF;„\Ô\è(–&Ka\Ö)óx¦	B’IgófHÀ±~¦ƒªªx<|>s)Tœ¢	RU7–ü2‚Á\Ü\ÖAyq3m}F\n(`s¨\Å\"©\Èi©‚–B\"æº¬©A3´\Ä0_Ö¿\Âz”cg!ş´t®a\æ\È\×eÕ—w7¥iŸÒ¬I˜\ÌË·\Æ)òL”\Í\Z8BB6c7¯)6›@ €¢(d2gÿ,&h\Ö5\á5:;‡{õD<\Ã\á0\Ö9\Ö’©©T>L†\äÛœvTU1Cº„¬\é’­/$¢@A˜Á­¼&Dn\ÜBR\èDŠ\\…‰fK\ç\rºe%:\ÙÑ¤V³I¤\Ót‘Le\Ì:¦\Öò{)+\n¡ª†©UT—Ó«\íü\rË¨.-¢£/¿QÁ\étb·\îi\"t\ì™0\âXZ\Ùpô/;_F£e\0\Å\Å\Å9(Š\à\Æk.ba}†±76!PU›\İ\Æğ\Ø-]}¼±û¿±ƒG»f\ì÷Q„ $\ä\Ç\çq#€\â`€\"Ÿ„‚\ß\ã\æŒ\å9w\å¼.y6\ä¥\ìx`™k‹™©Tšw\ì\ã¾g^aok\Ã\Ñ\ä>>\Ø4•\×.\åCŸÍº\Åó	ûü\Ø\\ö¿Î«\äÖ\\Å—î¸ŸhÜ˜\'D\"„\"Œp„¢f\Ügf\">³\îY\ĞXZİ¬K½=™L–e2¢\Ñ|\æeókù\Ğ\åg\ål,0%½õ`3w=ô,;·\Ñy‚#Tº”ô\Ñ;l\ì\è>\Ü\Ñ3\åıã¯¿\Å7o¼«\Ï\Ş`Vg\à\ìƒj/«ë¼¸c?_»ûAz†N|Š\È\ërğ81m’©y0K2‹óô\æ]\ìjn\ç\Æ+\Î\ãÖ]•c4Â°÷W_p\ZO¼²\ç\Ş\Ü¡ˆl&\Ã\ä\ä$^‡«ÿÜ¦5½\îxyF½³2\àcw#fSµ\Ä\Ø\Øc\ãctuuğº¹\åúË¨(Ï°(½C£ü\è¾\'¸\ï//‘H$ñºœ¬h¨¡®¬˜×\"˜ºH_\Ü\È\'ˆ%“ôN K\É[‡š¹ú\ìõ†\r6µ-\ß{3OÁok\Ê‚®ş!yùMª#a–\ÔVR\Zò\ã÷¸(\rx\\ t\Æ\ÆMQ\n\r`I\"•\æPG7[´òğo «‚\Ï|ğ]„¾\\\Õe‘ \ßù\çòÚ®C\Ä	\Æ\Ç\Çs»¸t±`ù\à)1\0 ±´v÷şÖ³[[ZsÁ¥\Ö/\ç=\çm@UrSzñxŠo\Üõ\0}c\'§-¬geC5«+ˆ-\ÓW@´\ã¤g{ª(*Y]G1}j¦K{\á\Ïñ2|.;Ÿ»\æ\ÂB½)x{jéŠ¢ \ç­\\Lÿ\È›´ñ\â\æ]\\}\ÑFTUÉ™»U‹\ê¹\æü\r\Üÿ\ä\Ë\Ä\ãq†‡‡I¥R=\İ\ÛPR}\\<!|.w—”rÊ±£O½\ïRB2^Ş¶—€f\ç\Ë7\\IY(€]S)3€%¼Ö„n\ê\änŠI)HI)Ig28ò“\Zw­¤‰oñ(\Ï\Øi\\2´\ÄÌŸKC~iSÌ‚# $\àŠÓ–\ç\İzYPÅš\Åõ\Üÿ\ä\Ëd2iúz{H§\Ó\èº¿ö\Ïw\'\Û	£¡™l¶Èn/+rÎº%µI\ã\Ïônæ…ƒ\\¼v	5%E\Øm\ZÃ»\Éùû\ä…\×ğn\n\Ò\Ó”iZ‹B\ä\n™\ÂXÀ¢À”\Í	b!\É&“°\æ[\Ó2\Ó\ÒÀ‘b&>HEP	¡\nÅœ3\äª`~µ±	\"•J\Ó\×?€Ô¥~V\ã\Ê\Ã\Ì\'dÀhl¢È©\ÎË›Œ„Ì‹ŸE_EU§Zd\áDš7s’“K\È<¡s °\Ûl8\ìv0‰Ÿs\Ìd‘Ê§v;6kş\"\Í9GºQœœ™6\å\ëøø\Æx\áv;\r<“yX\Í\Ëf³¦\ã\"3µ‘ò™35¦˜ goı™ò\Üş\ÍŞ¬U\"\ŞP\æk¾kˆA!\à\ÜuKA!Ë…90º=Nrc\Â(\à±(œTJœiV\Ã@¿×ƒª\äwwZ¦j\ÊX>#m´Án·\áu;Ÿ\ÌQ\ÒÂ±Z)„8NZ\à\È)ø\n\àv;q{\\y‡³nÀ\çqx›´\ëkk—´WK‚Y]\Ç\ëtÇ¾ö\ç»rÑ¼)øÊŸ\ïl\ìù\çL6ú]®‘\èDF—:‘P€\å\æM‘@¹Æ‘Hˆ£mİ¤\nöŒš‚@\ÇÀ=C£L\Ä\èR¢©*5%ET—a\×\Ô\\f\0R`³kx=\î\\•Vˆ8·¡V\ä¥rz\Z@QÀ\çõ0“\ÍdrD‚¦II{ÿc\Ñ8R\Z\åº6Ê‹‚ø\İ.@\ä\ÛH!ğ|8­\ÍV›LM¶i\Z›\r¤”ö\ï=õ\Û/¡¸… U\ê?t\ÏM_}öÆ»¿™|üœ«¼/\Øú\ŞñÁ­lªó·÷$&\Æc1)¥`am•¥\á)\ÍK‹§\ËNMmm­]d³z®m;¥cp—C£,è§¤¼¡(d3Y:†xó@«\ÊYV_‰\Í<d<.\'vÍ†@Ar¼\0™œ‘\Î\Ù³¡.§‡\İFÔŠ\áÿK$\Ù\İ\Ò\Î\á\Î>|n\'\å\á\0ªj[\Íd3\ë3f\Æõ\Å\Ì++\Â\åp \Ğ4•òòˆ9+	N»€\Ï\Ã\èD”x2…\0ûDzòæ†ª2G\Æõ=]-ó¿ù\Ø/÷\íP°9W\Êü\æ¾\Îo\Ş|\í•\Ü~+º\âmlbÒµ¿­S\Ëd³\\²q×™n—9Y\Â\ZD}~/>Ÿ‡L&K2™DG2M\Éf\Èê’¬i]\'L‘Hg˜WV\Ìi‹\Z\Å\Ù\ÛÖ‰®KŠü†‡\å°\Û()\nc³\ì6\ÍÂ’JA^Bt\Î\Ö³mv““Q¤”dM‰\ßv • \×\Í«—P\ä÷\â´\Ûñºœ¸v2\Ù,›\Æ\Â\ê2F£Q¶j\Ã\ãtPPW_II©±¶R¨Q9{\n”¹`\Ãrşò\ê[4Ö”óğ>\Ï\×ş\éz–Î¯zş\rwU°¬³gtph€\Ç\á\\¯ª\Ô\\qö:@	øøò\Í\×\Ñ\Ò\Ñ\Ëk;²´¡\Æğn¦A¡\İW…HqŸ\ßC_\ï Ï¿¾“ƒ\í=<û\ÖZºûq9\ìø\ÜNPR—|œ\Ö\ÔÀ\Å\ë–R]\æpg»š\ÛY³°¢P»İ‘3aù\n\Å\ÔÿciÀ$S?‰™\Ãa§¤¸ˆ\É\É¾öƒc\ã\\¼v)\ÉL–{Ÿ\ÛÄ\Ö\â©BK‰\ãñ™l–õ5\\²v)—lXA\Èç¥¶¦œ²ò\â‚Zòÿb\ÖW\Z	ò\áwŸ\Ëo}€‹N[Éº\Åó‘\Zk+X±p^ä­½­—\0wAÁ¹»£ù’\åóÜ†%@|^•¥l6Í˜ùN«Ú¨V’·ô†~§3Yu÷s\ß›ùÓ›»™L&išWIcm\ÅaÖ®X\Æ]¿ø\ïy\ßûy|\Ë.ş\í\Ò;6Á\ëWi\é\Æ\ãr‹™²P¸\n\ØQ\à1\ÍğD~¤¡¿\×C,#‘Š\Â\'®¹Œ®\ÑI¾ş\ÛGxq\×PÁ€›P\ĞÇ»¯º’_\Şók\Z\Ìgg\Ë1\îx\ì6\ío\ÕF0\èŸ¶Ì,\Z\r\r<\Ü\Ö\rÀò\ÆZS@y$\Äú¥\È\êz\Õÿ¼â£`2\àGø\×\àX|²dQ]%‘ \íZøùŸE\0•%!²\Ù,\Ã\Ö	|Q\ĞùB\â\Ãd4Á\Ñ\î~xe+ÿö/©\\¸‚›>öT–„ñ8¨Š@Q\å\å¬\Ûp\Z+V¬`ù\âF\Î:ÿB~ò\ç\ç\Ø\İ\Ú\É9«–°d^5Vğ\ÍØ`\Z\î)Ò–\ïü\Ì\çùŸF_€Pp\Øm|ğ\â³xä•­\Üùø\Ë4.^Bui·Óª(\Øm6–¯X\Éy\ç\ÇikW\ÓPYÊ‡n¼‰\'\Ş:È¿ÿò\é\ê%•.œO\åûn9B(H	G{ûQUÁ¼\ÊÜ´‡{,_ƒ\Ç\íh|v\ï›\ËÁ4AûºZš\ÜNGÓ¢†j„Pø_=LW\ï \Ûö¢¢4BpğXW¾Şœ\Êv:û‡ø\Âÿ¾—ş‰ß½ıv®¸\â\İ<ş§yZ–\ç‚\àÀ¾=|\îobbb¯\ÛË—¾ôeşø\ç?ó\ãû~K}E)õ•¥¦\ë\'Í˜¾¡‘ùHEüé„·[)c’dxM‚\ê’\"~sxyß¹\í{L\rğ‹;Œ$(¤\Ói¸\ïw<ÿ\Ì\Ótv\Ãn·ó\Ío|ƒ|ø#|ş\Ö\å\Ã_ù	\ï9g-ßº\åƒ3aÉ”ùÀ\î\ÃÇˆ<ğôk4·u32eÅ‚Z–-˜‡\×\í´\ï\él®ù\ã-·\ZğÊ¡·\æ{\\ÿ\Â\ÚJv÷q¸µ›Ï¾\ç\"´Œ\ä\Ñ· \ë:#\ãÄ§/FKi.¦³Ò£\ì:\Ü\Æ\Å\ïz\×]÷>‚¡\r\âv{@‚b’%‘Hp´­\á¡A-]JUu·\Şz+\×}\èø\ÜO~CkW/BŠœ\Ğ[“4A>tq|\È{J¦Wh\è‘4˜\×\Ú\İ\ÇÏx™o|\ç?x\ï{\ßË’\å\Ë	E@\n¬¯±‘š\"³l\å*\\.7Ë–-\ãö\ïÿ\Å\éeç‘£Œ\æB\Ú\"__A+†G\'˜Œ\Æ›Œ±s_Ÿ¹\êBV\ÔUqÿ_^eAu9Ÿ[óØu#ı^\å\ÙûO¥c¸¿\Â\é°iu•%¼´uµ¥aŠ^J‚Z\Ú{H&\Óô34fí–VıF\Êüùs\×ó­O§ÿ3\ßşö·\é\ïï§±±‰Uk×b\ê¨aŠŠ‹y÷\Õ\×\áõúhk;JOo/ûvò›§^&–J™\è&ƒsJ\'\Ìÿz†F\Zi\Ë|	ı#\ã\Üvÿ£ô14dœsX½v=g{®©]»,Bz=^\Ş}\Õ5!Ø·o_ü\â¨	¸øú\'®\'ğa‘½p&m<’4wôH§I§3xN|U\å¼u Ì«(\ÑEYùÚ¡eO\Ça¯\Ó\îX\ãó¸œuU¥$I\Î]±ˆtV\ç\É7wqõk	ù<ô\r12\ç<\Ú\ÌÉ˜\Ãaçƒ—Ÿ\Í·~„WøW^v)?ù$\ïº\æ}\\z\ÅUDŠKğúhš¯\Ï\Ï{®»£\\ÿş\ë¹\ì\Âó8¸ù¾uóõ¼±÷0G:z…uX	³\ÃyM˜¦RZ<\ÎA\"“\æwO½D2•\æc\Îo\îü1kV­\ä¶\Ûogõig±z\İÁ^ŸÀÏ‚¦&>ñ™ÿ/\\\Ì\ç>û>ô¾kY\ÔøßŸù0\r%\Å\èXšVM…\ÂÖ®~R\é—®]J2›aû‘£¬Y8ª¢“\Ñ8«\Zë‰¥e[\îj/\Üˆªª\Ò\"lª\Ê/8“ññI^\İu\0¯\ÛÁ5\ç¬\å\ÍC-t™\Zw;Ch†ô€@U\Ë\êªøñg?\Êó[wó\ã\ï~“”\êd\åªU\Äu•‘X’±±	R\ã\ç?»ƒb\Õ|û\æ÷²va6M£¡²ŒÒyöÊ’xË ˆœa)\è¸\Ì\áY‘¦\äKt‚Uu\\~ú*Í«\æ]Wóò}\ìxñI}\à>w\0!u\Ò\Éš¦6~wÿØ¹sk\ê«ø·\ë.\åô¥hªB*‘!•H\á°V\ÄÀ0—¹ú\àÈ±nt]§¶¬˜¦\ÚJ¶7·s\åY\ëùÒ‡jñ»\İ4\ÔTO%½\éL:¢u÷¸3ÙŒAu9Ù´a½n\Ç†Yµ°€\ÇE\Ğ\ë\ì½«\0\0 \0IDAT¡­g€c\İıLS¸‚¤‘\ĞuIt\"A$\à\å½\ço\ä\ìU‹\Ù\Û\ÚÁ#G	E<ˆb‘ó\ÊK¨.ğzŒ¯9\Ç6,^@\Ş\Ş[\æ\ÇLsœg\"ÿ\\B\Î#Áô€ªÊ…k—\ç²Õ”ó\áK\Î\æ\ê³706\åpW{[\ÚL\Ğ=8\Äğ±fjK#\Üx\Ë\r,ª© \àñ Kô$±\É6‡\rE1\ëFÿ…€x2\Å\Ñ\î~lªJEQ•\êø\ŞCO’• \Ù42\éŒypˆ\×\á®\Ğv¶ö‘²H\È\è‡H¡³ ª§¦’He\éCZ;Í˜‡e\Z¬› %\ÉhŠtÒˆ»(ŠBYQ˜²¢0®[ÁÉ€\åI\Ì`t^\æ\É3czšœ\"\Ä>ÉŸŒ/°òBÁ\ëv\áusóV/#yüÂ´av$©xŠT\"\Óm_54\Ğ8O6<>I÷Àº®“\Îf)/)\â\Â5KQTcK…²¢\0€\æsy\å})ªMEQ\Ğ\Âù«—±°ºŒ½m\í½lš\Êöƒ­XR–‡<‘t]\'7‚ZS|2¬F\ĞK<c\Úó\Âw\Ç\Ã/ô†¦zF3óO\Çù\Ûğ\Æ\îød\Ã3+\èªM\Ò38B4™¢¹«—\Ød”]|&>—¡T­€.R¢T†Šc.›½ÿõd*\İa3!\ãpW—52¿²Œ‡\ÚHf\Ò\r6eIZ¿ “Ñ…\Öúm«ŒT¤\æŞˆ<š(\Ú\á[¨¹lS~\à\äz§ğ¥±†œˆ¥rsí”’¡\Ñq:û†X1¿–c}\Ãt\Û81y6»\Æo\î\è\×%‡”V¶jªö\ì\æ=‡3/nÙƒ\Û\ë0Š“M³O¤¨¯,cI]5£\ãQ´v\æ*f\İVEA\Ó4,¿¦J´\Å*#ö/r¿sÔ•¹NŒœ\ê~ÿw\n_\Ò\Ü1ˆ\çòFµtö2±¼¡Ÿ\ÇI:›\É\íµ»\ìNrÏ£\Ïg<\×\áñ\Ä\ä6\å¡-ÏŸ½põC“\Ñ\äö;|š®ÁQœ.‰¦©xœF\'&YZW‚W\ß\Ú?FùŠ*P\í†U³¢“\Ö!7QğLJc0\Ëq\Ï\Ä0\èœg\î\ìø–du\ŞòÌ¬\çÖ¿yÎ¾cø\"£9\Ô\\û-Ö½ò\Ö~\0*\"!Ò™,vMCSU \Ø\î~\ä¯\ì:rl\Ò\ãp?°zŞ¢\Ã\nÀ_v½¶%\âÿù…-»\'öÀS8½lN¡€Ÿ³—/\ä\Õ]\è#\èõ\ã@A¥£¡v\Í ¤\Ô-’\åqÍ”‚œ[I~L\É\Ëß‰ñ\É$Ÿú\Ü\Ê9\çÀ7\Ø$Ppy\\V\Æ\\ƒ\ß\ÜsUQxn\Ën\ÖÌ¯¥¶¬‡Ó‰?\ä\æ\åûùù\Ã\ÏN:Ç³Ÿ>ÿÚ‡\Úò\\*7¯©Yøû°;ğ\äo)öú\ÃøC^<7Kj9}Q=\Ïnİ…\" ­»Ÿ\áQã‚»)\Ä ¥\Äf3\ï\ãù÷…²Uø4/yù_…\é\Ùğiöº\'\â\ï€/¤¡ôv—\Ã\Øûo €ŒGi\ë\êCJ‰\"$­[N$\Ä\ëw‘Fò_<LÿğX¿\ß\å¹ókü¢\n\ÂÑ\î|¹³<ùA,–:ü\åŸ\ŞOkw¡b“\é4µ¥\Åhª\Â\Ğx”Î¾!\ë\"99¢	\ÍnC(\Ó;˜\Ç}§`¦\'só·\â+Š0å§ˆ O¾¶¬.Q„\à\Òu\Ë‹%qøœ‡\ÊW~öv>\Ú\ŞXZ{\Ûÿ¸ø†-¹²\nşş>·­¾¤\ê»{š\r\ŞùÀS\èŠ`_g7~c\'>‹\ê²0ƒ#\ãtö 8~#U\Émb5\Ôw&LVøûdğ-³dÁl‡w_\n\Ğ\ì\Zª\ÃZ©\Ëkñ\ë;a\Ó4jÊ‹yı`\Ï\î\ÜGJHÙ´ƒG_\Ü2ñ[V5ÿ‘\Ïışû¹\ëk¦\Üt\ï\ëO\Êo¼¼m`bT{u÷Ş…5¥\ßu—œÁ\ç¬\åúKÎ ª¸ˆ?>¿™5œ¹j1ªjS2‚^ù3›Ñ»f3¹”agE>9%\Çlø ’üğS6\Ê\Ó\Ò\ï >—Ï‰\Ó\å0cˆ\ÇÑ®~~ú‡\'ñº\Üõ•\â\æ«/\â\â3V2:>É_¿3342±=\èö}\æµ#;û(€+\Ë?|\æşX\Ø\ë¿Ç¥¹¹ı7fvj£4 ¼¸ˆK\ÎX\rÀ\Ş\ævkÁ9G´B\ÂÙ6@š¡\ê\éPøL\äŸòù·&XH²\àù´´,|&\n\Ò\ï¾P„±gZ{´u\Ñ\Ş3HcM–6R\Z	’H¥ùú\Ï\Ô{úG·-®høò÷®ÿìŒ›Í»´¿¹yOg}¤ü]}C»?sÛ¯øıS¯’\Éd)-\n²¨®Š‡\Ú\ÌÉ…4\ÄCNm¬fSQ\ÌC\Z¹Å¬†\Èå³\çq¦!o\ró&\r†\n\ß\Ğ\Z\ã‘–¶Y†0ŸM\ã¥\Å|c\\•d\Ø\ìv\rUSs„„LZgûÁVG\ÇÙ¸¢	MSymû>ùŸóô¦Í«\æ5ı\ç»W³\å½w~\é0«\Üœİ¸z\í\æ–=\ß\Í\Ê\ì\ÚU‹\êƒ®7Vú÷4\ã\É;şİ¼ªF\æ­ Ğ…qNxt`’D<…\ËU5EŸ­Ÿ’\É$ı#£E)	úˆü…\\RJI4–¤khM\ê*Kq\æ\Î\îšZ&óv½0=“\ãy°\ÆX\è¡bn·ë€‡D20<\ÎùŸø*Ûºø§÷^L\ï\ĞO½öV)v\Ï/©ùõ¾\î–;˜Nxg\Ü\İ7~¹wÓ‘=›#¾\à\äÑ>\Ïó[w\'û‡\ÇB\0á K6\Zw	\nhj&2\é©d†<‘MA>P€7„\é\è\æ7O¼\È\Ó[vQöƒ®3d\"\Zeb\"\Êx‚¶\ï\Ãå°³²±¡L\İ:û ,¦ıY8VSE\Î\Ö\Û\ì\Z¿EfN°i\×A\îø\ÃSH)Ù¶¿%v´k\àP\Äz¡,¹m\ãüeo?vh\ÖV\ç?\àÏ½\Æù—İ¯¹\ç—T‡ûÆ†¯ièº­®¦„\ç\îú:¥Ew¦ILH\â\Ñ$£C“È¬y´‘§ñ´Nš*Ï´W…\Éf›Œq\èhUÁ\ã4#‘\'m\ÚúY\ÑXO\Ğ\ç\Ãe\×\È]O9…±² \ÆokŠ•‡<¾’ü%€\à\r¸	=9Jgø\ØW\Ê\Ã\Ïm\î^PZı•ú\â\Êm\ãñ\è°\Ó\æı\Â™¼ø{·p\"8)Xğ\ì¿İ¡\İp×¿?001zMÀ\ë\æg_ú\ï»\äLrj\\À€T2\Í\èÀ™t6/õ³	ùIY\"PºN4g2E×\í‡.‡¯×?³ $s\ì;>IÈ›\'EUû±9myvJØ¼û0\×şû™D,ó§‹—lø\ì[ÿzJŸ9\éV~ı\êTşõ¿ş÷5£—ƒA¢‰¾´•\á1\ãUù»\ÑhM\Ó\ĞT¥€°’\Ü4RN\r\ÖN€¦@¡%HE|7e‘0e\ÅE”D\"ü>ó\Ú\ÊÂ°†Y\Çù›ñ¼€Ô’\\Ád…\Ø4Õ˜d4)•\Îğ\ØK[\ZH¸\ì\Îß·\á¢YwA\Ï\'Í€--{›\Úºnòz½\îuk\×Q)\æù-{\Ø}ø(X;\n\ÄXQšC›ö”¼µ5]‘³±… ±\Îç°Š¼7\"¡h¨Šj\Ü\Ìkr\ßR4+rd\Zóÿ¦Gc	B«\È\áb\â\äYiE…\Ü>—¹*f`\ï\ác<ğ\Ì&TE{\íó—}\ìO\×\Şñ…S»Éœ“dÀ\İ7~C;\Øslu,•X]QQA0d^]\Ãcüöñs\"±€\Ó\í0©6›\'Q!.\'³;™‹)’\Ô(T7M\rH7÷	aRæª—V)Rm…c…\Ìo+`ƒjSrs›\Âñ\ãÁ\ç^§£op¸¡¤ò/Ÿû¯\ÛOYú\á$pÿ\æ\'\Ü\ÉLòZ	\á\Ú\ÚZE¡¤¤˜²²2yq/l\Ùc®€>H°9lø‚\Ö%f‡DTÇ¡¿™\İb–\Èk!srj`\ç¶‹<\ÑLr’3p\êS(\ã–v\Ë \Ú5üaªfzUFa¼¹ûw?ò¼\îq¸vK9oIŸ\rN\êò\î\ÉD,\Ü;6´8(\áP¤4?®SJ?º÷1Î« ²$Œ\Ñ%“<B\àõ»Ñ³:\Ñh©\ë¡\ä|w«3…[ˆÀ\Øc:02J\Â\Ú(\r‰v8\ì¸\ìÆ®=+‰¥ŒÍ´R7\ËC\ât\Ú)	Í²DA~aUk\Ö)™¹‚g¨Í®{\r\é—y–õò\Ãû#H®‹T\Üù\Íkş±û\Ú;>\ÏÛ“b@™¿¨)«\ë5¥¥¥9©I$ôõõ‘\Õu^zk/¿ú\ÓsüÏ›®5Ï‡‘3BøB^t)‰GXò%°:mA\×u#¼+\ë†G\'9\ÜÑ…C\Óp˜[ÔÕ¸2&5N½\ßP\ré—€du\ä`†}\ÍG±\Ûm4Í«&dÔºnœwS\Íû­¶\ÌtN;¾»\Ãf¸£fË³\Ù,<½‰§7\íĞ6ûu‘òg¯½\ãó§lû-8)tô­B8#\ãrºL6Ë¾}û\è\î6V\'’inû\Í#,_P\ËU\ç®G¨*9wA\á\Û@‘Ä¢Éœ4IAJ‰‰I&I†G\'«g)qÚ´^*“!•I\ãu¹°¢¯ƒCQ\"ŸQ§Tq\Ùm\Ü’©4»A‡\ÓNÓ¼j6Ÿ\Çc€¥…¹ùˆÀ\á¶*ò!T%¯–fe›÷\â?\îşc]lû\ÈYWü\è\ç8õ¯ÿÀI1\à`\Ï\ÑE‡§Ó‰”’cÇq\ìØ±)8\ét†oÿò!jÊ‹Y³¸œª\0\"¼A™ŒN:‘A\æ$O\"ut6C\ß\Ğ(;6S\à°\Û\èŒ°”ù;\'2Y»MC p9lD\ãI\Ç&˜Œ\'p\Ùí¤³Y’©4‰d\ZUUp\Ø4R™$\ã,ª«AÏš1$a\ÊÁ \ëò:ğ=ñ!oö\ÃG»ù\Ú>À\èDt¸&\\ö\Ë\æ¾öVşF˜óúú‡?}»öû\ÍOÀ\çó-®­­e||œ;w’LN½¾ dœ\æöV/j ¤p†lrB(\n.§t2ƒ®\ç5@°\Û4Ê‹‚¤R|n\'E>·¿Ç…\Ë\î LRò£i\nG:ûŒO\Äbô1S[!\äóO%)òùù=D‚>\Â~¯q§¢p\ÚòÅ„|TMCU5\Ó\ÔmS\Øc_ÉKB‚‚#\í½ü\Ë÷\ï\á\Åmû\ÆK\áoœ¿hı½\Üöü‰¿\ár0§$nUQ\Ë^¯—£G›\å£mRJ^Ú¶[ğ\ã\æ\Üh\'­²P4•@Ä‡Ã¥‘cŒ\Ø5;6\Í\ÆÊ¦ù¨;±šª˜v[\'\àõ\à´\Ûñ8¬˜_C}E1!ŸE5\å\Ì+-\Æé´¡©\n%A?Š\"\ĞT…L6\Ë\à\Ø$BUYµh\Å\æ\ëk{˜\ãjSñ…=†¯Ÿš\Æ&c|\é\'÷ñ\Ì\ë;Ç‹½¡û¾}õ§÷\Û\×?\á§IN\æÔ€ºHEí›­{?]QY<}\ã\é<ûÌ³d³YE\É\İ\':\Ú{8r¬›ej)	™\'Ê­N	cZos\ÚÈ¦³d3:\Æ\äH …À®\Ù(øP5•c½(BÁ\é°\ã´!\0MU\ĞTMUñ˜\ë²65*?«K’\é4\İ#cd$,¬«f~en—kre]. \0ESF|8\İ\Æõ\Îy—Ù€\î¾õ‹yğ\ÙM“E\Ş\à\ã\ë\ë—\Üöı§~\×\Í;s=k\Å\ãõ`·\ÙI¥R!¨««crr’¾¾)<€q™\Ñ_^}‹–\Î>~ş•O²nqƒy\ØÎ²¦\Æ\Ô>ñ1>2iÌ–¦\è\Øm6ªJ‹ñy<8\ÚA|<Š@bWU´\Ü954\íx:“!5\\ÜŒ®\ãóz8ce->—q\ÌT`3\nH£*E\ì¾°›=¯V¥„Áanúú\Ïø\ë\æ]“¥şğ\Ãg7­ù\îC[›õ\ÔûÛ95`\ãü\å%[Z÷\İPW_hhh`Ç”——sù\å—\Ó\Ü\Ü|\ÂO\0ó\êöx\\N–Î¯™q\ÂR(¤.\É$3~n!p:lT–Dğ{\İ8¤€Œ®„4\ÍB\àr:‰„C”FB\ÔU”Q]V‚\İfaM\×,›n0L\0n¯Èƒ6\å\îÿ|£µ«—ÿù“ûy\âå­±_è™•µÿ\ãñ¯\à†95 R©\çw\r\r\rø|>\Z\Z\ZrÍœ\rZ:zø\çÿõ+\Ş\Ú\×\Ìnºš\ê\ÒHn§\æ\Èö¢ª\ZÑ‰(Ù¬\éq›¼P„}>B~Ÿ#“4wõ246MÓ°i\Z¿‡ŠHØŒ)¾\r\æ‚\r\ä\Æ @(\n¿ŸßŸña\à)‰&“<õ\ÚşıûSm]ı±\"o\àG7l¼ü\Ãı§\å<Y8%d³Y\Î<óL<---TWWSZZJGÇ‰¿\'™\Éføõ\ã/°·µ\Ï~ğ\n\Ş{\Ñ\Æ)\ï…Pğ\\h6…\Ñ\á	ô,!óşÏ¤\Ói¶8Â¡ö.<\'§…5•”…†g#\Íx,œ^	EQğ…=¸\Ü\Óı\æX @\nZºzùÕŸş\Ê=<Ÿ‰Æ’»ƒnß½¿ø\è—q\íŸG\Ü\ãÁI3 \ãt:q¹\\¤\Óiººº°\Û\í¬\\¹’\î\î\î\ãÆ…\Í\êl\Ş}˜\æö_²e\ï>q\í\Å\ÔW•¢š—$	!p¹U015\\UaŒE\Ş-T•óW-fİ‚Zto§(@S4rñ!	B\è\Æoi0Sshø‚^.{®,w2\ç\ÙM;ù\êş—\Ş\Ş;Ô®\nuË¹Mk~0›\Üı÷$>œ\ä°µm\ß\r\áp˜d2IKK=ö˜q—×‹\ß\ï\'‘H\ä¾bz\"ˆ%Rl\Ş}˜—¶\î\Å\ãrRQ\Æc\İ>.Œu§Û”ºñ\Ù‰i\Ë\rª)ŠŠ\Û\í\Â\ïóğy	8\æ&)‘+&·\"&8\\‚?v§\Í ¾©M©T†mûğ•Ÿı\İ÷\Øø\ÈX|oMQ\ÙO—W7ü\Ç3{6·vôŸ\Ô\'iÿ8)li\İwƒ\Ó\í\n‹\Å8t\è\í\í\í\Ğ\ÓÓ“ûX®\ës~_Ò‚‘q^Ü¶—‡Ú˜W^BUY$o÷\İiGUU2\é2kM)L‰Æ˜8©\Ö\İB\"„\á\\š\Ö¤\á\éx|N|!¯\é=\å\ãù£\ãQ¾{÷¹ı·°i\ÇÁ\árñŠ|Á¯}ş²xö‡\Ï\Ü?\çG8\ß)˜\ÓI\ÌÓ¥&Xy[&\'\ZN¹\Ğ\ïT`\"\Z\ç©×¶óò¶½\ÜtÕ…|ú}—1¿¶‰Á×‰\Ómgb4J\"f\\šm\Ùl	(H\ãD¼H¡ƒ®‰¡ÙŒÁ\İá²¶\ÛoF\'xj\Óv¾ıË‡õc\İı\ãN›\ã•3\ZWıò\ÊUg¼\Ğ3:»\éoœ¨\É\ï8\Ì\É\005\ÛdB*•šò-™wb‰w>ø[÷\áÖ\\Å¥g¬\Âi·!…0½$NOšÉ±(©D\ÚbZ\×aD–üp{\ìxün4»\r\ëvh\å¶_ÿ™§_\ßA2™9\\,şõŠ\ê\Æ?=±\ë\Õ\æW½u¢&ş\İ\à¤`¬µ‘\ÂT*u\Ü8\Ğ\ß\nº.Ù¼\çÿ\æÏ¸ôŒ\Õ|\é\æk™WQ‚\Óaa\ì¶\Ù¤)¢	2©4º\è:B„ª`³i8=vcã¬¹~¢KI\ï\à(ÿõ\r\îz\è´÷Œ»\ì\Î\×V\Õ6}§®¸b\çƒ[ûo37Çƒ90Ÿ´Š\Ã\áÀ¦i\Äb12\'i\ç\ßŒLDù¯§_\å¹7wr\Ã\ågs\å\Ù\ëØ¸²	M\Ó\n¸\ÜNœn§qs<E&1&tN\r§ÃP”œû\Ù\Õ?Ì¦ù\Éı…7÷¦ª¤)¥K\Æ\ï\ŞÚ¶\ïõ­mû\æh\Í\ß\æd@sGX\ìN§Ó˜\êg2¤şp9íœ¶|!\Û´ğ\ãûÿ\Â#/l\áC—Ÿ\ÃÇ®>š²b¬MRšMA³9M73\ïóK “\Éòô¦|ï·p ­“‰hœ«\Î]\Ï-¸œÿñ\ëD|A÷]ÿğ\Å0RQDş³90\Ö\ZD\á»\Ø\ß\Ë-ôˆgÀ=7}Mù\Ô\ï¾{Kù\İ\ÓN;\Í]QQAWW›6m\Ê-ˆ¼\Óöûø\Õ\×?Ej,ÊŸ^\Ş\Â\Î\ævš»úğ¹]\Ü|Í…\\u\Ş\æ×”Sô™“4ƒ!““qwô²m3?¼÷1Z:z)xYX]\Îû/:ƒO\Üğ.„\0Ûš\ë\æhÁ˜:Cnÿ`i |\Ğ\ïò¾\Õ\Úß¹ùü\Å\ëš\Üò\Ü\ä\\™\ç‚jÀÍ»\ÃA·o\İh2j7¿øwÿ–{VÏ’\Îdhª¯\ä&÷Ytôóüı¼¶÷?º\ïq\î{òe\Ö.\Ïòµ›_2Æ“\ìo\é\àÍ½‡9\Ö=€\Çiç¼•‹¸d\İRšª+hl¨±&¾o¼@\ÓHlœ‘\Øø™À5\Í\Öş—¯>ù\Ñ3¯¸÷7¯=qp®N\'dÀ¶\ÖG\ÇO+«(×¬^\â:`s¸°;\\L³vq—Ÿµ!\Ìm\"\Ûf\"s>½ÄšÁJ$÷?ù\n\ã“1\Z6Ö€¨ŠÆ‡.ñ\ÓW³ù`+›÷aËÃ¼òÖ¾\Ü¡¬®£\n…’œ\Z\ÕS	\áq:ğ™6\Ób\í’ù\Ürıeœ¾¢)¯ş’…\'¥Ñªı­|\ågÿ\ÅÀD†5\ë\Î\å\à\áƒá®\ÃÁhl¢\éOo½¸ô‚\Å\ë¾W©|ı—¯<ò¶Ö…geÀÃŸ¾\Íù™û¿“”\Ô\×\×#„ñ%éŸ³µÀ\éô°x\Õ\Ù4.=¢\Ò*şõwh\í\ê\ã¢Ó–s\Úò\é’3»>m½`\İ\âj+Jp8lT”£\è‚Á\ÑQ4M\å²õK¹lı2\Úû†h\î\êg2‘ÄŠ\ìW—„YTS\Ãn\ì\ßQ„B\Ğ\ï%\n¢i\æ\Ğù\Ñ	y=8¶<±Í”\Ôu:û‡\Zd\Å\Âytôòƒ{\å\Ø@”ş\é›,^y\ç%\ã\ì\ØüŒòòS¿sv=xñ[m4M\Ñşx[Ë“3f\Â?~ÿ¿°¾~©ı;¹û†±¡™7o^°®®EQ8p\à\0ƒƒƒ3\n‰”\Õp\Õ\rÿ\Æ9—„†¦\ÕE*ñø\ìÛµ™]³¢±²H¨@\âŒÔŒH\æW—	\Z‹8©D\ZU(¸œ4U#L’ \ÇE]E	«\ËXX]ASu9\å\á šª „‚\Û\á$R2vBh*šM\Å\í5nF÷¹AK$R\Z\Ë\Éx‚—¶\í\å\ç|–;x\Z]×‰„ü\Üú\Ã\ßğ\æÁ.®¸şs,_1Šª¢i\Z\åU¨®_Â­\Ïk\ãÑ±\êh\"‘ıöµÿô×§÷¼1½Gs\Â\Z\Üs\ã\×\ìw¾ø@c\×ğÀ\ÇzÇ†n®¨¨ô¯^½\n·\ÛMOOÛ¶m›1	«¨Y\ÈG?ó}Ê«…øLV\'“I¡©6\ìz•?üò«”ùm|û–rÑºh\Ö\áSüò;­‡€dõ,ñ‰„ñ5>al\ĞJ¤’L\Æb\èYÉ”Mš&(BÁ\é46(Š’+[(\àòÚùŒ\"˜ˆ%\è¦¥³—7÷fseE!\Î^³ˆs\×/c\ç¡6ş\íG¿#!\\\\÷\Ñ/³l\Íù\Ä8]>Sköny\åø\Õ×‘™\Ì\îK—müø»^\Í¾;Y—,=½$–NM\Æ\ì]\Ã}5\ÑTü\êh2±¸¼¼Ü¿r\åJ|>ccc¼ùæ›ŒŒŒL\É\ìòøùĞ§¾\Ëòµ\çJ%\Z!•Hbw:G\"\ì\ŞòO>t\'¶ô(Ÿ¼ú®=w=§#7¹3Zz¶`ò\Ç,\ÛlnÊ’y\Î´D\ÉdH˜D)ó	R\êL&’ô\Ğ50B\Ïğı\Ãc´õö\ã°Û©*	³´®†ók©)+f,\ã\Şg_\áwO¾‚\æ)\á‚w\ßÌ’\Õ\çb·\Û\Ùô\Ü\ï9\ã¢\ëq¹ó—vôò»;¾Hó¾-‰²@\Ñw¾ğ®üğs¿ÿ\á)M\ì´\ÉTü\Â7[ö~KJ½D—Rs8ö•«V)ójk\è\ê\êd\ï\Ş}ŒN½}]…µg\\ÁÂ¥§\çLùğ\à±\É(c\Ã}ŒuÑ¸\ä4š–ŸC°¨œ\'ú)·ış	\Ş:\Ô\Â\'¯¾„š\Òn»İy\Ë@#°vM[`-¨X\ã¤õF1\n22K, §o\Ã=ô\Ğ72\É\à\è8\íıCdt‰ª\n|n\Åa–\Õ\ÕpıEgR^\Ä\ít\à\ĞTúG\Çù\İS/ñ\à›\é zşZ6^ğAÁ†‡P„ §£¡şNª\æ-\Â\Ò\0°”õg½‡Ö½\ÎX*ñ\î?l~\îA\à”–,5›Ó¾7\ìõ?9\Z¸T\ÏfJ|>ŸSUz{{\é\îî¦««k\Æg\Ì\Ü\Ş\0KVŸƒ\İ\é)I\Ä\ãÄ£Q’ñ(;\ß|‚\ë/\'•J\Ñ\ßÛ‹\ËSÌ»?ğ6¿ø0\İú›÷\İ\Ée§­\äšs6°d^•y°\Û:Ê”×Œ)ûM\Í™T2C*2¶¾£\ã“tôğÀK›i\íbaM%‹j+Y\ÙTO\Ä\ï#ğQôòº‘Âºµ\ÎXıšŒ\'Ùº¿…_<ş¯\ï9L¸¬3.¾Æ¥g Ùœ&®|RZ\í#R2—\é\"\ËÖ\ÇKO\ßK\×\Ñ5ıÃœ\"\Ô{?ı>‘eS\ßø\à\ë6U\Ëşşş¢exxx\ÊT!)\ç\Òk>…\İ\î!%™ˆsô\È[H™¥~¡q,2\é4…Òª…T\Õ-§§·“MÛ·óú\îtöQV\Ä\çv!\Ì\íæ–«šg…¹V+Œk/ò\à“\í\î\Ã\ë°\Ñ\Ü\Ñ\Ã}}·\Ë\ÍW?ú^\Şuú\Z\Ö65°°ºœª\Ò0E~.»ü†\\\ãŸ­ZøñCOrÏ“/\Ñ\Ü3LÓª8û’ ºnªf\î„\Æs#`|´Ÿñ‘ŠŠkq{=\æ(°\Ùt\İOG\ë~{U¸t¨|ø™\ãl˜\áˆ|ñ]ÿPÿ«—{*›:]—2\ç?ªB‰I\Äh&›®Š¥ó—\Î-ÿ~@N\Òcc¼µ\éšVœC0\\)k–<\ç\ìy6\äX\Ë.vo}†®cûÈ¦¬mj\à’\r+X»°\ßCU$„¢˜[s&Ê€½­\íü\à¡gu².X»Œ.:‡M\Ë/aşŸ\ŞÎ¤G\ãJÀ_DVf\Ö^\Õ›Í­II-Š1¦4\ZÈ˜\Ìx;\Øğ\Õø`CÁ†|˜‹\æ:À\\ö\Ñ\Ï\0£Á\ì²-Á\Zˆe‘&%’\İ\ìfUw-]U¹>\"\"3»E\Ú.\Öª+»òeD\Æ\Û\âÅ‹\åÙ¿—ôe´\0\0\n\ÛIDATB¢˜\Ì\Ü\ßò?\×oğoo½\Ëıÿû4Z}¶º\Æ_¾ü5VOG¡)§Ë¤üxø\à\ï½ó\ï¼ü¥o\Ñ_[eum\reµò\íÿı9ÿø÷ß£\ß\ìü\ç\álò9–€~ô³ºõ\Ó\ï¾ö\Ú[w\Ş[\ã\Æ\Û\ç%7[Œ\Î÷OÏ®m]ş\ä—ÿúı·\ï\ÜøA§·j\ÔY	Yš’¥	ó£~P§\Ş\è–.¾µ\áP\Ğ¯r\î\Ò_°vú\"û»·ùİ7ù\Õ;ÿÁÿ]ÿ-7\×9\Õ\ërõ\É¼ô\ì6—·\ÎpùüY°¬\Ï=¹\Å¿ı\r\ã)½Vƒ³k«h\Ï\á\\¡O§Ü¼ÿ€_ü\æ&¿|\ï·wr\ã\Ã{´»k<÷â—¹ô\Ôlm?O­\ævT:\'À„¶U\åİ•ö\0…\ä)I´ \Ï3›VE8{\ái\0g“gvş#ğÈ˜M·±k?üó/ş…/]É’À¢È³œ<Ë˜N†x^°\Ş22qò/nj\Ó Å»¿ú9O\\y‰\íg_\â\Òö|öo¿Î‡·Í‡\ï¿Å½ƒ=nü÷»ü\ä7©iÅ™µ.9\Åö¹\Ó\\\Ú\Ü0\Õbú\rˆ8³%\ì\Ç\ì<4\çY\Ü\Ş\İ\'\ÍAûM‚f³[/ò•¿ù&g·e~4\æ\ÎÍ·y¢öYÛŠ1Pb7oPh„›}K’\Ø$·\Îr´6«²ƒ°\Öy\Õú\İ\×ú¯¼ş\êN\ÙT?\Z\r=	\âr)(K\Ñ\ÂkQM	m+ô¥\'ƒu!-\Z¹\äw¸\Ú\ê!\Ğ\í¯sõ\Ú\ç¹úüH\ãˆ÷?`\ç£L\'÷\ïñ\æ­}\Şx\çó\ÇÇ¿”òh¶{´:«t{›œ»r…nƒ3\çŸ\áÔ™\'\Âf!³\é!i\â\ÒZ#)e¯S¬\\µ\Í0}@nÖµš\Íˆ\Úóh¶ûLÇƒKü	\Ë=«°4J\ÓXJLœ¡\Ş\è\àp4¸F`¤u1›Á•V˜¦\Î¿_ğıó¯rş\âsL§|t\ë\×l»L’,H“˜\"-\"P\ìÀ,º:<xÀp\ï./üõWñƒZ-°¸†ğ®O™N†4š¢n(‰_idñ\ŞZk‚ Yb…¦\äY\Æ|6›`Xši–™`P^.Cq1z\íy\Ôü hˆûİµ\İü“ñ€vgO—\Ë‹\ï\×4u|°\Ç\è`Ÿ+\×ş\ÎÜªŒDMù\Î}5\ä\"vh´:‘\n\r´\ÕŠ,KPJS:	U0\å¹şX¼Z@£\ÙE¡\ÈEÈyU\Âl:\"K<¥Ç¯¼ş\ê\ã3\×=–R€E\Z\İ\Æ\ÃÁ¸\ÚSh\í‘&	\ÑlB¥ƒ 8{M)«\ÏB\áu\ã\Ê)eÑdš/CdQf1UoeÓ–\çÌ€-½\Ú\Ó\Ûz\âxNPo˜º®SyN„­J8P\âCi]1Œ6ó\Í\æA\És“²Ü¾\çÁÀt•\ë\İşÒ«\ç–fÀÍ½»{À,Z\Ì\Ì\Ê…\Æm5¢y…¨ªp\Õ…—<§\×\ß0fˆü\ëõˆ-¦8“¦,-)¨šBPL\ÇZõ\Ê\ïFš‹E[Nº+ÿDŠ÷/G\æ•0H\æz\ç\Ş\0¬4»wY–f@¿\ÙY5‘$\Ó\ÑÀ\Ñ~Z\í>GS3xs\Öq‚€ \Ôü:\n\ë\ÚI)a†!\n¡\Ù\ê\Í\ÆØ‡-87Qƒ²\Ä*\ìv(”yÄ´}3.0§\İ\ËFI\à“\ÆÈ´\Ë\Ã-hw\ï\î\êAŒ\0ŒŒUn…¥û€¥pm\ë™q+l<L¢wr”§PZ\Ö[\äYF–&\Å{‚!P„4\Û-@PJ1>\Ü#—NH´¡£²\Ï+š­>óùQ¥<G¤Š¹@\nsT•\í\ã3w\Ğ\æ^§·N¼°›-s\Üı \Ú\íX\æ\Ñj9KS<32È§‹\Ù–„¥ğòög†Z©\İ8š3\Ü1Ò¯µ\Æój\Ôü\0gK]“}\ßg\ã\Ì&\Ív\íy4š=r\Ép\Ç8¢‰¸¶\êÂ‚\ä’q4©pK;m	fÿ5Œ«J±¿9|q¾=„-P$qÁS¥55¿F½\Ñ\ä\Ô\é\r»“¦j¾x‡Wsq%\ì~°7O¢?¿	ºz\î©ñ\"‰¯\Ç\Ñ<\î\İC®¡•\ÂóC$\ÏÉ’òt\İZ\Íge}\ßh4›t{}‚z“\Å|‚\äÆƒQ–*F\åÁ\í\İŒ¶a8ª_ş=Iœ8š\á‡M‹\á>\Ç5L¡¨y>Yš-¯\êkµ\Ût{]\Â0¤¿ºR:\Øú\Ä8	óÙˆ…}·»KO\Ò/Í€õv?N²d\'\Ë\Òôp°CšE(­Q9%+\ËSr1\ÑS¥+\ëk´\Úm\Û\á*\æ³A\Ø`~4Áf„RÓË·\ép5~P\'I\Üb°“šP\Åd²O»³ò±;\â4\ÂöIµ N\Øl‘¥qi¾\Äd÷pû\Ú\İ.\ín§p0N‚B19\Æ½F{ï¯x\îO;Xš_üñwxj\ã\ÂCO\ëtt°\Çb>C)“7 \æ\×	C“®A\Ğ\év\Ğv#\Ä\ÑdB-\ëf?¯›øV\Ö=5x”¦£`@\Ø ¶’\êLLñ}Œ8b£\Ö\'˜Á\×V/¦Í§c’\Ê\æ!\"’81\ìUB¯\ß\Ç\Ê\Ìx…6&£‡$IŒ§õl³»ºôÚ¡¥\0ğòöµ÷*†D‹9(Áó}´W#ŠH\Ó¥<ú+\æ\è‘2¹¥\Ù\×%a‘\ÔŒ&TÍ†d*3\Æ\È\íb\àc¾}\Ç	~Ò›©¢8M<¦i†\åy\Îl>³øŠ°\Òj51T^”2üd|@š\ÆxZ/o^\\j6>!Ş¼°+°7Ø»\Ë|6F‰É»!_Gò”°6\ê(e$\Úa\áˆ\Û\éŸbt¸‡‹‰P\àºş°}@\ÓÆ€*®`aª¦\èÄµ<\æú‘\à4Î˜I%\ÊÖ¥hu{hOs4=$(¥Íœ3Šñ\á>i\åIš\Şz~ë™¥w\Í\"lo\\¸Ÿ\å\Ùİ£\ÉI4\Úó\Ğ\Ú#Ibò<#Cj¾ñóÁxY^\ÚüNw\éh€³\è¦ó\åX§\ç|}­4¹˜ûqƒ¡G]—>ş\ãpH/\"¤qB–\ÛÜ“J‚€ \Íòx1\Ó\Ñi§GñüN+h~:&\è•\×_M\ëA8\ÍÒ„n\"?„f³K/\ë!\Å LÌ„}!|\nz+L\Ç#e\Ç\èc‰oJ\æ\Æ\Ñ	\í~$MK·“\à\Ç\ã0Œ/Ÿ \ËR„\Üj4›\Ê]I¼`|¸ˆ\äJy‹Wş\áK/\ÎúD\0xfó\Ò{\0û\î€2ñr\Ğ\Ô[]&£}jA`¥Úµ\ÖZfku×˜Œö­\Ëi\îƒ2qx÷Ÿ„a“,1k‚Šö?\Òòœ”ny\ä\å	>PòQ\ÈÒŒ¢¯1³B£LI1Ÿñ´N·7\Îÿùlzô\í;\0wnM\Õ\n¯\æQov˜‡Å²A6ù“\Ó\ßX\Ì&#šª^\î\ÄB¥\Ìa}\"ö˜@˜Hn]WW6Œ†»ôV7\ÍóE\İR!^y§¨M™\Ø\ë±s\áª¯V³3`\Ê\Ä<M´8bl\Â1\é³\çüt0O×\éı{7#ß\Ğj¯2\íc›ƒ[\Íø!Å®	 ©7:\Äñ¬22®†œmfó1\"™­Ë€¸•¸Š,Km\ÂMy\Ì\'·Ø–ª÷)‹,1³,E+…\ï‡Å½$9š‚>}úSÖ€\ë÷·G\Ã=³©•\ê\Z\Ş\ZG“¡±„Q9a\à\Ò>¿?§\Şh3›\â|tœ\Ê\ã¤Ü”•‡R6 fgâª®£R\Î\ÕM\Ñ\Ú;`:pW®R®©¦Œ,MÉ²\Ä\ÎWql¶#1‚`K\"\ÏRrÉ¬©5&1‹ù‰·VN\"üK@\é•Ñ·_Š\0\0\0\0IEND®B`‚','image/png','marie.png','Anna','','',0,0),(3,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0e\0\0\0€\0\0\0õ§ş\0\0 \0IDATx^´½wœG™ÿÿ®¸³³3›£´\Ò\å,[²,Kr”ÁŒ±IÆ˜l8ø\ã\Æp\ÇÁp†3gc0>6\ÎF¶œdK²²•v¥MÚ¼;»³“gzº~Tw\ÏH€,sü}Mê®ª~\êù<©B÷\nş 5W\\\×>3\Ôó¹Lb\êó\Ú\ç±p\Ñ\"’©\Ñ\è$©TŠ‚”ù<©t\Z¯®±¸³·]~	¿yü\Æ&¢\\¼~\r5•at\'ñá›®\ã7<Á[.\ÜÀ\à\è\ßù\Ù}\\v\Ş\Z®½\ì\"©4?ú\å³vùx\ì6Ÿ¿%ó;xú…Wùü‡\ŞK*“\á\æOÿ\Ëvò\Ù¾›\ß>ú;bqg\ÇúO0<6Á­\×_[wñ\È\ÓÏ²\ï\ĞQb\É\åÁºÛ¦	\ê\ë\ê	W„fÏ¾\İ$“i\Â\Ím\×Í»ô†‡ó\Å÷\æ\ŞH&o†\\oT\à\ÍĞ­÷¾ \å\Æú—¥&†o\Ï%g\ŞV[W\ï_ºx	‰D’‘±2\Ù†Y`j*Š.Û¸÷]w5\ïºö­‚\0}ƒ\Ã4\Ö\Õğö\Ë7±l~;c“Q\Zkk(/PW]E0\àg\×şC\Ô\×U³°cF¡Àkû\Ñ78Âª\Åó\é\Å\ãv3·¥‰û\Ñ\ÜP‹\ß\ï\ãpw\áòr\Ö,_B]M%\ç¬\\Â…\çœ\Å+»€”l¾`=Kæ·³a\ÍjV-YD:•\âP\×1t—K‰)ğ	‡)”›\"Ÿ›š\î\İğÁ/ô¿ş§?\Ş@<gLWP´øTGjbø\ä\ÓWtv\Î-\\¸ˆ\èô\Ñ\è$†aL&H\ÎL³n\åR>÷‘[¸r\Ó´¶4£\ë.ö>\Êğ\è8W]¼‘\î\ŞZ›‰\'R¬X4}‡»\è=1\Äü¶V¼#Q<ºª*^\Û`Y€ı‡»X\Ô1—\Ú\Ê>¯—¥\í\ì8pŸ\×\Í\à\è8g/[D8TK\Ó\è\Zaù‚y!xv\ÛNV-]\È\Ú‹Ñ„@s¹¨©ªd\ÍÊ¥\Ëü¼²cš¦cJ“x<N&“%	SW[Gtj²>6>¼(51:¸ñ¶/;ğ\Ì\Ì7’Ñ™öFÎ”®¿óPjzü6#“\\:g\Î\Ü@G\Ç<r\Ù©d£`2==MĞ«ó©¼›o}\áXº`^U\á\n^Şµ—T:\Í\æ\Ö3=\ç?\î}€‰©i†\Ç\Øòò2\ÙX¾ “\ÚH%‡»{xú¥WY\Ø>—š\êJFÆ¸d\Ã9\ÔD*hn¬§¹®†H(Ä–—w\Ğ>»…M\ë\Öpl`\î\ŞòyƒT:C]MW]´—\Ğ\0$\à÷ù¸éš·ò·_E&$›É\Ëå™¦¯¯Ÿd2Å¢…‹µ²@\Ù\ÊhÿÑ¯wmùı\Ú\Ş÷ò\é…t†ôw±”+?ım\íõ?üü\Ùxô\ÓM\r\Í5ó\æ\Íct|Œ\é©)rù<\Ó\Ñ(-õ5\Üñ\ÙO²şì•¸t\á\ÔV\ßü>»{\ØõúaÖ­\\Š\×\ã\æ\Ş?<AS}\r¹|—w\ícÅ¢y”——‡ˆT”ó\ê¾\ì;\ÜÍª\Å¨­ª\äxÿ \ëV-£±¶†Šò2Z›ñz=lÛµ—úš*Z[\Zyt\ËKhš`\Å\Ây¤2\æ¶4S©°8 B¹[\Ğ\ÑF¸<È¶]»q\én4MCJI.—\Å\ïóS][\Ãdt¢&=3\Õ0~d\Ïö\ÆÖ\èpo7ÿú?[Êš+Ş¦õ¼ü\è\ÕF&ı\å\ê\ê\ê\Ú%K“H&H&\âf\ÔLœ¥müøÎ¯° ³\rM×‹„D\0eŸ|ß\ÔWW±m\×>\\.\êH\Çú‰\Æb˜f\î\ŞlÛµ\'_x‰ªHC#L\Å\âô²~õrš\êkH¦’TWE@:¡}v3Kæµ±ûõ#L“\á!|%\Ü\Êp-u/ …)Kxøü>\Ş~\å¥|\ä\æ\ëI\Ì\Ä\È\æ²\0¸\İ:.·‹º\Ú:–.Z¢É‚±:=9ú\å\Ô\Ôø\Â\İ÷\âÿI®ÿ§\Ê\0\åm¹™©[u—¨_0!Bfff@’ñsZ\ZøÌ‡\ßOE¨$i\×Î§\ê³,\à\ç½o«rkB\ã’õ\ç`Ár\Z“\È|m»÷!c“Ô—ûAJF‡ğ¦\ãl˜7O:I÷¡Cä§£<µõEº{ú¹t\Ã:\â\É$±x‚ÊŠ\nf77\âv\ëhB8\\\ÙR.\Ì> ¬\×U—\\\ÄMW_A:§P0(L„—¦\Ñ\Ü<‹¶9sk\Íl\ê’|&ñı­\ßû\ì\â\İû·»²¿\Ù}½\ë\á…\Ê\á=/|Q ¯]4¯¡¡ñ‰	\Ò\é4\éT\nM˜\ÜùùO\Ñ1gN÷ª\Ã¤”!Ò†Hğù˜\ÓÜˆ†É‚\ÙMTù\İTú\\\ì:\ÚCm0@m™\í»8{nmuUl?Òƒ”&kÛ›©-÷\ãwÁc/\îÀc\Z¤RI&\Ç\ÆY=»t:K8TNE(\Ä\â\Î6¿\ÃN\ÑY©#\ÅW)0.\İÅ‚\Î6dÁdû®}x¼^2\Ù,©d—®,\Æ\ãõ\'\'\Ç[‘4\Î\ßz\âÈıÍ ıúhÏ¡¯™Fş]ş¹sÛ˜šf:6Q(I\'ù\Ä{o\äÜ³V¢B¨°€Põ…\Õc!¢T2…z.7—F\Ï&¨ú‰”ù‰\Î$‰%Ó¬h›\Å\Ş\ãœ»¨ƒ¦š\å~?‡†Y\Ù\Ñ\ÊHt† \ßË³{cLVu´’\Éeio¨!\àq\ã)\ä˜\×XC\Ğ\ëÍ¥^©XL8U[=nK\æw\Ò\İ\ÛKw\ß\0>¯|Á ŸÁ\Èç©­­Cš\Í\Õ3:Ğ³—¿ş&P\Î}\Ç{µø@\ïG33\ÑO´Îš]6o\Ş|¦¦¦˜ŠF\Ôñ\ì¥y\ßõ\×\âóz¬¾\n§Ïª‹* Ji$Md:ñ(dS\Ã@‰\Ü.M\ÕzFÆ¹d\Õb±°µ]Ó˜U[EAJj+B<ü\Ên\Ê~NLL\'Ø¸¤“†\Ê0>N™\ÏCÀ\çE—òY\ÈeÀ” »•Ë²“\âd+a—\ËEks;÷\ì%–J\á\Ö\İ\Ù|L&CSS3‰D<83=™_¼\éš\Ã}^û\"<-½\é˜rÙ‡¿\èKOMŞ˜š\Z½®¦¶6\Ğ\Ñ\ÑÁ\è\Ø(“\ÑI\nHò\Ùº”\Üz\ãu„Ê‚\ni\Ç\r«¯\Å>+Á9\ä\ä(\"6‰0ri‚J@V¹†ª¼b#·‹\Ík—“3\îyòE’™,W®YF8\èg*‘bWW\ç.jG »\\T”ùKhV\Úk1a\ä!>…œƒ\\ÖŠu\Â\á«È§Dsü«JJ\æ\Ím\å³ù\0…\\†l.‡j`\é\Òuòùs\Û\Û\ĞW\íÛ¶ò\Öû^\ä\ÍÒ›¥oû3scİ·ºu}é¼N¼^†a(M“\é™i6¬]É¼¶9\'	\ß\0°|¶©¾\år\È\Ø$\ä3*¾+\0¦¥Á)¸\İ.0·¡€CıC<¼m7\0.Môy\é\Z¥³¹¹\rµHû\êRZ\ßK_ª]‘\Ë\Â\Ì$2“)-X¬O	B*k.\é¦¬X´\Ë/\ØÀTt’B¡€iš”‡Ê©¨¨ (Ã¥¹| —¤£c\Ş$½iPt¯ÿf\Ó\Èuv´w\èer†‡†\Éfs€ ›\Ë\áó¸¹\á\ê+-KG\ÊR\â\Æ\ÖJr9eù¬òH\ìl\Ùh)¬V[.M ,÷w w\ÉxŸ\ÇÃ¼–z\nI\È\ïgó\ÙKñ{\ÜX’\Å	\rBÛ–\êš9˜‰*‹±ü˜j\ß2g\Ü\"”­H\Ğ\\\Z7_ûV\æ\Ïme&>C6eb|œññq\Ünn·®kšvv×“¿©\çMÒ›eó§\ïlLŒ^G\ê\É\å2‚t\İ\r@:•bı\ê\å47\Ôa›ºm6I\ë¦	‰YeDR\ÚÂªe¹§ª°ü»Jm8H[c\r¦”˜¦Dh‚õ‹;Y\Ö\Ö<º®\ìè…°”„’Á¡ú”0\re1FNyN\ë„\ÄV(U\\Øµ¤¤¡®†›®¹’‚a`\\B\Ã\ív\ãv»i¨o$—J5\Æ{6ğ&\éM2\İßµZh\Ú\ÂÙ³Z)/‰D\n¦¡„-%\ë×¬\"\à÷;B•E’€L\'‘¹T	8q\Ç)H+\Ò\nA1)@ğyy\ç\Æ5T”©k		•\åe\\¹v\Ê\í)ñ\Ù\ÂT\Ö\â\ä|Å‹I+û“ÂŠ31¤i%„P½P\0K,œĞ„`\ÃÚ³X³|	±\é\Ù|©\Ø4‰D‚Ù³gS6\çR±›¯ù\â÷\ZytÆ ¼ÿ\î\'´Ñƒ;–ú|`8\\”’\èT”É©(\Ò(L$homf\ãÚ³­¬ª\ÄR„\ã\Ğ#H%¦c „ò\ß%VX®N…‹\ÄvGõUa>p\éF¼n7v4ùU`G:µ8uˆ(­?“Bñ°5ª•Ù¤R«¦Ä¶P‡EV\æX\æ÷ñ‘÷Ü€’L&‹\×\ë#*/g\á‚E>]ˆKºŸı\İ%¼	:cP&¬p–\ß <X\Ğn—¦!D<\Î%\×\ã÷z±UÛ†ERª˜R¥£F\ÎQ\Ø\"Å˜XnFi§–\ÜJ i®©¤\Ü\ïA\ØqŠb””V‚†@š²Ä’’@\"R3\È|¾\ä:Â©m±£@\n\à\ÙM\rlZ¿–D2\É\ÌLŒÑ±Q\n…\å¡r¼>?©‰\Ñú[~ö”\Î\Òƒrüù?t\ÊB~iMu-^ŸiB*™\Â\Èd³Y*#!.¿\à¼¥SB¶@Á²\Öü‘ƒ”\åÄ‹¢´‚±‚p\0,%a–(°,¾lÍ·\Ş\íÄ x\Ó:kZö#‚‰H%@J\'¹p“684)[\×y\Ûå›¨\n1ŒÓ±†‡‡ñz¼x=4~\é\äñƒÕœ!(\ç¿\çvO!Ÿ[\\0ò––\Édˆ\Åb˜H2™»†²€\r\Âv²˜\âZ@™¦‰ÌKl ¥´Dh‰I\Ú/Õ†¬4U\Ë8>\ß.\'J´\Ú\æ\Ã¾„°N\Ø\îVñ`ªøbŠ6\âğ«\Æ\\R*8í£s\ç°l\á<2©\ÉL<N2•\Ä\0„£=Cœ!(ñ¡\ã>iš—û}\ÊPyLÅ¦0\n¤MH–/œ\îrQtYŠy[‰-}Si°´\Æ(vO--–X\Z\éh§u\Ö\ÙNQm\ÚR¶²\êcˆİ¼\nñÅ«\Ùm«$§¸M4\Èg†raN6fóc½4Q<\àóx¸p\İ\Ù$\ÓI¤”¸t—šL-a\äs\á\ÑC»j9C:#P¤”š”¦\Ï\ív\ëBS\Ï0ò\Ø*.\Ò\Ú\ÒXêš’\Î`\ËKB&•\Öµ˜¢¦\"¥\ã*œ\Æ,­W¨©\ã\Â>o©±\ë©\Ã%ñDp\Æ\ëB`ûB¥8¢Ä’„b\Ü41sY§›%Ç­R\ì›fıÚ°f5¯‡B.\×ë§¡¾p8fÁSÈ¥ƒ\ïÿé“œ	(º\×gjšË°3(\Óé’TYÀO$¤¬SX~E€\n¢¥dšj\ŞÉ©«9\à\Ø%e\É;òTá‚\ÂJ„\ã\ï9U¨\Ê\äŠ \Ê\Ò\ãXe•¥\n\'\ç]¹J)$\"“*6i[/›a!•û3Q}u{\Ü,hŸK&›%›I“Ng…\ÊQ\é\rU=²ÿ\Õ3\ZİŸ(ùT²:5=>+‰8A¦i:3Í‚reµ,€\ê¨D¹„‚aµa‚0q*\Ù\î\ëd·dYoµ\Şjº$xc	Ì’¹C\Â\æÁ)«Z6h6I‹H™\Ï!ó9 $´\Í\ßj¿´¿\0+\Ï\'—\Ïa†G‡\Ñu7áŠˆ/=5~ñØ‘]•œ(\Ò4ßªkz}mm-BB\"‘ ›\ÎXy‹ ‘\Î‹\'Ï”öS”¤±RM§H\ÃQ^\ÔMh%dp\\‹\İvVêœ´®\èO‰E\ÒbFZh* ¤5²Ë”\"‚šªj])\ä\äÉ´\È\"u55FÓ”¤\Óif\â3ÌšÕ‚YÈµû\ÃUK9zCP\Ş÷“z|¤Y8®®ªª\"ŸW›„¦¡Yñ%›Ë“H$,­.Š\ÎVRLr¥Û£T\ìPAÜ‚\Ò\\[Vkò$ReDñZ%M;vˆw»(¶\ëğ\æ|Xí‹’\Ï|\nld\É\ÌuqY§uÕ•LÍ¥Q	\ãr¹‡Ã¸İú\ä\Äh\'g@o\Êô‰®Z)\äú@ €\Ï\ç\Ã\ív\Ó\Ø\ØHMu5n·Z‹\È\æò\ÄI\â\ä€(l¥—P0ùL±\ß%²k(•\ÃV>õY„’\ë\ÉñC:¢/m¬$N	,#¬öU{–§\Â	*Nı\" ‘\ËP]:}³eñªD*A\Ó4Ñ„FE¨İ¥\ã\Ñu²‰\é3J‹\ßp”™«\Ôp\éº[\Ç\åRi\Şøø8Ó±©8—\Ë3“RA\Ñ\îO\é\'5‚—&Jk-ŠS\Õ\"\"¥©q‰Œ¬zV¤B½4\Ís&NùCN{62%Eèª‚@Ab\æs_\à¤bvY\à$\ë\Â\åRbNM\ár\ëx\İ^\Ü±©1k—\Æ\éé´–r\ËÏ\Ôw¿\Ø)e!\äóú\0ˆF£LMM©A ¼/\İ\Ç{uY\"L‡\Ò)„½ª‡ˆ<Y˜¶¨N\Ë?\ËŞ”’Ë’\ïNil“(¶QR\Î:b\'¶0.-lJšwH !›S\ÉOE m>\ì>\ï\Ø{\0Çƒ†²–ññ	\\ºNy0ˆKsµ¯»ö=oWNÊ®{ÿ­:¿F×´`c}RJfff\Ö–“\ĞtSSLd\É@Ì\Ø2`\ä)ZE±\Îo8)@+)YñEÀ\Î\Ì*ÍÆ®{«°¥\0rŠ\nûÃg¦•9*^„‘W#|§5\é(Dqrù<‡º\ãóz-KY(\ÍfhlhB \×Mõ]{\å?\Ü\é\ã4tZP\Üe\á\Õù\\f}K\Ë,O8&™L’\Ï\çqi.t]Ç­\ëh\Ü.\ãC˜FÁ\êµm\rV Ï¥Á4\í8n½Yb”\nˆSw(A\Ù\êˆ\Ê\ĞÀiÃ‰\"\ÖõNR\ç¸j\Ëô\Îz\nN#EË`x‰(\ÆB)AšN9\Ø\ÊbG\ì°À\Ş\×“Jeñz¼Šl&CSSÁ²²4rWM\İ{\Ú\Ôø´1%ŸN¬Á”­³g·\"\äóyjkkq»\İ\èºN\"‘ :=…Kw\Ñ?8L:›\Åom\İ\Ñ$˜v\ÇrYœ™\"[VO„#|•\â:XI\é\\YL1ş8eƒhµiw\à(õ‡Â²³RpD<[W?¶´\Å\r2—F3 \Ô^;\×J®ıÒ]x¼Ş¢BA$¡¦¦—K\'ª\Ğf†GkcC=»¥MË‚D³JE\"ª««	…B$“I¢\Ñ(†a\àr\édóyN8|¶{…\"oM\É\0¦\Ê\Ò\Î[\Ç-­³)Eµiód7o½l±ñ/\æ]\Ò9\ç4FI;Â©e\Õ+)&[*2eš\È\\–b\æe·¡Z›œd÷\×)+\Ø-!¥$ŸÏ£i\Z¨®ª\Æ\Ìg¾HõigŒOŠ®{Sv7m*\nŒ119AÁ4\ÕY.—‹\á\0„”,M“F™\Ï\â\Ä\äI\Ú\ì¸û´jú¢¤\ÃR\n\ËÇ—pbƒ#K~\Ú2.±©šT^¡dlÿVoÎµ\íIQÀ¤Ã·0MÈ¦‹Š\ä”Qu\é¦op\ÌY\Z·)\Ó\Û\×G2¢ªª\Z`¡\æ\Ò\×q\Z:-(¶·7F\0LNNš¢ ¥#g#o\nøY2¿S‰\ÛrRJk®\ËŞ•b·,œ\Ñ8›²\Ä`	¿hpv¼\0\Âö\Ë\Ğ)A\n`K\ĞN[%õ±0%\ßK\ÈIdœ\ëH\Èå…‚rq…™Œ/\ïØ£”T”¦ùª?©TŠ¡\á!2™´j¹`9\r6¦H0\0²Ù¬\Úd—H0>9Q2!©Je2i®¼hujvº(X‰\ÈÚ³Âza»5½¢&85kO–°),\éZBR)N…bDi\rmö,0E©Ä¥Õ–uN—óQ\ã‹o\\\ÍP€0\ÕX\ËÈË­\Êc‚Ôˆ\ÆblÙ¶²`\ĞI\ã¥ı.\Ôg&“%“\Í\"M\×g8\r\ÖR\n¹\ìˆbV¡=2:¢\Ò^Š7\åe~.?ÿ<Üº\Ø\ã©¦\'ò§×¥\Z²lb—+\Ğ*\nRs§V”\ë(&\ÅöJ_ñj©¶İ¶Õ\Ğl•/^Q\áUÂ«¥(RJd:…´\ÇCR‰\ïOo!™J««!{Š\ã\"Z0\rã´şô\ÙW&•R\íV™˜˜ Ÿ\Ï]V,\ãšK. c\ÎlG©K™M3“Hñ\ÊŞƒlİ±‡Œ‘G\Zg-\Ï\âö9\ÌmjÀ¥¹\Z\Åğ•€\ã\ï¥-~u\Â´–b\ì³¾\ÛM@ig¨?\reaf¡€	?1\Ìtl†¡²¹<AsM5‘p9·›y­Mh)‰«¢\nM€\íóe˜pYŒ8!òyô»¼¾NC§E“Ê”b±8ºÛ\ãgQ)ªaÈ‚ÁWoÆ£\ë¶.bš&G÷òøOó\ïÿyÃ““%­ZVDÊƒ´\Ïn¦µ±5K°¬³\r¿\ÏKCM%\Íu5¸„½\Õ\ÙRcµ\"å€§ø°[S–hû{eA\ê¸#(¦4I¤\ÒG›\à@\×q\Ùú2\İƒ\êšÿœ\Ö,YÀÿ\áãœ¿a=eeA’·\\t>?ÿõ\ï\Èf²øüönş\":¤\Ô_bü\èWşJóÀ¢»SÆ²¹l­=ùX\ê*2™ó\Û\ç\ĞXW‹‰DXBzş\å|\é\Îe\çı\n§ŞŸY\ìôT<Á‡\Ùq\à0¿}\ê9\"¡r\Ê\Ëü\Ìn¨\çK·¾¯\ÛMeEˆ…í­ª^iª\åôY=mU„,\0\nfI}\á\\º‹‡\Ù\Êñ\Ã&O:–u&ô\êşC|ğ³ÿ\Ä\Ç>ğ>u\Ûûñù¼ø¼^.¿\à<|b^Ÿ\Ï	ö*3-ò§¦\nObş/\ÒiAINN i\Óñ™XmY0ˆ\ã\n¤rj\Ã\ÄZ@]&Hò\àş\ÈO\îù²\É$\ï¿d£µÁZ•ˆ§\Ò<·\ï Ç†\Ç0ş,˜š‰35§xŒ\ã»Ü´y\Ñ\ØŸ~÷;hª­AwYÁ·J\0)~Qe„e)É±Á!Ü¶ƒÁ±qİ¾‡¿Fš„\Ê\ÔV”³¸µ…\Î\æ\Z+#ø<n’L\Î\à\åƒG¹ÿş\Èd2|\áö\àózY·zO<÷‚£´\'\Ï\í)æ„”hšf\nq\ÚP~zPj:—MO?x\"›Í¨u\0©ºh¢V5$:ÚJ\Ùûú!’±¾ü\îwP\çu)·2?;I¸z\İjØ¹—#\'†\é\ZapbŠôI\ë,Šz‡¹\ïÑ§Y\Ü6‡Ÿ=ô\ïºróZgq’9\ØZgY„”%®ªD#syƒW÷D\×4^;xôÏ®\å\Ò4\"Á2BS=+;æ°¨µ™ªò .\ÍN0¤\Óê¥«–14å—v²\åÙ­\\¼\éB:\Ûf\ÓXW\Ë\àd\ç”U_‹\å\\.‡\Ë˜ñW\Õg8z\äT6:-(¡†\Ö\Ìtß‘\é|:_¢u*\Î¤ ,\Ã\ïSh–,˜\ÇÚ•\Ë!›!9>\ÊÌ‰~Œ™„ò\ÓBY\×Ü†:n»r‰T†‰xœ™dš\î¡Q†&\'\Ù\Õ\ÕG\ÆÈ_\éd‚\Ã\Ç{81:N\ç\ìY–ĞµR/\è|\Øx‰’TŒ;>0L.\á²U\Ë\0‰\Ûå¢¥º’\êŠMU¼7u‘0\á`\0]s%\Ó5€ãº­CM5U|xó&\nA?\Ò0‡B,œ\×Î±-/9 8¡\ãuM\ÂtiÿKqyıH!i\ï\×(*H“HEˆ€_M+H	\å\åJƒuŠ² ¡\æV¦{º™:Al:¦~¬v\\ºN]$Bm$BGK#H\É-—«NhB\àó¸\Ğ\è\Íó;q\é®\âÅ­µ\è¬5\áE‰€\Ï\ç\å_ş\á6f&&™81„Y(\Î@*«/u}™¼	\Ø«8\×ô\é:^=P†\'!PU¿²\Z—\×B)\ê\Ú\Ëø\ßÇ·PJ\nHkd&F*Q95\Ğõ·§\ÄBJ\ÒrYÍšU\Ö\"ˆ’H$±JŠr\É\å\r¢±ŒF˜ «»Gekªeì¤ T\á±\ê\r‚>aŸ—9Mõxg’\Ô[·Uƒ,º.iÙ­PS\íÅ¶Š\Z­\Ê	&f\âtN±\çHc3IR¹¼£ùª\æÔ“N]œ‘{Keˆ\Ö9³\èl©§yá‚¢~X\åM`Vc…‚qR2T:\á\é\Ö=¤\æ\èÀ_¡7Xy(W!(úqëŒ¦OeˆN\ÇŠ\'Sœe\ï¡.ö>J6gPYbÕ¢ù,]\ĞI\Ø— 9=M.£no3¥\åb\nyb3	\â\ÙMd@\×Œ§y\éŸ :\\Ák—\Ñ\ŞX‡®hV†,\É—¥4\Â\ÒNy£@\×\à(Om\Û\ÃÀ\Ä³j#´46	§©ğº\Ñ]:^ŸÚŠrœ5¥ÑšKG+d\Ñ\İ:†I,™bW\ï0[<‰\ïñgY\Ø1—sV,¡¡¶\Z¯×ƒ@\ĞÒ nE1C\r$ms•€”dsY\\\ŞÀ´¿¢2G÷1ş\Zı(~ô\ë\Í\ÙT¬R\0‰™MJI>—\Ãc™ª 5\Ç\íb\ßá£œwö*úGxğ‰g› }ö,®¹\ä\"\Z\ë\ëinª\'™J112Š™Ë’\Ñ4´`Q ‘H“Lg0\Ã}=9BeEóW/c…/€¯Ìpiô\ëco\ß¿x\ì96¯[\Í\Ù\æ\Ğ3<\Ê\È\Ô4#\Ñ\ÉlŸÛ…¦iD\ÊüDBe´\Ö\Õğ\Ú\Ñ^İ¶›\Öp9×¯]NsC=\r\r\è~?\É\\®5Csi\nM#\à÷!\Ì£İ‡°¬>¯‡•s\ØxÁùL$R\ê\î¡÷\Äÿq\ïoYº “«7m\Ä(Ÿœ\Â\ïó«“vš-Rš\Äb3¤2)<\åUC\ákªÏwVÀWVıÓ¾<TŠ£ú«¯ûPe÷KO| ½¡Í²O†+**ƒÁ`e]]-‘H\åI®<›Ë² ­•×­aû¾\×i¬«\áÊ‹6RW[/\àG\nAÿ\àzşe\Æ\Æ\'œ\ÑRhòF£``[·<Ë•ø\ê‡\ßÇ—o\"3=<¢Ü”ŸŒ±¥g\ÏK._ ¡*Lk]5^·\îhe2›ehrš¡‰)ff’\\º •eK—W\âòú(¯Š€\Ë\ÅSÛ¶³}ÿaGv\0H5\Û\İ\İu”\ç¶ü	[u—‹\r«Wğ\Ï_ú--\ÍhB£`ôœ\â¡\'Ÿehl\Ü\ÚR”ad|\Âz*…m$’XL\í\Ä\Ï\æ³\Ì\Ì\Ä\'R\ÉtkŠKJy XU÷§s/½w\Ço2\r\Ö\İÁ7~ÿwü\äÎ©Á\ã·\Ï\ÆBğµ\0\0 \0IDATinœ·tAgeCue¥KP9ú}>/F¡€\Ç\ë\Å\ív[\\.\é™»¦¼,À\'\Şwu\rM\è>569\Ö;À¯z˜±\ÉI\Z\Z›¨¯o\Ä,§,B3D6ƒW­`p|ÿ^š\ævª©\ç\ág£±º’:H\'\âù<š\0¿\ÇÍ±±(\Íõµ|ü\êMœ»¨“ù³\êio¬£½©¶\Æ:\În\à\ìys\É\æ\r²‰-\é$X×„\Ûç£¬\"DA\Óxn\çövõ1§­PE„P8By(„H\'Ğ¥I\×\î×˜¢\Ì\ã¡u\É\nR9ƒ\ç_\İÁ½ûX4¯ƒ\æ\Æµ…(\\AE(È–Wv2<6A2“vğµ‰D‚¡\á!²¹\Ññ	\ÒñD`ù¢ùUó\æÎ®œ\ÕX_)\Í\Âüá¾µ™D¬\ì\ê¯\ßóü\Ç]\Ğöüñ¾\Õ\ÓÃ½\×v\Îm\r~\çkÿÈªeK\Èf³Œñ\Ë\ß<Ä£[#›\Í0>6B}Cj…R1i\İÚ¶ }\Ê\Ä4Y(p\àhO=ûBÓ¹\ì²+X¾|eeAÆ¢\Ód\Óiú¶¿\ÈÔ€HR3\Ö\×WrÎ‡o\Ç[\Û\È\İ?úw\Şs?ó\æ´0\'\"“L\ÙW ©2„\ß\ã¶fpº°†a”\æ{¼h._°·\ß\Ç\î\Ã\İl\ß„M—\\Âš5k\Æ\È\ärLöÑ—‰‘K¦˜öÁ\ìYµ4.;‹s?ú9††yô\á\ßóÀ¯\î\å#Ÿı2?üö\×8g\ÕJ@\Ò9g6\Õ\á\nü^7;\Úy\à\nU \ë:¹\\Îš3\ÌŒ\"\Í\ï¿\é:>y\Ûû‰T¨\Äe\çı|\æ+wTv÷õ¾c\ï#÷ş/°]»\è\ãw\è]/<ºY¢ö†·]\Í\êeK81¨n.]<¿“\ï}\ã\Ë|\ì½\ï\Â4R\é4c##\ärY+CŒG\'\Ğ]ŸÇ‹\Ğt@`JˆM\Ç\É\är¬\\¹‚õ\ë\×QªÀ\å\Ò\ÈÇ§9±{;ñ\Ñ!+\0BltŒÚyT55SW[\Ã\'>ùT7\Í\âg=\Ş\â@,W0‰erø­õ\Íö¾\ÒÎ˜”o”HB.h2”M\ÓğZ·\á=·c7‹—,a\åÊ•¸\\.ün7\İ[§o\ÛVL#Obz‚l&…\Ç m\İF\Ê:\ç\Í\ãcŸø$\×\\ûv&¢Stu\'_0\0Û¥\á÷yùô­\ï\æ\×_E.—CJ‰=³É¦I&”y=ü\è[_\ãû\ßø\nMõ\rL\Ï\Ä\Zf\Õò\Å\Üp\í[\Ñ5\Ñ\Øõ\Âc›.úøº>~üp³\'P¾º\Â#´M\ç­\ãûwÿœ‡~”ŠŠ\nÖœµ’\Ş|»\å\İdrY~ñ\à\ïI¦SÄ¦§¨ª©E ğºİŒOF•¦\n¥µº\îâœ³VRU\áğñ>ff\â\êşHAŸ‡\ä\è †µ£]\n\Ç\ï\å\â›?Jmû|\Ün^Owıû¿r\ìÅ§ğ—•1¥\äN\Ö(5j#a¬œ\r\'••\Z\Î}Š*\Ê|¤\rƒ™dŠ`ÁPWƒu«—Ó¹l5^¯)%¡P¦¹s\é‰\Ç\È’\Ó1\\š‹ónx7g_u\r¾`\İå¢¯\ï8•e~ö\İ;¹øü\r\ØÙ§Iry¯\Ç\Ã\äÔ´\Zcù\Ô0$›\Í\"¥\Z¨~î£·qı\ÕW\Ò\Õ\Û\Ëİ¿¼ŸWv¼\ÆLl†kßº™+.¾€Ÿ\Şûk-–“k&z7\ê»_ªÎ¥Ró«\ë›5\Ã,°s\×.\îÿö?2“LòµÿŸûZ/?ø\æWù\Ø-ï¦»·\ç·\ï!™LQU%Á^¯©\éi\â\É…B\Í\Z\×\è.…\ím\ÔUW“O%(„B*;jh\ä\ì·\\\Ëx_/ùl\Z—\ÛMÕµ\×S=«µd,Y\\_Á\â\ë\Èe\Õ.}!`:•\Å\åÒˆDÂ¨aa›H1û°\"~SuCÂ‰±q\êç´‘\Ëdñü¬Y4\á÷¨rB\Úq\ÖZB\ÕuL\r®«gıu7²`\İyx¬q.9\Ã\Ì`/_ü\Ä©«©±”	‚X\"I\Î0¨‡pi\Z?ÿ\î7ñz=ŒŒóö÷˜x*\ÉÕ—]\Ì\Í\×]\Ã\àğŸÿÚ¤g\â|\çöPğó¹»\î\áò‹Î§º2¢\ï_Ø·û…j}j\èx/\èlã•»©¯±¼³„\ä\Şo~O|\ë.>ó•oğó»ş;¾ğ.º\î=$’	\êk«WT \Í½}ŒE§0<\Â,€µCPJIU$¬²®L©i`J\"\á ‘ğU¦` ò9˜\Zu\â†\Ì$!:L¡`SˆHÉ‘±)\æ\Ö\×PQ®„eJÔº5ª7±ÊŠ`¦p#Ã£,‰ÏU\àöyš@Æ£\ê.-k=\İ4¶4\Ò\ØT\\¶H5œô\Ò\Èâ²z\Ş„\Ç\ëR!\Ñ\én·N™ß‡\0\æ·\Ï`tlŒÑ±1*\Ã|óKŸA\×5>ó•;ğ?½\ãK\ÔÕ„\ê#!¶\í\ÜÅ‚\Î6ö<š\ì\r\èõ-¡\Ø\È\0¡rGFX\Ğ6\Û\ê¤ \n±i\í*¾ş\Ó{ù\Ã\ãOñ\î\ë\ßFuEˆ=‡s\Ó[.e~G\è\í\ä‘-Ï“\Édğ–@sgJA	µG¦\Ó\ÈlF³\ÛL\Ç‰`\İa …$HŒMP0%}\Ñ.^½Ÿ·øD=gŠ\Ü$OÀÇª\æz9\Ü\Ã\ä\è0\ê\ZŒl·ß‹&$¦Š·\ÇYU1²È©q„i:¬ h!\"VÁb%)`xl‚†\ê*uDZ	Ák{\0pùEii¨\ç¿yˆ»÷ò™›¯SOÎ\Êı.˜;›Á‘Q\ë>7¶5\İ¡úš\Z<n‰d\Z	¼°kW~\ìóüô¥©¦Š»ÿ\çWt\ïa\É\Âyd\Ói&&\'h¬­¡±¶š5+–\Ğ6»…{†şş>²©²` ­“\Ø\ÌJ{C^‰«±ö«IK\ét\Ü,HR3\ê\ÙZ¹¼Á¶\Ş!t\İÅŠ9-jñ\ËiD»¾Ms\Ñ)\Ç\ï\Öy½÷Óƒı$\ÆÇ‘F\á$Ñ‚¾òy„TK\n\Â\æ\Ï\áI\íÜ±\×hf)v\ì{-/\ï`\İÊ¥Yº¬\Û_Ûƒ\Ç\í\æÆ·]M\×ñ>\îş\åı4\ÕTñÛ§·²\á}Ÿ\àş\'şh$Ri¼n7\rµµ\0µš\ËU­µ9\"\ãñz|³«*\Ùş\âK`i\àµm\ä\âsV\á÷z¹\î³_\ãp\×1V/_\Â\Ï\îı5;v\ï\ãú·n!\Ğ]\Z\×\\r>÷=ü8?¸\ç^t´±t~\'­--\Ô\ÔT\"„†4\n±\îõ\ZR\ÓÁ4†J‹U8\ÅAWÁ$•H2KòR\Ï0Ã±$—-i#\\¤¸†/\Ùk§\"`«~Ğ£³®µGg,‘dù\ì–¯ZJ¸¦\é\ÒA\Ó@s\á¨B.ci° £°\ÜY’‚¦346Î¡c=\ì~ı0S16®YÉ’y\í\Ğˆ\Å¼~\äs[g\ÑX_\Ç\á®n\Ì\\†ÿı«xuz\å5\Â\åA@002Æšs\ÏeF\İJ’\Ğ\\zNŸ\îr“Qß²…ù¯c¿\"•Í°a\Õ26¬\\Bí‘½\äœU<±e+×¾\å2B\åA¶\ïÚƒi‚p‚š\Ê0·¾\ã\Z†\Ç\Æy\éµ}<øø\Ó\äò\Ê\ËÌŸ\ÛÊ’\æj\ZC\\.\Â\ŞeˆD\n\ê‰&L%’DI&b	&¦f8\Ô\ÓO\"•¡½¦‚·/ï ¥¦\Ò\Ú\Ñn@q6¸\è\Â\Ô{>«öšµ\×D¸i\Õ^8v‚\ß\î\Ü\Ës\Çúhoi 2¢:¢²<HE™Mhhöb\0¡¦a³Yƒ¾ñ({Ÿ wbšT6G$d\İ\Êe,\ßAe$„®«j“>\Ê\è\Ø«W,¥¾®–ÿ\â>.9g5µ‘\İ\Å;/¿\0¤³Yö\ë\ãú®g\Ë/¤b#ı#ºY0rhš\Ù\Ó‚5«–s\Ã[.Á,\Ø\ŞVuÔ­\ë¬Z\ĞÁîº‡[nz\';;\Zchl”¦†z\Ëõü~m­³hkE&›\åX\ß	¢\Ó1uuó\èó\Ç\È·&\\\Ê…ŠS‰$©Lx=n*\Êü\ÔW”±¶¥\æp9~3Z(¸Q{u\í	I;–öA \Ë!1\Ñ4A]y€·¯\è$‘\Î1¡yŒ%\Ø\Õ\ÕC<%c=Ä \Ü\ï%ğ«f‚SJr¹>¯‡–\ÚJ6Ÿ³‚š\Æ&:\ç¶b\Ç>„Zg‘B)ƒ&\à\à\Ñ.’\é4ó\Û\Ûğ\ènq_ığ{\Ğ]\ZjV[ñ\ì\Ò7¿õrV-[\Ê\İ÷\0a\ÃĞ«fu$b£\ÑC\Ã\á\ÊHÿ\ï–w©\ìÇ¶G)yn\Ç¾ıóû914Ì¯\ÓXWKOÿ\0=}ı45\Ô9ğİˆÀ\ïõ°¨c.\Â\Èq^k-©T’L&G:Ÿ·„gé¸“Öª\ß·N\Ğ\ïA7MN9ªŠ\ÙVašŒ%\ÌQº\Èc{u)\ÔÂ–\ãR,†|^.š\Û\ã!‘Î’\Î\æ\È†­{v\'\ÔW)Ğ„ \è÷\àóxğ\ènp»\áj•\ãI°5\ÅI\ådóy^?Ò…iJvv°\å\Å\á{ÿó\0\áò2.8{…][\çS\ï½\"\Õ\ãñ—MWÔ·$ô\æ%«£©é‰¡‰\É\è\Ü\Ã]Ç˜__\ê SJñU¾ğİŸp\ãÆµœ?¿\'\İJ}]-ñD’\İ±~\íÙ–\\•Ö«\Èbl˜™B\Z~‡€§8=£Pt7V·*|ee¤\ã	\ì¹6iš˜\Ã*¡!J6;$°\\%\é’\Æ]^õ„!!¡€r¿OY«<¥5\r“8¨!¤ˆPe@»Ÿ¨q\Ó\è\è¯\í\İOYÀ\Ï\â…óø\Öşƒ]})\å>Ÿ¼ó.\îü\Ô¹üÜµjˆ$¸\İ>vŒ\É\èº\×7Ò¼\ä¬imöòsÇŒlö`<™2»õ¨\İ\ÖÇ¢Q\î~ğa.Y±ˆ\ë6¬¡>¡\ëX!\àXO/\Ù\\\Î\ê·\åß­<^\nÔƒ\Íri„#\"ó¤,IõªT¢\Òù¦i:ÁH%šK³\ÚiJu»…#@½µ‰r#Vy\Ã o%VQ¼\0ö€ú³\îp‡Â¾†s—\08\Ö*¤TÉŠiX\ÍÚ‹b6ß’\ètŒş¼Ö’ğ\Ñ\îün7W³ŠKW.\æ\îa,:eU— {\è\ê\î!‘L\Z…|\îÀ\ì•\çMh‘Y)_y\Å\ë±x\"÷Ê®=ºyô\r308\Ìg/£l’ûŸ{™›\Ş~-oX\Ç\ã\áXo\Ó\Ó1D	S\nfŒ–¿µE¥õ²k\Å…dq\íZ/@÷X\à\'£|\îG÷\Ğ?<Z¬°N«z~¿{qG	ş\×\ç\Ä&‰ ¸«D¢\ÆIgFX\Çm¥±\Ù6Šc÷\Õ>g÷\í\Ä\ĞÃ£c,œ\×\Î\Â\Îvn¾ş\Z~·m\'Ç‡F¹\â¬e\Ó;4¨8d\ên^Ùµ‡\éx\"\ç+ï´\ÌMi?¿\åB\ÚÏ½øE)Û¾k£Q¤u\ÓË±\Ã¼^ü^//½~„¼\Û\Ë\Çn¹™e‹\à÷ù8\Ö\ÛOtjº(ai›4‘\É8\äs–Ğ•u\Ø\İp´\Ä!Yòn‘x|^¼5$ôŒŒ\Ñ=8b	Ó¤TGÁZ`¶\"\îÜ–f\Ù}€D\Ö~8jD_\ÔKŠ—”H& n<‰!©FğH\Ô\rDF®>¯\í;€iJV.]Œ\×\ë\åS·\İÂœvv÷\àóz(óz9>8¨v„züO²}\×¤d¨\ã\ÜK_ùùû/R-ó7¾uŸ\'Pvt\Ç\îı\ì;t„ÿz\ä~ø\ë\ß!¥z r&—gg\×qn~\Ç5x=j««hn¬§·ÿC£c?v\'$\"ŸWONµ{%5\ÛN\Ôyl7#K°‘K[% ­›\\½e@\Ë\Üÿ\ìË¬_µ”ú\ê0§Z›\ßşk–\Î\İÍƒ/¼\êsao‚‘(\á\Û\á´>\ä©	v‰\Ò†Ì¤Ñ6\ØÙ¶c\0—^°M‚@\ã-—^\ÌÎ£\Ç\ÉZ;uL	wıúw|÷¾ß±ÿ\àav\ìŞ‡\Ç_v ó¼\Ë‚µúu\ß\'®2\Z®úi2•øö~Lcs3ÿñ\à\é\Z#Í’\Î\å)˜&‘ph.›6œK.Ÿç±§·X©©e-(\nSù~°F\İ vi•)\á¨N„ó[U°·§Oıä—´µ\Í\áö›Ş\Û\å¶,¯(µ\ËQ:`ù=^~ú\ÏÿX‚¯\Ş÷‡N#mT„Re\r\Åk§…œXüª:\ê\0B\"\Ò	¤i\ÚgBH%yy\Çk,š\ß\É\ì\æF+*IB­L\æ\â\Ù,}C£üÇƒdş\Â|\ë®“H§ú­úù¯n¿\Ö\0Š»î³©\ÄóHõ{ö¦”\Üzó\rüò‘§ˆ¥2ŒF§X\Ş\Ö\Ê¿Äšò“œ¿N\íŒ|ö¥W•,l¤\0İĞ”u¨0­\Øs´\n+\ÎXBqv~`¤\ìJ 9\Ô;À\İOlå²\çñ­O\ŞJ$T\î\0\æ¸i\ÅaA®˜aNS?øüÇ¹\ì\Âõü\çc[8:`-…[\ç\íø\î|/¡¢³µ\ßU@-…²\ÏJ)Ù¾{/†a°x~\'¡ò “\í?ğûGX\Ş6›‘\è43©4¿ü\ãS\Üú®0e{ög\á\ê]\ÙÔŒ³¿\ØeÎª\rcš\îşŸœQ˜ş\á\Ï~Á\å›.`\é¢EOğøÎ½l\\²€±~ı\Ğ\Ãdsy\Ú\Ûæ° ³ƒc½½\ë\íU\ØqCh˜?¶[%=V]µ\'aYR©;²\nOò\Õÿ‚O¾\çz>r\ÃUı¢\îÚ–avv\ÚÕ¾}<\nr\ãs\ŞY\Ëù\Í\Ó[)X\ìlı±‹¢+%m•Ø¢õ\0¥\0€Çƒ¢hmÀ‹¯\ì\Ä4MV,^D($—\Ëñ\ë‡fl`€\r‹ğøÎ½M²t\Ñ.\ßtwı\ì—\äŒBÔ¥{îŸ³úü	›”ÿû;\æ\Ù\ï¸í±²\Ê\ÚÇ\ßöj\êÇ¿¸—ü\Ì\ÇY¶xñ|¦†Zn»\â\"¾ş\ïó\à#O\'hkm!—\Ë\ÛS›a!Àm­Y”¦¼\Öw	§H\Ã\Òğ“1a\ï\ác\ÔUF¸ü\Ü5jğ†tÂ€£¥Ö§2\Z\'‹À\ívqÖ¢ùODûk\ì(]j!\Ê6m@”šO¤ò\Ó\ê\Ó\íÅ¾®J§Ùµ\ï\0¡r\êj«81:\Ê#Om\á\ëÿú=n»\âBš\Zjˆ\ç\r–/^À?~úüø¿\ï\ãù—_.«¬}\è\ì\ë?ôÌ‹?ÿ“ƒŸôXõ\íÏ¦Â³&¦£W\ï?x(¼j\Ùb®ºôbşø§­lı(›\áñI~ÿô³<óüK<\ÚM\"‘$³ù\âp¹\\ªSB ¤z\0†P\Ô;‡\Ô¿%h[¸\Ö\ï\İGº˜˜š\æ\âu«)¢ÁŸ\İ}UHi­=\ã,JZ\Å<»}\×^tšS\Ç»­#‰¿\"r\Ê\Õ\n—”#t\İ\áõXoÿı›\åPW7xüi~\âj^ª*BÜ»\åeF\ãI¾ñ¥\Ïr¬·Ÿ;¾û#ò¦ì®¨oşôş\Çs¢ôšÅE›n¿\ãpõ\ì\Îg²ù\î/\İñbñ¿½\ç\Ç,[³†½“3,X¾Œ;¾ô~ø­¯rıU›ñx<<\ÚEOÿ€b[*\á£\ëŠi+›:) Z\×r\àX´\ÚPeƒ>?ƒc“$I²\É4™DŠL\"É‹¯\íatb\nSªà«”\Ş\Ä,˜ôğĞ“\Ï222F&™\"Ÿ\Éb±dSš{e_p’\ë±²\ì\ÇQ‹Aû¨ú\î\Ò\Îs•\ë\é\çxŸ’ÁE\ë\×ñıo|…ş\ì\'™¿|™’ÛŠ•üò?¿\ÏL<Á—¾ù¯f&—?P=gş§6}\ìöpNU\06\áû¾=¼\ïİƒv|}NKs\í\×?ÿi®¿\æJõ i§‚\×ö\ì\ã†\Ûn\'Ÿ\á?ü.—]¸°„+M\Äô¤\Z\Û²?#\"‰¥\å\0Ê…\Ó3|ø\ße~s×»šÑ©)\'¦\Èfó\ä… %%\íMõ¡6k$S)bS1D¡@,•\Â\çqs\å\Ú\Õø+Bü\Ëo~Ou$Â—o½—\ZhÈ’~Ù³øGHe%¡*T<Tw‚}÷\Çÿ\Å\ç¾şm\æÎ\Åı?ù>«–-Á¯\ÕÄ¯~÷0_¾ó\ß\è\ìo^|Ö——m¾\éG¿u{†S\è/şWˆ®Ÿ0–l~\çşB6+Oôt\Í\Ûú\Ò+\åfÁó:\Ú(øm7‡}‚\ŞşA:ç´²\î\ì•j\n\Ü6ySª\çšPŠ•]´¾–ª¤*g\á€\Ï\Ç9Kòë§¶²u÷~:\ê¸û\Ñgx\ä•\×ğ»4.Z\Ø\É\ìHˆ*¯‡J¯‡º@€\ßn}™\'w\ì¥tœ–\êJúG\Æø\×_ÿÆº\Zş\á\æ\ë(/SÉ‚ºl\Ñõ9±\Ğ\á\Ëş]dM( QÿM\Â:œ\Éfù\îO\î\á\è±fµ4q\ë\Í7*/·\êÀ\äd”üô¿ùÊ¿|\×›\ìj\\°\âûs\Ï\Úø\ß\ÏüğŸ\ì\ÇDõ_u\ì\ÙVXs\ÃGw§c\Ññ\è\èğ’—·o¯\ì:Şƒ®»©¯«Á\ëv\Ó;0\Äo~”ñIõ/:\Şqõ•øœ{3Íš’PsT1\0v`– lk:	(\åe\\²\î,\ÊCåœ³tk:\Û(÷z¨‹T°t\î,\Ê>Üº¯K\Ç\ã\ÑY>w—µŒ+Ö®\äù#\İL\å\n\\u\Ñ>zı\Õ*¦¨¶SB\Ø?Š \Ø3\Ë\Å\'\ÇZŠ¥¹¬	I+bIH¦\Ò|ş\ë\ß&•NS®\à’óÏ£¦2B4\ã\é\ç^\à\Ûwı\'÷ü\êR\Ùü\ëu‹¿¶`\Ó\Û\î\Ûz÷7ş\" Ö•NO›¿ğ=\ßö_ÿx]lôÄ¿\åR‰ö\ê\ÊH`\Î\ì\Í\ëõ0>1\Åñ¾~3Ÿ\Ï\ãõx´£¯<KKc½3•\'¤ÄœT«‹+°ü¸ue;P;;\Õ\å)ò‘¶\Ğ\Ô`\Ñ\È\ä2Yò™F>4O¾#Ls¹ñ——!\\\Z9\Ã\Ä\íq\ãóz­§fX“¦vì¢˜š;,	\é¸*Ç½–ô\Ğ*\ëV¬\Ôl}\åU.¼\æF\\^o\Î%Mmvs³V[]©e²9úN˜Ñ©¿\ì@EÃ¬/}ı‡¶?zçŸ»¬RzCPl\Úü…»\Â\Ï\ßó\íw\å\Ó\É\Í\Ò,t\"¥†Ğ†„K\ìôú\Ë\ëc#\×ş\ä;wè·¼\ëN)AÄ§œ‰I°÷…-xQDÀ–Š-R¹\0™9\ÇmÁZ_iQ\à\Åa sM‡Š\r«ÿ¥cµ\á*„¿ŒRú\â7¿Ã·ø“‰Ú¶EŸ‹\rÍ–fa½if!„¡i®²ò\Ç\Ï{\ïgzô[Ÿ\æ\èŒA±i\íMo9²¯\Ş4òZYe\ít\ÛÚ‹º_¸\ç_\Ş:36ø\Ów\\µ9ü«ÿü’’î¦“0=~’pC‰®B\ÉÁbı¿,Ã“\ÚpN; Xd»FJ-A\ØHT\Øf	¢\Ô\Ï\"Š\Ê\âÒ¡²FQ¬óy#\Ï\æ\ß\Ï;÷\r7Í½\é\ì\ë>°\ïø«\Ï\ÎMFGBš\Ûo6t.\Ûv\ß÷ûyô†O\Æ;•^¹\ï®^ \×ş}h\Ë\ïi_w\Ù\ál2~üÀ¡\Ã+ûN\Ò\Ò\Ô\èødt7Rw«\"GŞ¶À”LŠÂ³?Á–Z‡ƒ’#±!K5\í\",À\ìb¢´ª:¨¦HJÚ ¤\rë¸´›–¨v‘\àõ‚\Ë\í$B\Âë‡\Ò\Û?`\èn\Ïóó7n\îô\Î\ÛsÀa»\å\Ş\Ïòf\é\Ï\Æ)-\İü\În#—}eph\ÔÜ¶c—b\Ø¸KG\è\î?\×z8‹\ì¹İ‚F\éP_9£¢\àœ…-aµİšÄ±uÈ)^\É\\Ú³\Â\Âi´û„\ĞÀ\ã\ÃğvŒ\Û÷ú!\Æ&£\ã\Øÿõ­7ıÿ·şı]@y\èK\ï\ÍÔ¶-\ÚO¥r{\"—3@¤Û«v”\n×¶©Ä¯Î©u‰‰a\Z˜²€´6s\Û\à¨JÕ¿h;\'ƒ«H\Ú¬¾2‰a˜˜¦Z“9u¥À>å‡¦\Ç_Ò¦$“Í²\çÀ!R©L¦e\Å9ù;Ñ›v_V\\uóS~\ëµş­/½\Ú9ö¾	š­[\Í¼HÆ<‚“ªÜƒZ¢µs£C=<ô§­¡\Ñ\Ö\ÜHkC-õ5\Õ~\Â\åA\\.5ºv4Ù–k©%ZBM¤3$\Ó\Ò\Ù,S±}C\ÃG‰%\âl>\ï–\Ík·\Z°+Z\é\è­\Ã^?Â¥—Œƒ5\Æ&¢¼¸}\'¦4/\ß|\ã‹\Ç^zŠ¿ı\İ@yô\ÎÛ‡\Êk\Z\ï}ıPg\ßÀ Í\rNpº\Ôuõ\0;%¶II\0„´ö \n¼nÁ†\'&ù\í“Ï‘H§i¨©&ğ	´Ô«1 .a£¢r9ƒ¾\áf’I”h,N.gP\n\Ò\Ñ\Ú\Ì\Åçœ¥x°\Ón¤Õ¤†¦:nY‰”Ym1-a`pˆƒGºV\×wÿ\ï\ß\å\ïD7P\0\"\Ís\î\ë\ß3¼\áw=>w\ÍjÀòJR€/¨ş™\r–\0­ñ‰}KA\éf…9\Í\rüè‹Ÿ\Ä4\ä&\Ñ\ét÷002\Æd\ìÿ\ë\í\Ì\ã¬,\Î|ÿ­÷œ\Ógï¦išf\íf\éf•]ÁH\\1$z½š{o’›\Ül\ï$™\ÌLfnÆ›e²g\ã8˜˜\ÑHb‚+ˆ\"¢(‚ ²C\Ë*H7ô¾œ>ûykş¨ª÷}O7ˆ&’\ç\Ó\Ë9\ï[o-\Ï\ïyz\ê©z«z9\Ó\ÑMk»\é\Æg³¨«®bñ%\Ó7ª†’€Ÿ@0\Ä\èº:\â~‰\ßò\á³|KüZ@Œ4Z¬§§Lt!GÜ·¬Û¼f\ízÒ™Ì™Ñ£\Æı>\Ñ\Ş\ÊE^…ÿ³ixCSC[\Ëok+\ã³^[»\Æ_¥\ß#‘µ[i\×Y(\è]K½\Ò\é%-õ×õ$CHiƒ\Ù/\Ì{\Û-r\Ø„¿\Ú\ŞV\á©3®0\ZQe£*¬bVf\ê{g\Ú\ÚX|\ÃMœn\ï:)«\\\Ù{\æÔŸw´¶‡>\ŞPÍ¤Y\'\í|~\Í\Ùö\Îü³/¾„-¥\ËKŸ\Â1\ÌÆ˜Š{\Ò\íT=?$˜9z“@¢B\ÅJœ…\×\àö:oô¼\'Á \Âò©¸‹öE\Ñ\æN\nõYh!€!\Ê*U\İ\Ñù\nA2•æ§¿|Ó­­‰p¼üÉ™\×\ßú®[E½_ú“©=µ\Ş[˜´øºş³Ç›—Ÿz§¥j\Ù\â…T”—¡\âK(Qd³˜q¶0…ùn‚„.“%8n¶\Ëù\â›\Â#\å h€D®\0}ˆtu ‘x¡V\Õ©D(\ne\ÃÀ\ï7…«§$\Üsÿ*~ü‹\È\ã\ßX5~ò={\×=ú¾‡¢´OXpû—ö´Ÿ8ø\ä\îık]óT\é\ß~õ8¬% V\n¶H%PS¬ŠA\Â1gŠ9Á¸‹°\ë\ĞQ}õu2\ÎAf:‘4A3²š?¼”¸Y¬İ¹JfD\Â\ãai•!¿>\0\0\Z&IDATS)\0YB\Ä+\Õ\Ê|MBƒÿòk[ù\É/` ™\ê¨3ñ—§v¿vş-‘şDò4÷ƒ£ac\Zªû;\Î>eg“s7=¾\ÚZ0{¦z·\\\Ù\"„;™@ô÷‚,x˜/q–‹J@Q¤˜dõº¹\ï\Ñ5\ä³9­$Z\Â=\åÏš\ÒÀ?}ñ3TU”a:m£Q\Ò€AÀ¹	\àƒHbeŸ\ÏõP\ç\Ålze+ÿ\ç›\ß\æğñ“\'ª\ë›\înZşñ‡^ü\Å?İ‚\éÏ¤‹\Êõß¸\×Ú³ö‘¿j=ô\æ\İóg6Mº\ï_\îf\ê\ä‰H!œñ„”¶Z\Ö\Ú\ßù¬£MxL””¶\ÃtcÓ¤„®\ÖVzÎ´‘c\ï$!©YCÅˆ‘(\Ğ; šq‡1U€;\èHa!b\å\Ê\Ó\Ò+c\Ê\'@À¡\ÃG¸ı_c\çım\Õ\rM?™´øšû^ùÕ\ŞS€ñı\ÒÚ§:ü\Ê:9ö’%Ç’=g‡8v|\Ñ\á\ã\'¬\Å\æQ^Vª\Ù(AX\ê\Ã`ò9µ\ï/\0\Â\é\ĞÓ¢9d\Âû`ˆl*…](¨¥LB „À\nøˆ•—SQ3RÀÑ£x¡\Ía‘v ±ÀW‚(­DDb\ê9¯I\É\Ñoóù¿ù{¶½¹»¥rl\Ã##\'\Ïø\á\Ç\è\å\"\ÑE \íÈ¾ü-÷>ñ\êş\ç×Œ~\ëğ‘\ÆCoõ/œ{	\å\åe\Î&Àòa…£€DrxŒ\0ıB`ùDKK	\ÅbD\ËÊˆV”«(£b\Äµ(\ÜøŒ*Dy\ÆNE‘€¥–\èVC˜¸–c²\Ô\Ã{6ó…oü¯l\Û\ÑR9ºş—#/ùÉ¾u¿\ë\æ\"\ÒE`\×jg¿Iô\Õ?~|\Ú\ÉÓ§­93¦SY^®ShOKXX%*K.\í_\ëe¢»N\ÙB°|`’`HmOaù-ez®J7×‰›\á+ÅŠ\ë©]m\âœg…dß¡\Ã|æ¯¿Á\Ö7\Ş\ìˆ\r¯}¦n\Æü\ï\î[·\Ú;j½(tQAøøw¨¨¿ş\ä\îm\Õûš²v\ÃFÿü9³Äˆ\ê*,Ÿ\åz]B üd(ª¼3=£¨°°4#±\Ç\íœuŸbF÷»Q„*2P‚(¯\Â\nÇ–\Ï¬é¾¦`X¿ñ%>w×·\Øs°ùDÕ¸)¿¨™4ıŸ÷?ÿ‡,”ònt\ÑA\Ùõ\ÄC\ÛúB¾º~\Úkùl&\Ü\Ñ\Ù1ö\Å\Í[J\ã\Ñ(\Ó§`iî¼Ÿnù”)±,u¹wX\î8O	\Âˆk\ŞO\Òè´¡ˆšc/	: 	À¸ZùB\Õk\â®ú.G¿\İ1|B\ãwf\\\Û¯¯şùE\ëC\ÓE\ÅP¢£5UQ7\áµøğ\ÚÔ©#\Íó6m\Ù9öö\ÛLkœ¬\×\İ*\î	Â² D”„…‚\ç 2ŒRyH8ÿ…—\ÉN¼E£\èóA´+^¿›‡\îo\0ZÎ¶ñıŸ\İ\Ç÷î½3g\Û(¯û³™\×\ßr\ï\Æûv‚¿ ı\Å@Hv·g\ëf,\è\ï8\Şü\ßóùBt÷şƒlzõ5\âñ“\ê\Ç\ã\×Û’;´\ß¡ø|HY@\ØùbD$œ¿>\ÄÑ”`\Ê*!\Õó:T À¶%{4ó¿}7>ú–/D!Ÿ\ÃŠ´%:\Ïş¾¿­e\è~½‘ş¢ \0$:\Îü\Ï-¾lùÍ¾Xi%ûö¼ÁË¯½Î©–V&\×O\ĞN€p4!”\Ö\Õ9ó2Ÿ¥(„\îôÒ£ú9K@´/\Ókqúw·\Í>ö8_ÿ\ße\Ëö75®‰•·|®3´:\âkX|õ«­\ß,Ú¹\îbS‘!x?t\å\ïöŸi\ŞUwd\Ëúº\áš\æ\n+%¶Z©\ã\ì@ª¨Ÿ•K%«:\Ş~kÑ¨\Ñ\'\Üñ¥RQY\ÃÎ­\ëÙ´ö×¼s\âñx”¿ù\Âgøø\r\×Q?v4>Ë¬MV9	Pç±¤\Ô²…l¤°µ+«\Âöø}*\Ô+C\ê©h\å;A\nv}›ù\åCpÿC¿%2kÁ5\Üğ©¯EYu\ÏW9°ó%€÷ıõ‚‰ªq“^Î¦şP7}î½\ë~÷¾½µ?	”i\×~ª\é­MO\İG.KõvÍ¶ù\à±sš4m!w~\å\ÇDc\0´jf\Ë±}ó“\ä²)fMk\â¶WòÉ\Ş@õ°\nµù§\ã²j* Ÿ\Å\Òû\í;\ä³ ‚@‰Šµ\á}NiIOoÿ\áqşı¡ß²¿ù0•\Õu,»öv.û¡P”Şv\îş\Ú\nR\ïz¢Æ»Q\Â(i„£k+\ëÆ¿\Ğr`\ç\ãzÀK\ï”O¯\Ú\È\Úù\ë*;—ÿb\ÇñC±ùI> ‰–Z\å•5”W\Õ`\é\Õ\ì5U\ÚCEı)\äóo\ŞII0\Ì\í_üõ“ç€–\à\\6Mû™“¬yø?´ŸS\Z&p\ç-Ÿ`\å\ÕfxU%%€š¼øRb	5º‘(\ëe\æmlÛ¦»·¯l\á_ø5;÷\ìGZ\Zš\æq\Ã\Í_¥ºf¬\ŞûX°ı\Õgx\ègw1ÿò•Ì˜{¥wp{\ÎC§Ofç–µtµŸ&›Ie-ŸÿHI4şô„ùW\Ü3n\Ş\Ò3k¿ûe›\Ğ{\å\ÎU/ğ‡o\Ş>#—Iß\ê\é¼Ü²|¥#G70sÁULšºú)³q\Ì<Å™z¯I¿ı\åß³õ\Å?ò\Ñ\Û\îb\Ùu·cY>w\Ğ& \ìgós²\á‰H%•¤N™XÏ§>ö®]¾Œ™MŠyÆ…nt\Ø]e©KŠ™-gÏ²şÅ—xb\ís<³a’0“¦-d\áÒ\Ñ8k1`o\ì¡{¿\Î\Ş¹ó\Ë?f\ê\ì¥E€.\ÓD•OhN	F_O;{¶o`\ÛKs\ê\Ø~l»•–ÿ±iùÇ¿µóÿq‚\Ğ;úO¯\Ú\Ä\Æûv]\×\É#dú¯GKC—-¿‰nú23\æ-gXu­²\Ô&\Z\ë \âv\Ö	µµº\ß\çG\ÚyvnY‡‚™ó?ŒO„£\æ4$~\Ñ\ã›(6‚‡w“Í¤\é\è\ê\æ\Õm;xqó«\ì;\Ô\Ì\È\êjF¯r\ã^€9³ËŒwlÛ¦õl«Y\Íw~t/¿ù\İ\Ù\ß|„ºq¬¸\é+\\q\İmŒ©Ÿ\Ï\çWy\èøJO\Ç^\\ûkJË†±\è\ÊO‰+kë£“zV}–º_…cŒ?•ú\Æ9¤S	ZN6ûó™ô\Ä\î\Ó\'J—~ö[;\Şú¥Ä¾u«‡\ä\å\äy\Ş;š*\ë\ê\'õ··<˜Ë¤\r1š;¾ø\Æ6\Ìr\î+)•\Îg8‡kJ\Ğq¶H,J0\àû__I2\Ñ\Ë\ßşğI†×ŒĞƒt#r*¼\Ş\Ù\ÙÂ¦§~Å®\í\è\ën\ÃÖ£|Ÿe±hşn½ñcÌ›5 >\ìÒ–6½}	v\ï;Às›6³aó«$	GbŒ©Ÿ\Î\Ü\Å7°\àò•=\àD$N+v¼ò4¿_õf-¸š›ÿ\×?bÛ’şş~\0\Ê+*\Ü\ähEt´D\İp“\ëO=È†\'şşl(^¶ªv\ê\Üo\Ûú\Ây#\Ì\ï:\É5qÉµU­v~-—I\Í>ruû7\Û0\Ó3T\Ğfgğ\Z\Ü\Z¡pX\íø\İ\ÓË€\ê›ğæ–§Ù¿\ëe–^ó\ßTr08Y9¬–•·\İ\ÅôùWr\äÀvvn]\Ç\ÙwQ°m6o\İ\Î\æ­Û™\ÜPO4…B®NV‹\"\Ñ2\æ^¶‚©³—2q\êJË‡\æfdT(\äi9\ÙL>Ÿ¥¾q\Ú%µ½‹T:\Í½dJšº\âZ\É\"óf\",ùğ§H&z\Ùøôƒ%\Ù\äÀuùLj=p\Ş\Îÿ]\ÍW(^~G×©£Ÿ‡c¥+o½‹™ó–£\æ\Z$RJ²™}ıt´µ\Ó\Ó\İMoO}\İj\Ët)Aø,uÆ¡òy\Ò\éÒ–`\Ûo\ŞA&“bö¢kñùT5„cò„\Ã.Ÿ\å§rx\ã\'Î¤i\ÖF›Â‰Ã»©ˆ…˜7m\nııı¨“\á\ny\É$\é¯¸‘\ïüs]\ÇØ†\Ã\Ì<	º4ı£K†\Ş\î66<ù\0\ét’­ø,‰ş²\ÙBX”U¨ j:¦§£“\î\ÎNzº{\è\íQ¿‰¾>d¡€¿¤D…<\ä?iGöo§«ıt<\Õ\×=\ì\ÒÛ¾ôÇ“»¶¸g\ßzè¼šrı7\ï©|ş§û?¤mWÍ˜·œK.½F\Í\n%WÉ$mg)\äÅô\'ô\'\Ê+\Ê	G¢D£1úzz°¥ rø*«G\Ó\ŞzœS\Çö3aò%\æiŒ,š\ÓØŠ·\îeÓº\ßP?y£\ÇO\å\è\×ø\ä\ÕWğ\Ñ+“H&—ùs\ßù	¯¥0j\ì{ü~\ÆN˜\Æ\â«n&ƒp\ÖmF\Â\İ+İ­œ>\ÕLm\İÔ¶.¤\0Ÿ\ÏG_\éTZm4j„q,€¼”d³Y\É*‡\r#‰xZÁ`„+V\ÜÁ\ÛG÷Z\Ù\Ô@\ÓÑ­W\0¿\ãt\Ş\Õ,G·l¸<—I5„\"1.ûğ\'ñ\é3·j\Égow7…œš\Êl¼\Ì ;Ÿ\Ë\Ñ\Ù\ŞA[k+\éT’€~¡(^VEu\í’‰^ZN6#¥bt[«\ì³î´»:\Şaıšû\Ù÷Æ‹t¶·1m\Î\Õ\äò6ÿùôó”Å¢LUË¸\Ú\Z¶\ï;\Äß¢ªz’2\ïõk\îg\Ç+\Ï`KµDÕ”e&NÌ†;\É\ÑCo\Ïfi˜ª\Ï\Æ ¤:{¬¯§—LZmi\ëµ\Ö\Ês”\0\Ùt†övµı­“Fe6~\Ò%\ÔO™R\Öt¿s\ì\Ò÷ós÷xNP>şÿ]rì—— ‰Í¹l#\ë&jÓ¢\è\ï#£’cF½¡UQ)\Õ\Üv:“¦³³“L:ƒ@bY~\ê\'/À¶m\ÜA*\Ù_\ÜO	mZ„ •\ìg\ÍC\ß\ç\Ğ\î\ÍL˜<¦\ÙW2b\ÔD\Zš.eË®}¬Ù¸™ö\î\Ş:ù÷ÿ\áúIf]º‚‘u“Yv\İgğJXó\Ğ÷xu\Ãj²™4®\éöè¬ \ìx\åiÂ‘Rj\Ç49B¢ğ\Ó\ì5u”®;®¿\ê\ájs>“£§k\è<X¼¬’™ó¯\Âú¥-¯\Úû\ì£\rCqó\ÕzhW\Ï\ç›\áÆ­)\Ó/%Šh-[H§\Ó8«\İNˆCWK\Õ]z\ÆHR7@3CJI\í\Ø&\Â\Ñ27¿I¢·“p$>Ä›I§lx\âö\îx‘\Ê\ê\Ñ,úĞ­„‚Q$0yúbN\ÛÃ·ş ¿y\ê9R™[÷¤ªf\ã\Z\æ\0Pß¸€|.\Ã\æõ²ö±—]y*\ä‚6gjMK{\ëIzº\ÎP][O$Z¦Û ™nd\r#†\ÒmRw¯e\Òi¤m«ˆ·¾(€‘c\Zˆ•V\Ğ\Û\İVÕ²oû9O\Û>§¦\ì]·º!›\Z˜VZVE\İ\Ø)JjQ¿…\\l:C‘un\Ç\ì\ÔZX¨\ìõ¯\Ç+%!\ÆOšCWG+\Ç\ï\Â\ÕI&\â\åõ°ùùG¨¨\Z\Åò>OeUS—1õ³¨?£§ZX¿e;/¿±a•°\èC·8\ç÷úı\Zg.\ãC7|–|.Çš\ßü€m/­!—M\Æu¤\ä\à›/“Ë¦©\ÓH$V†«Q˜DxÉ¹¢\ëluUµ!Ÿw\Ã?e:kj\Ç/­D\Úv¨|\Ôø)\×~ı§C0r\á\ÎU/\î\ï)/d3±P$N\ÅğQ \rSÕ-ù|Ş‘~%\İZ\âœzk\æk“\æg‰(Pß¸Ÿ\ÏÏ›¯=\ë\0+\n9^y~5Ï­¹Å¢+o¥vô\'\ìE˜9ÿZ„\å:c\êg1rôdõE\'–†\ÆE,¹\êJJ\Â<ùğ\Øö\Ò\ã\äs\êu\r)%\ét‚£\Ío\à„Q7ƒ¼\é\Ó\0§\\£ğOÀm·”k²ø8E&\Z¯ j\Ä€R\à’¶#û‡X«! dV¤|X5–\Ğ\î\Ä+\åmi½0•Ö8vV˜û\Ú¹r¦™/m\Ê+GRY]\Ç;\'\Ğ\ÓuV\åiØµ\í9^x\ê„,¹ú&L™_d\Ğ\Ì1ªX\\Y€p´Œ\É3–Š”\"±)\äò\ä2)ú;±¥M\ãÌ¥,¹\êN2™Ï¬şoly†BA½š\Ñ\Õ\ŞB\Û\é\ãDb\å\Ô\ÔMò”Fê½¤4dP¿\Â\àv¢\ß\Ñä™9F•‘M&j;\Z‚Á”l)–\å\Ç\0\æ\Ñ\\z@—œª\ë^	\Z\Ù\Åm\Ò\"ZZ\É\è	³Ø»}{wldñUŸ\âõ\ÍOğ\Ä\Ã?\"ŸË²\ä\ê;˜2s–¥7‡–*w):²ü0‰¾N\Ê+Gr\éò[5n*-\'\Ñ\Óyš¶–côt¶\à/	²ô\ÚÿIiùp\Zg-Ã¶¼úüoøıª¦¿§\ÅW\İ\Âé·›ik}›\és¯&Ò»$);¡(ÒŒY²\ä°\Æ\Ófõ¬”’|¡\à>«0!(¯P›¡&»;\ê²ıp* Ì¯G_½…›o\Ò\Û\ÉI\å2\n-5¢\èGÏ•ÿ\ï/¡n\ÜT\î\ÚÈ‰Ã»)+\ÎÓ«\ï!™\è\å\Ò+oaòŒË±|>t´)H§\è\é:‹”’\á5\ã;a&\'\í\æ\è¡×‰—§¦nSf.%^QM$R\æ”<yú\nv\Í\ëdÃ“ÿA*9 C8y\Z\Z\à¼\éh€[k‡h;:z‡w\ì\"m»L\Å&IE•%—N\Ær\é\ä…A\îG4Àú†\Ğ*+{†\á4ƒ‹ª\Ô-Œ¥£N’º±Óˆ—\r\çÍ­\ëÙ½\íyl)¹tù­\Ì^¸_ „,\äx\á©û±\í<±ø0Ê†\ÕP^1‚X\é0®Xñ¶lx˜com\ÇZ\ëgş\åŸ`ü¤¹øüA,KM#\äóY2©~²™ù|†Xi\Óf_I8gó³«\Øøô*\0\â¥UTÕŒw@\ĞÛ‰\Ze1A¢˜>8V§„Qh^P\Ô^%G.\ßü\çL˜ĞŒ\ëo‰\íyæ‘¢5\0\ç¥8\Z\êb4À%\Ë\Ê\0\ãõB@œœ¥c”c 	†£Œ?“¶5Á7{\ÑJ¦Í¾\nŸ™¾µüÌ˜{‰şn}ôv¶\Òzò ùlñ“\ç°ü#ÿ›¾·ö¾B6=À‡nø–•\âÔ±=ôõ´“\è\ëd ¿‹Lj\0„d\ÉÕŸ¦¦n\"õS\æ\ãóùÙ¼şWtµŸbLıLÁ0`9g¥F „şEişš¡€á”fgXt\n­\Â+\éÔ–„cC&\Ïa¾Š•U\è\Ê8j¨ÿ	£Zƒtb\ã\ÍÀ·A&7“—\à†¦¼¹\íI&O_Ê‚e7\nG0“S Q\×ÀH\Õy\æór™4>¿Ÿ£\Í\ÛIôu\âó¨\Z1`8N*\ÑK_OBj\Ç6RV1‚@ „/ ´¬\Z¤\Ä\ã\Zf+­\â\Ù\Ç~Ì¨q\ÓğûK(ª®G\Ã\rW„n”\0G[$\ÂIgHJ\é\î-¦Ÿ/v\ÎO\ç\0eP\îx\0¢Aƒ=.\áI¦P1¦\Êm§t@6ª>l\ÄX–^ói&M¿œPHğ<è„Áò	¾0–\Ï\ÇÑƒ\Û\Øø\Ô/\0\É\ìKW²ğŠ›±|‚\Ã\Â,Xz£*\Ç\ÔJš<\r©“#ªk\Æó\Ñ\ÛÿÁ©û¹$^é¹¯˜\ë(‹\ÈT\×Ã£bn©¿ƒŸs\Ñ{x?Å˜$OG‹®œfªa˜1I\æ3\Zos<+¹(	1}\î5jch)Lv˜·ºLƒ’Lt³k\ë\Ó\äs&N½ŒK.û(–Ï’P8Œ\Ï\ç£P°\Éç²Aœ×©„º/«Â¼!\Í=¡\02iH* \İú›v	p\×A—\à¦*\î[\ÏG\Åaº&\ï8\Ä\Ã\ÓD!Šøo\ê\à1\ÃE×ï–¯¨,\ÅµnXš¤\ë\Ù\ÄËª™¿\ì&yô{tµŸ¢K#\Âq’H4F©>\ÖVHA.—#—Ë‘N%É¤\ÓØ…ù\\Ní ‡4?ŠiºvÂ¹\âe­JnL°\é?a:½Q)=\é\Ş;]”Á\ä÷tÁ\0®	N…\Ğ@¹\à¸Í’‚\Î5S÷„û_g pp\ã\Z.aü\äy¼µw3g[/«FJz•“\0JJ”KˆÆ¢ú~–\Ô@R…\ãÓ„\Ñt—©C\ÇZ²(­\Â}\Î\ÔW×¯P(¨C¬\Íöˆ:\Ï\Ñ9b_\ïşQa”\è‹\å°Š‘(¼ôG}]x\ë\éü7À\èˆ\0Â‘J7/e\çg,EA\ëÉƒcŒ;\ìv!\Â(\Z\0@	ñòr†\×\Ô)\"G ¤.E:7<UGÔ©Lc\\\ïS?\åM3\Ø\\œ‡Ş“¦x¥Å­¢b¸£ğ\Ât~NP\âH‘cö„\Û8p]d¯™¯Bøœ2€>Ÿ\ål š\Ï\å‰\Ä*G\Ë\è\é<\ãğ\"‹0X(ôJ©6ş\Ìes¤’\n\î›^^M÷\n—ôLI•ú/•\Ùr\î*´t}‹\Û¢(Ÿw£÷\à}‰\â\Æ\éÿCµP»»h¦šJ\r’yiH<\çšC!ü?¡PHE~X–%›\É\Ğ\ÙÑÊ‹2¼J\ÔÁ\ÓEù+’¶M2™$‘HKg\È\år\Z•HY\0\é\ä¦ƒx¢\ém†\Ó\Ú\Ë\Ód\í§q!º ¦b,=\ïn\" ¦b€«$ŒöG*„	z±P¸\Ú$¥¤¶¶–P42@uß¦¯§‡B®À@‰¾N&M\"ñ(¦²m›B>O.—#90@*™$Ÿsw\é“\n\ã¥ç“£Å¸\Âd\Ïi™i‹\Ãx3nq\ë­>jx/ŒÉ… ğ`o\ÂTHº5\Ãô%*©ğT¬!®!Tùwuu/ˆ\Åc±.Ï¶I\èe?\ïœ\Ø@u­š\Ä+\ä$d3²\Ù,ù\\†\\6§\"¶\ÂÈª\Û;\Ì\×\å:¼\Ñt\Ó=\Ïb„Nóf°\ÕÄ®\"u\Zù.4”ÁV\Ïkm¼sÓª\0H6€ $¥8E\08÷5H\æ³f…óh&“&Û¥¯¯—²ò2B\á–¥´4—\Ëc\nH[rôÀVÂ‘R\'\ä>\Ğ?@2‘t¶r\",£ €3´˜»¦®^¸Œu\ï¹\n%Õ0yKG8UÀ“a1]\Ø|&3\åq€e	\n^=4e¹Ëƒ’¨\ÏF³ğ<£¿¸ZP “JÑ–J\á/	‰D¢z|!\è\î:M__\ã\Z\æÆ‘Bª>…[–·¼s]ó\Ö\Û[}?\ï\Ü|·E?l\Ûyl;Z\É\åMTş`º (FTAªSU«[ˆ©„W­\r‡½	-{\Â˜ñU\ÔWˆŠYT\È\åIfó¤Iµñ€€¶\ÖcH[RU3–@ID\å#¼¹Í«\Øüƒ\à¦4ˆ\reö\à>Ä¹+Az\Û¨\İÌé•¨`\ä x\Ï\ĞŸ$ü16\Ü\0\0\0\0IEND®B`‚','image/png','denis.png','Claude','','',0,0),(4,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\nÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0€\0m\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ò)–P@•=l\Ó!Šõú\Ô\Ïó°a–\Ú{ô§„c9\Ú1Ş¼~k¯ öHv\áw–=:~µd>6	À5¡¶\Ï\Ê\'#\"¡¹’o•²ÃŒLV|úšrY\Z9v’¤9\ã=)ˆ6….J\äôÿ\0óÚ–[\âY£‰rGğ)SLº¹\Î*v·|`cùVªö¼´&)·\îŒûD[±–\Ï]Ç½N—\ï\\g8Âœ\â«J–ğ\ÄY\Z\"\ãŒÆ²\ä\ÔK°\r\Zˆ\É VJ\ÕS\çZ/w\âgK¡\Û\å$r­iÚ\ÌÄ\Û5\Ç\é—7*Û2>§¯\Ù\é°\Ïx†UB\"bx\ã\ßÓ¯z\ã\ÄSp\ÜÒŒ¯ª,ù„`\İi|À\Ê	$PœÛ’²:2·AqQò€\Ãƒ\\N\ëS-¦\Ç´\Ñ;o`¬\ÃÀ\'4B<\ì†a\ÅIk7´Ÿ¥Jv\Ü\×tsrÿ\0¬.F\Ğİ½ª\Â[ùù\0Ö›)I]J\ä\åOk±2˜@g\Ú\Ûp8\È\ï^Š»\Ñ~K–°\íU®\én–P¤\ã\ëX\Ò\Ü¼x\ä\\\Ë7\Ç=\roA—¡\ê\Ï+t¼#–%	\ç\Äş•\Êj²\Ú\Ão{…\Í\ÆÙ™ù²G{\æº)QWm™Î»\ÑDÓ‚U›Uó%H’8\ÆR€¼s\Îzõª\Ş#\Ö%7$\"rË’©÷Úª\İió\ÙÚ£J\ì\Î~RObGNz÷ªze¥\æ«y¥¬m.\îD…€\Í\\i\ÆO™½R¨â¬–¬È¸¸K1Ê¡_\ît¿¥Ok¾òö\Ş\Ø\r\Ì\0œ\Ç~\Ù?—ZßŸO)z\Ú=­¡{\ÉFLŠ)œq\ï]U\Ã+¨À2»™¸o•xÿ\0¥\\ñ\é«\ËC%Fszjr²M\nC·\Ì\ŞÄ²<R=C\é[\ß\ruY¡¼m*m²Ar0„{úUı_\Âh©´\çşZ\r£$ÿ\0À	ü\Øûb©C\á;\İ*D»·wó#\åK\Ó+’­j)¸ó+³j0«N¢mht~*Ñ´\í|\Ñq*\Ë&O”H*?W5m(–	%FŠpXv<\Õ_j·w÷-\æ\áp\ØV9\à¯?*\ÍĞ¯Í›?\êO\ßV7j…Aû+\Ş\ì\Ù\ÔNv\Ù$2( ‚	5z	Hİ€Ö°c½·‘Ä–ü\Äİ‡Q[v[Hb0A\0Œ\×%H8\îc+œşğ¯\Ç¾P}ú\n«{#Á¨A\à21\Ç\İ\É?¦)\Òn\nH#Œ\Ø5‘\ŞidyyA@H H\ãóü+Ñ¤¬\îq\ËUata5\Ä\Û÷+&\ß\Ş+¼@?7\åü«F#Ê²²G\Z\0\Í\'\ŞU\0c\0\àc\éU4&šxnw\"ª\Â•\é\Ãr?\Ç\ëTu©¥†P°\â\Ş6\Û!F\Ï?\áœf´»”\Ú&\Ê0¹©{>£©›x²‡À\Ù\ßò¯lø= ´V\r-Ñ”f\ÖrUO^+Ë¾„‡\\·¸™Wc¾\İ\Ü¹?\×\Ò\Ş±0h\Ì\Ö*\'W$¡\0\ç¥r\ã+¸\ÍQŠ\Ğ\è\ÃQRµ“<\ÏÀºG\Û<y­js&IfX‡$’	o ^?\Zô«¸Í¯–­ó`œb®\èšE‡„¬®u-NX\ÍÌƒœª‹\è3\×\ë\\®±\ã\ÍR¹0\Ú\Ís\×?5qW\æœy¥¿o#²“Š•£·sGQE»³(ª\ëÓ½`kL«Ç€@^N)\Ö\Ú\äR™£G3‘\ÔT\×WZr\Ù+\Ëp»C@\Åp[S¥­\Zø‘jR\Ó\í\à`\ä‘\èx¨¼1} Á\"\Ä\ÏvAW0\àòO¦Óz\è> ­•Ş‘r\Ö+(U\'jzWXj—z\\ù¶”¡V\Ë)\ä‚?‘¯U¡\Ë{4xø‰*Uyº3±½²}:\ì„Vò\å®>µ¯a+˜\Èn0:õ®|ki®-¢\ÎfŒ\ìo›#£õ®“O\n.\âTg=©b/¹÷*šR»‹\ĞÅ‰Œ’°U\È ğzVÎ§ ˜t˜.CŸ:Uó\0!HÀüúı+\n\Ö\àG•\'{\ĞU\ïê¯¨•–&a®Ó£Œ}zÿ\0õª\í\'4–†1i-L`\ê’<Ï—\ÆW#ò\çÚŸb\ÛIË¾C–fó\ç8\éø\nÆ†\á¥VgCû±”Q\ÅKk}#\Ä?\Ä\ÄghÏ­u:n\Æji³{Ã²uX\íÊ´q4 †ô9ÿ\0_Ox#\ÍÓ¼6#¾±¼m$0\Ü2G+Àşøiu\Ï[4…£´0=K1\ãŒt\éÖ¾¯µĞ¢\Ùcl2‘‚¤dW™ˆŒªV^Ï¢\Ô\î¥R4\éZ}OñŞ©¢\Î^[\Ğ\Û0\ç–ü‰ı¾A®\Z6\Îk˜BY’beW9Ï§\çõ¯¡¼[\à6ñû2.Şˆˆ»#Yşğ¥´Zœ3\ÜCXc@ƒ%»\ÇJæš”&·;#8N.}?ŸĞ¾Ï§\Ú]I\Ên\äŒaXŒ×„x‘\Ş=NK=C\Îf\ÌeK•½ûWØ«0]CH+A_?ü^ğÑ°ñz\Ş\\A›+¾VLd\äV´Ta.m\Îy9N6g›H#\Ó.v¬°ùJw+œvôÁ\í^s!i%‘	\'\'ŠõióEiz<…\ã,_»q^f¿)Ü –\'§l\Zõ0/™7{œ\İÒ±kF»[YŒ¬…\ÓiV\\õ\è:eú\İ\Û	PoSÇ¡Zó«x\Ã‡cd\à\n\ë¼7º\ŞÑ•O\îq\ëOJ3W\êE\n’b’	\Î08÷¦^º\r9UA_—œ~=jWG\\\æª9YXI,\Êr9õ\É\ëŠ\Î*\î\ãN\Å	/¯J\Øy©\Ïpx\Çò¯GğÇ…<D[Í§¤¹\Ş\ãtl1\Ô{\çµq^°ûAğ\àMÌ¨\Ù\Çp\ï_GxGY\Ñ\í´øN¥ó¶\îA£Ş¹s\n\ÓRQ‹Ñ˜*qq\æj\ìŸG\Ñ Ğ¯lš\Ö<\İI\Î	şÒ½\ÛShm\Ø\Ìs·¹®z+˜¯`\êˆ\ÎY|gÛ«ƒ.#9	\ß\ëÏ£9A¹&vT„jZ-®õI¯\î`\Ü6Â©½\Å\Ä3,Ÿ•@\ïW´´†q\Æò9\É\æ«\ëšõ†e4\ì«4‘U\Ï\â{V’N^ó–¡Ì£\îF:\Úß‹t­D}B\àÉ¨O€¢–#>Â¼\ï\âW¢\Ö\Ô\ØEh\ÉW\Ü\ÊAVö‘\Æz\Ö\'¼}ı§$­§\éğA;.\ß68Á“¦9|f¸)\"¾µò.î£—Ë“€\ÇëƒŸL\ÖĞ¤\Ú\Õÿ\0Á3”\âµK_\È\ê\åœK§4r\0H\\~\å2i/ö¢–\ì¤pH$g\Ü× \ê“ù6ŒW0À\År ¹“p85Ó\æ‚mu9qj-¤úÀ\Ñ\Ù\0¬dÀ`³©­¥dg\'\æ\Î9B\îO0ŠCÁ\ÏZ\×-»Œy\ë]\Ö\ê\Î[ôF”\ZD\0\ã9¦5Ÿ—v’n\ÇÍ“¸ğ\Üsúv©\Ö Àb2{f¥¸š+x>\Ğÿ\04˜\Ä@ó\È\'ó\Ç\åXA»\Ú$½\Øù¬f±¿FóöP\ê\ÍĞƒ\Ûÿ\0\×]\çƒüaf‘I§\ë¶À\Ä\Ü\åşe\ë\Øöş‡¿§k|u\Ø,¢ù\î·q\Ç+\Î\Ş;ó\Ìz\ÕJé¢¸X\æŒB\áv•şyÁNŸ?¹ …G\Í\é]Ù¦šØ¸’\ØÑ°9\0Ÿñ­!gU*H\'œŒ\×ËñE\æ‰r¼†0Í„\åü+\Úü3\ã\Û-b4Šó—]›øÿ\0Jòj\á\'I÷G«K\Z¾L\ìu&’\Ú\å±WÚ¸\è¼!}$òÿ\0l‹C.r|£!üy×Š\ì®Y¦‰A*\Üp\êsš‚iL`§Ó“Y\ës¥«­O2¹øye§FÏ¨kn\î[…Š,gó5\Æ\Ş\ÚÁ\róÁÄ’¨;JÈ¼^\Å\â½\İ\ã›Â­\Ï\Åy>±¤>‹|²Op³, °l`\ãŞ®r•›Ô—&£khsş+pŒB@UP\Ç‡ù5È–ó$\Û\îr­Mjí¤Ÿ\ÎR¹lñ?\ÏJÅ”0I#$d\à×¹†‡%4™\ãW—4\Û-QüÃ¯jtlC19ü*¡bW\ÉÀ4ø\ß”$v\Åj¼ˆzöğ\å	9-\îs\ÍfkS€\ît\Â€Ó¯ó©§¼ò\íŸ$†\ÚH\'¿V5\Ğf.»[<gÒ¦”u¹It\"³½’\Îğ\Ëò\n· \à\×Iiw¯f!¼l\Ü\'\İoOz\ä®#@£9\Ï\\ŸÖ–\Ş\æKy2ŒTã¨­gMKÔ˜¶ŠKV†\ä%À\Â(\ä\æ?*‘.\î4\ÉÀoˆò	=~‡±­-Qµ\Ôm¤·¿Œ=\Æ1\Æ\Öõÿ\0\ëV¦££¢\Æm‰I¯{ş™ÿ\0=\ë\ÚH¥S[_QúÄ½CL\n±\Ê\ÓD?‚N\Õ\×\Ú|Z·Ÿb¶\íĞ«&F~£ú×ˆjv3iòA\Û\Û\ÜTb\â&‡k\Æ\Ë \'\æ²\n”\Õ\Ñ\ÕeX\è\ÙëºŸ‹\íõg[\Ø\È\Ï#¥sş4ñö‚‚7Ë€AÀÿ\0=\ë‚UH÷$•íŠ—t\Ò>\æQŒ``VpÀBR¾\Å\Ï)F\Ö•gqŒu\Î3R][†ˆ*ƒr\rJ¯µØ©9#½Z‰’HŸ ¹#®zW[v9\â®õ*Y\Û«¸§\æõı*\Ä6\ì©ÙĞš|•N\Ğwg®iÄ–‘²HtVnN\æ–Ğ\ê\İg·¸$\àª\çø¬2\Çk©*J’\Üû\×e!¢dU\r»ƒõ\Å]\Âö\×2#‡Ö´]\îZ›Üy)ƒ—\Å0y\Æ;R©ı\á<cŞœq\Æ+r	-n^\Ú@\Ñ>\Ò9pEz‡uˆõXü»\çıò\ãcwú}?—óó–=\\\Óe’;„x\É\éS8\İ	\ÅHô\Ûø!»*ø#1\ßİ¸<ûŸ\çõë‚š\ÙjDü\È\Î\n¶2=*\Ò\ÒeX²Û€cºAı+F\É!š\á\á—tp&9¿¨$}}k’WŠv.×–{œŞ®,­AxšŒ¤{>œZ£.›rQË½>\èU uÿ\0\ëWau\à­N\âğMc¦Kqh\Ç\n\àP}Iô\ë\×Ú¹Oiš¶“\ä\Ç}\Ã#k®J’3ü^¼š!>f’f\ÍY\\\Ë{Ib¬\ë€y\êjı­²À\ßÁNx«\Ôc¿…\ì\ïv†%‘\È\Èx\ã\Ø\ã¥M%\Ù\n¼C2\ãÂ•I?…\îiNÛª*(©^9=x¤L’ˆIø©	)\Ø9\ëMd¬\Æ¸\n\Î>fÍŸÿ\Ù','image/jpeg','delacroix.jpg','Eugene','','',0,0),(5,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0e\0\0\0€\0\0\0õ§ş\0\0 \0IDATx^´½y€U™÷ÿ9Uu÷Û·o\ï{zKg\é\ì	Y!!,a•UAPqwœ\Ñ\Ñq\ÆepFut|ñ•Ae“%¶ 	\Ù\É\ÖI§Ó\Ş×»\ïu~œªº7\à@\Ğ÷÷t:÷Ö©³>\ß\çy\ÎssªZğÿ­º\ì=mÑ¡Ş¿\Ë\Äg>9wö\\º, ‘L255I2™¤ %ù\\d*…\Ç\ĞX8g6\×]º‰ûš±‰).Z·šš\Ê0zz©‡ø\Äû\ß\Ã}<Á»\Î_\Ï\à\è\ßû\Å=\\r\îj®½\ä\â\Éÿu\×ı³f\é\"\îÿ\Ó\Ó\\~\ŞZ\Í\ëbó‹¯ò·}˜d:\Í¾ğO,\íÃ—>öA~÷\Ø\Ó\ì<pˆ…s:9\ŞŠ\á±	n½\áj\\†\Î#›Ÿeß¡£DIÊ‚!—M\Ô\×\Õ.322Ì}»I$R„›;\ß3÷\â¾\ï+Î¾O\Ş	\éo—\áĞ­w¿¨e\Çú$\'†?‘KDo¨­«,^¸ˆx<Á\È\Ø\éL–¼Y`zz\n!\\²a-7¿\çjnºöJü~?A¿Ÿ“ƒ\Ã4\Ö\Õğ\îK/dÉ¼ÙŒMN\ÑX[CYÀO]uA¿]ûQ_WMwW;ùB\×ö\â\ä\à+Î£x·\ËEGK;÷¢¹¡Ÿ\Ï\Ë\ác\'—•±z\é\"\êj*9{ù\"\Î?{%¯\ì>\0Rrù\Æu,š7›õ«\ÏbÅ¢¤’Iõ\Çp»\Ñu\Å&¿\ßGE8LÀ_Fdfš\Ø\ÔxGrr¸oıÇ¾\Üÿú3Ş†=gLÿOA\Ñ\âÓÉ±¡K]=g\ÎÜŠ\î\îL\ÍL355I>Ÿ\'‘ˆ“ˆÎ°vùbşş“\áŠ7\Ò\ÖÒŒa\è\ì=|”\á\Ñq®ºh\Çúhkn$O²lÁ\\ö\î¡\ï\Ôó:\Ûğ¸İŒLL\áv\ÔUUñ\Úşƒ~ö\îaAWµ•x=Ï™Í‡ñz\\³j\ÉÂ¡2tM\ã\ä\ĞK\ç\ÏEÁ³/\ïd\Å\ân\Ö,[ˆ&š®SSU\É\ê\å‹	|¼²cšf`J“X,F:!\\¦®¶©\é\Éú\Èøğ‚\ä\Ä\è\à†\åø§2ßGgB\Ú\Ûe8Sº\áö_†’\Óc\Êg’K\Û\Û;‚]]s\Éf²$	ò“™™‚ƒ\Ï}ôƒ|\çËŸgñü¹x\Ün T…\ËÙ¶k/\ÉTŠ\Ë7®c&\Z\ã§w\ß\Ï\Äô\ÃclÙ¶ƒt&‹–ÎŸCmE%‡`óK¯\Ò=»ƒš\êJF\ÆØ´şlj*\Êin¬§¹®†ŠPˆ-\Ûv0»µ…×®\æøÀ \Çú\È\åò$Si\êjª¸\ê‚õ\èBH€\Ï\ë\åı\×\\É‡\Ş}\éT‚L:M6›cff†“\'ûI$’,\è^¨ü\åSıG¿Ù³\åk>vÏ¶·f\Ò\ÒÿMy\×\ß}W;ğ\Ğ/¯\ÍD§¾\Ü\Ô\Ğ\\?w\î\\F\ÇÇ˜™&›\Ë135EK}\r\ßş\ÒgY·j9ºa œ\Ò\ê›\Ï\ë\å\à±\ìzı0k—/\Æ\ãvq÷CO\ĞT_C6—cÛ®},[0—²€ŸpYˆŠò2^\İw€}‡±b\á|j«*\é\íd\íŠ%4\Ö\ÖP^ ­¹\Ç\ÍË»öR_SE[K#my	M,\ëK2¦£¥™ªŠr«\'„@ˆb\ï\æwu.òò®\İ\è†MÓR’\Ífğy}T\×\Ö095Q“ŠN7ŒÙ³½±­kj¸\ï\rıÕš²ú²\ë´Ş­\\–O%¿^]]]¿h\ÑB\â‰8‰xŒ¼Y ±xN\'?»ı\ëÌŸÓ‰f\ÅAB\"€€\ß\Ëgo~õ\ÕUlÛµC×¨®(\çxÿ)¦\"Lir¬\ï/\ï\ÚÇ“/¾DeyC\Ã\ãLGbœd\İòE4\×V‘ˆÇ¨®#T*M×¬f\Í\íd÷\ëG(L†‡ñº\İhšFe¸œ–\Æ:«/ …)Kú&ğú¼¼ûŠ‹ù\än \Éf\0p¹t—N]m‹,\Òd!Vjrôk\É\éñ\î\Û\î\ÙúWñõ¯*P\Ö\ØÙ‘L\İl\èZ\ãüy\İ!ˆF£ ‰Xœö–¾ø‰[(•!\í’\Âù”BIiÀ\ï\ã\Ã\ï¾¯Ç\Ğ4.>÷lr¹\åÁ B\n&\ÇÆ‘™/\ï\Ú‘	\êB^¤”\âI\ÅX7·\rw*N\Ïë¯“›`ós/\Òs¢K\Î=›X\"A4§\"\\N[s#†a¨>HY¢µ(0$\ê\×\ê¥\0®\Út\ï¿ú2R‰…BBÁDH\Ğ5\æ\æYt¶wÔš™\ä¦\\:ş£\çø¥…·\İı—›²¿\Ø|\İôŸ\â\Ñ\Ì\Ê\á=/~Qùşó\æû\Z\Z\ZŸ˜ •J‘J&Ñ„\É\íÿğ9º\Úg)\Ó\0j„‹\Ò\Ò\Z\á \åózhojD3\Ìm®§\ÚkP\å\Ñ\Ø\Õ\ÓGm\ÈOm\ĞËƒ\ÇY\Ù\ÙLg}5;ö‚i²fvµ¡\0>]\ã±m;qI“T2\Éø\ØgÍª\'‘NSQ$\\d\áœNü~Ja\íY$«_%À\è†\Îü9È‚\Éö]ûp{<¤3’‰º¡4\Æ\íñ\'\'\ÇÛ4F‡zŸ?u\ä@œ¿€şbP‚^w\íT\ïÁ¯™…\Ü\Ísº\æø;::™™a&2C¾P Jğ\é¿sV.GM¡\ÂL\0„5b!„3\Ù€l\Z#“À“I`\ä2Ô–¨ú™ŠÆ‰&S,\é˜\Å\Ş\Ş\ÎY0‡\Æ\ê\nB>‡†Y>»•‘\é(e>/[ö¦P0Y\Ñ\ÕF:“evC5·W!Ãœ†\Z>h\Zèº£¶X¦\Õ6±\Ò\Ü.7‹\æ\Í\áX_\ÇN\àõx\Éò\ÄbQò¹µµuhBc#\Ãa¡\é\'FN\ì\å/ ¿”µ\×X‹:ñ±tl\êóm³Z\Ë\æÎ\Çôô4\ÓSS\ë¸jq77\ßp-^[)‚Šm@M¨R*€d>Œ\Ï \âQÈ¦ÀT I!q\é\Z\Í5UôŒ³i\Å\"\Ñ\İÚˆK×˜U[…iJj\Ãe<üò\Ê>†&§™ˆ\ÅY¿h\r•x=AŸ‡€×ƒ!$\"“l¤D3\\\n»cRœ®%§&\Ğu¶\æ&v\î\ÙK$™\Äe¸2¹,\étš¦¦f\âñX0:3™[x\á5‡Oxm\ìM|z\Çs\Ê%ŸøŠ7==ymbzìºš\Ú\Ú`WW£c£LNMR@’\Ëd1¤\ä\Ö÷½‡P ¨ÀÂ’8k¬\Å1#„\ÄÌ¦aj‘ˆ™W„@‰&Hú\Êrn½t—‹+V/%Ÿ/p\ç“[‰§2\\¾f	á Ÿ™x‚]=}œ³ ]\\šAy\ĞR 	\r­„\Ù\äsˆ\è4\æ\Ô(d³N\Ç\ì\Û\Å~J4!-T\Ôü3·£/}ò£²i2\Ù,B¨…¥n\ärY:fw¢	.\Ú÷òò[\ï\Ù\Ê;¥w\Ê\É\íOÏŠ»\Õm«\æv\ÍÁ\ãñ’\Ï\çUŸM“™\è\ë\×,gngûiÌ·\04¡’\È\ç±(\ä\Õ\ri{@¦UX‚0‘\Ò\Äm\è€IGC5\0û‡x\ä•İ€D\× \àórlh”®¦::\êk”7…\Õ`é¼TVJHD.\Ñ	\È$•\æ \Ö/„T\Ú\\Z\Ü‚eº¹t\ãz¦§&)\n˜¦IY¨Œòòr‚ş\0º¦{A.JM¹y‡ôA1<¾\ë\Í|¶»kv—ğ—1<4L&“™l¯\ÛÅW_¤\Ã`‹\×*Ò¾.\ä 2\r¹´J—6jV^\Å§miqF\×5\ìõ\Äş¾A&c	¼ns[\ê)$!Ÿ\ËW/\Æ\ç6À®Ç™Ì¤SR_	ù,D¦ ›qú¶\É{Á‚	š®ñk¯d^G\ÑX”L*\Ã\Äø8\ã\ã\ã¸\\n\\.\Ã\Ğ4mUÏ“÷\Õó\ér\Ùn¯^W4766’Í¦ñı†€T2Éº³–\Ò\ÜPØ®¦­¨I]\ÚRh\"b3\Èl\ÂRi[«”p\ÅI8L©\r\él¬Á”Ó”M°n\á–t¶\0·aX¦\Óf²°„„’Å¡úTŠ™GF&\Ö:Dya8÷­*l™)i¨«\áı\×\\A!Ÿ\'_È£\r—Ë…\Ëå¢¡¾‘l2\Ù<±wH\ï”H\Ïb¡i\Ë[gµQV¢¢¢!¡`æ‘€’u«W\à÷ù¦*©tdÎ–[d2\n\éB\ng•\ÅlÒš„Àq\n@\à÷zx\ï†Õ”T[BBeY€+\Ö,LKº…\ÃLµHu|¾bcVûH(\ä!6\r…¼#Jö(À\Ò\ÒbEš¬_³’\ÕK™‰\Ée™\Ì\Çimm¥,l\Î&#¸\æ+?l\ä\Ğƒr\ËOh£w,ôzİ¡p¸)%S\ÓSLNO!óñ8³ÛšÙ°f•\åU•hŠP’¯.…šdSqJ\Ô\0„Pö»4\r,\ë%‹\ÌEbG\ê«\Â|ôb5ù[úG\È\ç\Ã\æœ]—Ó¶u-­“B1YH\Åól€”!%RcyŸ—O~\èF„¤\Ó</Á`PY\İóx\r!6{ö›xtÆ L?X)\çø|~Ê‚eM\àr»\Ñ5\r	\Äc16mX‡\Ï\ãÁm\É´ —|^%–\Ì ‹\æ,3£¤SH+ki$\Í5•”ù\ÜQ²2E–\ÂQ\Ô\ĞP™\ât­D:‰™\ËXfOZµH§\"[6¤P\0·65p\áº5\Ä	¢\Ñ£c£\n\ÊBex¼>’£õù\ÅSgHgJ\ïu\ÈB~qMu-¯iB2‘$ŸË“\Éd¨¬q\é\Æsm¡a3R*»I\áÌ¦6\ÉRi´&c¥m§‹\ÅFa–°,şZÀ\ØÿŠFÕ‚iİµ?-\×À4©\Äi\Ìq“684©\0s\×]z!U¡ ù|™H”\á\áa<n·\Ím\\<\Ù{°š3¤3\å¼\Æ]\Èe»ùœ¿¥¥¤\Ói\"‘&’t:\Íù\ç¬&\à÷¡R\ØCy/­I™M\Ùw›\ÒQJ\ËdØ©\ÒşUuØ“µ},\æql¾O”Hµ#\Òù‰°n\Ë[[\"¹¬rÓ­fŠX¨5—”\nN;uNG;Kº\ç’N&‘H¢±‰dŸ\ß:q0\Ä\Ò\ìõš…Â¥>¯¿:TÓ‘iò…R‚&$K»\ça\è:E“e\Z±®‰|L%İ%²V\Ñ8•Û¾\ï„bDQ\ÊXõX•Ye‹sˆİ¨š\â>8u«\n$öºE\0\Z©@\É\åT~iõ\ß\îõ«‰b‚\×\í\æüµ«H¤H)\Ñ\r|>OyYˆ|.=´«–3¤3EI‘\éw¹\\n¡©‰/Ÿ\Ïa‹`¸,H[K£cilrC	\0©Rc\ZHË¿‘¶K,S\áTfI½BM¥û¾%Æ¶—¤’K\ælÁ™5„À¶…v„Z\Ú\\·²H)‘™¤S‡\İ%Ç¬R›f]­_}~›B6‡\Çã£¡¾p¸Ì‚»Mo¹\ãIÎ„\Î—Ç‹¦\éyú1[ 8ğû¨)\í–] &\ÑR2\È\\V­\æ…À6\0¥XÊ’ÿ‘od.\Ø.¬\ÄZwX5Í“\ÅXa\Ú‹\×\ÒR\"?C”üoÕˆÈ¤˜VX\átXHeşL\ÔX]nógw\ÎdÈ¤S¤RiB¡2@TzBU«Fö¿zF«û3%›JT&#\Í\ÎFiš\ÎL³ LE\ép$kN\È\åû|t¼\0lóuº\Ì[¼,®7ŠRoU]2yc1\Ì\â¹C\Â\êC1¯ªEØ \Ù$\íI\ß\Êeæ™´uEd°‘=}¼À²…ó\È\æ²\äy†G‡1\áò\nojzü¢±#»*9:#Pd¡p‰¡Íµµµ	ñxœL*mù-‚x*M$W\ã¦\Øo{Qg\Ût‘K#d)K4\Ä.`k…\0Ç´8µXœõ£\îY Jk¢\Ã\\$­\Î\ØfI%­µ§J:j\İ\"\é¤… dNS\äŒBûQWSC>Ÿ\Ã4%©TŠh,Ê¬Y-˜…\ìl_¸j1g@o\Ê-?Òˆ,	‡\ÃõUUU\är\êğ€\Ğ44k~\Éds\Ä\ã	À–\ê¢DZ‰ %2—£¸±õFCl\0p\0°a–òt]TŒ*\Â\äPI³ö\ïL\ì¢X¯xC^\ì\ê¥\0i	C6«¶(j°f]\ÜÖ¶û!¨«®¤`šhºFeE]\×	‡Ã¸\\\îú\Ä\Ä\èÎ€\Ş”™S=\Õy¾\ß\ï\Ç\ëõ\âr¹hll¤¦º\Z—K\íEd²9bñAI?{…YP{p\Z(Å ¥õ«8‰5\îÓ€P|=}ş\ëÎµƒƒ´¡.¶%­vN_¼–\n\0!\ÔVB.MQÀ,wZ¨\ïv\í^&Si4!0MMh”‡\Ê1t·a‰Ïœ‘[ü¶«\Ì\Ô\äXX\Ím¸t]¹y\ã\ã\ã\ÌD\",3”\Í\æˆ&•§b•’+)2ŸE˜\Ê\Å,N\Ğ\n \åy‰biiWb·m«2%õ\ÛQY’& ¸Ò´¯qÈ©\ÏF¦\Øa«.	h–œ˜I#½\Å^ªJ,Q(‘Ä“ƒC\èºb\ë\Ôô4º\ËÀ\ãò\àr»‰L\Õqô–šr\ËOhƒ»_\ì@š~¯\ÇÀ\Ô\Ô\Ó\ÓÓ˜¦‰\í\Æz\Üõö9û*Ò’¦R+%Ò©\Ó\Ã€q¤{\ĞòMŞ›rYò\İÉ­\Å:JòY)¶3awÌ\ÜA‰fK\ìP„\Ì$…<RbõI\ã™V?lAÛ±÷\0n·\r¥-\ã\ã\è†AY0ˆ®\é³\×^û¡·W\Ş”]÷üGe:2q¡i¡\Æú&¤”D£Q¤õƒ¥æš¡31=MÁ4AJgB\ÄfœiB.s\Z&o$›iPvAµ n`{f•šÁÓ’N³ôZñ[:Ro\r\"L\Â\á´=À”\È\\FeµÁù*¯\0²¹‡zzñz<\Îøe¡@&“¦±¡	\\;\İt\ÍŸ¿\İ\Ë[\Ğ[‚\â„—\æ²\éõ--³¼\áŠ0‰D‚\\.‡®\é†\Ë0\Ğ¸tƒŞ!\Ì|Á\Zµ-Mj¨\"—³\à \ã±U:Œ‡\"&\ÎD/Á\ŞEt„ØºgŸ†qğ‘¥\éª.[km&;F\È\æ¿Õ†â´©dI5]\02\Äî š\Ô\ÕwY2”½¯&™\Ì\àq{¬|*o&¦©©‰` ’ù\ìUG÷¾¥kü–sJ6]…)ç´¶¶!\är9jkkq¹\\†A<gjf\Z\İ\Ğ\é&•\É\àóûTaK\è@ªX—Y(jƒs\Ï\ê¸\Í:4\Å@›\áXst˜¢\í€h\Õi§;p”\ÚC›‘¥\àˆ\"x¬TKÒª\Ã\"‘\Ë óY0<jÚ±\Z\ÕJ\Ú~i\Ç.\ÜOQ „ ¢¢‚šš\Zt\İ *×¢Ã£µ‘¡¹¦hBÏƒD³rUTTP]]M(\"‘H055E>ŸG\×\r2¹§†Gœ\0Ÿ’tTó\Å’#©²tğVº%uv\Òb (¦•®À`‹³°\ëp\îH\çS%õ§”U®$›,™\Ğ\í¦T§`J„GØc““\ì>ğ:€ß®	)%¹\\M\Ó@uU5f.\ã÷VT¿e\Äø-A\Ñ\rw\Ò¦M…B±±1&&\'(˜¦º+@\×u†G\0¬ğƒ\Õ\İB²9Š£“§I³cVl\Æ¡Ê—XJ•v\Z“mpdÉ¥\Í\ã\r‘ªJ5I#ğöµú\Ïi\ÛŠ\â\0&­*ŸÈ¦Á4Ñœ®(À#\Ç898\æl\Û‹\Å\è;y’D*IUU5@·¦kyz\ëuŠ5bû`À\ä\ä$S\Ó\Ó¤Ä+\æsyB~‹\æ\Íq\Ø-±&\Ê|L‡§\ÂY\ã˜)‹\ró…¢È€R.J~e\é:Åš?¬KqZ]%\å±+J¾—\ã\ÈXu\0\È\\\ZY\ÈaZx)¬…|m;ö(!E3j<\Éd’¡\á!\Òé”ª¹òô–sŠ	y€L&£\Ù\Å\ãŒON”$$\étŠ+.XOc]­•b\r	iutpFn›GSNMhVYd²\Í]‰\ZH\éZ(‹ Jk‰hw\Ïó´‚´\ê²\î\É\âv>RZı’com&K‘IƒË«òc‚Ô˜ŠD\ØòòvÁ \ã\ÜHû¡>\Ó\é\éŒò@5Ãˆòô–šR\Èf\ÆTg\Ú#£#\Ê\í¥8p3_ ,\à\ã\Òó\Î\ÅeXGzl˜²i5j«sE’\éqŠ¢¬R‘–€Ôœ´bh\Å\n}”h\Û\é÷­\âÒ©\Äb´p\êš•^\Òm…—\rDIª”N\à\Øf©\Ø÷\è\æ-$’)\á°*R®}q]$P›\0f>ÿ–ı[jJ.LJ©N«LLL\ËåŠ¦\Æ+‹pÍ¦tµ·:B--†rb\Ñ/\ï=À;÷‘\É\åĞ…\Æ\Ê\ÅóX8»¦tMGhj\ÃH\áV²~°í½´Ù¯nØ‹\ÖRŒ4\ë»]”zqö‡ú\ÑP\Zf\n˜@\ï©af\"QN\É\æšk«©(/\Ã\íÒ™\ÛÖŠ–Ï \çr\Ã\åğ\Âğ#-s~š´û\'\Õ,Z\È\å@Ğ¯{¼#¼½%(šTª‰\Ä0\\.;‹rQóù<²\ç}W_\Û0lY\Ä4Mz÷ñ\ØSOó?ı#“S%µ\n\ì\ŞV”™\İ\ÚL[c=«\ÍgÉœN|^\r5•4\×Õ û¨³%\Æ\ÖV¦\r\ê‡]›²\åB”²\Ó\"£˜\Ò$L1<>\Å\à\Øzzy\äùmdpô¦ùÍ´zñ|¾ò©\Û8\ïüA’w]pwşöd\Ò¼>Ÿ\ÕT‰@’\éH?º\ç•ÿ¥z\à\í@1\\q	C™l¦\Ñ>–šŠt:Í¼\Ù\í4\Ö\Õb\"“^Ø¶ƒ¯\Şş]v\ì\ÙO¡ğ\Æ\ç3‹ƒ\Å\Ùq\à0;\æwO=GE¨Œ²€Ö†zşñÖ›ğ¸\\T–‡\èİ¦Ê•ºZÎ˜E1¦hk•\0!\íPˆ)ˆ\Æ<ö\â+\è†ÎƒO?O\ï©az‡‰\Äf	½º\ïÿ\Ê7ù›ôó¹\ÛnÁ\ëõ\àõx¸t\ã¹<ğ\Ä<^¯3\Ù+Ï´\Ø?*<­ó–\Ş”dd|M›ˆE#`\ÇHeÔ‰5€j&OğÀCòß¿ü5™D’›7­\'\0Ê¤\ÄR)\ßwˆ\ã\Ã\ã\ä­C	¥41\Ñ?<\Æ\'¾õ\Şù…LG£|ş\×\ÓT[‹¡k8Zc‘»ö§\Ê#,M‘Hñ\Ô\Ë;85:Î³;öğ¿‘&¡€Ÿ\Úò2µ·\Ğ\ÕT¯N\î»\Õ1¦L¦À¶ƒG¸÷·÷“Î¤ùòg>‰\×\ãa\íY\Ëxâ¹­\ĞÚV¤\İ\'R¢iš)\Ä[;½o	JÍœ%Ñ©\Ş\×G2™Œ\n¢I5DµÛ¨!Y\Ğ\Õiy-°÷ÀA\â‘(_û\àõ\Ôz*\Ë 6»¤\\½v%O\ì\Ü\Ë\ÑSCô249M*û\æ\Ç\ĞOs\ÏcO³pvwüş1>x\å&\æ\ÌRGR\ÕÀe\Ñ7°\ÒN3U87\Éfs¼ºÿ†¦ó\ÚÁ£ojK\×4*‚~¶Ï¢«±\å]\í,jk¦*T¦G88«ú.>k1ƒ“\Ó\Üÿ\Ò¶<û›.\ÜHWG\ru5MFp»ß°\ëkip6›E÷ø£¾ªú4G¼©6½%(¡†¶\ìL\ß\áh.Ÿ+‘:5\Ï¤ \àõx”HJÉ¢ùsY½b)\"“%>>BüT?\éX¤¥\ÊR\Ò\ÙP\Ë\'.¿X*\Åd4N$™\âø\à(C“S\ì:\ŞG*“\Åf¨’ñGzO202F×¬f‹-6\0)‹\ëm¾¥\ÕcÓ”ô\Z\"“Jr\éYKBb–šjª\Ë\Ëh®ªÀ\ãvQWQN8À\Ğu«®¢],\ÖAcM·]q!fĞ‹™\Ï…X8g6½Ï¾\ä€\âx„\Õ5AS\×ş\nM\Ñ=>S\n‘—öy\rKbÔ…IEyŸ\ßgÅ‚ <T ¹\ÜT;)oneúDñ\áa²ñ‘T†t¾@<“4p¹(+÷°´<\Ì2$\ï½p=\å~Ãš\à¥\Äp{h7\×yÁ\0X\n\à0Ì\Ã\È\â\Ê\\>‡ÿ\ÜÇ‰NL2qj)M•GJR¹<3\é©lH\Ödf*\ê4¢!ğ»\r.A¯Š÷ş\0pşªj¼•5€’\ÕË—ğÀ[(%i	¤@”O\Æ+§zşr—XHiU*1±\àK[£S\Î6°³÷m$—‹t¨Šİ‡û8p ‡t.\ß\ç\Ç\íñ \áÂ”y\Ò\É$£S3\ä¥IMÀÇ¢\Æ\Z\æ\ÔT\àqi„ªª\ĞtûO‰)´¾p\0²a‚R—Y8ı	VVŠÆˆ\ÏDH\çr\ìš\àõ‘IfRY^•\å\åA¤Y Ë£k\Z\Éd‚T:MÀ\íbÙ¼N–\Ìï¢¶¥	Û¦9©„–\Æ\n…üi\ÎPiÀ\Óe¸H\Í\ÃÿFo³ó(¨³Y%\\\İ\Ñ4b\É4S‘\Çf:*.!–Lñ\ì\Ë;x~\Çº:Ú¸ü\Úkh¯®À\Ì\æ(d³\ä³9¤iª\Í2\Ó$ŸÏ“Ë¤920È\ã\'\Ùzr„ùõU\\T\ßH…=À¶;b©a¹\Ì\Î\ä/-\Ã#\Õ1!M\è¤=>\ë;\Ì\Ññ\Ê\ËB¬]¾˜y³f\áöz0M\Ó\Ñ¡	tİ €\n\æf\Ç\ëGy\î¾?ò®ó\Îa\é\Ây¼^l1šÔ£(ù|^-$mÉ‘€”d²t\ÆW^™\å\Øñ7Å¢7rş\ß|³1›ŒT‚$º‘hRJr\Ù,WI4\Ûe°ÿ\Ğ1Ö¯<\å.«:&¦g¸\ç¡\'˜‰\'ùøodng;²·N³+>šy“\\6C>“£`1¯kjbİª³8>4\Ì+¯æ§^\â½V1¯¥‘¢³¥\Ï1\\8\ëg\ê“ıD˜\Ô\è\á¾vRW_Ï‡\×o ½±!!’Ja\nõ<£Š\è*­€À\Ğ5\Ê>jª«X½j%=§†¹\ï¡\Ç\Ø}\è(7\\¾‰š\Ê\n\Õ¡$\Ø1=…‰À”&\Ñh„d:‰;X9¿ªú\Üy+ı¦DóÊ§ù¯¯\rQB\Î\Îz\Ïm\ác/=qSbjôÕ˜„./¯ƒ•uuµT„+”òYŒ\Çb,™?›şó? Può\Ô0÷?¶™\Ö\ÖV\Î_w6µ\ÕU€$J±ó\Õ\íM’\Êf™‰YO3K‰\ß\ã¡,\è§\Ìï£¾¦ŠYõµı>\n¦\Éş£\Çx\â…m\\¼|«\æv¨ı¹|S\Ó\î\ÂD26¥¶¢t·6\Ò\\]…K`1¸\ç\Ôo\ß\ËÆµ«\é\îlGŸ\áH\ß {÷+\äUTA\ìG2L)ñy\ÜlX¹”\Ås:Ñƒ\å`¸\ç\Ú\Ì\Ì\Ì4½şj*\Ã!‡›«\Şu#•U\êP‰´48\Z‰06:J6Ÿ#‰N$I{5­I)«\ê\é:\ç\â»wüî¿­\"4;\0\0 \0IDATg¬j\à}?z\Ğı\Ä÷¾ôÍ©c\íl›U\Ù\Ú\ÒL6›edlœÁ\Ñqªkjğ\Ô\×7\à÷\Ìf2 sü\éW?\Ã\Ğufbqş\ï}¤½£ƒ\ë.·É°fß½¯b\ï\Ş}´5Ô‘\Êdú}\è–u\'\Ó$Ri\n…©L–T:ME(\Äe\ëW\ãq¹8\Ú\×\Ï\İ?Á5k–°¬«•¾‘I\îÙ²=\Çú©«,Wû\á\Ö\n­P0\ÄØ°hW®]NkMG‡yr÷.ß¸Î–fN³u÷~¢‰$.Ã ¼,€&4ª\Ê\Ëğ¸Õ³.…Bt&‡\Ëe\Ğsr€k.\\OUC3:HI._\à\Î\ß>@\"\ã\æ÷\\IYÀ&+¯¸\Ê\ê\ZI<gpp€\\6\Ç\Ô\ä™Tše‹P^VÀ‰zûú§*g\Íş\Å\Å_ü\Ş\×\îıô\ÕY`Ï£¿Y:3\Ôwıœ¶\Ê\ï}ã«¬X²ˆL&\Ã\Ğ\Èw\İ÷ myl6\Ãø\Ø(u\rØ‡(·›‰±)F\Æ\Çiª¯c\Ûkû@\ÓÙ´aERJ\Ü\Ú\ÒÄ¡\ÃG\ØüòN&f\"\äò§/uM#ğSY\"\è÷*¨\Úx\ÜnºZ[¸â¼µü\ê±\Íl\Ù{ˆScS\äL“[/;®¦Z„­½\ny\Éş¾S<µk?½>IsuSñ$yÏ•tZt2!J‘\Îd›`*%k\æ.\Z‰\×ã¡¾ª’s–.¤\Ì\ïGŠ\â\ê\Üe\è\\w\Å\Åüü®\ßr°§—5K!\í9Ä¢l6«b†\Ù\ÓH³À-ï»\Ï|üf*Ê•V\ïÜ³Ÿ/~ıÛ•\ÇNö]¿÷‘»l\×/øÔ·\İø\åt!\ßõ‰›? _yñœ\Z\Æ\Ğu:\ÛfqùE‘“{÷«÷ªH‰\×\çC\ZBrù•\ár<n/÷ÿi3\ç®^\É\Ü\Ù§Hu¨\à…»\è^²”+¯º†L¨‘| …@ılõ¬;{%+—/a:+ˆ¤sLG£òyÚ›\ê\Ñu\Æ\Ú\Zœ8É\Ìkn\ào®<ŸE\ÍT–	|„ƒÂ\0•e>\æ4Õ³f~\'GG\Ù\ß;Ày«WrÎ²E!˜Š\Æx|\ÛNFcIF£’\"€«¢	oU—]z1Ÿ¸õfôŠÚºñ‘›\ŞËƒ‡(÷¹™\Ó6\Í\çW„µDğ¸=\Ä\âq^|õ5\êj+™œğ\è3/\àõú\Ğ4t:M*•\"“Î \É¾ñU¾ø7·ğù™˜šf|ršy]d³9¶m\ß\éŸ\è\Øø‰~Y/«ijŒ\ÜZY\æ›ó÷ûq\í×¿û\ßşşø\Ó\Ó\Ïq¤÷\í³Z¸x\ãzòù<±t@0„.\Ôö¦\0|^{úØ¼õU¦g\"”‡B,]Ø­\Âø\Ö\ä/P‡\Ô\"©^x¸<¼vtŒt“5Ä’QY­Œ\'`Vg\ïºh#nŸŸra\Ùz¤ —Jğş\ÖP_Yıšò> 4„\0·\ábnK=ıS¬^ºˆÆšjµ.A\'\Ü\Ü\Î^\ÌX\ŞCZ£ù\Ã$yòš\î\np|$J<dùüZ[ZˆLN\ĞXW\Ëp„L ö™6?·•­\ÛwñÔ‹¯ò\Ô\ÖWñùıh\Ö\â\Ğ\ív‡©©ªâ¶›\Ş\Ãû\ß}\r\ÇûNò\İÿú9?¹\ãN\îı\İˆÆ“l:=?óœ\Ìkî”·,¼\Õ\ØıRe.•\è®nh1òf»vq\ï¿}•h\"Á7~ökşş}ü\ç¿ş·}ğ}ôú\Ïo\ßE0PFum\r†¦#‘¸4Á¬\æ&¦¢´45 i:\Ö\ç¢,dÃ¹\ç\â÷û\É’¸ü~ô@%\îL’t!\Ë@´@üx‚T´@[£‡úú:\Z\ë\ëcıM‚†\Ú*z†Fø\Şıó\Å.£.\\F±!\ÂZŸ\ÉÁşA\î\Şò\nºnP.wòT\Ö5Pª\"“\ËQV€¤\Ã\ëC-\Ğ?&Ş—DŠ2\Úıy¼.7\ÍMMThyÜ†=\å›!š¦\Ñ\Ò\ÔD0 ©®\n¯^\Äb16?¿•t*\ÉÕ—m\â½\×\\\É\àğÿïŠFù\î§o¡\Ì\ï\ç\ïüK.½\à<ª++Œñ\Şşî“»_¬6¦‡zƒ@hşœN^Ù¹›úòK\ç\Ì!¹û_¿Ì§¿óc¾øõoñ??ù>_ı\Ì\'x\æ=d<•bÑ‚yT„\Ê1M—fòşk®ä§\ãŠM\à2t+D!\Õn¡†Ntt„½û\Ğ\Ú\ŞA_06\Åğ”Q\Ñ\Ú\r²…<>W\æª\ÓSS\èù¡B\Û\İ\Õ5\\\Îd(>C.Wp´°Tz-tHe²ôL\Ğ\ŞÔ€\Ï\ëq\î\ç\Ó	\Æi\Ü^?U¦™À¥‡7\Î¬§	\Òt\Ô\ĞsôC,k­G÷‡`A¹½›\Ë/:ûöó©›\ŞM]M•³‡v\×ıò“Ÿıœ\Êp9Ÿ¿õƒ€\ä‹_ÿ>$wü\ë?R_FJ¨¯ñò\Î]ÌŸ\ÓÉ¾ƒ‡C3ƒ}~£¼~V02\ÒOy¨ŒÁ‘\æw¶ªÆ¥ \"\â\Â5+ø\æwó\Ç?=\Åo¸\êpˆ½ğ\î‹\ÏcÉ‚n@R(¨‹.`brŠººš\âœR©	ùyü\É\İ<û\ìs\Ã\Åt<‹¦»‹;ô|’GOí¡©¦‚K\×,ƒ€uœF-¾\"\É$n\ÃÀ\çqYl.]‹\×>$J‘³h+;\Zg\â\Ô0Ï¾v€\ÉhŒh4‰pù~K\"Ÿ\á\éA&&&¸î¼³	zİ–‰,¢o\Êø\ä$º¦\Ş\ìg±\r\ì\Ú{\0€K.8¦†z\îº\ïAv\ì\Ş\Ë>ğÜ†\n\âš\Ì\ïhepd\ÔzÂmACw{j\Úúš\Z\â\ÉñD	lİµoü÷¯˜‰%hª©â»\îe\í\Ê,š7—\í¯\í!\ÑXkŸ”QAÁ\î\Ù\í\ì\ÚwK\Î?¬Ğˆ\Í/)%^—\Î-W]‚ù¦=–7“&4C/J?‚`š’ù­T–•ñ&@A\Ìi®§¾*\Ì\È\ä4}ƒ#4\ÔT \ë‚y-\rt6\ÔR*ùERÀ\Ú5»¬\ÇÁ…iªˆX\å$y³Àö]{\é\îl\Åp)\ë Yı9\ÔsŒ`ÀÏ‡n¸Ş“üü®{iª©\â\Í\Ïs\Ç\ï\å«û\07Zo‹õ¸ıT†\Ëj5]¯Ö„I \îö¸imib`dP‹§k/\ØÀ½ÿö5~ÿıoP\Èe9\ÜsŒ•\ËTÿ¥\í;K¡†±l\á\\:\È\èøEê·‡L\ZC\×p»\\x\Ü.<.7n·Û\Ç\å\Â\ív;\é.—õ=¡ú21=Ã¾#=¼w\ãjn<o\r+”\"ŠL*¶\'ñº\r>ù®¼û\Ü<»ı5’É´“M\Ó·¡Úµ\Úwú\á6ğ¸]x­kg›:—Ašù’¶$\'úúyığQ\ÎZÔ­Fi\ÉE$§ÿ\Ôm­4\×\×q¤\çf6\Ã\ßÿşğ\ß\äk·~\nõ„#c´¶4Ù‘å¸¦Y-220$\'&§\è˜5‹ı\ÇO’Ì¤Y¿b	Ÿ¸şJf\Ïj¢¦²œMg¯\àñ-\Ï3§³\ê\Ê\n¶\íØ…Y0Q\Çv$BJ:š›X¹h><ú8Ó‘˜³\Ó&\Í¤’`?,dyR¥’*Eñº4R\"¥df&\Ê}\ÚLG}5×œ³œÎ†\Zû®õ©\ê“V_Ôµ\Æ\Ü\æ®Z»‚Ú€‡»yÒ‰\"\rªÒˆ\âfT	Ë¥•n“sZ­ôO\rğûÇ\àœ‹ikV/”°5\éõ#=D\ãqf··Q_W\Ë[g\Ó\Ú\ÔVVPSY\Î{/;ŸKÖ®\"•É°ÿøI\Úf5319	ŒŒôhf!ŸG\Ó\Ìı§X½b)7¾kfÁ~Y5\â2V\Ì\ëâ…­¯P³`\î¦¦g81p\nii‚Dy#\ç®\\FwG¿y\àlß»iš\ÈtY\È;õ\ÅxQ\Ô2\á´\'@ªè´”’\áñ	~õĞŸH\'\ã\\¿~%†f»¿ŠñHUQR»³?,q»tnØ°šdt†{}Š\á‰I\0G\ÍJ»\å¤:»‡\àô…\\–|6\Ëó/m\çW÷ı\å\İs8÷¬¥\èºV¦\ä\èñc¤Ri:Z[@ßº\Å]\ÖÎ©½—\"\Ğ5Á®¼”Ks¢ÿaòù¼Q5«+\éŸ954\\_YQ\Î\ß}\ä&d:Q\"N’\çv\ì\á\ßÿ\ç·\r±{ÿ\Z\êkxıh½\'û\éloU!~4º¦±a\Õ\nêªªØ¼\íUNôöqÁŠET—‡¬Á—\ÄzmIvZH,\Æ\ãÏ¿\Ì\áı\Ìo©e\Óò•”ù=N1)M2‰$Ñ‰q0%Ş²\0åµ–¦…‚ \Ï\Ã\Í¯\ã™\İ¹\ãş?2¯³K\ÎYM(X\\w8¶\Ç\ÑXK\ãJhddŒ‡·¾\Ât4\Î\å\ç¯c\á\ìv4+J*¬fp\â\ä)ò…<-\r<ó\âK\rò\Ã_\ßO¸,À\ÆUËœün—Á\ç>|#TT308Œ\Û˜)¯o‰Í‹ÎšILLLN\Í;\Üsœyõ\Õ©\02¥\äñ­¯ò\åü77nX\Ãyó:ytó³\ÔUW“H&9x´‡7œk\r\ßÚ•]\ÓX\Ğ\ÕÁü\æj3?û\Íı´451¯£•úªJBAñÅš\0R’\Í\åˆ\'SŒLL²\ïHGOô\Ó^W\Åß¾\ë<*C*6e\ï\í !26\Æ\ÌØ˜2¡\Òñ.¯\ÈZ“8§T¹\"\à\ç\ÚsVp^4Á\ï^\ÜÁwÿ\ï=twu\Ò\İ\ÙJu¸Ÿ×ƒ\Û\årG Bğ‘D‚S#c\ì:x„‰‰)Îš\Û\Î-\ï~Ÿµ\éf…]D1\"<5\áp\Ïq\Ü.7³Zšøõ\ïşÀ\ß^}1A¯—\Ï\Şşcnÿ\ÜÇ¸ôœ5¨\× p¹8|ü8“S\Ó\ïHó¢•3F\ë\ÒuŸ~h_Œüº\ã\'ŒyM\r6\îŒMMñófÓ²\\¿~5O\ì\ØÃ£û¶\Ó>«M=F:“\Æ\ëõbEÚ‹‡|-\á²Õ‹Y5¯ı\'N±g\ï>f’ò¨0y‰0“J§1óyÜº`vC·\\|õµ¸]º#¸¶0g’	\"\ãc\È|Ñ‹3\âS3xütCs¤^™yµ×¢iP.\ã#—l wdœ=\Çúxü\Ù\É$Rx\İöÖ¶–‚™GÇ¤\Âï£»±–\Åk—P*S/>\Ğ}\nY4¼¦”\Ö+\ä\Çñ¸\İ`\Â\Ñc½,]µ˜«\Î^Á\ØL”Ÿ?ğ+\æÏ¥®º!%nz H\ä9ó@\ëòs\'ŒŠY³“\ŞPùş\ÈøPö•]{ŒK\Ï_!”4ö\r\r308\Ìg.\Û\ÈÀ\Ø$¿y\îe\Şıu,?_ş\æ>÷õ3==CcC=Vib\Æ#\ëA›\êPˆó–t³¶;K\"!Í©¼¶…j\ì\Òu¼^€×£ö&°MŠk·\Ï354J!o2ORôÛ•ŒDğ‡\Ë	–—ƒeJŠ&\É\")q:s›\ë\èj¬%É’\Éd\ÈYnº3·eı=n7¯«\ä×©x<”0•R]ME¢ô\rœ\"ğ±ñ\Ü5|ğ\Äu\Üû›{Y\Ö\Ñ\Êe+—ğ\Ì÷\Ğ74B]u…\Ú;4\\¼²k3±x6XÓ¸¿¢¥#©\İù‘ó™½ö¢\íR2´}\×F\'¦\ÖC/\ÇO\r\ã÷xğy<l=x„¬\á\æS·|ˆE\İsñz¼œ\Z\Z&9ƒ@X\ã\Ïg©Ò·5¨\×\å¦*¤©º‚\æ\êJšk*h®® ¹:LSu˜\Ú\Ê2B>ŸµYT¢u–ğJ$‰™(\éD’\ÉHŒ_Ú®ø\Ô5\Ü>?\ŞP™òôlF•~±¥\Æ\ÖT„ \Ü\ï¡6¢±ª‚\Æ*»?•4W«ëª²\0^·zy§ƒJ6\é´m\é\0\áhñğ\è§†F˜;»ƒ@À\Çgo»™¶9]\ì<v¯\ÇMÀ\ã¡wpP¹\Ún\Ã\ã“lßµ)\ê:\ç\âW\î¼\åµó8oÃ•_ò;vïŸ½\ï\Ğ =5A8Pö:›c\ç\Ñ^>x\Ãux<nêª«q\éL†l>_2h\Ë-•”0\0Šg³p8%1\Õ@¤°\æV³\äpş+¦%0&\éxœL.Ë½Ï½\Ät<Eec#Á²24—nÖ«8PPù\é(B‰ò\0+ŸC\Ò\Ú\ÏtÀ”V.!Md&^ŸŠ\Ò0ÁÀ\Ğ0\0]\ím 5’+/\Ù\Äw\ßÃº\ê‰mSÂûrº—ù\İóØ±{n_\àÀœs/=¸ó;”ş\İó\é«òVÜ™H&ûÿ\í?Fcs3?}\àQNË¨“Ó¤2¬ö\04]§¬,H$WI›…Vÿ\íƒ\Ş«cº%\êŠÙ¥.°F:–\n!”­ …¦X%HI.›\"ğ\èË»¸ó©¸h\ã9T6\Ô\ã\rúqy<\è†\Â\Ò0«}©ªT¢\èMK«İ’¶m¸¨v²h\ÖPE\ÈeK`”–\r½\'N°áœ³%\Êeš’T6O,“\á\ä\Ğ(?}\àQ\æu\Ï\ç;?şñT²¿qÁŠ;ó™kóPb3\Éø+şpõ®{ö¥M)¹õ7r\×#OI¦šfig÷ıñ\ç\íXm-MD£12™t‘ÿ¨	\Õ~W‰´:lQ—°ø¬˜\âœüÀ\Èb´\ÊÅ¸D4Î¶ı‡ùñCO\Ğ\Ş\ÜÈ’9]Ø›¥‚/l¦\n‹\Ñ\ÒN—”f\çúšSª_\ÂúA\â0_\è.\'\İ­`& ­¹\É\Z9\Ü÷\Ğ#,\íledj†h2\Å]>Å­7İˆ)\ìÜ³?\íW\ï\Ê$£\Îùb”ö³\ÖOh.÷½\Ù|a\ê\'¿ø—^¸‘\Å04>Á\ã;÷²a\Ñ<\Æ¸÷Á‡\Ée3\ÖcX>\Ãb®\Õ9\r\Ğ\r„\ÍPÔ …\ã:–t–\á%\ÂúZb†¤”\ì~ı \ßğOŒF¢œ¿j)ó\Ú[ÀNC\å´i\ÖÄ¤rX(œ®ª_öJ\Ş\î¯-TNµE¼R½DZ‚™\Í\ç\Ñ4\r—\Ë ›\Ír\ïƒ3\Ö?Àú…óy|\ç^\Ç&Y¼`>—^¸‘ÿ\â.²ùÂ”n¸\ïm?\ë<\'6å€²õ\Îï™«n¸\í\é@e\í_xùÕ™Ÿı\ên¾ú\ÅO±d\á|b¹\Íõu|ü²ø\Ö÷~\Ä<Aee€£\Ç{Ol\æ\"u\ã\Í\âg‘R€RnX\Ã~Sv‹%N\rò»ÿÈ4\×\ÖpóÕ—©ù£$ßŸ#)Q\ái\åVv©8[\ÚEAqf±\ÏL‹7ŒÁ\Öd4M\r–¹U\åúN¢²¢œ©H„G7o\á›\ßı!·]~M\r5\Äry–.œ\ÏW¿ği~ö?÷ğÂ¶Wg•µ®ºá¶§·\Şù=;Œrúk\ÕOl6nl=ŸºtÿÁCµ+–,äª‹/\â\Ñg\çÕƒGñ»]ŒŒOò\Ç\Í\Ïqôø	bñ\Ëusşºµ9Â”M#\Ôó§óF¾;\æ\0\Å\ÇË‘\Å\ÜÁ#\Ïo\ã?>N.Ÿ\çª\rkùèµ—#¬>G\Ó\ÒI\ë¥\Ï\Ö\âŠN†ª\Òj\Ãún·\á˜8\ŞHa\ífZWJ\Ï\İ~„\Çg5«ö¤€;~}/\'Ù¹g?m~–\Z¿‡ªPwo\Ù\Æh,Á·şñK\ï\ë\ç\Û?ø/r¦<V^\ßü…ı\ßwª´\Å7½\ëşª¹cz\ä\è\Ş\ÃÑ‰±¯¾¶»ú¼s\ÎŸıøG°¯Y\ím|ô¦X¶°›\'Ÿ}‘Æ†z®½\â\Å\ZkÀB X\Ù,\Îb\Ì6.@¥\Ë\Ò{JZE)$‚%sf3«¡“C#\ì>t”Îª\nšª*0\\nŠ\Ç?uŠ©\áR±8¿Ã¥öTœŠJ\ÚF`\Ïñ”p\Üú(\nŠ\åt¨|~p{Ğ„	BJş\å{?¤©±ÿ§`\Õò\Å\ÄryNLE™\×\İ\Í?ÿı\ç954Ì—¾q»‰%^¯\é˜ÿ¹ÿö›¯\íâ·§©ú›¸ü\Ë?ò\îyô\ë\ìøf{Kó¬oş\Ã¸\áš+,•V\ê»÷À!V\\x\İóº\Ø÷\Üª2›ÿRb&cˆ\è4*2¬á¼›ñ4²¥\Ü.”‚R\Ú=	\Ó\ä`oÿù›9\Ú\Ó\Ë?\İt-İ³;\Ğ4d<Y( „ TSEyU†\Ç}:\Ómœ¦\Ôx”3 O\Ï\ë\ä·û!K’”Wƒ/€\í±		±Dœ¦\ÅkXs\Ör~ı\ÓPW]\åVü\æóµÛ¿O\ßÀ`óÂ•_[rùû\ï\ì;ŸIóú³¢g\ëùÅ—\ßx¨\É\äN\è\é|ş¥W*L\Ós;;¬¿;\"H§3<ú\ÔF\Æ\Æù\Ì\Çoq&~„\Z‡(Àz\Z\Ö!A\É@eq€¥\â+ŠŞ˜¥~NqM\êª*Ø¸r)Á² Om\ßE{UŠÙ¾`\ê\æfBU•\èFé‚¯\Ä6I\ËüÀş<­_¥mû  kHMwo	8r¬—_\Üı[\Î]³’+6]€\Û\åB ™˜š\æ\Çwü_ÿ÷˜#c“=ó—ı¨c\å†ÿyú\'ÿ”\á\Ï\Ğÿú§:öl+¬z\ï\ß\ìME¦G¦F‡\ço{u{\í±\Ş>\Ün\rµ5†\Î/o\çx\ßI\Î_w6­Í\ØoY•R¨ı‡L\nûµ\ZX\Ò_”5\Za1\ÂR±\"P*“\"\Û3³pn·Á\â®N:Û›968BCU˜Êº:*\ê¬\'©ô>*ÀŠõJ§*i÷\ÃJ.\0\Û*\ß\êÁS	†\á/ChûÔ y\é\Õ\×øı£³v\å\n.Z¿™h”\Í\Ïm\å\ßòø\åo\î\'™É½^×µğó/¼\î\çş­?¼\Í\ïg~ü\Õô\å_ş\Ñ·\ß÷³¡\Èpÿ·xôñ…\Ïm{%\Ô\ŞÚ¢†AOo…|½²nõJ”¬)u¡\ë`\æÔ D	–·b\Ûs³§`\Ë1Â‰©‚V¢´˜ˆd^\Û,Z\ë\ë&x½°M‰\ãJM\ÍxU¼X‡Mö\Âû¾­\\E)rjT «“<NUBp¬¯‚iòÀ#ó\Ú\Şı¤\ÓN\Z4\'¦¦£n_\à@Eó¬\\~õ‡·?vû›MV)E\ãm\èò/ÿ0ü\â/¿û\îl*q±,K)5\ä\Ò\É\æë¯¼\Ô{\ç~[…\ã% ¥‰˜·L\Ør)1KS%Ô±÷6%Å€Ñ¶\Òeñöi\åSm¡¸t\Út¨Xa±ø\æ‡\ë%]ñ…\Ğ\ÂU˜RyvõG\Ù\Şw\Ûgxtós#n_`JJ\Ó-„0…¦\ïs\Ê?÷\Ã_zğ±\ï|j†3 3Å¦³oúÌ¬\á\Ã{j¹¼æ¯¨÷¾º\å\Ëg·w\Ïÿù!sgw\0|Bt\Z\â1°_«l\Î0\ëJ\ïS\Êÿ?\Ï\Ã\Ó\êpn; Xd›+ŠLw¸\È\é™m†#Á‰wa\ç8jªBøËŠ`xığQnú\ä\çxı\èñ\ßv¬\Úø\İL\"f\èn·Y?gñ\Ø+÷ü¸Ÿw@oûf¼7\Ò\Ëwÿ¨\è¸ü\Ë?\Öz_y\æ]G÷·\çÀA\çÙ€%­./ˆ(-–%Á‹a4\Ú\éöm»ÁR\ípPr8V\Âd\âAX€\ÙÙœşà´©&ú’:(©C8\"õ¦:°z¯\Ù\ë«Œ”p\àğQ÷\ÌVµ\Ì\Şql\ÛS»\ì};\çRqC\à/ \Çnÿ”9ûœM›“\É\ÔÌ“Ï½@&›-ƒk (‘\Î\èœ\ä’‹¬},ÿ\ß~h\É)\"@1\"±C$R\â0N%Y\á“R<m-\Î7\ì\êm‹X\Ú\0º¬3\Õvö\\6Ç³[·‘L¦N5-Zõ0%ıU \0H)·\ZnoÿcO=c\ÚG‹¤=0]—\rÌ›\ÊY_û5”·f’7ó˜²€´^\Ölƒ£\à)ÿ¢\îœ®\"igV\\@Jòyõ™\êÀ\é%\Øö\Õ\é‚$¼\ÅWGÙ¾d4\ç\á\'6•µ½ƒvœ¶:ÿK\è/ú\ëu¥\Ô0oi.—J\'G†\Î2\\†\ïüuk‹§#±$-›t\Å^õ+9G•l(\ÇMp\è\Ä\0¿xğQ^\Úó:\Ã\ã“$I\n¦IÁ4ñ¸\Ü\êÕ»v¢X—\n\Ù§\r! ‘J331\á\Ä\à¯\î;È–{Ø²ı5ÊƒAê­‡šŠª‚\í(:½tp\Z\Ã*®§J¡!ø\éwñğS[\Æ+šÚ¿³òú\Ûööl}ü\Ï\É\Ç\Ó;S\ŞHû¿/_?o\éSnğ\Ò?=µeı‡¯¿N\ëÛ…‰@\Í\íE\Znd.‹-\å{°ö*_I«i1\×\ã2818\Âğ\Ä$¿{ò9\â©\r5\Õı^Â¡ !¿Ÿ–zõ\'¦\0\Ô\Û%T­Ê©d³yNM$H¤Ò¤2¦\"1²\Ù<•¡ ]m\Í\\töJ«y›ñòM\Ú\çh¦\éñ .G#\Ğ?8\È\ïş“\é	„ö”\Õ4\ìz\ìöOı¹\Ğ\Å;¢¿\Z€\æE«ö%&\Ç~w\äø‰\å\ßı\É\ÏC?øö\×ÔŸ¥E€Ëğ•A~¤½\Û\Ø\Ï\"Z&Ki‹\ZO{sÿõ•\Ïbšr“©™(``dŒ\ÉH„‘‰i†\ßt\n@M\ÔRj4\×V³n\Ù\"Úš\êq»\\/-\ÍÍ”ıÍy”\\\Õy\à÷½ª÷j\ëª^«»‘\ÔBB€Pb7˜5$x\ÆÛŒ\í\Ä\Ç3\æ;;!9\'ö$\á0\Ä\'ñ\ïc{œ!\ÌfŸ±q°¶\Z³!6	„Ğ6¤\î–z_ªky]\ë?\î½\ï½jµ\Ù\É×§«^½»\Ûı\îw·ˆ$b\ÙØ–­Løğ \Æ\ä\"µD\ë 	jcR,‰\Ô\ë\Î\àÍ•¹ÿÿş˜]o\ï/D\Òm?\ïYÕ¿\ïÀË¿\äİ‚\àÁMw|1û\Ê¾ó]Q)\Üú­{¾ú\ä\Ç>¬\ÍP”\ru;œWÀŒ\ZD\è)Ì¡h®W»’\Ã\ïõ÷<ı\Éßœ6\Î8\ËFvt#\"ŒQó±Rg*fP¸YLıA€ƒ¶,¾WB^{\ãM>ú©;\Éo¼ü£Ÿı\ÃM}¥iC\éo\n\ïºO1phóó\Åd{\×\Ñ\Â\ì\Ìõo\í\Ü\Õy\ÙEkY\ÔÛ£8Ld4ª.\"«WÑ‡úòûõ.lj#mH&”\ê’‰…:)H\áPSF¨•‹\"GÄ’\ê\Ô×¦[D@8S¼V1QÉ´#¢RW|n®\Ì_\Şı÷¼ş\Ö\Îcm‹—ı\İ\Ş_=ñ\Zg\ÎQ\0>x\Ï\ÃGwl\Z¸tË›oµ­\ë_Í¢³\Ô\Şra\Ù\ÊgT«#\ê\Úõ\âc\×,v:h?Th<	¾D…©\Ã+\â}”k‰jŠ³ˆ¹B6tzU^\àv:­ğ¥A´,Dª\r\â\êo‰Z£öû\î\ç\áGZHtd\ìXº\êûSƒŒ\ë\â]ƒ\à\Ãmw~+ñúO\îÿo\ãvİ¹ş¢ş\Î\Çüz»³˜¢DµŠ\ÌO#\Ê^}\0\Ò\çRóS%h~½m\ïA6¼´™²¿qTG”¾\"¤¯7\Ëºù:ZjµI0š\'\0\ã\äôs7¢\ä\'‘\ĞÒ†H¦}BI?\Ûğ4w\Üù†\Ç&6uŸ»æ¿\ì\İvˆ3göÁ’\0\0\èIDATTR\0öo\ÚP]¶ş½;\êõºsğ\í=Ë\ÛøRfQo\Ëú–¨\ë¡,[/\Í\êTl­ª|G04#L\è\ß*€¶l\ãGÿú4\á\à‘A\r\å\Ğ\áA	şõ\Z\ï¹d‰xLIŠ/X!Ÿ˜\å\ï\ËF¨\é\ŞT+\"•AXJ\r6¤dû®\İ|ğ“\\\ËJ\ÛW]÷¾ÿ~\İg¾°\í­\'\æL\Â—«oıhvü\àîŒ\í\ßq÷’E½\Ù/\İı\×|ø¶\ß\'\Z	N’\ÅY(©KœM\×/Bnz)\Õ\é¥~Ï‹zœ\ZfF\ï£Qˆ\ÕÍ „¤­·‡¶\î^”:\Ò\' ú¾2c’\ëgvõ˜Lldª)„PsñõZ_\İÌ÷|•7v\ì\Ù\İÑ·ò;½\çõ?°ı\É.Ö»„3.)\Æ\ì*^ññ¿\Ø>s\ìğÀø\Ø\È\Ú^z559=m_°j%-©pbˆ¨«&\Ä\êõºBh2\í\ÓD\İ\ÏS3–\Ú:.„ÀŠÚ¤Z[i\ë\éõ·\ä	ƒøP>\êY¤~«`Z;ñ¤\Î[ö\Ì\ÆMü\É\ç\ïj\ì?t\ä`º{\É}\Ç}\è\ĞkÏ±~$¿5I1pû\ÏZ?û»\Ï\\[\ÊMş©73y\ëúuı©{\îü<W®¿˜x<:)©,\Ô-©u\İWè išVKŒÄ¢Q­Rö<dC\ÅB\â\Ä\â\Ø\' \0e]I5Ye¬.!´J”j´,d<…Hf¶ÀB©¬±‰Iú\ác|ù;ÿ»QğÊ»[²‹9ú\Î\×h\êƒßš¤\Øö\Ä#\Ò\ËM^~\Ùõ»*^1~øC­\Ïn|©}lb‚µ«\Ï\'•J(\á¸\à8j^\Íl02½=ø\Ó\ÆRq¯e[D]Çá¸®º\Ì-b©¼šTQ\Ğ/ù(Da¤›@´´!)e%j=p\è0Ÿı«¿\åÿüSŠ^y\ÏY\ç¯ûJ,™ş~ntèŒ«¬0üÖ‰b\àŠ?ú³ñÉƒOõ\Ñ\ŞÁ}»»^{c[\çc?Ò©\Ö\Z¢§»‹¶\Ö4\ØD,	‘\Ô\ëªOJ¯›1‚\ËGºi@\áUhi\Ó\n\Ê´ÂCº+ÕŠˆ¨ƒK\rÉ‘£\Çøú?üú\×Ë½ûI\Ûùùª\ë\ŞwWÛ’O\íy\îñN\ã)Zñ;‚\ë	^z\ä\ë\Ëó\Ãš9v\äv\Zµ\Å\×\\~iú¿|\äƒü\Ç[o¡½5£_­ ½xED\ãøC@›Aˆ÷\ßY\Ó\Ş\ZZS\ÙK@,pcŠ8Šr\ágã±Ÿ?É¯^zµd\ÙÑ‘¶%\Ë´£\Î\Æö\ï<|‚\Â\Ï8üÎ‰b\àš\Û?{{\ãS\çz3“ŸñrS\Ç\İ\è\Å+W,‹|ş3Ÿ\â\ê\Ë.¥§;KÔ²hT+PšU\Û\ä<K)d•5»JšA\"\Ô\Â=Ç¥‘\Ì`\Ù”{ERò\æ\ã…W_\ã»\ß{¤±ÿĞ‘šW©\îuÉ­™Ş¾ÿ³ô¢«¶m~ô¾`_\Ç\ï\0şÍˆ†•\ï¹õ\ÚÃ¯¿xW\Õ+\ŞbY‚V­\ä\ãz?·\İr\ç­Xe[\Ê\ËÜ¨ğ¿‚ù\r\Ì\İ\àD 7°¸„\àğ‘A^\Ûú&/¼²…Ÿmxš‘±ñY\ÛqE\İø“\Ë\Ï{z\è­W7ğoÿ.ˆò\á{‰<ó\í»ş*72x\Ï\Ò%‹928DÄ¶Yµr\×]yŸş\ÄÇ¸ğ‚ói¾®CYNB»g$\Â\Òn]\à`œ›+ó\ä\ÓÏ±\áùÙ¾kû\ß9\ìozJ¶g‰\Æ\ß=çª›ö½ş\Øı§µÀ\á·\ïš(øûûc;7<\Ú7ğÖ«­•bş7š\n°#Q+‹ÿa¹0û\ÙñÏŒ\â\ï˜­û2\Ë\ãº÷_È•—®\ã¬\î,g÷-Áu\\#\'\Í{tb‚\á\ÑQv\í\Ù\ÏK›_gğ\Ø‰˜K\ß\âE\\°\ê†\Ç\ÆxeË›¤:{7dzo?if§\Å\é‰ÿ—]~Ás\ßóûC¿¸÷\Ï~£¹•ß˜(7\ŞñE\çÀ\ËO_;v`\×ÀûË…\\O£^;­»qO\01 ½å—\ÓŞ¹Ü´‘—·¼Áó\Ûvóü\İ›˜>UúSB\Âu¸\á’~ş\à¦¸üš«Yµ\ê\îş\Ò7ø\æ}\ß;U\Ò\Óa\Ù\Çb-™\ÍÂ¶?\çò7l\ê\Ñ\ãO§>üÚœ½¸ÿò„›H_±é¯~º:\ç]Ü¨Wû\"‘h,s±¬Á\Ø\âô6šIµZ£\\CJ\É\Èø$\ëÖ¸,Y\Ó\Ï{ke.;w·ÿŞµ\ì;:\Êş£ÃŒ\Í\ä™4û,Ï¬	,!È¶¥iM&\émoã‚³\Ñ\ß!=\ËW`·g•K^ƒm\Ûttuª{\\$bz[¹€yF¸\Zşøn3 U\çMOOU*Î¾¯^¯ß°ó—?ùpv\Å\êqS™‡\ßzù´U\â¯E”\ïøbvÓƒ_½£:\ç}¬Q«‹\Å#K–/£¯o)=½=\Äõ\ÉqfRä¸Š/\0\år™6o~¯\ä161b­mtõ-afdÇ‰²¸«“/Zí««†Q]!\âJš‘¥|^ª?–E¦£Eg\á_2&ğy\'‘L°v\í:¢‘(¶m³t\éR\âú†‡\Ó 7;Ã¾}û\"{ö\ìN_;vp\×©\Î\Şe\éŞ¥\ßıĞ½\î{\èöN•\Í\é\å\Òÿü\Ç\Ä\Ò\í=[~|\ß_”³‰%Kú¸\âÊ«\é\î\î&H(„H\ÉB[¯×‘R\ê\ršazz\Z7\æú§\ÉyZ\Ñi	A2!\êºLR\Ê\å\Ô5\Z\Ò\àR\Â(ğç­šúI\åó²,‹LW‡:‘B@0Ê—x%\å¾r\İ\àFË²ü³~H\Ò\é6.¹d=Ë–-g\ë\Ö\×Ùµsggabø“‰ö®\r_ş\Ë?N)1§5¢\ï^y\á\â=\Ïüô›ù±cŸH&“‰+®¸Šo¾…ö6¢\Ñf\ÎZ!£Ym\ï\ï\à\à \ÕjUM®‰S«Õ˜œœd®\\frb’R±Hk:\Ín½AY\Êc\ÛQ’­ib-)¤¾\å¨nFú|»K;%…?jW*)LÒ±h™®.5Š@\Úˆ\'940\Ä7\ï{€\Ññqz/¢£³!-©™LP‡s\Î\ÎÎª[N­`óĞ‚ ıuB@\"‘`Ù²\ådZ[p½ülWÄ‰u]x\ëG^=¶û“®%>%Qnÿ\Şs‘ş\é\Ş\Ï§\Æ>aYVò†ob\íÚ‹ˆÎ»¥\íD e\áy\"À\ÜBÇ¡R©055E]6(f™šFÁ\Í\×]C[¦J³Mğ¨%™I\ã&“\Ä	ì¨ƒ­\Ï´£ìˆ±q\ã1’™‰t†LG-\Äôd—?ÿoG©\Ø>ú/<ş\ä@Ğ·ôlZZR\ÔİŒ±XL]y52B½^§¥¥Å—\æ“4\Ö<€PÖ®®.\Z:\Ã\Ã\ÃI/Ÿ\ëÎ=X)vŸ,›“å¶¿ùŸÖ¦¿v\Û\Ì\ÈÀİ¶eu\\}õ\Õ\\´\îbl[\İ=%¥:½T*1;;K¡PnMµõ¡dº!¶m“\Ë\å¨V«\nJ¥\år\Ïó@Hl+\Ê\Ô\ä$c\Äc.—¯\íÇ­\Í\ÖQÂ²ˆ8n<I¼%I*“&\Õ\ÑAº½“tg;\évZ\Ú\ÛHd\Ò\ÄSIœX,¸¸@94l›o\î\æ®{¿\Æ\Ôô4]\Ù,g/_mE°„ µµ•\Ù\ÙY\Æ\ÆÆ¨T*¤R)R©õzJ¥B.—#Ÿ\ÏS,ñ<ª5ªo>d³İ”J£#\Ã1\Ûq#g­¾ø\Õ\ÜğÀ	/K;)QÊ¥B\ï\äÀ;«^ñ¢sVk_uõ589I¨A.—ctlŒ\É\ÉIŠ¥\"%Ï£\äy\äfs9\æ\æ\æ°,\ËWY¥R‰jµŠ”P«U)—•oO®\ëR«Vgû®½4\Z\r\Ö.\ï#\æ:\'¢¿\æ\Ôé–…%lµ8Ï²\Ô9õ–¥¸´IZº‹rµÊ³¯m\ås÷~ƒwÁ‰F¹pM?‰d\n\ê\Êå²º#YwT‰D‚J¥\Âøø8Š©t[‹¥ù|\\.\Ç\\¹L\Ôqô…iØ‘­­­\ì{û\íHiv¦#\Z‹\ï(\ÍLPZNJ”LOßS>\í:N\Ûõï½\Î\ÎN\ÌJ\×J¥¬\î.¬¨\Ã\r”‰Cğß”\ËeŠ\Å\"¥R)Ô‘{\Ç\ée\ã›jI§™™š\"7›cË¶\í¼}x€\Å\İ]d\Û[\Õf\\“\ĞO¯>\á\Ó\r„¶ş\ÔcuO¥R\åÀÀ_z\à‡|ı\áò\ÎÀQ\Ça\Õy\ç“\í\îÑ„¤¤6\ï \ërµB¾P \\©ÒÁ\ÔuHˆ‘HÊ•\n•¹2ñx¼É¨@\"‘djzš\Ñ\Ñ§\Ñh$\ßÿ…üñg_\Ğ,=©õ5~p÷§e£¾¸¯o}K—b¦f%05=¥\0	\â,… c‡\Õ\êu\n\Å\"…b±y9«Lf\ê#cQ‡‹×¯\çÀ\Ûo344\ÈO\Ù\ÈOŸ}‘k×­\á®»‚5\ç,\Çu¢´¥\Ót´¶\àè³M”	,\ÈŠ\ÌKL\åf\Z\çğğ¿ø\Õ\Ël\ßwzCÕ±­­•«Î£½£C\×C\ÏR†\êE¨\r@°T \ÔÉ¤)x%&§¦\è\í\é	©25\ÎY³\æBö\î\Ù\å”ó¹¦¾s.°—\à„D¹ñ{?û¿şGeY¬\î_ºÂ L\Ü|Aı^ü\æ«©8+4\è’P—\æ\ìkš\Zn¬¸\Ë\Êó\Î\'•Ns\äC\n^Øº¶n§-İ‚‰\Ğ\Ù\ÖJg{·IM(dK\Ô¹|‘‰\é&rÍª;Õ’¢»§—E‹“JµøX–z¬©^˜0|e\àMB0¡AC%¯D½^?®I§3d»»9:ttñÁW¹ˆ_—([7]&\çvue\é\Éö4…½’\âªFß›\ï\æ\n›·:ƒ4ALXÔ‰²d\éRz{{™šfhh€B¾@©\\¥\à\Í1:=ƒ<¸ \äª_°mÛ¶I¦RD\"²\İYzº{qql;¢·Z‡@¨…“Çƒ„~6ó¼`t•r…z½\ê[Tüx,A¶«›¡ÁÁ\È\Ğö\×V\ìÛ[?úó‡’%7|¸S\"Ö¶6}hP\Ïó\Ô6Ÿ\Ë\Â\Ç×±Ag«Ó†\×\Äuz%KˆK…8®KwO\Ù\în\æ\ææ´¡P¡X,P«Õƒ²\æa\Çub±®\ëO$\Õığ\Ö<\Õ$¥’f\Í-\á\rGF\æ\ç9`1é‡˜/¿¥&­–¸jµ\Ú4\0•\ìˆM{{;¶m[¶\ë«Î•@ypB¢L\êAJ\Ëš\Èya€X\Ó:pR³%¤+C\ï>\çùoC\Ü(„ ˆ«‹-œ\Â/jÇ©_½Ê  >„®·O ı¤Oô€™Põ3Ö…\ÏsFÅ‹\æû-EP––4\ãXØ‘³\Ç÷ooe¢œp4Ô¨•C\n;\à•F£h\æT‰\ÏA\Íø	“H±™\êX	\ZzöJ^\ás¦!\"‡;`\ÍH]\Í ,¨…©›\éğU!¤‡eı\ä·;ˆŠ+©„¯I”\Å\â\êš))IO¼³oÁÛ¶O\Ë÷¥ ¨|¿(5`*ŠUß²&ªi”ª¡Q\áù¿ML\Óp]tP’n\Ê0a\æ\0\ß¦‘gÁ¼6¹$fw®)o©_\Éy³Ÿ\"”\áqõH”ù‰D±lY­\Å\n\ÃÁ¶°œ\Âo`*­YbÁŠó¥‰6«‚…¼\ÆJbd¨\Óz|$ >B|\ÎöE´9Q¸a—{.ƒ0?Xø5Tj,\\–2\×8¨ù\ê+¨ƒ’x\\M	T\ç¼\Ö\Ñı;[Y\0NI”fD\Ü`I”” hsœœ$º!\âx\â¨,I8ô)³a$*1ğó\rŠ\çcX\ëÿ&±	\Ún„\Õô¯·\\Ì«ˆÀ¨WUj-¼\0]•\Ğù6\ê5\çD3µ§$Šhz2œ0…\á \ßb	œ…]õ\ÂGGûŒ²nL¾BY6J\"My2 –§Tb—o	f¶!+Q¨º\èÈ¦\ZA£B\Ä]„ßKôalˆ\09!\ìIıg\Úa\Ò,§$J\Éó˜\Í\Í\âyE\Z²ù‚P«°´$’¸‘(‚\Ö6ñxS\é¦_0Ö\Ï\ÅM’`¡ß‡\Ü&R†¦*˜¢)¾bLnPı\ÉqÆ‰ŸN\×o=fòK\n°\"¶Zmc24õ\Ö\r¨¼=\ÏczzŠñ\Ñßy\"8eG?80À“Oı\×q•ıSk4ˆF\"D¢Q\â±8±X\ÇqR’H$\è\è\è`xx\Çq\èpÛ™+\ë\í\ÑÂ–\r>‚¤ş4\Ü\î\Z\0ü1\ÎA	C…¦ş\ÅtôZB\åiB•ó,ô^§—óLt\r\Éd’x<N\Éóˆ9.­­¦¦¦‘u%\'µZ¯\ä1=9\Å\ä\Ø(ùB™\éi*\å\n\åòW\"Ÿ?\Î\nn‚¥¥\ë¬¥\Üä“•J\å¦\Ñ\á\áDk*I\Âu˜¨T©\Ôj”\Ê­”°	©T\éLšÎ\Î;5\ÉdË²H·ü/5\ë6·Vs¯ó©Q±\Ã5#|\Õ\Ô„¤\Å\'\Î|Ìš8z\\c^\Z	\n\Óf>A\\\×%›\Í233Ck&CµZe\×\Î]ŒŸ\Í\áy•ŠÂ‹”‰XÄ¢QZ\â1,!Ÿš¡\ŞhŒa=·lıõÿºx\Íe¯¿øÀ—™ó\Ëm‚s®¼¹h\Ç\æ\ï×½Bÿ\'nº†[.\ég2_¤Xœc\"Ÿg¦XdºPbt:\Çl\Éc\"7\ËT¾@M\Âûş\ÃûY±b\0…BÁ£CM\É|5Ş¾°\Z\n¤ÀY&|>÷«üğ‘ß¤\Ö|bªx\æYˆ ~¸\\“™…\"X6›¥½½r¹L4\êğ\â‹Ù²YmuL\'b\ê \ìv:3-tf\Òt·¥iM&X\Ô\ÙÁl±\Ä\ß|\ï‡\ÌK#À\ï\'\\\ÎtRõU)V$RiAOG\ë\Ï_¥\ç\É\Õ}¿\ÕZJ­N¹R¥Z«3/ğ\í\'6°q\×>|\"I&“¤[\ÒL\çft£\Î-\r¡m	>§\ä…y\'Ô§½–0¡1mrF˜²\å\çW\Í\'h ó(¬ËŒ\'´µµ!„ ‹¡v/+•õ•Oık–-Á\Ú\Äu»uˆ\ês’maqhtü\Ô3—\ZNŞ§«Å²\È,[ÁYW]C½\\¥^\ÌS›™ Q«Q¯Ö¨7\ê4ju:Š%Z’j<¤S‚F\\G{;ùbA¹hB\È0`gˆ\ås\ì|\å‡D\á÷)>„\ÂI\"\ÒôY\'\îÈ›@€mG\Èf³\ÍH\Ò7{—vw±r\É\",\Û\"bGv+\Z%’\Î`¹.N\"\É\ì\Ğ1¬¬Ñ…\àôbV4J4\ÙB4	$“EsŠº°X\Ö¸…±T$¥¤Z­FI§\ÓLOO\ã[*\æK„¤F\'4ªIg 0$a‚Ÿ\âøpI“¤\ê\ÎXbF­˜@™L\æø\Õ-u5Ğ±¨—\îeK\ÕÌ§m!¬¶\ãbu/Rm“+•õé°§†“E†\Z\ã?I\Ô6faûk	\"V$\ê\ßo \Ñh066†”’XRfI(š¾W[FPL8!\ëk¾´imi\âøyA	•c¢«µf9ó!Wj«RQ\îøD\"±äœ¨\"”›HO&u\n\İ~!\ÕeVD§#•\ZNJ”\0ª±M\ÊY†H&Õ‡\é+P?¤”\Ì\æó¼f@¶\Ìo?‰_Dsœ&µBóqV[¨ó\ã‹Pü !„Í£O$b311\çy¸®K\Ì,\Æ¨#\å}0\Ä5ÿ\ÂÇ‘”\æ\ãô\à´\ÕW˜DMcR)@4¢¶MB_tTAø_u31& ¬RTd¡Û¡9]€ò¶—\îošój³„\ßI5\î\Ğ\éü’%H!µ „\ê¢L¾P@6r“\É$¶m#ô\ÅE3û*LtA\ÓÀıN0/ÿ“\Ã)”\\À]\Ğ\ÌX>ÒNFˆ\Ç\èjkóSGŠª³%\ÈD#½©\ÚZoIM(\ĞcIˆË¥Ï¤I? a\î\ê­\É_-\Ü @\n??)u\àK­„\æii*jBı‚@¨ƒüM°§§A¸¶ı~\ç5DCHÔµ¯Z3V„ÉŒŸ½\É\ÏH@ğ[§’¡t~•\Â\ÓT\Ç\ï\æ\å©\ãùù\Èy¿ƒz„~ \á¨:\ÃFğ#\ÜXı\êôIÿxw„\'£G	x\0\0\0\0IEND®B`‚','image/png','romain.png','Gustave','','',0,0),(6,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\nÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0€\0f\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ği÷†©\ÏIÄ†¦Aš\0g—HS6>µ46\í/û+\êh–\Şph\é\Z£¬]5¾›g=\ÅÀ”r@Iô­}9ô\ÛCµ-V\æ|\à<ü\Èqü\ë\Õ|-yyh\Æ#£\Æ>fH\ÆNzO\\\â€<b\ã\Ã\ZÕ°o´iñm\ÎwÛºô\ë\ÔVK V \ä\ÇÒ¾—_Š\ßY’]F÷Ï‚tT„\Æ\ÅDD›8 \ç‘ø­fk>\Ğ<S¡^j\Ğmª`·™L®AŞ¼“Ğœq\Î8\Å\0x\ã½*z½¬\éWš5\ëZj,s\0m`\ÊÀŒ‚$T—>”\"\n° Aó\n²¹Ç­\0Fë¥\æ\Îh \nÒ\Şõ©\á\Ô2s%XŒ\à\Ğ‘Auİ½ğjto.=»³^•g.8§mlÀë¹ 	­\ÈY—\'\06I®¦\ïZkh¡{\'pA\\†=\ÇËŠ\Ä\Òl\rÂ¶G=+\Ğü=\à\'»‚9e‘LgœPœ\Æ\×–ff \àö®“\Âúõ\æ•18>hò\Ê\Èrœ¤v\ëùdW¬\Úü0…ˆQ:G‘Ÿ¹š\ã<Yğş÷IŸ,†h\ÔWNU€\çğ4¹®+Åº²Ö¡H5\Ç\Ú\"\Úule}~\İ\r|ó*¢\Ê\â\'-\'i#\ÜW«\èZ”7pIgtÁnF\æI\n\ã=y°IÇ½yn¯µ\Õ\'‹k©%_¨$dÀñ@\rBwÕüU$“‘š˜H\n\0•=h¨·\n(’Ÿ\ŞqS\ÄA\Îj¬¼\ÈjEc\Å\0X†\áV\íW{#­PCóÚ·|<†[\å•M\0tºD(\×û\Ì{×¬øE$L\ÒnHô\'ñ¯$u¼Yw«¤C¢m\É u8«¾ñ.¥\ÏúğDO\Èd\Û\Ğó@IÚ•\ÎÍ€\Ù\ÍZhC’\Î7&0A¯%ñ.©¬\é\Ún˜ö7b5\"T\Æ\ìv\ëÒ®øS\Ö\îYnî¯®eŠ;mqGò©8ú\ç¨\ÏJ\0óK\ëH¯<Q{ojcµh/dVU@P>8?\Ó\é^Yâ›µ¹ñß”\ìğ\Å#E0\0•œW©|\\Ñ¥ğ\İ\çˆ5$\Ô!\ç”4\nù\Şşa…\ÇrOó5\á¾iw$œ’rM\0h+r9©Õ½j„mÓµX@ úóŞŠ€¾h ÿ\0­ö¥fâ¢‘¾n)\Ê	\\\æ€&ö°n\à\æ½\"\Ò\ä{k\ÔE“’£¨<Œÿ\0õ\æJ\Õ\×øc[µ†\Ë\ì×\é2\á\"a\È`N@?CúPoe$Y¹¨;YNŸJÍ›OX\ß1ü‘±ûª0=kv\Ì~\á|\ÌdU{\ÖG)\é@Ÿq¡\Úø‡ÀúD·l\é-¼!£‘zŒu¥[\Óõ;-:\ÄZDn$’üŠ­\ák»­CÂ¢h H\">N\æ\îg8¹>Õ¾ºT\Ú]Jôó·\í¨\\\Í%¤S\ÈÀ\Ã\Ç$(;¿²şU\â1k²ø»¯M®x\ãS.\ê\ÖÖ“\Ëmn`Wlrz\æ¸\ä4qI!s;ş½jLñP¡éŠ”š\0x\ë\Ç4P4ƒR\Ä>SL›\ïšzŠ\0@84\à3€ô\âˆÔ»`jİ¬\\\î\ÆH\é@©¦4ò\èö2\\\r²K¾{0\éŸ\Ì\Z/\Æ1m9\Ùğ3ô´~\ŞXkşş\ÄÔŸÈ»²\ÜöóÊ£œú®N§Q¡©h7z\\»n—\äcòÊœ£}ô4³\à©5k‹Im-5\"\ÆVU.SH\Ò0P\àgk_ñUÿ\0„şj·Z¬‘I¨[¹†Õa]\ß\îğ}9o 4¾})£·¹ˆ¡–F-’»T¾<\é÷\Ş\Ò,®gû\\_„d\Ø\ß{ó\Ç\ã@%HK¹bIbrI\êi\èz.§ğ—\\¶\Ül\Ş\ŞğÀ\ìo\Èÿ\0qz—{¥\Ü5Ym¥\Ã\"\ã?OZ\0ª£§\"Œu¦\rH9\éŠ\0•ORÄ \Ñ@&Bf*€šU‡Ş®œ\é[$pn:\ãüjQ¥\î\\\à\Ğ=\ZO”b¤‹+‚·6\ÛK*>•V\ÖÁ\Ş\æX@Ë \Şµ\0M¡\ê\Z^¥o}dv\Ï\\ô>ª}ˆ\È5õg\Ã\ëı\Äz@—Olõ–\Îs\å·u*z/Jùf;V\Ü”\î~5\é?\nuq\á½Bwºû.v,£¬N\ç\Ó\'{ƒÚ€=[\â-†›\á\İ.\ÛVKü«¨ü×v\ìCœ·u\Ås?l\Û\ÅÒ¯4ö\rlÀ\É?\ç¡\0¨ö\È©­¿‰Z\Ü\ßğƒj\ÑJÁ\Ñ\ã‡-–eCIŞ¼\ÛBñta¬xmB\Ï2üX?¼T=>]Àã¤gÿ\0Ã­E¼A\á+Y\Û\ê\ä\Ê¼GB}ñS\êZFŸ\â‹;­+R…Y|¯™f¹oƒú‚\éş0½\Ò\Ø*AªGö›pG\nü\î_À†ö®\ÓZ‰´­kO»F&9d0JO|úş\"€>Wñ6>®]i·X2@\Ø\rÙ—±üEft\'Šõ?\ZxS\Ó5\0¿¼&C\è\Ü~†¼»µ\0Y¶<QE¦py\Å\ê\ÖI\çL\Ñ\È\0p~_zt¶\ïp	^˜ÿ\0?JË‹P‚K²T†\\\ç\Ã\n\è$»Š\â8\Ù]H\Æ“Ş€gn³[‚pI\ì3š¦šZnŠ\äZ\İI˜’F`\Ïğœƒ×§\×±^5´Œ‰\Ãv$Š\æ<Qmtfûlr»®w*}E\0zQğ\à»W¸»·v‡\æu\Ä;r2\Ç“¤I\r•\äĞ¹g\Óî‘­\æ^ñ“\ĞşÖÃG­ù6\Z³ÿ\0\Ä\Ê!…”ÿ\0\Ëeû5s¾;ôOI4_,R\Å{\Z\0]C\Ä\×xOXğ®¯\"ıªÔ§Ù¥~’Æ®f}qÊŸBG¥eA¦OG·Ö¬LFkm°]\Ä–Föú\0\Z›\ÅVğ\ë\Ú:Å§ü|Z…†\áG÷\İoÀñô#Ò¹T—F\Ô|¶\Ó›\\€\ÊF$s@”¯>–Ö—\è¥n\ì$[Ø³Œ˜òU#¯i\ç¶M{¾µ:Öƒö\Û|4rÄ—1cûÃ?\nğ[n›ª\é÷N’A xZt\\y‘É„\'O\Ê{ú×­|Ôšo\\\èú?lÒ¦kyº\í\Î(›ø\é§-Ï„-\î\"PL3¤‡\Ø8\Æ?:ğ\Ís@\Ôôˆ-e\Ô\ì.m\åw\Â\ÓFPH¾£5ö®…cguk\Û †u\Æ\Í\ê	VSÁü+Šı¨\í¬Ï€-ç¹u\Ú]ª[¹b6\îR[‡!{\Ğ\É\ÖÀóš)\Ö\Är	µp\\\ì\Ë+ƒ„ò+F\ÓZ{ˆ\Ş	Gs\ÔRâ¸™/e3YPj\Ä:¼‰*™€rõ\ÖËª“%¼û¾ø ıjÍ¶´¼¹pc\'¸[G-„\áC1\Ó5j\Ù\ä\ĞUªY=¬Ë¨ir’6\Ş6Tõ\Ò\ê\Z\Ü~,ğ\ê\ÎûVú\Øm™3\ßû\Ã\Ø×œ[kRDpNW\Ó4\Ï\íosö›F*O˜zPW\á]it\İD\Ãv7\ÙNS!\î­Á¤\Õ,£¶¿’\ÒI7B~\ìÇ•oÈƒ\\}\å\â\Ìşdy©yµssg\0”\æXÀÇ©N\Ãğ?Î€,\ê7÷,öö\×¾KPQ[$ñÛŸN˜¯jğî¾–Ÿu(\É·–\ÑTt2yk¸şy5óğ¹\ê1I!%w\ßAZv~!x•õ\"\Çs·¯A\ĞP\Ù	\ÕLº½İ†„fb\İq\Åy?\íK\â\Í;RMJ\Óoã¸šİ¤’\æ8œ2¡!B\ä3÷¸\íš\ä¦ø‡5–‘©%«•õbŒ\È!\ËÇ^SªË»P¸aÑœ°úhÏ½\nJ `\Ñ@ÿ\Ù','image/jpeg','220px-Cocteau_1923.jpg','Jean','','',0,0),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0^\0\0\0€\0\0\0‚\æ\Ş1\0\0 \0IDATx^Ì½wœ\\Wyÿÿ>·L\ï;³½«wÉ²-\Ù\Ør!`†\ì\Ä ’\0ˆ!!\â\0/\Ğq€€\0ù\ZcCHllš,«X²úªkµ½\Ï\Î\îNo÷üş¸ef\Õ\íğ}½~4;÷\ŞS\î9Ÿ\çsóœr\ï^€<ú\îO¹\Şÿ_üÊ‚Qü“_²Ÿ/€\0))—J†\×\ëÀ0Ø·oR\Ê\Ëg|•¢(\nË–-c\åÊ•ôõõ±zõj&&&8zô(¹\\\îJ\É_\èºNww7\ëÖ­C\Ó4\0„‹\â\ìß¿Ÿ\é\Ññ__ß³\æ~Ş·g\äbù\\J\Ô+E¨—]gÿnª”ı\à¦M½‘H)%óóópö\ìYB¡>Ÿ€t:M__\ßo)%•J…¦¦&R©Š¢pğ\àAòùü•’¾`1ƒR©D±X\Ä\ëõ\âv»/\0>269á’•\ê\Èt:µÿY]T®\nø·o»[)–K·\Ï\'ß»zİš5---LMM±w\ï^N<\É\Ô\Ô‰D‚®®.„†¢(´´´\Ğ\Ú\ÚJ(\Â\åraš¦!„@Jù¢ZB©T¢©©‰r¹\Ì\Ä\Ä©T\êJI^´”J%\n…‰D‚@ €‚l6Ë¾}û˜ŸŸ\'‹\áóù¼§û{\ï\İ|ûGF\Î\Ì])O[®\nø%\íM‡G\Îüc$»u\Í\Ú5ú\ä\Ä${÷\îe~~jµŠ\ßï§££ƒL&\Ã\Ä\Ä“““\0‹Ànlld\íÚµtvv\Ò\ĞĞ€\Û\í&•J½(ğC¡Œ’\Íf¯ıE‹\Ç\ãa\ãÆ´µµ9lw¹\\ô÷÷s\î\Ü9\Ê\å2\İ\İ\İJ&“Mœ\ê/~üw\ízò\È\Îò²®ø÷\İù‡<qt\×;‹TŞ¾a\ÃoµZ\åĞ¡C,,,8qª\Õ*\Éd’‘‘\Æ\Ç\Ç)\n\Ì\Ì\Ì0::\ÊÀÀ\0´´´\ĞuMÓ˜™™y\ÑÀ»\\.\Z X,^)ú‹\Ç\Ãúõ\ë\é\è\èpZ\è\ÜÜœ\ÓÊ²\Ù,\ét\Z·\ÛMWw—8{®?tzrx\ï\ß\ßõÖ‘\'\îºRöW\Ş0ŒmƒÉ‰÷®\\³ª³¥¹™}\Ï?\Ï\ä\ÄÄ¢8¶\í5¨5\Ñ|>O¥R!\Z\Ò\ÓÓƒaŒ³c\Ç¦¦¦^\è\0•J…D\"Á\à\à \ÕjõJ\Ñ_°x<®»\î:\Ú\ÚÚ¨T*T«Uòù<³³³?~\Ü1oRJ’\É$¡P\×\ë\Ï/¤K\Ùrş™SCWd½v¹Àû¶¼<ò‹cÏ½*®\îhogrr’ñ±±\Ë%¹@\Ün7---!8q\âgÏ¥T*])\Ùe¥\\.³°°@¹|\Åú9¢ª*¡PˆH$‚”’b±H>ŸgaaÁ!Œ-Š¢0::\Êğğ°S\Öb±ˆaT*•Eq+•\n\'Nœ`Íš5ñÑ±;5E{8\Åä²ŒO\å\Ö\Îf>ºq\ÓÆ¸\Ç\ë‡\"N_.\É‰DX½z5333<xğ‚‚¿X1\ã\Ùw)%\år™l6‹a„\Ãaº»»\é\í\íuò²P.—I¥R\Ì\ÍÍ‘N§I§\Ó\äóy\n…\ÂE\Ë_.—ñy½\è.W$5—šıÚ›?ô\Ì÷>}\Ù\æ|Y\à›\Ãñw+>\×-K—.õÌ¥Rœ9s\æ7íš››9p\à\0™L\æJ\Ñ/*\ç»qR\Ê\å¦J)©V«\nfgg#›\Í\Ò\Ò\ÒB4\Z%“É¼ VT/\Õj•D\"¡ŒLŒyÿ¯÷;6{¹øÊ¥¾ñæ¿‹\ÏNnkll¹\\.R³³/ª#‹D\"¤\Ó\éEñ‹‘‹ÿ¿•jµ\Ê\Ô\ÔGa~~%K–\\pŸ«•t:\Û\ã\Æ\íñ¬ü\é\ß\\ûÀkÿ\ì²ñ/\rüöÿ¼S÷¸®innÆ¨\Z\Ì\Ì\Ì\\*\êe\Å\ëõ’\Íf_pK©—\ëó_­”J%†‡‡I&“455½(ğ\r\Ã Ÿ\Í\Ñ\Ò\Ö\ê©\Z\Æ+Ÿn¼\\ü‹v®\ßz\ÛG=\ïıÁ¿¬FƒZ8¦\\.3ÿ¿`l©T\âb¸y\Ü.\Ú	\n\å©ù4\Íñš¦\"ŒSz\Í^\×u<ñÑ€Ÿr\Å 57G,F\ÓjVÕ’™d’‰\äÜ¢~||œ@ €ªª/ª/ª\Z­MMsgûoúù\Ñ=q`\êRq/\nüƒ¿xdyÕ¨\Ü\Õ\ÑÑ¡)ŠB¹\\~Q6 P(\àñxP“EB\Şõ\Æ{ø­›Ù¼|	—‹J\Õ`drŠ®¶&„T\0I¹Z¡\\®081I:›\ã‰gŸCSU¤„\é\Ù9ö…X\Õ\ÛM{S#ñp€µK»\éli\Â\ç\ÒBE`P5$Š\"XLbA¥Z¡P,szx”ûğ‹=\ÏsvtŒ‰™$†ñ\âZ—¿\ßO´!ˆ+ş[<v©¸\0ÿ­·~Xù»\Ç\\Z4*­v³›½l?qY™ŸŸ§µµE1­š\Ï\í\æó\ïÿs@`7)‰h„YCH\"ikŠpó¦õ¸].TEA\"I\ç¸t\r®[±“­5ğ!.¤„¶Dœ[¯\ÙÀû\Şü{<\â\ßú\Ù\Óüø&“}\áDóx<¸\İn¢±h\ã\éSg\î¾z©¸\ØøŸÙ¥Ü¾—566F\\.À‹f;@*•\"\áóù\èjm2$HLœS\ë* XJŸÇ‹ª\Ø\áòz-\Ğ\í8B\n;\Øb¸v13g\ëXZ÷ö¹=Ü¼i-Ÿûûûyõ/½0ÁUˆ®\ë!ˆ7\ÄQu-ò\Ş;Ş¸üRq/\0>W\ÌùgÇ·µ´´h6K\ç\ç\ç/HxµR­”)\ÄbQ\0<.\×\"p¤b\"!¤…•‚D`ª\Ä.¢¥a{8v\Ë0\Ì0Da‡˜-J[	õ\"M…KKµ\Â\ÊC\ZD\Ü:ÿğş÷\ÏOtY\Ñ4\r\İj}±X¯Ï·ö?v?q\ç¥\â_\0|S¨aµ¦\ë\íA\ë\Æ/\ÖgX\Ú\Û\ÍkïºƒôBšh\Ô^‚…ŒMCYWq!!ó ¤\Õ¥\Ø\"k™9ŠT¬<j\×\ê\êD8z4£(5å”‹ô´µğºW¿\â\"\é.-š¦\ár¹B i\Z±XL\Éó]Ÿ\Ãû‹ğÏ>´\Í\ï÷‡\ê¡C|!›Ö­\á;_ú,w\ßñ2\Ò\éB¡\æDº ò¼oiı\ÃR€t\Â\ë?¶\Î5y^\Ø\Å\İQK™\ÂpRP© Œ\nt\ïİ´6_\Ö#\\$º®c›f€\Ö\ÖVMñ;\ïyº÷bñÿ\è»>\í:7=¶,\âv»\È\çó/\Ø_\Ò\Ó\Ígø;®Û´†HŸ\Ç\åt®Xö\Ø\Ä\Ó:,bª\Ä65ª;Å¶6²şbíº¨— –­·/œ76a‡\å3¬]µ‚kÖ­\åjE¢(N\áp©*\Í\Ç\Çš~ÿƒ\Ä_„Æ¯O>\ß\éq¹6\Æ\Z\ZœA„a/hğoˆñ\Ñûÿ’m[¯CQ\â\á ‰ j\Õ@az)6È¢k\á\\—R\"f«°Áu|¯\ê\â;Àñ˜lV\ÛyH+‰3\İk\Ş\Ş\Öˆr‘hÀÏ¶¶\àr¼¦\Ë\ËùŒW…H4k\nE·>ud\ç\Ş\ã\"\à?ø›•Ym\Ç\0³`¹\\\îª\ï÷ùx\àş÷òú\ß}Š¥¸€*	ù<€\Ä\år\r\ê=F|\ç\ÄD ±\\„¥%a%¬OnŸi+É¾h»’¶BBJó\\`-k\áõ¹I\Å/¿\íf|>/W#RJ\Ãp«(\nñx\\›\Í.¼ôñ\Û/\rü\Ó÷E™šŸKğü\'ƒ\"ñ†(\×]³¾\æuH‰_Hü7•J…b±HS,ŠuL³\Ù_\'f˜\r>`_¬H¢ş .‚d±7#E¶Z\Å\âk¦(X\Ö\ÓE¼!\Æ\ÕH¹\\^\Ô\n!d\ÊùÆ®D³\çüøğÏ;\æI£[\Â\áPHUk\Ã\ëL&s\Ñ\á³¯\×[·¯\Ğ°¬·\Ûd›\0QÈ“\Ïg)UªHiN¹v·¶,f¹5¦š\Ô\Åñ\ßmä¬¯Z\'k\Ù	MLk\ç8\ç\Ôf\ßPJ¤£D+\Åz3ŠUR€­›7r5b3\Ş9G\â÷ûq{<Ë›‚\r×\ß~\ç™#¾Šat6\Ä\â‹\"Ô¯,Õ‹®\ë$	„\Ö‰›\îvB\Ë{2dÁTZ¥Z%\É\à÷zX\İ\ÛmQc[½}®oôp>)R\Øqkh:-l\Å¤­\ã\ZÈµ,\ê\â;&Hš£‚Q)³z\Å2®FJ¥\ÒŞŸ\×\ç\Ã\ëõ*†O^ =øC\'}\éB¶=ª\rª\Õ*™L\æ\àu]GQŠ\Å\"\år\Ù:WÙ²y£e$²RF–K\Ìg²\Ì\åò\ä²9z\ÚZˆ…ƒ\È:x¥”V¿fóM8¤[\Ô„=¤b1\î‹\ì³\rn\İ%§E‰ó®\×\Û\éœ~\Â*K!\Ç\æuk¯\Ê\ì–J%r¹\\#\"\Ğ5P(\Äé‰¡%¾\ëÓ‹úS\ç$W\Ì{r¥B$X7b›ŸŸgjjñ›\ß\ïgÉ’%¨ª\ê„iš\ÙóoX³\n°Š].\"ªU¦Só¤2ª\Õ*×¯[Egs\ÓyD«cc8j\Ô\0‘\Î\ç3».¨)\ÃùZ|\îˆsn\å\'„E+U)OS4L$\âjdzz\ÚqDL.	‚Á ºªuœ\\dJ\à;c\Í1—\ËWU\Õ)\ĞÙ³g/XÀ¸\îº\ë\Ğu|>o±U\àóy1Œ*\ËzÍ±‚”ó€dp|š\\©B\Ğ\ë\â†õ«¼‹@²;\Ò\Z\ÛjR³\Åà°¾s;©V›\å\æ5!jÇµ{\ËK\\³\ÒBJBn¥=\İ\\¤R©E \Ä\\RUuùñ±s­õq\à\ãÁ\ÈJ\Ç\ã\Ó4\r„é¿Œ˜»\Òl\Íutt\à÷û™˜˜Xd~t]g\å\Ò^\"‘ Y‡JŠy¤„ı\âE!\ê÷òºß¹…ó›¼\ãK\ÛÌ¯\Ã\Ã>8Ÿ¨õ\İHq^K€EfÆ¾¯ı¡>~\í>\æ0„°KeÕ’®F\Ò\éôóZÁ`ŠQ\r\ì\é?\Ú\\\İñ/\åb\Ü\åra{4¹\\\ÎñK\Û\Ú\ÚH$x½^’\É\ä¢ib·\ËE¹\\fó†u¸]\æh\×fû\Ù\á1úú‡š\Î[\ï}¡€ú\êN«1\ÅGš\"±¸úoX\ÄN\áP¿\Øúx¢\îÈkŒMH»\Å	@:±¸]t6%j¹‚Œ‘H$\Ì!\Ğ].T]óšº¸©™Í¦\Û\Ün7š¦!¥$“É \ë:Ë–-c\íÚµd2ü~?\'NœXÔœ\â‰©\Ô,\×Yó\å¢ZET«>ò\Ü^/+Z\ã¼j\ÛV‹\Í³\ëÀ©™d‹\îu\Ìu`«\â\Û\æIbŠ\äyş¸	ª\r¤y?Y\ç.:\æ\í¼Rß‰\nKáªô¶6ğû¸\Z™˜˜0×¦\Ø\äJ<‰<üO9Dw€\Ïó>M\ÓÍ©lØ°õ\ë\×Y¾|9CCC\Ì\ÍÕ¶\n!p¹\\4D#ôvu˜õ(¡Z\æĞ©3\ì:rÍ¨ğWoxM\r@A\Öû\×Ò®¬¬;¦¦YgÓ­ké¤±y)Ô³±\ÆqœS¡\ÖF¯VWj\Ş\Çn1`*Y\ØS%’uKºh‡œ1\Ë\å$›Íš&Z‚0s\Å\ëó<ºkÍ™\É!gNÁAy|n¦\Õ65Bb±(Š‚\Â\Ù\\/>ŸL&CoW\'+–ô\"	¥<\Åb‘Ç\ŞÎ©A\Şóú×°e\å\ík±Â¬5`i9\Çf\Ø`‰\Úy-“\Ålµ®\ÕQv\Ş\ÂQ8uŠr2©Qw§]DCA¼>¯3yx)©T*ŒS,ş\0ª¢†f³2¾\\-»l¡æ«ƒ¹ü\Üs\Ï]°½#R,¹iËµ´¶4cT+\Èb]ûø\Ï_>\Ë?üÙ›xı·£©*f¥k\ì6e2\ÍñĞ­e!‹Ç€¬@\Õx\\?p\æ\é\Ï²¶b¥sth•Aˆš‰ª79õ\ÙX—}»nŞ‚ª¨\Ä\ã‹˜`n¢\í\é\éÁ\çó¡(\n\ã\ã\ã\r\r9Šs¹\\TŒJ\ì\Ô\Å¯ª*n·›ú­\Õj•¡¡!ö\ï\ßÁ¨LUU\"\á.]ã¦­[Ì‹¥C\Ãü\ë~\Âß¾í¼\å\îW ¨5VQ\ÍşPX—¤:µ\Ë \Äy\Óöt–P­\\œCj‹\ÛÂ¹n™&yiİ·–m]úú±÷wo»‰r©Dss3õc€……\0K–,¡©©‰\î\în†‡†˜ŸŸGJ‰\Ï\ç£\\­¦\Ós‹ÿ\è»>\ÒT\Õc{4†aN§Ù¿?ûö\í»\èV¹€ßK\×I4Ä¸õ%ğ\Ò \ä÷ó±w¾•û\î¼Ÿ×‹³\"d‹³.*¬c³\nV\ê\ÄL.³L¥;/XDUQ\×*„¤X€‹º2™yJ[v|3¬å»´³•7®!•šeÃ†\r\Î¶?~œjµŠ\Çã¡½½-[·šyKiõ\rb‘94U+P¤”½v\Ä3gÎ°}ûvúûû/¹¿¤µµ…\Ù\Ô,o}\Ã\ï\ã±\ÜH\ár›e]\í\èšjf.$\Ã\ìTµc‡\íV\Æ\ÂúS?l‡I\ĞE:°®W&\Óe]¦Ó´\Ëwª\İ\â<US#†ÀQ’\Ç\ã\á\ŞW¾œ\ä\Ì4~¿Ÿµk\×:k¬`\ÚöÓ§O#„ Ÿ\Ï\ãñx‡\Ã\Ønh¹Zq-\ä3NSR€š{…¹\âtô\è\Ñ\ËnD\"ø¼^\Z\"a\î¸õ&„°š±ª‚\î\ÂF\à‚\n\Ùb\×Ú±ù6-­™C›nõ­Ã’\Ú\Î\ëS\Ç\"\Çu\"\Û\È\Ö)]Zİ¦—.\Ç\ÆY\é4—‹\Ûn¿K—rö\ìY\Ú\Ú\ÚXºt\é¢T\år™‘‘glR?FY\Èe\ã§\'G¯97²\n<33s\Ù]Tñxœ\æ\æ&‡ø\Ô\ß\ß\Ïò¥½Ø³‹BQ.²T°\êXaQ%-\ZK@Hi\Ò^\î°I`e¥‘\Ò\Ò\n·3431´¶\Ó8«úI	R’J§I-d¨T\Ê:8tU#\ä÷\ãu»	ø½\àÑ›òÁwÿoy\ÏıD\"V­Z…ªªœ8q\ÂÁ¬T*±ÿ~r¹«V­r¶|TeU«Vª\ã5\ë>W¿\ßO[[\Í\Í\Í?~œ;o»™ß¿û.g¤k\Ù!W‘9z’û±\Í3‘LšÁn\Òb°’ \ßOO[­‰Ë»:\èlm\Â\ï1W«j\à[pÀ±Á•µSiE˜7©‹\",Ó’œKszp˜gö125\Í\àøÓ³ó9\rö}Á¥\éD\Ã¢¡×­]\Íü\áğ¹\ã¶m\Ütıf\İ{€X,Æ²eËR\Ò\×\×W\ËEJN:…a¬X±EQp¹\\,·õ6\ã\ë˜\Ù\Ú\ÚÊ’%K(—\Ë\æºa$\âl\è/•J>|˜öVø\à{	X\ËbRJRóüj\Ç.¾ø‡87€Q­R5$\åJ…b¹L®PókmQK\×\Ñ5\r·®†x\É\Æõü\Í\Û^OWk\n\næ¼‰-6ƒk9IG7\ç\Óf\æ\æyÓ‡ş‰}\ÇN‘+(U*\Èó¶\éiŠ‚\ß\ëÁ­k½^TUa6•	»ö\æ\Ûÿõ$\ï{\çŸr\×\Ën\ç?ø~şô}\Ë\áÃ‡Ù¼y3+W®¤Z­rúôigT_­V9u\ê£££¬^½\ZM\ÓZ}.OÄ¹˜^1´\ëºÎµ\×^ë¸”¶­š™™q@ÿ\Ü\Ç?LW{;3\ìùCGø\Â\×bûölY±„;_ym\r1P•’©¹\'§™Mg99:ÁÙ±	2ù†!)KŠ%\Ò@\'F\É|ño\ŞC\Ä^T\à\Øki;‘µ¦`66I\ÍWvU£Ê¿üû#<µûy\êš\0n]§#£»)Á²¶f\ÖtwX\ÑÑ†Ï­ƒ„Jµ\Â\ÙñI\í;É§?ûŞ¾ƒ¯ıó\'ø\ä‡\ï\ç\İû\ìÙ½‡õÖ³j\Õ*4M[dvì©—¡¡!\0­~üa™\Z%cH&€õv€\æc“\år™şş~Îœ9C6›\åoy[6­w\ØU.—ù\Çş¹™>ù\Ö×³¦«¿Çb1PÚ”4 X©0½&¹ahj†Cg81<Æ©\Ñ	JåŠ“\çÓ»öqzp”\ë\Ö,w\Ìr}^õ\Ã{Áy³›Xs8\0H\Îqú\Ì96ôv\"hªJgc«;[Y\Û\ÓE\Ø\ï#ğòz\ÑTË¥­3_šª²²½•\å­-Ü´f%\ïz¹ùn¿\éF¾ô‰\à\İÿ\0\Ï=÷7n¤··M\Ó8zô\è¢~²\\.[­ô<\à\ïùò*öä˜”\Òy\Æh||œE;É²\ÙL¾£Á\ï]·kº\Ûq\ëZ]•k€ ]§=£=ccO\'¯Ş²\É4SóX\Ó5Z—u›\Øe­7)ˆ™^Z¨½M\nX\Ú\Ñ\Â\Şù\nù¼¦™D\ÔLºtr@ ±G\Ïkü,AQ$\Ë;Z¸¿\ã\ÕD¼nUa\ÛK¶r\Ï]wò©/<È³\Ï>KCCœnÖ¯_\ÏÀÀ€ù´ª\à÷û\É\çó¹Jµ\êt(\ÎHÊ«{2\Ó\ÓÓ”\Ëefgg™››»¨K92>\á *‘¨ª\Ê\ï¼d+¹\é‰:Ú\0„\ãœ\Ôô-‘õ~·\0s\çy\ê\rQ5­Œ#]\Ø\\v\ÃX	!\Í|T…E™ÙŒu\0\ìQn½~¤lO/¸|~4¯B¥Ra6eN\Zš\æxš\Ù\Ù$‘H]\×ioo\'\n…H&“3ƒ\Éqg>\İ~cÇ²\ßy\æ\Ğõ###í—›wM!«\æ“\Û\ànhbvhšr	²\n¥’`vÒ¹,šª\à\Ò5ìŠ—*\nÅ’¹¿0@!ªxÜ »‚ğD|T*\àrS\Ã\Ë2\'5ø\êA“;\ÏVH/”™›-‘J˜’ò¦# „DJƒ…|¤\Ä\çv\ãvB\Ã¤EÂ¡2±°›_¢\ë]7ó÷&šP,E–J%FF?zj\ÒY¯\Ğ4\Í~\ØÚU#SU”vjt¿Gw\Ïe‹ùv.#™\\\ä\Ü<\r\Ñ(™\Ù,)&Ï¤˜q£`\àóWÉ–“¤\Çğút\Ú\ZˆüBS™\ÏU˜L-0“š%›VY\Ù\ÑN<¤TT0¤$Ÿwqúd‘‘\ázW‰7y,&\ÖX,\íA…¹9 )ªŒ\ä:—FU±„‡x³Ÿ@ B£D•‰\Ô•B—¦\Ò\Ö$\â\Ñ(Í§T*‚³cIŸ›DV¼¬n_†[Wğù\r	…\ÆH³MC©Ra\ÆYÕˆø\Âø\\>†’\Ã\0W\åL{4ñı\Öh|f\×\Ó\ít€_\Ö\Ôqı®³GŠ¢8\Ëz½M=\äŠY\æsiCbHƒjU’\Ïœ\âØ\Ü>Ö¥\r47•Y\È-5j9\ÊM\ëºiK4 i*™|‘\\±„P\"B\ĞQ­r¦\ïj>Ã‘\ác¬\×:\énN \nA0\ÅI06”\ãğ¾$«7Dihô’JI%‹¤\ç\Ëò<^³…£nAp\Ô\Åñ\Ã)\ÆGr¬¹&NKoO$ˆ\Ğt\n\Ù\Ùùyf3y&gR´,\íD\"P„\É\ÜÑ‰	\ÆN\Ó\Z‹\nxY\ÖÀ\ã.rflš_ü^y\íu§@G\Ær¬ŠU¨V\r\æ\Ç3¬N¬fùM+Y\ÒØƒ[w\Ó7rœ\ï?;\Ì\"‘<\×Šş\ë®3}\Îc\ZÀ·\Şú\Ï_ş\Çg\ßx\íÆµ\İË–ôò‡À]\ï\àš\î\ÊE¦¦™\Ë\ÎQRŠú\ÕYªs‚u·ôÒ½®¡k$‡}œ\í;N*¥µ!Î‘¡M1<“¤R5p\\))YXHóó\'Ÿ ª	^~\Íz÷1=Ÿf\ã\Òn:\Z\Ñ\İ:\Ë\Ö\èøƒ:Ÿ›As)¨šBC\ÜM¢¹öX2\é\nC\ç2$÷ñùTn»«“@g;¨\Zv‡©ûı÷14•DQŸdj>\íøòOşüI>@c4Ì’–Fb?·mXM<\â\æÀ@·mZ\Ïõ7\İ@\ß\Ş\ç\ï&Ÿ.Q­\Ü\Ö{+¦‹+YÈ§9;\ÑO½¸\\:\Zj{GCkó\Şs\'\ÛøCÃ§–—«•µ\Û^²…¿ø\ã7q\ì\ä)ö<Ì3ûˆù£´7´\Ò\Ñ\ĞNGƒi…\æ\Ï\æY²¹\îum.7šª0•Í›¿<t\Ô<–¦khˆQ­”)ä³¦‰\Ç\ë\ã\àÉ“œ\ãŞ›·\âs»9L±²®S\r7¸Š\ÂÒ•!Z;¸İ¦78¦ jHö\î˜$vˆ\Ì9#j\İC:_\ä\ìøs\Ù,g\Ç\'Aš\ë\r]\İİ¸\İn\ï£\\*Q,•\è\ï\ïg*5KSy¶\ï\ï|õ\Ë0T_GÁ®F\Úò\nÿ»Ÿªa ”*E§‡\Ø?p˜™!ú§lliij\ä/½…<ú“õOİ½p‰Rf\Æ_\íñ»ÿ\İò}\Ã\Ú\Õ,\é\ébû®=<\Í\Î\Ó{\Øuz/#©1²¥ºª\â\Ò\\l¼u)\Ñ\ÖU\Î\r\"•İ‡081M¥j\àóùØ¼y3÷\Ş{/Û¶\İ\Ì\è\à\0Jµ‚p÷k_\Ë>ø×¼ì¥·ñü¾}œ\ZŸP54]§£¥¤ \\4\êO³lU„@P£~:\0a}(\nŒ\ä\Ñu…DW\Â^t—œO³\ë\ĞQ&Só¤KUTY%ô\Ñ\Ö\Ò\Â¾ùM¬_¿PÀKwG_ú\ÊW¹ã¥·3ŸJqnh˜L.\Ïógˆµµ!<>C²a\ã\nN=?J¢=Ä¼–\äC\ßü8¿8¶S§™Z˜¡b˜v=ò\éü\r\ïyû[øúw \Ã\îÀÀ;o¿÷¹§–\0”Ï¿\á}\\)\ßøµ\r«W27?\ÏÁ£Ç¸\í%[QT…b¥\Ä\Äü$¿>ö\ßø\å·ùòS\ß\à\ì\ä\0BU@(¸\\:\İ­”+e4İ…aHš››¹û\î»yÕ«^i¾[¦T&ŸË¢j*\Å|~\ïû<şÈ8uô(\í‰8ŸúÔ§ ¡…†Dœr¥˜£\Ñb±J¹d\àõi3cŸ[®¡/ S\ÈWkŠ±\Ê\å†Q¥¥»‡\Ûo»p(ˆ¬J\Æ\Ç\Æ9ôü~÷eÏ\íŒ\r\àv»y\é\Ë\ï\àß¾ım>ğĞ˜h$_,182\Î\Æuk\Øv\ãõ¨šJ0\ê\å†×¬¦\ÊRVÊ´·5¡\Ö=\Î	\nØ´n\r\áPˆM\ë\Öø²…ü¶Ÿ\İ\ã<¢9÷\è\î\ë—övk‰_ú·‡øöw¾G è§¥©\ÑÜ´jü\ÃıÉŠ%K˜˜œA÷\ÖF¤ŠE³rŠ\"p¹]H)Yºt	ºµ_¼jTp»]¸4…ùù4ÿTJEÖ¯_…\×\ä\Ú\Í\×ró¶[ø\æƒ_\áõ«–ƒ\é‘\ËTP5\ÛcO\ê\Ùf\Æ.¾mn¡°\Î\Ìdr®ˆ\Ëo)I´ur\í–9w®—[GAJ\Íó\ä\Ïş›\Ó\'‘_H\Ò\Ò\ÙKµ\\Ab>Ã´zõjÊ•2^›…t†_=»›\å½=xğ ¢*lÙ¼‘\ï|\åüªö\â\0\0 \0IDAT3ôtvğÕ‡¾Çƒ}\rkV1<<Ìª¦8_üÆ·ùü\Ç?\Â\Í[¯\ãÛŸm/VJ5\àŸ9y0–+º7¯_£\Ì\Í\Ïó\ØOÿ‡¿»\ï5T¥Á¿>½“l1\Â\Ø\Ä$¿÷\êW\Ò\ÚÜ„aHöş\ì…t	¡B\Ğ`\Ã\Ú5twv²\çùı\ì\Üw€‡ş!·\İ~;=]]\Äb\r\Ä\Z\Zhˆ7pÍ–x\ì?~@À—À\ëv±\é\Ú\ëhlj\"\nñ¿|/ûŸxŒ[\×.\Å0ª¤’%‚!5_Ú±\ãÆ›¡ˆ‹ô|™\Ìl†XC!£\ÊB\É`õúM¸\Ünšš[ğy|¬¿qn·?ü0\Õb¬X½Ÿ\ßO¡Pà©§\â£ùº|ö£\ä\Ş\ßÿ=|>/B\ÂÄ¹$Š¦\àòjl\\³Š«WcH\Ãy@W\ïx\ÕKyÍ–kù\ë\ï>\Â\á\ã\'Ø´~-Bˆ\Ğu=«»y|\ß\0%•›\äJ…Ğš+8v\ê¥|u=t&\âœ>\ÛÏ‰\Óg(–Jœ\ê?‡Exƒ.²óy¤¬=-\"DBA¶İ°•m[®eğ\Ü9~ô\È#<·w/\Ùlõ›®Á\íñ\àóy¸f\Ó:Zšqyƒ¼ò\î{†BH)ihh`\íKn¥l@¥\É\é\Ímö–?‹\æ\Î\à\Î>7¿¼>\r¯Oen*•2R€!!\Ş\ÚA8 \Z²|\Í\Zò¹<ƒpØ\Ï\çF÷ø¸\á\æmLNMòÀğ\çş\ç3|\â/\Ş\Æ¼l>k\İX\nH§\nxƒnT\İ\\Î³\ïsvp€ÁÁaš¢¼1¯‹SgûiŒ7‹Eb\éB\ŞÙ®­µ„“\Ùù\æõ«W26:\Ê+®ßˆ¢*|\ë\É_qû†5\Ï$9\Ğ?\Ì\èØ„³\Ü\Ø\á\Ø\îA\ÊùnÕ…´\n&„À\ëñp\ëµX\×\Ó\Æ\És\Ã\ìŞ±=»w\Ñ\Ú\ÖA4\ä±>JUó\ïˆó†?~+\áXŒA@¢k\Z\r‘z9Mjx’b¡J¢\ÉS#¹MzË¼˜S\Æ\nH‰Ë¥\Ğ\Ù`\ä\\–u½©\êx!òù¼³cbÍºôŸ>\ÍÁ\ç÷3::Á\à\è4·\Şù\n¾úµ¯³g\çš#Axû¸ó\æ-4\Å\"¨(d.r¦†R\Ä\ÛC5k‡Y 3ıƒD~şêµ¯\àg\Ïdóò^^½õZD¹L$¢»£ƒÁ³Ã«\ìZ©RŞˆ7(¡`€\å›\Öğ’\'\Î08=\Ç\ß\ß÷j~fÏ\ì\çô¹\ì:\':£¨{‡9ú›~z7´nš.œ¢\"ªUi\Ğ\Ğ°fi7£3\Ì.¤\É\'\'iğ*toX…®iœ\ÚóN…h\ÈO[\"N ££T\á\Ä\á‘¨‹`\ÈòPk\Í\Ôy.\Ö.%\Ím>Î\Î0ŞŸ¤y©Šˆ’™c![Àn—ği’kW\â‘%´Rš\ì\Ğ)V„ƒ\Üó·±i\åR\ÑH\Í•Š\Ò3O$IM¤YwK\ï\â>^J‡G¹ny\×-_Â¯§\èrñû¯¹W(JJ÷\Ò\ÜgßÃ­şÅ§=÷|ù-S\Ì5wõ´\á\Ò5Dµ‚\Û\çe¾T¦¥)Ns<F<h¾[²p˜\\¾€\Ï\ëA\ÓU6½tG¶÷³ûñ>]ašºˆ6\Ğ*yT!Q\İ.P5¢~?Ñ¥>@P)ä¹¹§	£bNY!†ùRM\ÕP¤BrxS}shš\Â57DQõz{\îT\Õú²Yo†B\Zk¯‰²\×4­#9zW\Î\áyğ\é:\è:Šªj{H:­k—r\ë²v\Ün\Í\Üûc­ıJ)©”\ÍQzz®\Ä\äø,\ã\ãÃ¸ü6¾t	¨\×n„€\ää™³”+:\ã4\'b¬_±„™Û‚! J\Èï§¹±!D\ïlv!\0´‘\ÔT\ïúkV£k\Z\Â0İ±Æ†(¯\Øvº\Ï\ËÀ\ä4¥J…ñ\É)f\ç\æğz›‘@(\á\ç†×®a~*Ï¹#£œ\Ø=@1S\Ä\í’D\\\Ä\ân\Ü\r—\Û\ÚV¡¨ \r¨JŠy‰!%¥b•JY’\ËV\Èe+d34]\Ğ\Ş ³7€\Ûc»h5 %8Ó¾µ\ÚK¡Z;ü¸=\Zı§\Øı«1\Ün@H\Ã\ç\Óq{.—Š¢\n\\nU5[P)[AR¡Z‘rU²™S\nù2\Ò4$¼¬\İ¥i\İR—9UQ\ã‚\àLÿ\0\0gF\'AQ¹ı\Æ-ü³U\n\ÛM$BU”\ĞññN`F³\êB 5Q„•\İt7\Ä8°ÿ3™+:;›`j:I{³õ.!P•X³ŸH\ã2ò\Ù2Ù¡1*¹©™\"Scy*ƒJE\Öl³T©d %T\ÊnB0ä¦µ\ÃO ¬\á\èx¼*B˜ÏŒŠº*:SÀ¶X\æÀœ‡·m4$\ÜDbq2er¹2ó\É\ÓEr\Ù2‰ª*hº@¨b‘©\Ò4¦)x¼*=\Ë¸½*N ¨£hQÎ+\ä\Ü\Ç.Â™~³c=64\Âlj­\ë\×jh\0Rs9Ñù~@‹øcGŸ\èJ¦\\\á–óu#\é\Ô,“³)B\á w®\\\Ê\×ôSF\Æ\ÇÙ¸n5X·¶	§(\n>¿Š¯A…˜Ÿ\æ6Ó´˜­ö‚‚p\Øjµ˜\é\ÕÀC\ÊZ\\\é\\­‰¬}	+/¨%W5\Ç\\„£.Z\Ú}¬X_\ËGZ&\Å<±Ì•\\\0(u\å1\×}%rpyš\æ\Ü\à\Ø\éÓ¬\ê\í¢)eg\ß)z:\Ûñ‡#¨.\r\Ü^&g’9~$\Çn\ß,€ñ…¾32:1ûİ‡.7B\ÓAHM£R­¸~\Í\nò…\"‡úY,¬k\åX\ËŠ\êÌ‘˜«@\æGQ\Ì!½P@±W\Ö\æ D©\Ås€°eñò\Õy\ßV|}Q—VJë²¨ÓŠ°\Êb—I¢¨ „4E¨˜ïµ±IP+›J	Y¶:j\ë™lsC£DƒA6­\\F®XDU„BUÁ\íaû\Î\çxö¹}s¡†\Ã<ş\0eM[\ï\Óñ@ä¿¿ÿ\è\ã¥\í{Gº½ TMÇ¥k¤3Yº[›QU…gv\ï\ÃY6\Í\æ/\àª=\Î)%\Ô\ï^°\Å\\ùwP²\ë®	j\Ç6®\0B.º\'Xk«R\"\åyimE\Ö9µ\î%A \Ô\é\Ô\Ş\Í`)\Ì)[]Ó¼š\ÑÌ„\Ã#£$gSDC!*\Õ*AŸE\ÓŠ@\ê¦\ç\Ò|ò‹\Z¥Bi \àñ8\Ï\Ö+?;´c,ıû\Øø\ä\È\'¿ğUgh”\Ş\ÎVt£\Ê\Ï~³‹e\í8\ÒW¿X%¶·P\ä\"\à…û\êA>ÿƒ©a\Ô)é¼°º\Ë&—\Ùo)[Jc^µ¸vFuùŸG\ê@—¤št—£+$œbjf†\Ô\Â<§\Îôs\ëÆµ£Ÿ4*Ÿüâƒœ<u¶Icûƒo¼\ág\ì¤\nÀ\Ç_÷K\í\ßûÍ®=SÿöƒB(‚\Z\Ğ\İ\Ó\Ã\ïİ²•ŸşúYkŸ\É\ÃÃµNOZÌª™®šrA¥\ÍóºŠ\Ô\\\Ö\ç#­øH\ëz}>\Âús­$\ìGR{‹\r õ§\î>\æu¹øºÕ‰‹óú\rtRQk*”\çG˜›\çô\à0·oXE÷’<\á\Ò\æ\É\í;ùÁ££©\êö°/ô\ØGü5g\éO¸\çK÷W\Ü.÷—‚.\ßö\Ï\í¡\Êÿüf2\Ô@Z\Ñp‚¬\ï\î \ï\ì\0\0Oo!\Òú \êüEE\ÚOM,bº}Tª¦.Áÿ\ïö\Ç[º2Å€Tx\ÔuJ¤³9ö\ì?@µZ¥·¹‘e=]L«ˆh‚³c|\àO•r\ÙüÎ·o»ûÿ\ì:}p\Ñk½|Ÿ¹\ï½3\Ë\Z;>)«\ÕİŸùò\×972\Æp¶\ÌŠñ\\\î\Îv<n7û˜k†õ®\ÍeCQ@«{]•(\0¤Y^Ëµ0ûNaE‘\è\Ô.ƒ\çu\Öı\ìN2lp\íc;gm«¼ó§üEıÇ°\Êk•Iwƒıú\0L\àr¹<‡û\Ó\ÚÜ„ğzù\æS;\Øyzt±\Â?\å\Æ\ä\Ô\Ì\Ñ%‰öGç“‰±¥!ø\ÖXù¿{Ÿ~ù3§÷\î\Ş×¼r\é¿|\ì\ïµr\Ù|$ş\Ä\é3ü\Å\ß|”x,\Êcı«ùraòÕ¶\n 3™Y{eX|µ:f»ƒv®s¡\Ø\×\Í\ï\Åg‹9Aµ<\Í\Ëu>ÿyau‘e[“ú‹–V\Â	ğúÂœjB°c\Ïs¼ôu\È_ş\é[xßŸ½\r¡*¸t\ßüş\Ã|\âs_É¨R|¸-ÿ×¾ñs\Î…:y\ëC3\Ò\Å\Ì\ÓMÁ\Ø7ù\É\Ïü\Çc\Ó\Ğ\Ò\Ô\Èu\×\Ó\Ñ\Ú\Â\ÔL’\á«\"fõ@€0g\ê\Ğõ”\È\Z\è°„š¡Zœ\Âa7\Î!H3¯\Åù[‹mX\n¶Ã€Z?b§´\Ã\Í33Š¬u]v\\\ÕeºÚ–\Ò\íş\äW\Ï\ìÂ¥\ë¼ô\æ›hin¢)‘`\Ïóøò7¿›q¡ı\à[oşğ\×/:œ<À®\ÓG*‰PÃ·Üªş£O|î«•ü\ÌHÎ¦øıl^¿–©™$§­’\ÕL°ÿjº¹\È\ÆAZ ˆš\êˆ\å\n\Ú;\ØjvZ\Ô\Øj+V(u,¶‹ \Î3\ïõ\èŸ\Ç\0!)\Íö.By·W.\Ù	‰´¼µb±\ÈÏş5]í­´4\'˜I¥xğ¡\ïñşşS!¿{zë’µ_z\İW?pÉ—¹-^¯²d,5•ÿ\Ê~p\Ïc{~Ñ°}\×Şÿ\ÑºG\Ç\'”¡\Ñqé£«½•m7nE×´Z5\ír+\n\äóP­X—¥@­¢`v¢u]k]§eK©Tbzz–Sƒ£ŒLN\á\ÑU4¡bT+T\ÊUR\ÉYö÷df&Iµ\\&-f~ı ¬¦SóTZ]½ -…H[\å¢QH\È\Ú]ef „\à™\İ\Ïñ\Í\ïÿ€\ßG&“\ão?ñi¾÷Ès¢d<²¢¥óÓ¿<¶\ï—‘‹ğ“ƒ\Ûó\×õ¬\Ş\és¹\ÇK…’ö‹;µc§N»½j\Üóª;ñy}!M\ÒH³ã«–¥‹\í¶y°+˜ıƒ•öböë¿g\Ïr\ì\Ø)~±{…t†—Ff~…\ä,?ù\Õ;IPSñû¼46\ÛOT›Çº\Ù\Ó\É\Î\Íí±€]»\Ù\ÖU\ÆV¦#aP\Ì0”\Êe¾óğcüò™LNÏ°ûù”\å\á°7ğ\Ğ\rK\×õ\é¾\çj›\å/!¯q¼\ï\Î7jÏ:\È³¡öhS\è\ìôğ’\ão}ò‡\ßm¼\å\Æ-d!\0Y\È\Ãl\İ\Ö6aš‡ğu\ß\çñ\É-¤?7@._@E\àv›úH)\ÈŠ¨ª 	\Ó\ÔÕ\îÑ­°\Ú=œ¾Ü¾¥0]L!­oG\éÒ°\èş\ÒA#N<	œ\àşW>z\â—/_³\åo¥$szjxbC\ÇòÌŸ\Şúº\Ò\Ëşù\\I4® ÿò\Ä÷+À0\×7\ÚOÀ\í{ƒ7üğñŸq\ë[\ê-*N¥u„\n²º€EŞ…=9f]¾ò¾`xks“\ÓT\Êe\ÇD(`nwiD›š\ÑÜµWİš`×\êX:\æ\Äü_»©­\ç@„\å\É`+KÀ³\Ï\í\çÀ‘cx5\×\Ü[¶½\æğ½_ú@\à\Ô\Ä \ì}Š«‘:\×+\É\ën‹ø‚¿~zû³¥3\ç…9P@\×j4³+(\ê+jWR\ÖUÿb\"\Çˆw´¡»\\E˜\Í^¸ü>\Z»ºğ†‚‹\'-m‚y³l\Î\êb¶\Ç\â\èk4n\Æ4„ù(\êıOówC\ÊÅ­ÿ\Ï»ı»ÿ”*—´ñ—’\ãc\ç\ÒnM\Ïe\Òw\ÄcQıúk6¢ª¦şX)#JEVaÿ±\èdº—Š\å	jöœ\×\ÉP\àr»	Dcx>\á0±¶\"M	t—Ëœu\ÄL/œ¼\ì¤öı…\ÅòZ\×Mwô‡Q\\ngô,§~½ƒÿó\Å\í\×Bº‹Õ’/W.\îœA\ï~ÁŒx\İ\æÛ¶—Š¥?{úWŒML\ÖCk	a\î\æR„	¦u\ã]ôzƒe²\ÈO5AQ5\r_(Œ?vö\ì€\íNÊºO]^õ´\ê§2Ì¬­rØ»}_MG¸\\f¹­ \Ô\ì\ßüşÃ”\Ë\Î\Ó®¹\\\æ\Ædfş’\ï¾”¼(\à_±ş%gzm\ïyş`\é\Ç?}Â¬Œm…\Å8·¼\Öj3S	8nV%í‘¯\r˜t¾L²ùóóó\Ì\Ï/P,–¬µÀB:C:c~\n…U\Ã@\Úeqr«b‘Ø—\rp`Ò¬‹ªB¨¡¹0;`\Ò\à\'O>\Å\Ïµ}Q6R\Ê\æ\ã£\çşò¾\ë_¶\è\rLW’K”\ê\Êò²5[zwŸ=úX\"rÓŸ<\âjinb1»BJdjŠ\Ù:V\Ú\æÀ¢Qıdš€j\Õ —Í‘ZX 5ŸavnTj\"\Ì\Å]Gj\Z™4ª4‡T‰\Û\í\Æ\Ğ\Ô\ØHK\"JÀ\çGU58j0g\í‚J§TuEn?õÀ\Ø\Ä¯øƒ?\æ\èñ‹şÒ\Ñkúğ\ç\ßğş\Ï\Üó\å\\Õ‹˜_°·\åÚ\Õé±¹ic29³­T*ûo½q‹ó>{W•@ ].\Ó\Ş§1\Ø\Í[\n’\á±	9\ÎşC}\ì\ŞwC}\'˜\ZŸd~v¥\\&\á÷	ø¸uT£\n¥\"!]\'\æóöz	y<xA.“e`p˜\ã§\Ïq\à\è1}ş {öb\ß\ácøı>š\Zb\ÔO9ˆº/PLŸ=Ü€\âöRHAµZ\áó_{ˆıô¸¨D©RNôõ\ïı\ä=\ï\Z}üÀo.¯N^4ğ}£ı\Æ\'\îy\Ç\àÁS\ÑÇ­I\Äc\î\rkV£¨Š\Å{iN+ª9\ê+¡joÅ–2+¶Í±}÷>²T+\æ\Ò&2(±F\Ü-ˆ¦v\æ4/£…*ó†BNõ° ºIû£È†fŠÁ¥`ŒEg`p—QÅ¯\ëD¼nò¥2Ë—ö²yı*\Å|@:3œXD.7D\âf\ß$,—I¥jğ\ÈOş›}ö‹\äòv bTıŠ\ÅÉ…\äş\é\Ñ+ş¸É‹65¶Ü´l\Ã\Ê=ı}´¶4­ıñw¿Î†\Õ+±Í½ùmı-\æa.\éL%Ô¦`08:Î¯w\ìbC{+†”\Ì‹\ät?m+×°ö\Æ[ğƒHif\Ë\å²óš!\éTŠ“ö1\Úw!CGC¤\ä\Ø\è½+–±ri7º¦;)³ps!^Œ™óL\"\æÁ±“§¹\ï\íÁñS\Ì\ì^ šªx\í5·\Ş÷\È\Ş_¾R\Ü\Íx[¶,Y;“/ONOm\Ş{ğPü†k¯\r±\ÎC¶\ZTsS•BZ\ï4 ­Õp(@$\å\Ù‡\éL\Ähô«’\Ò\ä{~õ4ûw=Ã¹¾#¤fg˜›œ 56Â¹¾\Ã\ì{ò\'zò\'ÄŠiZ½\ZQ¿iHNM°n\ÃZ–÷ö¢*æ‹ŠLĞ¥U$‰PT„×N 4u‘û*€sƒC¼\é]\ï\çp\ßq®F)cS\é9ş\é\Şw>ıÄ‘]—}öÿ\Zøcc\çø\È\ïş\É\äPrr\êğ™S[œ8¾\å\Æ-D#a+†\ÍjLFin(À0\Ì&\İH\ÂÁC2:>AC0€®jx].šB>\"ªÀX˜#3t\ìP?¥‰a<¹9:Vô´0Š%009²n\Í\n4\ÍZĞ¶Wª,‘Š‚ğ‡R©[ô¶\Ú\ê\Øø|\àSür\ÇN.÷\äy\"*ÕŠ{&·phtvj\èrÿ\×À<qdWùC¯zë©\äX\èğ\é“K\Î®Û°^D\Ã!«BE˜<ªfn!©”À¨1\ßVB4¦d¥ZÁ\ï±\ì-\æ\ã\ïa¿—x8D\ïŠnšš4v4a”*¸>ŒR…b¾\ÈXj´!¸\é†kñz<Z`%H¡ B1¤/ˆP\Çü\Ø$XHgx÷‡>\ÊOxšJ\ÕñÙ¯JªA)\å\ä[·İ½o\Ï\Ù#—ôp~+À<qtgõöU\×\í¯V«™İ‡-Û½ÿ@Ã’\î.º­\ßCuD`¯\Õw¸f¸D\àri$\rô\"—\ËS©”q»tT¡8\é]~/\å\\\Ì\Ì•B‰ôBš±\É\Æ\Ói„?À\ËnÙŠ\×\ãv€4oj\İC\×¡sFÖº±]Á\Øø$ıŸ\àÿ>öÓ«~oşy¢+\åB©¸c|~f\äR‘~kÀôö?t\×IM¦œ<¾u\çs\Ï–öt±¼§\Ûa®-BSM\ÓS)aO¦™ó+\ÛE[s#\è\Zó…}gO¦\È‹¤\ÒY&\Æg˜˜e`bŠ¡\é$\É|`,\Æò\ËY³bºóXŒXô…¢!\"	p{\Â^	\0¤@Áğ\Ø8\ïşÛğ\Ó\'I\åÅ@\Õ0¼e£¢\äJ…ÿºTœz,~kò¡»şXû\ÎÎŸm›\ÍÌ¿\Û\ë÷¾\æ/ş\ä\Í\Ê;\ŞüFõ\ë´`vr•2r!‰(\0{:\Ì‰1÷¹\Z\æ„™lt\ÖzrI$\Â\ãq¡s\'˜°~\'\ÊÒŸ3\0\n\Â\í†`¡\é\Øf¦J%v\í{÷~øc=~’«7\é—EˆS›ºV|\ân|\åş\êÿr½ú­2Ş–gN4\Ş~\Ëk\ç\Ç\çf–Œ\ÎLİ¼c\Ï>12>Á\ÚUË‰Ç¢XF\İlıªfn„ªTÀ°W­pÂ…\0UUQU…¹l†#$\ç\Ó$\Ót\İE<\ZvŞ•‰\ÍaQK\àñ!B1s3Rm‡@\Éeù\×oŸò³œ:{\î\ÂÊ¼H‘\Ëeb™Bş\Èg\ïû«±7]üÿøë—¬ó\í;wücc3÷µw´G\Ün7û\â7;÷ğùY\Ú\Óen·\âEA¸\Ì73‰j™Zs0²©»wÿa\îÿ\Ü\×\Øñü!ú\Ï\r’Ig¸n\İjTkS¤‰§\×\Ä\\€/€E\Í~\Å	\åJ™½pÿŸ\ä[?ø!\Ó\ÉYTU%\ZR.—/úcõRÿF\Úú_Ã©Q©V\Ú\'’+OLş\ê;ò±ù\ßù³Z\àù±rmÏª\Ğ\è\ìÔ£¡\æø\ïlØ°\Ù\ÙYv\ì\ØA¡P@Á\Û\Şxoº\ïul¹f£š½p!sDf\Î\ZhY>·eZ\æg’\ÌML:*ñƒ$:;©mÑ¶\í‹0\×J!„?d\ÙssV§jŒOğğ\ãÿÅ¿|õß˜šI:\åöx<lØ°d2IÿeÁ‡Ã„B!\Æ\Ç\Ç1ƒh4J2YË«^¼.÷\r\Í\ïıò}\à\Ä\Ë>ı.\àÿ\ã\ïX{ƒ˜XHn+	cckk+ªª2>>N>Ÿ\à\Ğ\Ñcl\ßı¥r‘\rkV\ávYOöY¦G\ènøªù¤¸\í¹<¼\0şh4B ¹\àùR\0\rBQ„/¢\ÆL$<ş?Oñ\áO}–\ïşğ1Ò‹Q¹R­23=\íü\Ëåº¤gS*•\è\èè ¥¥…\Ù\ÙYšššœ_8_*\Õjg®œ_2µ0·÷\Ô\Ä\Ğ,ü–\ßmº¶5\Òp\ãl6½e|núš†¦\ÄÊ­[·\"„ N³w\ï^’É¤\Ó,…¬^¾”¿ÿ=\Üõò\Ûq»\İÎ´•”riÈ§Mûoñ\ÜlXk¦D\İUEAj.D8n®€¡˜3¤\Ò`\ïÁ#|ş\ë\ß\â\Çÿı$ hllDUU­§õ.&¡PˆeË–111Á\Ì\Ì\Ì¯øu»\İ\Üx\ã\èº\Î\è\è(n·›Ã‡Ÿ÷C«%š¢\î»}õu÷¯m\ï\İù[cüû\ï|c\ç¯O\îÿò|%ÿ&WĞ»¹X.\ÅE¡««\Ëy]4\Z%›\Í.ú\í\î\é\ä,¿Ù¹‡B±\Ä\Ò\î.Bö2İ\Ğ=H„Qq\06M‡\Õ\ê@\ÇB£\è¦d²YzøQş\îŸ>Ã¯Ÿ\İM,\ÖÀ\êÕ«Y±b\Å\ï\Â?_Š\Å\"‰D‚õ\ë\×‰Dğz½ø\Ì\\!`…Bb±\ápø‚Ÿ\Éö¹<<>\n\å\"†”\Íc©\é©\\ºú[ş\í\Û^«=²\ï\é7—ö\Æë¯¿>\Ø\Ô\Ô\Ì\Ü\Ü“““466\âõš~³\Çã¡¹¹™r¹¼\èG_rù<{?\È\Ïó-MM´67š¿\"&(*\Â\í—ù4¹°}L¬æª˜O]Œš©j.ß•\Êe\î\ãƒÿ4>ô=’©9–.]\ÊÆ‰\Ç\ã$“I=z\ÅAR6›\Å\ãñ\àõzill¤±±‘öövººº\è\ê\ê2_\Ø\\©\n…\ĞuP(\Ä\Ô\Ô¥’irª†Á¦\Î\å÷Ê¥T¹Z-\Ò\èY\Èg+¦fs\×Êµ§&‡¾Ğ³|\é­ñ†¸rø\Èa\ç7¾ƒÁ \×\\s\rN\ï_­V¥¯¯t:½(/¯\Ç\Ã]/¿\×\ß}¿s\ËMø}>\ËÆ›,—\Õ*ä³ˆj\ÅTŒÇ‹Ğ­}ù¦CÃ#Gù¯Ÿÿ’/ı\Ûw˜_H\ÇYµj•óóI\ÙL–\İ{v‘L^\Èv\ÇC¹\\¾¨B\\.‡\Ö\ÖVş¿\Ş\Î<6’¬¾ãŸª®¾\ï\Ãv·\Ï¯\Ç;\ãsfggw²ID€\0aC¸‚’	A	\"!B@$„MD!@Y’¬$$ˆ ¢À‚Bv\Éeg\ÙñÎŒ\í9<¾\Ûn÷\í>«»«û\å\ê.w{\ì{#ò•,—\ËU¯ª~\ï÷~\ï÷~\ïwŒb³\Ùô\Ñ\×ü¦\\.‡\Õj%s\á\ÂC\ŞOôüÁ\åõ…‡?ó–Õ²§\Ç\ÌşŸ9ş³¿ñA\ÇSW\Î´n–^76vÂµ´¸\Äztg¥\\­VI§\ÓƒA\ìv==•\Éd\Â\ëõ¨V«Cbhš\Æ\Ü\Õ\ë<ñÓŸ±´\Z\å\è`?\İ\Í\Ò:‡\Ë\È+\Ø\ì:§Ë¦¦d’He²ü\Õ\ß~•‡¾ğe¾ÿ_ÿ¦\Õcll¿ß$IT«U._¾L,\ïP=w\Şy\'½½½¤\Ó\é=\'\É@ @ `ii	«\ÕJ  ei%Á\Ş\ÜÜ¤»»›F£a\Ô)W+¹¿ö]\Ïı\åÿq\å\Ùc\Ï>÷\Ê	ÿ\Ğ[?¨X\åä¿¾ğ\ã¯\Èv\Ë{O<\éôù|‹ER©T‡*V­V\Ù\Ü\Ü\Ä\ï÷\ãp8ô¥‹¤W\Ó\é\ë\ë\Ç\át’\Ëå¨µe=-•+\Ì\\š\å‘o|‹D2³9\Ü\í6ks…ª#‘\Î0syGşù\Û<øû\áñ§~B­\Ş```€³g\Ï÷`nº\×\ë\Z³ss,,, „û\äõz9}ú4§N¢»»›\í\ímÖšÁ\íƒ\Üÿı²½½\Í\Ê\Ê\n.—M\Ó(—\Ë4\ê\r\n…‚‘;\Şjµ\Z•ƒ\êz\ïz:~å¡·ş\Ş\å]ú™¡ ¿\"¼\íôk?6{\î‹N¯û5§OŸ¶¸\İn„\ĞS\'.,,077w\Ópõz½†\Øi‡‚T*\Å\Â\ÂÂ¾ZF(\à\çÌ©i¦\ÇO\Ğİ¥,‹¼p\áÏ‰D*ƒ\İn§¿¿Ÿ\á\áaŠM \Ú\0\0QIDAT\Ünw\Ç\"§\Ñh°ºº\Êùó\ç\Ñ4\r«\Õ\Ê\È\ÈGÁ\ÕL,Z¯×¹t\éW¯^\íxv \à\ä\Éiººô÷\Ş\Ş\Ş\æÜ¹s‹Ec»SQ$I§Fı&ı¿:\èùö«M\ä_{,¯ğüo\ä·ıõÇ¿\æ\nø\Ş}\×]\'g³(ck¤i\Z[[[\Ì\ÏÏ“\Éd:¸\ß\áp099Ioo¯‘¼u¯¦iD£Q®]»F¡P\Øs¸›L&\ÌÍ­7\êH’Œ\Ëå¢¯¯şş~œN§‘\ï\ØX”	Á\Ê\Ê\n/^¤R©t\Èüöº†ªªò\Ì3\Ïó“$I099‰\Ó\é4\Î	!X\\\\\äò¥K¹±\È\ÑO»­\ç\Ù\Ş\ÜNİ»°µzO­^¿O–%\ËP°7¾’Ü°\ÔE\Ãc’\åõ~÷+©\Ø¼‚\Ô\×\Ş÷\Ëg¿÷÷÷D3ñÖ´j\Ø\ét\à÷\ïT€”$½ ¬\Ç\ã!‰ (\n\Õj\ÕĞkµ\Z±XŒb±ˆ\Ë\å2\ä¾$I†\ì\ï\ë\ë\Ã\ëõb·\Û\r­¡=m¬V¯cRººº™˜˜`||œp8¬¯Ú¸¼%“\É$/¼ğ²,s\ì\Ø1&\'\'ñù|\Ædßº®T*177g0J8\æÌ™3z’~i§M\Ñ˜\Í’‰D½T*=õ±7¼\ç\Ñ/=ö­¹D>ó\Ä§~ñÉ‚Z\ÎZ\Íf\Ş4}ÿ\å\ÕòwjõZ¯Z«Fúüİ¥D>ó?ğ\n#¾6½˜Xÿr­®¬\×R:Á\ãñ\àv»\rn\0ı\Íf3¡Pˆ,ù|M\ÓB\Ë\åH¥RX,\\.}Ä´ (\n^¯—p8L8&‰ºr\ë\Ü\è\è(\Ã\ÃÃ­\Êb{¾«‚|>\Ï\Ì\ÌN§“\é\éiCl½c\ë™\0©T\Ê(@\ãp8˜šš2’ï·ŒÚ±XŒ™™–——)\n&«b©x®\'^\\š+\0\\\Ù\\\Îı\î/½õ%!ñô@(|\í3?¹r÷Ñ±\ë\åj%²¹ø\áG¿ø\ß|öG‡\Ó\ã¿ô[\èú\îù\'¾]ªªg¥_}\ã›(—\Ê\Ì\Í\Íb·\Ûñx<{rœ\Õj¥§§‡¡¡!L&“ÁQ…Bµµ52™Œ^¯Y¦uŸ,Ë˜\Íf.—‹`0H(\"\nuˆ”v\âNpUUY]]eee…¡¡!¦¦¦p¹\\í·‹G€\ë×¯“N§‘e™“\'O2Ğ¶‰#„`ss“—_!\nO&©Tª’Ù¤$\ÕZõÑlÂ¨\Óô³k‹‰h\æÙ…K€µôVô·\á\rWS1Ï½wL]üŞ…§\ÕC~!¾ö›[¹Ô»\ív‡ı\ro|ııº­bssƒ\Õ\ÕU‚Á Q;£ı\ãZ\Çf³™\î\în\"‘===„B!|>õzd2I*•B\Ó4\Ìf³‘ğ~/´ˆµ›cA—Ó‹‹‹,//¢¥¥¿·\î…\Î÷}bEUUß¹IÎŸ‰û\î>\Å\ç?óI®,,²²\Åes<õ§¿ş\ïüûKO\ŞÒ¥ã¥•+\éúÀC\ç|\äpQó¾_|\Ë\à‹Ksª\Ökg\îº\ë4\'\ÆÆ‘e]œH²L\"‘`ee‡\Ãaˆ\ØûC\Íf3N§Ÿ\ÏGWW‘H„H$‚\ß\ï§P(°´´D:¦R©ò½\å\Ö\Ñú]©TŒ¹#ŸÏ³¾¾n\äkoU¨‰D\"û\Ömj‹\0\étš¥¥%\"‘SSS\Æ}zƒøVŒ™™\Üwzš/<ôi&\ÇN\Ğh4xò™guQ»‘ˆ>\Í\Ä÷·=4ñ\ç7Œ8\ÖjBnÿë³¥ü7œnWø\Ío~€\Ş\Ş>@/¥¹•LP,xù\Ây\êZS§N‰DŒ{÷\â\Ü\İ²û|>Ÿ\'•J\éú}­\ÖQˆôÑ£(\n•J›Í†\ÅbÁ\ëõ\Zj\ä~\í\ï…r¹\Ìüü<\Õj•©©©f¤‹h¦p_\âê•«\ÜrŒ¿ûÜŸp\ä\ÄH2©l–_yÛƒ\\¿\Z\nFŞ³’\Úüñ\íÓ\Û&\0<ò\ŞO+ñ\è\×“ùŒ-\Òİ­§NQUİ™N§‹ñ‰I\æfg™™™A’$\Âa½ \ã\î\ÅHKD\ì>\ßÇƒ\Ç\ã¡\Ñh\ìY³Dß•\ê°\íòúví·®/‹\Ì\Ï\Ï\ãv»9~ü8‡CŸ”sy\æ\ç\çI\'¼óu¯\æS¿ó G‚>¨U‘,6>gNMqyşj \àô¼ú°„?¨	9}¶õ\ÌÖ‡2\ÅÜ½SÓ§ô…\ÄvA·µH€\Õn\'’L$X[]\Å\ét\âñxn’Å»\å\ë^h¿¦EdY–1™L\ì®I¸ûışn‡¦i¬­­±¸¸\È\ØØ˜±®¨T*lllp\î\Ü9ü+Ÿûğûø\Ôû\ß\İL—\Õ@H&\İ\\”U•\ïş\àG&­Q¯”ª\ê7÷}\Ø8\Ç/&6”J­\Ú\r\ĞÓ£s{£Ñ ¬ªWµœ~]N\'NŒq\é\ÒE^~ùel6¡P¨ƒo‡öùa?1uĞ¶öBµZ\åÆ\Ôj5&&&p:õp›\\.\Ç\Ü\Ü±XŒ_{\Õ=|\ì=\ï\ä\Ì\Ä	=““:wiúzD–`\âø\0$ó\ÙC¹h\Ã	_kh4„P@·ŞnS«•\È&„¿Ÿñ©i®\Ì\Îr\î\Ü9<^/fEatt¿\ß\Ó\å^£\áV\Ø\ïšö•\ê^\×\n!\Èf³,//\ãóù\Åd2Q*•X[[\ãÚµkzQ\Z\àş\ì“8\ì\í¾9€@\ßF q\Øm˜L&\êõº\í\ß>üy\ß\Ûş\ÄN\é\Ï\Û\à@	»+È´\ĞQ&Y\ì„H’„\ß\ïgbj\n\ÅlasCW7Ÿşy\Ö\ÖÖŒkö‚\âPc;\Ú\Å\Ónñ\Ö2G¬­­öt!\Ñh”\ç{‹/b³\Ù824„$IUI¢©~4¹]`|³^J.\è÷á€´l\á@\ßn\r¼ZW‰\æ±\Û\ãabb’ù¹Y\Òi]C¹p\á©TŠ\ãÇö\ìWŠ\Ûuú\ÈL$¬®®\âñxÁf³‘\Ïç™%S©TP…\É\ÉI*•\n\Ñh”D&CwÀ\Û\Ö\è=±Ã„u­Nv;°*7Y\Æn…ƒ¾m¸\íW­C\\´x|>&§O27{™Ts\ßòúõ\ëD£QFFF\è\í\í\Åf³zó\í&\\cNÙ¥±!İ¾¥\ï—\Ëe666h4\ZŒ\áóùH§\Ó\\¿~¥¥%\Ã~$\Ë2###tuuF›ômg#0”×“Hg·©\Öj˜M\æ\ì;¾rp1$|\Ø\ãold\ãY ¹ct0.m½¿\Ã\åd|r’t2E&“\"ˆS*•¸|ù2«««„·Z­X,º\ã‘\Ó\éD–e¬Vk\ÇBH\İ$\Ğ\Òñkµ\Z\år¹ƒğ²,\ã÷ûz\ã\Ùl–.‹\Å:ªü€n®>zô¨a¢d™õx‚ñ‘#m.vˆ\ß\Ä\Ú\Æ&\0\İÿF4\ç08\áG\Â\Ú\å\èu@‹Ç·”\ãÇƒ$a’Mh\Ô\Ø\Åú$‡D;O\Ú\íú\ìôöõ2Z«\Ín‹\Å\Ø\ÎdIe2\Ô4ÍŸ»\Õ\Í\İòºõŒFC\0\â&\î\ï\ê\êj*põ\êU.\\Ğ“ù\ì\å\'c2™˜˜˜0j´š\ÍfL²‰d6«k2\í4s\Ö\è\ï2U‡\nº¼«?\Â\ßªfJùó@.™H\êu½z½¢˜P¹5\Z;ô£\Ï´f*I6aµ:\è	\Û\é\ê£ªe\â•+.;\ŞkT\ãIÊ¥b+”[£Sæ¶H$°ZmT«•Û¶144D$1:\Öb± \Ë2Ñ­¤şÎ¢ımml\éÄ¶(\æ5‰şı_ÿóF\ÄŠY³š\İÎ’É¤ñ´2\Ò	‰\ÎP\Õ6\Ømv³B¡PĞ‰`|‡„,\Ã\î \Ğ@>Á_\0O<‰ªª¨¥B\ì¸p·CA,\Ãb1›\niI°9=F\ãûÿ‰–\Ëß–\è¡Pˆ\Ñ\ÑQ`gÎ°X,\È&«±øÇ·DŒõ\Ü5ú_l\Ä\â\0\ÉRE½rS\ã·Áğ®{^»ğõŸ>ºQQ\Õ\ŞB¡@ \Ğw‚n!\îv;”\Êe\Ê\åò\ÎfF{ğ°\ĞL&\êf3šÛ‰³P\Æ\átB0¸G‹-@oÿ\0\éT’@(„,\É\Ô\é‘!” Ç³/\Í\Üz®³\Û\íLLL\àõz;´#›MŸc\Ö6\ã¨\Õ\Z6\ÃF$tkF±`şú\r\0mnc±³\Ôp`\İsr\àXZ«\×\çTU¥P\È#I’\á>w“(:\çôô„Q‡\İN(°³K¥S\\jF\Çœ¥\n\ÖJ•dÀGC–\Ñ\Ó\n…í¸¯ù·,Ë„º»‘%=¢cy ‡D\È\ÇğZŒ.\éÖŸe6›7ö~\Û\ç!Àa·“\ÉfI&\Ó;#T ûô˜ô=[‰$\Õj›\ÙZ\èõu\ï›h?˜ğ^»;WÑªš¦‘\Ï\å\Ãfn\Ì{M¢˜\Í\n½½½8NôGH\äs;ş3;±Å’H\İh\à*–‰u\Éx]†&\×\äo½ƒZ?Ğœ¶’\0M‘¹1a=\Ò\Ã@4Nÿ\ê&º^±f7$I¢««‹ûï¿Ÿ\á\á\á=UWI’ğ\ÄS®^¹F½¦G\n	Mˆ¦«w\"•¢Z«a·X³\ÇÂƒ??Â¿\ã+Ÿ`0\Ù\ZÛ¹m\êZEVto_¡O¤-››\Ã:\n\Åj›ß¡€¦ˆ\ÈBB‡ª\"$¸:<@Á\ÙÜ‡m]\ÛF\ÇT,\nW†Y\Zˆ\ĞK0²\Å\nB](–t—\Ë\ÅÑ£G™šš\â\ìÙ³ôôô`½\0¥|\\:ÕŒL!+z*t`#¶…Z©`6)é‰¾\áCşÀ2\à¾\á©+Kñ(ù|z½¢˜0I2uê´‚\Öf\é	Ği…bºh4£õ$I\ÜE”mV\æG†½±†«TFn\ì8¥J@C†ºI!\åó²\Òßƒjµrly¾­¦¦i\Ãf³c·\Ù\éD8rDwß°Z­MŒN‚·\ÜZ\Ç‡ƒ—)ú\æw¹ûÅ‹<ğú_f|\ä(\ŞP7vw»\ë1Tµ‚ER\â£=ƒ;Î’Ä¡´»wÈ¦\Ó\É@­V\Ãf·!›L­†„„Œdø‚N¨Z­F¹¤—ôlÿ\æ—v]~8J%¬\Õ*ı›	\Ò>/MÒ\Ê\È\äô0z$\ê²DÁa#\í÷‘w9f¶9¾¸·)\ÆZ/\Ë’,\áv»	‡Ã·4-t¬¸›\Çf³…ª¦1sc™™\Ë|õ‡?\Æa·rfz’‰±LOŒñ\ì/Q«\ÕÔ†TŸ\í„÷ù\Ş‡\"ü©Á;€b±h4\Z(&E\ÏU\Ó$¢IQŒ=W\ĞÏµV–\ÚDFs±\å.Wq”+\ä]NN\\_!\ís³\Òa£\'¤s½uIB=\ÉÃ«Q¼¹\"M\ÛS$u<®£\Ûÿ\Ş·\Û\Í\İg\î¥P\È®³µ\ã\és/òô¹Ğ š¦a2[\noøã‡‹\Éä„ûÃŸ¨Z³Z\Õj¤RI¼^/6«BQq³\ÙX1‚\ÎÌ•JeGo¢CkA—§VµÂ‘õMfG‡Iû\ÜY\ß\â\Èú%»M1!˜\Zg¹Œ\ÜhkD´\Ï-ó\ÊÑ¼\×l±080HWw7š¦±´¼D,¶In;K*™\"Na’M\ê\Ù;&Ÿœ?\ë6÷À\'\×úü]\Ë\0\ÙL\0³\ÅlĞ´%bZ08kK¶k-\í¼\'‘!\Ùfe B\ŞeGgIÅ›+\â\Ïñ‹z9\r\Z†f´ÓŸ¢½o÷\Ä~¦‡½õmE6ˆÇ·(–Š8.\ŞqN§	©:\Ş{\Ç\álMšğ~‡\ç\Z@*$\ì\Ím0 Sˆ79Y’$ƒ@\íÿ\Æ\ï^„`d9ŠµR\å\Ú\Ñ>ªMÍ¤“¢H’Áå¢­a¾\'Pµ(¨­ğ&n·Š…\æ»J ªš‡€\î108@ D1[H§R¨j!\Z\Ú`(Ü‘¬ù 84\áB\\J\éT\n!\Ñ \Ğÿ×\\­u\Òl6\ëùk¤]r¸`\ÆÀp\Ë[Z\'\ïrr\åAª]\Z\ê.!µEx·C\ï}]ú©\Ø,´?q?¹¾\×yU-7Ÿ\'\Ğ;Z\Æ\ét\ávºtw÷ „ !\ZñÑÁÿ\Â/%¢‹@.—\ËQ­TtSªbA\Óºı\Õ-‹.‚Ú¨¾{A$\ï¡\Ì6w¬lú¸~t@Oò\ĞIHm›\ç*…õ\ŞNo\ä\ÃÂ°Š\"\rZv\ÖFó§^\×ôL!6VÛ¡ux€ÿ`Ot<T—\Ë\0\0\0\0IEND®B`‚','image/png','leonie-transparent.png','Frida','','',0,0),(8,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0`\0\0\0€\0\0\0ô\Ülº\0\0 \0IDATx^Ô½wœ\\Wyğÿ=÷\Ş\émg¶¯vW»ÒªKV³\ån\ËÛ€é¦˜J !¡8	@xó’üB	%\à˜b\Ç¸Ê–d\Ë\êuWZm¯3;½\Ür\Ş?\î½3³«]Ù\Íûyy>ŸÙ{\ï©O?\Ïy\îÁsÀkş\âóm\'üÙ›ôb>¡ù|\ÍF¥ü~¿\Ï\çß¸a#===\ÕrBˆ¥y ¥\\ôşÿ´})%Bˆs\Úu\Û[ª?€r¹\ÌÀÀÀ¢\Ï\Z\Z\ZhiiA\Ó4,\Ëbjf†ıû÷¡}9küö¾‡\ïZ´\âĞ«À/¾ü\É	\à\ë\×üÁ‡š’g¿\Ó\Ì\ÌZ7l¤£½}^9w\"ÿSD½”p>¤.Vf1Õƒ¦ix<\êÇƒªª˜¦Y%À\ä\Ä…B@¢9hn/,\Ù\Øx^\Ø\Úz\íMF)ÿ\ç2?wó¶­\ÛV´4·°_,^\n	x>x> ¥D\×uE\ì1(Š²\èXt\İ\àô\àk\àÔ©~CQ\é\\ù¥¶µ[‡\îùò§+\ç®õ|¶\\ûª\Îò\Ü\ì-š^|×–.X\Ş\ÒÒŠ\êjˆB¼ $=,lï…´}¾²n»Ë¸×–eQ©TB ª*š¦¡ª*Š¢,‰|¨ŠBc¢Q4\Äc¹lú\Â\äøğ\Úr&™\ïX±zp|°_?·’\r\ç%Àæ«¯o*gS·hf\éM[7o\ëiiiYr/Aÿx!\í?_	R\"¥¤\\.“\ÍfI¥R$“IŠ\Å\"Á`U­¡\ç9ûw!š›š1+•®\éñ‘.]¯„¯|ÿ_4·.\Ë}öœj‹Ú€\Şú»¿ÿ¹ò\Üô§#\åµ[/¼¬³¡¡aÑ‰\Õl¡¨¿–RbY\Ö<q®)%¦i’š›£X,¢ª\n¡`ˆh4:OG/†·®\Ûv±XD\Ó4¼^oµŒa¦a˜T*Ê¥\ÅR‰R¹„eÍŸW<\Ç\ãõT¯Ÿù(—ÊŒ’œ™%“ÍJ\ÏM¨oX\Z\Æ+O>øó\\\ãòuwS\ëC€?úñ.ø\×O®(\ç\Ò/\ÒN[G\Ç\ä\ä$“S“x½^ººº\ÑTõ¼ƒr=€\\.‡\ß\ïG\Ó4\n……BX,†\ßï¯–u!“\É05=…\å\Ü\Ëf²(ŠB$9§}¨!&“\ÉP,I$\är9fff\è\ì\ì R©033ƒa”\r]×±,«®1¨)T‚>?ŠPªı,\åAUAJ,\Ë$Nsvø,(\ZZ òÇ­k·\ÆW¬O6­Øü\Şn0X\ÎQA-Ëº½\Ó\Ç÷ı©Q.ø¥E¡X889=Ù‘J%C‰F\Z€`1ü\ëº\Î\ì\ìl\ÕK\0›\'\'\'QU¯\×\Ë\Ü\Ü³³³‹Åª^U\Ó4™¥T.W]i\ÙF0\n¡:Dw‘aH‹B¡À\ä\Ä©T\nŸ\ÏG±Xdff\Ó4‰\Ç\ã!\'“\ÉP©T0Lsq)^p],\Éd2\är9\Ê\å2®ñu%l1ğx¼475\ãóû\ÈÌ¥°=\ë\ì{\Ê\Şö©÷˜K\Õ;‡\0ı{6g§§I¥’÷¼õ\ëwÿb\æÌ±3\å\Ì\ÜkûVô5ö­\\UE\ìb0‘ŒQ\È\åQUÇƒ\×\ë%•#•J\àñz)\n”J%2\é4¥R	\Ó4±,‹T*…)k\Ü)°UG ¨JŒeY\äòyffg˜š¢\\.ƒ˜¦I6Ÿ\Ã\Åo8\Z!•š#“\ÍREùböSœ{[J‰n”+\n…\étšŠ^Aóhx=5\ÕT\ÅR‰‘\Ñ„PPPH¥f7\äg\'›„P††_´\Ïa„\Ë\ãı¥Ù©J\Äb;¶lŞ¬z¼¤(KhKJòù<\Åb‘B>O¥R±§(\äyŠ¥]Ç´¬*¢*ºN¡P _\Èc†,§}\á|L\Ó$‹Q©T˜ššb&iK[V\"1Ls^%	¤3$²\Ö\Ğb —x$@ºmI(W\Ê\äóy¼šŸÏ·X\r2™9=J&›Æ´L¯e\è=\ål2²|\Ã\Öd\çú-#¯ı\Ìw\ä\Óÿı\İyu–\\ˆ]ómš<²\çÓ±ğ\Í[·{=‰öÀ´*¯B¾€n™¤2i\æ²4\Í\î\Æõ«*’À–\Ó0–DR±Xddt”|>‡aZK#³2™\Ìs9/ˆ…„‘`\é…Bp8<O	!ğz¼ôö®$\ns\ì\èR©9ü‰–ûºW\ß^N\'[€N	ç¬\Ê\ëÿ÷\×Â§s\×;\É\'ÿjûÖ­=MM\ÍNi”\Íf\Èe³!\Ğ<\ZB(hB²\Ù\é¹4\àp\Ô0\ír¶CÄšn¨\rDs± À‹©n\ßõ‚!¨{Vß½¦ª$	\Zµ®}’R’\Éf8tğ S³\É=\Şh\ìkW\ÜòÅŸ|ûW\ÔYş\Zœ£‚^û—_P~{\ç\Ûr\Ó#Ÿ^·fmO,Ö€®\ëH	ªª!T*:³³3\ê°?\Ùl–L6C¥\\¶%E„”Du¢õŸÅ¤¨jW\êÿ\×c\é\ÅÂ‚>Ä»Œ\á|u}J@S\Ú\ÚÚ‰9.1°À²÷ª¨øı~2\é¹\Ö\\:µmü\ĞS\ÙK\ßù‘\'ø\Õ9²s Yú\å…Ù‰¯\ndO:“fdhˆ\á‘aÂ¡±hw…˜\Ë\å0µQ\åi\ë\ã\ÚM›¢\Æ]õ\Ü\É.„—\n\á@H\é [\Ôua\Âi\í–[J\0šG£¢W\Èòry\n…\Åb‘R©D¥RAJ‰\Çc¯9¤”s\àÀŠº\Ñˆ6~[õxz¼¾‰3ö”Y\0\çØ€hGÏ„ü±¢\0R‰–³sóJó’\Ö\Ö6À3UU	‡Ã¶!tğ\rP?EH¤GE\Ã41MY“\0¨Ê¼]]\Öıı]A[¤À\Ñó‚¦)\Ä\Â.^\ÛMWKO9\Ã\ÑÁILÓ–øŠ®;õk#Bhokw\Ü[‰¢(455\áõzªo\çkn}\àŸ\ã‰\ß.5¢¥aûu¯Ù’ø\í[¶n\ì\ì\ì¨®:u½\Â\à\à ¦”µVdM¬…\"X\Ù\Ş\È¯¸€¦¨Ÿ§\Ç9\Ø?\ÎL&\Ïl®HY7p˜\ÑVY²¿#	\0\é\0Š\"ˆú½´\ÄBt\Ä#l\ìjaûº.\r!‚\\Y\çû>\Ãoôc˜–m·\Ü6œÿ‘H„\Ö\ÖV|>_\İú\Â~:55É¾gŸ\"ı»nşĞ­?¾\å-‹\å\Î\ë†\Æ\ã‰[\Z\"—÷­\\\åóx< À\Ğ\r&\'\'\Èf³ç¸P\ä\æ|ğU;\Ø\Ø\ÓBs,Èº®&z\"Ö¶\ÇY\Ñ\'	¡)*ºiRÖ­ù8ÿ@\0­±\Û{\Û\Ø\Ñ\Û\ÎUëº¹rU7[–·\Ò	¢)Ÿß‹P^\Â\ÊöF’¹\"\Ã\Ós\Î\ê\Ü\Öõ.ƒ‚tC·]hİ°¹^(€ ğ£y´\Ø\Ä\Èàº©SG¼şŸ~:¸ï¿¿{€/9Õ«ÿ\à\Ãk§÷=òo7lÜ¹|ùr§¨½\à#I\á.\â…óW\n‰ª(l\êm\ã/\Şp9\r!¿­nó%RÓk(Á´\ìE•!-Rù™b™Ñ¹<³\Ù“\éÙ¢N\Ù41-‰%%¦e’/é˜–¬yP\ÎŸ¦\Úk!\ĞT\"ğ{4¼^D\ÈOK4LoS„xŒ¨_CUŠRSI`#5\Ñ\ÃğV%%•/òû÷ò\è\á3€£.g.1$’p(LgÇ²ª\Ë\r¶¶8qò8\ÇNœ<\è	\Çn‰¶v>¼û\Şÿ¢]¼\ï\Û(\ãS;\ÃşÀ\Ö\ÖVÀ\éLZ¨ªB0$“\Ë\Øb\']\\\Øú}ug3\ï¿\áB\Z\Â„”\à¸g\åb\n¦‚T4<Bğx\èˆGX\×\Ñ\Ò\Âòƒ|Y§¨[¦A¹¢ó\ë£g8;›¥Pª9‰p€\ë7ö\âó¨E\à\Ó4B>/‰hÀ‡¦º¦´\æ\0¶.wˆh?µmV¹XÁğ\"\n4„ı¼û\å\Û\É00‘œW\ÏGu*¨Ê¹ñ1!z–÷\Ò?0ôG\âú¢‰G±«UaQœz\è\çÂ”¯\é\èj÷\×\Íìˆ¦Y‘†Q!) 	ò¾\ë·\Ó\Ù$\Ò1°–ib\êBŠª\Ëg¯Pkz\Óşj_!û4\Â>/H›¸–ø¼\Zƒ\Ói>6DK4H\"b\Ëòf6¶7\âŠDU0j’\é0G\Ù]vYG:ıØ’\Z‰‡\æ!³)\â\í\×n\á›÷\ìf:“¯µ\å6ƒ\\\"L/¥bZs\Ó|8\Ú\Ş{\ÎZ\à¼\æ/>Ï™]÷^ ,}cgW·¶ª\Èd2K%òù¼0s8Á™f\Ø\ï\ã}7\\ÄšeNKö}‰D¯\èºn/V\0°@º½\ê,\\ôWQ&¤\í\Ô:W¬jn §1FK4Dc\ÈO{Cx¾\Zq\Ö®Š’B\Ú‹\â|¯õ\'Pªˆ\ÇQ_Ha{=\Å\nş€¯6G\ÛWuğ†\Ë7ğı_=ƒn˜ó“5\ÂÎ‡B¡ÀÀÀ@Aõú¿u\á»>¶ÿ{¸\áœ2\ç,\éF÷?¢X†ş\æö¶¶¦@ \0\Ø\Ü?11A2•¤Tq\\Yù\Ğ4…k·¬`\Ç\êe6\Ú¸îš”`VL,KÎ—=\ìUµ-\Ñ\Â)\î\Ì\Öù.\İe+hªÂ¦\Îf:\ãaTETû«r»\ãş\nQ#\'Ô¼,·°­bd\íK8¨ªKQwO‚k6¯`mg85…\ãz\n@QÏ•\0M\ÓP5\Ë4o ²\èJø\Ä{Ö­—\Å\Ü%\íAUX–…ªª„\Â\á”v¦,`ıòV\Şr\å&^\rw2g€RR.U¨\Å%@H…j°E(U\n)@ºªKq`{õss¿\Û\Äs]¥‚+A.\È\ZM\İk÷†¬_Ilõ,©”ttÃ°™B\Ú#‘@\È\ç\å=\×o£!¨ö%\İ$\äyÒ™tµw¯\×Kg{GPAy\×ÁÛ¿\Ù\É\"p\Æö?öŠp$²V\Ó<ô÷÷333@$F­›‰İ¿@Unº|Ñßn	‰À4-\Êesñ\ÜÕ¨KDû@\Ú\ëy§\î<š9v\ë8„{\nbşG(\Î}¥J@Ü¶\\Ëº6İ¶tÃ¢R6p™\Är\Ñ, ³)\Ê%k»P.p‡˜I§\Z!•Ncš³\èX¶iT:³\Ó#=\ïø\ê²\æ\à\êwüiŸY.oHÏ¥\Øû\ÌNõŸ¬ŠU0¬†ak¨“\\µq9ëº›±Åœù @/X–µˆú¤”TJ\æ\ïT\n@\â÷h\\º®›†p\0‰k£ì¹eZÕ½\r!l\ï+\Ò\Ú\Ü\Ô#\rı\r¿¹\ã†¯\Şxó\ç~ \ÌŞ‚ªvK\ï\ç\ÅR\é¤\×\ç#v’’n§\rA;/X‰_ó° šR-U,”~¯\ïB¹XÁ2m•D\İÜ„€\r\Ë[X\Õ\Ş\èH518\ŞbM\İ{4öe\Şò\Üô…±®¾Ä‚njĞ¼~‚mOG\Ú{>´\éu\ïÿ˜ˆM$\Z«‰G”J¥ZG@o[‚Ş¶„møÀ\ç\Z˜†‰QYr7\îÿi0M‹JÉ‰ÿ\Ìc,ğj*;\Ö-¯İş#B\Øß£‘(`ı\ìÀ‘+X\0UDÛ»¬m\ï¸eğ™\î8~òW?O`TVw´w\0¶Z¿‘vˆvÛªNbAww¨~ö÷J\Ù^¹ş~‚¤+\Õ\Åx\0jFû²u\ËHD a¡€\×\êH¦§§x\æ\Ùg\n\ÅJ\å¡Rrâœù*¾õö\Ëù\Ö\Û/\çõóuTŸ¿\Ç\ïQ\Ãñ†ÀV?®0:\í\â\Ñ¶¯j¯ö¾PIiûÿò÷–\0`\ê†n\ÚHv¦\á\ÎÆ£©l\èn\×\Ôi£\Z=\ÇO¯d²\Ù[›\×]ô™¾\ë\ßv\à£0²\çWŠQ*Ü”hl\êP¸†®\ë¶Ú©\ÓuÍ±\í‰hõF½\ã`™zù÷Sı¸`™\åRy¾zuÔŠ¦ª¬\íjAJ\í6,pD$ºiRò\Ìú\ßyòÎ¿ÿ0\á´®¿°¡<7³¾¹±Is3 \êL\0H\Ø\ØÓ†¦¸\\.—›†…^\Ñ}öû(—\Ü<¢\Ú<…”(º›cDƒó7\è¦¯¨ŠŠªªŠeš\ç\îc²ŒrÑ°°#BœK\0`]WrQ\ÜÚœbT,ó÷ù\à\"\Û(X\ÆüTwVM± M±\à¼Zªª\ÎKi\Ô+%£b,•˜u2£¹PSÇ®\Ù\äL\É0\ì:^ŸoU~/MÑª²s\ãõ\Ã+\ä\Ëö½Å©ô{\0¶67M{M\àNVº®\'\Ğ\ç©]×B\Û:/.„sĞ½c§%q\×l29\æ\æ\Ú˜—hš&³\é¼}!3$©\"Û²ll“fQ\Éû=[\íòeç»¨![\Úñ!QoR©\Ä\ØØ˜\í²K¨­\Ô‡s°s\Û\'\ßK°¹c¨b‰©LÆù!hˆ\Æ\Ğ[´*º\ÉO9@±¬WÛ–\Â\äJr\ÙB•0¤m¦«zTº³Ò¢•“/\ÄH…\Íõ\êC‚\ÛÀ|\ß\Îyî”©Ê´\Ä\ĞMôr\Í\rw\å}r.\Ë\Ô\\®Ú„\Ä&†DVƒ…\\$BP‹²g\Û\Ú\í3RZc3³\Ó\Õ{šªâ©³CSi~½¿O§Is|xš;?\Ì\à\è,s…\Ó—K)Ò‘	!‰\Ô+°—\0ùP}÷ã‚”5\äÙ  ¤»M\ã\Ü\Ç‘¤HiQ*\Ô6”Y`f.\Ït:_kQ\Ø\Ïb±˜£²%(\Òò\Ç\â9–€E7d+6,\Ó8\Ï\å_\rx+•\n“““T*\Î „-~\á@\'²\ç\ä~J4`\ë\Êe\îe×‰Qü…µml\ên¦%\ZÂ£h€\ÄrŠÀ	¹\Û\ç\Ş{\éÀF•Ë¢œ}w\0².\ç”uo{á„·\Ë%i¡¨ö\0-`4™¥P\Ñ\ç© EQ‚!¨T*XR\áöI\Ø\Ëb°(¾÷*}\ë\ÖO\ÌÍ¥\Ó4½\ã\ã\ã\n\ÎkONgV¶cY\ì?M,\ä§5\Ş@\"\à;\ì\åôÄœ£\à\Äx’»ö¤9\ZbÇŠ\Öv4²,!\à\Ñpc)öôe­ñ	‰n˜x5W™¸\êAAÁš\'iõ%lõ:/Q\Ö\r\Ñ\0^M\á‰\Ãg¸r[­¶-4-‹t¾„WU)µõeY¤\Ói\"\á0¥R	i™h>ß’¯)-™\Z\ï\İ0T\Z=ed³\Ù\Ëqˆ…´7„ùÕ¾~\Â~/­\î\äøğÿù\Ø!òE}\Zm\Ó\Ù÷\è\ç±Ã¬n‹sAw:[zµª\Ø\"ÿb\é`˜\ÓÓ³46&ğÖ½h\Ëİ‡°ƒı€ b˜ŒÌ¦99‘b,•et.G±l\ï\àu6EY\ßŞˆnZ\Üş\Äa^{\Ùz:›\Z\ĞT…W\íXƒnXÜ»\çFİŠ?Ÿ·“ÖŠ\Å\"†iñÎ¾™…ctaItn»ú\à±Á£\Ét:¥4E\áe[V²®«	\èN„¹÷1§0LEM\Ôt¯=0[´- ]*³wp‚ƒ#\Ó$B\\»n9\ë\ÚI„ƒ(U÷Y¸\n»v½(Èš–q.r¹<™Bhij\Ä\ë\Ñõ†iR¨dŠe\Æ\çrfp&C®X¦¬›óbWI2_\âø\è,«\Ú\ãl[µŒ[½Ÿm«:ÀU›Vğ®k·\ĞñÓ‡+\Ù\ï¸oú\äytCÏ„[–%Y–$@Ûº\í‡,¹\'“\ÍöÃ¡\ê<›c!®İ¼‚\î\æ–·òÌ©Qš\ã\">\r£l\àQƒI	™’\ÎT¾Lº¬“v\r™„Šn0\Îs\Û\îc4Gƒl\ïmc\ÛòVÚ£‡ƒ‹¡J#§¬Š¥2RB6ŸGˆ74-\éôO§K\åNf83F7j\ÊH\Ô\Ù\07™À…²irxxšLY\çÊ=:3A©b`Y’ë¶­fıòZB\'\ì=	¤³ò¹–a<n\í\\R\Î+\ì\\ş²\ÏE5ó“‰\Ã@HA0 ñ\æ+6rı¶\ÕıÊº½‘\Ï\æ\é?9ä„¬k\ÍJ))\ê&%\Ãd2[b<[d0•£X±0±–­E¡)`Es7lZAK$ˆPD\İ^\Âbp—9\Ò)\')WF&¦(”JdŠ:§“9\Æó:…ŠA*_¤l˜\Ô{F\n„]_qº‰¼¨Š dXd\Ë:RZHi;´Í±›{ZÈ—\rüWl\\\Î\í\æøğtÕ»•NSS\Óù•£ûvÿù9cw\à¼¸ø5o}Ui´ÿ§Ë–-‹V%İ¡p_G‚¿|\ËN\Ú\âap:L¥2œ<q–|\Î^	º\Şb½¤‹†\æ\nœœÉ‘-—É–mñ€Ï£²¶£‘\ËWu±¢9F\Ğ\çAˆ\Å<f\Ç\Çö¦»Dpvz†_\î\àøTŠ’nc¤ª¡„D‚ˆ\ÏCÈ£\â÷jøT•æ—¨\ÏKK\ØG\Ä\ïÁ\ÕkRJ\nƒ©|‰ñL‰d±BÙ”\ÄB~.\\½Œ`(ÀşI†§SŒL§\ç\Í\Õ\ÔuF\ÆFPB\rÿ\Ø÷ò·~\îÎ¿ÿğ¢®\èyß”Ï\r4\nù1Ë²¢¢ş…lC§*P,kˆ°be\'NR\ÖÁ\Æ@õ`y}H\Íks«\Ã%A`­ô”uÒ™S³³ŒM\Í26;G¡¢³hŠS“)úZ\âÜ¸©‡Î¦ø’\ïhI\'\ßÈ´,Lqh\"U\Õ\åB@Ô§xi‹…ˆFc\Äb\r„\"¡°³šuy	 z	L@¹H¯?M_s”X<J8Ñ€)º[\ZB°¡»•©toŞ»‡©TmQ¦(*‘p„\Ù\Ù\é7\r<t\Û\èUoz÷İ›\ßøş‘¯½ı\Êyc\×\0bm]-™©±&i™J0\Ş\\YyÉµ3‡\î»-j\í\Îd\ÆSsskq{7M±Ÿ¼r\ÍÑ-tKP^Nj\Ö÷‚PŠ‚\Ç2Q……D©\Ó\é5\Ë\éµ,ÂŠJ»¬7M*–dlx˜™™YÎ\é§?™\å\Ä\ÈMquû}²³³yºcAZ\"A\Z\"$š[ğ6w¢…#hÁ(ª\â¤1Z&ZUu\Íi¡)-CGõ´„\ÂDv¿]-\r|šbA¦R9\Ü\\!!ª¢rµf\ê_ÈŒhwñSS½\í\ìªšœ={üôøèŒ¶ñoKœ\İ÷\Ø_Ii½\Ğ*…\\nğ\éG\ïo\é\Ûğ‹X\Ï\Ú\ÇóC\'K…\â+Dœj\ã\İ\Í1\Ú K•Ñ²9 ‚†\"Ê´PF\Ò\Ù,–a`9“”\ØÛ”\ÅJ-µ\ĞõÿÛ›\Z	üŠB×Š6\n}=d.\Ü\Êø\ä\ŞJ–‚\ÏG@/¢\âú\ÜÕ™\âª\"¢ò²\r½¾V¤5Á\ã\Ã\Ä\'\rT+O2™%›\Íõ¦6\ä÷U“¼,gd!Ÿp8B¡\äñ¶‚(¨„5“V­D«RDU,g9#\Ü	!€B±\È\Ì\ì¾H\áñOŸ8ö\ÕôÌ¤3t1k\í\è½\â½ÿ‚v\ê±_®6Ê…7…¾–+»•Áñ™¦\Ù\Ôô{\nsÉ\Ç¹ÿ>3—1g\Ã\ÅÉ£ñh*ª\"\È[\Z\'*q¼?! \"™›.’L\åyòh?#3©yR\Ú/ò™\Î\ë¢n¦œ‚®–\×lYK\Ğ\ãAZ’°¬\Ğ(T:Û£6\Æ\rƒ\Î\ìÓ¤~û§šğ† _.ò\è™).\åh£Œ\Í\ÊVSÀg2Yv:A2›ÃµP®,zT•…{‹>\Ê\Ú\î\Öuw\ÕLÂ”ñ\Ã(\á\Ãy?Y]cµ¯¦û\í6-¤L\ÍL#¼\æ\ÒJ©Š\é¯½ú\"¶®\ë\åÿ¿\íş\\¡pığ§~ª©\át\Ó;^wòõ¿ş\0…’\ÎWrÿ;·?¸v\âôÑ¯µõö!+y*º\Ïc\ëñ†ŸG£`\nLEe}Âƒ*l]<¡\ë<´\ï#\Ó)š[š\éh_†aY\èºA¹Tdjb‘R‰\ÅH4¶051Á£OpÙ†U}>T$Š4ğbñû9÷PRı.\Úq\r?\0\r\èO\ÍÒŸ,°S„Œ2µØ’ +ğÛƒ\Ç	F\â¬\ë\î¥\ìHa63Gjv¦jœ$mˆÅ˜\ãÉ£\Ì\åŠ\\¼n%¯‡˜O#\Ñhğ)/RÑœ˜–0{P.\Èf2\ÌL\Í\Ğ\Ñ\ç3ñşø\Í×£ °\ï\èi\å>½\â\ì¾\ÇZ0Ú¸)\Å\é\àe[\Ö\"„|şâ¯fÃŠN>ñ•[‘•\"Í­D¢1Á \Í-¡9<\ä-ª¦\"°n\Ós\î~\ìF¦\ç¸\âŠ+¸ø’Khoo\'Ë“\É8;p’§we\ì\\{G{¬\İx·\í ÿ\ÔI~\èAŸeÇº^oöÖŸª*Š\ÆD¨UAµ\Î\İ\ê€\Ù\Ó\È\r›Â¸\ä‘\Êöœ8/\å\æ·\İLcS3\ãÓ³\0<õ\ÈC£„­\Æl·wû¥—\ÑÙ»’\Ñ\áaŞ»›\ÃCX\Ò\â\ÂÕ½„ŠvVœ_”\ÑÈ˜>r†\å\r\Ò\Ğh¿\ÌX*•hli£T,ô{ù\Ô¾‘\×í¼ˆ¡	Úš\ZØ°²›_<ú4\rË£\Z‚\0)%7ò\Ë<{t€¯¾¿ûu\Ü÷\ïŸew>ôøŠ‚¢¨)\Ñ4•ı†„B£\×°I)H¦2\Ë–-[Æ«n¼7·\Ô\Ò+œ>y”\ã‡8\Û{6Á|^½½hš\Ê\ê5k(ò\ìz\âQ6ö.#è·¥\Í\ëõ:ùü`	…¶\â4=gs·süøİ‡FY}ù\Ë@š\Ø,i«˜±™$s9\Şı\Ş÷\Ò\ÑÑeY$\'\ÇØ³\ëQrÙ¬£·m)\n…Btöô\âóz\é[\ÕGsS#w\ÜşŸdòE\nNn”i\Ùö#\'½\ì7š±<	.|y¦£V-\Ó\Â2Mú\ìac0Oo{\ïÿ\Ì\×9;>Ã•\Û\Ö\Ó\Ö\Ø\0\Ğ\ä	„:´r>\×	ôû8tò,x\ÍË¸ó±½|\éGwó™?}­™$ÿı\ÈAŠ¥\n\rñ8x=\Üt\ÅF‘ŠD\0{©¿¦·“w½\ÆÏ®\'cÅŠ•\0ø}^r\é$ù\\„@H‰\×\ãcûÅ—°v\Í\ZMSi\Üyr\Ö9\Ç\æF¯“oj•Mó«˜e³\Æ\à!To€\á\ázt|\Â}\Z\"!n¸öjúúú\Â\Ş6\ìY¾œ¡3ôg#°i™hl\ä²+®¦³£Í‘PÁ\Ø\Ù\Ót&\"lZ\ŞÎ²\Ö&\â‰(ªPĞ¥$¬tk9R…>yˆr\Å~c(•L	h|\à†‰P\ä\Ï>ÿ:\âqnºò¾{\ïoXÿª+o Ô«™z903—¡¥!Âµ\Û6²rY+Ÿ»õNn½û\×\ÜxõET’\ãŒ\Íd˜A*E®[¢+¾\ÓI\Úu–\ï]­Í¼ö\ê©\Â•B3\Ş`„p$\ÊË®{]\İË™K%B¡½c½+W:®.\å\èkmÀ(\Ù*Á\ëµO§²x´ø+`{)R\âJ’D’\Éhkk\Ã\é\×\0\0 \0IDAT[É‚7\ì \Ş&DS4‚\' bV\ÊŸd_÷Šiim£R*¢z¼¬Y»¦fûHiY\ÌLaÎŒ²cõr–u´úQD„¢!ñ	“O‘³cƒ9°in\ZŒrÁŠ6z¢ó¿¿ñT	|\ÃõJtÃ¤T®G½\ZÎ¦L*“\'\ZğyÙ±~òú\ëø·»\Å%¬¡)`\"S´#•\'ó\à\Ó\'Ù¼~\rH;ñVÊšQø|ı@zËˆc˜\n\Â0Y\Ñ\ÑmN)IqvŠ¢seUÊ¤\'FÑ‹EÛ‡V5BÁ B@©X\"¨zˆ«R²spl÷\É\é[É¤)\æ³,y˜)—ª¬\Z{\è\Å<£‡ök\ëD¨µõ\ç†½U\çGZ:Ù‰\0J\Ù4¹©º\Z£455\àõy>‘ÎºG¢	\ì;›($„\Ã!6õ-\çö‡d÷Á|õ£\ï¥5ghb\nû%\×9°b\Ø-–(UtºN<&›-ğ£_ü–\æ\ÖvÜ·[„3ˆÓ“)&fR˜Ñ¸=0\áüvkRJ0*È¹	J\Ù\å²N¹\\¡R©8©ß®Z#œ]_\àóy	øıxT‰ X,\"|°tŒ|\Æ)+¨)0ƒğº_E¥\\\ÂòK4U©–(¦“”\Ò)‚ıv‹ı]¦jx=\Z\ÑpX,‚\Ç\ë¶#p\'Z4$>,F§\ç83QkSóxH46Ñ’ˆq\Ç}¿¥T*sh`ˆX8@Å°\ìm\Ü:Ğ„#\İ\í\ÍxT•©dšO~óÇ˜¦\Å\æ¾xö\×_a\Ç{\\)(—\r9v†U/§`H¢^wµ	ƒ½AoY¶\á\Ö4?¡Ó°03{\\o\ÜUU¯J±µŒ´@/ä±”2¥\Ô0š¡Û¾5şc\ëoË²an\ä\"˜ oVˆE#Ú„Ó—½\íğúÁ	Â©5\0\Õu‹U«N\Ë]t‹°¢óÄ±!Je\ÃlıCz™t&\Ëk¯¸ˆ;\ß\Ã\ï„\İ|#­	ş\êAR–\"À\Ú\Şeü\Ù\Í7ò\ØÁchªÆ¿|ô=ü\ï++\Û[H¥\ÓökI\Î@$vœÿ\Ä\Ùq*\Å\é\Â|ŸlIRR*T\ìôD)p½USğzm.óx<ø¼<\rWCQDSG\Ñ\Ëh•²Rr.(nW	†abYF>R.P\È\å\êF\ã‚\ÍÁ†i¢y¼šGu$Àı¸\ÄXvz¥+\ÚNc–e‘+™˜\Å,‡\'l•\"À]C\Ç\Ã~\Øw˜›7ğ‡¯¹–ø£·¡ÁT*\Í\ß}\à-´Ä-‰¢i^OÀ\ïõrÕx…«¶¬#	’-–h‰\ÇÈ–J$B1òfU\r‚Á\É“““D\Ãºb>[¥¸ªE\Ú)Ş†a:\\$ê„£†9û=0Y»WY\åb¯\Ô\éÊ¡J\ç…iQ·v-¥Ã„¹9´b\İÁ0šk\'µT[´\İHC7ñz•ª\Ö\Z³\Ç!|\Ãk¢iª\ÍBP,\ëM‹\Ò\äƒ“5õ#oE[‚\Ç?\ÊÊ–²…ñHˆO¼ıµ,kK°¦¯“cvHÂ²\ÌI\ÅŠ\rœ%ös\á¦U¬\ìh\ã—O\î\çÏ¾ú~ö\ë]¨ªÊõ\ËqgbOD’É—<‹O\ÏØ‡-9yDRJ*ƒr\Ùtô¶.q\Å\ÇÅ–t\ç\ë\Ì\ÖyfK¾À\Ğ\ròsI„YA•zu’UT\Ê\Z·š†Ş\ÂĞ±ŠR³\Éy¯Šh)1Ó¢\âöëŒ«zY‹\Ëz¥L6¤\ÑLs\â\Ìé¼“²_e0ÁÊFŠ\å\n_û¯_òGÿü-ö\íg\Ó\Ê.z–µ\àx9;>Pªr#š”\Üú`Lñä‘“ü\ãş›k·®Ã¿¾E–%¢HË¢>.oGO\æ}×¬\Ã(”˜)\äÁ\ëC*å²¦h\î\nÿü l\Ï\Êp\Îs“–Ä’&\å|_%‹Z¯ V•6b\rÓ˜‡la\éd§F©\è:ÁP\é\äú$ª\ãJ?\'R¢gtòy\rLŒQ\Å$¢\Z|õ\Ä\à\Öö‡QÁò–‚^/ßºRE\çŸ|Ÿÿ“wpa\Ój@P®\0™|rrJ+¤fösN6¼öê‹¾vû}\Üp\ÑF^}\éV~øÀ\ã\Ä#a¢~…¡Ó§ink¥³½…¹\\,‹ñT–gûG¹bCPÁ0Š\ÌLg)*TœI.Eƒ…(\Î_*P¤ \0Hw}	°ù\ÕV#¦e2‘œ£-Ñ€@ VŠ˜Sg\É!°õ(¡ d\â	q\Ş\Æ\Å%\ZB4Äƒ(>{\ã\ç±#£Œ%s lb\n,’\É=­1V´5\Ğ\â\×<¼e\çEü\ä7Oñ£ûa\Çö5\0B(ªaT*%%9<™´c#\é|‘©TšM+:™MgM\Îñª«¶‘ˆ1K&\Ïöó®›¸\éŠõô´6 *\n{O\Û\Ü\'¡-€n\âS|\nxğ+bÑ\Ïùxÿ~\ÕşTe\ì9_\ÕDRöûğh\Zº^Ëu\í¦\ÄVM\nbñiøTğ/1>Ÿ\n>U\àS^\ÌR\Ë0iµ\Ø{bMU\èis\ÓY\İ\ä\ç\àş}x\Ì-ñ\ï}İµ>;J¶XfSO\'N\rV“µ†&¦ñ…\ÂÉ–\ërZ´eY©N\æ<\Û`J\ÉT*M\Ø\ï£1\æ\î\'p\ÕEÙ±¡\á\É$+º»H\æ+N\ÎqÉ†^.]\×\Í\\¾\Ä\Ğ\Ô\Ùb	‚B¶–ƒ7=}¹\ën\×K‰\Üs3´#¹h5\î\Õ4;„!\ÜûQq­iü~¿\×6ÚÃ°œ\ÚÕ¿†nR.\Ø÷e\neV´\Å\ÙyA/±P€’®óì‘“tu÷°zE7M\ã²-kÙ¼n¿\İŒ­}Ë™\Ë\åQÁ™‘If\Ó9Tw¦uÕ¦ŒÒ¾nËœ7š˜J\Î141CÀ\ïeE[3¹b™#\ã¼ö\ê	ø¼´$b4\'¢\Ì&“r’\ÙG\ÎN‘\ÌH„Jº³lOÀ}o¬\ê..ö©÷(„K)Õ‚\Ê<#i\âc)AJ;ø\å\ÑTr\Åù9P5\Ç.¯A<\ŞP\çrZ‹­¶Ğ“Îµ$Ÿ+aš¥²A<\ìg6S\à\È\àg\Æf8=8L&3G4À4-\Â?7\\¾…§O\r\â÷jl_\İŠ\à\ÈÀ¹BÉ’–<İºfsF\é½\èšE(“™œñ\È\ŞCôt´ğ®\ë/\'™\É\áõzØ²vˆı4FƒJeöŒ33W\à\Ê\r\Ë\ÙŞ·ŒöD”€Ïƒ\Ïg\Çu¤\ëv\Ú#^ „À\ÍlpW\Û\é8:v¢­‹p»¼tz°Ë™H\â‘ Ssi\\\ê\n\\\":uH8H0À\ß\ÒN‚;7…\Ö\ÔMJ…2~¯FG\"Ê¶¾e\\³¥B\Ù$kB?o\ès\æ!X\İm¿c§Á;_~9BÂ³\ÇÎ+–*¦Y9\ï^‘Q\îÿ\âÇ“Š×·;_ªd~ùø>\n…2kúºğyT*º\Îôl\Z@\në—·‘™Kas¬lo\àÁgúy\äğJº‚@(€\"„´“^f?\0B:‹-Û¯ú…Pˆ7Gi\îˆ\ãûÛ¨\Ú\ã\ÛyÁZö8S\İl‘XÔ´Ÿ !\Z¡¥©vè¨\ê\Ê\ÅÀG\ê¤\ÍBQPx\ä\Ği\î~òM2tv©—Øºº\Û\Ş\Ú002a˜D‚~º;Zš\åW{bJ1±\áeoxø§y½e‡!¶^v?ˆş‡Ÿ>Â¡ş!ZZ\ZY\ÛÓ‰\Üûø3¶k(`Ûº•ú\'R\ì=9\Ì\Åëº¸t]7ùb™L¡Œ\êQğ\ì´÷¸—¥\ÔÿRP\åUY‹¿8¤@óªø‚^U­½ü\'@U4‚\0«»\ÚIfrœŸ®\Ö€v¸½1¯¦Ø»«\Ö%\Ä¨gª©øı\æò%f3v¬\î\â\Òu\Ë9=\Ä\ZWl]\Ò^\\¦³9\îø\ÍnV¶7“ˆ„ijj`\ï\á~<‹/Ù³\î\Ú7§÷\Ã÷\İ6\ÔĞ±ü¡T&—ü\á/~K$\Z\"«\ëlX\ŞÁ÷\ïú5O:	Ö¯\è¤!`ßÃ„Iÿ\Ø,O¤½1j¿²	B~»U“\Ïk!p.¸\"[‡Û’\äõjX¦Ef.G¹ W\Û\"¡ \r¡ z:\ÙuôÒªpŸ\ßGKs^UsPj9\Ïj„X¤«†\ì\ÉB>„\"hŠ\èj±÷\Ô\ã\É{ödb|Œ+·¬\Ã\ä\'÷=Î®g“ˆ„8›J‰‡ù×Ÿ\ÜK¾¬µ®\Úô\íôõ¨#¿©—ÿ\ÍŠœ¾ı¡]Æ#ıœ™Iqğô¯—}ñû<yªq\Ã%›1ƒg\äºm«xõ%ë™\Ë3‘\Ê -Í§¡¹	·®¿`°ù;yv”S#6²T*™Tb¶óÔ‹½w†Ù¶ª‡C\ã\Ê:\Él\Ãx<v\Ü\ÉE¦­N{`¶\n´¿)ª‚?\èC\n˜\ÉHe‹¼ê¢µl\ë\ë\à™£§ˆGCl_¿’B±Ì­÷>\Â¿\'+Ûš\Ùu\ì4-mü×¯w³÷h%”h~\Ğ\ã\îqû¨ gû•SB(?-”+¥¯ÿ\ì>^\Í6®\î¡t’C§\Îò‡÷\rşö[·±\Ê1,¿|bÅ’mv¬é¤¯£	EUPUŸ\ßk_ºx! AJò…ß¸\ã~&’)G%Ù±rÁ=2ÁE t¢¡v\ÔuE{3\Ñ`€\ÑI\æòE~ò›§\È\å‹ºQ\r{\ÌGş„¨³=\0šWµwB\Ğ\İ\ÒÀ–•\íø½*\Ï;\Í\Ä\Ìk{–qûCOò\æÿõŸ\Ê\åŸ\æOo~%\ËÛ›ù\î¡h\Şı\áxó;\ŞòÁj–\\5yò\Ôaó’w\Ü2<;t²g\à\ÌÙ­|\êıo¢£%Áú\İ\ìØ¸Š\'\Îğ“û£\\\ÖI\çl[\Û\Ëêº98QS(\æÊ\n/\\\nOr\Ûo\â•mb\"™\âô\Ø$•rUQ\Ğ4\Íñš\0Kb˜©¹9\æ2ÊºÁ¾şA°­o9>}ˆM+º\èhi´\ßğ\æ…!–œ J0¡Â± ^¿»)c?7\r‹¹õn:x’\ÙtÓ´x\ë+.\çİ¯\Ş\Éõ—m\å\Ão—o^Ç§¿şc\Øõl.\Ü\Üñ¯³C§ş\ã\Ğ}?«²\å¼S‡÷?‘iYµq<9:t\Óñ3£ş\×\\u\×]º™m\à’Vó\ê«.deW\ÇÏ2>5G\"\æúK·\ØV¿n\äŠ*¨”uı|^\ÆR`sr&“\ã\Ø\ÙQNO`\ê:·?¼ûŒ¸r¹B¡T\"—/’\ÍHg³\ä\nEt\Ãä½‡8|vŒ-+»928\Êğt’7í¼˜¦¸›\Úøü\äæ¶‚}¸_¬\ÑNc¬OÎŒNñ\Û\î#\Ëó\á›o\äs·¼“+¶®cEW\ë{;iGù\É/\å_nıE\ÎnØµù\Õ\ïü\ìğ]órD\Ï9¶r\Û\ë\Ş=^Ê¤ü\ã\ÃC›û‡\Æı/¿t3á€£i*kz–\Ñ\Ş\ç·{‘\Ì\ä\ì]şD\Ì“\í+\Úßb±\Ìóp\r\ìI†AoK#g&§y\ì\ĞI\Ötµ‘+–ğ{5>¥²N¥\\¡\ä\ì°†Á\Ó\'ù\Î/!\Z0<D\"ù\ÈM¯`\Ó\Ê^\'Mğ…I£‚Á°\ß6À\à\Å„\ß\ì>\Ä÷\îü5—m]Ã—?öšb‘\ê\Z@J\Éc\Ï\å_ù‘5›)k^\ß\'J\éPfbx^\ç\à\ì3Y±\îÓ¥\ì\Üæ¡±‰•¹BI\\¼iuuG…\Î\æ?{Œ½GX\Õ\İÎ¶õ+«C`\ë~U —uL\ÃZ ò\Ï\ÒN÷y½ø¼\Z}-´%¢œJ26“\â±C\'Q\r¤Ä°L\n¥2\é|=\Ç¸k\×>®¼`\rWm^Ç›¯½”›_~%=­ˆª„>ç£¨‚HCÍ£:7m)(\ë:_ø\á\ì;~š¾\é\\}\á§¢\İÁÑ!>ş\år\äô\èx¼³÷›¿õO\î\Ø÷\ÎyUi\Ñ\ì\èşüC~\ç>wf\ï\Ã=?¼û·\ë\Ñ0ŸşÀ›ğh6½BA?Wn[\ÏO\î\çg÷?Î»_s\r‘P-kM\"Qcl”\Ì\Ú;Y®M¨ûw.\Ø+[MSiJ4‹†inl\à¢u}¤29\æ¾İ‡¸{×¾j°Í’úùğM7pÕ–õüT\á\ZP	R9O‹ƒûr\Ï\ëEóhU\İ/£?<1\Ë=>\r@8`Ÿœ\ënH\r\Ïğgÿü=<x\Ò\n&Z\r\'Z¾÷\Ğ\×şf\Ñôôók\åe×½\é\ì3ÿ¥—V¿û5\×h\ïyİµDC†\'fø\Ò\Ü\Í#O\à÷\Şñê«œZö\êU\n[’S\î^\ÒY\×\×\ë¾\æ—\Û\î¢\Â~\áOJ(K”\Êe;n$\íŸÏ‡\×kÿlŠ\Îc/D\êû<ˆh\"B0b\ï»`šı§\ïò\ï·?À\å[\Öòş7^GgK‚¡‰¾r\ë=\ZJz|]mk·|hxÿ®¡%:9?6¾ò­ş\Ìø\ÈÇ>ı)i\ê»Ûš	üŒLÍ’\Ê\æg‚±Æ¡Rnn\ÅU›\×4ü\ìŸ>FSC\ÄÙ±rxOBj*M©>@VNº‹œ…`9÷¥\ë†8jÍ©N\í1Ø»g\Ò-ôB\Ùü¼ Q5…\Æ\Ö[œ{B\Â\ÑÓ£¼õ¯¾hõO¤òÃ…|rj}À\ë\éˆ\ä‹%ò¥òT´e\Ù\Ï\â«7}\î‡ı\ß\ßË–\ì\å¼gGOõ16\İğ¶cBU\î2\r\Ã?=;£\Îf‹\åŠ)›–¯ş\áò\íW|:31\Ò115µ©»½Yl^\Ó\ë¨B€P ”¯P‹Ï¹HZŠ\0®—\îr±‹^\çœO\áØ„\\„ËH©[ÿEB \ès¸\Üñ\Z¦\Å\Üó0w>¼\'\ï\rÇ¿ijı„\Ç\Ôr\éd²¨›\Ç-¡\ì\îÜ´\ã\ë‘\æö›8q`bÿ]?:_\Ï”\ïùş\Ã\Ê\èÁ=mÅ¹™&O P	\Æƒ÷~\î–R\×\æK_?rp÷·vn_\ßò£\Ï~”¶\æºcÑ¤\íR\ÎN\ÌaT\'>\ä.ÿ\çXW}UC®\ëW½5O¤¾¾¬>«IÄ‹IS[^¿·n,‚Á±)\Şüñ/p\èô\èõ/Ã»\İw\ÛI€·\íN?ŞŸ\Üòúô\Û)\ç}E©~ğŞ0\æ|ªpÁ«n¾\æ\ÌñÃ»\ßù\Ë\Ç÷)\ï{ƒ+n6šE\àz\ÉUÜ*7Ò¾8‚,`ljMS	ù\íT@UQPwp\ìˆMW\nj\\_\Ó\Ô/<^­Nõ\Ø ¥\ä\Ö{\ápÿÙ™\æ•\ïr‘ğ“¼¾¸;ô\ÏÎ«‚œzü~£{\Ë\å©ñ\áO‰½\åº\Ë	‡5Nö\êX/XNş^ıza1x\è™C¼\ë\ï¿\Î=»a\Ï\áNœ\ä\Ì\Ä3\éùRÓ²øüöf½k\Ä¾w…¨gquô«©Çˆ³ò­æ™‘	>ò¹\ï%©ªö÷¥\ìÜ’\ïÿ>_x\Ñ\0X¶i\Çlvzl\å\\*yA8\èW.ß²vŞªQ(\Î\Ê\Ø9¨>©j!!hjˆ28>\Å\à\è47_¶“\æ\Ê“ñ\É‡†¹÷\Égxô\à12\Å>‡x8€{ «»z­6N?nÔ‹Œ3^MSGƒ¨šR-mZ&\ßø\Ù}<¸û`ÁŠ~sù\Ö+=5px\É\é|¾ğ’\à\åùl©073™\Z\Ú4pv´\ë‚\Õ\Ë\éí°½G€\nBb^¯³½‹S@`ôùØ¶º—CCô6·sAO\İ\Í-ô¶´³¦½“-=«X\×\Ş\Ã\Ñ3£<´û ÷\îz–ñi›\rK:\'»¨µ.¤£œ„X¤\ß\Z±l\ãşc|m\'\Ù}\èÿğÿ\"]4~³şº›¾r\àÿ˜\à%€—„\0‡î¿™Á“£‰\ÎM\ã#C—Je\ï\ë®\ÙQû\Ù[ŠªRÌ—\ìUS\Õ%Zõ	\èhŠóĞ³Hg‹,kl¬n¼{5\r¿\ÇK_\Û2.\ê[\ÃÆ®ŠƒC§F9|zˆ]Gsvr\Z¿\×C,¬‹‰%º­!ˆ&\ÂhZ\r5†iñ…\ŞÅ¯:0_\Öóo§Ÿz\èşE\ZùÁKB\0\Ú\Öl9SHÍ¼²ÿ\ìp\Ëöõ+E_w;õ‰®Ò”Tª\ÙÁ\ç\ÑÉ\ênoL°¦·ƒ¡™I~±{ºa )\nA\Å00,;\ÉW\n\Ñ½­m\ä‹~öğ\ã<=\È\Ú\Şeôu´\ÚÛ¤.’ÚºK!F$n7\ãV9x\ê,ÿò,<ş-}ş65rf\Éó^(,……ÿ¼ı«w*¿ú\ê_¿~v\èÔ—6¯\\\Öó\ã\ÏŒU\İm\Õ\çz\Å 5™\Æ8o|¨¶°\Ï]³\ÕG\Å0\à©#§˜N\å(•\"~?Ÿ¤`Ã²86:Dgk‚·¿\ì\nºÚš\ê\\XW\ê\Î\í\×ı! \Öv|[ù\Ì\Ìey\Û\'¿Ì£Ï8Ş´|\Õ\'^~\Ë?üò\'}\Ãy¶\Ñ^¼¤\0X}\Å+Cüœ,\ç\ßÿW\ïyƒò‰÷¼¿×ƒ\"lQN\Ï\æ(\êWÆ®_o±ğ\è\ãú\á)@5õÈ•JT*ú·S\à\ÕTB\İ[õSi÷V¿W\í&k•xK¬ú[Â–eñ\Ã{~\ËÇ¾ø«P±ş}\å\Å\×~\ê\ä\ã÷\Íñ\ÂKª‚\0f‡ú‹¿\íOO\ÙwÕ¾cı­Wl[\Çòöf›\Ã¤”K\î~®dşõ†r>1LË¢\\1\Ğ4>\ÍC\Ğ\ç#\èóğûú}„ü^ç—Œ¨«_\×^\Õ»÷©pûC‚aµ\æñ3£|\ìK?`\"•=°õu\ïş›C÷\ß6\ÈK/9\0†<9\İ\Ğ\Ñœ›ºr:™ö¼öšø<v¶„¦ªÎ¡\ŞFÕ…wg\\\Õ\Ô%AB2“\å¡gòøO\Í2\Îòûñû½¶\Ë[õ\å—V5\n8t¨\Ï\Z°Kªªê„k»fŸù\æm<°\ë\Ù\\¤¹\ã\Ûgö>üós\Z|	\àwB\0€®-—–²s+\Îö5\Å#\êÖµ+lc(À\ã\Ó0-]¯{\ßW€F‹\àN\"-S\×	x,K2=—\áW{óÄ¡“¬\îj\'ğQEüö\å\\ ğxbMQ|~WõH\î{bŸÿ\î%%û\ï®.ş—™3\ÇÓ‹T~\Ñğ;#À\ìÙ“\é@,‘\Îg\Ò;ÏŒL4l^\Ó\Ãò¶f„EÁ\ïó eıù¢N\ÜbHr¼“ Ï‹WUiùiGÙ¾j9\ËÛš\ènmrÆ°ëŸ“ºœpˆøüb‰^Ÿ7ô\ë\İù\ë½•³“\É\ÓÁx\Ó?|\ê\Ùóµöb\àwF\0€›>÷£³SıG|Ã§.|\æ\è€ÿ¢}t´\ØÁ:!\ì]/\Ã9¡\ÜVË‹«\ÛV\Ø\ï|>\'$ğy<´5\Ú3¥\ÊıK¸›uà¦šh^•xs\ÏN£Bğ\ÌñÓ¼\ï3_\ç\ÄÙ±©Ö¾õ\ß\ÚùGó\Óc¿¾\ãwv\nù\ï”\0‡\îû™\ÕÔ³ú P\Ô\æ\á\á\áÎ‡:ioN\Ğ\×Õ†\êü\ê?\às~ŸÀtP\ÍkU{\é\ZK¦yˆ„C4D£„\Ã!<u?hWª\ã~)B\ÖE®\íP…Œøih:.A¾T\æûwıšı\ã·™;Ù¶fóß¬½\æ5ÿ~\ß?ÿù’\'¾ğ;%\0@z|¨¼\êò\ëŸB\ÑG\Î\\ûø¾£¢9cı\Ê.›Š‚Ç«aT£ş7%İ¨ıİ•7‰w\Ş\Ç}¾Ğƒn\İ:¢¡h€h,„\ê¬v‹¥\n_¹õ>ûÿ\"™+\rÅ—õ|ì¢·üñ/ú\Ê_¿\à\è\æ…\ß9\0¦ú\ä\Û\Öm\ëN\r¼1_®ˆ]ûašû–ğyP×ƒY\Ñ1\Ì:/¦>dq•r.\Ôûş¢zK¨*\áh€HCEµ¥\æ\Ì\èóŸò­\Û$W,¡z<—¾\ã–ÿõÀ—>QX¬\å—\Zş¯\à\Â7ÿQ\âøo\ïúH0İ¼\å\âë™™™\æ7O=\Ã\È\Ô,—lZM8@UŸS71«¡:Q\ÓóÅ»¼³\ä¤ıóµ‰\áXÀ²$ûOœ\æ?ûM\î~d/m]kh\é\èavbXTò\ÙÁ\Ì\Ô\è\á\ç\è\ä%ÿ+Hœ¾Æ¨”>\Ôİ»!vóş–\î\Õô–½sftŠ\Ík–\Ó\ØAU|>•²eºDXÚ¯_\Z\\Ø’ ¨\n±x„`8\0\Â~Oø?\Ú\Å_}\åG<{\â,«7]Æ›\Şó×´w®\âÔ‘\İÁ\Ü\Ülö\â·}\è\é\áı»²\ç\ï\ç\Å\Ã™\0½\åOÚı\æ\îp¢¥Oó¶c§\Z\ÃyŞ–ijs#g.)¤g/ø\à\'¿\éß°\åjø?Íy|Å•Ç¿==—\æÒŒ$\ë–,Y²|\ß\ÆømlÇœ&€C6CÂ‘\r\Ù\ÍnvIv\Ù$›\İ\ÍI’Hò	0!`pŒ–#_ø°-Y‡m\İ\ÇHshfz¦ö\êî™±e\Ë6ş$ûû|F3šª®~\ïÕ«W¯ª\ŞÚeÓ“÷qp\ï[Œ¯(\â\Ş^\Ï\å‹gË½÷	`H\ÏÀd¬ T½9û:\å3ËUÁğ`w\Ø:zø\î\Ã\Ïò\ĞÆ­ä¸¼,»ò–_q\Î\î\áw¿ø*}\İ\'BÀy¹›W^eÍ–\áÁşMe\Ó.i:°\å\ésrØ3¦^ş©\âc\ïm»X.\Öb\Ã~ +ª\îh¸\ç‡/PZQg’ª¿·—ú)»\ß\ÙLEQÿõ÷Ÿb\İ\ê…8\í6’Z’d\Ò\ØQ4²\nRN»&@_¼7¾Q,Š¹Ÿ©¡ùÿùÀSl~k7NO«®½ƒE—}\Õ*\ç$o½ò$\Ï?ş4\í‚\rŸ>{»Yñ\çš+ÿ\Ğğú¦]£8+>÷\è6şü\ÓÿğÙœ\î5\Í;_ÿ2‚Zü.·\Ï\êöø),­Fµ\ÙôJ“\é5l‘J\Ñ\İ\Ş\ÌÉ¶\Ã\\ı©/³ú\Ú;#\Ói42\È[/o\à-cS\â\Üq\İ*\î¹\íz<.\ç)‹ñg€)øF/\È\è\rú[BK²\ïp·ÿ÷ƒ44Ÿ¤l\ì$®ùô¿P3i.ª*\Û‰ñ\Ôo¾\É\Ş÷¶²\î¶o\ë+8­ª35EKj9´ƒC\ï¿I°¿+•\Ôšjw\ì\Èñ°ôŠ\ß\ï~\î‘3:ğ\Îúx\ÅgO¶|+ºJ¤R¥¹B¦]²‚©s–Q3a‡Ë”\ĞLÿy–2P`ßWx\âÁ¯Q^5‰\Û\ïş9.—OVHº	»\Ş~—ÿğ+z:š¹\ë\Æ5\Üö‰•L\ZW¡gL=\Ëb»y³Œ_d4 ½»Ÿm\ï\à[¿y†–\Î~&L[ÀÚ›¾Bq\Ù8ó7\n\n½]\'ù\É7o\ÂbQøŸ_n“ÕœrS\å–˜\á¥\í8\Ñ\È\îw^ š‹\0\0ZIDATb\Ï_¶\Ğ\İ\Ñ0\à+*ÿÅ’\Ï}õ‡›¿÷¥wKŒX\ã\çyƒ¶\ï:\ßüõ÷î…oµXTûŒy«X²úÓŒ­†İ¡\'yFMi—KCœX,†\Ûã¡«½‰\ßş\ìn\"¡ 7ñ^j\'\Ï\Õ\Ë)F1D2É±#{y\î±\ï\ÓyüCª\Ë\n©.-bjmcK‹pdFA7\îfŠ¥ £o€\î^ùŒ]}tõ‚CZ;z\è\îbù\ëY~õ­\äúM¦\Z[÷\íx…G~òe®ü$7\ŞöM™7¶f\İ÷”ÿ\åj‚@Á‚–ˆs¼\å6>ò-ZôøK+ï³\î_\ÖL\Üğ¥Od\×\ÅÈ«¨)÷u\ß~Æ››o½ü†»X²\ê\Óiš	Œ?¦”g\rhšFW{;(\n~¿ŸM~\Äö×Ÿ\åŠuÿÀÊµ·£ªVSWI	±X”—¾Ÿ\Ãõ\Û\é\él%3B:Å‚\Ó\å\Å\ë\àö\å1o\éZ®¸A\ßJ¯˜`Ìşñ?q`÷6\îø\Ê/™<c1‰xœ`p·Û\Ëeôt£\î‘ 3†£»\×C¡>¶l|€¿¼¶-ô•§ zÂš¶¿–µ˜sÚ¾ ñ‹/·ô¶½=	]“\ãöY¯X÷\Ì[ºc\áDd<SOf6K”q28¤;\ÖAE\Í,¶o\ÛH\ã»X´òF\Ü\Ş\0\é\Ù-\Ôp8]¬½\é_\éno¦õ\èö\î|•\Ãõ\ÛMF¬[6§ÍŠ–L»g°¿±•C-\'°XT\nKª˜³\èJJ*Ç“(ÂŸW„\Ï_€±uR˜û‹Pˆ„‚´;DQ\é8ò\Ê\Z`08DJü€\ŞS”ô‚Ğ©º	ÌºŒkO€5\×\ßE÷I\ì\Ş\æ÷u\İ<qùÕ›š¶¿ÖY\ê48½¹û7}AQğ/^õw\Ì_~½)­B‹\'F	\r…Ì”&\n`³\Ù\Èq»p{<¨ú	–·›\Ğ\Ğ©d’\â²:|B\Z?|Ÿ`_€l–\É\ÏBT\ÕJIùxŠJk˜8s	ÁşN^\Úp?\ì›i5•\Üx\ÙB½=2¬A\×À ÿö\à\ïq¹s¹\éß¡¨¤šü\âJ3øŒ³\ËF9IP@\Zöÿ…ğP?\ã\êf£i\n½==ˆ8sr°X,25U8B4&gõ«ÕŠ\ß\ï\Ç\éveT<>?×®ÿ\nmÍ‡\è\í˜Xÿò3·-ş\ì\İ_{û\Ñ™fV–q}\å=÷{\Z\ß}õ³\"•,[;\Ãò±5ŸÁªÊ°”\n2vNg{;İD#´DB¾ôl}=½œhk£¯§‡øp§Ó‰\Õ*u·\Åb¥fÒ¥\Äc\êwo\ã\Ú\ÏT	\0\Ñhˆ7¶<\Î\Ö?şš—®\Æ\éòò\Ç7w\ÅÉ±\ÛÉ±\Ûq8\ìoleWC…¥\ÕôòÂ†û8~\ì`F¥’UŠT\ÕRú%H&5š\ï&•J\â”\×4\Çlû{zio;NoW7‘p„„ş\ÌIM#©iÄ†‡\é\ìì »³“D<®û¦Œ\ÛZ\È+(eÁŠë±¨ª5\r/kÜ¾m\Èb@ã»¯N\Öb\Ñù6»ƒy»on@\ç¶ ™‚\ÄcñS\Şl\Èc¤Aº::\è\í“ ]\Ò*kga³;9\\ÿ™9w³ ×\"Å®·_\ä?ı\æ#ûğç¥´b\"M\í]¼s\àCŒ…›T*Å£›_\'¦%©›²„Ö¦\êw¿\ÎóO\ÜG\ç‰fİ’}\á]\İI3ºio;Š\Ã\é¦b\Ü4\Ù\0I\Ã\Ã\Ãƒ2’¡±F‚€H(LOw\Ël|-V«isVPX\\…Õ…û»g^õõÌ˜e&®ÿ\îc–\Ö}Û§\'†£•Uu3™:{9ŠE……x,Fxh2gx#\Ó\ĞEL·‚‚ı„M?Z^AE¥µ´?\Ê\É\Ö\n¤R	ö¾»•7ü‡\ÃÅŠ«¿@\Û\Ïôykˆ\ÄSlÜ¶=$Á¦wv±¯±…±53¨ª›Ã´¹k˜<k%M\r»x\âÁ{8\Ş|HJ¼\î\ÛVtõc\ØÁ\'\Ñrô\0‚rüù\åºA\0Y…$¦a6ù\Ì\Ã®ø”’”WO¢f\Ò<øRšö‰/?\å7®šho\Ø\ëq¸½—‚pNš¶ \ÙDYIl8ªsW\èzt$„H!/“!È‡w{ó(*«%6\áp½yTö\Ô\ZhØ¿\Í\Ïüœ”H2{\ÑZ*ª¦P1n:E¥µ\ìø\à{7\Ód\ÓÛ»Àb£vòB\\n?no€E+?Ã¸	óh>²\çÿ>]-j\Çh»\Ôt\n­õÄ†\ÃT\Õ\ÍÑ¿W\Ò\Í>?E\Ó9ˆ%£dX´ñS\æ¢(\n‘şîª“õ;\ãDi\Øò´/\Ü×µTQ,Ö‰\Ó™]\ÕĞ›Ñ°a©\Z\×,/\Ùoe¼QO¿b\Üt,ª•Æ†]„‡ú1\ãIH¥ho;Ê³¿ı6=]m\Ì^°–Yó¯\Âj“K­V;s–\\G<¥ğ«^a\ë\Î}l¯?LY\ÕT&N_Š4no€\åW\İÉ¤\Ë8vx/úm\Ç\ê1²\èI\"™b\ïö­¨V;\ã\ê.AQg\Ú\Ì;’\ägC*•JšD£\×!¨®›‰EUI%5W\Õ\ÜeµF)“\"•t\Å#!¿¢(”T\Ô\ÉK\ÂbV-s\ÊK“ñ\Ì\í\È^(I?Dº×”UN\Æ\ëÍ§µ±\Î6\Ò\Z\"EK\Ó|\èôw·3a\êf-¸\ZU5Ô¥¬«¤¬±µ3yÿğ1~üôf¢q™ó¯\Æn\Ï\Ìj*ğ\æañ\ê[?y!G?\Ø\ÉÆ‡¿MWG\éGôõœ\àxó!J+\'\ât¹\ÓÅ³1:2i’J¥dpr\È\à¡B ¿  8n\\1WQS\0\äú¡4\ÉQLº\Ò\ã|hƒÍ‘CyõTú;i\Ó-\è\ïigÓ“÷\Ñv\ì µ“.eñ\Ç\×\ã\ÌI\'5:¹\Íá¤¤|\"Š\ÅJwÿ•µ³)­¡À„H\Éx4L(Ø‡\ÇWÀ\â\Õë©¼€–\Æ<û\èwh?~„<¯Ö°\ïm\0Êª¦`wxŒ\Ör\áPL‰d“\Óëª”T\ÊvFú»ÊŒ\æ<@QU‹ñ¿@rT\èe5-s¶\àB\Z™\Ùk&L_Æ¾/³ó\ÍM,Zu#}]\'ø\İÿNS\Ã\Æ\Ö\Îâ²µ_\Ä\át›B`\Ü26a÷;\Ïóş»/‚Sf¯bŞ’\èfh ‹®:O4	õS3y>s^‹7w+®ú<§‡ƒ{^å±Ÿ\İ\Í\r·~±µÓ¨\ßı¿¸\ÜŠ\Ë\êôÀ ]Y$“)Œ¤\æX€\nøó\n¶·V%Ld\Î\î”\Ì÷,UbHóù\"S¯\nüyE—\Õ\Ñz\ì ­yõ…\ß\Ğ|x\å\Õ\ÓXòñ[q8]²Œ¢ „±\Ü ÿôuE°\Ûs¨²\0G‹[ŸA Œ©dÚœ•¸sÈ•\İƒÿ¢•7‰9Ö°ƒ\çÿó—]GOW+¾@!cŠ«\È&şù=£a\êšD\Ï\ê²\ç+@ _î“…‡L7~z&œÁ\0S\Æ\ã{¡ÿDdM”\Î†4\Èò§‡êº¹´·5ğ\àw\ï$RV5…_÷%<>¹ñ\Ãıor\ìğœN7¹ù%øücğ\æa\æ¥W\âòø9ôşk¼ş\ÒC\\²\ä¯¾›İª\Êm‰)!HÄ¢„£½\ÄbaT«\r/Ÿ•\×\ÜÅ®@õ»_\áù\ßÿ€dRcú%—\ãö\æeˆÈ…öp\Å$a\æ`\ÆM\nV›y\Øİµş¡?¹ûüšHZe¥©Ê˜Ÿ)\ÙR/\Äh\ÖÀ©\Ğ\å7£ŒEµP\\^‡\Û 4\ØGA\ÑX­ºo\îŒN[6v\nnOCÁBC½´5\îg8\Z\Â\í	0}\Îjœ9\Ş}\í	\Ş|ù,…)³W\Òzt?}=\Ç	\rõ18\Ğ\Åpx¤§°¬–K–®\Ã\ã\Íc\áe7¡ªvön!µ“\ç3r²óƒ0…T2I\æ$Ó¤e&\É*µØ°H3\àLº\Ùª~FÆ˜\âjüy%\ä¸sYv\Å””\Õº¾\àõ\å\ã\Í\Í\ÇX‘Ñ´8‰\Ø0)‘\"‘ˆ\ÒyB\æ2v¹s)(®Â¡~¢\á o%ux¼ùXm\ìN9NİÃ¼¥\ëpº¼\ìß±…Ò±S\Î\Ü\Èó„7õ	\Ûh?\Ö1*E¹9*r\Ü>&\ÏZAqyù…\Ù\rG¿0>ƒ\ÕfGµ\Ù\è=Á›¦\å\èŠ\ÊjY~\å–\Ô\0‚I3—A¦\n\Ñusvû¥\Çuö\Âk¨¨¦ûº>\Z.L-KŒz÷ó\á\æùA0i\ÆrsüJ!M°Ì[1»uË‘½´İƒjµ±h\ÕzŠ\Ê\Ç ªV9„PHj\ZZ\"N*™q\ê\Ş|—ŸU‹JQy-\Æ\\\çbÀFE–œge@ö”ú\âÃ¢\Ğ™-\Çğ&\Z‹&\åw\ã§,¤­ù\0\Ç\Zv\Ò\İ\ŞD\å¸\é((¨ªJ^A¡Œj\"$\Ãññø0\ÑpMK’ÔŒ“š\Æh© g\â	™–\ĞYf¬&\Î\é\ÎFx	CŠ>*2U›”r9ƒNK«b\î\æl\Ó\íõ3}\î\Zœ.-G\ß\'\Z‘[w4M&QP\ËYµ¨8N|¹~ŠJK))/cLq1¹ş€Œºh\Üü\"ÀŠI\ïD\"qNÄ‡Q`H~¦…t±`\î\Ù|\Ú-¡‰\éÚ¥\09sõù	»	»¤\ÒiHN\ÙF‘F™\ë=PP@Aazpq d¼2¿	geÀHKo™Dû(8“sK†V\Ét\êY,VT›\r»Ã‰ªZQUü2†£!¢‘!EÁ\át\Êp5ŠbŠˆ0\îƒ$–L‹F‰D\"g¼ÿ_£Â™y-ô\â\Âjµb\Ó\ãÿ8NI(‹‚EUQ-zº»H†\"ú2©„¢¨8srP\Ò9\ÑÓ²(	M#\n™+xÿ_p\Î°Z­R·qN=ktŒ0À{<\n\nÇ ¨#mYÄ†c\Ä\"\Ã$“	º;›q8\İ8nT«§+G¯VH+HÓˆÅ†‰„#G¢R­\É.1B\İ;œ•Y%c<¸h\í?½¢h4JoO/ş¼\06›í´‘&\Z\"•J\Ò\Û\Õ&\'\\¹cpyó)™¿1&‹‘H\Ä\Ñ\âñ\Ó%ı”\Æ+\\KŒ\È\0\Ó\ç#{DB¶\ÕhğGTG#<w2©148H4\Z!\Ç\í\Æ\çóaµY±(\éß‰\'\Ú[> \nR3qno€d2I_w/A¦`Ä›œ\Ö\îøA ùf¸\îO¯[1ß+g\éº+(2)Z\"q\Z;*Z\"\Î`œP0ˆ\İ\éÀ\ét\âp8IjIñ8]M‘¢bœ³4…Heş\ÜpÑ„?K&4-z¾,\æœN¿32@:\İ\0Å‚\"«\r0\Âÿ5 £mÅ¢1b‘u!R\ÄczÛ±¨V}|±\ìø‹‰³T_\Ó\Í\Î\"’^!ü?†\ZªÜ‰\'\0\0\0\0IEND®B`‚','image/png','christophe.png','Jean-Paul','','',0,0),(9,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0g\0\0\0€\0\0\0\0w\Ã\0\0 \0IDATx^Ìw|Õ™÷¿gf\î\Ü~\Õ{uor\Ók0d!¤’,IH#u³É¦‘Í¦\í¦lB:©dI!$$$$$„Àt°q—»-[²$K²ºt¥\Û\ïœ÷33w®,¼û¾?ò{\æ”\ç<¿\çy\Îs\Ê\Ì¼Bôš\Ïş °õ/·¾cø\è¾_´¶¶r\Æg „\0@J	\à~wÒ¼\ßgK?\Õõ©\èÅ¶\ã\äó\æ-\íÅ’”Ë²Ø·o‡\"Z\Ót\ãy\ïú\Ä7\îÿ\ÆÇ§^¨\ì\éH¡/†^ó¹¶\Ş}ë›†;|qÎœ\Öò¶¶6|>Ÿ+\ç\Ï+¨€·Œ7\Í!Ë²H¥R¤R)2™LÑŸ]\×\İ23Aó\Ö3³\r\ïıS;3\Íáµ¼¼M\Ó\è\ï\éZ4\ÔyhôUÿú_o|0\ÃK¤LEf¡knü±ñ\×\ß{\×H\çş/´47·®\\¹Róù| 9m\í³iùlyr¹™L†x<\Î\è\è(\Ã\Ã\ÃLOO“\Ï\ç±,«¨\çZ\Ó4„hšFEE\r\r\r\Ô\Ô\Ô\àóù\ÜzO\Ê\Ñ\é¬8Ÿ\Ï\Ó\Û\Û\Ë\Öm\ÛúJ\ê[¿·ğÂ«~ú\Ü\ï~˜š5óĞ‹\ã\æô\Ş_m\Ğ\Ö\çSW\Şı‹\Ö\Ö\Ö\Æ\å\Ë\Û0}>œ.Ï´–CÀ’\É$ııı\r\r¹€¼T\n‡\Ã\\pÁøı~²\Ù,\Ñhô”®\î\áNJJ‰D²w\Ï^\íW\Öh´÷È½§©\â”ô’\İZõü\ål»ûÖµ“\'únjj¬_´b\Å\nL\Ó,d\Zx4t65[\Ç,Ë¢³³“={ö\Ğ\Õ\Õ\Å\Ø\Ø\Ùl–—C¹\\\Æ\ÆF:„‚\Ò\ÒR\0‰„kM\Ítƒ3¯gò=“!(//\'™HDFG†JZÎ¼d\ß¯\ÏÀ\Ñ\çŸ\à¡—Nı\Ò3\æOôü¨$X~ö\Ùg›¦i\"(Œ/pj ¼r®óù<ııılÛ¶‰–eñJQ?\Ó\ÓÓ´¶¶°o\ß>¶n\İJ<\'\n<üQ3™\Í%z\Óu]£ªªŠ¾¾¦\Ñ\Ç+“£\ÏLôşC\ÂK\çš\Ùuÿn\ĞsÉ«W­Z\ÅbÀ¡{€z1À<x={ö099\Éÿ\r\Ê\çó„B!B¡ ··—|>\Ïøø8\Ã\Ã\ÃƒAJJJ€“]Ü©\0›y¯ø»@\Óu‚Á€q¼ûX¹%N\ÅÇ·ğ\Ğ?ÎŠ«\Şj<ÿ§Ÿ¿=39ú\ï\Ë\Û\Ú\Ê\ê\ê\İx&½—R’L&Ù±c/\Û}½e2†‡‡™š*V\àt:\Íğğ0@€X,†¦i\î½\Óñ\î\Ü?\É=«!C\är¹ğÀñú•W_·i\à\à®³V8¸x‘\ZX˜O§\Ş\İX_kimq;\â0\ëıôj\ÕL7\0J›÷\ì\ÙCoo\ï+\ê\ÂNERª\èo6J&“´··3444\ëı™4Ó94S!u]§¥¥Eüm\Ï>ü¶ó¯ÿt\ì¤\ÊNAÿ8\\ÿimğ\Èşóëœ³`\áSh\Z\Î\Ør:¿\ìı\îM;zô(Ç#ŸÏŸª\ÉÿUJ$\ìÙ³‡\\.7«ğO„÷»1\ã^4\Z¥¹¥\ÅLMM\\}ø©¿\æs?\ä\Å\Ğ?N\ï\î-We¦Ç¯X°`YZZ\nA\Ïf÷\ÏNş¡¡!<ø¿b1ÿrøğ\á“ø:\Éu\Íğ\àq^\å´1š\ÛÚŠl\Í$¦\Ş6\Ö\×]Í‹ =\æ\\pı§\Ë;}\ä½Ñ ][[›f€«)¢€\Ù:Ê:tˆÁ/\Úış¯‘”’T*EUU@\0˜µ\ê\ï)ú©¨XB¨\àÀ²¤y\âx\Ï\â‘\îh\í\Â\å==§õ¡/\nœ\×|\îl¹\ë&\'F>³j\åÊ²òòòb†„G\âµ\ZeXE\Ö$%A|*\ÎÎ;ÿ¿qg3)N#„ ¶¶M gX‡y:w>c\Z\áPeE¥¥%¾\îÎ¥c\Ç\×\Ì;\ç²ı£=Gs\nzQn­k\ëÓ¦\Ï|M$ª¬©©9i\Ğ6/‡¯\Ù5\n8q\â™\ÌK^rú_¡cÇ\ÇqxI^—\æ~\ÚıŸÍ@\ÓuµµTUU\ÅtŸ/6\Üyp`\Ö\Êm2Nw\Ó!Ë²J\Çû»®X¼pA\ÈYPI\ÏÄ¼¦\îó\èvDgY9\Ëbphÿ\ß)Ÿ\Ë1\Ø\ß\Ï\Ü9-¬Z¼ˆµ+—’N§Ù°yût‘J¥\í~\ìD0»«+XLMM\Ñ\ß\ßO V±s\ÍUoü\ÖoÔ¶C/\nœñşcÿòû\×\Õ\Ö\Í:ğš¸}‡H(HÛ¢yœw\Æ*j«*†\Ç\Ç\è\î;Á\ä@/~$ıC#$\Ó\é™\Íı?¥\Ê\ÒRµ6²|Á<.¿ğ.^·²òrw¬Y½l	{v°ş\Ég\Ù\×q”\\>o\0/ ¬¶Ue³9¢\Ñ(ñ\é\ÉW=\ï\íoº\àúOß»ñ¶\ï\Î\Æ\Ë\ì6\ë¡\ë~ô·Àÿı\Úÿ©*/{\Ïyç‡®\ë\'¹«™n.\Z	ó¾~=m\ç\n¼J\ã‰{9\Ö\İ\Ã\Ñ\ã}lŞ½öCG\é¤óøi­üÿ\n…ƒZ\ëkY»l!+\Ígñœ¶4\ÒPU‰\Ïg@(Šˆ–!5\ÍDU¹‘±I6n\İ\Îú\r\Ï\'°ı\ÙI²˜\âñ8¤»··¯®m\íGº·m¼g¶|/h9›ÿğ\Ó5š¦_TWW‡×¥9Tˆ\ç3õ5U¼\ëW³|ñ|Å¬\'¯\0H\'©-‹R[²„³–/\æš\Ë.&›Ë“·òÄ§¦\è>1HÏ‰av\ì;\Ä\à\Ø8\ÇŸ Í’Je‘ö\07<:Nz–M\ÓùM„¦#D\ÂALŸ i\nˆ¬Yºˆ³\ÚS_U\Îü\æ&\ÂA?>\ÃÀ4„¦áš‰q¤@BH\n·*\ÊJ¸úU3¯¹‰\ßüù^ú‡±<×µÍ¼GÂ„\Â!¤”½M\Ë\Ï\İÓ½m\ãIı€a9f(úv™Mß¼\î²\ËJc%jr;{ø\ÑHˆ¾óZ\Ú\ÎMpRõR\"\ãcˆ\é	¹®€“óÚ”Jg\Zgrjš‘ñI7rºõ¯÷ó·\rI$•[tø¹ü\Ü3y\ã«.\Äô)½k¨©¤$¦²$FEy‘ ß®C\Ú\í‹YZ¶!°AúCˆòš“o£ø?p¤‹\ßü\å>ºûúT}^‡W¥R)¶l\Ù\ÂD*ûû\Ä\Øğuœ‚Nk9—ü\Æ\Ğ\æ;:ßš7\"Ñˆ›>›[3\×\\z!\ËÍ·)\È[\Ú&oYˆl\Ö\ã“`@\"B’°’€i\ÒX]\r5¶¬l5\ÖV²xn3?»…Á\Ñq\Î]±Ÿ\Ï\à³\ï};\Íuµ\0!í¶” m‡có%\ìömf¤3–Z6hNS‘\Í@6†=t Ia³)X8§™k¯¾œ[\îø3ñ\é„\İö©õ>™H2<<Lıòs96öô)óœ£›ŸˆYùü¥\å\åe¡&`3\É0t.>\çL\Ö]pB„ôF0\àú\â\\™M«ÁQH\Ûz‘‰\ÂÀ)¤§\Êc\ë9ag—\Ìi¨\ã†wÿ3o¸ôÜ¶‹w\\}9A\ÓD\Ót·\ÜLn\ß\Ğ<‰\ÂRı³\Ëi¶UË‚tŒ(`;›4\0]c\Õ\ÒE\\qÑ¹ü\í\á\r*H `=\'¹7G!¥u\Ú-„Ó‚\Ó\Óş\\(—I7Ï©[\\”>Ó­5\ÔVs\åE\çl\í†¢\0@dÓª£.v>[MU•6X\î\ä\É°#DH\rS÷±dNš›0§=› \Ç2œ4z\nR¤°—o„*+3I†ºRºóR\éğ\\v\îZ:ºzØ¹ÿ›œ$†A Àğùk9\rvZ=oi­•\Ë\Æ\Ê\Ê\Ël\Õ=y \Óu·\\u9\r5•ªÀ\ë \\k\0‰RH¤°”F©JÀ´›[ª?\é~W²®¼•-!$†\îHJ\îy\Æõ\ç¤\á2\å™ø»-«¦¬\ãN=™d3\äŒr–[¶$e\İùgQ	»w‹‘ %†a™\ê[\Âi\è´\àè¦¿UÓ´JŸ\áGx—\'\æµ4Ñ¶h>R()\Ø\"ó\äP\ì\Ë|NuÎ½!U\ä%\ìkOz\áT5:€P—®° a	%8Y0<5Â¢`¡…bN‡„(\Ø\íH„%é¤§97ƒ§œ`\Éü¹ÌŸ\Ó\\¤o\ŞùŸD`øu!9]\Èg¡Óƒcø*ı~?†¡ƒ\ë;m¤\Äô\\´v\r>£\à\İËº\0H%]Œ±É‚„°“\çMq…`k¨\×\åz>¼u´YJ/\ŞV¼Àz8JN\Û<*f\İ@¤PŠ\n¸`\ÍJ—÷0JE„\0Mh†Á\ä`_#§¡Ó‚“—ªI§Šı¥TZ,PBª«®f\áœf§\Ë\0^…À’R3™$ÅT\ËõFT\Ç\ÛIi…Ó¾\Ê\å\n\ØN—Ò_q\ã¡	®7U2\Ã	Hd!\És‰yd*Q\\•-Om‹\æŠ¬\ÇU4)1t@ €´ò\Æõ·>qJN\Î\Ôdiú=ô¼wuÕ•TU–S\ä<\ã‘\ë^r\Èe\ãL!·}\íDdNI®P\Î\Ò\ÑHa_Ÿ@\Ól+\Å\Ò\É\èÉ¬¾\Úü8ZˆóH&\ÅpÈ«,~¿\É\âys)FÀö>B-‚\nM«\Ï&¦N\é\ÚN¿*mW‚Vpi¯†®³ µ	¿=\Ù+°P\Û\ïl¬¶Šª\\³t\Ğ%7\Ñn×‘»G;a\Ëy]={Á,\ÔU\0Â©§¸ş™¸Y*S.\rY\Ïz`±\Æ\"„@\×55GØ†å•²\î@ „aøb©ø˜\ç<Y1½¨-!–à´£\é\Z\Õ\åxıoq![û,‰Ì¤\\¡xô\×€·Œ„B\Ô;\Óu\á]8E\ì<X²`.+\Â\Ì;¨zfsºnšPÿ‰|2i¯V\à\Îe\ì4Mª+\Ê0}¦Rç¾ª\ĞAaŒtw\Ôs\n:=83û p¥ah:u\ÕUn¾\"¡;cƒ\ËRa¨·Î…,ˆC¢\0Á.+…\Z\Ø \ê”­ş„=\æx]§\ëZ¥j¡0³ë±¯¤ı¿@¸}ñ*b!³T<§`YŠ/§«\àq—‚X$Li,\âi\ÇCB\n…ğ\ÙTò%Z(4\è&\Ø\Öuš\Ê2G¡Ô§İ›\Â,X\"2)°ò\Ø·ûW°4…‘,\Ô#„\ír<\í\nÇ*\á\Ô}Wm°{ı\Ş<Š\'i§\Û\Í\á´$lp*tøpg¬NY4e9¹Œ‚S \Æ »]Ë†#„q\Ç/[nJ\á\ìO65r\â%9¶ ‚F:‚\İp²\nÏ‡£vB*©\Øó \áZ„GHbz>\n \ÉB}v§Š\ÈÀi§ø¶(	p.r›N«v\ß\n\Z/°¿I„\ÈÔ´\'Ol	úı„\ì3¶\Ş\å\nƒ\èšnŒ÷=\åa5\æ‘t\Ì_bYy[¨’Â‡£™\Ë!³¤ô.…\êqI\Ì`]R\ÔiIq\ç\n¡µ7\ÍÚ‹œ<¹\ìLr\î)p\Ö=:\æá­ HHH%ù¬\ê’PóT\íKA&›%ÉºE%quM‚|>J^p?Ç»¹\æ˜%@6—\ã\à\Ñ.–ÎŸ\ëNÀ\n\Zlÿo»´Sò0\êD­”8**\\\röb\'%+ö.’¡=‚ˆš-\íº‹õVlW(<eº¼\ã\ÓI:{û\Øw´\İ\ĞY±r=£¬»ô\"\Ô	>B\"-É¦»9\Ö\×o[§(\Ò4˜Áa¡\ëŸÏ‡¡{W\0@HH¥\ÓüùGyÏ›_Kc]­Z\ÅÀ\"™\Ê ¤$7>Fzb‚PÀ\ß4\í<¶wÖº„§R¯@‹‘ótÌ®\É\ÓiUP¸²\ÈdrL%’„Lş`ÀU\ZÇ…©ú=uØ‚´,‹±ø\Çúxv\ç^ö\éd×¡£œ#•ÎL¥¨¯®\äûŸû·ıı*++8\ÒuŒ7^yB\Óx\äÉ|úK_£u\ÎJK\Ë\Ğ4\İe¯Ğ”Dõ\ç\Ô\Î\ë´\à„Ë«z¦:\Éå²˜~_‘…kB°\á™\ç\ì\ï\ã›ÿùB¡\ÓSÓ€\ä\î¢¥¦†\çŸ\Û\Ä\Ó\Ûv2·±–ÚŠ\n4\×\ÓPSÍ¢9”E£veJ\È\Ò\Ã¶BIå€¢ñøóÛ¨¯®dñœ&¼\ä\í8¶\ï8\ØÁ­¾—{\ãU,Y¶\Ãg\Úõ:Àn\Ô\ÓøÀ\è(w?ú4<ı?»U­p\ÌB}ƒ\Ãôõõ“Ï¤8\Ö\ÓÃ³\Ïo\ã²\Ï\ãĞ‘Nnø¯ÿ¦\ã\ÈQzz³h\Ñ\"š[Z‡BnY‰$™LËşh\ØiÁ\Ñ4} •J‘õœ/Vƒ´¤³³‹ö\İ{Ø¼i3sš¹\á\Ã\ï\ç\Ö;şHsc=÷?ü8ÿr\í5\Üóğcl\Şw\È-[‹R‹\ĞRW\Ã5\ë.\æÍ—_Byi\r\åP”ˆ5…Ó–Jf\Âöv’o\İö®¾\è\Ïi*•\Ç\İ\Ú\\‚„ıGñ\ì\Î}\\ñ¹LQ\ÑPo·T\È+¥z&ht2\Îoÿş0\Ûğ;ö&‘:ıÁ“©dŠ\Í\Û\ÛY»x\í{28<\ÌşC\Üøı›9|¤¤\Óiö\î\İK_?K–.¡¶¶\Ö\åÓ²$€«m\Z>U§\'91Ö\ÉfSy+p\Ì}pğ\à\Ä	u¼©¢¬L\'<ôÄ“¼\ë\Úk°,‹‰\îN\ë-ªol2\Î\Ødœ£½ı<±e\'ÿõ\Ó_qı®\äòs\ÎdÅ‚9TW¨º\\Erv(\ã\ÓIR™\â³…\è\Û”\Ó‹Oa\è\ZÕ¥1&†FğùıD+\ÊA\n&§\ë`ûÃ¬z\ëŸ\ÙB\"9\ÛÓ\Ò“”’mûq\É\ê6~ó\äó¬\\¾Œ-;Ú¹\æuW\Ñ?8Ä®½ûuºuhxˆ\ÉÍ“\\q\Å„B!‚d2I.Ÿ\ËU¶\Ì?å©–Ó‚3\Şl8“N\çsù\Æ\\.GOO»w\ï&™LPUQ\Î>ùQş\å=\×\Ñ\Ù\İC&—\Ã0ª>va\ÜŞ²=NÄ¹\éö»øıı²zñ\Î]½ŒK\ÎXE\ÛüV¢\á°\í«\Ô\Ø$f’“\"(€)Da3>\'Ÿ\Ï#È¼EgG\Ç\Û\Ò\ŞyŒmûq°³›C\Çz\È\åOw^{v·p¤²YD6CyY	Ã£c|ôı\ïfU\ÛRnüşO¸ÿ\Ñ\'\ÈØŠ\Ô\Ğ\Ğ@(RcPVe\åò}\Õ–¿4p\"e˜\Ä\Ä\Ä8Bö\í\Û\ç\Ó\Ú\Ü\ÈÏ¿û\r.8\çLt]§³»‡3W,§§·šŸ\Íû;NWµKRJú‡G\éß¸™G6m\ã¦\Ğ]”FÃœ¹l1\ç®X\Ê\Òy­\ÔWWP\Z	\È[yuHÑ–™×™¹F¦jfxb’Á±	¾ñÇ¿\Ñ\Ş\ÙM÷\à0\é\\d:S\äªg’iÔ–•PY\åÌ…s‰†‚®ûš>\ê+\Ê1t! ©¢Œoÿ\ë{h\\³aø\ĞuUmKù\ÅM\ß\äŞ‡\å«\ßıƒ#£Ì›7PVnY‰D‚|>?¬›YÏ¬Á€S³`yj¨sÿ@\"‘\\\Ø\Ú\ÒJMM\r‰D‚\ÕË—ñõ\Ï\ßÀ«.:G<çœ±†UK—ğ·{\îe\á‚9\å5g¯FZ’ñ©iR¹\ÙlÑ©iF\Ç\É\ÏòtA6—s]_\çñ\îzx\0¡€Ÿ\ç1§¡–\áQ\ÊKJ˜}Š&]SJg³$\Ó)F\âS\Üöğ“³\ä-&T•\Æhkm\ä\ìExõË©¯(\Ô\0\îøL!E‘Àøñk\ZXhJKKxû›^\Ïs[·ñÛ»şF__~¿ŸP(D&“azzšPY\ÕÀ>ö†Sš\íiÁ©h]”\Z\í=:Ç™šfrr\Ò@%\Ù\\lV¹1!$±h˜°\ßd\İ\Òyd\ÆFùğ\Õ\ëp\Â\ßd&K>—\'\'-™,“\Ó	\Ç\'xdûn6\ì\ÚG.¯\éÎ¶ 	He\ØÔ¾M\íû(‰„	˜§X’JÁt2\Éxü\ÔO`@\×\rJB\Ú\æ4qõY«Y\ĞPKMYŒŠh\áù&\é~Ú«\n¢\àN5M#TYM\éü\Åø\ì\èSÍ”\ÔÁÁoÿ\ä\çüñ¯÷‘J¥Ø¿?¬ZµŠ|>\Ï\Ô\Ô\ås\ÛvMúI‹\"p\\xee&1Uo˜~«¬qnwı\âÕ‰ƒO\Ş;0<>\Æ\Æga\Ú~\\o\Ç\î=¼\é\İ\â\ï|ŸÿÄ¿RS]eŸV±ˆ–•“3D²ir\é4ùtŠ¨”^¥Tg¯:k5“‰$[eóÃ´wõp|x”±©\Ä·Sšœñ”\ËAs\ÆI:›#•)¸]£¾¼ŒúŠ2Zkª8o\Ù\Î_¶˜pÀ†pt\é¤å¡‚\ÈqûˆF¨hi\Å\ßĞŒ0\nOd;œõd\ç\Ş}L\'\Ô0 ¥$\Z‰˜˜˜$•JaŒFÏ½\î\ãÍƒG÷\Åò\é”f\"}Ï®w£7œ\åW^9qx\Ï{\'OB\äúö\íx*ŸIß•˜\ÊgN+-i‘H&l\ËQ®›~*—­À\Ê\å°\Ò)&‡™8|\02YÅ´M3\Û,\rY·z—¬\\\Ê\àø\Ç‡\écOg;t‘\Ìd\ZŸd*¥\"©d*\ÍøD\Ü\å\Ã\r\n„@\í¹(\ÉJiQ‰0·¶šp0À’¦:–¶6²¤©\æ\Ê\nJ¢at\á¸\Æ\Â\äf¨‚;\ÃŒNN1n\Ï\åB\É2d]#º1k\ÙEó\çñÃ¯}‰\İğ9xf‘pˆÕ«V’³ \Z0oş|:w|p\×ıw\\`\ås¥2\Ñ\êú»–_y\íOw¯ÿ\ãxÀ‰õ¯:²ÿ#\ruÕeeô\r®\Ùó\Ğ]ôB\Æl\àœ{\æ|\çKŸ§¼¬\ï°,\è†Ao\ï\ßşÁÿ°o\ï>‚HÀOI$J\ÂAw­-+E\×5M§²$B4`\íÂ¹\\}öjR\ÙRJr¹<Gú9\Ü7@\ï\Ğ0±°Ÿl>‡O7fØ†³rPWY\Î?ıaúv‘\Ïe1\r¦¡\Û\Çm•À0³\ë\è1¦SiNŒM·$c\ãL¥\Ò$\ÓF\'§B-df²9J\ÂAb¡ š¦“»\çA>øÁ÷q\Ñyg»\ç(\n\æ¶4Ñ¶x!O<³‰D2\Å\á#´´¶\"¥DZ–•¯i\ÖEõõµŒ[Ç¨—Wo8\Ã]‡®\Ìæ›¾ò®¼\ìR\Ûø¬ù\íŸü\Ì|öùm\ÌFkV,£\Ì~\Ù\àñY‚±‰	¾ı“[X\Ø\Ò\È\å\Ë\Ñq´‹l^QA¿\Ét*\é3\Ğu¡\É8AÓ‡´$û{“·ò,j¬§©ª\Ó0p„XQ\á¬\Ås1AjZ[ğ\é:E:.\Â„\Ğğƒ\à÷5\r¯cr\ë”ÀT*MG\ß	’\é4\Ó\éŸX8HŞ²¨-‹1¯®šñ\é\Õ%1\é4£ñi,)ik©gÉ¢…üé¿326Æµ¯\r\áŠÁ™«	ûb>Ÿg\ï¾} ñxœÃ‡;8ûŒUüûG>\ÄeÇƒm\Ğ\Şó±o:z\à:¼\à¼\é\Æ\Ûcı\â{½z«W,\'\nò\Ú+^ES}ÿöù/óÜ–\í\'\r\Öå¥…\åY<\nhhœ{öY\\qñ…¼\íCeËv0ıºZ\rúM4!\Ğ5€\éCAE4BE,B<q”\æ\êJ–67`\Ë\Úñ]”\ÕTcü \Ô\áD‡\\İj\éFJ\É}O>\Ç\î\İ{yÿ«/.¶0¡„\'‘tr\ß\æ\äòy\Ò\Ù<\Ù\\KJR™,–e®gôgg~ó5œs\ÕkH¥Óª~{\×fu†T\ïj\ßE>—\ç\ÌU\ËùÑ_fÕ²¥H$«W,cù\Ò\Å<¿c\×\Â7\İx{\ì\îÏ¿k\Ò\08üô«4\İh[±l	u5U\Ê5HX¹l	?úú—¸ö\åHWwQCõ55`;%»\Ã\ÑX„·¾\éu\ÜşÇ»Ùµ\ïµ\rC!ºúI¦sº¦-¬\\\ZC“DC~\Æ\ÇÇ‹vBca}-…gO!\\ZJ¸´\Ô®³H*p€H{\Ò::1\Éİ?\ÅkV,q\î“€L6\Çı\Ï\ï¤{dœ9s\æ059\Åğø†\áG@@Ui˜\ÅsˆFcl\Ùw„•[š&Û·o\ã\ÎGä‹Ÿúh\á\í6\Z\ÒeJ03\äÏ¤\Õ[­®º\ìRV,]Œ¶®©f\å²\Ålm\ß\Ûvø©õ«€§8ló\éZhşœ]\ç?ûg­ZÉ¹gÁª\å\ËX»j\ÅI\à ¼n‚\"\rÀñş~\îúûı\\÷\Îwr\İu×‘±$oùÜ(\Õ#ø\È|–×¿„\×^¸œ¾A\îß¸•5[xä¿óØ\í|ì¯&\ê3\0‰\á7‰UU\à\á¶B¸Æ‹°¤fzjše-§>\Z–µ`wwÿøÇ¹úuo\à\Çw=Ä“ÛğG\Ğ}òy‹\ë®Z\Ë\Ç\Şz9±XŒÿú\Ù\İ4×•ò¡7\\\Æ\ã?Î¯oı%]=´-Y¨ø¸\ë|lzúúNj7(#÷¬‚ƒG¸\á_?À¼9­øt-tø™õmÀS\Æ\ÛôWó®ÿ¸®!\Z‹\ç\Ï\ãŞ‡\ã[?¸™†šjş\ç¦o²võ*jœ³ò\Ù\ãZ\áu„SØ¥<>6Å¿}\ê3¬[·@À\Ï\î\\m$ˆb\É<£“C¤rY\ê\æ\Î\ã\ÒK_\ÅX<ÁÃ‡&Xy\Îy\\ÿ·q\ã×¿Î®\ŞA.XĞ‚&4Jª«	º\Ç\\}\Üs\Ô\Z\Ü\Èø$±@€€\é+˜÷ô\æu¾|\ã7¹\æšk\è\Z§s,O¤¼	MÓ™œ`,>Ì\ã\ÅSŒN\ç81š¦½c\×ı\Ó¬[·¶¶6¦F‡m;şL6\í\Æ\'&˜I\ÑH˜ú\Új¶\ì\ØÍ§>ÿ%&\âSœµf%‹\ç\Ï%“\ÉL\Ã\Ûü7\Ó8qhw\Ä-\r³¡®–ü\ìW¼õ¢³‰…B|ûÇ·ğó\ï‹–¦†“\Zh¬¯S\Â“·×šUgŸO$Z‚³§bt3\\‚ğ°Lt „\à\ÎÇGš1¦\'¦Ø´§›K\×.\áŸ\Î[\ÉW¾úUvmxF{	–D‰–—yZ·õ\Ò#t›÷ÿ\éd‚ \áC\×\rÛ¬gæ…¶s/`îš³‘@.?BF \Å\Â\è†A:9I\Ş\Êó\ĞæŒ\åüDBe\í\è¥\"&™N¦)	‡¨««ƒº:¬\Ñ>È¦\ì¶Aj\ïd—\ZF…B\ÜôÓŸó\Şu²½£“{z”÷¾\íZ€™”\ÆÒƒ»\"Foû\ær¤¬øı&‡:ò\Ù\×]FkMŸÿÍŸù\Ë}\ëiiT\à´65ğ\Ú+.\ã™-\Û)³¤R\Ìög¶\0„\ÏO8-j\ÊbÈªFŒšD6CxzŒ\Ôø	d”;\å\Ó²fŠ’B@iI	g!ñÍ«*wŸ8+Lş]x\ÒiÁ\á\î>>\ÍÍ¢7o]C£\ëœf¶\0\0 \0IDAT~B?\åe$\Íô@„h H:—!Ÿ\Ë\ĞeUô\Õ\"ı„s”zªİ§Àq\\­\ëÖ¤û\İô© \'•NS‹±s÷^\Ìt’7¿\É#SSUA(`,¯\ïİµ©\Ü8¾o[,“˜®lX:\Ó4™\×\ÜÄ‚\Æ:M\ã—Ë·õ;>ÿ\É \Îğ¥\Ï|‚R\ç\íJw6\Ò\r<û1v\Ú\Õ¬\á{\ëoC\Ö\ÍÅˆ”Ñ°ö*ò\éiŒP¡\é\ä4AsCms\í1B@ \Äl¬s\ë*r_²8Áq«öù*R\é4\Õ\å\înNy/eF‡	\Ö(Å«¯,\ãüy•Ü±w_´ŒX\ÓbMK\Ü6d>\ÇøX?oyıY„~».µ½!e^µ\îQu-X²p>Íõ¬^\Ş\Æö]»¹ıOw£:¿¿\ë>ÿ†W\ã÷ù8cÁöM!„ ¾¶†\Î\ã\Õ\Ç÷oiS\Ã\\&Y¶x-|ı?>N}k3~¿Ÿ\áñ8{¢£ó\Ñh„şÁ!F\Ç\ÆÕ¡8Ô”,„À\ÖP[AóYÅ¬Gó\Zjx\Ë\ÚV\Æo!ŸI &¾H)š\Ğ\ÈL“\ì\ÜÎ›ÏOSM…\İC\é\Ól9¥¨^y»½t@:=%†ú\İk\ÓgğöWŸ\ËBÿ8ã»±rY{+—a¼c\ç\Õ	^Ñ™v‰02›R\0z¬\Ò\ï³ÿ07ó«¼\ï\íoa2®V6‡‡Ù¹\ï\0½C#è¦•+\Úø\ÒG\ŞGYi)m‹’K§B\Ó\Ã£z~[ı`\ÇsNs#º.hª*G4\ÌPˆ§~qó\ëkø\İï¢©¾}³ÿğæ¶¶\0`Tt\äØŠDB>‡LMA Ø»”¾şÁk¸ğ¹]ü\ì\çÍ«§¬5iQ«¥øÒ§\ŞÀYK\ç¢kj–”Xc§^E°8¼Ç„°,K\å™e¬qhº\ç(™øfT­r,lª\ã\Îÿz·ııI\Öo\Û\ÆtN\Õ\Ñò|ñÚ³yİ…gô{]%L«ƒ“6¼Wõ55	\ÃcclÚ¶€‰\Ñq–45°©£“÷½ó-˜Á\0eş \è\Z­Í\0fõüeõ†aú¥K\ÌG °²Ê¥ôŒq\Å\Ëy|\ç>4¿:¤°ug;W¯»\Ô\æ`ö-0	$G˜”~j\ê\Ü<\Ó\Ç.>“W/\æh\ï	²ù<~\ÓÇ‚¦Zbáª\Ëq‘ñ1\äô¤\ÛQ;:™l0\Ü/v¾\\&Kaq§(“›$3w=O\Õ\àA4\ä\ão½’÷\\}\Ó)@R‹\nø]\r’D\"I\ï\Ñ\ÃÌ©Œ\Íd”<l\Õq&\çBp¤óƒ\êU7U%Q.Y¹”‰8şPP• -‹%\æ”\Zf`¾ `NK2ŸG8ÎÑ‰I*c\æ\ÖU\Ó1:‚ö}\ÜGº½\İ-€¤\\.ó\Üÿ—?2Á\Âq|„#¦P(DSS¦\écrt„\É\ÑW\Ñ}\ä0bŠ¦’¨+\Ób`<\Â.\Æ>k !ŸÍ¡–$g³\ZU^J‹c;\çoOo¦¹m%º®\ÙwU+Ÿ\çøñãŒŸTCow7\×\\qó*\×zªUL\nQ¨C­WÀƒOlP\ß5Á¼º\ZªK¢ôN\Äqj±À²˜\Ó\ÒlW&*Œô\Ôd+€\éó¡r\áš\è\Ü\ÆzL€X8H¥Ğ©ª\çğ‘Nœ ±¾®\Èbq\Ù\İ\Æôùx\í\å—ğ¹/G\ïş“GF\'Ûš—4M\ãš\Ë/a\í«/±gûª>i›°ù+š\ì\ÙSrG±’\\&‹\ßp\Ö\ß\n\0Iû?\'\à­‡\à\Ğ~ñ\Ğöãª§\æM\á¯VEV-]Ä…kW»²fğ#D2™O=·¿é£¡¾²h˜p$Œ\ßo¢\ÎF¤\r’\ß~!lzj²Õ°r9³®¦\n\Óg:»ô\ÍO~‘J³·«›\Ö\ÆF2\é,\İ\Çû8\Òy¬0Ï±I}*V••ğ\íOşV:U¸\é.”Lj#K\r‡0\\-V\á”r£!O\0¢T\0A\"\Èg²HC+¤\ÊB=3}\ä\åg®\àš7^‰š[\Ç\É\ä¬w+J \ÂQ¼KX.Ÿv)\r\Éğ\È(ƒ\Ã#TWU2·¥M\×yõ…gs\ÑE\ç¹%„\Ğ@\×1MƒÚš*\Òù¬i\0L%XVt\rL\ä\ÔS‹[š\ì:F.—§¥¶šT:Mû¾<r”‹\Ï?\Çf\Æ+·)õ\è\Ä(\å¡\0ı¸SygLñt\Ä˜m©#­€ı¤“É»,âˆª0Ş»¨!ó\ê\Ù\Ïş‘qò9Ã§»\Â+½\Ê Àôû¨(‰¹‡ÿTı³À$\n|€\Ä\Ò\Ã\ç9\Ê+\ÔÿÂ©G²\ï\àaF\Ç\Æi¨«¥ª²Œ\Ü\Øe\0š\Zœ\Î#M!¹¼\Åt\"‹ \é¦*ŸfpxD5h†\ìJ¹t†L\"\Éğ\ä-\r´67’\Îd8|´‹Œ³f\çVM¨r SûQCJ\å¥\Ä\æ]•rN`‹Z£°T¤\Ûy\çO\İ÷\nÁI\Íg3Ô”–\Î\æ\È{\ÎÀHºmJ	şPXin¡ò_\Â\áY¸Š…´Ç¶|R	¥6#\Î,€\ÂÇ\'>5Emu%Ë—,fhb’d<N>›\Åuµx:4<B<>núš?$„¾gı#\Â@\êjw3—\ÍbY’\éTšò²RÖ®Z\éó±ÿp\ã¸V#]@Z\È\é8$§\ìw8\\z¸v¾:ÑŒ]\Îa\Ôj¨\n‚W@)0¼A‚km¨0:\Z\nR?\\\îl\å]\'‹\Ù\ê\é‹,®_+¬:X\É\é¸òN\"¸„ %yK\Ò\Ûw‚d*EUE9s›š˜N¥\É\çr\äú\r?\Â0Hş¶ş„\Ãf0´^7Ã±}÷?ú„ubhX5\à ¥À0M„&ğû’\é4kW¯\Âoš\é\ì&/¼|Â|I‰L§S`YJë¸o\Âp³IWü\Âûİ™bK\çI(†K¸Å“\\»%%lC\ÓH¦³È¼Ws¼\nªˆE	D\"-\í\ÛÁ†\Z\Ê\Ü\Î\Ù\åe1\èVS¬Jº\ÕK`br’ı‡;\Ğuƒ¶%‹HeÒ„~ŸO\Íé„€P„\à\Äğ÷=ú¸\å\Äö	¡=¯\Í9\ë’.\Í0:\ÒÕ¹gıCHø]\àó¦¦\Êr:»z¨«©¦¼¼”c½Ç™œšò\È\Ûñ´¨w\Ä\ä-µ :\ãüy¢,\ï ^\ØP“\× º\ìO‰À\ëCÀ@…À¡€I2&“Ï¹ˆ,A¦\ë:%U•·a9üŠ™¶f—-XºR(û_*	¹\é–\Å>‰$ı\'\Ñuú\ÚZ:õ0·¶\Z_  \Ş\Çm˜`@\îy\àatug„f<4\ç¬Kº´g~ı½\Ôy\ïü\Ä\ï2yùÔ¯~AøıXš\ÏG¸¤„+×®ä‡\å¹-[XÓ¶T…†›¶X÷(§0|np\ï*v‘p\ÔÊ“6c°¶#h_YœhW,\àBy²´\Z©«}\0\İ0˜[WM&—\çøÈ˜Qzœ¥\0\ÃoP\İ\ÚL0Ák	*bt«ryö¥\ã\Î\\Ş„„\\Z½~E¢,\ËQ`rzš\î\Ş\ã˜>™l–\'6<\Í\ë\Ï[K¤¬\Í\Ğ!Cı\Õ\ïÿD&\ÏS\ç¿óS·o¼\í»)\r\à±ÿgwY\Ó\Üõ;\Ú÷\ß}\ßC¡¡‡Kş ±ªJ\Î^¹”‹¶r\ÓÍ¿ µE\îß¾k·bB:İ²?ut\İeP)“2\é1y/ NwT\Ì •~Ú‰\Â+TO{\r!ğû‰;ş	D\ÃT—•±r^\İø¼§Mõ¡\ée5µ\ni7¬$‹3\na\Ë\Ş.\ê¼\çÍ¹W¼&\Â\ÛEalBN¥Ã’’\ß\Şy—,šÃª¶\ÅD\ÊJÁ°Á_\î{\í\í{\ÇË›\æ®ô\'_\è£\rDJÿ\ì\Çv\Şt\Ë/­\Î.¤a J*ğE¢\Ô45ó\ÖK\ÏCLMp\à\Ğ„<·m\'\Ù\\\Ç(M¡Ha¨Wª\ØiŠD H,\'‹-\å\ë_\È\îZı!…\0Ÿ©\Ş\æ49†tß´+Ğ„F¬²‚+\Ö,g_÷qöô\Ùl(\0Êª«‰–—«\ÃEAƒ*\ïeÙ¹#\nğ»Ÿ.i>„=O,Ô¢ò\ê\è$™L‘L$)Á\â-\ë.¤¢¾-R\n±r„®s¤\ëß¿\åV\Ë\Çv\"¥v«u..¼ş†¾He\ÍÍ“\ÓÉ¯\İôµ‚\ê3¡¤£¤ŒŒ\ÏÏ¥«\Úxöù­˜>##c:\Ò\ér\âj˜®}\n´\Ğ8E„;\æœL\ËA(K\Z\ã‰\çw³\Ôx&¤„D\ÆGV\Ş\Îk—\Z¡’(s\Z\êX\Ö\Ò\È\Ó{“{gh<N \Zv{®Hi†R3¯F(3>\İ,\å}>¤}°Pzn`Ë®]€Zõ~Í¹g’\Ô}\ÈX)2Z\nºÁD|Šÿ¾\éGLN\';\"•57Ÿ÷\Ü}mœ;>öF«¤¡õQ)\å³=ş7mU0LRşŸ¹\åv~ù\àŸ\æ\Æ2\Ù4\í{ >\Û8œ™ö«½l\Ë(2v)]·\à=-…‚H\Ëâ±§6ó—ÇÂ²£/™—*JÊ«\'µ\åÕª¶•S ^q\Æröw÷2Ÿ\æ\Ñ\í\í<»÷ 	\ï/\Ì\ÄÂyyvƒ‡/	>\Óu\İÅ·$\Ûv\í oI~|Ïƒ|şg¿%\ë€}~n\ã\æ­<ô\Ä\ÓH\ÉÆ’†\ÖGÿğñ7º³¢£!G6>4~\Ş;?ş­‘É©ö¯~\ï‡!€p4\Æw\İÁ·ÿ’mş«\Ö]J&›c[{;Ò’ú) „(2q\ç‘w-L‚\É\Ø\ĞQLJN_¥dó[÷¦\Âô\Ñ\Û\Õ\Í\ÏmaûŒôõ“N&¼‘XXù,™d’¡\Ş²\é\é\\Ñ©i\Æ	š«+9\Ô7@*•.Xƒ\×xDœÇ“Gñ$ğ¾&RU¢!aW©œ:06gÏC47\Öó÷;n\å\Ûn\á/·ÿ‚@(‡ø\êw\È\è\ÄÔs\ßño\ß9²ñ¡¢Ö“²w·o>,)û\ÃÖ»\çşò÷Š|\á“A ‡‚,?!`şœfLŸÁ‘®n&§\â”Ä¢J\Ø\Ò\î”n€&À*©Oik{‘…\Ø\0üV&Ç’ú*şø\ä&\Z\ËK\é\âPo?7^-\Éx3th\åód3i2\é4\'F\ÇùÕƒXX_G\Ï\àl\ßÍ¥«—+·Ÿ ‚\0Õ \â\Ä[\à\Ö\rûmŞœI«ğ™Ê»+/\"lİ¹›t:\Ã\Êe‹Yºp>õµ\ê…\ée ·şş.¶\î\Ü=©¨ùm\Ï\ÎM…G\0m:\éu·oúú¯d|¨¿716R{`ß¾%ó[›õ–\Æ|†\ÚÀt2\Éú\Ç6\ÉfYw\áùTWU\Ø\Æã°¨!\ÓI\Èïˆº\ÂW©Eß¥“fcS\0JYf‰¡³ ¾šŸ?ğRBkm%\'\Æ\'©Œ†\Ù,™DŠt2I6&Ÿ\Íqbtœ\ïş\å~ötõô›l9\ÒÅµ\ë.\æo¸ŠÒ²2lCW+.NZÁ\Ê¢\è¾\Û@†¢¿ó0°\r¬mTw\Şów6<óW_~W_qš®#P/•}ğ±\r|í¦›39#pWó\êóo¾ğıŸ\Ûy\ïoğ\ÒI–s\Û{\×tU´,ü\Åñ\ã]\ç|\ä³_^ø/\ï~;|\×Û¨(/cl|’‡\É\ä\è<\ÖÃ±\ã}´-Y„\ã[„\İi\Ë°_\ãU GCU<“QûÏ±\"\×\Ò\Ô†é£¶¥™H$\Â7\ßeÃ®ı\ì\é\êaó¶\î\äuç¬¡,\ZV\ï…C09\àWm \Íñ×¿š•‹²z\éB\Z\ëj\Ğt\å\ëÕ g¹Jjª\È\Ê] =(\Å\ÑÀP]÷\äÕ€\édŠ]{öaY¿\ß$›\É\â7ıL\Ä\ãüôW¿\åg¿¹ƒ¾¡‘®òÆ¹¿\Øÿ\Ø_»ö?öWf’\àtı¯\Óşü\Ùw]•úJÀ4±rydñ‚¹t\ïc\Ëövkt|Ü’R\Z\ßû\êù\Øûßû[:Ê„\é\ÖØ‰BÒ•µİ™\â54%GPN!)\É\çò¤\Ó$§¦™§\ï\Ä yz3\Ûc*™T3n\é\\+\Ï=ƒ½\åõ46\Ô`ø|…¶œF…\Ç\"fá¡ˆ7\'Ù¹o ´tˆ\âb{\â]ù»ö\î·jª*Y³²Mkª¯\ãğ\Ñ.ß¾k*™\ÉŠT\Ô|\éšoüú\Û\Ş{Ù¬P‡\\x\åÒ]›Ş–Ï¤ßšM%\Ê5]Ÿ2C\Ñ}Àp|h\à¯¿òò\Ğ~ö#L\ÓDH©v;„€L\Z96hï¬‚3\Ñs;3„!Š…!$ù\Ü\âùO.›!1\'—v\Ş-­aƒ\è¦\Ïşyg©Â£\Ú”\ÅØ¡¼9<8Yf€£Fû¦ 5d8ŠŒ–ı„€Š$ğQ\Şõ‘O‘\Ê[\ëf +;=ùO–eE|Ğ¨nú\ïl\\y\Î:^¿\Ó\ĞiŸl8üôú}Wñ\æÿ~şO·\Ü?xhw¥\îógšWœ\Ó>zühnzlø\Í[¶\ïZ˜\Ë\å0M\Ó]œ€\Ôt„n\Ú+Ó–\ÛWW¼Ö\ç?»s\ØQ‘¦K\ï¼É¾0L“Xy…#¼€”j—Qİ“*ŠV\Å3\Ò\ÎbW\ä\Ë<“#M€\ÏD\Ó<z¨\ìù¼\Åö\İ{˜J$¨[²\ê‰pEí¯m}\ê/V*a–7\Ï^û\Ïÿ²ı¾¯}\äEğişù¯\rwºmüx\ç›6\Ş÷g\ãœ3WS0»ƒã£šFb©\×\é†=±E\Ö\âh¤7_¡.\×j\Ü6<—6°N1¤\"p\ÈmO¥J)ˆ£ë‚²¨\Ú\İ• p\Ìr\ÖøtTÔ‚\'Pr(Jq\Ù5×±i\Û\Î\îW½ıµ\íü¾—@Eóœ„ZV_‘Vş!`òõ»\Ş\Û>„`ø`¦\ÆÛ‚+õ\ØûıOoftr² ­\Ô\ëG\ìM8W¶¤¦Bw;òÚ„C._¼«\Ø.€&¦¦ù\ãC¸\á»?e\Ã\Ö]*,<ŒÛ¾@­\Ìx`Ê¡Á‘1¶\íÚƒ/\Z?üÌƒ]¼DzA·v*z\ì\'ÿ™‹T\Öv\é>3µeG;©tŠ€ß¯Ü‚…\á3;:rÉ»¦V\èV6Ÿ\å\îGŸ\â¿½‹K\Ï^\ÃEkV\Ğ6o†®¡\ë\Z¦\Ïçq¤]ˆr½\ÖVìª¼\Ö&%\äs™ll6\Ë\Ğø8=»•Ÿ\ÙLy,\Æk/9‹\Ï\\…\ãRU^\å’\ëñm\Ú\ä|{ğ±\rds9«¼¾ukãŠ³2\í÷ı—B/€\åW½­c\Ç=·\í\é\ê\î©\ßÑ¾‡óÖYPL\0Ÿ©~A#¥\Ş\Ç\\ğVÉ§VSQ\Æ-ÿùIv8\Â7ñ\Û\îD ~]7g,YDsm5Ue%\èºNY4j\ï\ÃHœ‰¤t+tH=ó?1•`:‘bx|‚®¾~\Úe:™¢µ¡–\å\æğ\İ>\ÌÂ–\Æ\"eÁE±\'\nc„ô\ÔC¾\ŞÖ¤$›\Ëñ\àO\"4m4ÿ\ëš7¾?õÿœºE+¶\å­\íƒC\ë¶\îl\×\Î9s\r\Z\'ô•š±r¤‡ô4BbGs\0öR\à\Éò\ék—-b\í²ÅŒMN\Ğ78B<‘\äX\ß	ö\é\äÁg¶ „zöÆ§\ëô\r¸¼8b•\Î[j†®S‰¨÷\î”DXÛ¶ˆ÷,}5‹\ç´\ÒRWƒnÿZ‰pK\æ^n½®¶\á÷ùí©ƒG‚KÀ\Ñc=\ì8Š/®š³¸\ï\×\ï{/•^8w\á=™\åW½\ío{ú\ÓÕ·şşOmgŸ±š³×¬*\Ò?¡\ëÈ’rH™X“cö¸*g\è(p\Ä$)/‰Q^\ç¬\\\Æ5¹ùœ$…•\Ï#¥T/š°%©f\ì\ĞYµ²>®º†\Ï\ç¼\'\ÛY¶~,T4&\İ{\Âva«P·¦!°x\Ãq\Ù`Y’‡ŸxŠ\Î\îK3ƒ¶½ú-Ç¶o\ä¥Ò‹úµ\Ã\Ó\Ñ\à\á=½XYEÿš{öV-[J}m\r®	û\Â0Õ¾G>2Õ¸H\np^$\àµ*BHt¡a:>\ÃÀoúğ›>‚~\Óşóğû	L‚?A³ğğ«w½ù|†},\ØÓœŒÀT\Ú|	†m®»\Ó4d¤\â†\Õv÷„ŒŒñı[n\å@\Ç\Ñ\åóş°ó\ŞÛŸ\ãe\Ğ\Ë`\ÑEWµ\'&†eoO\ï\ÊgŸ\ß\Z¬®ªd^K‹{F\Ú9¡ùL0ı\È\\-Ÿ/\0#p…\å\Õzw$±\ïKp]bÑŸp¬Î©ƒ\â{\É\âısW\è\ŞIªp\Ê8\å4•f\ïmƒğ¾\ÂNEq£c\ã\ÜøÃ›ùó½ë­¼%w\Ï=\ë’/v\ì\í5T/š^p†\îO]÷“{Ÿ\é\ÚötM÷Ñs\î}ğQ2™­M”––\à†U\ĞtD ¨&§9û\\¶H!<‚w\'AÛ½~O\ï\ØM\ÏÀ \ÉT\Z\ä¬<~³ğBG\Ğ\éL†‘Qöttr¬w€ &G\Â.0.9®pC4/À„0f\0gZ‘	\Ù\Äg¾r#w\Şıw¤¦\ïšwÎºO\ïüƒ¼LzYc—\îÿ\Æ\ÇÏœ\Z\\\ê\×\Óoº\å—<½y_û\ì\r\\x\ŞY€t­Ij:\"V¦&pS¸“A[\ÊB¤­ôMŒò\ì\æ\íŒNO‘—‚T&«^ÿ…\n­ı>µ¥¥X\Ò\Â\à\×5Z««¨™TÖªŸöRö\èD_²\0„C\Î\ÄSÓ¡Z8¦\Îò\î¦\"\Ë\åù\íŸÿ\Ê\×oº™®^\ÅcIù@´º\î¤\åÿ—B3õ\è%Ñ‚ó¯¬\ï;°ı;\Ó#\'\ŞPQYZ»ö,\Úw\íbpğ\áP¾\ãm|øúw\Ğ\Ò\Ô`\ßöÿR\"SÓˆø8\ä³9¹i\àl‰\ä2FúOŸ˜ —\Î\ØA®D\rg\ÙG7tü~?‘\ÒJ««\ÑMgÔI(>*\ä´\è:\"Z\á\ÄtŸ\ÚC½ğa\Û\Îv¾ú\İóÄ³›\È\ç-\Ê\Ê\Ë#›\Ë7¯>ÿ†\î\í\Ï\Ü\ÎË¤WÄ­e’Ó‹cCÿa\Z¾ŠK_õ*–,]FCC#‰D‚ÁÁAÙ²]û\Ğ\Ü\Ô@S]BSs~)š\áŸ™Íª³\0^­¶AD–z4]\'RZB$%\r…	E#„c\"Ñ¨ı!VVJYu%¥µ5D\Ë\Êº\æ\Êß®\ÕUMWaœ{>?\"Vô«ód.	Á\Ädœ\ß\ß}/Ÿù\Ê7x~\Ç.„,k[Î«.»œT*\Å\à‰¡L\"¡\ç\Ò\É;y™ôŠ€S=\Ù“=oƒÚ¥—­C7FGG	””•124D\Ç\ÑN{j##\ã\ã,Y°€p8\\˜\á\ë†Z~—\êù !5\ÛÅ©\ê\Í\Î?\å¾Ÿ0L \Z&E	yş‚±ş`\ÍPš÷¨¼–óÅ¾t¢\ÊP­¤i˜8\ã—\02\Ù,\Çø\Ä¾\Â-¿¹ƒşÁa\Ê\Ê+h[±’Ö–9TWWÙ·o¹T2û\æoü\îû»»xC\ë¤—¼¶\æ%M\Ó\ëC\ÓÁ@€T*\ÉD|t’\ÒRb%¥ƒ!†G\ÇùÖn\á\r\ïş >ö\Éd\nWø†­¤\n*Q\nQ“,4\æ\"ª2	Mı\ê†\Ğ4„¦£\éš\Ú×±\çp\ÏP»\Õ\Øe=\ßt)GDË‘šz	¬3ô÷\rñ\Í\İÂ«\ßò.şúÀ\ÃÄ§¦ñù|,X¸Š\ÊJµ”””‹• ó‡œ\ËË¤Wœ™”µ\ßk©–+54M\ím[¾’’\ÒRv´\ï\áŸú<Ÿı\ïo19\é<Z(”P\"%-Q«69¿W\ãHTJ¥\ÑH?UIÀœ[€=…÷Ö r\n•\"uŸ:C¨I¦H¡‘\Ë[l\Ù\Ù\Î?õ9¾ñÃ›\é\íï§²ºŠX,†\é3‰D\"¨	«{JP€\Óı€Ä‹¥Wœ|.\×Š=”FÛ¼útÚšZç–œuÎ¹\Ì[°ˆ‰ø?ıõ\ï8\ãò\×sË¯\ï`tlÌ¶\r.A”Õ€\î·[8¿·†£\ÏöwÕŒ’mqn§\ì`Be‘vMÒ¶Û‚a(¯V\Ï\Ù\Ø`e2ö<\Ä>ù9.}\Ã\Ûxè‰§‡£¬X¹šh$F2•bş‚ö†hš¦iX\ÒÂ²Pš®Íº»ù\Ğ+J\ç³\éA`R@L€zJ\Î!!¨¬ª¢¬¼‚\Ã	„‚\Ì[°€òòrzº»\é<\ÖÍ§¿ôuÛº½\ëíœµf5>CW“Õ’\n\Ä\Ô8¤Õƒ³n¬\í\ÌG„t‡µ?\ä¬0€#~\é‘\Ğ\Ü&CDb®•J	C##üüö\ßó\Ç{\îcÿ¡#A\æÌ›OUeCƒ\'8\Ş\ÛCëœ¹\Ô\Ö\Õ\Ù<Ã‡®\ëd2‰£\Õ\r/û‡¶_pFù¼›Š\Ç	‡\Ãhš\æ¾d\ÕôX´h1›7=Ë¡X±r%å••\ÄJJ¨¬¬¤³ó(wşõ>6<³™\ë\ßúf>ò¾wQ^Z‚nšPZS“ö¦nÔ¦\Ö\Òl³¶K³Cjg2«ör\ì<\Şİ‡ˆ–@ l/FG\Çxü\é\çø\Î\Í?c\ïÁC\äó\r45·J¦8xğ\0\É\Ä4Ë–/§ª¦\Ö~$…q0ˆ”’\á¡!õªdM,«k\é\æe\Ò+­Y¹l5ğ\Ã0\"K—-#\n‘\Ë\åH¦’®«ñûı‚Aúú%\n…))-¥º¶dCClxfİŒ@0§©‘P8¬öNüaD0\n\á„\"ˆ@ü!u˜=B\Â*\â3Ì ú4|`ú¦\ßş@¤-BÁ\ÔT‚‡ŸxŠ/\ç‡|\ç\'?c`h²²\n.^Liy9½\İ=tu¥¤¤„¥m\Ë)¯¬²\Ï(\Ë4}>\êj\ë\Ñu-[6344DIm\Ó\Æ-wı\ì®\ÓK\í…\é±œ	°OÛ—•–25=M\Úy¥&¨­«\Çôù\Øİ¾‹½í»˜7!µ\rõA.^†¦9|˜­;\Û9t\ä(<úŸúğû9\ç\Ì5˜>g;ø\äõlÕ²º\ëœ0f\ä+\Ğp‡®®¾ò½²ş±\r\n…˜;wUUÓ¹w/y+Ï‚E‹¨«¯\Ç\ïó»u:\ãVyY9†¡#%ô(O*­˜\èÙ†ó\Ò-\ç5Ÿû±*­¬›\è;¶(T^µ.=5y±®kÁššZe\ÚBYK2™T+„&‡#TU\×011N\ç\Ñ#$IÌ€Ÿ`0\Èô\Ôñ\É	şı£\"Nóø\Æ\ç¸\ã/÷°{\ßjª«	\Ôê³®i\Îp^´\0	­}\Ùp!óñ©i¦I&\âq\éä§·\ŞÎ‡>ı¶µ\ïQüs\ç\Ï\Ç4ıúB‹\0\0`IDATÜ¿Ÿş\ãÇ©©«c\Õ\ê3¨ø?­yldIyÀõúv\în_\İ>\Ûöx<³³»3\ì²\ìì²„\r(($”CJ\"%\n\"R\Ê(\É_(H‘)‰HB”(\"	–$ˆ\İ\0K–Cœ;—Çñ\Ùcw»mw»\İ\îóõ«üQ\ïl·\Ç&\Êg=¿£ª¾ú\ê;\êøªºjh\Ä\Ù}J\0]ƒvGmj\×\Õu*\å2\åJ™;·o¡\ë:µ½\ÂD }wfá±Œ\Ö{\á\×jÛ·ğğ\Ãú€\àÿ\0\Ïı\Ö\ïÿ\äËŸû…nGÿ\Ù\æQù9C\ï$€$@8&’H$ˆ\ÇDL¦G\\£m	­V“\Âö6\ë\ëH)Ÿ˜ \Û\í²[\Øáµ—¾@(\ä¯şü|öå¯³Tc<3\Æ\Õ+—˜\Ìf`\";†û\ä_«/fe\Ğ\é\èJ%Z\Í6†\Ñe¿\\¡\İ\Ñi5[¬\çó¬¬®“ˆGy÷/½‹Jõˆ¿ôe\Â\á0­V‹x\"Á\ä\ä™	s÷\Ó\\\Ú\í6¥R‰JyŸF½A«\Õ\â\è¨jö\ĞúB\Õ\ç¡\ĞK>õ\ï÷¿ı\Ê7N‹\Ø~*\á,¼\å…X½¼÷®\â\Ê\Í\ß\ì¶[OHi$ƒÁ ?\Z299E6;N>Ÿ§Z=\ä¨vD»\ÕB\×u5­œJ15“#H1;Q\×j<\ÈoR\Ø)\Ği·\Ñ4Á\ß|ü£¼ğ¶·\"«¾ûµ¯ğ™¯½\Ê7o-Sk6\Ñu\İ0ğùü\Ø\ë¯İ¦b=JI»\Ó!hn­\ì\Ó4~?A¿ŸH$\Ì\ã—/ñ÷ÿ6©tŠı\Å\'yñ\ß^\"‘››err\Z¿é‡“Hšù\ÍMv¶·iµZhš \n…˜™Î©3\nD\Â†‡‡©\×\ë\ä\ä\Ù\ÜÜ R.º®\ë¾`\èõø\È\Ä\ßE\É\Ïüü|¼ş©÷¼³\à\Ü\ÂId\'\Æ5\áÿ\á\Î\æoH)\'c±¹\Ù9fff˜››7ûüË¡\ÑhP,\Ù\Ú\Údcc\İb)%©Tš™\\Ñ±Œ\ã\ïªG‹;\ì\í\î\Òl4xú\Ék¼\íú“\\\"\r³_9\ä\ÖzJí˜ƒ£c\êÖ¦§\\­g‰U´‰¡”ú\Åt8\Äp2Á\ä\Ô$¹¹)š†àµ»\ë|òŸ>\Ç\İ{«Œe™œš&1˜°§ e\×\à\à`Ÿ\å»KT\Êe’\É$sóóŒeŸœ`0‘T\ç*ô!µ\ãcnŞ¼Á\×Bù\àÀ\Ğ|şõp\"ùy(ò\ája\ëÿg\İ\Ú\Èü#\áFµü\'\Ç{\Å_\Ô419;;§=ùÆ§\Èd²ƒj¿\Î\Ó@J\É\î\î.««÷Y¾{—\İ\İ]‚¡ \ã\ã\Ì\äfˆª#K\êg\á­f“\Ã\ÃCJ\Å\"•ƒ}\Òñ£ƒ1š\àM—/ğÜ£‹|~|Bx„ ¬\Ò-³\Ê3\Ôôv±\Ş\âöv‘oüø&7ï­“\ß\İ#‰2“Ë‘J\á7× Y×­\Í\rV\ïß§\İjq\é\Òe¿z•L&«–\ØU´Sv\'GóIuD\Ën‰o}óX]]E\í^zú\ÂG\Ò\ÓóŸYyõ\å‡T\Ï\Îôµ\çF+;k¬üj8\Î<÷–Ÿ\á\ê\Õk®%¨}\êL\Z\r\Ã`+Ÿ\ç\è¨Ji·\Ä\Êò‡\Õ*\áPˆ…‹‹Œe³ªª³+@“]\×)\í\íqP\Ş\ç°\\¡Ñ¨34\æ\çxœw>}\Ë\Ó]\ÛD:¢‚ƒ\ã:\ë…]~too\ßYaik›\Ò\á\áp˜H$J*d||’X\"®ª/s¾Âªj77\Ö\Ù\\_\'Oğô3×™šš¡\Ón“\Édœ\â	•\Î\ZWDJ\å%ñtT„@\ï´ù\êWşƒ;wn#üf¯ıñ\â[\ßõÅ¯ÿ\åO=ä¡½µ·ÿ\îG\Ãn~\ï\×+\Ûï‰„#“\Ï<ûf®½\á	üš;™¥%®/\ÂõMi\Ğññ1\ÑXŒd:…\æóQ=<¤´»K³\Ù`p0IÀjG„\êk>h<\Æ\È\È(#£c¤\ÒišºÁk7\ïğ\Ûw©·;<²#\Z\áóûñùüh?¯\ŞX\â\Ïşù%>ıÊ«¼ò£›TZ:±Á3¹Y&¦§™™\É1–\É…\Ğ$XiCJJ\Å]–n\ßb·X$“\Éòì›Ÿ#¤R)3Pş´SÀnM|š¦‘\Z¢P,P­”G\ÚõZú`\ë\Ş+\Ã}g\ïÿ^|§\0Œ_y\ê\Ù\âò\ëŸ2ôö…\ë×ŸÕ¾ş,€\ÕC’t:\Í\ÓAZ­\ÖbÁP(D<\'\Z(×†®\ë,//cH\åt\ì\Zµj•Û·nrT=\"s\é‘+¦’vwXñM‘hYE·Û¥\Õh°±¾F©X\à‰‹óü\í‡~Ÿ¹\É,\å£*Ÿø\ì¿ò÷_|™fW’É3–\Í4\İ+\Â\ç³5Z‚\ã\Ú1jGl¬­R,R2“\Ëñ†\'¤\Ó\Ñ\é\è:BJ&&&ˆF£f/\íˆz½\î:Curn*•\"‰\àü¶\Ç*dsk‹ùÂ‹t:\í\Âø#oü\Èö\í\ïÿ5§ÀC-§«w>\Ö>®>?:6*\Şñ‡ƒ¦v(ÁlmmQ®Thµ\Ût.†¡\Î?kw:\Ôj5ª\Õ*ºy\ZU  \Ùl\Òj·&¡p˜‘‘Q„\Ğ\Ø-\Ø+•…B$j\ç@µN\Ñbi‘¦iA†FF…\ÂÜ¸»Â½\Í-\ŞòÆ«|\ê‹_\áO?ı\"É‘Q}\ì*\Ã##A5§£iŸLH\ê\Ç\Ç\ä·6¹sûûû\Äbq¹pa¶Ş±]PšP+•\n{{{4\Z\r:º®vm7¯®a\Ğ4\ç\Ó4‚Á :x\İV-A\"9\Èn¡Àşş~¬qxyş}~i\í{ÿ\Ùw¿\ÌS…óü\ïü\áÜ½oõ½H9yı™g™ššFl\ë(•JÖTK#0«õ,M½!%\Íf“\Úñ1V“`(\Èq£n\Ç\×SIü>\ÅBJ¹L$!!\\\Â\éMb±ñD‚\ïü\àG¬oø\Ò‹\è`Š‹‹—ƒ\Ê2ö’\0i\Ğj5\ÙZ_cyi‰b¡@·«ƒ”\Ì\Î]`j6§ªU+P\í~³Õ¢\Õn›6\à„¸I½®NH	‡\Ã\Ò„#¬¬\ÜE\×õxó¨|«V\Ú\éûSS…S\Û/½³Q\Ù{\ïğğP\àúõg‰Dœ£\ëõ:Å½’\Ú¬/÷„\çk\×\è\Òjµ¨\×\ëö€\Î*ˆ\04MP>8\à¨vRR(\ì ¤’)\ĞL–gF\é¢Mc \Z¥\Õ\îğ­\ïÿV\×\à\Ñ\Ç\'8d\ÙÍ¡rŒÖªU\ÖW\ïsó\Æ\rv‹E\0™\ì8—¯\\¡kt)LLN\àóûmúlt\Ñm_8va\êG/Fƒ\äà ½}‹5Á\n…(•v9\Ø\ßó7«•µ\ç\ß÷¡\×Ö¾÷_\':};\é¿òGÿ®·.K\Ãğg³\ã\Ä\ã	­ú_o\Ô\é\ê`¬`!Õ¥™÷~ {$p°·O~k“™\\Ç®>\Ï\çcmõ>{{\ŞS\Z\íŞ«X‚„tJı\0×§ùˆ*ª\Ì(l\Ïs­Z\åõŸü˜µ\ÕUe%³s\\}\âI.]y„d:\Í\ä\Ä†ağ ŸGš«I]=\å`•Y\Ã)»š¼U‰t£K£\é^º¦(‡\Ãd²4MóÂ‘\ëù×¿;}û)–£iZî°ÿ€&»¹«W¯‘\Íf±–£v»]\ÊeÇ¡ù0\è1*)¥9;j)¤V=\â\Î\í[$I.^\\$O\äø¸N< fƒÖ‹L¥W¸ü~?\Ñh”\Ì\Ä$±xÌ«\å\æMt½C»\İft,\Ã\å+W\Èd³D\ÌvAˆ¨E)…\"©tšP(Âš\ÜS¸¬{df“f\Òi¦\"¢Ñ¨M8–/amõ¾h\Ö\ë¡jiû\ån§}\ÂS\Ú\×r¶\ïü8©·\Z£Á`ˆ\áa\ëEN·\Ûõœ\Ö€P\Úi]6÷­”¦&\Ù?„5¿\ë\İ.+\Ëw1Œ... ùıH!\Z\áM×Ÿ!coU©RXcMJ+Ë‘„\Ãa¦grŒ¹Hw	H¢®h,\Î#W\å\Â\Â\Ñh\Í×³[”¦13“£\Óé°\Ï{TB\á\'\Ê\àQ‹ó˜B:™Î…H§\Óƒ!Œ®ŒÄ“\é_ş\è?\Ğ}…S\Ù\Ş\è4	¿\ßg?¢@\rºôN\Ïyj\ÒK£[«T;\áH\ÊZõjHƒÍuªGU.^R\'œªÀN}8µš\éÑ‡²\ç²d\ÛXŒÉ©)¶¶6iš\ç­9¸û\ä />·\Û\íÒ¯zŒF£o“©\á§öÖ–NÈ¢¯p¤\Ñ\Õ@ö\r3Cehƒ8A³ûU¸_L\n»Hv¶°¶º\ÊüüFFGMKpcñ–F˜\é\İø„g w’N€\ë:-Š¦i\ZSSÄ¢1VV–Ğ®¬¯ğôº‹\Ü\Ğ\ét<4Z i\ZIur—_o5§÷Ö—\Ï\'/<T\'Mğ%\í»ôÜ­º¸q\\\çş\Ê\nCCÃŒONª™¥\ÍVüIx¸\âö«:\ÕÌ«7¹{h\à\Î.20Àø\Ä{û”š‡,w\ÃÀ]­Ûƒj)Í­‹¡Ó¬§k{\'—œ-œSdc@*­ñej©Ve`q]­l¹}\ë¡p„…\ÅEµ«…K«•úghu\ĞûB?\n¡ò•`/^’RÚ´Z»zvi¦grƒ!6\Ö\×\èt\\mlO\Æ‰UW\ÛJ\å\Üz,\Û[õ\Å\Îy¤ı\àL\á0—}¹ª\á\È\Ën …Û¬{Y§ÀĞ»¬İ¿\Çq\í˜\Å\ÅK¨ó§\íN\Ò\Ôf‡\æwó=–ó½7Gk†\Ó\İ\ÎxªB\áôºlfšñ…OcnşûT¬e[&hŒ„\ÍÀ:„\Ã*WW:Í€•·Ã³‡³ÿL\á\0&\ã\Ü\Ì?%š.m6‘HR\r.ó[[\Ì/\\P>4p¤\ìF\í	p\í^š\Ü\Û\Ï\àÆ¤Ş”—\Ò\'=<Lzhˆû÷V\ìN@)ƒµ$\Î„\ÔK¡”Ò)u[M?Z{\á|\Âù)\àK\Í‡‡\î.\İ!;>NvbÒ¦N\"\Şª\0g\Ñí®š\Ö!P\ã—ğ8\rú<\n’›£\Ùlò\àA«{lÅ¶S	//N\Èyâ†ŸR8&vé¹©gW\í:\İL\Ñj6YY^&\Z‹‘›Ÿ\'`¶3R`·KV‚óÀ®\Zz\"/y\ê[?‘È“R:ep2“\É\Ã\Ã\Ãl\ç·h¨ƒs+Š,ô†«29\Î%	&õ\æ«¼\Ò\ÌFzGÍŠqŠù\íN‡{\Ëw9:ªò\Ø\ÕkD\Â%°\İ>¶:zø\Ø;n8	\çc&ˆ“\Â\n8t		BÓ˜»@£\Ñ`\çÁ¤³)‹T	ûu•İŠ\ì{9ğ\Ã\á\\\ÂQ¶Vù\Ì\É6ar\Ö.ˆIƒ\í_’’(•vY¸¸Hd@l\à\ê=\ÙQ-tr‚>ƒ^8&\\\Ì8ıµ\ÅLûQI)2arjŠõu\ÚM—\ÛJœ\Ä\ï®5@\r¶\İs>®˜}¾y\á\\\Â,.!„ğNQ[ß­/\Òy.\ïï³¾zŸlvœ\Ìø¸DEğš··§\Â-·‡[ˆ\'ÁË~c¤^Pm‡pUI.\ÄÛ‹Pq4\ÍGvb’P8\Ä\Æ\Æ\Z†y&\İVº\é\æ6LÂ¤\ÅFe#í¹Ÿ\ç™ôF`5\êw‡×YZºC4cş\âEuú»›\'ˆ=	;ùJ×«{\Ür\Z>¯\\•\"XÕ¯ÆŒdõ\ÄÜˆÅ™c;Ÿ§rp\à\r\îG\ç\ÅÓºøs^8§pLM°­\Ä\Ë\0\Ù¬E¯÷–\ï\Ò\î´YX\\TS\ÛV¦0º]Â³iñ\Ğ2!\ë³.\ÚN‚¤[‹¡ŸrH÷§><\Ìd\Ç	‚\ìlocô­ªN)‚¬g\éœ\Âqr\Ñ4\rŸ\ß;\Ó`™·D¹+VW\ïqp°Ï¥\Å\Ë$âƒFZ‘À\Ã,œ Fz\"8£z7x—½aføia P»eb\ëƒù \Í\ïc\á\âEŠ…uTX”\Ë\Ëg\Ç9Ÿp¤º¬<5s±ºGú$’ıR‰õ\Õ5¦gfC3-\Ê\î@\Ú\ÚÙÁ&“\Ìö\Ç]}:5–µd½,Š\Î\Ö\È~q¬{ñZ+ •\"•N³ºz\İ\ã\0v\á\íC\Â\ÙT„3…£\\ \æŸÄ®¾”\Ã\Ñ*4\ëu––nÇ™™Cø}v\Ï\Ìñmõ7õ(@ºò²ğKivÕ»fZõ	“¹{-÷¤õ¯\'@	Ü›\×7+z  —›£~\\cwg\Ç)M\n\ÓÕ¥\Ş=\ÓRMwH©vm4ú\Ğ\Ğg\n§Ÿ‰Z[\'‚\É8 \İj±t\ç6>\Í\Ç\å+Wğûª€ö »\rV©\í›ıM˜N\ZW¾\ÌW»!\Í0	Ø¡\İ\ãQÀL\'¼¼q§”=i= \é¡!††‡\Ù\ÜÜ¤\Õhš8q\æ‹@)˜PÕ¼šœ”\Î%OZh?8S8½\Äiš¦Ö€™\ïBºF—­\r˜_X` SÖ…@X\Údß¥­Q*Ü”›õÍ¥qv\\¬øJP\ÂG\Øa\Z^ü>\r\á\ä%A3\ãh=qûÑ ™yKW\\€™™z½R\Éd”—WBˆ3„\à\Ä=\rş\êû™„M~\0\0\0\0IEND®B`‚','image/png','guillaume-transparent.png','Jules','','',0,0),(10,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0r\0\0\0€\0\0\0×‡=o\0\0 \0IDATx^´½y\Ü&Gu\ßû=\Õ\İ\Ïò\îË¼óÎ¼3óÎª\ÍhF»ZXl@\Ş\Æc‡8q\â86ñu\à&1÷cû:7÷ƒ}û&\Æ&‰ÁÁ1&˜\ÅÂ–\0	$6$\ÍhöE³¾ó\îûû,\İu\îU\Õ\İ\ÏH¶ñ-é§—ªS§\Î\ïœS§ª««…ÿÒ¯]÷Z31u\á_\×[kÿ\×Û»º¨‹€ÀJf9\ÒLY±Š¢ˆ€ª\0\ÚI@@\Ô_W„\n\Ğe„n1ôFB·1ô\ZA\Ä\çRh(i¶Y°J[-Kª,«Rh)l1‘«GU*F\ØGl¬Ä¨Bª0“YN·Sšª ¾\Æóe‹H\Î_\'¿UvVF¢DI¾º\Ú`!©İ·š¶~c\İ\Ğ\Èüõ{o9ÿ?÷‘UşRôr^iúü\Ïız\×Ñ“_Ÿ6–\æºJ¼}C!p¢™² A¼Dñ%\Âõüš»_AØ‘ÄŒW\"F\ãˆc¨\Zƒˆ\êR³™²b-«jiZ%C¡&\Â\Z!ôˆA$¯.#\ìH\Ö\'8\Õ\âd+\ålš’zxO”\Ê	C\íà¾¸“\âx\é7BEÀ lˆ#\Ò4\íJ\Û÷4\Ó\æ\Û.Lœ\ëú\é[\Şxş«§-ğ\n‰ı=Ó‡\ßğ\Ú\í\Ö\Ø\Ä\äù˜˜¹|[Œ\ÆU‘\×î“±k*qM¬ÀT;\ãd;‚ıy1(hn%ùM—œ!cPv%	\ë\ãcŠ<Á\n2Ë©VÊ²ºVñ\Ö\îR«\\”ŒD\ÄˆRA8PK¸FuP^N-K\Ö2o--u\Öd\Õó\Z¬Ÿ`‘Xv¼\0ªe\ÖEûj	\Æ\ßKUYA™\Ï2·³Ù¥jı\Ïû\×¤·»÷\à‡½\ï\'\Å/—\á\å\Ò\ØÈ¦¯?zÿÿ^[[ş\ÉıI´®K„Qc6i\Æ|ji£,[Å¢¾ñA{5WuÁ	şJ\Í\ê1†^¡-”š6€\î\rWK…\ç›-¦mp±>5D\á\ë\ãˆ^câ®„À†8b\ã-]™\Î2f3Ëš½\Ö\å\ÚT¶J%gXQËªUº#§(‰À\0†şX\ØECOµš÷Ÿ›¬¯ÿ\r\à,\ßGú¾]ë¦´ıöxyşß¼¶V¾*‰\Ø`bzŒ\ád;\å|+eE•f.EÄ¨ªCñw<˜\"BE„±8b$‰=`M+,«e\Õ#drË„D„zdXH3RœªL«¥…R¡.`(Ì¹?2F†e\Î*-1\Î\Ê¡\Zú#a0Œ‘M\ë\Û\âù.Y´D€a(2ÔŒ\0‚Š29`#„Á\ÈtÍ¶\Z\Û\Ï--¶\ßsë›ıÊ›ßµô?Ÿx€¿Oú¾,ò“\ïú\Õ\Ê_>ğ\é\İw\Æfh02¨\×\Ôù\Ì2‘fX\Èı( ¦(@ôŠ…H#Ê¹\ÔB;+\Õ\è´\ß:b\Å	:2ôG}F\Ø]M8\Òl\ÓB bJ3VÕ²Q\Æ{&ÒŒ\é,C\rQ\ÄPl˜\Ê,ó-Kª°¦Á‰’+]\İD\Ô\r,g>\0\ÒÀ¼¢(®6\çZ˜i+\ÇZm–mÄ–$¦G„\×\×k_X^ø—Oz¼yq\â\Üÿ4ø{¤\ï\ÈV\Ú\ZJ\âø¦A\"6×¨U«T\É¨\Ë%\Íƒk\rö\è~2”\Ì+…ó|!\Ë\ïqDy«\ÌÙŒZš1Ö™˜\rq\Ì\Ù4%A\ÃE\Íh \ÔK\ÂM2`\ÈVU™j¶i¨\ëÁ{†`ñ\â.¬dş0o„–\Ú@A±\â¬:@œrLe\Î[\\hgT0Œ%\Î\İ\ßX«|³¹ö\ãªö1\àAş©d\"¯<¥Y+V\Õ\Í1B\îWTˆ4HA•¦û¡Á…õ\Â)´Úª!Uh£´6¸\0„`\r.¯¨Ò°p9µiµ˜\Ë2*n,B††z‹—P³+=k-S©s\×V¡-\ĞU™UeA•«¬¨’ªúz\Æó¶©\ã\ß*M,†š©\n\ç[…H\Ò63©ó6›¢ˆ­Q´ÿ\â\ås\ïûİ»\ß9À\ß#}_@&qu9³öØŠZÇ¹\\úŒ!.9—’]\æ)¸%\ä9q„èµ©Ê’Z&I¹¬Sš1¥–)Í˜ÔŒËš1­–/Xo>ªd¸²-o½ª.\Èh\ãeŸ÷\×\Î#X%±Lf–)›\ÑPw¿%JX°–IµÌª\ÒV\ïJ*Yv¥!uùöœo¥œM3,şBS\á\\š\Ñ\È\àW\'q¥fõNœ9v÷Wş\ÙxÅ¸|_®uûæ‹Y\Ú~\îœ(C\ÆP5T\ëä§¼Æ•µ84\Øu‡LœZUfP\ÖT©*ô\Ä½(\"³@C•,‹\nƒDÔ¼y+…KT)\rq(EÍ‚÷.µT™¶™Àq\ÃÉ±Q2Z\à\Ìf\Z¡õ6)\Ô\Â\Ë(p¬™2gS¬\nF.4r.Y\årš±\Í\Ä\ÃxlúN­-½\ëß¾ÿ\à\"¯ }_Q\ë\ÇıŠŞ³\ç¦ş\é…\éw÷Ša:µ\Î\Z3i\Ğ¹\Ó6¨\Óú)\ÍHTXo\"ú\ÄP5B\"‚Á)ˆûu´k\"ôŠ>8+Š¸h\Ğ\r\â½`%¸c¥\'8 ÏUa˜R¥K„õQ5B$ÁG¸¤\"q¼t‹!f°¤uL¡ …¬¨²ª%LD(A“\\eU•±$\"\èc6Ö¢TøÖ“³—_\à¤Wl\ÂW¦k÷\İøÄªU–¬e6\Ë8\İnÓ¶JE„ª›\ÓÂ›œ7¨:×·Ì¨¥‹ˆ!cˆ\Ä\åQ-¬¶#¶/ö\"ŒŠ!E™±®ÿt\Ä\İ?\Å\è¯\ÜT‡\ä’Zf4£’\ã\ÜD™¼\Ë\íû?õÿuaD\r,ó\ni\èByƒ2h\ÇOq(´UX²p3M#³kœW˜ş\Ş@\Şÿÿ?x\Û\Ïu>~pH\r¬x!^N-KjıP¤\äv¼t´\ä‚ešŒi›±^ƒ\ŞúŠş\Ç7X< \âÜª³´ğg¨ˆ°^\Ü(q\ÚZ” |9&9:\îZC-³j¡ß»¼L]\Úş÷\Ê?«\ä\íª\áÀœÁ2¯.\ÄQ‘bú1¯\É[Ÿ\Òq=\0­ª,YP„*0E}‹‹³û>ÿ³¿\âµ\ï)½\â>òşö\ï\ãcgŒ}ê¾\ï\á\æF³ù–-¾Oi»È…†U0Î¥™2\ß\r\Ó]\ĞD™·ÊŸÁ\ÏÀ«\n™;\0Q\çòJŠMŒÊD\Ì\â¡	39\Îm\Ö‚‹>§\Õ\Ò+B7†eœ‹\Ë\Ä\rK*Õ„\Şş^Dœ\"Xœ[D[mª ŠP\ÇWı&\"öÊ£h>YR8/‡€\áß–µˆF(\Ğo5‘ñ¥\Æ\â8p‚\ï1}\Ï@şÌ¦]ññ«nüø§ÿ\à‡“(ºQmv}jÏ®8\îÁ‡÷nLåš¾lm1ñ\ä¯‹\n‹Š\ïw\ÜDs\ÛIÓ¬$4€j/}½lŞº‰‚ œi·Sf\'g8{\âY³E­Ñ•)ƒ\Ó(sj\ãgÄ›‡\ãnÖº\É\ns\Õ\n›®\ÚÊ7 ¯¿‡\r›6R¯W©T+\İ7 o5\Z¬¬µ8vü<g?\Ê\Ù\çO-/\Ój6I\Õ³Ô¿–c‚0_®\æ*ÄƒS\â>1T1ÛŸ:²‹h aÇx­¹v\ï¹Ï½gw½yCdL5ŠX³.\\\Ïn\ÄYËªµ\Ìg\Î	û1”¦\åÔƒ\í\åBO÷^\Åş=;Øµk6o`\Ã\ÆQ*•Š+[\Å\Ğ_ª‚µ)gOŸ\ç\ÈsG9ò\äsL?G\ÏüsY\Æ\"–^\ïrA±\n«jYŒ„›6r\Ûo\ã\Î7\Ş\Î\Èú‘|Œœw:úf\Ç÷7Ş…$U\0ù\ÂWø\Ä\ï|„\æ\ì\"5SØ›–¬/øÁ÷û9~\ê]µ;cpAM;m\Öx\é{rıÈ¦/œ9ü\î*ñk·F±9\ß\Î8—¦´\Ôu²>F\05–\É4#õn¶Sö’[¾Ü[o\âu?õ£\ì:°şŠ`\Öó\Æiª8Ú„ñª¿&@\Ål¿j+Û¯\Ú\Æ\íw½šS\Ç\Ïğ­/ƒ\é‡gV--„^H…E\ÍhVb\Şú£o\æö»^Í¶\ã`\Å4–C=\êÇºÁ–i6r ·_·Ÿ¡£,\Ì.\0‚\Å:™pE\n2)¥\Ø+‘ d\Öb¯¸ÿ½¤—ò\Ï\ê_U¾ğ7Ÿùñ=†7ïˆ“øh³\ÍL–]\á6Üx´=¹ñùò«¸~ª\Ş\Û\Í¾\ç\ì{\İm`3˜›\É\'\\n¤ :\Z\åñ` ®ôösı-×±\ïÀ\Õ\\wû|ñ\Ó÷qö\Ô9Z*T\æ\Ôr\×İ·s\ï\Ïıqyf´¸—H9(AÁ\ÖV »Œ¡Z­R\ï\îb\Ö?k\ÉYòÿ„~¶Ì°‚\ÃĞ“.\ãó¨2g-k\Êüö-»ğ\Ô\×ù^\Ó\ËyaòÂŠ‘·\ÇQ¼–)sY’¨Z4;	a^4w\'n9\àqAE\\«1¼}°YY›Ğ¤X¯­!…@\Â#ÁeÁeWkU^ó¦;Ù¶kœ?şıO°¸°\Èü\Ô,\ã›F¹û7EQJ®’\ås\è˜Dõ.\Çs\ØZ\r¤Z§Z¯\Ò\İ\×CŠ\àÆ‚Ae\ÉxJ\0ôG¢ŠE˜µJK\Ì[7\í8\Ã+H/\ä\é\ã\Ïn“,»v¸š0\İ\Î\n–\Ô5Z\Å=…Œ\æ\ZJ¿…¬\İ,‰#ú‡‡\\E\í’¥¶-„—ƒÒ•\ç¥+y]\î`ó¶-üóşfy\ì\áÇ¹\á–kó\Ê\â…Y\ê5\ÔW2Pw-4 ´İ¢H(²‹€E0şŠ†b¸†—\ã\í`©=\"$şZ†›\Ó\è>ö–?ø\à+z\nò²@^^Z\ìª+(\ã™ó–\0…V…\æh~¦¹`\Ë]E‰¢ˆ®\în—·µF˜/Õ \Í˜!zUoı^¸!kp\ï\à«‘\ÑuŒ¬a\×ŞyWŸ–ówŠ¦³+™öõÚ­6q¹@…†—šPè›SVg›n™‰Ë¢,XKwW÷¼\Âô²I[0 –G€!•V@ğ\Ä¢p\"!o\Ñ0ñ³!ùy³‘÷§–’\Øñ÷%·R—\× —”´\ÉS\Æı	9ˆ\ß\Ğ5øcuŠV8Du\ÑH\ÛH\ÚJ#[\r`ù+\åü\nH1.*\Æ=Ou®T„‚\Õ+B\ç—O/\ä-»Ï›\È\\œ³\Ö?[\Äi ø~<Ï¹\ït©s:®KS\İ2ˆ-»wºñ\\«šy™\å:Lhv¨A„ )\ÂD¼˜z¾´ø£\È\\‹J@I(\ëS\àqJˆz¼%Püÿ m¬:B9”R+{…Ï³V]½CQD¯‰\æÒŒF¦ô‹aeuy\'¯0½,F\ÇN¥\Ê\×O§1\ÆÇ’ˆ\Èkwhp\î®\n0\04H7ƒrYSª£#\Üõ{<²kE^î£œû+„\í%Bn\ÜÔ˜/ ş¯\\»†€^@4!®3‡\Ü_T¡\n…\"…\ÖI³A\Ç$•\n)Bş–Úœ¸–¬w<\àÇ-U.¦n$0E¬-\Ï\íşğŞ±ƒW^ö\é\Ç}ÇŸY»{ûş®©å¹½\ë\"M\İÀz,N\r‹Vi«ºnD\Äc\ÙÑ­û_ee\ÊÆ¯\ß\Ï{~\í9pû\Ínù\Å\Ê\"di! {\áö®P\Â\æ5(ò\ç™sÁu”\É\é\ç4$T\êòu\ÖZ¸\Å<Y%ªw3?¿\ÄÁ§AÚ©[÷#\äyƒ?qO[DœB$\"\ì¨&D\"\Ìe\ç\Ûu\ãÍ¤\é\ÈÙ…ùø­»¯;\ïµw\Ì|ùÄ³e\Í|\Éô²@\ÜÔ·\î…«û\Û\ítORi«2\â$µU™·ùT¶—SGs·eR\àº7\ÜÁ/}øÿ`Ë1\ĞnÁ\ê*ª~mN°6¼eˆ”¨)JÑ‡•ûR7kRòÀ\Å%q\Ö2”ı¹\ÄB_\\s\nPJ\É\çaû\r×²¼°\ÌÁ\ç\Ò\Î,uQ©^ŠS¸\à.1lIb\åX+eÕ»Œ±$bcU§[½“+‹7M\ÌL\Îß³\ç\Æ\Åßº÷——>öØ—ù\Û\Ò÷\äû\ßòS\Ù\ÄÔ¥•Éµ\Õ7ö¢ƒˆs]‘Ğ°\ÊLª¹“÷3ş\Ï7dJ-®\Ù\Ã{?ğKmÀC…4× ±\ê\\¸\ç\ãB\'V\×rEñ x\ê,ÀQt?^š \0\\ U**Ş’}\İ9ˆ¥ª:uÀ_4‚\Ô{Ø¶o*Â±c\'h¶ZTfY\É{Œ0š8C8\Ş\Î@”L…#ôG†QTK²l\Û\Åf\ãµÓ‹³û.Lœm=:y\î(Kú€ü\ÌÁGõŸ¼æµ3g\Ş2¨l`CSa>s³\n(¥qk`–ª\Şş¾Ÿ\â\Æ\×İ†Hœ…\è\ê’¶œ­•@\ÌÁô\Òs\ÇÁ:\n·„#\á_‚‡Á\Â\ÌiQ\0\Óy\\®§¸.$\nkU$®P\ï\ë\çš[o`İ†Qzüi\Z\Í]\åšK‚[\ä5–$4T¹\äWRX\ÜÃ†.c\è7†õ‘°-6½­L¯™Y\ßs\İğ\Æ?¶ÿ\Õ/üøşÛ¦\î;ñL™¡—vBº<=Ñ¥J­\"\êÿøi¥Å°b\Åû\Âû\ÎB,Wbv¸:w_\î¶E\ÚMÀ	W	B†z*\ê\Í\Ì\Ås\Ó÷©¯+¥_Jšƒõ¢$?¥T\Î\íx\Ä1\Ñl8K6w¼ıMü\Ğû\ŞM«»Æ²*š[¶ %ª)0¦$<º`ğd3eU-\"n™\çk\ê^S­\Ş8\ÜZı™S/ı€\Â8W¤\ï	\È\ßõs\êÜ±kkis¬Š°­S§=\ËÖ–\\†PÌ˜x7\çİŸµ–\å…e\×9\í6¤hpœ\Ò4ŸK\Ò!`?o§<Jõ¿ù)šW\ÕER\ÔG©¨«\ÛG³¥\n4\é €¤\Í|÷ ¼ş\Ç\ŞÊ\ÛoaN\Ü\ÃjüSY7¶v¼X”s\íŒ5Uj8 \ã+\Öò|³\Ítšb­k\ïXl¸£Z\í\Û\Ğn\İû\Ø\Óÿ\âo\Şş¶2?\ßK+‹»\ÓvóG\Ål¯\ÄDnIı\åÔ²¦\Ö5>Xoa$@\Öhqø\É\ï’Y¯\Ë\"n6\Ç[G‡bæŠ¡\Åi9\å¸úûò–\Ğö^Ô¹R|\äÊ¼>šD\n·\íò_ \ËR(\n6E›\rg}\"ô\rğÖŸyQw+j]?¾\r\\*n!\×\áf‹\Øyw\ãi®X\åh3\åbš‘¨\Ğk„WW«µªmÿÌ…‰³oşü\Ïız\ß\ËùùŸûPÏ¹K§\ï]—¶o¾®Ra\È8\×9‘¦L¦Y®©…°\İbŒ*YÊ‘\'avb\Ò\Â:MoEùüø\n\Ë\èH\à‡2X}±ü-Trn…½T>\És½ˆ•|\âh¬\ä—\Øy`Cc£4(\êè”/¦n½S©–¼\ëHÎ¦)sYX=\ì2\ÑP£±ö\ÎùòP¨ó\ïò—¯¾¥\ç\Ó÷ıÉ¿¬7\Ö~õZm`8Š\ÈÎ´Ûœj¥ùø±Y\îlr\ÙÆ‡$\âôÁ#z\ìI¬µ\Ğn£6,•*50X\äc\Ó\Î\äB-\ëP\ÕRY¸B	ò\ã\\\\¾d\Éò:²ûûR\ä)gY\Îh\ÚB[Í¼KI\â˜-»v\n\ØÜºAòú\İ_¹ûÿk|.7F?\Û\Îh\äü»’¸Rm¯½*J’|\Ò\à\ïrz~ú\'\êÖ¾\ã–j\Ü\×g„¦*\'šmÎ·½¹K\áóĞ’0PÍ•6’f‹¿ş\Ô_\ÒZk@»‰\ë\0ğ8”A(ú¯‚ıò,¹ †¢_Ğ²\ÉQf\é+§ùuš»&¥²^O:\è\áO XEZ<O¸f<x\0FÊ`\ç±\ë\\É  ¡Y\ËÖ½\Õ\å\êSº\Å0l\âm\Æ\Ú\Û|–—ò—÷¾ªò±?İ›µ\ß}k%Ş·ÁDL¥–ƒ\Í—³ŒŒ pı!\n)\İò’qyú\Åp\îù£|ë¾¿A­u\r	\Z­‚[a@.Œü>^{aŸ?ˆ\Âa#\Î\Z|\à Ï‹1yÉ‡q+¥:Br+\Â=óù¯A\Ôø $\ä‚ı Z\rÔ»Á\Éó9ü\ä\Ó\ÔqB.éŒ«?P(—²„óPl.¡\"°\Ş¦w<ôş\ß3ğ@~ø\r\ï0\"rw”¥ï¾¡Ryı–8ª\\jgkµ\İú\Ë\àÀqš&A0\à…\ë\ïé‹™\êB¨Z\åùeW ùG}‹\núª’—+ÿ\æ\ÄC\Å>)6—yaM/\á¸\Ä¬LPÊ‡~yW©b\ç\æ\0J\à—\Å,8Â­¤mV–ø‹ÿò1š3stù7\Ğ	B\"­ÊŠÆ¾K\Ö_´TÜı‘\Û^¸xz¼\Äó\Èz­k\İô\Ì\Ä\Ï\ï}ıxl\â\É\Ôr6µ~\áo`&üú$!%o—\æYü°\çZú1\\8y†\çÿ.ûvn\à\Ø\Ñ#œ8{–C§³²¶†U¥§«›-c›ß´™®.Æ·laÛ¦Íˆ\à¦õ\è#”\êv•)ğ‚“ü·:’õùÂ“›4\Í8~\æ4\ç.\\drvš\é™&§§Y]]¥¿·‡v\ï\åê«¯\æª]»ˆcE³6{‚§¿ñCVHŒøÚ‹\n%\ç^A	Ó‹%£E\Â0L \"\Æy\0UºbÌ®V»1\0Lv\0ù\Éwıj\íK_û\Ü/lTı‘\ëªUV­r¦•‘úEO¡Gô\Ò*\ä®{mÉ¯x®‚ö‹º[¦–yükp\Ãõÿˆn¼‰][·rË=œ<{–C§Nrøô)>\Â\å…9²,¥^­±s\ë6ö^µ›[®¿\ã\Û\ß4ö\"}rwL\à:ƒ\ZEE|TÛ‰b˜¶e~q\Ó\ç\ÎñøwŸ\æ³÷}‘\Ùùy\â8f\ãğ:\Æ7ld\ïö\\\Ç^\Æ\Ç\ÇY7¶‘¨\âñk¥F#…\Ï|\ä\ãT—©ÿjm0Zœe«ç¶¬wˆ}½hÎ¿E\Õ}(¸öa6\â®°\ÈCÇŸ\Ù%š\İuuS5ğB3óo5)`Š\Æz\Ür¥)¨”÷«\"L\ÉB¿ÇŸ9\ÄJ£\Íúş*\ÕM›©÷ö208\Ä\Õ[·³ò\ê5.MOó\Â\ÄEN_<Ï“G\çĞ±#<\ì(_¸ÿ+\ìÚ¾\ßû\ÍOŸw\è\ì—\\S‰ÁB¯¸-\"d™\å|úS<w\ä0GOŸbjzŠÁ\Ş>\î¾\å\Õlß´™][\Æext”*õš÷^>•:\Ï|\ëq.?\ÍXXS[®Gœ\Ê\çM	\ç^İ©k˜÷I!na\Ù*™µ\Ïö÷^„½ÿ÷øÈŸı\îxW–]½¹V¡i•™,<‘(!–3\æµ>X9jgZ¸‹2óP\Ç0?=Ë¹39°µJµ\ŞM2Z£\Ş\ÓO25M½Rg\Ûú1\î\Ø÷\Üq‡Îœ\à[\Ï<\Å\Ù\Ë9~Œ\Ï\Ş÷E\Ş{\ï;1&4:ğX\îƒB8XSBtze²Vyğ‘oò\ßÿü\ÏH\â˜İ›·r\ï\ë\îf\ïöôÔ»¨U«tõ÷\Ó;<D¥ZEŒA3E_–2“ğÍ¿úk·²]:NŞ‚lJb¤\ì\Ê}1rg,Â 1T\Åx\Ì‹2c-$\Õùù\Øo5 l‘ª&2ñØ \Òcp¯|eA\Ó=3!¾kjr|\Õ	\r¥C£\n\ç*<Â¾«Æ±­&6SÔ‚\Ñ34J\\]fe~Y[£¿\ŞÃûn\àö}\×ñÜ©\ã|\çğAü\ÖC\ÜñªW±{GJia‰\éë•œc÷«\nD®-*\\\à³_ú\"7]½[÷\à†\İ{‰0¨@W\ï\0õ\Şª\İul&¬­¶\\ûŒ1ˆ1DıuN<\Ê\Ùc\Ç\é\ÉM>€\äT¬)\nÊ–Ç´\Û p/·\rqÄ–\ÄP‘`$°¬\Ê\Ù4\ì[¿\á~.\Ê@:­i šŠ¸÷7²P]\Ğÿ[D`\ähJP¿\à\ß\Ã?y\'\Êz¼t\æ\"k\r‹]i‘eµn ¡»oˆ¬;cmyÆ²[Vq`\Ûnvm\ÚÊ¡3\Ç9|ø0\Û6o¡RIr\í-qó’.¶£_ETÉ¬\åä©“¼ù\ÆW±uıFº«ulQ½FWo?•zU¡±\ÜFm©-&Š0‘\Õ\rggaz–-*^V¥¸4\çM¯\à­\ÔWzCP”º¶$\ë£¿—D÷\Ùv6¿R­q(Š\íÊ|\íüeû\ÓwN®(«ª2¯v|—4©$üšúÌ¹ÓWACŒVô\î\Í\â‘\Ñ\r¬­¤\Ø\Å6³\Î*\ÑwŒªõ’¤›\Ö\ê\Í\Æ\Z	17_µšk\r*IBp\âŠ<D\Ğ\ã \ÔØ’‚¥­\ë¢\Z#[v`­`¢*õş^ªõ.lfY[n¡\Ö:‘»@A\Ä@\äV»[Y\à…£\'¡\Ù&b\nˆò\Ê(Ô¸_şğ[\n9WE\Ø]Iˆ\ró©[¹¿¥\Ñ%†9ky*mŸ‰\â\ê\'~\ç\ÙoNø\n:ƒ#/_>\ßhhg¥\äg\áDFy_ÌœxFı}B Lu/¥¶€‘\ÑQZ”tµ\Í—h¶Ú®‚ˆRI*ŒR«Uˆ“ˆj\Ï\0I½‡´Õ \ÕZCÒ”\ærƒ®®n¢8\0øt\n—»T\r<zE¿\Ş@•J\\…8¢R\ë&Nªn?F›´‘¥3‹\Ì--û\Í\"\ÔW%õõ±~x¦]afb’JIA:ptù\Ó\àV‹\Ë*‚ª{ıok\Ó.´3.´3ºEH0´±<\Ój×»¿x\Ãş[úØ¹#B\'Wm½ú\â\Ä\åó\Ëó\ÖR÷&n†›^KsK	ª\\h@\Î[J*A\ã\n\Æ˜Å²m\Ûºzûy\êù£<}ğ94M‰Å°\Öjúõ\Éş½ş\Æ*£ƒƒ\ìÙ¼…½Û¶0<8@­§\îd\Ä\Ç	\íVŠH‚)\ÖW\ä¼\å\Î#¿|ƒ‚B–Z4†\Ç6\Ñn[Ò–%m¥¬­4879\É\ãGñ\İ\'hµ\Ûl\\Œ¨&	k­&Woe|\ë6VW–©RRÀ\êş\n\0ƒ\à<À‘À\æ$a$8\İJ¹˜ºu³\âˆD”\Ë\Ör\Ñf\ì\Ør\Õ\Ç~\é¾O,–j\ér°xŞª™·ö\Úñ(\"L\×\Å\ĞB\İÄ­Š\Ø(œ\'E#rSu\0ƒ‹¶\æÔ¢µ*\×\ßz+S‹œ>‘\í\ë6015É¹™)&\æ\æ\Èü¬ˆ\Ğ\×UG{-\ÇÎ\ãÔ¥‹\\³c;7\\µ“š1$µ\nª†¬‘FB%ŠKP€XJN\î¢Z%m§\Î\ê2\ÈÚ–´™rijš¿z\ä1––W\í`}\ï g&\'xü\Ø\Ñ\Â}õ.vn\Ü\Èù\É)&\æi7\Úa\Â.o»?Ê½A\á\Ù\ne·€¨\ÒÆ’ˆ\é\Ô\æ«\ê\"p.I>À\Ì\Ü\å\ÍÀ)J©\Èõ\ë6-§¶}dE+tC·K\ÄÀhq¶\å\àBYÉ¥Z\0[¯ó\İ&sj\Ù6¾\r\Zdqi™\ã\ç\Ïñ\ï>\Î\Ü\ê2õ¾^z7a’’¸ŠH\Æó—_\à›\'q\ãøv~ø\ÖWsø\ÌX\"v\Ì\0\0 \0IDAT´Ó”WØ‹‰#¢4\Ãf‘\n\\Ü• v$\ÅõÉ™’¥\Öıµ-³óü\ép\Í\ØV²^\ËgŒgÎœa¥\Ù@D¨V\Ü\ê˜4\ÍPµ<r\ìyF†X\×\Û\Ç.kò/\r¸*p†0gÀ\Ìa)ğf4v/»NxKD•V0€°\Î®c\ÍM¿\ï}\ÛöÙ«¶\îy\ìƒ\ßø\\\neõõ\éÃ›>´#~\ã\îZ•™\Ìr¤Ù¦K„]Õ˜\ÃÍ¶\Û\Êc)\âö{ë˜°Í\Ö\è\Zd.ZK\×\È:¶\Şy‡/\\\àK>\Ìô\Â<½½}ü\Î\ï|˜={ğ±¿ø\ÃÛ°Y\ÊÎ­}üãŸ¼G{‚ı\Öÿ\Ëzù‘\ë®\ã\à\Ù3\ìŞº…7\Ş|=½\İ\Äõ„j-¦\Úc¢bR\ÙzŠñd1Lj5Û´\Zm\×O¯µ™[\ä£_ø›\×aM\Ä\×\ÏNŒ\ìg\ç\Ş[h6\Z¬®ñ‹\ï}B\ÆW¿ö4£ƒŸú\Ô\'9xğ ‡{«“:{L…q1Eœ\×¢U@J¡_\á\Âö8¦/6i¶ix¯” \ì®F¬‹ı†7\nÏµ[‹3{°\Ò7üGo¹óÿõ#û\ÍÆ‹_]\Ó\Õû†Ac^·#¨\ZCÃº\r·\'	«–|\ÆB“›%·\\—w¯˜UK´~?ø“÷2\Ûnóù‡\ä\Â\Ô$½½½|\à\àW\Şÿ~x\êy\Î^N©Õ»™¼|K\çI\â„J÷(SK	?ô\Ãwñ\Ø3O²od”s\ÓS´Õ²m\ÓF\â$\"Jq\ìvz\Ì9“‚Ã¡ˆ¸k6U²4Ã¶3æ—–ùo_ú2\Û\Öo`~m•±\Ûoc\ã[\Ñ\Ê\Ôf\\:’\å¥96n\á\Â\åU^8?\Í=?ø\Z~ø‡\î\á\î»\ïfhx˜o~\íkš˜n#$\Æ \Û+õ‹\Òñˆ““ºxd0Š˜\É2R\Í¥\ËDô›(§4Iµ\n[^X^º\æğ\Ù\ÃGYœ=ñ@öÜµ!Š^·5‰‰p[’\Ì[Ëº8¢\Û—\ÛY.ˆB\Û\0õ‚“\\÷ğ\Ê\ç6À­\×ù¡÷ş4^u3£Ã´Z-N]º\È/¿ÿıüÚ¯ıo\Äq\Â\Ñã§¹4›±÷š«\Ñ\Ö\"\ç.\\f~-&‹‡Y][\á\Ç\ßvwÿÀ\İ|ò«_\áõW\í\äÀU;©wUˆ“˜(ˆ+\"t\åñd°›Z²,Ã¦ŠÁ°ex\ÓK\ËD;wğ\î÷¾—sKPdó\Ø +K3,-7iFë˜œ·$¦ÁMû·S«U\è\í\í\åğó\Ïó\Â\ÉS\ì\İ4\Î\Ô\Ìb•Z\è1½\ÒK©~(÷×‚\"¤¸GTm\Üş\n¡`\Ã÷ŸU\ß6#Ê°‰HDº\'\Ô\Ø7l\İs°\È¿\á\Şu33—\î\ÚE·›EI\Ìd\ÊP\Ñm`\"\ËÈü)Ap\æNNByGdÁm	6m-»_u#o}÷;‰D¨\ÄU®İ¹›\Şz7«šrõşk\èï§»«\Ê\ã\ß=Â·^Í¯\Ú\Ã\ÜZ\ëG7c³Œ\áË«o\ØÁºuC\\s\à\0ıoÿ·¾ú\âjD’D\ÄI\ì^^-ğ*¥\ĞúˆZ\\ÿ­\Öb­\æ¿K««<µ´\Ì?ıÿ‚¡¡AVVV9wi·¿q/û®\ŞÎª o`˜fc‰»Ù·{|\âŸ\à‘¯ü5¿ğö\ã¶\Ûogym…se\Ô\ÄYeP~¯\éH~\î\Ëó\İT·µM#t’\"øe\Ã\Åa\È=\í2Ÿn®õ7\à\Èÿø¦Ÿª?}øG»šŸ¿¥šG\âJ1LfÃ‘!\ár\ê¶ËµK$gDr\Ö ¸\×E Ù¸Ÿú•_`hdo\"Æ°k\Ëf²¥>ıùÏ³\ÜXc||\İU\ÃcO\å\ÌD‰j,\ÌMqä™‡®-rüğ³üùŸ~‚Ç¾ö\0[û¹ùš«H*’jL\\IJnµ<\í\å«c†\'(»T˜pğ\Ôişâ¯133C\Çlcúò|\ë‹*\íL¸x\î$›‡\àö›vğ\à\Í\Çÿ?³n5\ã\×\ß\ÌøÆtõv³sÿ^\Ò,\ãÔ™0™¥\"d°\Üsª\äS d¸qvùu,Å½2E$&x·\0zÁ\Ún\Û7t*o\İ{7]õ\Ó\\ûğkk\Õ7Ç¦  p¨‘²¯\Z£(®6\Ép\Ş:\ÄB`F|¬\ãnX…s±ğöŸoû\é{\ÑTi·RÚi³M\ÚLI[)Ys\Ï}ùK\\\\[eÇ¾½¬6-\ß~\ê0K‹‹$\é2cıuöm\İÊµ»¶³wû6\âJLR‰ˆ+1\ÕZLTó\ÉóÀ~\à®y)”Ì·²,¥\ÕHi7Ú´[–¥\Å>vŒçŸb9\ÍX?Ê‘&™ZXÃ˜ˆñM\ëÙ½c#SgN3,1¯?p€®¡u\Ä]\İD•„¤\Z“\Ô*Hdøôıc¿ÿÖ«\Ò”+\Ä\ŞBÿ °T-\Å lOb¶TbT‹ó¹v‹cµş\Ç\0ŸÿGÿ®\ï³_ú\Ów\îJ¢\"S(³H¯q¦<Ÿ¹×£UÁm\ëE\æ³7AóUX\Ã\Ò34\Ä5¯¾‰joY«Dc\Ä\r’”¨\Ù$K—y\ç^\Çj³\É\å\Ù9\Úq››^s-&Š\ê\ëc¸¿(vM”xWêŒ+q\É\Ú4F@-¿\ã…u\å\ÅDq\â”R\É\è\é\í\âkpë½¤i\Æ\â\Ò\n¯İ´…¥\ÕUg¹¸%\îº\áfj\Õ\nql01\Äõ\nQ­\âxª&\ÄÕ„{~ö],\Î\Ïrü‘\'¨·½Z€¦·z~\Â\è`\ÒiªÊ²µn›o\Ä\ã«D>.‰ş\Î\×n\î\Ö\ì\Çö%Õ0K\äG#±[\Ç\êf\Z\ÊZU$\'\ĞR\È\ßj\İ]º\íO’j…(qn0n·\ÉZ)\é\Ü\n¶&Ø¤N-«28\ÜGˆ\ÇE1‚‰cQlˆ\â˜(‰ˆA¢Á8-Ê£i	C}[¶$0\ïÒ’JŒ§`Q$¤\í\Ì\Õ\ÑÎˆ«Cƒ}X?©oUs#\âö#ˆ…¸÷\Ô]\àUKH\âˆMC[y\ç/ÿ<4=\Ã\Ìñ3¬\Ë÷ıñ|úÃ€[ˆ¬\ÃpğEQÚ¸}\Ño½ŠÛ:lü§?ù«µû¿ñ¹};Œ\ÔzM)Uõ¦\ru¹,e!³§\Ìğˆ”8\n¼\â˜Sk‹ü‘!®¦\Z£‹ód‘\ÅöÔ°Y†U\×W…²b@\Ä \È\Ä[³	]»\çQg„\Â\â\ê\Z½İµ ×Š²tò\ÒxObˆA\"dœD¤\í›\Z\Ò,BSu Z°š\å!\âø2‘E)Qw•\È{‰(IˆbÃ®ûxûÏ¾‹ş\Ûß¦K…\ã]¬:·or¦8¡…A”T¯¤.š\Ë,õ¤2?ñ\ì·\ÆıÑ­q\ÜfÁµ<Û­\ĞR\á\\jiP¸\Î0¦±F\ÃP#¸.\ÇdM…Å…E^8z’‘\Íc`üJ4±Dim­`j±gÖºØ’-ÁMn;ò~`r\â\È-N]¸\Èu»w\ä\ç¹+‚)\Zøş]õ\'Õ„(Q\âJ„\Í,Yš93g¹\åb‚b$\â\Øõ\ÔÀDˆQ/!\á\æ7¾†\Çî¿}›\î²E\ã\İs\á¬\Ò˜¯\Ï\Üò•`bpš(“™=[i60\æÚ¶¤\Õ\Ü<lL¾2!¯Gİ†³‡š-\æ\Ò,\'S\èˆv®8#\È\É\å«\é\ìŸû\èÿ\à\Â\ÉÓ¹Ë“V»8\ëŞ—Aü\ÃY‰&vı`°>^ó]½¹\ÆJhœh|”\rğ\è3‡<3\îz\î[J ®Xq\"s‚®<®DT\ê	\Õ\î\nÕ\nõ\Ş*]½Uºzkî¯¯F½·J½§Jµ«BµšÛ¦«RÀ#\î©~WO7¯ÿ±·¢½]´=ÿW&Ïc	÷’”›˜sW\è5B’V.¥YÚªTÖºº\Ï\Z™7Df,‚–«û<\Ã\ÙVÆ¢{\Ï\ä\ä	\n\Z,—Gµ 3(1œ\à3ğq\Ú\í¡KóH\ÚvÀ: \ïØƒJ…\åÿn\Ñn§\"©¯+\×]\ïJ<\ã5Œk}5¡o÷ô\ËòB,\Ï%ƒ[E1Q\'	qµ\âúø$!cÿ`\ÙOÉµ›\Ğ\\-,©¤á›¶oexl«š7ƒ\ä}¢KN¾	Â¦$Êƒ#P„‘|\é¶?\Ön·¬\Í\î\ß1~\Õy\ÓXkŒ÷›¸\'vn(\áš9ŸZf­{	%¯+\Ôk°¿\Öq\ß3ª¸µ¬\ë,<óõGø\ê\'?G:7\ã_\Ş!hî•³°LOÀHh†\ä \à.+\'\Î]\àØ™sWµC 9­¢”¿\æ^\ÂZ:\Ò@#\Ò\áX\ÇX‹ ^ù\0ùµ5\Ö\Z4q\Ùw[L®¨\Û*±€uK¥\ÆbC\Z°Àó­”¹(ş\âk^õ\Æ\Ïş\Ò}ÿ£aW\ÆzŒûF9i\'\ÖE\ëÏ„œ «Y£ $ğ\ä¢Bî‚½tº\ÅPm¥üÍŸs‡ys¿\ïhk¨f®\Ú!\à Á®\Şp\ân<òVD±R¨#iI)®Hkş\âOósÉ™R›aWóX!\Ôy\â2“S“”UHsU¢Ä†\áXXµ\î3P‚şmLbW™ºí¤í‰¸Vÿ\Ì/|á¿Ÿ0Õ¤²\ê\Ä\ê€ña¨°R²F/ú\\\0A\ÇHa\âÁqB2af\Î]\ä\ë_~\0›9ÀƒEº`\Æ\×\ãqõ\ærb£\rW—\ã:S\Ëwa­\áö¿	¥\ïe\Ø$¯/\\\Ö@óJ‹û;RXö‘kºUškh\Ú\ÎÁm..r\è£+kt—4«¨I@\Ü7À¶\Ä1\áR;u\Ë>¶Ubj\Æ}_\ìB–5i¥g´\ŞûW\í\Øÿ\Å@Áôöœ]Uÿp\ÈÇ‚¸ÿB‡›[\ÙKµSóp‚\âıH\Ï‹ĞğğW¿\É\ä\Ä$*\ê\\’\n¨é´œ\\1´8-§+.„9Ô…¥%8Mšù\ç¦nY^\Î?8\å0\ç|z\ë¹Â„óş¾°‘º	\ïº1µˆW®vcg¿ú §¿ó,ƒ&¦\Ëk¢ºŸB‘p\ã‘0—Zš8¯´1ô\æ.e\éò£\íô\ëÔº\éŞ·ş\ì\àÁO\ç_»3\İõ\î§­=Ÿbs¡»ùS¿™ºk\ïóñ•\ÆsÁ„”\ÛtÈ”­Á®µøúıy\áR´&—S\éX)\ê,§Pw^©—œ›˜\â\ÄØ¾q´³\ï¤DşŠ\Ğ9±—\Ê\'y®+YQ_NrT\\&51\Z\Åh–ò\íû\ä\Ï>ú?™¿0Éˆ˜\\\Ş`y­\Üı%ÿ2p6\Æ1¢°l•G­\Ù9«’e\é}où\Ã¶Ê¼˜É™Ë\\°:Ÿ\ïP²®>¿\Ä\àE-ÌµJK\0ò³¤i\0\Ô\Í\ê÷!<ûøAf§\ç]N\ï–rJR¨€Jù¼“°f\ÖY´EUy\è©g8r\æ,\İ\İ]9İ‚µB;´D¯°Ô’…s\\ó;4şº”€•€\n` vc\ã‡ş\ê~>öÛ¿\ÏÚ…I¶ˆq¯˜{\å$Bl\Z<‚ªÀ¶JD\"by´\Ùj¤\İ}ÿ\å‡\Şô_ü\ÄÅ“\å9uW\ëŞû.’T<\Ün·,š§Àº8v;J©…R\í€c- &„÷#£aø\\VÀ\Ì\ä4§Ÿ\nM\ÂU[\0\"ğ\áÈ•†>Hr\"p\Ç\ÖZş\ì¾\0\Ø42œ\Ó\rŒä‘ª¾B„\æ\×EBn\Íó\ãI¼”Û•\Ü7*J1\r˜ax\è÷ó©ÿô_©®4œ%\nˆ˜|&\'Xrm‚\Ğ\å_ø©Š›\r;‹\ÍYeFmºqd\ì±wÿ\Ù\\\æ%’¹qÿ\í³\ë7|ú¢šûNµÓ†-in¯6%q>\Ş	\Â\Ë%\ìL†q†(¤$ŸRre²\ÅeN>E\Ön]A2h«ÇX€\Èñ‘ÀCO>Ë“\Ï`û\æ1—[Bù@\Ğı;“N6\Õó ¹u‘÷‘Š„ŠKôópC†\ï<ôm>õ{\ÅL\Ï1,a+oUguˆ¡Šÿ‰£1GŒWbŒW¿‡€]7´¡c\å\\9™ø\Èù\İC\ßúf\Ü\ÓÿßŸN³ƒ—2¿K‡€ lŠ\İWTE½B–[»7\ß-;!ÍÎ‹ˆ+RU8\æF«pi¾AP’—·’²]V/_\Û\Ò\ê\nı\Ì\İ+\íÀ{¯¢“\ÑB\ĞÁ\ê\\L\æyyü=ŠK¹¥\æL\æôr\"@X£N_\à\Óğq²\É†½úV9\å,w´!r·\ëôªŸ\ì÷	D…!#ô*>}}x±õÊ”_\ì\ï|°W>õt«5›\æı…xvTböV\Æ\âˆÄ¿Ş¥^¶\ê\Ô\Û	Û·³$‡\â¼\Äa\â\âešfg\Íù\à\éa\\YÀ\ç\î\"\Ê\Äô\ÇÏ`Ç–1¶úÛW\ÕÜ²œğ£\\iœ¢\Éj^/¾¼Pb\n˜w9ö\â\Ü<Ÿı\ÄgY8w‘uŞ–4»#\n\ãxK\ã\í”\íŒvX\á•5agU\Z­µw\Üÿ\Ğ_ò]¿Ê•)_!ğ­\Ëg\Úÿò\Í÷;>q¶j\Óô\Îğmd\ë«\í1\ÂP±.Šh©[G\â±\Î)9\nÁ;„®%¸A´\ê^û\æ;]`ß±RßŸp¹ş\Ñ)W˜\áqUºƒ¡^\îy\í\íLL\Ï\0\Êş\ã¬\ëî¢¹\Ö`ea\æò*\î	G‚ƒ\ã@A¤ \åt<\æ½7‰\É#^!Â¹£\Äòüıùûù\æ_?\Â\ë>˜M©\r9¥+À•m”\Ù\Ì2\İvC›ª!\ß\ÓnÀDr©\Õ\ê_´¶±²¶ò\ÈCOu<kv¾pø‰\Õ;7l[š[]ºk4Š†ºŒ¡m•³\í”\Å\Ì5´W„~±h5_ ³˜ù	B§¬;V\Ü~­\íZ•W\ßq}Ãƒ…\0  Õ¼¬SßªÜ­z¡+ôvws×­7P‰#ş\ä³_¦?‚n\Íh­5Hªºúûˆ£8ç‡¢ŠÁ\Í9\Å)€\n€k‰OWŞµgea³GOğ•¿ú\Z­\éy\n\Íuyr2hB!¯ĞœPce!s\ßwˆŒÿ\Ú:¡û\ì\Új­w`\è»_<\İñ´­¢{û›¦\æ\Z«W%\í\æu#QE\",X\å\\š2í¿—<\à?S›m@SQõ\Ú\Z¼‰k—Ÿ‚Ã­ª\ë\Û0\Â\Õ{·38²cŒ—j\È\ÊI\îúŠ«\ŞK‰^òpS¯&\\»{7\Ø\Ë\éŒ­bÃ¶qú\Ö\r;)w/¹öu\\¼†U‹,\á<ğ\"´\r¦\Ï_\à™§ñÄ·bH\Ü#WB=5†–h\ãA.wñ«¸M“*\"ôF.\êÃ’\Ú\ÑSó3Ù\î{Õ£ß¸x*\ß÷üE\ç­\×\Ş\ÙR‘ON³³nõ–2\Z¹e}mU.¤§\Úmºı\ÃA£8­\Ê[\ìXñ\íõ©<o\n«›¶ŒaeÁ}/\ÃõgnH\Ğ\äA\æÇ‚„\0ÙŸ\ÊE†«¶n\æo3\Ûöî¡«¯·DRp[p«¾Z\Ôñ\æVY®\ßñş0\äı\î\Ê\Â­F“\ç¾{„J\æV…\ç\Ûh—è„‘J˜¥.Ë¤P%\ÍÁDİš§‹\í”Uÿ1œX”’¤RWûSóSoı\ãÿ\çù÷³^\ä[şğƒôv÷N/\Æ\Ér\\Uñ·¢L¦ÊŠÍˆq–‘ \ì™r\ç9¬€Û¶«6\Ø\Ç\r·\İHµ^£µ\ÖÀjFp_®P‘?¸›\×\Zò]áš‚¡P©TH*Ig9\rù5+ß„¾,t)„\ë\r`–Aô\æò\Ü,\ÍF“©\ÉYj\"¥\'ş\ÑP^\n/•P¹\æ\nÅ«’3±¦0•f¹\Òv8$\ë–f~\î\á\ïüÍºP\ÕK†²ûw_?-M.dnF¦ˆĞ,\Ê\Åv\æao‘J\ÇŒNHš(3ª\ÜñÖ»¹õ¯a\ã®]T»»\Ğ\Ìú¼œ+\ãe\Í	Š\Ó\é\ĞA–,¥r´‚“B`ù\Ø\Ò ¡\ãƒ\Ş%BEµ…»O\Ûm\âj•¸«U·J%XU>_ãƒ\âxZew\íúN-ıqŒE˜È¬û‚¶\"†ñ8ŠG`÷–±\íûB¾—rznª¦hşm¦U«´‚ù´¬n ZLe9¡„FBwƒ¸b\Æ\İ]¼\é\İ\ï ª\ÕIª1½ƒƒDq%\r\Í\İp®ş@Ğ\Û*x\É¾”5\äw8†›x\àı<™}‘¥E’+ò\n`LÄ†­\ãŒl\Ş\ä^vU¥ø¢÷L¾bˆ\È!ƒS°<¸C\ÜxS\Ô\ÒPe\Í?‰B•š]b\Æ—÷*/ùİK“\çz\Ôf}]‰{;\è…VñvKWxwW¿c^K%ş†¿·¬p\àu·1<6Š¦Mh¯‘¿\äW]n°SqüM\Âj\rµ«: ,³¬­­‘¥&\ê]uŒD\îšMszµZ8	\ë\nb\n’ñ÷;yQ…(Šõ#lØ¾…¦g±¨\Û{\0\ÇSš§‘\ì	w?R\\\Ó`¥\nª–V˜\n·ÿB\ÍÀ\Äòü\Ö@\é%¼0q®¯×˜¾z5fU-\rµy[Bór(||q#ì¸¯\á?…¶\Â7Ÿ·9Ë®Û¡\Ú\r«K%:®¼ªvº\×0ƒ>õ\à2‘¦)KK,,,°°¸\È\Ô\Ä$\Ù\Ò2İ¢hd\Ğ\îšVi--‘¨H\Åw\×\éaı\ÆQ†‡©×»}¼t\0(EC¡p\0QT\Ò\İÏ›\Şõc|ô\àQV›b_| P(g	Àü\Êer·˜]\Î\Å\å…õ!ë‹€ü\È=\ï3GN<·k`ö²‰€eë¶›D\Ä(ƒ©H¦ˆÿ%otÎš¸±Î³ğO\í\ßñ~ı_sóş½¶ \í-\ã\êlPqœeGcjrŠ©Ë“¬-¯dıÕ„šFªz\ëUªQL–e¬.\Î\Ñ\Î,•8¢’$~wh6Ö˜:~ŒgŸ–\nki\ÊjšbU\é\è\ãõox=6x©\à–eÃ§<©@­Ô»\Øu\ã6Ş°Ÿ“\ßü5‰©\Ñ\Ù§\'¹\Ä\njDU¦^r\Ë\ê\åÖŒ\Ş\Ú*\Ê\äšı\âq\ä%K«‹ÿfL\Ó\Û\Ç\"7ğŸÉ¬²«\Ø\äšZÒª+50˜oÈª\î\r£L„\'.œ\ã‹_}\íÛ·±{\ÏŒ\Í\Ğ,¸>O\Çÿh\0\Ö7\ê\ì\Ùó<ù\è·\ék¶H\×V¹4·ÀTf\Ğ\r›1;ö²¼~gM2a>ª²tq1\éfit++·²0¸‘¥\á\rLY\Ãù\ã\ÇˆÜ¾n}\âf«n¹\ãV\Æ\Ç7_ñz«[\è4RIª\ÈÀ\Óüöú>ò™\Ï\Ò_\í\"V¥¾œ\Ş\Ñ\'j \ä\"„š¸•\0\nˆB$†ñ$f]\ìw÷À\í¿pªİ\ï\ZÿŸNû6¼„EN\ÎL£\ëû+1ş©\nP8÷\Ò	¾ûÓ¼e¥P\'¨A\ÑºF“\no¹\îU|ı\ĞA~õCÿ\'\Ë+ÿŠŸøÁ»©f’¶s/\ê\ÊJG`\"\Ãõ7^K%‰9÷\Øwx\Í\Îq\æM\æL\Â|»o¾™±=×Tk¨Z\Z++\Ø,#©Ö¨\Ôjˆ—Ïœ\äøc\ßd¨¹\Ìõ{¶2\Ò\Û\ÍJ³Í¡•&o¸õ6oİŒoy?©\à\âÂ‚Iª\Ğ7\Ä\å\Ù9~\ëwŸ?şä§©™˜×¼÷=Lõf.]b£òx²Ãœ5?\r+3\Ø¹=\ÌOµ\Úù÷57Å†±8&\ÊG–«\ÌZ{¾fÓ¯Š/\Òfm“ˆ1	‚ª÷Í¡r¯]B1$\É1+–3\éóWÑ…[\î­¶ø\Ñ×¼\Ï|\å>~ñƒ¿\ÎÁ£Gù7ÿ\ì}ôE‘\Û*Sp zœ§89pİµ,\Î/ñ\Ü\é“Ü¼i=Dh4\æ™øô\Çy.…V­‡şM›Ü¸…$Iˆ#\Ã\Ü\ÅsL=L}uı\×S­Q½›f;\ã\Ğ\â\n7ÿ\à›\é\è/õÍ®¡§È§U I°}ƒœ˜\âÿ«òğc³^o\í\égG\ß oş\Íñ\'ø·,\Ì\Î1ğ¢\É$\ß_;\Ú. Š#¶W–3·r®.\Âx’°>6Ô•Z¾\Ûjœi\×{¾\Ø\'g\é¹Ö›GMU\Ì;7³£ß¸˜r&s\ßK‚%ºW$Œ| \áÁ\Ï\í\×_É¹\Ã\å\ÅEz–YŸZ\Î,/óµo?Á\â\Ú\Z{¯¹†Á.$Mq>Ê»\Âm‹À\ÈúN_ºLµÕ¤·Z%‰\rƒµ\ncÕ˜ö\Zö\Òyš\':Lt\á4Ã%®d\ëÆ\Ô\Çw`šK‹<31\Å\Øõ×²eÛ¸oo‹÷4\"¤‚\í\à\á\'Ÿ\å_|ğC|\ë\ÛO°9®ğ–AÆ’*\í…%ö½÷İ˜\Æ\Z\'=DoPkğ  ß¬n#\ì¬$Tp9Í¨\ZaG%a(v\Ó®ù†y«|·\Ù\âx–ı/„ÿü‡\'\Í\ç[_ä›·\ï\"\ÍŞ²Ş¶÷÷û5$“YF[\Õõx\×*A³¼Í‰*ˆ¼ˆ¥$\×gdV™_[c³‰Ù”T˜\ÊZ<ò\ÜAŸ8\Í-¯º…¡ş>$k¿$ˆ!%•„¾Á~\î0ºª\Ä~¾Öˆ\ĞUI\î\ébtp€±\Û^\Ë\Ğúõôm&A\ã][¡9=ÁÁ‰ºv\ìdÿ\r\×™¨v\în\Èc8b•f½—\Ï\Üÿ ¿ò\ë¿\É\Ñc\'¸ºR\çM=ƒŒ\Æ	¨\Ğ^˜\'Ú¸‘¡\í[9ü\Ğ\ÃTÛ™s{dŒ»`D\ØSMŒ\rV•Š\Ö\'n6-Z\nó6\ãTšòt«uö\"\æ\Ñ\Ñ\Íÿ÷|®\Ød‡—\0ò\r›¯–…µ\Õ\èn7oXE\ÄZVY²\n\â}{‡p=SH\í¸,7\Üsw+ª¬\nl®®vq©\Ù\àé“§x\è;O²{\ï^¶lŞŒ±)ÿ_u\ç\'Wu\åù\ï}¡rU\ç\Üj©[­œB\ä`Œc^\ìqX‡q`v<\Ì|\Ã|¼f\ìY¯\Û\à1\ë°6Áˆ!˜ŒBÊ©¥’:§ª\ê\êŠï½»\Ü÷^UcÁ $>Ÿ\İ#u…÷\ê¥û»\'\Üs\Ï=§<[V2Rª.‰\Æ\Ä\â\ì=\ÜG©PDC0tµC…,X„5t;9‰=p„Ù±a;\Æ@¾D\İÊ•¬Y»\ÃPi]”0‘ş³¨Ë¹\×\r„\Ê\Ûü\ëOş_ûö÷\ÈLNsV(\Îe\Ñ\Zbº\ç’\àHR‡{qjj8¶g!\Ëòº–Wb©—\0\Z]¦N£¡»\Í%@HFl‡#–\ÅÁ’5±­T\Û\çˆã£º±«d~\\WS÷o·\í}ùÏª¡ÿYw¿\ã\ÊOjû{w.2=öõKÂ¡FS( û‹#¶*û§7¼†õ_…?~¬½\î\0I)™pT‰ùZ¡“´K¼˜M³»8K\Çüy\Üò7ò—W\\™i¤]b.©Fs$H\Çar|’É‘Q†ô’\Z¥:h…TG\n)\ås$³9l!VW\Ó\Ø\ÕIÛ‚\ê\ê\ë\\\îsAğ€ó9\Ò}²@˜ÁL›nùŸx† eqY´†E0¦+eğ[†ôB\0\0BIDAT:ª«zf£a\Æg³´J\Ôl¿\Û^{\è@—i\Ğh\ê>\Ç\Î:’\í…\"ı–½Ïˆ\Æ\ÄcU/Ml©Š×¤\Î_<µ~\ÕyC\Şv\Ã	]OäƒŸú\'yöÕ™LúG\ï\ê5¡©‰%\Û!\'Uò$Gª\Ü9I\Çu«••‰¯\nÀ\Ô\í\ÙºoP\Ú%´	\0*²z[.Í¦\\\Z\'\àşöz>÷\á\Òh¢Æ›nC	Q¶ö|‘`\Ù6\ã ›T2E©X\î\0\rMõjõ”\ĞüŒ~\×ò­c@z\Ï„ +5Ù²“[nı>½½}tA.ŒVS§›x%{\Ë34*CXH;Q!hš¯f¼\Îb\"\è2uš@\Ô(8O\æ\Ç\'5ı¡¦ú¶Ÿ[viÏ’\î•N\"Zc}ô·\ß\á?£?\àß®ú¯±—_}şúN\Çş\çóB\îŠ\á6˜o<\È;‡\nE¦‰·PŸ½VwQõÄ\ç–\ÊI‡\ãM£P\éG*\Ù\à¡b–\çgÓ¤Á»/¹ù\âM,mk„\Ü\Øœ\ã“\Çòêš¶csh\à(\Ãc\ÓH”u+–P•­Pğ\ï^\Úiu¿\Ê3s|z†Ÿ>ğ?º\ënJ©Î‹$XŒ\Ö*D©¤¤¤ÃŒ»5Ä…\æ/J\Å}Õ€ù¦I‡©«k\r\ï)Yl-Z¿mhhû\Êmû_\î\å$\é„E\Î\í\ÙY¼vÕ¹™£S£‹X\Ğt5õu£ğ[\Ã\Êó0e«µ^û*y¯À\êe\Ñ\n÷x\Ô\ÅsHŠ@\Â=¯\Ô\é&]£…\Û\æ\Åm;hŸ?Ÿ\ÎN\ÇFE{gõ\Î\év\Åb‘;\ï„\Û}¯\î9\Èş^\Zk,œ\ß^66„tb[ hY<³\ëÿı›\ßåSW°¸<V\Ë\Ò`˜€¿Xİ¯De»sAL \Ñ 4¢š†\æ‚\è\Ù	 B@\ÚMP\å74	¶€}¥²ª\î\Úö o^·Z\İ3\Ç{F\ÏmYX\Ègƒ%KO9NÍ„#I9*\r™)ÔºšJ;J\äúP‹¹«\Ú\Ï\İ\ë1´\Ø\ÒÒ¡\Î[…¬Ú–°¦³0BG°khŸ|Š’t/]F\"\Ë›e\éàµ–@°´©k\Ï9“÷mX\Çeg®¤»k¡pØ»ÿ¸¹Sf’¾‘q~xÿFnş\Ö\íög\æòX\rõ†\éƒQa›\ãH55—\Z\ÑIh\å\Ğ\áşS\ÊÑ»7¨\Ö4\"šÆ¥TKT\Ó²2º¹i[r\ìi\Ş½.\0ïš¿¼7W*l\rT\Õ\rNk\ÚÄ e=’/³­££¶l\Ğf¦\\GÓ¶M\î5=[‘ğÀ\ÏO\ç\ê!T’ ’óÁ^‚V3@T\Ó\é\Ïfxa\ëvzúX¶b\ÛÕ›$¡	B‘0‘x‚hMñšj\"ñ\ŞT^»úM}z\Ënºõ‡Ü»ñI\âE›\ËbÕœ©4Ô¢¤÷Ÿ0-%\ÕB#\á\"ûg\É\\—B%i¬\Ò4&m›‘’C‹©““’£…Ü¡\ïöşûKx.\í\r\è\r|~¤\Ïz551şgo×„x¨P*\Ü[(~¹şŒ~“•rO\ïLª.\"œöz\ÍÔ§¥\ÃLEL¬ª·ğ9…ŠB ¥*Ù›*? wI‚#@w \ÌD©À+‡z¸\ç\á\Äkj™¿p1\Ñ@\0·\ĞvECj†aš˜\0F0€—Ë“\î^Uv[\Ú\ì:x˜[~|\'ÿt\Ç/\Z\'_(ò\é\ê&ÚŒ\0º&¢î©¬&¼§™•’Y!i::®C\Ü\ï \Şó+\Ù*]\ÎÔ„ Z\×¶l2RbµºFŸ\ã\Ô;š|ü±Ş½cœ$½!=9°_¾0\Ò/·\'Ç}¹\çñ¾½\Ö%ó™-˜*\Î\î6ôD\ÚvT:O\ï\0¯-\İ0GŠ	Õ³R2+%u¢\ìö\Z\ÍıB\Ö4:!²¶C_f†\ç6¿\ÌÁ¾~.^Lkk\Ø\Ş\ê+Ï\æùG\Ë:­°041Á]=\ÆW~ğş´e;\ë\Ï\\\ËUïº”-\ÛwpN8®Šƒ\ï^\Ë\àHï‹€”TÓ¼@\r÷–Q\ÏW\æbu¤×¹cº`\È-¹(´\Z:GJ–JN¼¸#=¹Ÿ“¤7\ä‰\è…\á>ûº3ÎŸ\Zš¬«\Ã^o H9•\Ã%A\İ‘•£Hª#!©¾R\ã5\Zª\á\\\Ë\Ş³\0A¡‘u¦\â!º;\Ú\Ùü\Êv6>ı9[Òº`±X\İV\r\áŠD¼Ïš†`tjš‡~\ëÿù»<øô‹hRò…¿Ÿ¯ùf‚¡¿{ğ6„>e5\\\î‰Â½¹iTı\Çh\Å>\Í^½—Ç—å­³\Ò\Ë«r²\Ö\ë:³Ò¶F¹\åk\×şõö\ß\í|\á¤\Ä\ë[\àOR‹C‘q\ËšF\Òvp¤!\ŞÜŸß]Qëƒ\äL\áP+t\Â\r%D¹\×û\ÛÜ†¶Š”Z\êø\íÿü\Z\áR¾Á\î{ô	~ÿ\è\ã\á(\Íó;I44!‚!E¡(\"p”\é<ğ\Üfşñ»?\ä\ß\ÜOH\×x\ï\Ùkù\âuWó‹/¤µ{ûú} ƒš\æ\Ş\Ä\\`e0\é¨Rº\å\ÒI\ŞıK\æ\åJª˜§‚ÿkµZ¼\Î\ĞBŒA\'>ñX\ï\Şr\Ã7A\'Œ8RjD¥€ö¶U\î§,\Ü$øFN\Éõ\ì… F¹\Ã*V\æj¼\Ïü ))¨­¯\ã\ã—]À«–ñÇ—¶ó«§^\à«\ßú÷=ü(ù\à5|\èš÷RWSD’N\ÏğÀ<\É=<\Ì+¯\îb6“a\ÃÒ…üıµï¡»µ™P0€\Ğu˜šŠ´“şw\Ü\çğD¦\×!½\ê\Ò\Ò{J\á\İse+\àvJü\í\ÜY\r•±DGP¥i8ÒMNOúñRo–NHµOC­ŒR (U9÷A¼FÂ‡J–w°”#iy©\nUSyù†=\á\ì?h1„ a˜\İmM\ÜøWò‘K\Ï\å\Û÷>Â®\Şnø\Òÿ\à‹·|‹y­-!868L6—£©:Áº\Î>õ\î‹X\Ó5\ßw”bQ´€\éûvoŸœ\ÈıºtUuµ\"\à%*0ôº¯rS\"\\‘¨ØD 	\npó\Ç\çf[ö\íM¼şOL§\äs7}_ûÁ/¿­E+ÀQ–Y\ÙÀğR~IğÅ£@%¼o\ÔtÆ¥Í„¼”Ï’õƒ¾1-—-ÀŒD)Íªå‚5U|\ã“\×qğ\Ø\Ï\í\ŞÏ\ÃNN\â\0]Mõ\\¸r	g-Y\È\ê®ùD‚&\Ş\ì\r´@€Hu\rH¨®ª¢¾®–‰É©7¾	—fl›¢tó\â¸b\Õ\Ë\'‰»T½lrI—…k\İü|\Âvz­‡\âM\Ğ)9šhšv^Th\\7•;A‰\çöDM™\Ë\Ê\0\Z„NÉ€ó[\çXµ„`$\ÊŞ½{‰…L\Ìsg\ë+”Àª¥K&ªhX±š©}»\Èg˜¡€Éš®ù¬\èhg¶P \è\æ\Î34x$„\é‰O@J7Ù“®S\Û\ÜD0¢mX·–?\Üù\Æ&&ıû,$§Hõö²i\ïŠõm\\w\İuj™’£›^a\Ë/\î,wd÷]¸=\×ÁkµSŠò!1\rZLÁdK¼.\Ë\ä0\'C§\ä\ÔôD­®kUš kË²óXw)«ò=ôŒ\0‰\ÏAuh„\ãq®¿\á\ïXt\Î\Ù\ÜtÓ\\û\Îó¹\â«óI\0é‚ ®!\0³º£³‹\Ôğ3SIGE»†N•©€ñZV©8P\00©ij\"^W\ë‹\Ô`0À9\ëÖº¢OQv|Œ±º‰Hˆ\Ã9.¼\ä\ÔU+\ÃŞ†&¶\Şs/v¶€!¼.+\ç<\Òk\0ÿ\Ş¸\rºN‡©£»\Âa°d\r3¼}q\×ò$_\ádè”€tp41W€\0(\é\ïYz®øò\Ì#t„$`||’{~»‘p*\Î\Î\Şş\ê\Ú*J–¥¼=ş:…‚¬\è\ÙfĞ¤¦¥•HU5©±Qrn‘\ß	^¾#u]$š®‰Ç©mn\"©se3\êÄ±*\Ç\×ù\Â>Í²©?\ÅM&Ñ’\"FŠ\èuM³<™!Áÿ(\äÏ†*€\Öj\è4š*G€D¹8\ÙvF\éO·7\ÏOr’tJ@\"„;%	5~²+ô£:LƒÎ A\Òr8\\,‘‘\ÒwwşCVIÁ¡\ç\æpb-Å™Y\â;?ü)ó;\ÚYµt	K-dş¼vš\Z\ê}^QE¥ÿŒÄ£„cd3³¤\ÇÇ±òl¯Úè†i˜Q¢U\Õ‚<\å-\àXI!òYd¢\n\âEµKT\è#]\n³cx1¡ôy`:EK\É`u\"TG5…\Í\ÔÕ‚\á ‚¸¦Qk(/zx)\Ë\æ¥B!\roÿ\Ì5Ÿıı\ë\Í9¾\ZP]Ÿ3…\Ë1!!h5Uz‘j]0\Ï4\è)Z\Øz…½BBL£\Í&©›œ¹j9\çu&ûfË]lŞº‰©i–tw±¸«“K\Î?‡ym-`˜`—ğôq4#P\Ì\ç±-e\Ş4\ÓÀ\\\İVq\ïH¸\Ü.\\SD\n¤8\ä`ÿQ|\ìY|i;\Æò«FÀ\ç:µt^}ñÄ±@\Å:5:í¦®\"\\U\"¼a\rP’‚A\Ëbg©˜\ÎBÿ¾fÉ™¿¸ğ¶Şœ\Å÷\Z:E M5S£U,ŒqA	_²\nAL\Ó		[%\ÖóyVnH\å¤F‰F#˜¦I[K3­-\Í\\t\Şfs9’\É4\Ïo~‰£CC\Üğ•[hin\àKq\Î\âùÄ£a¢\áU±š¦ŠF\İkxS^.PR+\ä‘R’\É\æ°‡BÁ\ÂòºIQ0>\ÕC2¦w\à(\Ã\Ã#LôpÎ’.:ZZHGª(›l#—Æ˜™¬H\0X–¬B\íQ%UTCQ:L\Ø\Ò\ÙW²\ÒSˆ-Ñª†»;\ë[hml?i‘\ê\Ñ)„óHqxÆ±×·\è\ZAMPt\×òy\ÎaÕ„\ê\Ñš*\â…oY€‡©@\İL³5…\r\é)\È\Äº©T‡ƒTGšYp\íûA@f6Ë–\í;\é9\ÒË|Sƒ®ö>xù\Å\Ä\ÂáŠ‰b@HÆ§S<±y+ƒc“H	\ÑP€\É\ÔPn;4\íú‰\ëê©­®æŒ•+¸\â\ìw\Z=©\ë<²»—pMM±\0º\Ç\Ø}„3S5÷\ã?±!\ë\Ş\Â\îb‘\"`KÉ”\ãL¤„\Ö\Ç\î\îhl{¦«½{û§şğ#Ø¼‘·J§d}M\ãT\Ñ*\ìN›jb«®s\Øq”\è•e©\Â_½!˜³\Ïe\\\În°ó˜ƒ•…™¤ò{\r<w™\Û5bh\\º¼‹KWtQÈ\Ït2\rB2²¤´±K%ò\ÙY\Ç&ù\ß?Á\Ê%]¬_µŒšx”P @0 j†D\"t]#\Z‰`\è¦kHHr\é†&†‘\Æ2³|ù\Ús\Øp\æ\"tM\Ëd¸ıgO¡\Í÷u\nÔ¸\ĞF¬¥ÉŒ\ã°_$\Z\ë\Ù\ÕÛc\è-\Ñ\Äß¯]¸|\Ç\ÍOİ—\æ•\'8U:% ¯øÑ—\Ï/\\=4<3E^š4™\ÊSr´d‘“*˜(mCû”9GRpÊ¶«ğ_I)hkmb\Ï\è\03³³j§#[MU+&•z‚¦FsC5\0-INM039\Ål>\Ï\ÖC½<¾s7~ü:\Î^\ã¯BC™hj,\è\éIi[Ho9½\î\á\äs`ÿ±\ã47\Ôñ\á‹W	GHMNò»İ†5p„zQa¹¨\Ó5¢º`_¡„.U¾\"\ÆÕŸù¿ş\ÒWIOe–V\å²\é\ß\ëyİ¼9\'Kšÿ­\Ñ\Ê\î5Ï¤y`Ø¶@£¡³8 \Å\Ğ!K7R¸\ë,\Ïi\à\Û	(½\â‡y\İ]„¢1¦g2`ixl¢¬H/ô\ÊV¿\Ğµ-\ÍT56P2&l‡/}şœµz…:•\Û{”\ßñA%%\Êm&\ãS\Ì\å\0Á¦ı‡Y±j%‘p”|6Ë½\ßş.\Ï\İs/uR¨\Ôd\Ê\ÉP£+\ë½FS	«u|.G<\Z¡£­€\Å\ÍóT\Ï;MtJ	PS]<Q\×zÇ¶\é\ÑOI8£\Í\Ğ5µ(\Æ\Ä1%\å€A\Úv|\İ\Òõ»Jn}4\ê:»il\ë\à\Å{¸x\İ\Z·¡\Ëh{\r¬X˜Š\Ş Pe&š©j¬g\Å\ê•M³\ÌùŞ±\Şñ>ù\'\×j\ÛÙ™4\É\Ì,[{úøÆ_Â²J<y\ç¯y\î®_Sg9Ä¼\è©7t˜!]#c9,h˜Bå½­ml ¦¡ª*5PiLÔ®\á4\Ñ)s\ä\Ç\îù\ÆcT7\ÜşB±°\çù|m…\"{K%r@D]¨†³\Ë*ğxJY’P4C|\ïşÍ¼td†\Ç^\ÚEÉ²\Ë`¹Ÿùü]oŸ;ˆ¨ÖºA0`Î¹’¤/¢İƒ…Às\Ó{T\Èf±òEvôE¯ªcÕªU\ìzúYºıª-‡˜¦&T\î8¥A“S©füC\î\ÔVŸUbŞ¢Nš\ç·\ÓÚ¤’9I)O\Ú1şFt\Ê@|kûSSKº—\ß7£n~9›Ú”\ÏóŠUb\Ì\Õ7\îg)“U\Z>¦˜¥»÷ô0’rh8\åç–«°>\Ü\ïTp#s<\'\Şnp¹\ïw\å\á¹\rË€J\ÔJh\é_Ë±%³\É4™\\¯\ìd6:Ÿ¿ûÙ³\Üñ/\ßGNM«¢6j4\åA“\Å“\Z\İM\Z(\Ôd±m›\İ\àü÷¼‹ª\ÚZ&§ı\Æ[\Z/¾ şv\ã/³z63\Õü©qbMõ\î\nMJª4\×ó/A74\Âm¸ ‚ˆth\ì•ˆ”˜MK¸\íW÷1=3‹\í\ØLM“\Ï¼q{YT¢8QmòXUºoû¬,•è””‘\Ç\â\îdSi2\Ó\Ó<¿û\0OI2F#ûºÜm\Ô!Í¦`e(@•®r+\Õó9@¿e³¥d³ø¢s¸\à}\ïFh‚q\×o9ö>N#²¬¤®Æ¶üD:9”ši\ï¡+B\ZO\njZw\á,TpT\Ñ\×5šNn¢³¡\Î2::Ä¯~ö[Bš\Î\àÀq.¹òb.z\×ùøóaR‚\ç5Q—\0d>Â¿HÙ™\ßy¤ô)ßÔ°­\"\É\Ñ1ú‡Gù\Å\ÏS»\è<Œpœšİ’\Z!!\Ğ5AŸ\í\Ğ.%¯#¸§\ÈI\Éşb‰ƒ\Òañ¹\ëø/_ø+<:>¤f5ö\rö¾¹	\Ï7I§\È\ÅM²…b\ÏP*;\ÓN<\Ê\Ñ|‰U¨Pn¸¥A“ı…)\ÛÁ«)\ëAC0OJ\Æ\Óc\äQS@›}Mh4µ5\Ñ\Ñ9\ÏgG\Â¶t\Éu“y`xk—!	„Ñ¸r\íÍ¤ğ¼?‰m™\Z\Z¡÷ø ?~ôYT7. œ\Z!’\ËP/õ†\Æ\æbê€ ò\ÈM\Ø6½–\Í1\é¨Nğ\î«.\æÊ^K¤¥!}ÇS(1u#?5›ò\ÓXŸ:­@Õ¹,³oğ\È\Ö;\Õ1¬NÍ°\Üt\Ë\Ê\"ÑeAƒq\ËfGÁb»‚5ºT\ìtƒ”—_¶ö\í>7¹<…\Ï	¦²rJu\ß\É.ƒˆD\r˜„e!ó9(\å‰t$\Ó\Ã\Ãô\éã›¿\ÛÈ\\‚D\×Y\á™IBHºLƒ}–EIJ™†òT¡<7/\n´¶7±~\åbÖ¬[\Í\ÚÖ£\Çc^0\Ã##8¤!^34¿®%¿ù\È.NV ;j›2\ÃÉ‰ƒRJ´ªg¬XÍ¶C/Yt›†{1‰!Í¦°,¦,‡¶E\İÔ´´`K\È\äTùúPUœº´®^Ã®Cû¹\ëÉ‡i˜\ßÊ¥g­%P>nÀ	~+÷­¬\"5%ƒaˆ×€©øH\n\r\Üw\Çv˜\æ\Õ\İø\á#bş†K¹\ì!595ô\Ø8¥~• w\Ê\Ír2\Ï02\Ã\Şb‰=\Ù¢Õ\\xñz\âu5hº†BU\ä\ÅqÂ\àĞ‚†\Ö\ìÿ³@~\ê\ç·8+Ûº{K&g2\Õı\åˆF\ÃlúıF’¹<‹Lƒ\ZM¸\î,Á™f€)\Û!Q]\Ãuÿx3ó–/\åÀp’\\¡4\ÇPm^½šª\æf¾~\×\Ïù\ÓKÛ¸\æ’ó9{õ2¦	¸‰*\Üs\âu<òt \Ç\'\ê:~u@(Š<\Ğ\ÃCO¿Àcûû¸ğ\ê\ë¸ü\ê÷«u“R™R¯ìª¥É¸cSBå¸³ŠH©Ä«.@\ZØ²\ë?p\ró\ç0@3}‰\Ş\Û\Ûqˆ\ãİ\í~BÀ\ÓA§y\"ú\Ğ\Ù\ï\n\ì>\Şó’c\×^~\é\\~õ•T57²£§—\É)FlIH¨ğÁˆ&¨\Ñuzg\ëó/rüÀ!D0D°¦¡«\ÒÀT\Î],[¹†=}\Üy\ï\ïÙ¾w?š&\èhmV!@ºzPP©Ae0Uµ\İ\í·B¨?\Çf°¯—Ÿ\Ş}?ß¿÷ŒjQ>ò\×7²\î\Üó	˜¦²]\Ëij Ÿ£[^¡`\Û\Ğ\Ô\Èòs60t°‡.\Ó\Ä‚Y©ª\×fJ%j«t¶µQ]_ˆ\'T„”\Üó\ày\å\Õ]„Lóñn¸òñû·=uÚ† §•#\ÎY¸\êĞŸ¾\"76\Ö=84Lp\Ãz.º\æ\nÖ¿\Ûoù_<õÄ‹L\×U\ã\Ìd0%4J&8Šş‡¨jmc\Í®e\Õû\ß\ï\ÊG	Bcş\Ân>w\Ã\ÍLü\Ó<ô»»ù\æ\İùòÍ²yÍ¼c\é\"\Ö.[HU4F8h\âG(&Äªad\Ò\Çzd|‚#}l\Úö*=ı\Ç\é\è^\ÂÇ¾xK–­T\é\Ô\\µ\ëP… i\É2ò†N¦X`Õºõ¬»\æ=üê¥—\Ù?3C§¡³\Ì4˜v‚$t“\İO¼\Ìş?m\åú/ı\r\ç~\è/Rb\Ù6#£H)NNŒ\r\ã´r\äiò#?ùj&ŠLeòY`;º¦¡…#\ìI§oª\ã\Û\ßıWÒ£cÌ¦RX–E\ïQf3Y¬|lrZ­B\î\ë­\à,©DœP3ıõ|ú7\Ír\ä\Ğ~ú÷°\ã\È!şp\×\Ã8\Å¦¨˜WÑ¼™µ%‰\âhót±tÃ¥¼÷\Ë\é\è\ìT=”óÁU\ê`¨\ï^Hİ¢E\íÜ‰‹\Ó~\ÆZ.ÿô\'øã­·qÌ²Ñ…Z™e\0\ÇaõºU,]»\Ê?\×t2E2F\×4+\ZŒä¯½ã‹¯mºS¢\Ó$À\êy\İ;6õ\ìºjû\Î\İ‹%B\á …’Å®\Ãıh‹.\à\ç\É6&œˆKD>ƒYWƒ\Ï0tª\"\Ê\Â\Õ\êª9\Ğ7DmU\Ó\Ô04Mt]C\n¡\Ì`ˆ\å«\Ï`\Õ\ÚwP,\ä\Édf±ŠE,Û•Xr.\0ºaGG£n>º\neŒœ;l©Ø®\ç~\æ³<u\ë­¡%\Í\àª\ÏH\"\Î\Ş6„\Ö\î…4uuò±\ë?Ç»\ÏXJM{›:“L%“$S)‚F »¸¹clk\ßiõ¼=@®l[øô¦]_Ş½\ï\0Å’r6—\ã\à‘>\Ú\Ïü›fü¶rF±P^¼Š»oÀ\ç*C×¨‰‡1Mƒúš\0uUQLC#4©ŠG\\)(tBÁ\0Ê·¢\Z„[®$!Ÿµ™Î¦©4Š\Ê$(Y6\Ù|¯ ª†ò9Z~òoH´4qø\Ø8‚&\Öô¬ÿ\è\'¢Aİ±H|\ã\ë¼zøE)ºÏNÏÉ kzzyk\×\Ğÿ@;¾ ÿ\Ø ³\Ù,‰xŒ\ãCh\á8fUCù‡\ÒAr”\ëñª\é)o¥cY6\ã\ÉY04ª8¾„÷)`ª¼sj:J0\rÆ›°\é<\ÓR€m9\äŠE÷ôÂŸq‘@0`\Ø7®\ï%\Ş\ÔBb\áJÿØ°©\Ñ3Õ­ŒN¥±¤$ˆ\n\ÒN\Íd˜\É\Ìd;j›\Ş\\ôóI\Ğ\Û\ä±\É\Ñlc¢¶,=µ`×¾ı´67’\ÍeÑŒ€2>p­	©\â\Ô¼6t\r¿Q½P7JFP1\r\æı¨\ØV²l5k¢~<÷w½\ŞöRY<Kfsb\Úl@Í¨ó¸ºi3Q\n0œ\Âr\Ü\ä\Ä&¦¦˜œšFZòŒ\Åı\'¸\Ğ)\ÑisšW\Òú®VS¢vÀı‡^³×›–˜ºF]U\Ô\İ\n\î%”Î’\å¸\ÔJ·œÏ$\å\è´‘”û\İ\áÇ‰~ÿú\ĞJü©/Â±9Á\ïWÀ\Øô´;f\ÛqŸ˜Â²mJ¶UL„\ã§\Õ=o\ë:WX¶\ãlØ¹g?J<U<°û.”„\î0\æ´\âk\ÚXx½¿œ;{xb\0Äœ¾QI’2ûû\İÁ\Å•g.\0	Aµdo\î	\Ô!Uù\n\Í\r­´m‡¡Qµ\Ù\Ğôü\å·ş·\Ó6~ô\èm­7ı\æV\Ç4ŒšĞœı‡k\é™†n ‹UM!,ªT\å“Ã…6\n\ÅÂŸ\ÇkB\Ër˜\É(Y%fsnµ½²üõ²Œ²¨\à`oŸ”®şÛ±*õVTp\Ò\åB\Ó0«\ë\ÔúK€JKWªc[[š0]\İl\Û6n¥ 5ó\Ú\Ú\Ò’ÿSz[€X\ÔØ‘<65:•J\Ï\Ô÷\Ğ\ÑŞŠ•\ËğÁe1\Ş{E§ÿ;\Ë\ê \çhC“¯\Ò\é8¹B	\Ûv(JdóE¦Ò³d²y’3’3Yf³M\Ï¨’ü¦ö_\Ôºxı\ã\Äk! ˆ\Úf\å«=•2“„Mx£Ñ’esx`\0€ö\Ú\Æıoÿ®‚\0şl‘»&\0\0\0\0IEND®B`‚','image/png','axelle-transparent.png','Marguerite','','',0,0),(11,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\nÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0€\0n\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0£$„\æµô¯\êZÕº\Î$‚\Öû­9 °õ\0•\Ôø/\áôó´wú\Ø	C­¶~fô\İ\Øjô\Èl\í\á#\â\çÿ\0\Õ@WağÈ°:³$£º\Û\Äõ$ÿ\0*\é´ÿ\0…¾µ¤µ¸ºn¹cü†v@$F€{Lœ°2}\è>\ÛÃ³]¶ú.›¿\ÙÔŸÌŠ.4m\äl›J°a\ïn¿\áR:¶\âJ:t€0/¾ø^\èıŸ\ä1\ïŒ¿¦qúW%®ü\"†H\Øèº‹#‘Ü®G\Óp\éùW¥lö8ñ •¼Y\á}_Ã²\ãU³’(\É\Â\Ì>h\Û\è\İ?­rW,\ÅHvúWÚ·å¬–÷\Ç<\r­‹¹Xzk\Ã~%ü&û<Sj^¤·4¶C\æd\Êwa\íÖ€<EmR`wuª\ËÁp½\ri\0È¥H ô5›t®\\@^\êaŠ\âüb\Ã\íkƒ[\Z}Ë¢`š\æ|Jå®‡4ön—ñ/M G+aÔƒZ\ï\ã½eM“+yÁ\æ¾_ñFk<š†›s\'–Fd€œ\êFk“mWUK“±ó‰\îƒ|(\î+]b\Ş\â1¶\á\ê«±4, ´ËŸsÖ¾´ñgˆl›LŠ§q]>ñG\Ä\Ò8\Û\'½Ã•ş”õólşSô4\ÔO›\æ¯Ÿ4ÿ\0üB’ l\í4{õ\Çü±»BO\æE]üs¦Œ\ê^¹1­\İü·P¼A\ÍGp\Ñ\àqÉ¯	O–ğ¾\İWF¿´\çø£şy\Çò®‹Jø\Ë\áDªµ\Ú\ÄÇ \íü\ÉÀ LVÁ;{Ô‹¸7\0ô®n\Ç\Å\Z=\â·¾‹™nÒµE\ÊHP¬ªAür(Ï¾\'ü3ƒ^Iµ=	#·Õ°Y\á\è“ÿ\0ƒ{ô=ık\æHKis5½\Ìoñ1GG*A\ä_oüÍ†>\à×œü[økk\â\ëF¿°\Ûk‘¯F\àŠşşø:\0|\Íe \İÁ¬/¸k‘[ó[\\é·“Z_@ğ\\\Â\Å7*k˜\×u\Í\0{\Õ\Ìh \'@W>™«¶¾·\Ñt‹x¡|ò|ò\ÊÀ\Ì{J†8\å–\áD1¼ŒpªI\Åz¶¡d²h–“p§h\àc\Ğœ\Ğj>I£udùÒ¸½_\Âê„”ùI=g…{¤¶\"L\åx\Îz\ÕuÑ\Ç+˜P\0\ï\éœ\Ğ\Ï¡_Á–³7*{;pZV>%ñŠ€Á¨^\\ğÏ¼{õ½‰¬-<\áHşn2Û‡ôª\èq<Ñ¢¢\Ò37\'ÀGñ_„Õ¬,o\â\è|øO\åŠlş6ğ^¯Ÿ\í\Ç²\Ù\ÊPÀVóøf\Ù\ì°\è€\î~Hÿ\0hœ~µ\È\ê^]ÍµÓƒ\È¥\0]†\ÏÁ\×M¿\Ã\Ş\'Ô´iOü³ºBWé•­½<ø÷HQ&g®\Û\Ñf±\î¼\ç^iá»«f%@e\Ï8\íU\í…Õ…\È\Úò\Ã\"wV#ò\"€=«MøÑ©iw¹e-¬ŠpVxˆı@ÿ\0\Ùk\Ó<3ñ{\Ãú¶Ø§™!fX¿‰\è+Á¬5\ÍNM(¶¡s\ì*¥¼›\èV`@<Š\ç®5\n_\ÓiWš]\Æ\ÖXÍ¹sëµº}\0}9ñÀú7¬EÕ¤\ÑÁ©ª~\æ\é~ea\Ô+\ã¨÷\ê?Jù\ÅVW:f·ucz›.m\Ü\Ç\"ú•v¾ñ\åÏ‡%’;[›‹»pHQ*$v\è\Ù­r6\Ö\äñ‰/uY\âH¤¸`v\'@…^”ôW‡MÀI&µ\êÒ¤m\ÆN\ŞIúv¯H¶¹†\ãA™c yaO<ñşs^g\àkÍ·\ÓY9ÿ\0€?\ß\\ÿ\0Bk¢\Ó\Öö\íO\í2Û¬ª‘‚ppT1é“Ÿ\Ä\Ğ\ÙdŠ5\r3/\0±\Ï8õõ5\Ç\êş=Õ®\Ä~\Ñ÷\Å\Ú$Nd \à•\0~5\Ô>Õ¾	—z\ä\í\npzú\ÒÁ\áˆ\äR¶R,J+“\Ïø~9 5ûÄº¤¤\ß\Ä#o0\"C\å¢\È\Ê@;ˆS•\ë\ê\Z\ì|h\çPš)~\à8\ÎsÏ±­\Û\Çh\í<ƒ\æ19\Æt¾\Ò\í\á¼,¨q\Éoz\0ñ?\é«­Î–¥•;ˆû\×jšõ¿›g\nN\Ä8u*¬\Ê\ÃzÆ¾£ñ†\"»¿{ˆ#Em˜#{¯\ë\\|¾Š4\İ8brW8Áõ \n–\æûrV\Ç\ËglĞ•Ñ‡øVf£§‰YdeÄ„t½\Êÿ\0\Ã\Åw#À…:Ÿz\áu½0[I’€’v½½(‹\Ôtù\î¬m­­X Œ1‡Cß•cjúlz~™4H ¼RG™\ä’?\ÈWs¨ı¦\È\Ø5¨)¥+\'Ë’F8ü?Â¹Ïˆ®¶\æ+eû÷nz(]«ú\ïı(ŠG+øUi\Î_5aGZo½@ógöF\Ş\ä\Ë){gŸÒ½Š\áw™nŠR\åùepT\ã\Ôb¾~–\äk\Ò|-\ã[y´»M.m\íz@·Œ£¡\Ï\Ğ@*\Êb-8#Òµt	Ä²³‚Üs\í\\õÌŒ±²rÄœñ\ßü\â¥\Ğ\î;i\' U,sÚ€7¼I¨­õı¶Œc‰\È3\Éè½‡\Ôâº¿\nı\İZ`B±Á>•æº–Ÿ3\é\ÇÊ‘’ñ\Îö•z†\íùt®6-k\Ä\Úu¾y¯!\ÏBºş@H\ë(—l)1\É\Îh—­-¼ö—G7V\ÎQ·¼;¥y^{\ãıZú\'´d²³#Ÿ;\ær¾¬z;\nõe\ÓBn·‘2 \Éş1\êhœñ2\Éû¬?\ã\\N»§³`²\çw?JômnÑ¤L\Û`O¸`\ã9#ô¬\Ë\ëD‘Î¸\Ú8 :>’á¢»dKKT/\å\í;‰\Ï\ÌO`\0şµ\á~*\Ô\ÛV\Ö\î¯a]ğ‹ı\Ô(ü‡\çšö\ßx\ÊtMcB¶›÷s1µN7sùŒWh\nü_\â¯§\è—Ktša\å!ú\Æ\n\0\à3U\äu}¥ş\Í~&¸+ı¡¦Ù©\ë†iHü\0õ®»Nı—´\Ï,ÿ\0ix‚\îGÿ\0¦*Ôš\0ñ#/\'šĞ´¼]R\Ón5\r\Ñ\É+£\Ã9d\'¢\ã<÷¬\ËH>\Ó{9\Úü\Ç\Ğw­ÿ\0Š–/¬i–zÕ­š\Ç5„km;DI0?v\Øö{f€=Y®RB3\Ôfµ4¨Q´+¦\æÜƒ\ÅÀ?¥yv\â¶é¶·ñ°İ°o\\tn„W£xwS†{›p\ß\ë¢ÊŸ\å@.üq¤\é÷ıÊ£};gÿ\0­Zºf»\ámv\ÖMšœ°‚C?z\å5­N¿\ÛP¶]¯‡\ã¾\à\Ô\İ;\áOƒµ%\Å}sf\är±\\¦\îhÖ´½oFuUµ¾´‘T•qÚ§¼\Õ\í%\İ2®\æùx9\çü!ğ]\×÷\Òc¨{\Ì~‹Š¿ÿ\0n‘§\Úyº\\oœ‹\Î\î[Ÿrp(¬‚\ãÌ°¶”\à;(\È÷\èj†ªL¥!S´»c>Ş¦³ Ô”iqF„k‰—\Ç7x•´-	#¸\ÕZ\ŞP³9a—nUpx\'·¶E\0{<\Ú†<%esª®“m\ç©\ŞòlWv?\Ş<Œ“M\Ñü_}¨\ê\Â3§§\ÊW¼r8<\×7\à\rDxÿ\0Áztºš2][º¥\ÌL1\æH‹ß®q\ë]\å¼VVH9U#Ò€:·vW=Z_&U?t\Õ(µ‹U\Ê>µe5»6\àJ„ÿ\0½@øs\ÃriF\â\ë^…ÌŒ¤$wwbW#8>µr&{\Ş\Òi<û)P¨Œ¶U‰`G®\0üñÒ½+_Ó£±\×>\ÃsokªNCFŠ;€\íAÒ°¼K\áM2\Îú\î[k²\Î\È$1«\0¤\î\É\Æ8\Ï_|\ãŞ€<ƒ\\\Ó\æğ}ò}œ³i™1\Î÷r;Š\Úğ¦¿µ‘\ÖQû¬†R€ÿ\0«\ë.›­X\Üi:ª´)æ€‡t\ë†=½zõ¯6×´\Û\ï	j\áea,\'”•3¶D=(\é\Z\Ò\rb\Â)\Ô\\€P\àğ\ë\èj7ør÷r‰#¹Kaı\ŞI•xß‚¼yöF\ì|’sÁ\åkÒ¬ş*,_2H²c\Üt \×Cøo\r\Â\Ï-\Ò\\:òg—z\é®l\àµ<\í¾@¸^8_Â¼\Ñ~*Dì­•Á\êXñŠ\åümñT\İ[5®š¯\æ7Ë»ü=h_kñióÎ‘8,¥\È#¯«ÀÖ¼ƒÀšˆ#–\î\á˜\ÊÁ¤:™q\Æy95¿&™<ú£up\Ì\ÓyO\Í\Ğ`œ~uƒ\á½\"\ê\Æººµx÷Ç¶\'e\ÉV<‚=:}sÚ€>¨ğÇ™¢_\êW‚@\ÖóKo|¬ª@l“€HûÀz\ï‡e­\İ-ôS²†|;›n}F\Öf¼·\Ãw²\ë>–;™\ã2C\ÛK±Dj—)€2*Ÿ€<qy§¿Ù¯U–h€%H9+\ëŠ\0ö§ğ¦%¿²ôù”’\á‹c\Û$óQj\ßü)«²µş‡h\äs•_,şk‚kkA\Õíµ‹¹µuu#CZb€<Æ—V—zÜ‘›Y£š\Ş0eI¡g\ïg\Ğe}\ë5\íşÑ§²©V@U\Ôs\Î=}­\Ï\é­k\ã?P\Ôö¥¤€[>\ænŒI!F:ıÜ“\ÎN*­\ä\Ùó˜\âY\r²’ƒ\Ìû\Ädõ\ìú\Ğš\ß\é\Ñ\ÍpKÃ±\×,(û\ÜB;Ô’\Ão®Z®›¬B\Æ\Î5\\¡\îó\İO\'\às\ß+´»ehX¼(±’_Ì›†ÁSŸLs×¿Ò¼\Ó[ø—¦\èK5¶—o§t2»\ÛıJzò9c\ÇcS@i\ã/\r\İø_Y’8ˆ\È\à\ç*z\ZÃ’\êY˜‘\ïÒ»	|}s­¤\Ñø\Ä\Ñ\Ò$P±\Ñv\ã;O¨9y\éPiZ,ZÍ¡û	;”n\ØÍ†QŸN\ãŞ€9û8\ä¶K‚y¯A\Ó|;u\"½\ïd8Y\ÆC\Ğ\nM/ÀW÷\Ûm\â³spHÙ¸Çµ{Ç<>’ \êI\'5Ş‹#µş‡™ 5\×M\Â47›`À\äõ{g¥cøf\Ùõbu	d€‰$Ø®A\È$\àt\Æ=9<Úºï—+ı½mknœ¡Û‡l\àñ\É\éÒ¸}SRÿ\0„{\ÃA\ãh\ÅÌ¥–\\\á¤À\İ\'@0\0÷\ç¨e~!\ßx&\âH\'`÷3J\ì\ÙFs€€·¼\ç¯\×ØµO\Ø\ën\×Vr\Éh\è<Ä‰„a‡¶\nøõ\âŸ}Œ·9a(\Üs‘¼\çõşu÷VX[¬£c$q÷\à0Ûµ\0y¯ö—ˆ>jKpb–÷I—\"W·RÁG9\Üv	\Ï#Šô\rüK²\Ôôõ\Êú;\èúİ“\"G	\0*{«\Õ\0¨Ä®\ãi\0“\ïùş†¸[ÿ\0†mvú„vv’Kò·–\í	n3\ÕH\ã\Ûñ ÿ\Ù','image/jpeg','picasso.jpg','Pablo','','',2,0),(12,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0€\0\0\0\ç,N\0\0 \0IDATx^¬½wœ$eµÿÿ~ª«s÷LO;aól`3,\Ë.9g/\n˜#‚×¬\Ğ+*\\0 ($II,,›Ø…\Í;9OO\è\Ü\ÕUõüş¨\Ğ=³‰{¿¿³¯Ù®®z\âùœssP-ø_\ÒôÙ³nS@ªo©©V———³òÈ•\Äb1¤”!„°\ÒKÀ¾œt} ’R\â©EVùV=¥ôa\Êvòû\åw\ÒFGG\Ä\Ä.ByYUUUøı	£\ã£lİ¶‘øÈ›j0róIßºı\Ù\ßrµy\è\Z&“r¸S©c\ÏŞ«£\Ís\îV}şDuUGy”6óa5\Z°.\ìk\á\\Hû¹H–¤9Œ‰‡§ô³øÀº\çü94¼\Ò\ïRJ!ğ©*¡@²H”ªŠ\n\êkj	C`J„‰`llŒ±\Ñ8%ªª0…ü_\à9\\‚Rú\Âıoİ·õtmbô§±h\ä\è\åËô•—•!„T\Ëb‡„p®mùv¯0\í4XÀJ5©Üƒ\ê\Ïş÷…“4\éK@€X,FeE%±XŒ²²2¢\Ñ(¡Pˆ@ €ªªN\Ç)‹–‹\ÅH&\'¦%†ûN‰\ï\Ş\êk]¸t{\ï\îr‡«Ç¡\rĞ—\î_«¼~ë·\Ó3‰»\ëjk/_¶\Ü„@XZC$\ì\ëR6XLµ\ïY—V~®Mü\ä”e;Xª’´\Ô<NM3õahš†ªª!ğx<(Š‚¢(.\àSË’E-+£¶ºÖ£\ëzU¼¿{™¡ª¦/Z\Ù\Ü\ç¾;üşKOVJ\Ô\Ã%Rò¹ÿ¾Ë·\î\×_›ıqCmM\Ë\âE‹	…B-¤´À¡\È\0Qb\âœX\Ïp\í¶-\åÿk‰.\É\'\à\à\ZT,ú ¦n\Ê3]\×\É\år\är9²\Ù,º®\ãõzijj\Ú/ß\È\í€„P$Ì¢#Q]]S»m\ë{—uN,O¼_}wGÿÈiÕ±\Í^¯š:XY‡hWG÷\ÜÁw^<?=\Ğõ\í--µK/CU=X¶LÚ½·´FR\ì¤}1ù{ñ¦i\"„@³\Ù,\ã†\êñP^^N0t\Ë%ÀLeºa(ŠUv.gY\'/Xõt\Ó4Ğ´ù|\\.O.—£`\è“\ÊS…ª\êjD6—\Öw]\×dddˆ‰\Äc	P}±ŠXùñ\ÙÁ}µ?½\á\'Oœvö¹\Ûö/µH‡\è\Ì/ÿWõ\å_º\ê\Ã\í;®ôù}e^Ÿ}\í{AJ\"‘v\ÊR\0lB¤”d³YTU\Å\çó¡i\Z„\ÃaB¡\ËL‡L\Ód``€t6¶Ff³Yšššğz½Å„bª\0H‰ù|\Ê\ÊJR©ñxœªª*‚Á ¦i2::J6›%¯0ƒB¡0)ÿ\Ôö«ªŠ¯´\Î:\ÜX–\Ëe\é\î\î&Ÿ\ÏQ3ÿHœñqNš[\ÏIGL*«\é·Í\Ñ2~¨ü‡ƒd&Ş”\Z¾\Ô0¯?0‘\Î\å*ûzº\ÔT2\Éô\é3l‰TJ\ì¢\İ\Îd2$	¼^/!\Ùl–şş~‡@ @\"™d$>B\"‘pm»c\Ó\Æ:c“`\èRJ\Â\áğ~L4M“L&\Ã\à\à ccc2™\Ã##\èºN4\Z\Å\ï÷\Ç&¯iè†iZ•\Å\ç\É}p\îH\Ó$™H’J&I¥R\äóywš*X¥¤(\n±XŒªªj&&$G™;{Ÿy\â+2\\y\Ó\ì†\Êöƒf¶\éC\Ì÷¼Ÿ`q(1÷G\×^{ÿ¾-\\ºd	õõõv\ãœNö s¹===(ŠBEEeeeH)\é\í\í%•\Í‰D‡\Ã\Ä\ãq\n…ğ©^\"‘‘H„‰‰	‰R\ØL’VM~Ÿ\æ\æfü~?`Ip:&‘H0‘˜ÀEQğz½hšfi\ĞPß€)M†‡†‹ À~8˜@b»7¶À(–—VW[;Y£­§\0\n\ZhšF>Ÿg_û>L$µ\ÓZµ´}\â\Ç?½I•9ª>tP¯\îCyq2V«\Ş÷?¿<­o×¶‹.XijjFQJ³\Õ\Ü\éš‚t:M&›%“É\Í\åxU•D2‰¦i\är9\ÜDJL\Ó$—Ë‘N§]\æ:Ltxf˜U%‘\Ë\å$“\Íf\İ\á\Ğ4%†aPJH$“¦\ãAJŠ\å:t@pŠO\İ+)!§\å\Égsø|¾€d¥/\n\ìÜ¹“ÁÁA4]\Ã\ÔuR©\Ôô\Ì\Ä\èÌ“V¯L\Ïoªø\ï›n\Ì 3ğ!\0\ZŒ\×\ß\Û\Í\çÇ‡ú~\Õ6§­n\îœ9“L\ÚÁHQ\Ò\Ù\Ù|Cšh…\ãds9L\Ã1+&¦\é”#,¦	0¥\Ä\Äú+õ\0­d‚l.G6—cpxˆ\\>)%²„¯›ñ%M\Ô\nš«9n:$O\ÛVØšlc\ì\nB$q\Û\ê|*Š \Ğ\Ğ\Ğ@>Ÿ#•N\ã	—1{õem3Ä¿a\ç\æ=›\Ş~ù_ùT	|€\Æ4yIû\î·O«¯«˜3g.ª§˜EJI<gl|\ÜÒ’|L&CA\×\Ék\ZyM#—Ë»^°”¶÷F‰¦9…‰R]\â\ÄWNl5)Ş’M\Ó(¥ƒ3\Ú~r d‘\án:Y\Ú6p»)¬?¢PSSCUU\Õ!\Ç\"¯W¥ºº†P0\È\Ğ@R\Ëq\áG/şá²}\å\îo}ô¤ƒjFx>\ç?NNôu\Ü\ã÷È¦K\Ä\ëõ¢(‚@ €\Ç*3088Y‚I\Â\ÒÀş8\ÂpY\ì´\ë;—0\Ç1q\Î#\ç\Â\Äıt—Ü›DÒª£˜V\Úõ(H\'h+Ñ¸b\Ù)Jj²\Óx½*µÕµD£‘ƒ¬¥¤\ë:\Ù\\\Î\Îö\îİT}»\ê¯şf\ËÑ§>{ÿ\Õt\n\è nö\×\ŞÑ²\çù™MŒ7™~o¿½‰¤,ZÆ²e\Ë‡\Ã\0D£Q††‡0l J>(‡9\Òú3“˜kqWš\ÍI\Ïr\n)‚\ï”]&=›T†˜Z^-\á4¢@…\Äş\"v\Ò(Œ\'&H¥’\î\ÌB\é§\Ïç³ƒy‹\Æ\Ç\Çyÿı÷‰jş²òmz^{ºI%°0˜lJ\è \0\Ë+\Í`E\íµşò*U€™9+;1ò¥Ö–V·b!„Ûd:;\Õc=ugœN©^/ªÇƒ®\Ğ\rÅ¾\ï4)l\é¶K(\Õ\ÊRöºŒ—\Ò\Í\ëe\'N*15O±\Ø6sR½`™/Õ«\Ò\ÜXÏªe‹)„xò_¯\Ğ;8¦‰^\ĞĞµ“\æ\í\êBÁõuu”R4\Z%\"a\n\Õ\ßô£Ï¸\ã…\ßŞ ¯{\â~E“…\ê ´\ê¼K\ÊRÃ½Ïˆ\\ò\ØSO>Õš\Ä\Ò\Ã0H$ô\rL\Ê\ãj´x0«µ™N;\Öily;ö\ì¥w`ˆ¡ñ™l\é=Sö)-”\ÎøT\Æ~½°\ïY¥ÿ[ù]3;…~/µ±2jcQ¶Ncq\Ûlf\Í_€\Ç\ç h„;|ŒM\ì,:¥ø…B464\â·ó”\Î4ƒw\Ş~ÛŒ\'’}ÁX\Õg7¿ö\â‹†>@\'\\ö\åó{\Ş}ùÉ…\Ğ6w®{?N\Ç\Ñ\rLn²+\ï0R\nó\ç\Ì\àŠ‹\Ïg\îŒ‹I†A~d€AzGFieO\ï\0}#cY±Œ¥\ÅYnğÒ±fR} 3S´\nGC.c\ËB~\æ·NcfC--Õ•L«‰Q]!€P Zˆ”[.¼”ôğÛ¿>Â–{@€R¢(D\"\0RJ<eeeE011Á¦M\Ít^\ßÜ°dõgÿ}\Ï\í\ïq:,@¿ùÏ¡­ÿ\ÃKA\Å\\u\ÔQ+‰†#\î3M\Ó\è\î\î&›w¼DK¤S¬€cZ\Ê>~e\ËMS\Ë#Æ†ÀĞ‘€)MCb˜&™¼F|‚‘DŠ¾ø8C\ãtŒ’\Ótt\Ã@7$Rš\èºN\"›\Ã0l\Û$*%>Ÿ\×\Z¸UQğª*¿€W%\Z\ÑRcZMmM\rT•…	ù¼xŠPŠ,\Ñ\nª\êÁ\ãAŠ\ÅGù\í}°éƒ\Ö\Ø\ë\Ô\í´\Ã\ÖŞ€\×GSS@Àâ “\ÎğÆ›oš\á}­j\Ö\ÂÏ½şğ]û8v²t`\Ûú|ffıŒ„\Ã@¸\ìŒ?Y-„\ë `ş\Ì|òü³©,ZI;(-h`š€\Â\Ä#<\Â\Êôû¨*»õK	ºa2‘É‘\É\ç\É\äu£Àx*\Í#¯n`h|‚d6‡bkW}eŒ\Ö,#\àó\"\0Ÿ\×O4ä§ª,L,&\ä÷N\Ö@	E„\í‘\Ë6\Í\0˜:h9†]i®©ª\äœ\Åx*\Å\Ş\Î^&RZõ—’¢(®ö€\Í\áPˆ–\æf\åı>X5Şµ«ø¿t\â\åW©}ï¾¾Æƒ¬nij...ØŒ6¯\Ï¶›`\Ó[š¸\âc\ç\ÓXW\r+\è´ó‹|\ÆN­@‰e—^ri\Å?^ º,„¤°l¿iJ\Òy\Üó¯µÌVWU9uùœ\İ:Iš‹EÊ’)(	§>\'°“H\Èg!\Âq\ïf·6sùE\çq\Ãw¡\n¯a¥·P>€\Ûm\å\Ö\n\Z}}=f ¬ò©\Êów°\î5F‡(\Ñ\ß5Oñù?\İPY®D\"¤\0ÍŠIg2¤3i\nº1\ÙN\nˆF\Ã\\ñ\Ñóh›\ÕR\ì«\İhiš\ÏY<&B\n¤\í®9\æ2ÆU\0\Îxd´Š\Â)KÚ~•1škc¨¥£p²Zˆ‹š-\Â~fùõÂ­\Ïò\æK¥CGx}H3‹\Úfs\ÙùgòÀ?ş‰–/¸|prN\Õ ‡\Ú;;HdóCuóÿñ\Õ\ï\Ù/A	rO‚\×Xªg’M---H,\Ï\'“\É008\ÈD2n%Á¡\Íd!8\ç\ä\ãY4o6–	³DKq˜“\Ï\"\0p{\"l@¤]RQÒ­”n\0%öXmñ(T\Â1óf2½®\Òg\ÊúŒtÀ))×‰yd1h\Æ	\Ö­v\ê0l3Gq†¬©œWÉ¢¹³¬òlr\ëö#\ë~\Ğ\ï\Ç#„\é	ôƒ$t\é \0}öÿT]\×6\Ö\×S^i\"¥$N–\n\é@#QÁ	+—sÎ‰kğ( !Aä²¸Æº\ÄQú\Õf\Ğ$\Æ9\ì5\'K·°%ö8\àp\ÜDXa¯t\np™¯\Øe––e¥BºØ¸eeSv^»¶	«,ò©œMY¤”:-UU•L6\Ã\èè¨½\æd\İo¨Ÿ†Wõ™=[?õ\Ó\Û\ï*\ãtP€z\ß}uµ™M6\Æ*b\r\r²g\ßòù<^¯—P0H±_\ÅH£¢¼Œ3OXMY$\\|,740´m°\âJ¼\Ã[¤+ñRš8¦\Çy$pM u-„´vÊ“N­¼“Ê¶ËB²ô\Êò­­oš†4\nÅ²(NcÍœ\ŞÌš£–\àøÈ¦\Òiºzz¶f\ç!^¯—úú\Å\n]1ñA\è\ÜoŞ¬v¼ñÜ§\n…|h\Ï\î]lØ¸ø\È(ªj-¾…\Ãa\Ån¦­ñRNZu$m3Z-º’\êtY‚®a­^:qEQ\ÚKRNu‡\ìg\Ö0â˜™Rf8#¥TÚ¤å™„™(¹™µfK¤{¯¨ö\'¯:Šh8\\’\Ç\ÚÛ \ë:H\éN;	ššš\î\ëbßºm\å´@ÿ\êL‘\é\ïX­Ã§Çš\æ(‘Á£RYQ\êU1ÃªtŠ‡R+\ç¬W£ªŠk®„ƒXL)\äl÷\Úy\î4Y¸÷°\ï8y&?³¦d•¶\à`v¿ônq€·ó—ôÁ\Å\åÀ\ÅX¤eÁ˜<¯\é\äknl`\å\â…\Ø\Æv’\Ë-¥´Mœc‚%\Ñh„ª\Ê*&ölş8‡ ı\0’H\Âo_óœ7}\åS-GŸŠ\Ï ®®)­\ÕË‘‘wMÇ¡£—AyY”\"s-W\\8,‘&h\Z®/\íA©¢QJN’W+¡\Å\ÔR\ÑfrE¼˜WN{ÿL‡\Â\Å!¡ÀŞ¿\àŠ–” %¡€Ÿ…sgôû(¶ó \å\Ïë£¢¢‚ÁŞ®#>u\ë£\İ.´@§·F9û\ÓW\íù\Änù\ëœÚŠ9üıww½‚òòr\Ï\ç÷3\r•±rV/[Œ_UH\0W…,©U¡\åŠZ#„­\rX\éq¾\à~Š)uÁıû.mM)€)yIr\Ò\Ç\É0 Ÿ±„(U!+—,¢¡¦ªh5l’“®$Z¡À\Öm\ÛØ»¯İ”B\Ù6Ú³«86…}ù\Ä6€Ìšs>Ú¢x¼g\×\Õ7\à˜‡|>¤(ô˜VW\Ãô¦ \Øfw\îKM-À™A¶\Ò8ƒªS˜ë¦–h;\Ş8\Ú(ŠeILşN\Ã\0\ãt\0\Ü÷Ö¤g%_µBšH\á±\ÚW’¦,\Zf\æôfööô\ãô¬Eq\Öa%cc£tv÷è¡º¦§½Áè—Ÿ¹\å“gšK\èqP*‘˜O\'g\Ö\×Ö¹*·U¼\ÔÀ\Íln¢<\Zw\0²I\"Ÿµ\å\Çj¶´Õ§\ÈZK[„“FZ÷J\ÇGj\'S\"\î-\é\ä9”:”²°4}C@in\ËaH=´Ws¤\Òı_²|a›eöJ(B ªª«Y\Ò\Å\ëKU\Í<\âÁwyø \àÀa\0RTõ»±òIşlaG\0BZ\èüÙ­Àd\Évx#V §kL\Z9K\È5u6	7bòƒ©b]š§´R.\Ût šK‹3.Y$M•\æ,)G\Ğ6£•@À7¹> ‹\'GAHÓ—OŒVr:4@ŠG•¦iûûV#T_\é\îKS\ÚfX\0Mf’#\Ú¡\åÁ4\0Dq/)JŸÀıR”\ì\Ò^Ú“S\ï\0¯Ax@XŒõAH\à\Î.òH]/ö£DÂ‚\0-\r“s\Ú\09¦i¤ U\Ş4»ƒ\Ã\Ğ!’‚\ëF\Ç\Æ³7?\nğ«\Öl°#\Üe\Ñ05\åûI`‰\ÔrÖ±„”VŒ)Š“&S\ãš\Ò\Ùd§\\	S-\çd:ˆv\îOS\Ôõ\0L\Â}.M´LQo„°œ\"À«ª4\Õ\×N\Â\Ş4MR©ºi&\ÉTiJòü‡\0t\ç–Qş°eLğ…cò\ê}Ö \'€H4‚\êQ\Æ0L\â\ãI×†»Lv®aX\ËN“i”F8e\í7\î—*¤ 8\ÎPEö¿y`\ÌDIş*]v	¦´\æ\æ¦÷q\ÚgN©\Ø0\Ç\Î\Üş‡ªƒ!h4¯8q_!“zjxd\È}„¬,XmN¥\Ò<ü\ì‹tk\ŞOLP©§w@”¨ §ò\Ûòõ\ä~¾ª@\àL†–<;D\'\'a\æ\Ğ\Î\ß	˜JÔ¸\×\Å\"X1a\Ø\í—\î}­ ±s_g	\ì\àXJ¼ª\ÏN¥\Ø%+‡=Ğµ@_\\RÉ•K*\0x\äGŸ\×\Ô`0^0LÓŠ\0E\àõú\\¯JJ\É[¶ğ\Şö\İıZ»ÁRB.k}·T·³N…Ÿ\ì©!i\'*^Y‰$6À¥Œ›ryP’¢DD±\ît”}\ß}f1±˜×ª\Öm“–\ã“w–ù­2„L$Rô[wlA€/\à\'º¥˜¦‘SıÁ¢\ä„»¢\Z®kÉ¥{÷\è\Ù\\\Î\ç#>6j\ï\æ”i\Ù_E(®¤\Øö	˜ZM\ÓM :AMy˜H `)E÷\Z t²\Ì\İ\å¢	9i¾Ì­\"V%M°µ\È£DxœIŸ\"¾%%HÀ^\Ä.GšS\n\Ü=u\Ùpt’º«³\Û-I))5\àóÛ§\ï\ìú\r=U9s^‡¡\ÃT;k\áÆ½=»F\ÇFG\ëƒÁ ƒıı˜Ò–7i•§¬^É¢ù³- ì¦šÀx\"É«onâ…·7\Ò;<†a·\Ö\áYk]%-µU\ÔUÄ˜\ÕXC]Eõ\åD‚i°¥\Å.µ\Èd \èœ\ÑÀaK\ÑÄ‰’|ö<™Û\Ò<\ÖJ\íD:\ÃX*\Íx*K6_ }`ˆÁ±\Ã#Œ&\Èi0·¹+.ù(m³¦\ãQ=`|\"‰Ï§R\ĞtWL É\ÏkC!R™º¡›ÀaB Ê™ó\ß\Ùş\Ï†\Æ&\Æ\ë\Z\Z‹ª.BZ\ëógŸ´\Úòó±M€”Œ%’<ø\äs¼ô\Öz\n…ı7² sp”\ÎÁQ\0 6VFkMÍµ•,hmd^Sƒ\Èdü¨Š\â\ÖSJEM80%2R™õU\ÖşçŒ%3ôŒ\Ó¥gh”®\áQF&’\'’\äòû¯©YuIvu÷ó?÷<\Ä»€•‹ Á\éÇ­\"\Íñ\ÏW×’Je]}\Õtt:\ß\ïG/è˜†®ıùg&ö+|\n®_\0,>ş´WƒZ\æøÅ‹\Ó\Û\ßkY$~¿+.¾€sN\\\í6D\0ƒñ1~s\Ï\ßØ¹·İ°§Ù¥\Ä\0\Ót%X\Ê}°[\"¤µ\0ğy	ù}4\×Tp\Ò\Òlİ½‡··\î\â\Ê\Î\à½=\í|\é¢3Q“§¨`\ÂrqF\Çyó½„ü~E0§µ‰=t°§wˆx\"…¦tƒ‚aXú…cŠ~\ÕC\Ø\ç%ôQ\æ÷#„`<—c<\'‹ò\İ/_AsC (4¶\ì\Ø\Ë\íyˆ±‰„+N~{—Ï»6 …*ÿ½ñÅ§N\á0tX\r¨lmû\ÓĞ–×O\çŠû¼…,j›\Í1Ë°=&I)\èfzE„9f¸é¥„‚i’\Ìk.0\ÙB´¦3‘\Ë3šÎ‘\Ñ\n\èXÛ¯²9LNcx\"\ÅH\"\ÍiK\Ûx\î\r¼²ñ=’™İƒqf4\ÔÚ…\Ãş²fIÀ\Ş\ŞAşğ\Ä?)…X\Ö6‹—7leKg?k\ß\ßS\Ìc›;Kp¬Ù€ªR\nP_¦.¢:\Z¤9¥\"è·—\ï­jG’Y\Şˆó\Î\ë¨>\ç‚Á ^¯—¹Ó›i™Vg{\Ä\Zc…ƒCƒ¤\Ó)j\ÚV¾Ê‡ P¼}û+¹\\\ŞKd•´\á\'g(\äM•\ì¾,‰\Ö2<‘!‘\Ñ(Š0\è\Ù<…\\¡8½!Q/>U¥\êÚ¿jR\î5ˆF\Ê|\Ğ;‘¤{l£ a`\"ô\Ç\'\ĞL¨«Œ\ÑcZM;»z‹\0ai´;\æ\Ø^CA\×yqırZ#fÖ°~ûnÍ™\Å\Ó\ë·aù‰V\Ûò¦!\Êü~ŸúŠ(ŸMñğŞ¸„qº\'\Î\è$ò†U£”	¹Ü½ñaûD¡ÀÔ²\ì\ëÅ¯\èø¯0IŒ’\Ée™\ÙÒ¸\ã\Ë;\'\Ê.n+?¤™ûP\0yg¬)“¾}}\ëGÔ¦l\å,Œh‘}ôôfy¯wB\ÈhlfI\áx¨\Å£R\"Š³\Óö\r°˜‹µ´\áE\'¬xjsU5\Í\ìÚ·ÆºFöôô\"^fƒb\âTh—•\Ìd\é\è$‘Î‚7\Èpö¾\ßOgR%gH\ë*YS\Å@Áõ\çœó\ÖCYÀ\Ú?\á\Ô!K:iƒÂ¾¶kŒ”\è±DtŸ;w¼zÕ—É¼ö\ê›\ãw]÷­ÃA‡¨\ê„+OÿB^\ÅP$ù²:ôh=¾D?‚\ã\à˜‰#\ÆR@m\ÔOH)ñš¤d,o\ÈHl ]û\"°\\ji\ç\ä¤J\ŞP7´\ëD|=_C|·FmT%¼vÇ·\Õ1«¶¬\È»\r‰lWwğ\ïv\rr:Ö\Ğ7&\È’‚YN©¶—’\Ã\ì€*¨{\í\îYe6DT|Š‚Pj ˆT&r#i\î\á„z¸å”€\ç–5D!6Ï”\nß˜~\æ\×3|\æco\Şz\é±\rXPeMm\Ù\Ä\È\È\É # P\Z:=X‰š[\r‘³«\ÊÂœy\Ôl>r\Ì<¶\ÔRH‘\ê\ë!72‚Q\Ğ€.mÀlşdu“ÁTÍ€¡t”f2œ-°}$\Çx\Ş ­™Œ\ç\rt\Ód\"/\0?é¤¤+U`\ËS[	ú¶\ãU\Â^AkUˆd®@\ïX\Ã4\É2ZÌ€«yA\Ô\ï!ğ\Ğõ± :@s™¨\ÏC™O¡&l\Í7z„µ\à\á\0©\nB\à	¨_º5ZS²w`Œ¼µƒ¿½º•x2‹t£ ©$Aˆˆn*Gœ¹j\á\ÜsZ\Ğq+4\Ú “¿v\ÃòB:\ÙbbªÕ›)øª\Õ\Ä\è¨)\ì½J>\n‘\Z‚ñ}`šn3.;yß»\ä8ûDT„Hy2¡\0\ÙT’­[¶’\Ìe]‹$h±T\Z\İ>J\Ğ\"\áü\Ó	…cô$5¶\r\çhOlg\é\Z³…D¸‘±@9RHB#{\éŠ•°\Ä1y¶NH(ó)\ÙfaM€9•~\æTøi\ï\í¥s°D’@/°AcUÌ±$–r\×U–1­ºŸG\à÷@0pk[\r²dFc©¾²\Õ\Îek”8º\éh–)Db\Ğ]{\Ã\Ï1ı\Ø\Ï~k”\ÂôG\Êş}ÇµPB.@+/ûZK\çúW¯]{÷Ÿ\ìQ½eX°\îñGes®\Ô\Í$5:†?5ˆªÁğ…\Ñex³8\ë@+\ç5HJ\ËLªk\ĞüAşxÇüõ‘\Ç\ì9;\×j[’®¬\à·hX6{:¿ş\â§Y^bY}%ZA\Ò\áö—vğÌ–^L$F°œ\\¬øR#x´/QŒAL«r\Õ\êf–•C\Äg±iK{?½ÿ1\Ú‡]œô\á ?XU\å²\×pÁ‰kP¼~\Û|Ù™„À£z˜\ÑPQ\Ò;›lşi¢`R^SK \à™¾\î®\ëI÷Å„PT)%¦¡§ª¦·=;kÕ©?\ç¡\ß€\r\Ğ\'n{<ò\â\ï®{dp÷Ö•³¦·\Ğ\ÚÜŒ¦\åaoGWmv¬Ÿı<Qu€\ä\Ğ\0\r\æ0#J%YT@	x=V4m,‰óı~Î£O?GSS3+—-Ã”\Î\æ\Èi:\Ûö L+ğ­.1»¹Š½»wñ\Ã{æ‡—|„\æ\ÆZj\Zª	D\Â|÷¬EôŒ¦\Ù\Ô5†¢%qfLµNe1§8€;ô™cgó±c¦\ïê¤\Ó\Ø\Û7À\ïû;M-œ¾b©L)%½\Ã	z†dm´!h®‹Qñ±i\ã»üø¾G\Ót¾½|%~,Æ—‚\áõ8sx–\Ä	$µ@¥š#7ÚG•„L\ÍO=*dR‹W,9‚h\Ä:”\Ğ\Ñ\İÍ¾sgŞ¥·?ñ\Ñ¯º £lzú¯Ÿ\ïÛ±x\Î\Ìüòº°b\éb´|ş¡a\îy\èQ\î{\äq¶>÷\Ñh”X4D\'NX\Ñ\éÈ”O>l%qµIH\ÇùÆµ\×óÌ¿^\æ#¹€k®¹†+–3<¤»ˆ÷÷\rrÛ°£\ÈI\0\0 \0IDAT\ßŞ¤`/\æ		\',›\Îg\ÎYÁú·\ß\æg?ù!÷½ò&·|ûkøC!‚9uå¬šU\Ë\æ®1<ZÖŠ¿\Ót!Ü«\"]zôLB?f]=;>\ØÁ¯Ši-ü\é®?Q\×8\í{;\Ñ\nw>ñ6\æ\î~\× ı*Wœ{$GÌ¨\æ\×_\åÁ{ÿ\Âz=R\Î÷®ù2Õ•• \'{±\0³T¦\æ˜H\ãE£\'Ÿdl,Ã®m[ñ˜.ÿ\ä%\\}\åå”—[NË»›·ò­\ßÄ¾®=«·<yß¹À\Ã\nÀ—Ÿ\\¨`.½\è|V,]LOo?¹|ùsgó«Ÿşˆ}\ë\Z<F¡\ç0uƒB>K…7G•\ÏŞ¥#¬eßñ”\Ø\æ->:Noÿ ³f\Í\âº\ë®\ã˜cÁ\ï÷\nol\í\æ‘oE7M„\rN8\è\ã¨\Íø}^Ö¬YÍ—¾v¿µ‰\ádº8“y\rÖ*O.o¼—òM4gziˆiˆ…ğ\Úgy}š]¡*\ì\Ñ\Ê\n6÷³c`„_ü\â´µµğûù #\Î\İù\ï\í°F{\ÒvZM9‹g5„9\ç\Üs¹ş\Æ	G£\ìj\ï`$>†@º\ÈH``4i\×-ñƒ_†€¢£k\Z£@rl”²€—\ßı\âF~õ\Óki¨¯c\"‘ §·Ÿ•Ks\éE\ç\á²lÏ›ÏŸq\Ò\×o¨³=sn\ï\Öõ+c§¿š\Û\ïú>ş4±ŠrV®XÆ•Ÿ¾„¯^ñI2\Ù÷>ò\0…‚‚$¦jŒü\èXk8»zFŠK>R\Ò6{&÷\Şñ+nÿó½¼¿u+ó\ç\ÏGJƒ$\ÒúF’8xù\Øi\Ëù\ÈI+ğ{Uü>/³¾úe¦…\ÂÁ€5@Hk\ìP\ì1W\ÕÒ”leõ\ìZ>³f1\Õ\Ñ\0 y{\ß0®k§#F N\æl¸,³³l\á\\~ñÓŸp\Ì1\ÇX³>/\Ç.k\ã\Ímİ¼õ\Ş>kX´µ\ÖqÍ¥\'±t\î4“7_x†¯~\æ>s\é\Çi¨«Á\ÑS!RJvö\Ä\í	Jˆ\ÇÚ“/h\è†A\È\ï\ã{W}‘‹\Ï?›]{\ÛùÃ½ò\Î\ÆMLŒMğË™§œ\È\ï{ˆ4¾\Õñös\Õ\\\ß\ŞÙŠÔ¬ª¬)ygı»<ôó’\Ìd¹\á\Îûø\Şõ?ã¶Ÿş„«>9\İ=t¤P}*\n‚°\'O@	’2­ó˜»º‡\ë0“°½§Y3š¹ş;\ß`_w?£#”UTR\rrõ¥\'³´­™]CH§\×qâŠ¹D\ÃEÏ¨\\…\Ë\Ï8´Œ\Íë¸Šagº›*\Ãü\è#KX\ÔT\é2\ë\È\é5(Bğ\Ën#W0™\ÈM\å©)·\0<rAG\Ã\Ö^k{\ìš\ÛR\ÇuWÃ“¯l!•\Õ(9\í\èy\Ìh¬²¶9K“\ïsTCŒgO°<\æšP\ÇOId\ècÏ˜š\Ç#\0ºıf­3N:O|ôºzúø\îõ?£Nq\Ë\×?O$\ä{·ÿ‰3N>\ê\Ê\n\â]}³»6¾Ş¨ö\ì\Û\rÀ‚“\å­w7R[ei\Û\\’{oú>\×üüv¾ñ£ø\ë\ïn\å»_ÿ2_ù¯›Q=ıŠA¥7G*\ïG]\Ã	F9*Ëœ\ÚÒ¬²h„¥óç‚Fd@Q©DpÁ\â:X\\‡+…ùqdŞ’t\Ó\Ôal\È>öa\íe@X1Ô¦N[J…dÍœZ5U\àŒ=R€\×#8jz5\åA?y=‹D°µwŒ“\Ë\í\Í\Èe\Û V\Âò<§©’¯6¶wV€ñkŒ\É$h\Ô\â4\ÎnFD\"Ep®\'¿»w”dF	aR\í³öªŠb½c¨±\ë¾s5Bü\çn ª\nn»\éû\ÔUY›{j\Ê#¼ı\î&\æÏ\Í\Ö\í;U¿\ÏRkf-¨\Şû\å\åeô±`f+gTY\á\ÔU+¸\î÷÷ò÷§Ÿ\ã\Ó_„^\ÈÛ…Tyst\Ê\Ñ\Õ =#¬Y\Ğl;Ppö#cJ\äø0\äR®w9f›EÀ\Ç&­\Ì\Ùõ\å\n#i\×9vN-„Iq8\ÑTA]Y€¡¤5]³½‚“\ç×»å€„\ä29†mü\ÂÖ†I+‚¢¸†(¤{VU8tvõ3‘Îƒ€rO}ô\Å0MB\á\Çµ„iõuüùÁGØ´eß¾ücxU\Ç\ã[0³•ŞAbeÖ‰”\Ó.¹ü»Š?\r\Ô\ÕT\á÷úHer ¯o|s¯ú!w>ò4Mµ5\Üu\ïC\ì\éè¢©¾\ÖiB‚W1©ö¤Ñƒgu\Ş\Ú\ŞEÁ´º Q\\õ¤Y°–Š­~Û…»·V³´\×\ÒÙiß’‚ö‘$ı„€Š°5s\ëpEJ\' ‚hÀ\Ë‹¦Yz%\ï\ì¶\Ûe—V’°ô@ÚŒr\î9\î³-\\\Â\n2¥‰{\0 ”&\Òy\Öm\ï&§ix0©ò\Ùkq\ÂXV±€{Û¹ë¾‡hª­\æ\á\ç_\åøË¿\Î\ß^xÙ’—LŸ\×G]õòÀ1\ÍS\ïnRø|LoF\×\àË O>–~-ıúz¤Q`û®\İ,˜3\İ>Œ\ä\Ì<Å¼9|f¬?\Æ+[:K(\Ñ[4E*a\'¤d‰»(ƒ\äm\Ğ,\å8;”v$˜È‚?·HÀ\ë–\å\n¾-õg-j\"\nbz|ôŒe\èK\Ûü.GLş“\ÂŒ’fY©¦”\È&KzoQ{_œ×¶v!%D<\ZUs…$¡`€†\Új¶\ï\Üz\Ç~}=ı\ê:~ğ…OR\Ğ=8Lkó4|^kLÙ¾şvex\ß=\0\ÃñQ¦·4±mo\'™|\ã–/\â\Ë;Ÿ\ÙÍ\ÔT\Ä8k\ÍQ<ÿ\ï\×X²p>y-g1Í–²°G\'–D‹Ô°¡=\Î\Æ]}v§¬\ÆI)1³id&…\éH\êTØ›4,\\Š,\n´$[(ğ\Æ\î!’9h\Ğ\Ãi\ê0S	†:»\ì\èb¸»›ôø¤¥:\ÌñsĞ¢utf\Ø\Ü9†,¶Ê–nGÅ±Ã´ÿ\ìº\íX\é\íVg³\î)°\ïy+ñ	k¯\\¥7‡·ô\nj«+‰„‚¼ğÊ«œ}\ìJª+b\ÔTÆ¸\ì\ìS8}õQdó\Z\Ûöv1½y\Z\Ãöö¬›\×\ïQ\nùœ&„B{WG¯X\Ê\'\Î;\Ã9Zb3\Ê\ã¬˜\ß\Æ\ëŞ¡¢¼Œ\Æ\Ú\Z»\ÑVû}ŠI¥’ÂŸ“\×s\ë“\ëMØ—ÀÚ¸˜GH¬?”\n0Ø€•š\rYüöŸ„\Ñ4/\ï\èGJÉ´°\Â4s‚\á®n’ñ1R£\ãL\ÄG\ê\ì$=a\Í,‡ü^Îœ_ƒ¯²Q\Ó\Ç›:I\æl\Æ\Ú#»‚-0²Tl&´]|!˜:d\Ó ­üv÷ñ÷\×\ßG!O*oRÜ‘P_Sa¬}\ëmÏ™‰G±ÖŸ,x…\Ï\\p+–,¢£«¡(š¦)\Õ\Ó\Û”\Å\è\î\ë§\"\ã;Ÿû$\ÑP˜\â,Ák\Ş\ãgºŸ®\Ş>\Öo\ÚLMU…+QRR\í\ÍÉ`£|ĞŸ\â//lB7L\ĞuDr\Å4\Üò,%*a€\Å+»±\Î÷\âÄ¢3J?°nİ£i+\Ä)WÌ¢5´%^\Z’\Ñ\Ş~2I	\'¶Õ°8ª‘«š\Ék;‡\Ø\Ğ1H»\ÖJjÜŸ\\[m‘ù,:c\ÉznY\Í:Š_\ë\Ë\â±x\îvK¨­ª\ä\íw7\Ò\Û?\È-÷ş\×7n¡8\ÊI|>•k>s)µ\Õ\Õt÷öã”\ë•\Ó\çš\ÊÂ£Ï”W\Õ&\âñ1v\îÚƒôx-—Ö±½g\ßX\ÇU7\İ\ÆK\æsõgğ\Ò\ëoR\Èe\é\ê\èÀƒ¤,B\"ğI«Ä—%Y9›\ß<»‰_Ú‚1Gò–)q¢X°;[NO‡\ÓR€P,!‚¼®ó\ç\×ws\ß[ûR`&‡X]#ñ{=xT\Õ\ç\Ã\ãõ\"+OA\Ë3\Ü\ÕEj|Œ\ÆX˜¯/\r\ãñª\ÄÃü\×\ã›\Ù=˜\Â,­X:LŸŠ\äj–\Ğó$FG¹\å\Ñ7x\æ\í](Ba\Åôr¦•	„\n\Zc#\ÃTD‚<úô³|ı‚39w\Ù\\uÓ­<·ök\\s\ä\Ğ\ëaÇ=\ÄG\Çğ‡£MG¬PB-s»´Ba[*f\×\Şv°(€\áñ	şø\È?8eñ|.9ñ\ê+btu÷\Íd\è\é\ê\Ä+\\qñùœ~\ì\Ñ\Ô\×VQ\á+p„:H@\Ñ\n7s\Ë\ëyj\İN£¸$QjÊœ†¹v`’U1q´ø\Ñw;¹ı¥$sL-gd\'§¹„`4JU\Ë4j¦·P\×\ÚBM\Ó4bõõ”UU‰U \r\ë\Äö\ÙK¦qV]-ZÏ®´—ü}\ïõŒ:²b‘Œ£)“-œk-,µŒ$ó\Üñõüõ¥÷(&‹¦\×pÂ¼j<\Ô\×TqÚš£¹ôœ\Ó\È%F\é\ë\í!•N²{o¯\Êk\â”\Å¸ó‘§w\n\ÕË®=ûH¥\Ó²™Í­Ë\ëPŸ¹ùš}\ÓZZ\ßJgV½µa“r\Ö)Ç£¢€t\r\Ò\Ñ\Ó\ÇW\Ï8‘\áQ|\å-.¹\è|Î\Ã\Æ÷w¡0‘HqÖ‰k8ó\Äc\è\íbx\"Í‹»\Ò<¶\×dh\àûO}Àú>³f6õe!\"~\Å\n\ÂI86\ÊJ+˜t¦ø\Ë\Ú\İ<¼¾ƒ‰lYÈ£÷n\æKgÅ’\ËGµ;h‚#¥t·L;eºA\ß\ë\Ò\Ö|{k\Úx)\ŞO\Ïı¸ù\Â#X\Ú\\IY\Ğ\çnq™%p­-X \ä\rƒT®ÀÖq~÷\ï¬\Û;ŒfH\æ5\×ğ³Ï\Êğ`+\ç·\Ò\ÔP@ğ\Î{[QıA¦·¶rö©\'\Ó?0\Ì\ã>Æ’Y\Ó9g\åR¾ı§\è\Z¤¶²!¬ùu63‘Ê˜\Ñ\ÚÆŠ–™	 n\åi\Ï<y\ï\å\ïl\Ú3-\à‡|–½İ½„|>B~¯n\İAVñğµ\Ï}†D2…ß¯\Ò\××‡¢ÀŞ®4­@Àï£¡:\ÆÍ«–3ç©·¸wKœv½\ßo\ço\ë_\æ¸Y\Õ,k­äˆ¦•aGSıv>$#©<:\â<±±‹¸5›ù$\Æ\àv.Z\Ñ\Ì\×.9\Õ\ç+rÏ_û…HnÑ’€ß‹¥-ıG\Îj\àIY\É{ùŸzh\'«TNŸ_\Çü†r‚^OQƒŠ…£\é&Y6v±~\ß0[º\Ç\Ğ\r‰GÓh\âÛ—ÈŒ†\n’\ã\Ãds9¶\ïi\Ç\ïó\â\n]Ì›3“òh„o}\åó¼»y›ö´s\â\â„|>öv÷rÔ‚6¤/\ÈÀpœw6m¡$fs\ÚówödS˜wÂ¹¯l\á\ï‰w7¿Û²}\'\Ï÷ô’¢:fT­ ³~\×^.ı\èGƒü\nšF._`ó»8yõÑ¬Zz\ÉL–t&K8\àã«§.à¸™ü\æµ}¼¼\× ‘“<·­—\ç¶õRõø&\íu\ÄU‰L±Œõ²X¤\à¨/o¾¼–Oº’\ï^ş1\ê*+˜dƒŠbnı9s/%tõ\'>Ê~{7÷}ú\"Ÿ®p\Ûkƒ\ì5U\ëWy½kõª†_U\\*%İ”Œeó¤²\Ö\éE0¯¡Œ\ËV\Í\äü\å\Í\Ô7–¡y<\ÔVU\r)‹Fù`÷>u-\İ`\Ñü6¡ x\Î9\ídzøVÍŸX%nğqt_¶ysywóV|Ápb\Şñç¾¸\á\ïwYv\\uAn\Îqgız\Ï\Ú~ı³\Û~\Ë®ù\Z\ßü\ã_¸\ìŒI\ç52šõ\ÆÜŠ˜µ¬z¬¸ñø«—-¢<\Z\áñ^¦¡¶†\æ†:$‚@À\ÏÑ³ª9zf5=c\ß\Ú\Ë{\é\Í\Ò7–¡;F7‹Q	XNƒ\êÔ—˜5½ŠÕ³kø\ÈòV~ó—{¨X1—\ë¿r9å‘°=\Í\Ãş\ä0vÒŒ\0 g®9Šg×¾\Í\Ó/¾\Ìõ_½‚ÿX\Ş\Äk;xzK7[{Mú\Çô\ì\"Š	a¿JM\Ô\Ï\Ñ\ÓkX\Ô\ãŒE\ÓX\ÖR…‹¦n <\Õ\ãaÛ®}ô\r\r3\Ö‚…Áª+\Êñ¨wV\Å4M²yt^£½§şù*¿¼á¿¸\é¶ß\Îd™s\Ü	·\ßõ9(Yò\Î%\'ˆ\Ô\Ô}uÃ–m³u]\çŸºŒ\ßÿù4M£/>\Î\ÒY\Óy\ì\Ïò©‹/Dõx˜\Ş2]û:x{\ËûµT\áŒ\ã!\É\Ñ?<Ls}-~!\Üù¶ia>wü\\>½f6}v$\è\Ï\Ò>œ `\ØR <\è£.`VM”ÙµeÔ•\0…÷÷´s\åœK4Túº•\ÅÁ^ºÿ€òH„³[\Å}št.O8\à\ÌEMœº°‘=CIö&œ\È\Ñ3–¦\à¾6Z	¨´5Ä˜^fAC¿§?g”’\ä5¾Á!Z¦Õ³p\ÎLv\ì\ë`GG^\ÕËŒ–f\0C\ç\ïÿx†³Zé‹‘\È\æ¸\ï\éù\ÊŸ\Æ0L6l\ŞF$Vùnsu\Åc¿\íH…¤9 \Öe«{&ºÿX0\å\r·ÿ\é/¾[oü	\ë\Öo\àñ\ç^\à¹w7ñ•óNç…ğÀßŸ\ä’\ÏÃ«ª¤R)\ÚfLcŞ¬é¼»õ<Š‡¥\æ\âóy²d#£mÃ¼ª‡\Ö\Ê­U$­`¿FX’\êQ„½·$P&c‰$\Íõ5\ÖIiikÅ•\Ó\"I¤8€»,K\ç\Î$‘N³½½“#\ç·!±Î‹Î«/·%š.\í6Y(X?\æTŒ	]\àE\Éw~¿ŸÙ­­lŞ¾Uõ0\Ö<¦A&“\Æ\ãñ i\Z=ş\â}ı\ê±ü\æ\é\Ñ;4Â…gŸ\Î\é\'ŸÀ\×xºDøƒ;ù‚Kº\0Saº\0­½ûı”«n|\à\İG\ï¼ğµ·Ö¯ú\İ_\î\ãû\ßø\Z\í=½$\Ój«ù\â\Ù\'óó[\ï@Ae,@O\ß\0;¯MŒŒ³s_\'\ÅC]\Ğc—¤xÃšB‘ö0\á÷Ú¿¢\â\Z~\ëS\"\Ò:æ„p0@Wÿ0™dŠ\İ·\ÍBõC‡„[†I.™B\Ë\å‘HT\×zKŠa\Î\æl mƒ&À9T\åWí¶ºcQ±mN\É\Å{¶*y¼¤³Yz‡8z\éTÆ¬—\í]\İ\0øT•\'Ÿû?¿õ¾s\á™4\ÖÕ\Ô–.Z\È÷¯ù\Z¿û\Ë_y}\İ;”×µ\ìZv\ágŸú\á§\Ïsw\ì\ï\'„õmKV´\ïx\Ã\çQ\Ôÿ¹\é\Ç45\Ôóƒÿ›\Æhˆe3Zxyó6:\ÆH	½ıü\ç—?\Ïÿø{\ÖlŒ3)\n\È\\\Z9nd*ö \Ô\é*’ó¸@\'İ÷ötöòõ‹\Î\æ¿ş=\Él›¿ø)N=\á\Î+:¥\ÍF¦a0óû‡Ÿ\âù·7\âSU~s\Íxø­\r<ù\ê:¿\í¦\Õ\Ö\àNw–¶\Ç\áÿ”6œT\Ô VÀî’„£N;M\Û>`\É\Âù$’I\Z£!NZºMûº\èOe¸ñ¿¾KO\ß\0Wÿ\àzò†¡±ú”sn¹\ç\á7¥$súôˆ	xóüù?¹³?Ş¹g\ÏøP\ßI\ë\Öo°fÿù¥\Ï10‘dKg/­-|á“—°r\éb}\éjk«øøG\Îug¬¥°WS\r\İ~7\\˜\"Yk9ö¥\Í\0[6\İ9²bŒ4§¥‰Ö½\Ë[\Ş\ç´eK¦xy\ãVZÊ¢\Ô\Äb(ŠÀ\ĞML]\'—É°kû.ş\ç\Çxø\å7Y:k:†ağ\È\ëo³eo·|ó+,š3÷–ÀA·›#(Nx”\Üw©@	 ¨Œ T\çô»´Lpõ¯£¦ª‚\Ûnü«V,#‘\Ó\èK°`\ÑB®û\Î7\é\ì\î\å;\×\İL2“mœ¿üÊ£.»ú©oŸ±8ß­7¹L; lœóı\Û\"\Û^xô»]›\ŞøN\ë´F\ßuß½†O|ô‚I©·\ï\ÚË¢\ã\Ï`ÖŒVv¾õ\ïIB\'\0S\Ë\Ãø\Â\Øÿ|¤NÖ \"@\ÎbœE`İƒ#\Üı\Äs¼ú\Î&V\Ìla_\ï\0\İ#q\Î_½‚#\ç·ôûAštörß¿^#¯8÷˜\å¬\ÛÛ…nHV/]À\É+—³l\Ş\\T‚;Aº_\Ë?<I@ª>Dy\r\ÂWbn¥¤opˆ™GÏ‚¹³xöÁ»\í÷hUòşG\ç\Ç?ÿ5½z\ëòcoYx\Ú\Üø\Ì\ÍW\í÷K\\mÑ±Ÿıf¨kó[¿\îÙºş²X$ù\Æ¯\àóŸº„ÚªJ¤€¾şAN¾\è2º{û‰\ï\ÚL \à\Ç}\í¤\Ä^²FrE{5•H\ë‹5Á8¥I\Ò\ÖAa½\ã&™\Î\à‘‚Ñ¾>\Ön~Ÿ‡^^\Ë\ĞXG\Å\Ã	Kp\Åy§\Ó:£](¡€\Õc½«À^z³Ç¡©õYm*\n‰{ƒ©¾½”€/ˆˆUƒªN\Âø\ÅW_\çœK¯\àô“\ç\Ş\ßü’Š˜µµjddœ?\Ş÷ ¿ºóOL¤2©¦\ÅG?Ü²d\ÕUk\ï¾å€¿\ápĞ½\Ùk\ïşeæ”«nü¦4\Ù;°s\Ó÷oºí·±M\Û>\àÒ‹\Î\ã\Ä5«ƒÌ5“ö\În\ŞŞ°‰Ö¬¢ønPŠ\nœIZ\"\0Yd\Õd\r\Â2Güªy9(+‹\Ğ\Ø\Ú\Ìy§\Ç\Ğ\èù‚¢ªTU”S[]…\Ç\ë›\ÌO·\rÂ­¯”Jd#(¥Z%ö\Ó1 (ÖŸUŠø\Ö\í;1¥¤¾¶Uõ2<2\Æ\Úu\ïğ\à\ãÿà¹—^AGI4-:ú\çsÖœu\ÇK·ÿğ ?°q\È\Íó/\İş\Ã\Ô9ß¿ıB6¹g¬·ó¾Çy>ğ\ê›\ë”­-ø½^vµ·cJ\É\Æ÷¶qÂšUE\r–\Ö8$uò\Æ\Æ)\ä\n¥´\ä\ÚÊ‡=Ù‰Ä\Øb½4<	G¨¬¯³y9%­t\Ü\0Q¢)y•“´bŠr\Ø\ÅL¾Y:$<O1³°@”¦d\ã–mH)yöÅ—Ù¹wù\\\î\â\ã¦?\ÍU5\Íø\ì¢3/~á™›¯>\èÂ‡øyš\İkŸ+¤\âC\Û\Ïü\Ö-w\rw¼oj³lh,\ì54\Ã0\nJ8œu:ª\Çcyrv{¥)­\×w¤\é1À$\rrƒ’\ç) „\Íûbz\Û\î\Ù\ßñ\î:Œƒp\Ñ	ö\ä¸Àqm»“\á·’{nšbaVZ© \Ã¯o\Âû::ùÃ½24:®ª?\Û?2\ÆH\"•7\ï\Îpe\í=\'|\á{Ÿ\Øô\ä=\ï\ì^ûÏƒş¨†CS\åæ°´úS\×Ñ¿}ó\\]Ï«¡Xecç†µß˜\Û\Ü\Ğò\×\ßşšms,fb™)ôŒôcM/\ÛÁ¥\Í\\W¶…Ã°¢s\àš8Yj4d	06¹šf³P8Š$°Ö´E±·\ÉEPóÁ”\ëS…°7	x º\Ş~]s‘şù\ïW¹\â\ë\ßf4™\ŞØºü¸\ÙtÀ£úô†ùKw¼yß­‡ü)€©t\ØóAS\é\Íûn\İl8\çû·©\í\ë_?mOGgË†­\ï3¯m6ŠHaZ\ÌS½ x¬A‰\Åj{˜¦\î_—§P”Z\ç«\ÌZ_¬%‰¶)sW?\í\ÏI@•\Ş+\éA\ÒQYª:ÖŸ´\\hl¯\nª—\âÜ @+X¿i\ÃñQ\ê\æ,Şµ÷­=\æ\Ô\Ñş\î+üoI\áÿ¹ùj}\Ş	\ç>—\Édyñ•\×\Éf³¶ \Ûÿ„\0Ÿõ2ğıø?UXKùïš‹&:L&9X{ÏŠ\ähX»s„›§\è”j\Íd*¾cÎ©{jZQ\×°\ĞEAKg2¼ğò\ëH)™µæŒŸóÿH‡\è\Ş÷{„’peõCj ¤?÷\ïW\Ù\×iMm”°ü\Ö/\ï÷PÑµH\ç9 ¤ ½¯Ÿu\ïmgh|œT6CVË¡i:º©\ÛiJ-aºL‚®“\Í\çI¤2Œ\'S$SYLimQ.Il•P’İ\Å\ç\ÖH\"`ÿ’£¹À\Î=ûØ°e+\å\r-\ã{\Şø\çA\Äö[\'ø\ÃÖ‰ƒ=v\ép&.ÀaŞ†‘ŠV5\Ï|`p÷¶O\ßúû?ñ›Ÿ\İ@ \à¬ÁVz}–§£Ö’ñû4Ip‘\Üğû{xæµ·0LIs}\Óêª™VWMSm\r\Óğ¨¢D\"Š­vw÷\ÏØ¶§ƒ-;w346Î²ysx\à\æk™\İ\âüPo‘J7®V;,\í±\Å\Ï\ë·b+RBA×¸\ãO÷ ›’²\Úi¿X|ö%\æ37_½_\0W.*?\àı©T*Bÿgš¶hå±£]{‰¨\Ô\ßı?¿\àŒ“O°:(RšC¦S¿?MF½·m\'\ïm\Ş\ÊH2I{ÿ0\íƒ\Ö\ÕM$\é\Za<}\à0Â£\Z«*ñª\n[Z˜\ÙPÃ´\êJšš\ê9\ã¤\ã(‹¹±¨¿!7°ş\"1D¤lR¦7\Ş\ÙÀ%W~D\Æ\Ë/\Şõús\ë\\Ø‡§\ÃiĞ‡¢†yK\Ö%†ú\î\îûÏ›nû­:£µ…¶\Ù3qôA£\Ö[õ<ô¬ÀœK\ÍL‘e\æÎ¤µ¶\n\Ó4\È\çrhZ‚VÀ0%†©\Û\é­ Yº\Òn\İóy}¨^¿\ÏG0&TEU½öK^\'·cJ\îp\Æ0©ª(Á°¥9v££\ã\Üş\Ç{1#5\Ö\Í9\â]¯?\Çÿ+ıÿ¢A\0\ç|ÿ¶\Æ\×ÿü‹—ƒ=ó¾ô™Op\ë\r\×Z?ş*ì•›l91‚p~hv\nMÒRNY.šu\í¸\Õ¬ \ÔzV\ZµÈ’IPg³¡\Ë\\Q6OE\ã@*T\ÈZ\ß-\í‘e–ö”d¾\ëş‡¹ú?A\r•.¿ğ³Ç½ş\ç_L:ü¥\Ãª–v¯ıg2\\YÛ®eSnß¹\Ë\ëQ=,_²¯Wùÿõv\ŞqvV\çÿ·\İ^¦\İi\Zi¤‘4B]BQdlp\â`bcDq\Ö$˜b\Ç&°1^–O\ÖÙ”]\'“µ1¯½NcŒ±\è @\r$¡\Ş\Ë\ÌHš>wn/\ï½÷=û\Çû\Ş2\ÒHˆ\çù|F÷\ê½\ç=\í÷´s\Îs\ÎM³w^òœË¹@Í¸‡	¿‹²J\åx\éòŠŒ3\ë@Y\"…“¾ü¬ö7\ç—J_‹	\ç}Ÿğ¬|†%¶s\ì\æş#Ç¸û/&–H›f\Ìû\Æş×ıõEÇ¡ €[ÿ\á¹g\îJ\r_»{\ßW0\àg\É\Âv˜•À6¬Š‚(\ä™\à.•\ÉióÄ¾€´\İ_‡›\Ëş„U*‘\Ëe‹‘L¥H¦3$Rr¹n—¢:\à:ù”­dòT“F\n\Ğ]ˆp=R\ÕlF\Ğw¶Ÿ»øû£¡³û\Å)WüMÿÁ½¼ö\ÃĞ¥\ÔòC\Ñ\rıCx\ß+ÿ~\ß\é=[ml¨\ão~\ßÿü\ç04­¢’È¤ w¶¢HU]^•ƒò\èÉ¶¶€)”\Ì<©ñ\ëw\îaÃƒœ\ìb<YÎ’Àå³¦ó/Şˆ¦nsu_\0\0\àIDAT\Şp\0\İp]“\ÊHEÒª²,¤°\ÜõMö¸N\Úc<\Ó4¹ÿ›òÃŸ>‡\âòœl»ô÷z¶¿³ûÂ¥|xúH%\àØ¦\×r\Ëoùò¶b>[\î\ë¹|İ†Í®\èxŒE\æ\á÷z@„n€Û‹,¥\éhŒ2\ÇKv<\0BT;\Ö\Ñd‰‘Q†¥Wu\Ïdù\ìxu•\á\è8>C\'Nó\ÖÎ½4•®b•$şppr;\ã(‹®T´\Âß¸\Ün°5€°#š2\Ù,û\İ\ïñØ“?Dh\Æ\à\âÿğÖ•·ş\Ù{»_ø\Ñ\äü\é#\à\Ôö·‹«¿ô{\Æ\Ïö\Ç\ÇF>ùŞ®÷ÕÁaÎ½Œú:[E—i(•·r\ÈZt	\ì£7UM\ÃcY\ÌlkÁ\í\ÒøÕ»;È˜>¹d‘º}\Ãc\ä\Í\"[4pÀG°±—\×sApª{jk8A\0(H·¨³\Õ6±d’ÿı\ÏOòÄ¿ü˜’\ĞRS—\\ùÈ´¥W½ğ³\Ö\\lòş?D¿€\0n|%÷¹GŸzÿ\Ô{\ëMÿø}ûÜ›·\ïm\ÍML›Òªi6H†4\Ã\Şo#-G³\Ø+¶Op\î\êª}¸zÁ\ÌQ0¸T•ù¬œ3“\İ\'{\Ùr\à(WÍ›ÍŒ\Ö\æuv\Ğ\Ô\ÖB°ñ\"—¡Wfjö&ü!g9\ÛVyC#£üùû<ı“gÉ˜¥\Ø\ÔÅ«ş\É_\ßôÄ¦gş\×où¡‹hå–}\á¿,=º\á•o&Gn\ÖT…¯\İu\'w\ÜúyfÍ˜\ê\ìH X´mS6•­*[W\ë~(‹d)r\éf\Ş\Ä*±Š%¤s\î‚\ê2Gšğƒçº¶óÉNö#†!tW5©”¼¹a3ó\Ø?³a\ë{\è\Ş@\ß\Ì+¯\àÀ\ë\Ïıl’Œ?2úIP-õ\Ü5°ğÓ·m\ÈÄ£V!Ÿ[´eû{\ÆÆ­\Û	ƒtw9›™TQ–&Ë‚R\É1\Ü\n\îNoJP†×ƒ7\Ä\àñ…Bø\ÂA¼õaõõ¸|{e—\É9Q:ƒf[‚¤]v°\á\Ú\Ûó³”\Í\æø÷_¾\È7ùkö<Œ;X¦eÎ¢\Ûg_ı©u\Ç6½úş:ôŸ\"Aešy\Õ\ï(]+¯½b\ÃS»1›ˆ*š¦±h\Ş\\ş\â\Ş/s\İ\ÕWv\âÉ¤e!³\È$EgMKÖˆÏ…Â¡ó}AyjÛ›\Ú\n:x\àöb\Ï\Å	’\Ññ(›¶\í\ä¯ÿñ	v\ï?ˆ\ĞôT¸u\Ún—/ğ…O=ğ÷ƒO\ßù	~\ÓôŸ\n\Ğ\rıcd\ëOÿ\ÓX\ï£>Ÿ—\ábtt¿\Ï\Ë\ï~\êznü\í\ë¹áº\ãóym@Š\Èe ›tNyw¤˜!	µMª\ÂPˆv>Š.¸=¶tN\é€iø\å+oğ\ì¯^\âõ›H¦\Ò(šN°¹\íe¿w×«oş\Ó_~\à\äı\Æ\0ºó\é7•\ÑSG³û·ûO\ï\İ\æ/d\Ò^\İ\ã»´\ç\È\í­-­\î]ûq\Ün7;w\í\äÔ‰¤\Ó)~‹\æ]\Æ\İwşW¯\\NcC=º3.³I{_(\ç\0T¶Qrb\Ì\ç\ä\rv ‹\ËnŸ}pªb\ÏP\äò&\ÑXŒ­;\ß\ç™{–-\Ûw‘L§+÷pg2Y:W\\ûS}\äù\ãï¾¾\Û›S®Èµ]¶,\Õ8mf\æ\'÷}\î#÷\à\à#\èÎ§\×\Ã\Ç´Ù³mö\à±}SG{ø\ë\Ú;»TM_–,ÍŒ\Z–U\Â0ş\àï ¡¡‘\á\áaFFGÈ›y6­‡|\å\ÒvX²`knş]®¹b9\Ë-´\r}±`ƒuA\ä\Åt\Ãö’Ub`h„»÷ò\Îæ­¬\Ûø.\Ø\'¯C!:;;Y¼tƒıgy\ë\Í7*‡\n!p‡\ZŠÁ¦–\ãe{¼¿gŸj¸3\í¯n³ğd\Û\ÜËş\Û}7]4\äR\é\×è§\×\'6½ú[‡\ßz\á÷£§O\Ô^½¢jSŠf¾\ÑÌ¤&)\ï˜:•[o½b\É\âT\ÏIÌ¼I±T\ä\Í\×^\Å:\ç€\Ã0˜\Ú\ŞÊµW­\âö[nf\Å\ÒEv`\nÔ¸\Ş–$\ÙL–·7oe\í\ë\ëØ³ÿ\'{ûWR´´´2k\Î\Â\á:¦Ï˜\Îğ\à /¿¸–L&ƒ\Ë\í&“¶O:©%U7,\Ã\ëO¡›™\ä\İ\ë\ÏM¿üc;¦¯Xı//ıÏ¯ö[‹K¥\İ\Ê\Û{^{ë»\Î\Õ<®/õ½\'›¯0„¸\\.\\.7·\ÛEsK¡Pˆ±±1v\îxÕ«¯e\åW0‹188ˆeY­¯¿ü\İ\İ\İÌŸ?Ÿ\çŸ¯\Ç\Í\ìV†\Ç\Æ93bŸN¿l\Ñ–-^@{[+\Ó;\Ú	C[P\ãGL$Áñ“§\ã\ÈÉ“¼½q\ÑXu5SÁ¢E‹X¾|9?øÁ˜9k63»»B\Ğ\ŞÖ\Çeğ‹_<G*™\äÓŸ¾‘Æ¦&†‡Gatt˜±\èù\\L&K.—µ¯1­¡\æ\Ù·\ë.\ÏcBQ^=½gKô\Ü\Ú]Œ>ôzĞ¶Ÿ>q÷xÿ©?33‰9RJtÃ ££ƒºpuõõøı~|^?`Ğ¹VZE øÕ¯G\×u\"‘RB.›¥$-\ÇhT¹ñ\ë_ÿ:}}}¼¿k\r\Üù‰«\Ùy¼‡wöd\×\Şı\ì\Øs\Ñ{a/‰‚^fNg\ßñS\0L›6¿ú«¿\âğ\á\Ã\ç¥M§SÔ‡§P_W\Ï\àÀ ±xŒö)ttL¡£Ã¾]\Ó4\ícÿ\ãñ8\éT’X,F,\ã\ìÙ³\Ä\ã1†\î]¡»½?V]\î_^w\ï·]÷ø7/9²\ç’ŠÌš\Ô=¾oõ\ì\Üx·,¼uuu\Ì_°ˆ®®.ü~?š¦¡ª\ê„)\Ë*Q(\Èf³®«#\n\ÚRS,V…1twwó\Øcq÷\İwóòÖ\Ä\âIşr\Íg¹ó·Vs¨·Ÿ\ãƒ$³9z‡F)¯Mt\rjŸV­\Ñl\ç–\Êö†:FIİ°\rEQ˜:u*O=õû\Ø\ÇX»v-\0§\"„\Ù\\Ë²˜:u\Zûö\íepp®®™•¶\n!0Ã°\ïEµ\Ûm·/—\Ë1\Ğ?À\îİ»\èWr\É\ì\Í\Ûú\İóû\ßTTõÕ½/ÿô‹Kh\æÕŸr\Çú{ÿ~ğğ?Q‘\ÊÜ…‹Y¾b%¡º=Ó‹=cY¦i’\Ë\ç\È\åò\äó9ò¹<ı¤R)ººf†(‹!@\×u\'*HpÅªU<ù\ä“\Üs\Ï=lÜ±ƒ¯~\ï\Ç|aõJ>µl_<·úP^T³ÿ\'©œ¢%\Ê\ÃO»L³Ä‘³<·q;k·\î\"\Ïs\ã7ò\È#°d\É„ôõõ¡(\n†\ár<C{‡x¡P`\ê´i\0œ>\İÇ‰S\'14Û\Ûùsºn ª*ªª¢Á`ˆ]3Ø·w;w¾Gld`q\ÏÎ\Ït¯şôMÀ»|\0}\àLÂŸÿd\Çö\İÖ»w\ÛÃ¥|^_±ò\nV­º¿¿º_’\éTš‘\Ñ\ÆÆ£\Ä	’©$y\Ç\ègllŒ\î\în:;g\Ë\åV†-R\Â\èğ##\Ã|\ík_\Ã\ëõ\Ò\Ú\ÚÊ•«V100À–\ï³\í\Ğ1v;Z\ê\Ñ5•\Ê‘(KPÍ’KJ,ô\á\ïş?^·‰­‡\áòxø\ÊW¾Â·¿ımfÏ‚T*\Å\ã?\ÎXtŒ¶)Sğz¼vNŠÀ\ïó\áóù8p`?\Éd’¶)¡P²J\äòyÒ™©tŠd2E\"™Ä²,!\ìùF\ì]|‘–ššš8qò8™DÌ—:3\í†ÿñ•#ï¬½\è\Ú\ÑEúş\Şqú\Ë/\Ï?²\éµ\'±JK—.eõ\êk+fY’t6Ã™³g#Ÿ\ÏS,–*‚B±\È\é\Ş^L3\Ï\Ê+V\n…’\ÉdlwYØ‘¤\ãccŒs\Ë-·\Ğ\ÖÖ†¢\"\Í\Í|ñ‹_¤«kgúû9p\â/o\Û\Å\Ï\ÖoaÏ‰>0½5‚ª\ÇA¨±\Ç\â<ş\Âk<úÿ~\ÎS¯¾Ã©¡Q\êš\"¬Y³†§Ÿ~š[×¬!\èœ2pò\äI~ô£‘\Ï\åi\ï\è°\Û\è\Ë\í\Æ\ëõ14\Ø\Ï\Ğ\Ğ\rõõøœw‰\Ä\ê¨5\Ó4I¥RŒ“\ËeA‚¦ihªJ8¦©±‰Ó§ûÈ¦’3†\îkœÿ©[\Ş\ê?¸ó‚!ÀUqo½úª;6xö.i\ÉÎ¶ö6–-[\Õú\ÉC\ÃCöE\âe¥-kF!Š¦I:\Â\år\Ñ\ÜÜŒ…´õ:TÔ”—sW\ë\È\ÈÈ„:H)Y³f\rW]u›6m\â¹\çcİºu¬Û½Ÿcıƒ¬^¾¿\×k\ß-\î\Ì|J$o\ï?Ì¿¯ß‚Y²˜;w.·\ß~;\×\\s\rË–-Ã¨\İ\Ë\ã\Ğ\È\È\ÙlM\×\Ñ\Ê+¦v(\ìø»¶¶v<\Èøx”\æ\ç\æe¨\ÆC:\ï”\ã\ZS\É©Tš@ÀOS$‚\Çp1uZ\'ó,bû¶-˜\éø\Íı\ïo|¸\à\"\ßE\Úøô\ß\Í6Ó‰[5Ua\é\å—–\ï<€D\"ÁÀ\à\0%gğV\âP³:	\ÙL†d2I÷œ9èºeY¤³™* ¹€Nœ81aŒS6ÄL:•ë¯¿ÁÁ!ş\æÃ¼üòK¼{¼—»>ÿ™Š‹-ôDYğ8şP˜§~ğ³»g\Ó\Õ\Õe_B%\Î)»¾½½½$	¼>.Ã¨VOBÁ4)•Š4E\"x½^¢ccHË²g!j²“5\ÌYV\ß6#\')–JLim\Ã0–/_\Î\áCˆÅ¢\áÖ™s¿ş³Ã±¯¸‘ø\ìŒóc\å.\ZY*«\ÓÑ‘\ÆP(Ä¬™öY`ßƒ32:ZÇ¡\ê-(N­Œ!¥¤£c\ZB@\ŞñŠ\ì\Ê\ï	]GÁÀÀÀyƒ@°oÛ‰\ïò\È#p\Ó\ç?O(\æÿ®}ñd\ZU\ÓP5E\ÓÙ¼÷\0›\Ş\ßÇ¬\î9ô9\ÃC=Ä¾}û&€#¥œ Š£\Ñ(ù|·ËªªÔºş¥R	Ë²ğû„\Ãaòù<\étú¼:Ú™MòLB&“!™J\ÇÃ¼ù\0\è;¸û3¿Xû’\ÒUc\ã\éó\'.ĞÏ¼Ef|ô~€\Î\é\Ó+—…K)‰\Åb/¬\Ü§©\Îw\éü&¡ª*---€ “\ÉT~«mŒ¦k\èºNÿy\\.¥\íº>ûógù\Îw¾Ã¦\Í\ïâ‰´\Ñ=\'Nğãµ¯³u\ß¶\î\İ\Ïû‡ò\ØO~N\Ş,°d\ÕU¬ß²^x|cÇM\0¥L\å{NM\Ó\Ä\å.Û\ê\ï…Bb±ˆ\ß\ï\'\\WG±X$>§3%\çÕ»B\Î\ãT*iG\ÛJÉ´i\ÓQU•b>\ç>ø\ÎKŸS…(‚8\ï ˆª¸\á\ã‡:CgEa\æ\ÌÙr•˜¦I<¯t°J«|Š\nhf.O,£µµ@ `«·\Ìäœ§\ë:º®s\àÀJ>e*¼ø\âZ|ğAŠ¥7Ş²†Û¶’ˆÇ‰§R<ğ\ß;\'37¸ƒü\âùµ455\Ğ\Ü\ÖÎ›o¾\Éÿñó½\ï}yó\æ8u•$“Iz{{Q…@\Ùq¨\ékûHeU\Óhii\á\è‘#\Ä\ãqšš[\ì<€aSK\étY*\"…P(HkkgÎq\ßü\Ú5\×Lñ=œ\ç\Ñ] ¾nŠ\â\røÛ¾I&“Á4\Ïu:\ìÚ•+Y+‹!¥¤±©	\Ã0(\n˜•i‰-RM\Ó*v\ÎaR²i\Ó&şÖ·C\×u\Ş~õe†û\Ée³v>¾FˆÌ„º)\à­_=¨.€±xnó(\0›6m\â\à‰\' ³³³\Â¹\\\Ñ\ÑQ\ÛYqW\Ï\í.“´l\Æôú|Dš[\Ğ4T*I±T@WªöJ:ÿ\\¬\\.\×\ë\Å\ív‰D8s\æ4…\\\Ö{\Ûc\Ï{ÿõş›. 3w^.¥e„\Âa\Û>\0Hˆ%X‚Šı€š\nIp¶i! ¢Şš\"tİ°U(\Ø\ÎVM#¤”hº=\È\Ëf³Œ‡±,‹\'Nr\ï½÷rğ€¨Y(\è;ut„\ÛaÆ•0k5š\í5)!ƒ¢	B`\Çª”õ\Úk¯ñ\å/™\ï|\ç;,X0„=\ê\ë\ëC\Ç\ë;Û¦€d*I]]M\Ã ™L’\Ï\ç\Ñu£\Ò\á¤=—Ê¿[8@{½hšF]]ªª\â†gö\íy·8/\Zõ‚\0÷\×\0‚\0ºaMXRÚ£}˜X‘2\ëPY<¦`š$	\Ün\r\r\rH)\É\årÎ”½\ã\íT4ME\Ót2™ƒƒCtu\Ídß¾}\Üÿı9z¯\ÏG&±\ßõ5\Âò5Ğ±|\rvŒ÷ÁÀAHÚŸÙ¸y!S® ¯·¢\î\î»\ï~y\æ_˜\Ö9\İ)s\İ\Ğ1tc‚\Û\\¦L&‹eYx<n\Z\Z\é\é\é!Ÿ\É\á÷&õ&PM‚\\®\Z[\â\Ğupr\ÙóE—K˜ê‘•?AÁ4\Ïó°*¶^8\î\Ô&“Î\Éd…BDš\"HiÙ•+§©GªªhºF&“bhhˆ‘‘|ğ!6o~—%+®\às_¼·_…\ë^\Ç4\Ü\È\îCÉ„mpt=Œ„tJ…s\ÄÓ–‡HK+_ü£/1cV7ÿú\Ô÷Ù¸q_ı\êŸów÷·D£Qb±\r\rÀ©TQÚD&“Á\ï÷3eJ§N$™L\ĞišTj *9µ+\ì\Åb\Ñ1\àq»\Ñ4bÁl>~ zcb\r} @64v!¦™·’T·B¥C\Êƒ$N‘\Ëe™s\Ùe¸\\.»\Î\í[B\ì\ä€À\íq²g\Ï~ø\Ãòú\ë¯1\ÑR\î}\è›Ba.[¸ˆO~\æwy\ã\Å_±şÀK¬‡‘öx$\ØSÚŸ\î]H6N o3M‘f>y\ãg¹\îwnD\n¸\ëò£ÿó8/¼ğKNŸ\î\ãê«¯\ìE:{E¼ª\r\ì†\ÙUL¥Røı::¦¢(\ncc#tvu\ÙM(;H5M«}\ßNd{£–%\í!T™‘¤e”\Ìü¤X\\@”\ÑÀ²œ]\ÚL¦š\Îş°¤$™ŒcYmmí€½w\ÓtÎš®\åL}û»\Û\í&—\Ëñı\ï?I<c\Îü\Üy\Ï}‚ö\0N(\n³\ç\ÎgÚŒ™œùúı9M]0\ç:h\î†P^ „$bEù\Ó;~‹\ÆH3‘\Ö\ÖJG54E¸ı®{H\Äb\ìÚ±\'O\0\àö¸	*w\\õ+²\Ù,…‚\ín‡Ba\â±8¥R\É7QMw.B•G\Â¨T*¡(—\Öõ“¦º\íñ_*ÿv\ßÍŠtvgWz^P‘ ó$ ¦2–e122‚ªªttL\étº*ò5’&pvu#p»\ÜH)¢kv7_}ø¿in\Û6®g\Û\Æ\rx}>š\Û\Úp…\Z`ñM°øfplÕ–K@j\n9$°`v˜%Ë¯ d•\ÈfÒ¤“Ig\Ú\ÉM}c÷<ô0?ÿñ3¬{ùE\0ü¾@µ-\çz2€Y°g\ê\İn7---9r˜x<N}}}E\ZD¹»j^­|••˜ø\í\Â4)@ÿz\ï\ç,8ß™Qk®f.\×‚85)\äò¤’)Z[\Ûq»\İ©Lº\â~\Û\Ó7e@ @Ø“’B\Zš\"\Üö¥»hni\ÇôJfÏ‹?dtxˆ\è\èL½ü\ËAÑ¡ÿ\0œ|FOAbÀö\â\ä¯ûm^\Êe|t„\áÁ\â±qJE‹\îyó¹\é¶? !\áÿôvm\Û\Ê\Ø\È0†\Ëe·\r\ì¯€eJ%²\Ù>o\r\r\r\0\Ä\ÇÇ©¯«¯\nš˜À\Ò ò¯¢úw.M\ÎÒœ=™\åAª\r’pQa•\èx)%S:¦ ª\nf!™·\ÇN\Õô5ƒQ§En·!\ÍmmL›9‹\Úmøõ\rM\Ô76U@m\îÍ°ÿ­Ó”ş\nö¿™‰+Éªª®¯#§¡1Âœy	76\âv»ñø|x¼>@\àv{(˜&†a ¨ª\r†S­rg\×öx&›A\Êuõõ\èºA<³£YËª¡–$Hd\ì’œ qµô¡\0ªŠ±] }w7ÔšF!axhM\ÓhkkGA.—¥d•&ˆ~u‰­Z7—Ë…¢(dR)\çBVw\à\Ë\ê{3ıfz†C\Û\ßa2ºbõµ\ÜúG‚\Ï¨tR9;[{{Ë™¾L3\Ï\ïC×	\Ü?™3“\Íd)K46Fğù|d³ò¹^¯w¶R\Í\à\Ä\êB?M:·\æñ\ÕpM\ê—CU‚j¹\ÍFLb:‰¡PØ¹<\ÏöıK¥\ê\ÖG)\Ë{\Îm¿\Ä\íñ\Ç0M³yµòN\'K\r!?K]†¦—\Ïi›Hs\çÍ¥«³ƒ–\Æ:\Â~šª\"¤³\Í\Å\É`|Ìô\ÕuE­\\s\Şp¢ü†eYd³\Â\á0>¿\\6K6›µß›L\n\Ê6û\"¤«ÂªsO>-:¹IKSUM)aOˆ–%GsV\í4e®´\r|¹nñD3Ÿ§¥¹™p¸R©dO¬\ÖJ€ò™T\àõx\Ä\Ì\å¨D‘–U„¬‚ªj*mS:œqD\\AµB\ë<\èXD2\ÜÀ¬¶f\ÂÁ\0(–Jdryb\É£ñÙ¼I&Ÿg¨ÿ,¥b	\Ç\ëWV.Rœ×±\Û0\Ç	B\áz:¦L\åt_\éTŠº†\å*—ŸšÏ£jæª \è\Õ\ÔIc¼\'H\Å,\Ìµ\çó\ãØ ²¨Šª÷U!)I$\â\nE\Z\Z1\Ë*\áv»QRIûY®~\å%lBJ\\n`¯°V(kÊ­\àDtd„’\æY+ s…=rA\Ò[´\ïºvY†¦\á\n\è\ÔüLo‹P,–ˆ&Sü\"BJ—\ÛUµ‰eªmZ\Íÿóf‚™§}Š\Õ‹\Åh›Ú\êt•,›¨2\×y UäŠ’¡ô\ä1øğ\â>[*o”Å½\"ö\Êú­bƒ„ X(’J$PA[\Û (\nõõ\r‹%\ÆbQ¨¨G	•SUòù|\0DÇ†+ ˆš-’µ#9…\â5­\ì\ìB¢§\á\Ì\Ò\ã*\Å\Â\Õ\\ˆ4M¥!è§I!„\ÏL`„‰\äŒşI6M“––t]·\ã+Jhµjªfó–<—¤”+·ƒM¤\å$\Ô\ê\å	[\Ümˆ(\n\Äq„ø|~G\Âl\"‘…bD\Ò9^\æ\\n\Å\æ¼r,À™¾^\ÊdYIo—oh:Ù¢$:ız¤’ƒ\Ì8ô\î€c\à\ì(\æQ>ñ	„,UÊ©-­ÜÁ¡a\Îô\Øg\Ïyj–b&\éK\á´Q\×4\"M|>?f!OCCƒ½–”Ï£hj…\á\Ê]UY;7\Ûsñ¸\0~\n ³f.®\âŠJÀ\á!ª¢R,Yÿ\Î[¬X¹’\Î\é3lIR\ÍH™lv¢›mpyl\ßddp„\Äc„ü>|n7uAª¢ )\n§\ã&…\Ò|o°§|J&[¡s9CS–“Z¥İµkV\Ù\\ş±q\Şß»ŸÁAU\Åp–¹\å¤\Òc\×O\×uZ\"\ÍL3\ÏÎ;G(‚b©h÷A¹-¼@\Ï\×<\ÖaÕ»5\ëô$\É>@\ç\ÆNW:Ù‘&—\Ç\Íò•+9~\ì(gÏœ\å—\Ïÿ‚\å+V²xñü~?†a\Ğ\Ñ>…\Ó}\â\âTB¨M\Ç\år‹Fi©³x\Öô\êrvÃ¥´\ë¡ğÒ·aû{v{\Ú\å\Ğ}=´\Î\İ\ÃxÈƒ©¸)Yf¡@\Î,K¦‹1–HR²,ú\ÎöGS\ÕJL„\İ0&t`YNí˜Š®j°q\ãN÷õY°p1ş`Q~\Í©š%U\Ú\İqûgox\é\İ\İ\r®	[[.	 27”\êª\ÎAu¡B »\\t_6—@ \Ä\É\ÇØ¾m\ÃC\Ã\\±jmm\í\èºAKs3\Îsµ›{UÁ0tF†ˆ&R\ì?\Ù\Ç\ì6^\Ï®Ì¥d2Y˜û;0\ë\Zhš\é\ìñˆ\Ñ†÷\í\æøg\ê\É$\ZH\çr¤³y²9³bì…”¤RI’±ŸEU\'•!@€HcÁ±£GØ¼ycc£´´´2»{~¿‰“¨²K \ÓÁ½)×•7©â†µ\'?»±+XY¸û@€¤”\Z­\êö‹sUTY¶¤”(ŠJ[\Ç\ê\ê9°?==\'fÕª+™5û2ü>?­‘f\ÎP¬9¶Y\0BQ\Ğuƒ|>\Ï\àÀ fÁö¶\"u!¦5Gœ\Ó{UÆ¥—\á\Åw€\Ñšùœ=G\ßFöï§˜sô\è\'0\å,*\ìS\ÓsRR\É\étŠÆ¦¦jÏ–mƒ°‡BDšš)¼ó\Îz´\ïª\ës\íS1\\†s›W5ósÍ‹”\Ë…pÌ…=&\Ì\ë¾Å»†sÿõ\Úo,š-¾X\ïÑŠp	\0e3Š\Å\"†aT£ö% \ÏJVo·±‚\×\ïg\É\Ò\Ë\é\ëí¡··‡7\Şxƒ\Ş\Ş^®¼\êj\ê\ë\ëi.\Z²g°°ªi¸\\.rù\ãc£445‘Í™ô\Ó78B}0H\Ø\ï\ådJ!\ê›j\ï¾;½¼=\Û\íú\éˆ\Ìd8\Z£³\"\ÛLø´,‹Á³g‘R\âó;§\×\×ü®)*\r\r\r\Ô\Õ\Õ144Ä–w7s\ê\ÔI‚Á³\æt\Óif•_t€®Á¹úP”»K\"¤U\é[E·\Û~ j\Înòh÷v…µ~`;\\@…b)-„°½´\Ê\Øq\×ÈŠ²ŸV%K\Ó5:g\Ì r\ä\Ğ!:H,gÕª+\é\ì\ì\Ä4M¢\Ñ(–tB¶„@\ÓT¬’E,:f?“ösKJ\Æ\âqF\ã	¶Œ\Ã\É-°ÿ\ë\\ü˜¶\Ô^¶\Õ\İ\Ô9RJ\Î\Ú\Ûv\Ün\çjk‡\ßE¡¹µ… ?Àñ\ã\ÇÙ°~=±\Ø8m\í\í\Ìèš…/\à¯:e$j\ÅFN,R8ˆ•\ÛR¦r0Š\Û\ëG÷øH,¶e¶ü_x£7\Óó\Éi\Ş\áÿ9\Ã`r4\å¯y\0\0\0\0IEND®B`‚','image/png','alain.png','Salvador','','',2,0),(13,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0€\0\0\0€\0\0\0\Ã>a\Ë\0\0 \0IDATx^Ô½wœ$Wy\ïı=UÕ¹§§§\'‡\Í9g\í*\'D0\n€‘m,°\r0™\Ë\Å\\.\É\Øcƒ1&	$„„( ”ó®vW›\ãl˜\İÙ‰\İ=«««\ê¼T\è\İ\ÙÕ†Y¿öï³½\Ó]]u\êôy\ây\çœœGüİ—¾ºü¡{~|‡^,$£±\Ä\Ìr±0?	³|\Ùrº»»ıó„§h\åô!¥œğøÙ¶/¥DqB»^{\'»@©T\â\àÁƒ~\×\Ü\ÜLss3š¦aY\Ã\Ã\Ãl|m\áXl_C\"y\ËS=ºy\Â\Ï´\×;\á\\ğÏŸü\Û\ÍÀ­\ïù\È\íó÷\ï\Üú¯Úˆ˜¿xñ\":::Ç\ç\r\ä\Ùj2q*¢Nt\ÎDR@ €¦ihšF0ô\ßÛ¶\r€eYô\ëÇ¨vª¥\íHGgOö¤œ÷\Ã[ß¶´”\Ïÿ0Ÿ\Í,½\à‚´d2‰rBŸ+L†8U§\Ã¤”˜¦\é\ß[¢(ö¥Z­²w\ï^:`\Â\Ñ#‹V¬¾e\êŒY[şñ“«Ÿpò$C}½\ÎW\\÷–u\é‘\áû\r½¸`\Åò•JKK+B©\r@ı\àœ	‘^Ç·7m{mN\ÔW\ï³m\Û†¢(¨ª\ê¿E9)ñ\ÆPiii!Ñ™\Ìh\ã\á\ŞŞ·ç²™\é³\æ>wp\ßã„‹&\ç.¿ö\ÍKs\Ù\ÌOl³:{Å²´¶¶\"\êœ\É Ğ©p>Ú—R\"¥D\×urù\éL†ô\è(º®FQ\Å?÷t\î/„ ‹\Ñ\Ò\ÒB©Xˆ\ë?²Ö´ªóÿæ“ŸÙœjk\Ï\ìØ¼ñô\Õ\Ï`\Ò\à\Ñ7)\ÇVŒ¥GŸT…\ìY{ÁZš’M˜@rw¨&ú,¥Ä¶\íq\Z£ºM§I§\Ó‹E¤”ƒÁ\×\ÕRJ,\Ëòß—J%„¨ª:\îûŠaP©T\È\nd³Y†‡‡$É/\Ğu\Ó2‰7\ÄI$\ZL\Ü×‰P\Ò\Ë:t˜ı½û9\Ğ\Û\Ë\èhÚ\Å\â£\nR=Ø»Y\"Ù´iû\æ\é\×k\çl0©N\à/}•/ıı\ß]‘\Íd¾­‹É®®NúE „BLŸ6Í±ÿ§\Ïó\È\çóD£QTU¥X,¢\ë:„B¡qöXJ\É\Ø\ØC#\ÃşñB¡€ªª\Äb±Ú‡\Za²\Ù,•J…\æ\æfr¹###L›6\r\0]\×I§Ó˜¦IÅ¬R­V}\ç\ÍijrA$FŠŸ“\Í <H)‘–$\Í\Ò\×wU\Ó\Ì\Æ\æ\æ\Î_²üğŠ\åK÷µMŸğO\ßt\Ùyó&UØ¦\Õqhßo”‹9Õ–\Ö`©\\\Î%²Ù¬\Ú\Ş\ÚNS²	˜˜ş•J…L&C0ô¥¯T*144„ªª2™£®š­·¯–e1::J\Å0|#-\Ó4‰\Ç\ã¾ıõˆa\Ú\ÅR‘cd³Y\"‘ù|\Ñ\ÑQl\Û&•J\Ğ\ß\ßO>Ÿ§b˜–5¡xüO)•J\äóy\çºJ\Å÷N¥	BÁ ­­-h ccYÅ¶­Ø¬9ó²E`\Ë\í\ïı\ã\êI/œL*\ìØ²©024ø£L:ó­Ÿ>üû\ï\ìŞµs Ÿ\Í^;{\Ö\ìÈŒ\é3|»8\ÑX˜¶\Í\Ñcı”ŠEªÈŒe\Éd3¡ ‹%\Ç\î\ærèºeYX–\Å\Ø\Ø–¬“N\ï:\Z\n…\0\ÇI\Ë\n0<<ŒQ1@T\Í*\ÅR)	mhh`dt”|±PklB\ß\å\Ä\ÃRJŒj•ŠaP*•\È\æ\Æ0ªU´@€€8±\r¥R™#G\ĞT°m†‡G¦gF‡/\ÓÁ£\Û6m\Øy\ÂE“ˆIe€z\îİ·vtğ\Ø÷›ššÚ—,ZB \0N>ß·¤M±X¤\\.S,|\â\Ù\à\×uL\Ó\Ät\í5€a”ŠEJ¥¦i:­»M{ş¦”’D\"a0šI£\ëºR½€pzhKI.Ÿ¯µw2\á•\'ùJ€t¯“ôJ…B±H8\"?U$’L&\Í\Î];\É\å‹\Ø\Ò\Â\ĞK¹\\öòùK–\ËW¯Û¸kÛ–ñ\Ü=I8/ğ\Ş\ß>÷\ÈÁŞ§Â¡P\Ûê•«	…Cµ/¾ƒT!A/•)W*\ØH\Ê\ÌX\Ã0|»P\ŞK\â07\àu·A\0¦iR\Öu†††(W*§5—¯T*¯wŠ‰@LğÂ–\"‘\È	©¢¨¤R\Í4440–\ËbU¦Ï™¿¥gÚŒß™\Õ\ê¬@ ¸×¶-\Ü\êœ1©N À\ç¿ö\ß>ô‹/Zf5±|\Ù2\Â\á°\'ø\ØHò\Ù\ÅbÑ±šŠP_5Z\ÒvD:d\Ûv\Í\ér¥Í—\Ê\ã\éx%¤û²m›\\!?\á9g‚\ão)¼®”{\ç\ØHŸÁ% hªFKs3©TjB\'÷¼ÎN¢‘›7¿Fÿ¡\ËccOı\İ?}ı¶›/Ynr0©\Z\àCÿû3\Ñgÿ\èõ¾uñ\â%j<§Z5°Áq\ØP0Œ\n###”J%Š¥2\ÅR‘\\>O¾P R©\Å<<\ïÚ— Q£ŸÀ0\n\ã4Ê¸“\ê>Ÿ\êUı¸ö%R\n„Cj\ÏÀÒ½µ@httt\Ğ\Ğ\Ğp’i\ìø\à’ªj„B!2\éQr¹\ì\ê­_\é¹\íÃ·?ûôo=/3Ie\0Uˆ\rû”¶’\Éf\è;|ˆ£G\Ğ\Ğ\Ğ@¢!áœ£j\äóyG‹šTI)}©ò	\ì}W÷\Ùw¼)|\âŸ@ I†\ÏO\ã\Ú?õ\'º\ß4•ŠaP,)ºşŠ®\ë”\Ëe\Ãaø@Àñ¤”8p€-[¶ …Â…ds\ËcÁP\èUUÕ¶oz\å\Å\"\ç“j¦Ìœ³1\Ù\Òz“@\"m{ú@ÿ\ÑO*¶\Õ\Ò\Ö\ÚîŸ£i\ÎÜ¼R©8ª\Ó#¬¯_¥û¿B( ¹^º‰m¹v^\ÚH¡8r&\0\é¨\Üzğ|A\Â8&•€¢‚ªF²±‘W.¥½%\Å3\ë7²{ÿ!,Û¦b8ñ)3!Š \Z‰\Ò‹¹f@¢(\nmmm\ìİ»—TK[\ï\êK¯øÄ—ÿş=O=ö\è	}™,œ·!»\ê\Í7üYÿ¡?¾`õj\Ú\Û;\0‰”`\Û\år™¾¾>,)O`\0	¨ŠÂœSy\Ç[\ŞH<aó\Î=\ìÚµ›¡\ÌC\Ù†i\Ö1Œ\Ë\çu&@U¡)¥³¹‰©\í\Í\\06ó/\"œh…R™ÿ¸\ë>^Ú´Ë²|F\Ò\Ó\"\ÎT³½½`0X\ç˜:w\é\ï?\Ê\æÍ›\éš>\ã+7ı\Ùû?ûw¼¹n>:¹˜T\rP±ô\È©¦$\Éd\Ò=¢`e†††j\ŞüqğTı\ê%x\ÏMoeJg;ÁüS\É-š\Æp&\ÏÁ¡öö±¿ˆ\Ñ¹bg\"u¹@8D\ëinb\Ù\ì)t7§˜\Ñ\ÑLGª‰\ÆXU`iƒPhˆDyÏ\×cY6¯lÚŠ…\í6¶UU%3\æd~C ‰D\Âõ\í\í\íÌ;—»v|\à®o}mÿı\Ïlú\ÎÍ—­8/\ÓÀó2j\ïı\È\í7¼ø\äo\ï[¾tY°§§\Ï0š¦IÿQòW§Æ÷MeÅ¢ù\Üş¾wD}c \ÊÈ\0Ë’Ø¶Ä’ƒ\é<\Ùb‘ƒ#drô¤É—t*UÓ²°¤Ä´,ò%Ûª¡ç¶…‚¡ \'şRU¢¡ ¡`€ö¦©$§v\Ò\İ\ÚL2\Z\" ©(BE„R›(\Ñ\ÜZ\Ğo?=6\Æ7\îü9\ë·\ìp\ÎÂ\á8\×(R`H\Ä\è\é\î—@’R²uû6zÔ›š›?øÊ³\Ïüˆó€I\×\0?ş\ÍsÁ¯şı\Ç\Ş\×[[[Gª¥´\Ñ4•H4B¾”$5\'@(‚…sfò\ïx±hÄ—i)A\ê%\Çù’E\Í\ã[•-@+fO\é†yõ\n¹’A\É0°,“bY\çÏ¾\Ê\á¡Q\ne\éz\İ\í\Én¹t-šª ¨Â‘\ÄH˜\ÖdMñ(Mñû\çu\Õ\ï±€3mE:o¥^†x\ĞıÍ‚¦\Æ$~ó\rf9tôX\Ípm–\Ä1^\è»Š¢0cú<Nµ¶¿ø\Ñ	\'M&\àî•¶´wwMõC°^ Ç¶-\0ªP1……O| «µ…÷\Ü|=­\Í\ã%\ËBZ\î4¸^_IG¥J!¾\r•hªB2¡1\Zó¯‘\Ò& \Ù}\ä¿Y¿…™\í\Í$	._2‡e3{üö¤®½w\Úl!‚ù\Ä÷X \În\é|.ñF¼©‚0¥£w½õ\Z¾s\ï/ÉŒ\åNğ]„”\Ö\nH)\é\ë\ëC\Õ4\İ4Œ\â\È\ë&R H!\ì\Æ\à™M\ìN›\n†¥ TOj‹>ñÿ¢=ñğƒ\×T+•™==S§\ä)Ÿ\ÏS.—)‹N\Âwİ±kˆ\Çø‹w½9Ó¦ŒZ\0ª:Ò²\ê¤Î•<Ü€‹”ŒUÀÆŸ8\n\Ëgö°pj]©3;\Û\èH%PP\Òv§—Â¡št.ôH-„DJ!ü#øû}`™HC‡P\Ä\ï‹P.ZµŒ\áQ~ò\ËGn»\Şo?™\ïR,9p —H,öƒ÷üõ\í¿ııÃ¿šğ<\0!\"±¡“\Ó\æd¨\Ïf¾.T…pÅ²Oz\ÍúgŸN \åû{ºº…UhY¤³*U\'[WOä€¦q\İ\å±t\Ş\ì\ÚqWc j\Õq®¼=‡\n\Çõó9©œ\Ñõ\Ün—PAM\ã\âEs\èjnr‰\ïIjıõ4K·!‰@z\ê\Şô\Z\á]fn\Ï%ˆŠ\î\äCQ\×]~Ó§vÕš¨\ÃD&@PT…J¥¢G\Z\ZN	B\Ø\raí¬¢…§\Í\0ñ j!J¦%ƒEcb&\è\èî¹®\Ïvuw÷8?TJ4M#\Z‹ù¾’‡„6k–,\à\Æ7^A0 ¹\ãÈ„\"\ØWÀ¡³\İsğ¤\Ñk\×N\ç\Æ\î\á\Z£H\×^;Q7gJ\ê8Áe­—˜®¬\Ö\Ú¸b+q\ì¿GN\é\Ş\ß\Æ6t„i\Õ\İ\İA<á¶›o ¡!†^Ğ«4.µ\n†\è\ê\è\"\İp\ï÷şc>Ç¡jYÁ‚abAõ¬ˆgÀ\0\0!U„(y\Ã>Á|\ìÜ²ñıMMEa\ï\Ş=¤\ÓiE!‹¡úªÕ4-À\Íoyñx”ZˆM …«À­*\ÂÔ©WñJı¨zŒ\àK:ş¨{\ë¯y9.¢\è”ºóİ¶„ğÂ¹\Îû\Z±k÷p\Ş{\Äw¿6«H³\âû%~W\ÙÓ¦°r\Ñœò(üö²™,}G’ÍaÛ–ÿ]w\Ïr™ô\ìlzdq]3TM;\ãA\åœ\ëÏˆ\0bAÅS\ØUÓK)€÷|\à£o(sGFGYÿ\Ê+8x\ĞW­\Ñht\\\ZT\n‡\0W_t³¦ö\ÔóP7hn&ğ¿-$\Ôò¾N¯…m!\İts\Ë\0„¹d\ÕR\âÑˆ\\\âd,mi;A#\Û]‹  !§¹)…´Ì\r›b\ÅÒª¶T°)1	8cğ\r(¶¦\nÃ’2úƒû~Ş¹u\Ó\Û\Zšš:._I0#\Z	\Ó\ØØˆ”Òy{Hš\Z\\}\Ñ~•ğñRB¥\Ìœ¨z„QFJ\ßXÕ*X±hÓº:œ«\Äø\ßm\Û6¶\Ëğ\n‚`0H{G;÷\ïYú»î™®\n¢ ”hP\Õ3wø&\ÂY3\0€Â°‘ú’ùsƒº\ãÿğñ\Ï~™[\ŞûAšš[hJµ ªª\ï\Ö\ç\Ø%0o\æ4º;Zı\á«(	H\ËDš§Ÿ—ÿÿ²\î%œ?VŒZ\ß\ë\Í@(d\íò\Å\'†¯\ëÀ›6M\É‘p4ü‡\Çıˆ¦`\ÄB\ç®ö\ëqN\0TTsÁ\ÜÙ…¯{Ã§W­X1\í\è¡;ú\Ñ\Õ\å¬ş±m§6ğG\"²jñ|\Z¢Q<\ã\é~\êF¡¢#\ìIaòÿB\Ôù\"¥\ç\ëÿ*\é\Ìa.^µœ¦†\ŞD¨\ã\ïˆ```€›7bq\ä\àÁ\ÃMU\Î\Ú\Ù;Î™\0\â!\ÍnkYu¬?û›Ÿı\à~U@2\Ñ8•µÎ¬½†H4\Â\ÒùsÁsö8®FHJ0\r\0ÿg \Î\âKÀ¬‚ew\Øy„™3Ã‰“ø3I\éÃ§¿dû\Î”õò3«/¼ì¶—Ÿ{úœL\nxø\Ğ\íwh\åªõg­m(Š3·­V«õ>\0-)\Ú[Rşg\×}\ÂŠ\Ët\àx5ù\ß\rüˆ÷r!-i\èş¯\à›$„CA\æN\ïñg$ş\ØHj1	)°\Ì*Ò¶_y\ã\Û\ßù\ç	“\Ê\0©Ö©C\Ó\Û\Ú\Úü¢i\Ç\Í¥d\é¼9(J]\í<\ã5„4«PTS÷_À\×ô,]\'QQ¦vwº&°†ñ!a‰P‚ÁPØ²\ÌÓØ)&•JÅ¼´‹.n>€³g\0’ºTKMJ¤„j¤Í‰\Òÿ¸1Q1|?¦fÙWGk\É\ÆÄ¸(¶¦iuAaT(–Š¥÷¼\é²ó&\r“\Ê\0`p {\Úô-CCƒH\Ûùe¡Ph\\¨5\Ğ\İ\Ş\n\Ô|\0d&\ĞKˆ\É\í\Ú-¼õ	–	•\n³ƒ\ã-©F\Z\â\Ñq<nº®;šQxLs~…`RGù\Â\Ë\ßP0«\æO‡GF°¥U\âñ¸i\ÙgN\\\ï‡bm¼\é\ßqIÿ1\0\n°õRBm>\ãxªğ\Ô}\í7–\Ëeúûû¸\Éyúé™’©¤Kµ\ÅFJV7•±Š©œ,¾&¸ı½\ï6»¦Lİ¢¨‘B.”UQH&hnø³bü\ì¡\Çı\ÅBº®Ÿ\à$\îÀ79Š“˜‘õÇ¼S\êº/\Çı9\r§-ôbÙ½\Çx\ã\ä“J­a÷\é÷\Ç9ß±õNd¯\\,`W*ÆD\ß\à\éÌ˜\ß¿y¤¿ˆFH…Zªû\ì3,r•qXvıœKK†5 h\ØAİ”6H;¬)g=_¼j\í®};v\ìmñ\ÊÁ4\ÕY\êeV\Î\Şs\à0\Ïm\Ø\Ì.Y7şb	R/»İ«\Ù\ÎúK\Ü!}&n–P\n¯.\ß8/S{RH|MS5M\ÒÇ\Ñ\Ô\ÑN$¯\é$\Ç\Æšz\İ-@7õqğ\è\0ùb‘¡L–l¾\È\èXk¯½†P,Fw{z¥Â¼9³\Z!3–£^\ÅK ™lòı\0USí¦¶VóÀş}œ\rtSj¶”¶»f\ÊhŠ÷\ÉüO± bè¦­€ l\Ê0R\ê6±À‰\ë\ÙN…Yó§«†‘-œ:F\İ]•S­\ÖÔª©Ä¢\Ñ\Z™\Üì´ª\Èjl\Ë\É\ÚyI‡\Âø÷\ÆL\ÖW\ä»lRG\áÿ÷:„Ä®\ZT+™cƒhS§A(H\á$”\Æ1—p‚\\Å’Î¿\ßó\0/¾¶¾aF²cT*¹b\ËM\ìË•˜5}:€ŠmKşò\Ïş˜şÁa*†‰C‡\àŠ¢‰8µ•JM\Õì®i•¼8a·\'B\Õt\nm,D¤.ÀNœ¢Hd;\ÔI¾®›2ˆD)›¶)vX§¥ş\ìM—\å\æ-ZRÍ¦ıoúûÇ­\ÅX»t®\\‚^Û±Ã¨2<:\Ê\à\àOü\áI,Ó¤«-EGª‰iİ´55\Ñ\Õ\ŞÂ”ö6Â¡ ¢t	\ïÏ›ñUo\r5Mp\Üó…›Í«V-¶\ï;@5›¥¥¡Ñ£Gi2USpR‰N}á±¡Qö>\Â\ÃÏ¼ÀİüÑ±\Ü\Ä÷pñ\Ôó/ó–k®\â\'÷?È”®Nz&_,¡i\n†Y3]¶m366F<£¤—±¥4C\áØ©w‘\Ö-’A¶ll)%\á€rZÉ¢“\Î/Ãš0tS*H4!š–DS\Åi5:gÁ\âŞ¾\Ş\İv±XT\Ïæ¥’	\ŞzÕ¥x{÷/¤9\Ù\Äs/¯\'ñÀ£¿;¡½–\Æ3§tq\Õ\ÚU¼ó\Ú+˜?c*š¦‚p™ Nû\Òl\Û¦³X–MO{\Ë	mº\'\ã6B&W\à\Óß¾‹k—\Î\ç-¬¤8–#&\ÕÙ”6\élM»÷òô«[ya\ÓV¶\î\ë%=V+nu01\Ã\r²i\ë\Z\Z\â aı¦×¸õ\æ±-›Gz~œ–*œE3¥R	 4m\æ¬\Ş\Z<•ª\ÖT\Ç\É\nh\Ê­ :e€Á•z£bÙ¦%¥f\ÙvJJr(š¶\Ùœøòu—_õ‹};·üM>Ÿ{\Ç$NõÏ›®¸ˆ™=µ-\âö÷\Ä\è1X0o6üö‰‰šcd,\Ç\ÈXM»öñ\Ãeù¼Y¼\í\ÊK¸r\Ír’\r\rÄ£aB §úù¢\Î\ç¾õcr…?ıÒ§&4\Î!‡	t£\ÂŞ¾~®Y2Ÿ\ÃÃ£TªU\Æö`ÿ\è›ööò\â–”õ\nÅ²\î¯P´$\â\\03:Z\ëZ«ıõ5c²\êºkxe\Óf¶\ì\Ü\ÍGSI\Ş{\Ë\r$\r<ø»\')•u„X¦E6›¥P(`šF¡½§\ç À´¤&±5Eˆ¸-\É*B\ØBœ–®\ÇiE˜Bªb6,RjqM±+–4Bª8!H±`\Ù\ÊÍ–´\í\\¡€¦©}0¥½K×¬@\r86ihd”L.Gs¹‰9SzK§\éLy\ëÀ²%\ÙB\ÃM&UM“Á\Ñ¿°\Ç_\Ø@{*É²y³™?µ›YİL\ïjg\æô©tµ·\"%\äŠ%rù\" \Ó« \Ü\Â\"AÕ´\Édù\ÖÃ¿§X©\ÎÑ\ã/Ueş”NM›\Â\Ò\éS™?­›%3¦ zE¾¨ù%HL›N g‹Ì£¯\0£b‰„Y>6Ï­\ßHŸ^ÁóYr¹¹\\Š^)tuO§¤”Š”2nK‰¦(¦b„sÀi1@=‚ª(é¦¥(Bˆ[–­ H»ÀM—­2.}Ãµû\n…üÒ††ÀûÑ±1^İº“T¢H8\Ì\à\È\ïÏ­¬X²ˆ°€š]­\âZs¤”ªı#öõòì¶\ì=:@Õ²°m\É`:\Ëo_\ÜÀo_\Ü@8 \Ù#\Ù\Ø@C,F@U\Ù{¸Ÿ\Õ\æ\àQ\Å\á·–\Ğ\×\Ô)Fµ\ê0LÑ±rŠ\ÎK¨ŠBOKŠuó\çrù²Lkk¦=\ÙH$\Ä3!><«\"½ü¦D‹D‰wuil ™œÏ’N…\×H&Ã·~zG†ü\ël T.‘Ë’jk7şôÍ—tÇ±S\n	šq6<Î˜\0Âšj: —M+ø\È/9ó¸\à\Ê+¯\Ôg\Î_´\íûÿù=-\í÷Ü½}©¿G€\\¡\Èw\ï}—6m\åc\ï}7‹\ç\Íeñü¹\0Ø–Eô\Âudö×ŸÀ\Ê\Ù\ÓA\n>öökyu\ßA\Ö\ï\îeË\Ãôb0“¥X1Ğ«U\ÒY\Ò\ãƒLR\0\Â	+_\Êp@\çŸ\ÍÀ\È(k\ÌF‚\îTŠT#M£»¹‰ùSº˜\Ó\Ó\á©\r·o5mr‘\î!\Çy\Z\'\Ú\ÒJ¤±	DM#`p$nT±¥\Û%÷‹JÕ ¬W\èj\ë\Z¸ó®»[¾ü_šğà¡¥C™±\\¾X¼ÿ©\Ç9#;*œ\Ô#¢©\ÆEW\\ı±»wü•”RÙµg\Ï\Æ\ë\Şô–{\ì\İV(ğ…\ÍûO,\ËFQœ}s¼\Â\Ë\Z½}Z“R\á}¬œ=ƒ•³gRªT\è¤4\Ãúİ½¬ß³Ÿ½G\Ç\í 0”\É\âO%\ã¤_`ûß­]¼o\ßñ!*…<I7r\é•ûy„”\ãúYk\Ã#xoe\İlTP\É\ç©\är„’I¤ğ4†dñÜ™üù\Í\×óı{\ÅP:\ë÷QU5\Z\rôõ\î½\ìß¾ö¯wU+úÌ¡¡¡¹(\Z‹V­LZjø\ÌVL€ÿõ™\\ù«Ÿ\İùUM!\Ò\Ù\Ö\"ôR¹k\çW†\ÚõŠ¢„UE!	\ãEı›	nß­tw¶ H\Óbt\×r‡WL\ébı_G²šJ[c’Y\í\\¸`\×_¸Š[¯º˜Ë–\Ì\ç‚y³I\Å\ãÌ›\ÒEws;%\Z\Ó\ÙZ—‚öU\Óv  ’ljB±-LÃ‹Yøv‚q²\ë]+½†¼P\Õx6gšiVtŠCı\ÄÚ»Ğ‚A¿%p–£mÜ±‹L6W\ëTô\n…B!Ğ´Ù¶i47DÃŒŒs´¯o\ê_\â\Óx\é\é\'†™œ³x\èŞ»\Ş\'ñ¼\çOø\ä\ß|€\r[¶ñ\ß¼ÿ¡\ßS-­\Äbq\Z’I$NÛŒ)]´57\á…\è$`šj$J¤µ}d˜B©Loÿ zµŠ7\ã@¹R%S(øidG(\\²x.-	‘\íM \á\æK/@§šù?¾—\'\ÖobÅ‚\ÙN\r¢ôn_§CAš»:\è=ˆU5\İ{8§\Ø\Ò\æµ\ŞC<\Î\ç‚\ÎTmû[OW´5&˜\ÒÚŒª¨!bOUõ¿\×D\İ{‰¤T(’ió\Æ\Ë\Öñ\'7^ÏŒ©=|ôSŸ\ç\Ş™ù\È}÷\Ü\ì`pNğ\Õı<ù™¿ù\Ë\é-©”rõ¥D¸d\í\ZÌ™-mxa=º^\éDĞ¤pj\âD\İ\"H€@8Jr\æ,\nı!ú\âów\ŞÇ¦ı‡±¬ú\n(iY\è\Õ*\ÇW\n½y\Írş÷»\ŞF,®‚h\"Asg;Kf\Ï`Ã½~?ªº¤­O8	E£4u´‘>6€mz>–dËC|ş\î_rp`„š\r %±pø„\ÄN2ã—_\È]´šX(H¤¥\r5\ìõ¯\ä¼\îH)Æ¨\ZüÑµWq\Û;ndş\ì\0¼õš«¸\ïW+c\ÙÌ´¯ü\è¾ø\Çÿü–s^6~Nğ\Ìc­\Æ\ã«;ÛšY¶x¡;¥‚\æTÿğ©Oğñ\Ïı#[÷\ìÃ¬šh\0BB*\é8Wõzo\èöô\ã£ÿy\'\ëw\îe\áÂ…,\\¸r\Å@¯du“}£e4Y»¦£!È”\Æ/l}úù¯¹ã¦·\Ò\"hÁ ÉVÁ\0M‰zôcŠoœ\Ç3‘\r\Í\ÍX¦Mvpl\ÉŞ£|ú®_\Ò2e\Z×¬ZG¡TF\ÇòG\Æt*®9ºƒ´„[6m\ä‹÷ü’ş‘4õ\Ö7\Ò\Ú\Ú6ñı¼›ºÿ›¶U­rõ\Å\ëø\Ì\ß~„x<\ækÁK×®&‹kH¼ù\Ù\Çş\Z°\íÎ~ÿX[!Ÿk»r\íJñ?ÿõ# mnz\ë›hmnâ²µ«\Ù}\à0z¥B<8aÌ\ÊW\ç\Çoİ±‹¿ı\âWØ¸{?·\ß~;·\Şz+, o`˜‘4O\Èrß–l·U®_\Ğ\ÌusS<ú\ëù\î7¾ÆŒW¸\íš+@H\â©&\Âg’lˆ“\É\\›\rµ713ıklmA/\è\ë\ë\ç_x”–)\Óø\Ş÷¾GGW7;÷Æ°m~°a\0õXÏ±j\nº¢e­!^y\éE\î¾\ëGüô\É\Ñ%|\Ñ>#ñ\0\0 \0IDATv\Åj\Z&¸›^©Pp¢~H\á\äNRM¼û\Æˆ\ÅÃŒ\åòü\ç\ïbõò%¼\áòK™>¥›-;÷ueÓ£µû9\à¬\àÛ¿xLù\ânK³j\Ùb\Öo\Ş\Â\ç¾üo\äKeşô72súT•J¥L¼!\î»À×€õ† `¡ô(«×¬á³Ÿı,¡p¤D—\ZO\Èò‡}lŸ€‚d4È²\îF‚\0\×\ßğ6Š¹,÷\Ü}o»h5İ\í4¶µû÷	j²cy\Ê€6¾\ëxxùUUi\é\é\á?<\ËŞ‘,?û\æw™7o£\ÊÎ¬\ÍO\Ö&[®ú\ÅhO„X\Ş\İH,¨ò\Æk®a\Ş\Ü\Ù|ôƒï§¿Pf´¨3…•\Õ41*UŸ\'\Ëå²›\é@×«ü\Ë7¿\Ë=÷\Ş\Ï\ãÓ¦2g\ÖLV.[\Â\Ë_c\Ş\Ò\å]é‘¡À\â¬k\0vm{-\Ø\ÖÙµ`î¬™<ÿòf47ò\×\×]Á÷t}ıı4ªa \×\íÏ—lˆ\×\ÊÄ„À«¹\æŠK¹ó_e\Î\Ô.¶o\ß\î\ŞE\Ğq¬¬’.Y8k\ê‰p€\Û.\Ë\Õ\Ëf3wz+\Ï\ç“wù\ã[ˆD\"$\Û;œ];\\Ê´4%ilˆqğ\è`ĞŸ\Ä\ÈÚŸ`(\ÄEk\×ğ¥ÿû¸ğ\ÂB\n¹dÁT\æu69‰]˜\Ó\Ö\Èß¾q1\Ë\çLcö´nfõt2x°—·_º–oùó¬Xº\È\×v\'\ÜÒ›fJIE/Ñ˜h %•\â\Õ×¶ò\Òó\Ïó\éw¿¡v\î\ÙÇ‚9³\0h\ë\ìºz\Â\ÆN™’\ÅX\ÅR´rÕŠ\ÚÃ’ŠR¥P lJ;ö:\ë\Ì_{ù\Å`!—¿\n §«“~Œµófqñ\âyl\ê=\Ä7¿w\'}ÿ{±*F¹\Âoz#c9RM\î\Ê\\o¬AQT•5Ë—2c\ÚTŒQÎ‰\'\èLFù\Ô[–ñÄ®eKhª`\é”\ëf¶\rª®?(‰V\n¼û\ê‰Ç¢N.\ßwÊœ©˜@ W*\Îı<©®‰ğ¦‰\ë–-`¹-°ô2J\Èq\âf·\'øôõ\Ëù\Õ\æ\Ãu“†p€«v2£%*Ò²8´m3=f>úAš{¦Pc¸	n,%Š\"0«&ÕªIw{€\Æwô®Yº€Usf25\ÕÈ¡\ÃG˜3k\0\Ã\Çn\0>tbcÊ†¥5…ªe¨vÎ°” *\âÕª]ª­$–h‘€Z\ÈU$ ‚ £RR\Èê¦™*a!„Rµ¥<nQ\Âö\Í½\\jkmNÑ˜h \Õ\Ø\È\Êi­5¿zóÕ¼\ã¿\É\å­£¥¹‰\í»ö°t\Ş,®¼\ä\Â::\Î‚–T-©&\ĞÇ°e³P aTø£v\íwørÈ£c…@\Ğ4…`n\Ö\Î6„Pİ±®yğ\áñP€Ş¾~\Ö,vÂ°\'£ÿx8>JX‘·¿ŒH¶\n¶mCpkH!˜ˆ\ÂQ*%EQ12\ÃDúrù\ÕWL5\ã\Ä~\Æ-{ñ\nY4g‰8Ï¿ø2Y<.?½ÿAz÷\ì\å“ıTEpåŠ¥Hi\ÑÚœ\"Ù˜\à\à\Şİ¾0Vµ µ°ª„%\ØU[\èÒ¶ƒ@\'b[J8û:ø©å¦¨\nP[\á›	Ü“u€±ŠŸ¨¶¥„Ši\Åª XR\ê\ÉDB)\n\\ºn\r­M)\îø\àûd)qhh”\áùı“LŸ\Ò\Í/o\à\è±^¯<G\Öı\'l;?Š<vt7¡ƒtM‰+\İ¤€P\ÈUöu\åZ.l	z±„m\Ù\èF\ÕUŠÛ—“˜\ã „ lW¨\ëÅ²Ll\Ó		)A‚!„¦‚¢€ªR¢]]ˆD\Âg´“İ©³­…¿|\×Û±,‹\Çÿc\Ù©Dÿ~\ß/Lg\Í\å˜>¥›\Û\ŞñG¨\í]\ä‹iS¦ğÚ¶\í”\Ë\åD8W-\Û0œÅ¢6nAD$¨ú´<N\ê4†4[Q”’¢Tµl(\0Y m\Úş\Ø\í³¦ôt£TÚ’\r4¥šhŸ6•õúhN\Ä\Øğ\Ê+Ä£1l)Ùµ·÷ÔšWJ‰s	‹DX&€J8\'‹‰5‰Ç‰\ÄcD\â	\"±W-{öU\nw¤RÁªT)f³ü).\Î\"‡¢jAÂ±±D#‰\æ&š:\Úi\êl\'\Ù\ŞN¼©‘h\"N8#	QTpv\ró|‘‰\nijLP(Ø¼u;m--H$•L$\È\è˜1“\Ö\ÖR‰8‘pˆÎ¶fU\Õ\î{\ì‰`\ÈZCQ”’ªıt‹w\à4ÀxH#¤©x9ç°¦\Ç\Òù\å\0sfL# ª\Îj)	\Ã\ZÍ²j\Î¦·¤ü-\á^Ü°[\Ú\'•\ÏğŠ®°,\Èg‘\Ò\ÙQÔ‘V÷w	\ï\n/“\à~\Ç\Ç\ê%\Ål³Zu-¶À–ø~Ã™ÁcW¹>‚ÿ\0,·6\Ñ?×¶@/\áŸN\r	\á\èÀ ­YÉ‹61¯³™]\í”%¨šn4±!eJWŠ\Ú\æ×¶,B\ØAM¥1tvº\Ób€‰P,\äg\0L\í\îBUlË‹\ĞI2ù‘`ˆ¹=Œ¤G\é\é\ê\à¥W7Rõc\ì\'Â‹¤	$Ò¶¡0\Õ\n~ˆwŒ½Ş¨Šš\Ã\æ¦şü“ªF…|&ƒeKl¦t´ú}ôÇ½N†\ã¨\è\ß/ñ\ã]\ìşµr\ÉY#^ò¤xş•\rX–\Å\ÅkW³}\Ç\æM\éD\Ó4‡Å…\ítÛ¶‡\Ãt´µ‚Zztd\ê)=\rœ5Ü·g8\Ï\Å€°¥+’imD£\â‘¥R‰\Ë.\\K¥b°u\×\îS¶)p\è#JE(9[\ãŠ:;\í+SoÀ\ÇI¼ô§S‰”6ù\Ñ4F¥\Âh.O®X\"ˆ$\Ó?@ú\Ø †®3~ñ‰p\Ù\ïdğ~Ÿû¾\î\å÷\Éÿ^8\ïmYÊ»WœŠ»\à‰\ç^$°xÁ<FFF‰E\"46\Ä\ÑTG²…;¶\Î.\ë\ZH©\íÙ¾e\Å)=\rœ\Ş\0*†nL4L8›@#\Üt¨€÷¿\ã\Æ2Y~ó‡g	‚Ì1\r€\í»ö°fÅ²	\Ûs†G@\Õ@³€…Ÿ\Æ=mÔ´E¥T\"ŸÎ€”F\Ã4	\è:Ù¡!`\êZ¦ö j*5­a\×.g!\Üv¤³Y„e‚zò¡MgÙ½o?³fL£­¥!Z@\å÷ı1\Í\É&n¹»\ÛF[KŠH$\\+¶=œµ*ƒJ\Å@\n\"p²]3º»\éŒ\Ç1-UÓ˜6¥›€¦ñÒ«§x\"ª”ñ\ÇFûypP`U-†û:i]	#ùŠ$cnPBqlŒ|:M=\Ó\Ä9\Ó\0)‘\Â]LbZP\Ês|«¯l\ÜLv,Ç¢¹s\èloÃ–’Š^avg=mBQ4\Òr¹Dµjrj›uz8kˆ\Ç\ZFôJ…cƒƒs\êX:Ë¬R\Î\ç\È\æ4§š˜\Ú\ÕE[k;v\ï!{²j)‘Åœ³,\ÌÓ®gA\rÛ²H¸*\ŞQ½£¹<©$ªğH,²CÃ˜•\ãrÿgq\Ï $\Âİ­$TtÇ©=	6o\ÛI¹¬\Ó\Ñ\ŞF<£±1I¾T¡N\ã\í*Š\Z\0M£jšô`š&‰\Æ\äiUiŸ\ng\Í\03\æ-ü®¢(üæ‰§[ \èr¨S\Ùj[6¥ŠAS2IkkŠ¦\ÆFFF38\Ü7®o;Y\Ê#\ÊÅºñ§”š“Á(\ë”\Çò>=+U“]}ı,›9\r¡ˆqN¤U5=v\Ët\íûd¿®İ¦ZõgÇ£\\\Ö\Ù{\à\0ªª0c\Ú4E¡!\Ñ@Å¬º…)\Ò1O¡0(*ƒ\Ã#¼¸a#BQJk.¾\â®\Z<Cœ5\ìØ¼\á©\îi3úŸyñzr/$Z@CQ‚šJÅ¨\Ğ\İ\ÑAKsŠ\Ñl–\ÃGĞ–”Q,\àm¬t¶\Ø\è¥UwCJ	”ô\n[ô±z\îL´@†¦$m)-\Í4¶6£j*Uw=\â¤Â›²HXP\ÊMøû\ÒcYú\r\Ğ³rñB$`\ZUB\0oŒ*Q\'—¸eûN6m\İ\Îô\Ùsù\ï?ş\Ì	\r!Îš.¸ôÊ’¢¨ÿ®W¾õ\ãŸ:Š5\Õ\Ù\á2Ó‘J\Ò\×w”d\"Á\ì\éS\Ë\å\è=\Ô\çLó\\\áÎ¥•\ãËª\ÎB\"%T\r\Ã<\çú}G	j*3;\Ûi\é\é¢e\ÊTZzzh\ÒMKO7\Íİ#‘Z“ŠZº[ZU„\îlm_‘\Ñ}G‘hˆ³|\Éb¤”Œ\Ó\Ò\Ø@8w\ÊP\Ü\İD¿ñƒ;©š&\áHø‹\'\Ü\î,p\Öğ\í¯|Á¼ñ=ñó¶Î®—~ı\Øø\İS\Ï9\ÌO€PhH¥¸h\Ñ\\\á~\Íe]€mK\Öo\Ú\ÌX\á¸B!¡Kğ³ ¼)m,£\â†¶mó\èË›X1g&+V.%l\Ä\ÉC\Õ\È „Sú\íiŒIc\á˜Y·µ­³y†ÀŸmH\è;r„ı‡qñ\Ú\Õ(Š\Âş\è§4©‚Uó\çM$@\Õ±Fl[òó_=\Ìó¯¼ÊŒ9ó}\ã\Ûnù\í©;pz8+«˜\ÊX\Å\ÔşùS\ï_·vÍ½C#£\Æ]÷=\ÈX¾\á(2#ldÑ¼9¼\ïš\Ëø\Î\ï$\n¡(‚-;öP¬c\0ŸÖ\ĞqgN\r!J-‹\Ù?ša\Ï\Ñ\Ş|Ù…$RM€ğox–<v\ÖH\ĞB5-\çò\Ä\îı0M‹UKñ»§\å\'w\ß\Ë\Çn¹³g¢…BK€¦\Ñ?8\Äv?‘5{Ö?ówwœ{1\0 xf›hGÎªe+Ò–Š”¶\"¥¥¸«R”x@Q\ZJJ´|\ë›ÿñğ´i\Óÿ\â\á\ßğÛ§ŸE(*\"‘B‰%HvvpÅª¥¬œ\ÒÅ¯ó;¦O\éao\ï\Òn¬!%ŠD:O˜®û\âø\ZB4oGR)Y¿{?ñ†8\×]q‰¿i•”^)ú\×sÆ·<9$8L,œBEşÍ°%¯nÙ†‚\Ö\æf¾ş\ïñÎ‹W³h\á<¢MMˆdD¶\ä\ç¿zˆ§_x™Y³fmşá·¿ıRC\Ğn³m\ç%¥ô_–e§ò38¦[Ú˜n1¦[JÕ´Û¶5Û–šm\ÛZ¹j)c•*cUü\×	¨Š-a¡\ØB¨¶psª¢˜Š¢)Šr¤½½c\ßôùK?Gø\âW¿Á\àğ¨“K¤PS\ä5óf²aÃ«LÒeY<ÿ\Ê<¡—Š‚\Ğ\Ô$_r¦\äBK$Tª&÷dõü9H£B\Õ®p\Í.[–…Q\Öı2ğ\É5\à·&A‚\Øu™P\ï!\ÚÏ¾ğ\n­­\ì?pˆ\âhše\æ0jâ¤#1„\è;\ÂWş\ã»\ÄI¯½ô£‡Eri0$„ğ_ªª¤Bš\ë¡\á\Ğ6$€¸ûWs_(Š¢ØŠ¢øËº\Î–i>!„øÉ\Ş\Üy\ßw«*¢!\É\×xŒ/\ßÿ\ÇF3¬Z\ê\ìyüü+¯:\äõ4¡ \\¡qû\âk¥º¾¹ñ~o\Ç‰#\ÕB\ÑMƒ.\\0‡W·\ï\âù^a ÷\0ƒ’alh˜áƒ‡\Ø€Á‡>\ÜGµb8s\îz.8\Î$ù»“\Ô}]û\àI;\Çıu-¡º_\á¼\ë\â\Ø\Ğ\ç\ÍÁ–’Ş!>õ½»¹\ï\é—n–Ó¶m¾ş½38<‚¦j_9vøğN!\Íl«fcX5šZR%­(\"«(J:P\ÆPÀl¨g(b§À\íŸû§K\îü»\'R{~ğµ\æòuN]~Õ²\è=\ØG8dx4\ÍM·}EQ\Øö\ìo‰„Ã¸\n\Ò!vqòcŒ\Û\ÄK‰\Ã\ÌnŠÕŸ\Ğ\Ë\Úg!iCR)\Ér\ço\àñõ¯q\Ç\ÍoevO\'µµ\0\0n™†D“´M‚¢ª\î½\ÜöÀm\Û%~}¦\Õ\ãb\éâ¿‘µ\ïpû\İ\Ô¡(\Îj(\ç\â‡~ó{\Ş~\Û¸\ã\ÃÅ§>öaú†PU…YÓ§ñ|ôq>ü¿ÿÁxb\Ã;n{ÿ­_ı\Ì\'N‹Ng8ÿò?ñÜ’•kÿi\ëÆ—ÿıß¾õ}Ö­ZN0BSU\æºeL\n*³gLgû®=\ìÜ³•KûŠ^\nZÀ4›º\Ç]œúAoA7\è2‚^592<\Ê`fŒt¡„iZ˜UƒxkUşù¾‡øú‡şœH0ˆ ¶t«`Øˆh[Q1G\Ç\Ü\é¨sc	„4•TCUu¥\ï\ÇAJ$yñ¾wI­* ¨5fw±q\Ë6š\Æ\Ì)=Ä£Q\æÎš\î\'€\á\á¾ñı3<:j¬[¼â‹“M|˜D\0X¸|\Å\Ï$öGı\Ã\Ós¿÷ÓŸó\'7¿†¸ó€€Ö–sfL\ç\åW7³~\Ók¬\\Z\Û_\0¶\Z@*\nŠm^e€7d\î`\n\éKš^©2\ãù\í{yv\ënr\å\n–eaºI‰DHµ´³u\ëÜº‹k–/¢j\Ù\Ë\Ù|d˜\×ú‡Š‚tWùq\ß+B )\nMaVW;sºÛ¹`ş\Ì\Új \éh!œg¹\ÌZ—XjÀ‰\åû\ÒÕªÉ†-\Ûhjj¤³³)%ŠP°±2¹_û\îyq\ÃfV®»ø©üı\ç~ı\âS\'nq®8çµõØ¾iC)™jÙ \ëå«|æ¹¦‘\Ñ4³¦M¥µ¹‰j\Õ\ä\É\ç^ä—ü–}}tu´q\Í—¢ªª#‘Gzô2\ÂòŠ@DM\Ú\\§\ÉÑ®‚Cƒ#\Üÿ\Ü~òûÙ°\ç ¹r…j\ÕÄ´œYS ±¥³H¤1\ÙHŞ‚\\\Å\âÕ¾A\İu€£9*¦…^5©&FÕ¤R5\İ\ÏUŒªIÙ¨Rª\äõ\n‡‡\Ól\Ş˜ıÇ†ˆ\Çc´\'œW×™PÿŸk@#‰ùŸz÷ñ£{\î\çHÿ\0e½Â‚9³I5%Q„Â–m;ù\ÜW¾\Î÷ï¾h<±9üùwş\åF9˜@—\îşı\Ë\Ê7¿ô™‹Ö¿ğ\ÌC\Øfr\î\Ì¬]¹œ|©\Ès/m`p\ØId\\yñ:~øõ/\Ó\Ó\İEM×ƒÌ J\Æ\å\Ö}½)\ÑM›—w\î\ã—/l\äÀ±!l[RS\Ú\'\n± NcK\ç¿\n4\ãÌ½w½-%Š«‡\ìºF…pR²o¼`W/šAs<Z3G@Ö˜8\Ş\ä\Ì\ç\ë\à\é^â¶\ÜÁÑA„Ì5ƒKh<ÿòF\éC„÷,]½ö–ÿõ\é\Ïo{\×.<·8ùI0\é\à\á²\ë®_Ø·\Ï\Ëù±«\0\í\í\íC.|t\ç®\İ„UMş\â\ßd\İ\ê•~B,İ‡Dz4\0\éO°qÿ!¾zÿcŒ•&È…K\ßM¿H\éÒ±~½¯g6ÌŸ>…[/YJ{\"V\Ï\Ç5&Ph\ê€`¨Æ Rò£Ÿ\İ\ÏG>ù\ŞxÍµG\Ê\åò\ÆÍ›7_5<<h\ï\ì\ZHµ´¿\Ô\Ş\Õó¾§(=ñ\İ\'g	<<ñğ¯†¶¿¶ù#\ï{\ßmŸ˜5s\æ\Ç¡Ü¶fÍš?}ò\É\'o[¸|\Íæ¡‘Q=\æÑµ&\èÁ~øÔ›ZI\0…Ã£c\Ü÷\ÜfÆŠBÀvÛª?(©\r¼ğ\n\ïô¯­S5§…\\.GÿH–gv\Æò–-ù*\Èe-© İ…0\ŞWFµ\Ê\ŞŞƒ”õ\n³/û×‡~øW]}õ‡-Zt\ÇÊ•+?q\Ï=?\Ûü\Ã{ñ\Ç\ç›ø0IN nJ4!ƒB Ø’”*œú\Û`0”û\Âş\á{Ÿÿü\í1İ¶½M\n[;;\ï²mûŠ\ç^\ÚÀ\Í7¼¨>Eurß–Y\Ó\Ë@®¤ó»-{\Ù}ø\È\ê­\Z¥\Ä\Â!®Yµˆß¬\ß\æ\ì$\ëò\Ò\Ó\'i\ê8”\ÊeJ\å2û\Ó\É2£5\åü\é©‰z\ÎZ³…R‰MÛœ\ÕOsW^|g(\Ò+¦üIP…Ši‡ƒªxHÚ¶%eV\Â3¤\ÑT—\r8G(\Z–\ÖD\\`‡m„&ÀP*›2wªLşş¡Š\Å\ã<ı\ÒKL€¡ˆSE\ã\ëTÁ@®ÀŞ£ƒØ–]3³Ç¡\Ş\Ö{³HºAwª‘/]Í…g£(\n¿ô\Z£\ê«\æ×¯\ßiKŠ¥\"¹r™Ş¡\ÓZÜ™A}3ÁB\Ô*$P.WØ½\ï\0M-­|\à\æ\ëF\0BµR\î°À´d\\UKI0¦eÙ¦D4õôË¾_g\Ä\09\Ã\"¦	¥b\ÚZXSR©HIAQ\È!±U\ÛHœFyò\ÅW½\ÉÜ¿{{v×¶M\É\á\ÑQZ››kc&v(‚Ğ‹ni˜\ã\ÉM\çsJ«^WQBPBYm\Ì\îj\çª\åó\éL%\Ñ4›.YMC$Ì½O½L\Õ\Ù]\ëQ#„³š×²l¦”\r‹x8\àÇ‘¤ˆ`\è8¶’ôp¤ÿ+\×]ºgı\ÈS¶\r ©¢\0 ›–RÍ°¤Pe‹i\Û6’œ˜¶\í<\ãø\ìğú\Ô\ÂyllTñŠ%M TÛ°\ÅHX;»g\Ø\\ví›†vn}õ\'¦i}ø™^\æ¦\ë\ß<¨\"t‚B†CÛ–\Ê`™¦³L\É\ÙzRb\è*†\Î\Ê93¸d\É|\Ö-œM·ÿt\ïZI<\â\ÆKVq\á‚Y\ì92À\Ñt†£\Ã\nºÁ\á!reBIGQUgSJß¾\×\î/T«U¤P+P2b¡\0Š \Â\Í\ã\×ww\Ó\Ö\íX–E\Õ4ş“\Ó@XSMÀ\ëB¦\\Q\ZC„t\è§[¶m¶4\"Ú™?@ò”`˜VPS•”e\Ë4€*0U9\Ô:7[ôñ÷¾KoL5\ï\Ö_¿‘›®óø´\Òp\ê¥„t¾Œi×¾\á! *L\íh¦)d4fw\ï0{w\ï¥8\ÔÏm[ùY,F<¡»µ•h(8nšW\ÏHÒ–M\Ó74B\ßÀ0¹r™BY\'2³§›%\ç\n…Hg\É}S51¹RÃ²\\À-=\á¸\İP°ñµm¨ªÆ®-›\Ï*²\×	\Ù8«´¼‡Hj ‚–m\'›R\äv\Ç\0¦%•ªm+šŠ-‰\Û\ÎM†TEØŠ8qC\ÈsÁ[oz\ç\Ğ\ï~0»iË¶d&“¡©©©ö¥N&L/€mac“.”Ç¥¬Š\Â\r­\àMk–ˆFP„p@¦i³q\×$W(\Ñ{¤ŸL.Gvœ¿\áD¤û.\ÔX4k:W]°œÖ¦&¤€dsS\ÛZ\Ğl\ËY\Ò.$\Ãb\ëÁ#\Üó\äKN»¥„ù\Ì\éN68-\n\á\Ô80>iT«lxm-\í\íú\Ì9óŸşç‚€¦€¡›@7MS±l;U©\Ú%MULË†Hğ\äšZ(WeĞ´-\Óı¬4¥œ·)HÕ´•\r7¾ò\Ğ\Ïº\ã\Ø\à\ĞEûb\Ë\0–• j\0Å¶)¦\ïz\Z¸1\Z\á–K\×‹x‚«Ö¬t?&\Ş@Ú*úe™„€X¢¡\ÉYØ‘s\Ö  €‹\ÏF7¾ş\à\ïp\È\ï\\“+{›bKP4?·Q¯ş{õ12šF†7\\tõuûÎ•<„5N\ÄÒ™’‰¦(›6¶\r†i›\Ço\ïH	Ç¾hª0¼\å\â\çUS¢›¶¦*t]°j³f\ÍÑô°m·³xªÙ• PÈ•+µ\ïp\È4««\Õ!ş8N˜ˆú\á\×x»\\\âgU‘_ ¨ˆ`\ÄqB«Uüô´o/«\ç\Ì@J1‘\äu\Ãı$œø¿¨ı.÷\ï¾Şƒ”\Êe\n\ÙÌ\Û\Ş}\Ë\0\ç	MQ ¦è‘ ¢Gì€Š’\×\Í`ºX÷\Äp6…nig\æŸ!2eKQ\ÙP\ÄTÀ(˜ö\áU—]ı;½R\áùW^õ7^ò¨#…@„\Ã(ŠV[ª(~¼ %™¨\éU7\è\â‡bƒø\Íù¬Sû\Ê/>p”µÎ’®ô\0r¨Jy„myœ‰—Œ\n5Z“	‚X(\nº\Ç`2\Å},Œ\ÏÜ’{ö`T«\Ì_¸ˆ…3§¶Ø¶7ª\'>ˆ{2Ö„*¶û|G#«=\â¼\ŞØƒiÉ°2	![ŠRc(`\çÇ¿õ\ãoşÛ—ò\r3;6m\ÜuBÕÁ lj^I•€¢~\ÜnB:\ï¥ó^J\'\Ø[\Ğ\ËüğÁ\ÇÜ­\İk\Ú@‘uñ}\à\×\\Î‚™\Óñ5„\ß	O\ê%\à=\ç\Ç$U¤óE½\ê6(!Á\ÉF\n?Ö‘/–Ø¹·K\Ê\ÒÜ¥+\×K)G$\"©©Ä¥”Cböş=SœW0-©Œ*‚”i“SÇ¡ô¾ÿ«¯Í®¸\à¢m›×¿¸ø_ù\Z\ßú\Ê?;“£d<	ÁQÎ³tgOrt$xB\ïI¸;ø¸‘~!\ÑuƒGŸz|¾~ƒ\É:\å\0W¬\\\Âü™Óc\Ç)Ÿ\ë<&ª–\Í`\ÖY\å”+‰\Åb–é¨–xÂ©nò.uÿ\ï=tˆ\í»vS5Œôº+¯ùÿª;ó8)ªs\ïOUoÓ³\ï8\ì3ƒ²@,Š¯\×h˜„x\İQ’¨‰\Ş×…×«q¹ \ï\Íõ½š\×7\É%¨/z\ÅeqW@`€a`6f\í™Ş»«\ê\Ü?ª«»‡a€&Ÿ7?>3CUwª:\Ïróœ\ç<\ÏJUUC]6)‚,ÃŒ\ç‹»znµq2\Î„5İ¥\n@„ƒ&\ÇI¦&Î´´»\nŠJ\Şù`\í§+W¯\ãÇ³®Ï \Ø8s\Íy¼\Ãõ­Z½^\n²2—d‹@\Ö\\¼ \'‹·/¢ùğ‘D\nX£€‚\Ã\å¤d\È\à\Ä\é\ãÀúÀúL\nšÚ»\Ì4ös·„v2²é™¦rŠ1€\ßä…—şDUõn\rYw\ÏOf7\08T\Ğ\Òô€]9\nJ¦É€\ÍÖ·\âg‹3w!\0a¨n(Q]Ë³)\"O3Œv\í6›8\é¼ô\â37-¯x=¢\é\ÚcÏ¼À\ê\r_˜iU¥bJ¶”˜Å§.§56ÿh\ZŸU\í\Å\Ğ²l\Ô\\@RH|¡!@º\İø\"Q|‘¾p_8Š?¤FÁ–“‹?ª\á„\ÑOº;)Áš\ÔÙ¸\ç€\Éw2–ÀB`¸3Š\çC)%uõ\Üûğcü\×\ÊUd\ç\æ{\nKú?x|\ë.›ªEu\Ñ¢KQdNT7r\"Ú¹µ\r \Å\ZÀ­*nE!¥bºlp\ØO\í0Zò\Ø\ïBÀÂ²¡#mu\rG\ï¾õW¿\ã¥}Š+§ş0VTE`·©D5pº\\Dı~4\Ã`İ–jF”sşy¥kõ-V\à	)\Ñuƒw¾\Ú\ÂW\Õ\0I4”˜MÈ˜q¦:\ìanj1°˜_Ì¼„¼\Ìôn\ÏW*˜™Î‡ü…\"\0\0±IDAT·\î?Ìº-»@€ª¨\È\Ø?]\×i÷tQ˜—c\ÚR²{\Ï~|\â÷¬\İğ%9ùuE\Åó7~şÉ—œ\0.»Y¡¥+¬7¥Û…[Bn]Ş¨\Êéƒ‹ıL\r\Ğ*šn\äHA\"D—MUZ\í} ~2.\ç\ï\Æ]x\áŸ#ºÎ‚‡ãµ·\ß%ª™©]„P\È\Êp’tw:\n¦\äÕ·uğ§?£1–Ş´\ÖTĞ¦*\éWHC[­Z|AZ|Aš}Aš}šı!šÚ»hlóP\ßÖ‰Mµ“\áröx6ûAÀ—\Õ{ù\Ë\ê/h÷úA‚\Ã\áˆ˜Æ\ZK-„™ıô¾^\Ä\êõŸ“›O^AÑ¼½\Õ;\Öõ¸Áq\Èrª†ª(>‰\Ñ%À•a‰4\ç)\ÆY1@gXC7—[U€ˆ!N®\î{ÃU\Ú‹¿k\êŒ+~\îñú<w>ğ?xb\Éhm\ë\0!\È\Ë6=l\é\é$‡hl\å‰W\ß\ã›\İûbe\ÚbzY€¤©½‰e·\'~b\r$K\âM\Ò:”ø‚\êZ<¬Ù²“\ßş\ß7x\á\íµÔµx\âm¸â‰¢AUr³3\Ñ\rƒ7\ßû\ë~v;_|·‰Q£\ÇüÁe\Ó&!>\ç4`Wm!!„\'¬Ñ¥z^(ª»¢Zj\í\Ã\ãÍ>C\ÓÅ€,E@D7ºÜ3·\\£ZÔ­(ª#¢K\ßM?ı¹\Ñ\Ú\Ütûö\Í\Ô#\á!?»\éz}`!›ª÷ñÍ¶\İD´G\ëôc‚nªş’œL.]\Î\Å\ç\Çi·\ã…\Ø}¸‘¾«¢)©BgÒ²\Z$\Ó]››\áfÚ˜\n\ns²@\ZtBii§¡µƒ#-m\èF‚A,‹£¿òbF\êyŠùù\ì\Ëyc\å*z\â\Ú;»<ƒ\Î+{û–y7¿ó\Ğc‹V¥\ÛO¾D~*DiÃ›À\æ\Õ_vŠü6§\Í\0†a(a]\Úª\È\Ñ\r\Ñn@Ÿk\n\Íp	#ªË„HºC\åşyÎ±÷®)\ë?x÷¥H8X>e\Â8~³\à>ß¶i´´´\Ò\ÚÖŠ!\Í0ls\Îo.eº\Ó*\èº$\nc\Ö\Û\é2F&0‡\rU1=|ša`\èf5t\è\áqVT…’«2za\ÅPªwl\ãÿy™…·\ç¿t\å5³\ßü\Ë\Ëÿnm†<«\r8`.ş—\"E4´t×™Wy…\Ód€@Ô°\Ù\éR„PüQ\é\Ëv9Gø#ºMU„K\Z2\"%÷q«Œc&L\Z²¿¦zY(œ2ö‚ó¹øÒ©8].Á G\ë\ëˆF¢(X: )\ĞN{½ \îç±‰›=>C\Ä\Î	‰”––F\é€RœN\'‘pˆC{kX¹\ê£Hfv\Î\Æ\âş¥\Ï\îß½ó\ëR\Ã0B(¤€	\0¢š‘!%†M%¢(g¶,§a†\ávª¸uƒMQºRA|‡*\nCFt){ jó·5-ú¡Tï®¡®¾PHs¹p»\Ì=ıq,	NÆ©ˆo!yù@&ıN†ex\"bŸ\n\Ó\é\Â\Ûòu\äğ\Ö~ºwFÆ‘\á•\ç?[9z\ìªn\×+\nRJCJ™ag?½³\ÛŸ\İ&\"]:ü=©R\Æ\é\á”=¤\é\ÒÑ¥#*H¶\ÓvÆœğ\Ó;ï›¸\æ½•£\Ç^‘\érNOw9\Êj[\Ş5;bÃ± %†¦E2\ì\Ù=\Õ\×\éÉ›>m\Z\Î.¦\\|)v»P(Ä¡C1,\Ã-	\"\éo<¦ô$ˆ)‹\î\ç\è\Î\Éßµ\Æ~Õ¦R6¨gš‹ö\Ö\Ş_ù---`fT\ím%5sƒf…\Å%)¯\\\Ó\ÙÖ¶dÄ¨6¯|\ã\Õ\ÓZ‰Fu›G\Ä ’\á<½ ^À1Â°©\â´\ZNÆ¬›n²\é\Ë\Ïç¦¹\İ\×«¯/\r\Ær\0ö.—‹O>ù„>úˆÆ¦fòòò‘Ò ±±\Ç,—¬\Â-X¹üûª	,ôX@$‰!$¨ŠBaA!X»n\r;·o\ïV û´!9¹yš¦i+§]3{\Åû\Ë_}ıT—$£# \ã°\áPp\Ù\Ô>\Çnô\èO(ŠE\âBhg¨ê—¯ûFy\î\Ñ\ß\å\ä\åı\ë\çkV]%\r£\0¹9¹2l\Ø0œÎs\îd†Á®]»Ø¿?\Ï?ÿ<¿ü\å/y÷\İ÷Ø±£\ZC\ZD\"\Zñûı\'d\00\ãD\Ò|2XR°\'H€MU)\Ì/ 77—h4Ê=»)0€\ê\êjv\î\Ü\Éó\Ï?Oaaav“š\è†p8\ÌÚµkY³f\rMMMD£Q\Ü\é¾¢~^¼ú†¹/¼ôÌ¢>\'‚Fu(!\İ@aô%}lg\ê›¡g«\î/™qe\å\ê¯´·6O‘†A\éÀüø†˜9s&—^zi¼Lz2Dˆ{ß–.]Ê½÷\Ş\Ëô\é\ÓY¶lN§“\ï·laİºõø|>B¡GKß‰:\Ù8\rH@‚ş3+jqa\ÙYYø|>>\Âe—]\Êô\éÓ˜={6\Å\Å\ÅlİºÕ¼.\î« a7pr•»u\ë6\Ş|ó\r–/_Nmm-\0•cÇ¿z\ãü\Û^´ğº“\\\Ö+:B\Z \è-œ<nv4<A]\Év\Ú8\â/_û¿ù¯yU›¿[\Ú\Ò\Ô0Å¦Ú¸y\Ş<^]¶Œ\'Ÿ|’™3gø\Éğx4´´c’q\ã\ÆÑ¿jjöPSSƒ\Ó\éd\âE1{\Ö5¨ªŠ\Óé¤°¨\Õ~bn\ïmü?’‰f\'¥»\İ\è×ŸôôtjkkÙ¼i#\ÜÅ‚÷PUUÅ±cÇ¸\æ\Zkƒ@7tÃœBZ\Ó\Ô\Şøp\ÜØ±<şø\ã,[¶ŒQ£\Ì\ê\"5;¶\İø\Ö\ÒWş\çC\Ïş¯\Ş*N\â½:#uŸŒ§~{\ïˆÃ‡ö¿\æ\íôL\èß¿?\Ï=÷ó\æ\ÍNLŒ\äma–\Ô(Š`o]Gš\Û\\:ˆ1c\Æòö\Û+Ø¸q#\ãÇ\ÇfS;v,¡PˆgŸ}@0HFF¦D\"\Ì\ØÀ³‚\0§\İNVz:.w\Z™\é´´¶R³{ûöî¥¢¢œe\ËşJy¹Y|\âõ\×_\Ç\áp0{\Î)ñùƒjhf`I~l]¡*H˜¶\Î%—\\\ÂÚµky\ì±\ÇXºt©c\ç–Í¿Œ„\Ã>`á©š8¹®S§\ç°?¦^9+«µ¹\éµc\rõSŠ‹‹x\æ\ég¸ñ¦a\Õ$º¢GN¢$÷®MU\éôhhk§¹£ÁúW\áp8˜3g‡!dô\èÑ¼ñ\Ær¾ı\æ|^/c*G0ª|ÁH˜@,FO$ı\Äo»½u>\Íå ´_1Cõ\çŠK&1m\Ò¦N\Ï\è‘\ÃØ²u+o½ó`\îÜ¹<ıô\Ó>€¶¶6y\ä\Ê\ËË™?>\íş»k\ë	G£\éW‚Í¦ÆUæ½c†™™™Lœ8‘7R[[KÀ\ïw\ë\Â7~ÿõH1N\Í\"§\ÌÜ¼»¬_3UQ\î¿ÿ~\æ\Ş|3˜j6ı\ê!Úº¼Ô·´\á³6w\nAfš‹\â¼Šs³q9¨ŠBq^6\rmD4a•\ç“_X\Äúõ\ëikk###Q1­²²’\×_\Çœ+VğÁGñ\Ğ}wóôı÷ \Ú\íñX¼dv‹3aò¹ØŠ£MUq:œ€d\Û\Î]<ñ\Ülø\ê;\Z\Ä=÷\Ü\Ãüùó±*¢¼ÿşûøı~Æ¿ˆ£\í^º‚­h†NI^6UÁ\ë\Ò\ê\é\âXG—Y™<i\Ş\év:1h\0¹Yfµód\æ(.)aÉ’%Ì3›††FÇŠ\×şó®;x\ä\ë?.~ò¬‹E&#e\Z`Ñ¿½Rö\Ö\Òÿ³\Ä\ï\íÊŸz\ÙT/^Lš;-\ÆıFøn\×^k%Š˜<tM\Óñ‡\Â4wtQ\ß\ÒN$\Z%\Í\á\";\ÃM]KQMGU\Z\ë\êØµ£ŠaÃ†1q\âD ¡Erss™4iº®³ş\Ó\rløú[Ÿ“Mÿ~\Å\äfg\áv9Iw§\áNs‘\æ\Â\íršÿKs:q9\Ø\ív\Zššø\ë›+¸ÿ±\'ù¾j\'“\'OfÙ²e\\}õ\ÕqûEJI4\Z\å\ß_|‘šš\Z&M¿‚\âA\ç™W$¤§9\éô¨>t„\Æ6¾PM\Ó\Ğt]3\Ğtƒ`8BC[P˜\Ü7v»­S\ædg\Ó\Ú\Ò\Ê\Æ\ï¾Ã¦\Øú‡CÁ\í\rG×B¤L|µ~\Íõ‘p¸,\İ\í\æ¶\Ûn%#3#.iºn°¿¾_0”0\ï-\ÄM~I8ªq°¡™f™\Ü9\'Ó?BQTFO˜È†\Õ±~ız\îº\ë®n\Ò\"„`À€<ú\è£\ä\æ\ä²\äù%,şWøo¯¤_‘Y= {^\0?—82\Ñ\åõ²÷\à!l6,\à\Ş{\ïe\Ä³\Ì}ò\Ğuô\èQö\ÔÔ—_Hù¨\Ñ$£\Å\ã¥Yv‘\Øy`Bb®)\Äû\ÆĞ©on)7b°™£@J\Ò\ÒÒ¸şú\ëY±b‡\Î\nü—şË‹Zõ\è‚[û<\Ï?R\Â\0Kşò†\ë¹¾pÀ\çsÌšu-3f\Ì@I\Z\×Z;½Ô·¶\Å3\İ¼n\ê8\ækõ\ì’>…²¡C4dUUU\Ô\Ô\ÔPQQ\Ñc<\Í\Ê\Î\æ \Ë\Û\Å\âÅ‹in÷\àñ\â\Ä\íòt\ĞW8zj÷\Üs7G\Â_a\İSJÉ¶m\ÛØ±s\'\ã&N¢¸ÿ€sÓ‡a>~ñ“\ì3\\L\ÆFIc»‡‚\æ6\ÊbU\Õ-CeÊ”\ÉLš4‰\Ú\ÚZB¡\à¿½üY Ï¾S!%°»jKYnAÁUö.¿üòX\\óe\rÃ \Ã\ë‹E\ÎÆ¤=N·\ØŞœXG™]!“ºŒ˜‘$(.\é\Ï\àa#øf\Ã\'|ıõ\×TVVr<]\ç\ÃWñ\æ›ÿ…Û\Îu?™Ç‘\åq\Æ[öÒ‹\Ô\Ü\ßíšŒŒL.Ÿ5‡eC!6eûb\İjª¾\ßÄ§Ÿ~\Êu\×]\Ç\àÁƒ\ãß·4€¦i|ÿıü>\ã09>Ô™¯(“|–0YA¨Sš¯\'0NŸ\Ã0P\â\Û\É\Ì~˜6m\ZË—/\ç\èÁ\î\Æ#‡I%Rb4\Ö\×\rk=\Öô[§\ÃÎ¢E‹(..KJT\Ó\Ù_\×H0NH$Lt‘84ùUQ\Ğ4¯7|JVV&Ó§O{¥4	·q\ãF\î¸\ãv\ê\ê\ë¹ù\ÖÛ™u\ã\\D¿ÒôPJzF:›¿ı\Z#)wÿ”©3ø\Å\İ÷1¼¢‚Á#F2d\Ä*F¥½µ…\Ï>]Ouõ..¼pE…E\İ\Ñ\çóòğ\Ã\Ó\Ù\é\åö\ß<ˆ\ËÙ‡õ‘üRI§1Á\írR”›ƒªv_£KKK\ã\å—_F\Ó4\æŞ¶`[Õ¦ow\"ôy5°7\ØT5\Ã\×Õ‰\İn§¼¼<.RJÃ \ËH’k‘ôÃ‰ÿŸ\Ô?‚\ÄŞº\Ñ\ã\'•“Ã—_~I}}}\\Œ¤4øê«¯¸ó\Î;ihldÆ•\×2sö?$J\Ô\Æ0j\ìxFI”\ÙQm6®½\áF³N1\Öm%ıû3ÁB.œ8‰5kVs\ßÂ…\Ô®\Å\Úk\0‚ıû°c\Ç.¸p<.WZ\ìQ,¹&±ÿé¤÷‰šF¢«\Ë\Ê\Ê()) ­\åØµ\'h\èŒq\Ö\ĞĞ¨¬¨(B`w$ò\áf¶-]‘õÃ© \Ìr§gR9z,µµµlß¾0;iÏ½<ôğ\Ã\ìŞ½‡K§\Ïd\îmw\àLKH¤©™YY/¯@U\ÍzM¹˜¡\ÃMg¡\ë„BAü^/­m–ğ‹»\ïcü¤)|¶a¿şõ¯Ù·o_lˆ‚Õ«W0v\ÂE\Ø\íf^°^\ï8C·W$S=Fğã¡ª*\0\Ô>4¬\Ç\Î©°awt\×–-$„Y­\ÖbúiÁ\nÁñ\ãË®¸Š/×¯eÙ²e\Üt\ãM\ìÛ¿yó\æQUU\Å\Å\Ó.\çŸ\îû\rin7ˆ\Ø\Õ1#\Ë\ï÷ñÆŸ_aİª÷±;\ìÌ¸fÿ0÷:@Kó1j÷\ï\å\Ğş}tvt0u\æU\\>\ëGô+È÷?\ÄÒ—şÀ»\ï¾Ë‘£Gø\ã\Ë¤¼¼œ?üü¢b‰ˆ•Ê±¢ƒO“şqD£\Ñn\ZÀ\ZF…q\rP»·&4‹\ã¬\ËuÛŒ+\æüc’&‰\Ëz1\Ã/\î\é+\Ä5ª´¬%J\Ë\Ê<l8›6m\â›o¿\á©\ßÿ\í\Ûw0ş“¹ùŸ\îÀ\å6Õ±ˆ}?yDi¨;J0 \'/I?œ†\Ã\é\â\í\×ÿ§\ËÁ ÁC˜9û:\nŠŠ)\î\×ËŠ+(*\âgw,À\Û\ÕÉ–Í›X¸p!7\İtuuu”\ZD\é ób\Ïjq=g\İ03•˜Fd¢!EQ(-- ó4f2}ÁY3\0\ĞMm™Òxx‰L\Øt\'\à^‘D<K	\ä\æ\åsÁø‹xoùk\\;k¦\\\Ì¿ş-ùEH$\ëW­dç¶­¤gf\Òo`)EE%\äñ?ı9E%%|¶v5\\ò7\Ü2Ÿ\Û~u?§»İ†PT]\'ğ\ãõz	x}\Ø]ò¹÷wğÖ«ÿ\ÉúW±yó÷\èº\ÎE—L%+\'sZg=\è	Ş£7$1NoKF®˜b·\Ûmo}¼>\ëG3.=Iõ­\ÓCJ\àxô|…x&¾Ó”Ñ£?U»‘£. =3“öv†,gŞ­w’WX›\îI.?‚\â\ÚZ[ik>\Æ\Ö\Ú\ïğû¼õ\ëÇ¬ÿ§\ËÍ»\Ë_\å•[Œ+\í~ğÃ©lùök\Z\ë\ë\èhm¥¹©®NºfPqÁh®û\É<ò‹Šù\Ù\0ø\ä£±\ÙmŒ›<¥g\ÓE‡kQ-\ÚN7-\ĞM¨6G³\'ER%ğ³Á9a€s‘£Î§ ¨˜~r\ë‚_1h\ÈĞ„$IAQq?\nKú™\Ò(!\Z†A \àÀ\Ş\Z„\ä\ä\çS»¶½¥og\'…\Å\ÅT^0†\ìü|\\.\î³p5B–Á¼\Û\î\"\'¯€o>û”•£z}Î¾A\Äk†aœZ…œú}\Ç\ß%d\ç\æqÕ®gÔ˜qô4ˆ$1J\ØRÄ‡»Ã\İ\é\àğü\é\ÏS½}Œ\á¶_=@É€R¤\\>kN\ÜNA\Ä4$v\Î\ìr) 3+›nù&]Œİ\Øgv°ndõ\Z5œ4,¦cˆ½h\n0\ãš\Ù\æ6,(Dòp!\âö†i˜Ÿmüò3vn\ÛBfV6·\Üv\ç\rŠ\ÜN\Ù\é€A0\Å\n£i\Z\İ7\Ò\ÚpŒj³1¬¼\"…’˜4DöJjúş\Ğİ«•º7‰ŸLÖ¦O,M\0q\í\Ô+¯eOõNª«¶rø\àF\rœ6;£‡‡3¶\Z§i:p˜.?m^‚‘ˆ¹\É$\Z5YI¦‘\ãˆ1lò4ğ„ û0LôgiÁœ\Zi.\ËE{\ÃÁlIÄ¤4¦\î-½\İ]pM\í ¡¨¸˜«\æ\\\Íf§\êûMø½>@‡‘˜F—\"»\Ü\Ì†(\æ¢\ÊaL>$\ãFfpÿ\"TUMh†T¼Lú+\ÌB—KœsP-K6u\âD—2®B\ãu¬\Ï\0\Ë‚1M$\'/¦†:<\ím	v›ŠÒ‹D\ÛU•¢œ*\Ë2ªl`JèŒøe·£“\"•÷?\ç`Á\ÚW—JH!M\Î	¢K–N‡wš“\ìt7v»Š\İ\é¤_\é@:=~?I~NV<t+961~$¡H„ö.-®ønhõÿ=Î¹\r€5fŠØ¢N*†\Ïx{–ñdg¸œdºİ¤§¹\È\Ë2K®\ÙT›ª`SUªö¦­³+f½›\×\Ù\í6\n²c•?º\ß)%ÁP”†\Öv\Z\Û;ğC„#Z\Ì\æqµı÷Œs\Î\0B(¤¹\Ãg±k\æ0Õ¿Œ”•RYVŠ=i\Ğ\\£7@(´wzi\ïò‰„©=¸ŸÌ¬l\Ü\ît\Ü9\æ<\ß0Â‘(¡h”¯Ÿ¦Vm^¯™D:y‘¦›&ûû\æ€s\Ï\0˜kùB\Ê\ÓÚ¡\Ó+X±öÖ‰¦6B†•–\îJZ	ŒrGµ\"¥\ä\ĞŞ½|>†¬$3;]7VZ:ºğø‚!üÁ0Áp$>$[u!e±m\éüı#%pJºJ\Ìq9e]&\â7µZ\rE£\Ô66\Ó\ì\é¤$?‡óŠŠp:\ì\ØU%6­a;¶~O0`\èÈ‘d\å\æˆD\Øyğ(º´r\Ä\ÚM~)!{\Ç\ßza*M\Ó{,õ¼$ewO\r$:­\çC!°\ÛlHŠ½«<®w\ÏÉ­Ba\Ô5q¸¡…\Ü\Ìò²2\Èp»ˆD4~?µöaw8¨=E˜ñúQ-±ª\İ\é‰\Ô>y¦¶1§¤½!6\ëMR\Â\0N\Ì „Ài%M\"\îV=€0\Ì{j†N«§“\Ö./UE\Ó5¼]475\âr¥1xøˆS5÷7eGŠ¸QÙ»€˜öo\ê&oÿ\r\çj÷\Ô\Ø,$\Ò\0\0\0\0IEND®B`‚','image/png','erwan-transparent.png','Victor','','',0,0),(18,'','','','kacsa','','',0,0),(19,'','','','dsaasdsdasad','','',0,0);
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
INSERT INTO `priv_changeop_setatt_data` VALUES (58,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 80\nÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0€\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ğ²Ì¸\ë\Í83\ÍC­Op8\ëÖ€,@¬@;\rki:e\å\ì©(@o\ãc€?\Z\×ğ7…¥\Ö.T\Ì\"\ÈŒn$\ãò¯a±ğ\åœB5¾T`(ñ\Ç8 (±ğ‹\Ë:GÈR»ˆˆg§wºw€-\r¦u”H‘¸\é\í]ô6¶¶RCq£Ä£l{d$gŒ÷ÿ\0=«45Ô·<Ya»~W¡ö4q\àueEgx\â#©\çÿ\0\Õ\\ˆülX5\ÉwR«q“\Óü+\Õõ[\Ù\Ú(¥vV—\n:¨\ê¥y¾©$¶·“\ÍÁUF\ê\Ç\æ<ú}Iü…\0p÷Vw6$w*\È\èq\Ï?•F]×€Hõ8®\çM„k\ZU\Ä‘ù²\ä´n½S\Ó\'Ş¸­F	\ígx$h›ia\È# 4ß³q#\Î3\Î*];\Íp\ß•=Hª\Û$˜\í\Î\ßCŞµ\ìQ­\Ö<Œ±¹\Í\0IJœùÀ\ïøgüû\ÑV.ø.‡\æÀe^N3ÚŠ\0òN	\é]ƒ´\è\ïõH\ã»m¶\à\å\Û\Ğvık`ùÀ\Ï^•\éşğõœZ#ß™Dgc`œœsøô «\Â³\Ù\Ë\r¤%«G\'fE\Ï\0ş?­vh2\ê?g†ÍŠ°Á|¶\ç\×ôª±†k[//|f¬Ÿw\'\'œô\ç5\Üøp¡¹–E \å‚dtOZ\0›Bğ\Ú\éñÇºFi?‹ƒZ\ÃF´IZDŒ>• ‰†\ëÖ¥ r\ï@\â)B¾\×|ü\Ø\ä\â¹û\ï‡z\\¬d¹F¹”òZO\é\é^…´SRÉ Ÿ|G¢Í _»\éå£µE?*ò1øô®oVú“¥\Äi\åù‘‚s“œŸÊ½—\Æ\Ö\æ.±»kò½A\ä^3\'•k«C»‡²–@\Ñ\ä`ß1“§=(ˆ\Ó&S\Ø\ÉãŸ­\\†\İJ¨–3µy\Ét\×M¦ZE<l\Êvú†\çLúU™4\Äe·p9\Ç Î€9ˆ\íJ\á\Ê\í<\ç·z+ªŠ\Â8¢?1/ù\ÇN‡óı\r\áÓ¤\Õ/cµFT.~ót\èºO†õ;m\\i\ÖÅ¦C†™X\íB;{r+Î¼?;Aw@Û³·®{W¨Yk×±	>Ò’Fd\0»ºH\È Ÿ¡h½±\Ö>É§[J\Ö\Ïw$„Çº\ØX/#úŠ\ß\ÓoŒf9gÿ\0G\É$Cœœú·¾J\æ<5aö{©¦f¶ò‰cV!\\\ï\é]“Z¾­\Èv\é!;ÿ\0‡óõ F…²ªz3T®õ½2\Ö\à\Û\Íl“\ãqŒ\Ê\ëŠ\Æñ•Ç‘¦<¡§+\İ\å\Ä\åwŸBGjğû¹lüKqwg›\'Ú­”µÄnÀGƒŒd°cÏ¶}¨\é;\è.4¬Šz2° \ÕMO_\Ót\ÇÛ¨_[[±Y’?\Z\à>x}tK|”’/8ò»\ÉP}Eq<\Óu\rG\ÆÚ¥è±—Q{)p\Û\à\0Fõ?\ïgNJ\0\é<y\ã}S°’\ÛIº†yÛ~l€×i\×\ÑF\'w!\í\äuBd1õ®®\çAÖµ«h\ç\Ò-­^XŒ¯\Z¸\Ì}F;\rp‘,±xò?3\à2w\'h\Èü\è\Ö4¹\Ş\î\Ü<gheİŸÀuÿ\0=«v\ÚH€…V\Æ\ŞH\ï\\ß†Ñ­¬¾\Ë;\âä¯œş\ë°®ŠÀ\ÊB‡$eN\á({[fivùFs¸ó\ïEi\Û1H¤}Ü¯*r}=:Q@.xD\Â/³;@¤\î\ÏJõ+\é¡O¹… Ø„\Ú:“\Ç?OÖ¼^\Æ3öˆÁ;rG5\ŞÉ¡. -mmQUg#\ïw\äş4\íZ7Ù­´”¹²¹2+G÷‰\ï\íI¥ê‘®«m\n¶\ç\Îp£\'üó^ªDt\ëxü¹¥¶)\rl:\ãq\ßkÃºü³ø¯LLQ#ú\Ğ\ÓV2%\Äe\Í#\é–\Ò8X‹ı\ç@fúš\Ï\Ò¶+÷€$U½J\êo³²[¯\ï\à\Z\0\ĞH¢ŒD±}\Ôd\äş5Áøª\á4ÏˆV\Í A¥l‡\èÎ„ô÷Á«\×#\Ä6C½µ\ì’I&\Ø\ê\İÀÁü\Åy‡\ÇOC©½–›cm)Ô­[Í“ı\Óû¿\\ŸÒ€=7\ÄWZu†•=\Ô{\è!Uv\'+\ÇoJù­e\ËpÌ¡‹®\â2>lÿ\0Uw¾/Ö¤Ô¼¦\Í(x\å@‘zsŞ¼»G˜K©\\HT³ùW\Îh\Ú<8\Öò\\¼qI®aYfù¿„e³œ\ÃŞº›‚rI\È`3\Ïşu\Îx\"\ÂK=\"h\Ñds\æ7\Ê½Z\ë­\æó\n’r=hB45U@\Ù rp}½\è¤r›z\î\ç¿n( \Ã\à‚\rv^\Ö$¶³–D>dÊ˜Tcü9üqš\áó\ÏLÖ–‹p±³û™÷ \r_\ê×“~ô¼\ÊX\ç\æ?\ç5¿ğ\Ş\ÂK«/\á;¤·¸) \î\ä7Ó¨ü+Œ\ÖnŒ\áI+À\è+\Øf»Hg²Ô¼õVG(¯sÀ<P«h¬!M\ï–<c¦kSUštÓ§–\Ó\ç¸U\Ê)XÚ—q¢\æX\0–\Ó9\r™~µsK\Ö ¸\0+P\Zm\çˆ`·	wgg,\Ås\ç}¤„>\ØÛ‘\\\'‹^ûR\Ôm,ô¤–=\ér\ë)fy\ÈÀŠõ¹ †òİ ‘ñ@ô®cXğ\æ—ea4\Ñ›c·j\0ñ_\Éq¥œR}4\ÌB\ás\Ğq3\Åeü;\ÓO\Ûw³ùj9v\Ç8ôük±ğ¾Š\ÚüW—wDş\\g\ÈşU\ÓE¡\Ãal±F\0Nr@4j0\Äğ\Şgfútõ\í[\áV5dpW¹\'_z\Èû3F€\Í÷Tõ9\Ï\åş{\Ó\à—w¹ôÀzq\í@\Ñ\\\İ[$ n	8dõ\íğ¢¨—\ä\å‰PS\0œŞŠ\0ù	¸cMF\Ús\ÛÒ›!æœ‘e‡^hi‰‘F\Æ8=j÷\ÏÙ»dV³¢6I”\îïƒùqùó\é^cnJ\í>x¯ş\ï‰\î2ú|øu\îú8\Üş\Ğ\Ù!HŠH”Œy¸ø>\àFnü<•y6å¶“ş\ëzû\ÌWg¦\İ\ÅykÅ´‰,2(dt9B\r]$œ\â€>¸ñµ¤•·¼†[yS‚. *x\é\È8?Im­jš\í¼Á\äiÑ‡+:ƒÜ’\0¯`ñ„wlš¥^Û²?\\\Z\ãÀY\Üyi*\Æ2\Ø\ã,x÷4…m\Ö\ËA··TEÀb}MOp\åH\0†\Ï\'ŸÎ¼\ï\Æ>7ºğÇŒM”Ñ‰ô­ˆ\ß(\Ó9\Ç<\Z\ë-µx5.\í\î[wROo­\0i½×˜¬[\'’9\Ï=xª²!E.HÀ\Æ7u\Ç\Õ7›x_\'\æ%°\ägÿ\0Ö´\'0$,O˜\Ã\Ó&€.*H\êX¨†4SlbVc’ E |\ädƒ\Çsÿ\0\Ö\ëE\0|©\Ç8\İü©XjWB>n¿JF?xg<´ cœp9ú\Ò9`…±\Æ1In	v_\â\ÅO\ä–\\nƒš\0\îş|M\Õ|¶İ‡\Úô· ›w<§©C\ØóÓ¡¯£|/ñCñ1ıšñ\"™\Î<™ˆVÏ·­|g\àFs…\ëZ¶—\ri 1’Q\ÆJg¯\ÓÒ€>\àb\Â2c!Q\ÏZ\Ë:l›\î^K8\î$“\Éò~g‘ô\æ¾l\Ñ|w®\ép¯\Øoİ‘&)˜¶\ÓÓ­z‡>/\É2Âš¶šw>1%»\äÀÿ\0\0g|[øEs¬\ÚÉ«\è˜\ZŠG‡³vHd\É\àN‡Ú¾v\Óõ½WEœ[™\ádb\Z\"N3Ğ‚µ÷^›¬[k:B\Ş\Ø7›ƒĞ‚:©ô5ñG\Ä].}#ÆšÍ¥\ë•®\Zu`8es¸v8=(¥\Ñ~%¨;u;vB\Çıl\'\ÅOô¯A³\Õ\î\Ö;»9Ç·•\É\Ïÿ\0_ÿ\0­_9D›˜ a\ÛÖº\ï\0kÏ¥_YÜ‹IønF»{g­\0{\Ê\Ë\çI\Éò\ÎF9Áÿ\0\ë\Z*‹\äMş]ˆ‘»‚@\ç=ù4P\Î÷@(	\ÈƒÚ¨Œ—<õrS¸•q†­R\É1@\â‘|ğ[¦\0©\Û\å|q´š¢~W\'\Û4\è\å%~y 	w°yX\á†j\Ô¹P³gŸzÍ–C\æsO†]‡\0ıhB\æR\îió\Îjk\rrkY£i@q¸\È\çšÍ»\Â\àôV<‘\ÔVi‡\ÎI\ç4\î?|o-§Š_MºŸ:~ vŒŸ•f\ÆF=3Œ~^•ûFÁH˜»\Íi¸=ˆ%Gè¢¼\Ú\Âø\ÚÊ²BJH„2ŸB şV\Ç\ÄoxûX.\Ã4+¯÷YP\Û \Ğ#‘±2÷ˆ©\'>]\ÊÈ¼£|\Ãñªˆwer50r\é\å·!\Ë@¯\àı¾Á4Û¢xW1¾2Y==?•\æ\Zu\ì\Ö7QOÃ£d{\à\Ñ@ÿ\Ù','image/jpeg','jjrousseau.jpg');
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
INSERT INTO `priv_user_local` VALUES (1,'158cedd7937600e14b59faa80c58eb19538a7443ad6e37dd805bd59dab7baf51','.Ñ”`t\0\ïsÎ°kH5d');
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
