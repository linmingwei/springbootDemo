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
  `status` int(11) unsigned DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `typeId` int(22) unsigned NOT NULL,
  `comment` tinyint(1) unsigned zerofill DEFAULT '1',
  `top` tinyint(1) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `look` int(11) DEFAULT '0',
  `favorate` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (110,'test','哦哦对是哦',1,'这是第10篇文章',NULL,NULL,4,1,NULL,NULL,0,0),(111,'test','哦哦对是哦',0,'这是第11篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(112,'test','哦哦对是哦',0,'这是第12篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,0,0),(113,'test','哦哦对是哦',0,'这是第13篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(114,'test','哦哦对是哦',0,'这是第14篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(115,'test','哦哦对是哦',0,'这是第15篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(116,'test','哦哦对是哦',0,'这是第16篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(117,'test','哦哦对是哦',0,'这是第17篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,1,NULL,0,0),(118,'test','哦哦对是哦',0,'这是第18篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(119,'test','哦哦对是哦',0,'这是第19篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(120,'test','哦哦对是哦',0,'这是第20篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(121,'test','哦哦对是哦',0,'这是第21篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(122,'test','哦哦对是哦',0,'这是第22篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(123,'test','哦哦对是哦',0,'这是第23篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(124,'test','哦哦对是哦',0,'这是第24篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(125,'test','哦哦对是哦',0,'这是第25篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(126,'test','哦哦对是哦',0,'这是第26篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(127,'test','哦哦对是哦',0,'这是第27篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(128,'test','哦哦对是哦',0,'这是第28篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(129,'test','哦哦对是哦',0,'这是第29篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(130,'test','哦哦对是哦',0,'这是第30篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(131,'test','哦哦对是哦',0,'这是第31篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(132,'test','哦哦对是哦',0,'这是第32篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(133,'test','哦哦对是哦',0,'这是第33篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(134,'test','哦哦对是哦',0,'这是第34篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(135,'test','哦哦对是哦',0,'这是第35篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(136,'test','哦哦对是哦',0,'这是第36篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(137,'test','哦哦对是哦',0,'这是第37篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(138,'test','哦哦对是哦',0,'这是第38篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(139,'test','哦哦对是哦',0,'这是第39篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(140,'test','哦哦对是哦',0,'这是第40篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,100,0),(141,'test','哦哦对是哦',0,'这是第41篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,345,0),(142,'test','哦哦对是哦',0,'这是第42篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,23,0),(143,'test','哦哦对是哦',0,'这是第43篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,32145,0),(144,'test','哦哦对是哦',0,'这是第44篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,536,0),(145,'test','哦哦对是哦',0,'这是第45篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,67,0),(146,'test','哦哦对是哦',0,'这是第46篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,34,0),(147,'test','哦哦对是哦',0,'这是第47篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,12745,0),(148,'test','哦哦对是哦',0,'这是第48篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,245,0),(149,'test','哦哦对是哦',0,'这是第49篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,5634,0),(150,'test','哦哦对是哦',0,'这是第50篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,236,0),(151,'test','哦哦对是哦',0,'这是第51篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,457,0),(152,'test','哦哦对是哦',0,'这是第52篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,47272,0),(153,'test','哦哦对是哦',0,'这是第53篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,3457,0),(154,'test','哦哦对是哦',0,'这是第54篇文章','2019-04-23 10:10:04','2019-04-14 13:13:21',1,1,0,NULL,23,0),(155,'test','哦哦对是哦',0,'这是第55篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(156,'test','哦哦对是哦',0,'这是第56篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(157,'test','哦哦对是哦',0,'这是第57篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(158,'test','哦哦对是哦',0,'这是第58篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(159,'test','哦哦对是哦',0,'这是第59篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(160,'test','哦哦对是哦',0,'这是第60篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(161,'test','哦哦对是哦',0,'这是第61篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(162,'test','哦哦对是哦',0,'这是第62篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(163,'test','哦哦对是哦',0,'这是第63篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(164,'test','哦哦对是哦',0,'这是第64篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(165,'test','哦哦对是哦',0,'这是第65篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(166,'test','哦哦对是哦',0,'这是第66篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(167,'test','哦哦对是哦',0,'这是第67篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(168,'test','哦哦对是哦',0,'这是第68篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(169,'test','哦哦对是哦',0,'这是第69篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(170,'test','哦哦对是哦',0,'这是第70篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(171,'test','哦哦对是哦',0,'这是第71篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(172,'test','哦哦对是哦',0,'这是第72篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(173,'test','哦哦对是哦',0,'这是第73篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(174,'test','哦哦对是哦',0,'这是第74篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(175,'test','哦哦对是哦',0,'这是第75篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(176,'test','哦哦对是哦',0,'这是第76篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(177,'test','哦哦对是哦',0,'这是第77篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(178,'test','哦哦对是哦',0,'这是第78篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(179,'test','哦哦对是哦',0,'这是第79篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(180,'test','哦哦对是哦',0,'这是第80篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(181,'test','哦哦对是哦',0,'这是第81篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(182,'test','哦哦对是哦',0,'这是第82篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(183,'test','哦哦对是哦',0,'这是第83篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(184,'test','哦哦对是哦',0,'这是第84篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(185,'test','哦哦对是哦',0,'这是第85篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(186,'test','哦哦对是哦',0,'这是第86篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(187,'test','哦哦对是哦',0,'这是第87篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(188,'test','哦哦对是哦',0,'这是第88篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(189,'test','哦哦对是哦',0,'这是第89篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(190,'test','哦哦对是哦',0,'这是第90篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(191,'test','哦哦对是哦',0,'这是第91篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(192,'test','哦哦对是哦',0,'这是第92篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(193,'test','哦哦对是哦',0,'这是第93篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(194,'test','哦哦对是哦',0,'这是第94篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(195,'test','哦哦对是哦',0,'这是第95篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(196,'test','哦哦对是哦',0,'这是第96篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(197,'test','哦哦对是哦',0,'这是第97篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(198,'test','哦哦对是哦',0,'这是第98篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(199,'test','哦哦对是哦',0,'这是第99篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(200,'test','哦哦对是哦',0,'这是第100篇文章','2019-04-14 13:13:17','2019-04-14 13:13:21',1,1,0,NULL,0,0),(201,'插入时间','怎得是 士大夫',0,NULL,'2019-04-20 15:38:05','2019-04-20 15:37:56',1,0,0,NULL,0,0),(202,'可以的','士大夫士大夫啊',0,NULL,'2019-04-20 15:43:39','2019-04-20 15:39:14',1,0,0,0,0,0),(204,'已发布','是不是已发布',0,'有描述',NULL,NULL,9,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` VALUES (1,110,2),(4,204,2);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
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
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pid` int(22) NOT NULL,
  `status` int(10) unsigned DEFAULT '0',
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
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Linux',NULL,NULL,NULL,NULL),(2,'Java',NULL,NULL,NULL,NULL),(3,'Spring',NULL,NULL,NULL,NULL),(4,'Spring Boot',NULL,NULL,NULL,NULL),(5,'并发',NULL,NULL,NULL,NULL),(6,'怎么说','阿斯蒂芬',NULL,NULL,NULL);
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
  `pid` int(22) unsigned NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'前端技术','没啥描述',0,'2019-04-23 03:24:50',NULL,10),(2,'后端技术',NULL,0,'2019-04-23 03:24:50',NULL,20),(3,'服务器',NULL,0,'2019-04-23 03:24:50',NULL,30),(4,'CSS',NULL,1,NULL,NULL,NULL),(5,'JS',NULL,1,NULL,NULL,NULL),(6,'VUE',NULL,1,NULL,NULL,NULL),(7,'Spring Boot',NULL,2,NULL,NULL,NULL),(8,'Java',NULL,2,NULL,NULL,NULL),(9,'并发',NULL,2,NULL,NULL,NULL),(10,'Linux',NULL,3,NULL,NULL,NULL),(11,'Shell',NULL,3,NULL,NULL,NULL),(12,'岁的法国',NULL,1,'2019-04-18 02:40:09','2019-04-18 02:40:09',NULL),(17,'首页',NULL,0,'2019-04-23 03:23:01','2019-04-23 03:23:01',0);
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

-- Dump completed on 2019-04-23 18:31:25
