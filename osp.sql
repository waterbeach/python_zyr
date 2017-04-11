-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: ossean_production
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `open_source_projects_backup`
--

DROP TABLE IF EXISTS `open_source_projects_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_projects_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` mediumtext,
  `url` text,
  `url_md5` text,
  `description` text,
  `language` varchar(1000) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `tags_for_search` varchar(2000) DEFAULT NULL,
  `synonyms` text,
  `license` text,
  `view_num_ossean` int(11) DEFAULT '0',
  `homepage` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `extracted_time` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `composite_score` double DEFAULT '0',
  `relative_memos_num` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `update_mark` int(11) DEFAULT NULL,
  `filtration` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_open_source_projects_on_name` (`name`) USING BTREE,
  KEY `index_open_source_projects_on_relative_memos_num` (`relative_memos_num`) USING BTREE,
  KEY `index_open_source_projects_on_composite_score` (`composite_score`) USING BTREE,
  KEY `index_open_source_projects_on_source` (`source`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=770645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_source_projects_backup`
--

LOCK TABLES `open_source_projects_backup` WRITE;
/*!40000 ALTER TABLE `open_source_projects_backup` DISABLE KEYS */;
INSERT INTO `open_source_projects_backup` VALUES (770644,'Android','<操作系统>','oschina|:|http://www.oschina.net/p/android-os|,|sourceforge|:|http://sourceforge.net/projects/pruebasandroid/?source=directory','oschina|:|b93f0c461d1897718ddae61dae494f1e|,|sourceforge|:|3e2dedb1e60eb0ea9667584b89595891','oschina|:|开放手机联盟（一个由 30 多家科技公司和手机公司组成的团体）已开发出 Android，Android 是第一个完整、开放、免费的手机平台。|,|sourceforge|:|Repositorio para pruebas en android Android Web Site','<C/C++>','oschina,sourceforge',NULL,NULL,'Apache Licene 2.0',0,'http://source.android.com/','2016-10-26 12:44:53','2016-03-30 21:23:43',NULL,881926.98,46449,'2009-06-24 00:00:00',NULL,2);
/*!40000 ALTER TABLE `open_source_projects_backup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-11  9:51:13
