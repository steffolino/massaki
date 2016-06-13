CREATE DATABASE  IF NOT EXISTS `rechnungstool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rechnungstool`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rechnungstool
-- ------------------------------------------------------
-- Server version	5.6.24

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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldef`
--

LOCK TABLES `coldef` WRITE;
/*!40000 ALTER TABLE `coldef` DISABLE KEYS */;
INSERT INTO `coldef` VALUES (0,' '),(1,'Buchnummer'),(2,'Name'),(3,'Unterbringung'),(4,'Artikelbeschreibung'),(5,'Sonstiges'),(96,'Menge'),(97,'0% MwSt'),(98,'7% MwSt'),(99,'19% MwSt'),(100,'Gesamt 0%'),(101,'Gesamt 7%'),(102,'Gesamt 19%');
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
INSERT INTO `collectiveinvoice` VALUES (2,1),(2,2),(1,11),(1,12),(1,13),(1,14),(1,15);
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
  `col6` int(11) DEFAULT '96',
  `col7` int(11) DEFAULT '97',
  `col8` int(11) DEFAULT '98',
  `col9` int(11) DEFAULT '99',
  `col10` int(11) NOT NULL DEFAULT '100',
  `col11` int(11) NOT NULL DEFAULT '101',
  `col12` int(11) NOT NULL DEFAULT '102',
  `printAmount` int(11) NOT NULL DEFAULT '1',
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
  CONSTRAINT `col1` FOREIGN KEY (`col1`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col10` FOREIGN KEY (`col10`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col11` FOREIGN KEY (`col11`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col12` FOREIGN KEY (`col12`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col2` FOREIGN KEY (`col2`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col3` FOREIGN KEY (`col3`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col4` FOREIGN KEY (`col4`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col5` FOREIGN KEY (`col5`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col6` FOREIGN KEY (`col6`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col7` FOREIGN KEY (`col7`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col8` FOREIGN KEY (`col8`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `col9` FOREIGN KEY (`col9`) REFERENCES `coldef` (`colDefId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcolconfig`
--

LOCK TABLES `defaultcolconfig` WRITE;
/*!40000 ALTER TABLE `defaultcolconfig` DISABLE KEYS */;
INSERT INTO `defaultcolconfig` VALUES (1,5,2,3,4,0,96,97,98,99,100,101,102,3),(2,5,2,0,0,0,96,97,98,99,100,101,102,4),(3,5,0,0,0,0,96,97,98,99,100,101,102,2),(4,4,0,0,0,0,96,97,98,99,100,101,102,1),(5,1,2,3,5,0,96,97,98,99,100,101,102,2),(6,1,2,3,4,0,96,97,98,99,100,101,102,0),(7,4,0,0,0,0,96,97,98,99,100,101,102,0),(8,4,0,0,0,0,96,97,98,99,100,101,102,0),(9,4,0,0,0,0,96,97,98,99,100,101,102,0),(10,4,2,3,4,0,96,97,98,99,100,101,102,0);
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
  `printed` varchar(1) DEFAULT '0',
  `timeStamp` date DEFAULT NULL,
  `defaultDoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`documentId`),
  KEY `jvaId_idx` (`jvaId`),
  KEY `yearCounter_idx` (`yearCounter`),
  KEY `docType_idx` (`docTypeId`),
  KEY `documentType_idx` (`docTypeId`),
  CONSTRAINT `documentType` FOREIGN KEY (`docTypeId`) REFERENCES `doctype` (`docTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaId` FOREIGN KEY (`jvaId`) REFERENCES `jvadata` (`jvaDataId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `yearCounter` FOREIGN KEY (`yearCounter`) REFERENCES `yearcounter` (`yearCounterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'IK 0',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_131253.pdf','Herr Aumueller','0','2016-06-06','yes'),(2,'IK 1',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_131429.pdf','Herr Aumueller','0','2016-06-06','yes'),(4,'IK 2',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_132701.pdf','Herr Aumueller','0','2016-06-06','yes'),(7,'IK 3',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_161341.pdf','Herr Aumueller','0','2016-06-06','yes'),(8,'IK 4',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_161552.pdf','Herr Aumueller','0','2016-06-06','yes'),(9,'IK 5',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_162444.pdf','Herr Aumueller','0','2016-06-06','yes'),(10,'IK 6',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_162600.pdf','Herr Aumueller','0','2016-06-06','yes'),(11,'IK 7',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_165910.pdf','Herr Aumueller','0','2016-06-06','yes'),(12,'IK 8',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_165955.pdf','Herr Aumueller','0','2016-06-06','yes'),(13,'IK 9',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_170113.pdf','Herr Aumueller','0','2016-06-06','yes'),(14,'IK 10',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160606_170624.pdf','Herr Aumueller','0','2016-06-06','yes'),(15,'IK 11',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160613_152937.pdf','Herr Aumueller','0','2016-06-13',NULL),(16,'IK 12',1,1,3,'pdf/Sammelrechnung/Test1_Sammelrechnung_20160613_162942.pdf',NULL,'0','2016-06-13',NULL),(17,'IK 13',1,1,3,'pdf/Sammelrechnung/Test1_Sammelrechnung_20160613_164707.pdf',NULL,'0','2016-06-13',NULL),(18,'Logistik Loehne 0',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160613_164917.pdf','Herr Aumueller','0','2016-06-13',NULL),(19,'Logistik Loehne 1',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160613_165008.pdf','Herr Aumueller','0','2016-06-13',NULL),(21,'Logistik Loehne 2',1,1,2,'pdf/Rechnung/Test1_TestExt_Rechnung_20160613_165633.pdf','Herr Aumueller','0','2016-06-13',NULL);
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
  CONSTRAINT `documentId` FOREIGN KEY (`documentId`) REFERENCES `document` (`documentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentvalues`
--

LOCK TABLES `documentvalues` WRITE;
/*!40000 ALTER TABLE `documentvalues` DISABLE KEYS */;
INSERT INTO `documentvalues` VALUES (1,1,'','','','','5','0,55','0,00','0,00','2,75','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(2,1,'','','','','10','0,00','0,55','0,00','0,00','5,50','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(3,1,'Gesamt:','','','','','','','','2,75','5,50','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(4,2,'','','','','50','0,55','0,00','0,00','27,50','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(5,2,'','','','','10','0,00','0,55','0,00','0,00','5,50','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(6,2,'','','','','500','0,00','0,00','5,55','0,00','0,00','2 775,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(7,2,'Gesamt:','','','','','','','','27,50','5,50','2 775,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(10,4,'','','','','55','0,55','0,00','0,00','30,25','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(11,4,'','','','','10','0,00','0,00','50,00','0,00','0,00','500,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(12,4,'','','','','13','0,00','0,00','55,55','0,00','0,00','722,15',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(13,4,'Gesamt:','','','','','','','','30,25','0,00','1 222,15',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(18,7,'','','','axe deo','55','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(19,7,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(20,7,'','','','noch was','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(21,7,'Gesamt:','','','','','','','','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(22,8,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(23,8,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(24,8,'','','','noch was','10','0,00','1,23','0,00','0,00','12,30','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(25,8,'Gesamt:','','','','','','','','2 376,55','12,30','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(26,9,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(27,9,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(28,9,'','','','noch was','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(29,9,'','','','','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(30,9,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(31,9,'Gesamt:','','','','','','','','2 376,55','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(32,10,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(33,10,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(34,10,'','','','noch was','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(35,10,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(36,10,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(37,10,'Gesamt:','','','','','','','','2 376,55','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(38,11,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(39,11,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(40,11,'','','','noch was','12','1,23','0,00','0,00','14,76','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(41,11,'','','','','','','','','#VALUE!','#VALUE!','#VALUE!',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(42,11,'','','','','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(43,11,'Gesamt:','','','','','','','','#VALUE!','#VALUE!','#VALUE!',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(44,12,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(45,12,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(46,12,'','','','noch was','12','1,23','0,00','0,00','14,76','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(47,12,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(48,12,'','','','','0','0,00','0,00','0,00','0,00','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(49,12,'Gesamt:','','','','','','','','2 391,31','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(50,13,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(51,13,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(52,13,'','','','noch was','12','1,23','0,00','0,00','14,76','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(53,13,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(54,13,'','','','','','','','','','','',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(55,13,'Gesamt:','','','','','','','','2 391,31','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(56,14,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(57,14,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(58,14,'','','','noch was','12','1,23','0,00','0,00','14,76','0,00','0,00',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(59,14,'Gesamt:','','','','','','','','2 391,31','0,00','55,50',NULL,'0% MwSt','Buchnummer','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(60,15,'','','','axe deo','55','43,21','0,00','0,00','2 376,55','0,00','0,00',NULL,'0% MwSt','Sonstiges','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(61,15,'','','','zahnbuerste','10','0,00','0,00','5,55','0,00','0,00','55,50',NULL,'0% MwSt','Sonstiges','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(62,15,'','','','noch was','12','1,23','0,00','0,00','14,76','0,00','0,00',NULL,'0% MwSt','Sonstiges','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(63,15,'Gesamt:','','','','','','','','2 391,31','0,00','55,50',NULL,'0% MwSt','Sonstiges','Name','Unterbringung','Artikelbeschreibung','Menge','7% MwSt','19% MwSt','Gesamt 0%','Gesamt 7%','Gesamt 19%',NULL),(64,16,'IK 7','2016-06-06','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,16,'IK 8','2016-06-06','2446',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,16,'IK 9','2016-06-06','2446',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,16,'IK 10','2016-06-06','2446',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,16,'IK 11','2016-06-13','2446',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,17,'IK 0','2016-06-06','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,17,'IK 1','2016-06-06','2807',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rechnungsnummer','Rechnungsdatum','Rechnungsbetrag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,18,'','507','5,07','0,00','0,00','2 570,49','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL),(72,18,'Gesamt:','','','','','2 570,49','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL),(73,19,'','123','5,12','0,00','0,00','629,76','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL),(74,19,'Gesamt:','','','','','629,76','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL),(77,21,'','101','5,47','0,00','0,00','552,47','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL),(78,21,'Gesamt:','','','','','552,47','0,00','0,00',NULL,NULL,NULL,NULL,'Gesamt 0%','Sonstiges','Menge','0% MwSt','7% MwSt','19% MwSt','Gesamt 7%','Gesamt 19%',NULL,NULL,NULL,NULL);
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
  `jvaColEk` int(11) DEFAULT '1',
  PRIMARY KEY (`jvaDataId`),
  KEY `jvaColConfig_idx` (`jvaColConfig`),
  KEY `jvaColMemmel_idx` (`jvaColMemm`),
  KEY `jvaColLoehne_idx` (`jvaColLoeh`),
  KEY `jvaColWitte_idx` (`jvaColWitt`),
  KEY `jvaColEk_idx` (`jvaColEk`),
  CONSTRAINT `jvaColE` FOREIGN KEY (`jvaColEk`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaColIk` FOREIGN KEY (`jvaColConfig`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jvaColLoehne` FOREIGN KEY (`jvaColLoeh`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaColMemmel` FOREIGN KEY (`jvaColMemm`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaColWitte` FOREIGN KEY (`jvaColWitt`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jvadata`
--

LOCK TABLES `jvadata` WRITE;
/*!40000 ALTER TABLE `jvadata` DISABLE KEYS */;
INSERT INTO `jvadata` VALUES (1,'Test 1','Teststrasse 1\n95123 Testdorf  Neu',1,'Test Ext','MfG Test  Neu','Test Cuts  Neu','Test Desc Neu','n',2,3,4,5),(2,' Neu',' Neu',6,' Neu',' Neu',' Neu',' Neu','n',7,8,9,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lastusedcounter`
--

LOCK TABLES `lastusedcounter` WRITE;
/*!40000 ALTER TABLE `lastusedcounter` DISABLE KEYS */;
INSERT INTO `lastusedcounter` VALUES (1,14,'IK'),(2,0,'Logistik Memmelsdorf'),(3,3,'Logistik Loehne'),(4,0,'Wittekindshof'),(5,0,'EK');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearcounter`
--

LOCK TABLES `yearcounter` WRITE;
/*!40000 ALTER TABLE `yearcounter` DISABLE KEYS */;
INSERT INTO `yearcounter` VALUES (1,'2016'),(2,'xxx');
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

-- Dump completed on 2016-06-13 17:26:49
