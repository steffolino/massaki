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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldef`
--

LOCK TABLES `coldef` WRITE;
/*!40000 ALTER TABLE `coldef` DISABLE KEYS */;
INSERT INTO `coldef` VALUES (0,' '),(1,'Artikelnummer'),(2,'Artikelbeschreibung'),(3,'Artikelanzahl'),(4,'Artikelirgendwas'),(5,'Rechnung'),(6,'Preis 7 MwSt'),(7,'Preis 19 MwSt'),(8,'Sonstiges'),(9,'Buchnummer');
/*!40000 ALTER TABLE `coldef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectiveinvoice`
--

DROP TABLE IF EXISTS `collectiveinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiveinvoice` (
  `collectInvoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `deliveryNoteId` int(11) NOT NULL,
  PRIMARY KEY (`collectInvoiceId`),
  KEY `deliveryNoteId_idx` (`deliveryNoteId`),
  CONSTRAINT `deliveryNoteId` FOREIGN KEY (`deliveryNoteId`) REFERENCES `document` (`documentId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectiveinvoice`
--

LOCK TABLES `collectiveinvoice` WRITE;
/*!40000 ALTER TABLE `collectiveinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectiveinvoice` ENABLE KEYS */;
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
  `col10` int(11) DEFAULT '0',
  `col11` int(11) DEFAULT '0',
  `col12` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcolconfig`
--

LOCK TABLES `defaultcolconfig` WRITE;
/*!40000 ALTER TABLE `defaultcolconfig` DISABLE KEYS */;
INSERT INTO `defaultcolconfig` VALUES (1,1,2,3,4,5,0,0,0,0,0,0,4),(8,5,7,8,1,5,0,0,0,0,0,0,4),(9,1,2,3,0,0,0,0,0,0,0,0,0),(10,9,8,7,0,0,0,0,0,0,0,0,0),(11,9,8,7,0,0,0,0,0,0,0,0,0),(12,3,0,0,0,0,0,0,0,0,0,0,0),(13,3,0,0,0,0,0,0,0,0,0,0,0),(14,3,0,0,0,0,0,0,0,0,0,0,0),(15,3,0,0,0,0,0,0,0,0,0,0,0),(16,3,0,0,0,0,0,0,0,0,0,0,0),(17,3,0,0,0,0,0,0,0,0,0,0,0),(18,3,0,0,0,0,0,0,0,0,0,0,0),(19,3,0,0,0,0,0,0,0,0,0,0,0),(20,0,0,0,0,0,0,0,0,0,0,0,0),(21,0,0,0,0,0,0,0,0,0,0,0,0),(22,0,0,0,0,0,0,0,0,0,0,0,0),(23,0,0,0,0,0,0,0,0,0,0,0,0),(24,0,0,0,0,0,0,0,0,0,0,0,0),(25,0,0,0,0,0,0,0,0,0,0,0,0),(26,0,0,0,0,0,0,0,0,0,0,0,0),(27,0,0,0,0,0,0,0,0,0,0,0,0),(28,0,0,0,0,0,0,0,0,0,0,0,0),(29,0,0,0,0,0,0,0,0,0,0,0,0),(30,0,0,0,0,0,0,0,0,0,0,0,0),(31,0,0,0,0,0,0,0,0,0,0,0,0),(32,0,0,0,0,0,0,0,0,0,0,0,0),(33,0,0,0,0,0,0,0,0,0,0,0,0),(34,0,0,0,0,0,0,0,0,0,0,0,0),(35,0,0,0,0,0,0,0,0,0,0,0,0),(36,0,0,0,0,0,0,0,0,0,0,0,0),(37,0,0,0,0,0,0,0,0,0,0,0,0),(38,0,0,0,0,0,0,0,0,0,0,0,0),(39,0,0,0,0,0,0,0,0,0,0,0,0),(40,0,0,0,0,0,0,0,0,0,0,0,0),(41,0,0,0,0,0,0,0,0,0,0,0,0),(42,0,0,0,0,0,0,0,0,0,0,0,0),(43,0,0,0,0,0,0,0,0,0,0,0,0),(44,0,0,0,0,0,0,0,0,0,0,0,0),(45,0,0,0,0,0,0,0,0,0,0,0,0),(46,0,0,0,0,0,0,0,0,0,0,0,0),(47,0,0,0,0,0,0,0,0,0,0,0,0),(48,0,0,0,0,0,0,0,0,0,0,0,0),(49,0,0,0,0,0,0,0,0,0,0,0,0),(50,1,2,3,5,6,0,0,0,0,0,0,0),(51,1,2,3,5,6,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `defaultcolconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `documentId` int(11) NOT NULL AUTO_INCREMENT,
  `counterTypeId` int(11) NOT NULL,
  `counter` varchar(45) NOT NULL,
  `yearCounter` int(11) NOT NULL,
  `jvaId` int(11) NOT NULL,
  `docType` varchar(45) NOT NULL,
  `pdf_location` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `printed` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`documentId`),
  KEY `counterTypeId_idx` (`counterTypeId`),
  KEY `jvaId_idx` (`jvaId`),
  CONSTRAINT `counterTypeId` FOREIGN KEY (`counterTypeId`) REFERENCES `countertype` (`counterTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaId` FOREIGN KEY (`jvaId`) REFERENCES `jvadata` (`jvaDataId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentvalues`
--

LOCK TABLES `documentvalues` WRITE;
/*!40000 ALTER TABLE `documentvalues` DISABLE KEYS */;
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
  PRIMARY KEY (`jvaDataId`),
  KEY `jvaColConfig_idx` (`jvaColConfig`),
  CONSTRAINT `jvaColConfig` FOREIGN KEY (`jvaColConfig`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jvadata`
--

LOCK TABLES `jvadata` WRITE;
/*!40000 ALTER TABLE `jvadata` DISABLE KEYS */;
INSERT INTO `jvadata` VALUES (0,'JVA Ebing','Am Schwana 3 96147 Rattelsdorf',1,'Hr Zenk','Herzlichst, Ihr Bjoern Zinkni','','1','n'),(9,'JVA Hauptsi','',8,'Links','Adela Tschuessikowski!','','','y'),(10,'JVA Test 1','',9,'Rechts','Gruesse','IK 555','','y'),(11,'JVA Test 2','',10,'Links','ade','asd','CustNum','y'),(12,'JVA Test 3','',11,'Links','ade','asd','CustNum','y'),(13,'JVA Test 4','',12,'Links','asd','asd','CustNum','y'),(14,'JVA Test 5','',13,'Links','asd','','','y'),(15,'JVA Bamberg','',14,'Links','asd','','123','y'),(16,'JVA Ebrach','',15,'Links','asd','','','y'),(17,'JVA Forchheim','',16,'Links','asd','','','n'),(18,'JVA Erlangen','',17,'Links','asd','','','n'),(19,'JVA Erlangen II','Am Schwana 3 96147 Rattelsdorf',18,'Hr Mueller','asd','','','y'),(20,'JVA Erlangen III','Am Schwana 3 96147 Rattelsdorf',19,'Hr Mueller','asd','','','y'),(21,'JVA Lichtenfels','',20,'Hr Mueller','','','','y'),(22,'JVA Lichtenfels II','',21,'Hr Mueller','','','','n'),(23,'JVA Irgendwas','',22,'','','','','y'),(24,'JVA Irgendwas II','',23,'','','','','y'),(25,'JVA Foo','',24,'','','','','n'),(26,'JVA Bar','',25,'','','','','y'),(27,'JVA Test 10','',26,'','','','','n'),(28,'JVA Test 11','',27,'','','','','y'),(29,'JVA Test 12','',28,'','','','','n'),(30,'JVA Test 13','',29,'','','','','n'),(31,'JVA Test 14','',30,'','','','','n'),(32,'JVA Test 15','',31,'','','','','n'),(33,'JVA Test 16','',32,'ext','','','','n'),(34,'JVA Test 17','',33,'ext','','','','n'),(35,'JVA Test 18','',34,'ext','','','','n'),(36,'JVA Test 19','',35,'','','','','n'),(37,'JVA Test 20','',36,'','','','','n'),(38,'JVA Test 21','',37,'','','','','n'),(39,'JVA Test 22','',38,'','','','','n'),(40,'JVA Test 23','',39,'','','','','n'),(41,'JVA Test 24','',40,'','','','','n'),(42,'JVA Test 25','',41,'','','','','n'),(43,'JVA Test 26','',42,'','','','','n'),(44,'JVA Test 27','',43,'Hr Mueller','','','','n'),(45,'JVA Test 28','',44,'Hr Mueller','','','CustNum','n'),(46,'JVA Test 29','',45,'Hr Mueller','','','CustNum','n'),(47,'JVA Test 30','',46,'Hr Zenk','','','','n'),(48,'JVA Test 31','',47,'Hr Zenk','','','','n'),(49,'JVA Test 32','',48,'Hr Zenk','','','','n'),(50,'JVA Test 33','',49,'Hr Zenk','','','','y'),(51,'JVA Würzburg','',50,'Am Bahnhof','MfG Massak','Kundennummer','Kundennummer Beschreibung','n'),(52,'JVA Würzburg','Am Bahnhof 1\n99123 Würzburg',51,'II','MfG Massak','Kundennummer','Kundennummer Beschreibung','n');
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
  `lastUsedCounterTypeId` int(11) NOT NULL,
  `lastUsedCounterStatus` int(11) NOT NULL,
  PRIMARY KEY (`lastUsedCounterId`),
  KEY `lastUsedCounterTypeId_idx` (`lastUsedCounterTypeId`),
  CONSTRAINT `lastUsedCounterTypeId` FOREIGN KEY (`lastUsedCounterTypeId`) REFERENCES `countertype` (`counterTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lastusedcounter`
--

LOCK TABLES `lastusedcounter` WRITE;
/*!40000 ALTER TABLE `lastusedcounter` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-01 12:23:08