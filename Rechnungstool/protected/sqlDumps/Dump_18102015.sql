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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultcolconfig`
--

LOCK TABLES `defaultcolconfig` WRITE;
/*!40000 ALTER TABLE `defaultcolconfig` DISABLE KEYS */;
INSERT INTO `defaultcolconfig` VALUES (1,1,2,3,4,5,0,0,0,0,0,0,4),(8,5,7,8,1,5,0,0,0,0,0,0,4),(9,1,2,3,0,0,0,0,0,0,0,0,0),(10,9,8,7,0,0,0,0,0,0,0,0,0),(11,9,8,7,0,0,0,0,0,0,0,0,0),(12,3,0,0,0,0,0,0,0,0,0,0,0),(13,3,0,0,0,0,0,0,0,0,0,0,0),(14,3,0,0,0,0,0,0,0,0,0,0,0),(15,3,0,0,0,0,0,0,0,0,0,0,0),(16,3,0,0,0,0,0,0,0,0,0,0,0),(17,3,0,0,0,0,0,0,0,0,0,0,0),(18,3,0,0,0,0,0,0,0,0,0,0,0),(19,3,0,0,0,0,0,0,0,0,0,0,0),(20,0,0,0,0,0,0,0,0,0,0,0,0),(21,0,0,0,0,0,0,0,0,0,0,0,0),(22,0,0,0,0,0,0,0,0,0,0,0,0),(23,0,0,0,0,0,0,0,0,0,0,0,0),(24,0,0,0,0,0,0,0,0,0,0,0,0),(25,0,0,0,0,0,0,0,0,0,0,0,0),(26,0,0,0,0,0,0,0,0,0,0,0,0),(27,0,0,0,0,0,0,0,0,0,0,0,0),(28,0,0,0,0,0,0,0,0,0,0,0,0),(29,0,0,0,0,0,0,0,0,0,0,0,0),(30,0,0,0,0,0,0,0,0,0,0,0,0),(31,0,0,0,0,0,0,0,0,0,0,0,0),(32,0,0,0,0,0,0,0,0,0,0,0,0),(33,0,0,0,0,0,0,0,0,0,0,0,0),(34,0,0,0,0,0,0,0,0,0,0,0,0),(35,0,0,0,0,0,0,0,0,0,0,0,0),(36,0,0,0,0,0,0,0,0,0,0,0,0),(37,5,0,0,0,0,0,0,3,0,0,0,0),(38,0,0,0,0,0,0,0,0,0,0,0,0),(39,0,0,0,0,0,0,0,0,0,0,0,0),(40,0,0,0,0,0,0,0,0,0,0,0,0),(41,0,0,0,0,0,0,0,0,0,0,0,0),(42,0,0,0,0,0,0,0,0,0,0,0,0),(43,0,0,0,0,0,0,0,0,0,0,0,0),(44,0,0,0,0,0,0,0,0,0,0,0,0),(45,0,0,0,0,0,0,0,0,0,0,0,0),(46,0,0,0,0,0,0,0,0,0,0,0,0),(47,0,0,0,0,0,0,0,0,0,0,0,0),(48,0,0,0,0,0,0,0,0,0,0,0,0),(49,0,0,0,0,0,0,0,0,0,0,0,0),(50,0,0,0,0,0,0,0,0,0,0,0,4);
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
  PRIMARY KEY (`documentId`),
  KEY `jvaId_idx` (`jvaId`),
  KEY `yearCounter_idx` (`yearCounter`),
  KEY `docType_idx` (`docTypeId`),
  KEY `documentType_idx` (`docTypeId`),
  CONSTRAINT `documentType` FOREIGN KEY (`docTypeId`) REFERENCES `doctype` (`docTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `jvaId` FOREIGN KEY (`jvaId`) REFERENCES `jvadata` (`jvaDataId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `yearCounter` FOREIGN KEY (`yearCounter`) REFERENCES `yearcounter` (`yearCounterId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (3,'B 18',1,0,2,NULL,'Alfred E. Neumann',NULL),(4,'B 19',1,0,2,'Auf der Platte','Alfred E. Neumann',NULL),(5,'A 0',1,0,1,'Auf der Platte','Alfred E. Neumann',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentvalues`
--

LOCK TABLES `documentvalues` WRITE;
/*!40000 ALTER TABLE `documentvalues` DISABLE KEYS */;
INSERT INTO `documentvalues` VALUES (1,4,'5','6','Horst','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Artikelbeschreibung','Artikelnummer','Artikenanzahl','Rechnung',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,'6','7','Detelef','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Artikelbeschreibung','Artikelnummer','Artikenanzahl','Rechnung',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,5,'5','6','Horst','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Artikelbeschreibung','Artikelnummer','Artikenanzahl','Rechnung',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,5,'6','7','Detelef','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Artikelbeschreibung','Artikelnummer','Artikenanzahl','Rechnung',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `jvadata` VALUES (0,'JVA Ebing','Am Schwana 3 96147 Rattelsdorf',1,'IK','Herzlichst, Ihr Bjoern Zinkni','','1','n'),(9,'JVA Hauptsi','',8,'drunter','Adela Tschuessikowski!','','','y'),(10,'JVA Test 1','',9,'Extra','Gruesse','IK 555','','y'),(11,'test 2','',10,'xxxtra','ade','asd','asd','y'),(12,'test 2','',11,'xxxtra','ade','asd','asd','y'),(13,'asd','',12,'asd','asd','asd','asd','y'),(14,'asd','was da los',13,'asd','asd','','','y'),(15,'dei mudda','',14,'asd','asd','','123','y'),(16,'dei mudda','was da los',15,'asd','asd','','','y'),(17,'dei mudda 2','',16,'asd','asd','','','y'),(18,'dei mudda aber sowas von','',17,'asd','asd','','','n'),(19,'dei mudda aber sowas von 2','was da los',18,'asd','asd','','','y'),(20,'dei mudda aber sowas von 3','was da los',19,'asd','asd','','','y'),(21,'444444','',20,'','','','','y'),(22,'5555','',21,'','','','','n'),(23,'6666','',22,'','','','','y'),(24,'7777','',23,'','','','','y'),(25,'88','',24,'','','','','n'),(26,'99','',25,'','','','','n'),(27,'10','',26,'','','','','n'),(28,'11','',27,'','','','','y'),(29,'12','',28,'','','','','n'),(30,'12','',29,'','','','','n'),(31,'12','',30,'','','','','n'),(32,'13','',31,'','','','','n'),(33,'14','',32,'ext','','','','y'),(34,'14','',33,'ext','','','','n'),(35,'15','',34,'ext','','','','n'),(36,'16 ii','',35,'','','','','n'),(37,'17','',36,'','','','','n'),(38,'18 ia','',37,'','Tschüssikowski','123456123','JVA hallo halli ','n'),(39,'19 ia','',38,'','','','','n'),(40,'20 ia','',39,'','','','','n'),(41,'21 ia','',40,'','','','','n'),(42,'22 ia','',41,'','','','','n'),(43,'23','',42,'','','','','n'),(44,'24','',43,'huha','','','','n'),(45,'25','',44,'huha','','','huha','n'),(46,'26','',45,'huha','','','asd','n'),(47,'27','',46,'huha','','','','n'),(48,'28','',47,'huha','','','','n'),(49,'29','',48,'huha','','','','n'),(50,'30','',49,'huha','','','','y'),(52,'kuckuck','fasd',50,'zwei','asd','fasd','f','n');
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
INSERT INTO `lastusedcounter` VALUES (1,1,'A'),(2,20,'B'),(3,0,'C'),(4,0,'D');
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

-- Dump completed on 2015-10-18 16:02:40
