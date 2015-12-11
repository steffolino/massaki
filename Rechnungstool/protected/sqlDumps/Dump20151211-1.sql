-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: rechnungstool
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `coldef`
--

DROP TABLE IF EXISTS `coldef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coldef` (
  `colDefId` int(11) NOT NULL AUTO_INCREMENT,
  `colName` varchar(255) NOT NULL,
  PRIMARY KEY (`colDefId`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldef`
--

LOCK TABLES `coldef` WRITE;
/*!40000 ALTER TABLE `coldef` DISABLE KEYS */;
INSERT INTO `coldef` VALUES (0,' '),(1,'Buchnummer'),(2,'Name'),(3,'Unterbringung'),(4,'Artikelbeschreibung'),(5,'Menge'),(6,'Sonstiges'),(97,'0% MwSt'),(98,'7% MwSt'),(99,'19% MwSt');
/*!40000 ALTER TABLE `coldef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiveinvoice`
--

DROP TABLE IF EXISTS `collectiveinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiveinvoice` (
  `collectInvoiceId` int(11) NOT NULL,
  `deliveryNoteId` int(11) NOT NULL,
  PRIMARY KEY (`collectInvoiceId`,`deliveryNoteId`),
  KEY `deliveryNoteId_idx` (`deliveryNoteId`),
  CONSTRAINT `deliveryNoteId` FOREIGN KEY (`deliveryNoteId`) REFERENCES `document` (`documentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiveinvoice`
--

LOCK TABLES `collectiveinvoice` WRITE;
/*!40000 ALTER TABLE `collectiveinvoice` DISABLE KEYS */;
INSERT INTO `collectiveinvoice` VALUES (0,6),(3,7),(2,9),(1,10),(2,11),(3,13);
/*!40000 ALTER TABLE `collectiveinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counterconfig`
--

DROP TABLE IF EXISTS `counterconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counterconfig` (
  `idCounterConfig` int(11) NOT NULL AUTO_INCREMENT,
  `docTypeId` int(11) NOT NULL,
  `counterTypeId` int(11) NOT NULL,
  PRIMARY KEY (`idCounterConfig`),
  KEY `docType_idx` (`docTypeId`),
  KEY `counterUsed_idx` (`counterTypeId`),
  CONSTRAINT `counterUsed` FOREIGN KEY (`counterTypeId`) REFERENCES `lastusedcounter` (`lastUsedCounterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `documentUsed` FOREIGN KEY (`docTypeId`) REFERENCES `doctype` (`docTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counterconfig`
--

LOCK TABLES `counterconfig` WRITE;
/*!40000 ALTER TABLE `counterconfig` DISABLE KEYS */;
INSERT INTO `counterconfig` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `counterconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countertype`
--

DROP TABLE IF EXISTS `countertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countertype` (
  `counterTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `counterType` varchar(45) NOT NULL,
  PRIMARY KEY (`counterTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countertype`
--

LOCK TABLES `countertype` WRITE;
/*!40000 ALTER TABLE `countertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `countertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultcolconfig`
--

DROP TABLE IF EXISTS `defaultcolconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultcolconfig` (
  `colConfigId` int(11) NOT NULL AUTO_INCREMENT,
  `col1` int(11) DEFAULT '0',
  `col2` int(11) DEFAULT '0',
  `col3` int(11) DEFAULT '0',
  `col4` int(11) DEFAULT '0',
  `col5` int(11) DEFAULT '0',
  `col6` int(11) DEFAULT '0',
  `col7` int(11) DEFAULT '0',
  `col8` int(11) DEFAULT '0',
  `col9` int(11) DEFAULT '0',
  `col10` int(11) NOT NULL DEFAULT '97',
  `col11` int(11) NOT NULL DEFAULT '98',
  `col12` int(11) NOT NULL DEFAULT '99',
  PRIMARY KEY (`colConfigId`),
  KEY `col1_idx` (`col1`),
  KEY `col2_idx` (`col2`),
  KEY `col3_idx` (`col3`),
  KEY `col4_idx` (`col4`),
  KEY `col5_idx` (`col5`),
  KEY `col6_idx` (`col6`),
  KEY `col7_idx` (`col7`),
  KEY `col8_idx` (`col8`),
  KEY `col9_idx` (`col9`),
  KEY `col10_idx` (`col10`),
  KEY `col11_idx` (`col11`),
  KEY `col12_idx` (`col12`),
  CONSTRAINT `col1` FOREIGN KEY (`col1`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col10` FOREIGN KEY (`col10`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col11` FOREIGN KEY (`col11`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col12` FOREIGN KEY (`col12`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col2` FOREIGN KEY (`col2`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col3` FOREIGN KEY (`col3`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col4` FOREIGN KEY (`col4`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col5` FOREIGN KEY (`col5`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col6` FOREIGN KEY (`col6`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col7` FOREIGN KEY (`col7`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col8` FOREIGN KEY (`col8`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `col9` FOREIGN KEY (`col9`) REFERENCES `coldef` (`colDefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcolconfig`
--

LOCK TABLES `defaultcolconfig` WRITE;
/*!40000 ALTER TABLE `defaultcolconfig` DISABLE KEYS */;
INSERT INTO `defaultcolconfig` VALUES (1,1,2,3,4,0,0,0,0,0,97,98,99),(2,2,4,0,0,0,0,0,0,0,97,98,99),(3,2,4,0,0,0,0,0,0,0,97,98,99),(4,4,6,5,1,0,0,0,0,0,97,98,99),(8,5,4,2,1,3,0,0,0,0,97,98,99),(9,1,2,3,0,0,0,0,0,0,97,98,99),(10,3,1,2,0,0,0,0,0,0,97,98,99),(11,3,1,2,0,0,0,0,0,0,97,98,99),(12,3,0,0,0,0,0,0,0,0,97,98,99),(13,3,0,0,0,0,0,0,0,0,97,98,99),(14,3,0,0,0,0,0,0,0,0,97,98,99),(15,3,0,0,0,0,0,0,0,0,97,98,99),(16,3,0,0,0,0,0,0,0,0,97,98,99),(17,3,2,0,0,0,0,0,0,0,97,98,99),(18,3,0,0,0,0,0,0,0,0,97,98,99),(19,3,0,0,0,0,0,0,0,0,97,98,99),(20,0,0,0,0,0,0,0,0,0,97,98,99),(21,1,6,0,0,0,0,0,0,0,97,98,99),(22,0,0,0,0,0,0,0,0,0,97,98,99),(23,0,0,0,0,0,0,0,0,0,97,98,99),(24,0,0,0,0,0,0,0,0,0,97,98,99),(25,0,0,0,0,0,0,0,0,0,97,98,99),(26,0,0,0,0,0,0,0,0,0,97,98,99),(27,0,0,0,0,0,0,0,0,0,97,98,99),(28,0,0,0,0,0,0,0,0,0,97,98,99),(29,0,0,0,0,0,0,0,0,0,97,98,99),(30,0,0,0,0,0,0,0,0,0,97,98,99),(31,0,0,0,0,0,0,0,0,0,97,98,99),(32,0,0,0,0,0,0,0,0,0,97,98,99),(33,2,4,0,0,0,0,0,0,0,97,98,99),(34,0,0,0,0,0,0,0,0,0,97,98,99),(35,0,0,0,0,0,0,0,0,0,97,98,99),(36,3,0,0,0,0,0,0,0,0,97,98,99),(37,2,0,0,0,0,0,0,3,0,97,98,99),(38,1,0,0,0,0,0,0,0,0,97,98,99),(39,4,0,0,0,0,0,0,0,0,97,98,99),(40,3,0,0,0,0,0,0,0,0,97,98,99),(41,2,0,0,0,0,0,0,0,0,97,98,99),(42,1,0,0,0,0,0,0,0,0,97,98,99),(43,4,0,0,0,0,0,0,0,0,97,98,99),(44,3,0,0,0,0,0,0,0,0,97,98,99),(45,2,0,0,0,0,0,0,0,0,97,98,99),(46,2,0,0,0,0,0,0,0,0,97,98,99),(47,2,0,0,0,0,0,0,0,0,97,98,99),(48,1,0,0,0,0,0,0,0,0,97,98,99),(49,1,0,0,0,0,0,0,0,0,97,98,99),(50,1,0,0,0,0,0,0,0,0,97,98,99),(51,1,0,0,0,0,0,0,0,0,97,98,99),(52,5,3,1,2,0,0,0,0,0,97,98,99),(58,0,0,0,0,0,0,0,0,0,97,98,99),(59,1,2,6,0,0,0,0,0,0,97,98,99),(60,5,0,0,0,0,0,0,0,0,97,98,99),(61,5,0,0,0,0,0,0,0,0,97,98,99),(62,4,NULL,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `defaultcolconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctype`
--

DROP TABLE IF EXISTS `doctype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctype` (
  `docTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `docTypeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`docTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctype`
--

LOCK TABLES `doctype` WRITE;
/*!40000 ALTER TABLE `doctype` DISABLE KEYS */;
INSERT INTO `doctype` VALUES (1,'Gutschrift'),(2,'Rechnung'),(3,'Sammelrechnung'),(4,'Lieferschein');
/*!40000 ALTER TABLE `doctype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `documentId` int(11) NOT NULL AUTO_INCREMENT,
  `counter` varchar(45) NOT NULL,
  `yearCounter` int(11) NOT NULL,
  `jvaId` int(11) NOT NULL,
  `docTypeId` int(11) NOT NULL,
  `pdf_location` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `printed` varchar(1) DEFAULT NULL,
  `timeStamp` datetime(6) DEFAULT NULL,
  `defaultDoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`documentId`),
  KEY `jvaId_idx` (`jvaId`),
  KEY `yearCounter_idx` (`yearCounter`),
  KEY `docType_idx` (`docTypeId`),
  KEY `documentType_idx` (`docTypeId`),
  CONSTRAINT `documentType` FOREIGN KEY (`docTypeId`) REFERENCES `doctype` (`docTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaId` FOREIGN KEY (`jvaId`) REFERENCES `jvadata` (`jvaDataId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `yearCounter` FOREIGN KEY (`yearCounter`) REFERENCES `yearcounter` (`yearCounterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (6,'IK 2',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:03:00.000000',NULL),(7,'Logistik Loehne 0',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:05:59.000000',NULL),(8,'Logistik Loehne 1',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:07:34.000000',NULL),(9,'Logistik Loehne 2',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:07:36.000000',NULL),(10,'Logistik Loehne 3',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:07:37.000000',NULL),(11,'Logistik Loehne 4',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:11:37.000000',NULL),(12,'Wittekindshof 0',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:14:08.000000',NULL),(13,'Logistik Memmelsdorf 33',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:16:37.000000',NULL),(14,'Logistik Memmelsdorf 34',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:17:43.000000',NULL),(15,'Logistik Memmelsdorf 35',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:18:08.000000',NULL),(16,'Logistik Memmelsdorf 36',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:19:53.000000',NULL),(17,'Logistik Memmelsdorf 37',1,30,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-08 23:35:33.000000','yes'),(18,'IK 3',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2009-12-20 15:00:00.000000',NULL),(19,'IK 4',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-09 00:00:00.000000',NULL),(20,'IK 5',1,0,2,'Auf der Platte','Frau Duenn',NULL,'2015-12-11 00:00:00.000000',NULL);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentvalues`
--

DROP TABLE IF EXISTS `documentvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentvalues` (
  `valueId` int(11) NOT NULL AUTO_INCREMENT,
  `documentId` int(11) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `value3` varchar(255) DEFAULT NULL,
  `value4` varchar(255) DEFAULT NULL,
  `value5` varchar(255) DEFAULT NULL,
  `value6` varchar(255) DEFAULT NULL,
  `value7` varchar(255) DEFAULT NULL,
  `value8` varchar(255) DEFAULT NULL,
  `value9` varchar(255) DEFAULT NULL,
  `value10` varchar(255) DEFAULT NULL,
  `value11` varchar(255) DEFAULT NULL,
  `value12` varchar(255) DEFAULT NULL,
  `header6` varchar(45) DEFAULT NULL,
  `header1` varchar(45) DEFAULT NULL,
  `header2` varchar(45) DEFAULT NULL,
  `header3` varchar(45) DEFAULT NULL,
  `header4` varchar(45) DEFAULT NULL,
  `header5` varchar(45) DEFAULT NULL,
  `header7` varchar(45) DEFAULT NULL,
  `header8` varchar(45) DEFAULT NULL,
  `header9` varchar(45) DEFAULT NULL,
  `header10` varchar(45) DEFAULT NULL,
  `header11` varchar(45) DEFAULT NULL,
  `header12` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`valueId`),
  KEY `documentId_idx` (`documentId`),
  CONSTRAINT `documentId` FOREIGN KEY (`documentId`) REFERENCES `document` (`documentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentvalues`
--

LOCK TABLES `documentvalues` WRITE;
/*!40000 ALTER TABLE `documentvalues` DISABLE KEYS */;
INSERT INTO `documentvalues` VALUES (306,16,'12','12','1','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name','Artikelbeschreibung','0% MwSt','7% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL,NULL),(307,16,'tert','t','66','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name','Artikelbeschreibung','0% MwSt','7% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL,NULL),(308,17,'Test','1','','','34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name','Artikelbeschreibung','0% MwSt','7% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL,NULL),(309,18,'Stefan','hans','Da home','1','','','15',NULL,NULL,NULL,NULL,NULL,'7% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','0% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL),(310,19,'Stefans Bibel','koran','daheim','TestTestTest','','','1',NULL,NULL,NULL,NULL,NULL,'7% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','0% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL),(311,20,'Benni','Stefan','Testhausen','Sonst so','','','1',NULL,NULL,NULL,NULL,NULL,'7% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','0% MwSt','19% MwSt',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documentvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jvadata`
--

DROP TABLE IF EXISTS `jvadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jvadata` (
  `jvaDataId` int(11) NOT NULL AUTO_INCREMENT,
  `jvaName` varchar(255) NOT NULL,
  `jvaAddress` varchar(255) NOT NULL,
  `jvaColConfig` int(11) NOT NULL,
  `jvaNameExt` varchar(45) DEFAULT NULL,
  `jvaFooter` text,
  `jvaCustNum` varchar(45) DEFAULT NULL,
  `jvaCustNumDesc` varchar(45) DEFAULT NULL,
  `jvaDeactivated` varchar(1) DEFAULT 'n',
  `jvaColMemm` int(11) DEFAULT '2',
  `jvaColLoeh` int(11) DEFAULT '3',
  `jvaColWitt` int(11) DEFAULT '4',
  PRIMARY KEY (`jvaDataId`),
  KEY `jvaColConfig_idx` (`jvaColConfig`),
  KEY `jvaColMemmel_idx` (`jvaColMemm`),
  KEY `jvaColLoehne_idx` (`jvaColLoeh`),
  KEY `jvaColWitte_idx` (`jvaColWitt`),
  CONSTRAINT `jvaColIk` FOREIGN KEY (`jvaColConfig`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jvaColLoehne` FOREIGN KEY (`jvaColLoeh`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaColMemmel` FOREIGN KEY (`jvaColMemm`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaColWitte` FOREIGN KEY (`jvaColWitt`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jvadata`
--

LOCK TABLES `jvadata` WRITE;
/*!40000 ALTER TABLE `jvadata` DISABLE KEYS */;
INSERT INTO `jvadata` VALUES (0,'JVA Ebing','Am Schwana 3 96147 Rattelsdorf',1,'IK','Herzlichst, Ihr Bjoern Zinkni','123456','1','n',2,3,4),(9,'JVA Haupt','',8,'unten','MfG Massak GmbH','123456','','y',2,3,4),(10,'JVA Hamburg','',9,'Extra','MfG Massak GmbH','123456','','y',2,3,4),(11,'JVA Bremen','',10,'Zusatz','MfG Massak GmbH','123456','asd','y',2,3,4),(12,'JVA Berlin','',11,'Moabit','MfG Massak GmbH','123456','asd','y',2,3,4),(13,'JVA Berlin','',12,'Mitte','MfG Massak GmbH','123456','asd','y',2,3,4),(14,'JVA Berlin','was da los',13,'Friedrichshain','MfG Massak GmbH','123456','','y',2,3,4),(15,'JVA Berlin','',14,'Neukölln','MfG Massak GmbH','123456','123','y',2,3,4),(16,'JVA Berlin','was da los',15,'Hermannplatz','MfG Massak GmbH','123456','','y',2,3,4),(17,'JVA Hannover','',16,'asd','MfG Massak GmbH','123456','','y',2,3,4),(18,'JVA Kassel','',17,'asd','MfG Massak GmbH','123456','','n',2,3,4),(19,'JVA Würzburg','was da los',18,'asd','MfG Massak GmbH','123456','','y',2,3,4),(20,'JVA Aschaffenburg','was da los',19,'asd','MfG Massak GmbH','123456','','y',2,3,4),(21,'JVA Frankfurt','',20,'','MfG Massak GmbH','123456','','y',2,3,4),(22,'JVA Leipzig','',21,'','MfG Massak GmbH','123456','','n',2,3,4),(23,'JVA Dresden','',22,'','MfG Massak GmbH','123456','','y',2,3,4),(24,'JVA Erfurt','',23,'','MfG Massak GmbH','123456','','y',2,3,4),(25,'JVA Coburg','',24,'','MfG Massak GmbH','123456','','n',2,3,4),(26,'JVA Forchheim','',25,'','MfG Massak GmbH','123456','','n',2,3,4),(27,'JVA Ebrach','',26,'','MfG Massak GmbH','123456','','n',2,3,4),(28,'JVA Bamberg','',27,'1','MfG Massak GmbH','123456','','y',2,3,4),(29,'JVA Bamberg','',28,'2','MfG Massak GmbH','123456','','n',2,3,4),(30,'JVA Bamberg','',29,'3','MfG Massak GmbH','123456','','n',2,3,4),(31,'JVA Bamberg','',30,'4','MfG Massak GmbH','123456','','n',2,3,4),(32,'JVA Bamberg','',31,'5','MfG Massak GmbH','123456','','n',2,3,4),(33,'JVA Bamberg','',32,'6','MfG Massak GmbH','123456','','y',2,3,4),(34,'JVA Bamberg','',33,'7','MfG Massak GmbH','123456','','n',2,3,4),(35,'JVA Bamberg','',34,'8','MfG Massak GmbH','123456','','n',2,3,4),(36,'JVA Bamberg','',35,'9','MfG Massak GmbH','123456','','n',2,3,4),(37,'JVA Bamberg','',36,'10','MfG Massak GmbH','123456','','n',2,3,4),(38,'JVA Bamberg','',37,'11','MfG Massak GmbH','123456123','JVA hallo halli ','n',2,3,4),(39,'JVA Bamberg','',38,'12','MfG Massak GmbH','123456','','n',2,3,4),(40,'JVA Bamberg','',39,'13','MfG Massak GmbH','123456','','n',2,3,4),(41,'JVA Bamberg','',40,'14','MfG Massak GmbH','123456','','n',2,3,4),(42,'JVA Bamberg','',41,'15','MfG Massak GmbH','123456','','n',2,3,4),(43,'JVA Bamberg','',42,'16','MfG Massak GmbH','123456','','n',2,3,4),(44,'JVA Bamberg','',43,'17','MfG Massak GmbH','123456','','n',2,3,4),(45,'JVA Bamberg','',44,'18','MfG Massak GmbH','123456','huha','n',2,3,4),(46,'JVA Bamberg','',45,'19','MfG Massak GmbH','123456','asd','n',2,3,4),(47,'JVA Bamberg','',46,'20','MfG Massak GmbH','123456','','n',2,3,4),(48,'JVA Bamberg','',47,'21','MfG Massak GmbH','123456','','n',2,3,4),(49,'JVA Bamberg','',48,'22','MfG Massak GmbH','123456','','n',2,3,4),(50,'JVA Bamberg','',49,'23','MfG Massak GmbH','123456','','y',2,3,4),(52,'JVA Bamberg','fasd',50,'24','MfG Massak GmbH','123456','f','n',2,3,4),(53,'JVA El Palmar','98765 Conil',52,'Casa Alquitara','Saludo cordial','123987','Vale','n',2,3,4),(54,'TEST','',59,'123','','','','n',2,3,4),(55,'','',60,'','','','','n',2,3,4),(56,'','',61,'','','','','n',2,3,4),(57,'JVA Hauptsi','Hauptsi 30 96052 Bamberg',62,'drunter','Adela Tschuessikowski!','','','n',2,3,4);
/*!40000 ALTER TABLE `jvadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lastusedcounter`
--

DROP TABLE IF EXISTS `lastusedcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastusedcounter` (
  `lastUsedCounterId` int(11) NOT NULL AUTO_INCREMENT,
  `lastUsedCounterStatus` int(11) NOT NULL,
  `lastUsedCounterName` varchar(45) NOT NULL,
  PRIMARY KEY (`lastUsedCounterId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lastusedcounter`
--

LOCK TABLES `lastusedcounter` WRITE;
/*!40000 ALTER TABLE `lastusedcounter` DISABLE KEYS */;
INSERT INTO `lastusedcounter` VALUES (1,6,'IK'),(2,38,'Logistik Memmelsdorf'),(3,5,'Logistik Loehne'),(4,1,'Wittekindshof');
/*!40000 ALTER TABLE `lastusedcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtinittest`
--

DROP TABLE IF EXISTS `rtinittest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rtinittest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='init test';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtinittest`
--

LOCK TABLES `rtinittest` WRITE;
/*!40000 ALTER TABLE `rtinittest` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtinittest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearcounter`
--

DROP TABLE IF EXISTS `yearcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearcounter` (
  `yearCounterId` int(11) NOT NULL AUTO_INCREMENT,
  `yearCounter` varchar(45) NOT NULL,
  PRIMARY KEY (`yearCounterId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearcounter`
--

LOCK TABLES `yearcounter` WRITE;
/*!40000 ALTER TABLE `yearcounter` DISABLE KEYS */;
INSERT INTO `yearcounter` VALUES (1,'2015');
/*!40000 ALTER TABLE `yearcounter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-11 11:40:32
