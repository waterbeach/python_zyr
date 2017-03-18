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
-- Table structure for table `gather_projects_tmp`
--

DROP TABLE IF EXISTS `gather_projects_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gather_projects_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` varchar(2000) DEFAULT NULL,
  `url` text,
  `url_md5` varchar(255) DEFAULT NULL,
  `description` text,
  `language` varchar(1000) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `tags_for_search` varchar(2000) DEFAULT NULL,
  `synonyms` varchar(255) DEFAULT NULL,
  `license` text,
  `view_num_ossean` int(11) DEFAULT '0',
  `homepage` varchar(255) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `extracted_time` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `composite_score` double DEFAULT '0',
  `relative_memos_num` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `filtration` int(11) DEFAULT '0',
  `update_mark` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_urlmd5` (`url_md5`),
  KEY `homepage_index` (`homepage`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1116838 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gather_projects_tmp`
--

LOCK TABLES `gather_projects_tmp` WRITE;
/*!40000 ALTER TABLE `gather_projects_tmp` DISABLE KEYS */;
INSERT INTO `gather_projects_tmp` VALUES (33,'Apache Hadoop',NULL,'http://projects.apache.org/projects/hadoop.html','606e69c634190fe1a2709471125542a8','Hadoop is a distributed computing platform. This includes the Hadoop Distributed Filesystem (HDFS) and an implementation of MapReduce.','Java','apache',NULL,NULL,'Apache License Version 2.0',0,NULL,'2016-10-25 15:17:28','2016-01-26 13:41:10',NULL,0,NULL,NULL,0,2),(139,'Apache Maven',NULL,'http://projects.apache.org/projects/maven.html','bd2850e5a75812e171fab22dc5efeb5a','Maven is a project development management and comprehension tool. Based on the concept of a project object model: builds, dependency management, documentation creation, site publication, and distribution publication are all controlled from the declarative file. Maven can be extended by plugins to utilise a number of other development tools for reporting or the build process.','Java','apache',NULL,NULL,'http://www.apache.org/licenses/LICENSE-2.0.txt',0,NULL,'2016-10-25 15:17:28','2016-01-26 13:41:10',NULL,0,NULL,'2014-02-21 00:00:00',0,2),(2301,'Apache Hadoop','<apache>,<hadoop>,<java>,<distributed>,<clustering>,<mapreduce>,<grid>','https://www.openhub.net/p/Hadoop','42f25af5af2942abf90efc5426aabee1','Hadoop is a framework for running applications on large clusters of commodity hardware. The Hadoop framework transparently provides applications both reliability and data motion. Hadoop implements a computational paradigm named map/reduce, where the application is divided into many small fragments of work, each of which may be executed or reexecuted on any node in the cluster. In addition, it provides a distributed file system that stores data on the compute nodes, providing very high aggregate bandwidth across the cluster. Both map/reduce and the distributed file system are designed so that node failures are automatically handled by the framework.','Java|:|61%|,|XML|:|32%|,|11 Other|:|7%','openhub',NULL,NULL,'',0,'http://hadoop.apache.org/core/','2017-03-06 13:13:47','2017-02-21 10:53:02',NULL,0,NULL,'2009-05-01 00:00:00',0,2),(6698,'Apache Hadoop','<Clustering><Distributed Computing><Filesystems>','http://sourceforge.net/projects/hadoop.mirror/?source=directory','17cb23b7ecb75e8370a236c243bfc9e0','The Apache Hadoop software library is a framework that allows for the distributed processing of large data sets across clusters of computers using simple programming models. It is designed to scale up from single servers to thousands of machines, each offering local computation and storage. Rather than rely on hardware to deliver high-availability, the library itself is designed to detect and handle failures at the application layer, so delivering a highly-available service on top of a cluster of computers, each of which may be prone to failures. The project includes these modules: Hadoop Common: The common utilities that support the other Hadoop modules. Hadoop Distributed File System (HDFS™): A distributed file system that provides high-throughput access to application data. Hadoop YARN: A framework for job scheduling and cluster resource management. Hadoop MapReduce: A YARN-based system for parallel processing of large data sets. Apache Hadoop Web Site','','sourceforge',NULL,NULL,'Apache License V2.0',0,'http://hadoop.apache.org/','2016-10-30 12:47:13','2016-03-28 01:28:57',NULL,0,NULL,'2013-05-03 00:00:00',0,2),(29178,'Maven','<Software Development>','http://www.freecode.com/projects/maven','1b40b020dda7bea8bd4a189b6b7c91bc','Maven is a Java project management and project comprehension tool. Maven is based on the concept of a project object model (POM) in that all the artifacts produced by Maven are a result of consulting a well defined model for your project. Builds, documentation, source metrics, and source cross-references are all controlled by your POM.',NULL,'freecode',NULL,NULL,'<Apache>',0,'http://www.freecode.com/urls/9751a8d5e674b57685692e32b7b0e44c','2016-10-25 20:48:10','2016-01-26 13:42:16',NULL,0,NULL,'2001-03-21 22:28:00',0,2),(80032,'MAVEN','<Bio-Informatics><Molecular Science><Simulations>','http://sourceforge.net/projects/maven/?source=directory','b4fcbad73d016fa31553d7b294a0cb72','Elastic network models (ENMs) have been shown to generate the dominant functional equilibrium motions of biomolecules quickly and efficiently. MAVEN simplifies ENM generation, allows for diverse models to be used, and facilitates useful analyses. MAVEN Web Site','C++, MATLAB, Perl','sourceforge',NULL,NULL,'GNU Library or Lesser General Public License version 2.0 (LGPLv2)',0,'http://maven.sourceforge.net','2016-10-27 18:22:44','2016-03-27 23:12:01',NULL,0,NULL,'2011-02-12 00:00:00',0,2),(770681,'Hadoop','<大数据>','http://www.oschina.net/p/hadoop','75cb37edf19acd69ceab809fb177cc5d','   Hadoop 是一个分布式系统基础架构，由Apache基金会开发。用户可以在不了解分布式底层细节的情况下，开发分布式程序。充分利用集群的威力高速运算和存储。Hadoop实现了一个分布式文件系统（Hadoop Distributed File System），简称HDFS。HDFS有着高容错性的特点，并且设计用来部署在低廉的（low-cost）硬件上。而且它提供高传输率（high throughput）来访问应用程序的数据，适合那些有着超大数据集（large data set）的应用程序。HDFS放宽了（relax）POSIX的要求（requirements）这样可以流的形式访问（streaming access）文件系统中的数据。 下图是Hadoop的体系结构：','<Java>','oschina',NULL,NULL,'Apache',0,'http://hadoop.apache.org/','2016-10-26 14:23:14','2016-03-30 21:26:54',NULL,0,NULL,'2008-09-14 00:00:00',0,2),(770742,'Maven','<项目构建>','http://www.oschina.net/p/maven','a12254ecb1e74a13913938558ad686e9','   开源中国的 Maven 库 http://maven.oschina.net （使用指南） 目前，绝大多数开发人员都把 Ant 当作 Java 编程项目的标准构建工具。遗憾的是，Ant 的项目管理工具（作为make的替代工具）不能满足绝大多数开发人员的需要。通过检查 Ant 构建文件，很难发现项目的相关性信息和其它元信息（如开发人员／拥有者、版本或站点主页）。 Maven 除了以程序构建能力为特色之外，还提供 Ant 所缺少的高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目，而使用 Ant 则需要十几行。事实上，由于 Maven 的面向项目的方法，许多 Apache Jakarta 项目现在使用 Maven，而且公司项目采用 Maven 的比例在持续增长。 Maven vs Ant 那么，Maven 和 Ant 有什么不同呢？在回答这个问题以前，我要强调一点：Maven 和 Ant 针对构建问题的两个不同方面。Ant 为 Java 技术开发项目提供跨平台构建任务。Maven 本身描述项目的高级方面，它从 Ant 借用了绝大多数构建任务。因此，由于 Maven 和 Ant 代表两个差异很大的工具，所以我将只说明这两个工具的等同组件之间的区别，如表 1 所示。 表 1. Maven vs Ant   Maven Ant 标准构建文件 project.xml 和 maven.xml build.xml 特性处理顺序 ${maven.home}/bin/driver.properties ${project.home}/project.properties ${project.home}/build.properties ${user.home}/build.properties 通过 -D 命令行选项定义的系统特性 最后一个定义起决定作用。 通过 -D 命令行选项定义的系统特性 由 任务装入的特性 第一个定义最先被处理。 构建规则 构建规则更为动态（类似于编程语言）；它们是基于 Jelly 的可执行 XML。 构建规则或多或少是静态的，除非使用 相关开发环境下的Maven插件：http://mevenide.codehaus.org/','<Java>','oschina',NULL,NULL,'Apache',0,'http://maven.apache.org/','2016-10-26 14:36:32','2016-03-30 21:27:06',NULL,0,NULL,'2008-09-07 00:00:00',0,2),(988140,'hadoop','','http://sourceforge.net/projects/cohadoop/?source=directory','f312c0c5a0687deffcc6a1e6b283a6c3','No description hadoop Web Site','','sourceforge',NULL,NULL,'',0,'http://sourceforge.net/projects/cohadoop','2016-10-30 11:41:46','2016-03-27 23:36:59',NULL,0,NULL,'2014-05-19 00:00:00',0,2),(1076857,'Hadoop','','http://sourceforge.net/projects/hadoopwithwspgrade/?source=directory','312830c8ef5495e5347e937a663f3648','This project provides with an application to integrate Hadoop with WS-PGRADE workflows. It uses Openstack cloud to create user specified Hadoop clusters and execute jobs. Hadoop Web Site','','sourceforge',NULL,NULL,'',0,'http://hadoop.sourceforge.net','2016-10-30 12:08:27','2016-03-28 00:17:09',NULL,0,NULL,'2014-09-08 00:00:00',0,2),(1116837,'MAVEN','','http://sourceforge.net/projects/rdprattmaven/?source=directory','46e9c97c2fd5adc63eb1c173f99f9800','MAVEN and it\'s relevant IDL programs MAVEN Web Site','','sourceforge',NULL,NULL,'',0,'http://rdprattmaven.sourceforge.net','2016-10-30 12:30:28','2016-03-28 00:50:46',NULL,0,NULL,'2011-06-10 00:00:00',0,2);
/*!40000 ALTER TABLE `gather_projects_tmp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-18 21:14:48
