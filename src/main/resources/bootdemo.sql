-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: bootdemo
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` int(11) unsigned zerofill DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL,
  `typeId` int(22) unsigned NOT NULL,
  `tagId` int(22) unsigned NOT NULL,
  `comment` tinyint(1) unsigned DEFAULT NULL,
  `top` tinyint(1) unsigned zerofill DEFAULT NULL,
  `order` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(2,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(3,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(4,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(5,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(6,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(7,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(8,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(9,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(10,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(11,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(12,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(13,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(14,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(15,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(16,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(17,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(18,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(19,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(20,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(21,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(22,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(23,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(24,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(25,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(26,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(27,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(28,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(29,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(30,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(31,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(32,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(33,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(34,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(35,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(36,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(37,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(38,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(39,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(40,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(41,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(42,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(43,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(44,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(45,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(46,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(47,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(48,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(49,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(50,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(51,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(52,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(53,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(54,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(55,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(56,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(57,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(58,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(59,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(60,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(61,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(62,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(63,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(64,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(65,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(66,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(67,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(68,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(69,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(70,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(71,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(72,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(73,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(74,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(75,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(76,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(77,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(78,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(79,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(80,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(81,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(82,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(83,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(84,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(85,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(86,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(87,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(88,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(89,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(90,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(91,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(92,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(93,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(94,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(95,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(96,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(97,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(98,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(99,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(100,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL),(101,'test','哦哦对是哦',00000000000,NULL,'2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aid` int(22) unsigned zerofill NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pid` int(22) NOT NULL,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aid` int(22) unsigned zerofill NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(22) unsigned zerofill NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-15 18:11:12
