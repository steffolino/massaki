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
INSERT INTO `coldef` VALUES (1,'Artikelnummer'),(2,'Artikelbeschreibung'),(3,'Artikelanzahl'),(4,'Artikelirgendwas'),(5,'Rechnung'),(6,'Preis 7 MwSt'),(7,'Preis 19 MwSt'),(8,'Sonstiges'),(9,'Buchnummer');
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
  `col1` int(11) DEFAULT NULL,
  `col2` int(11) DEFAULT NULL,
  `col3` int(11) DEFAULT NULL,
  `col4` int(11) DEFAULT NULL,
  `col5` int(11) DEFAULT NULL,
  `col6` int(11) DEFAULT NULL,
  `col7` int(11) DEFAULT NULL,
  `col8` int(11) DEFAULT NULL,
  `col9` int(11) DEFAULT NULL,
  `col10` int(11) DEFAULT NULL,
  `col11` int(11) DEFAULT NULL,
  `col12` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcolconfig`
--

LOCK TABLES `defaultcolconfig` WRITE;
/*!40000 ALTER TABLE `defaultcolconfig` DISABLE KEYS */;
INSERT INTO `defaultcolconfig` VALUES (1,1,2,3,4,5,6,7,8,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`jvaDataId`),
  KEY `jvaColConfig_idx` (`jvaColConfig`),
  CONSTRAINT `jvaColConfig` FOREIGN KEY (`jvaColConfig`) REFERENCES `defaultcolconfig` (`colConfigId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jvadata`
--

LOCK TABLES `jvadata` WRITE;
/*!40000 ALTER TABLE `jvadata` DISABLE KEYS */;
INSERT INTO `jvadata` VALUES (0,'JVA Ebing','Am Schwana 3 96147 Rattelsdorf',1,'IK','Herzlichst, Ihr Bjoern Zenkone');
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

-- Dump completed on 2015-08-14 16:40:42
