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
-- Table structure for table `edd_pointers`
--

DROP TABLE IF EXISTS `edd_pointers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edd_pointers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SourceTableName` varchar(255) NOT NULL,
  `TargetTableName` varchar(255) NOT NULL,
  `Pointer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edd_relations`
--

DROP TABLE IF EXISTS `edd_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edd_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gather_projects_ids` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gather_projects_ids` (`gather_projects_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=930750 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edd_relations_17`
--

DROP TABLE IF EXISTS `edd_relations_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edd_relations_17` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gather_projects_ids` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gather_projects_ids` (`gather_projects_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=931783 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gather_projects`
--

DROP TABLE IF EXISTS `gather_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gather_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` mediumtext,
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
) ENGINE=InnoDB AUTO_INCREMENT=7735812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1058795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gather_projects_withsynonyms`
--

DROP TABLE IF EXISTS `gather_projects_withsynonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gather_projects_withsynonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` varchar(2000) DEFAULT '',
  `url` text,
  `url_md5` varchar(255) DEFAULT NULL,
  `description` text,
  `language` varchar(255) DEFAULT NULL,
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
  `filtration` int(11) DEFAULT NULL,
  `update_mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_open_source_projects_on_ossean_score` (`composite_score`) USING BTREE,
  KEY `index_open_source_projects_on_name` (`name`) USING BTREE,
  KEY `index_open_source_projects_on_relative_memos_num` (`relative_memos_num`) USING BTREE,
  KEY `index_open_source_projects_on_composite_score` (`composite_score`) USING BTREE,
  KEY `index_open_source_projects_on_source` (`source`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1135052 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `highcharts`
--

DROP TABLE IF EXISTS `highcharts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highcharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `match_time` datetime DEFAULT NULL,
  `min_salary` int(11) DEFAULT NULL,
  `max_salary` int(11) DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `distinct_experience` (`osp_id`,`experience`) USING BTREE,
  KEY `cal_min_by_experience` (`osp_id`,`experience`,`min_salary`) USING BTREE,
  KEY `cal_max_by_experience` (`osp_id`,`experience`,`max_salary`) USING BTREE,
  KEY `distinct_city` (`city`,`osp_id`) USING BTREE,
  KEY `cal_min_by_city` (`osp_id`,`city`,`min_salary`) USING BTREE,
  KEY `cal_max_by_city` (`osp_id`,`city`,`max_salary`) USING BTREE,
  KEY `find_experience_by_city` (`city`,`experience`) USING BTREE,
  KEY `cal_min_by_city_experience` (`experience`,`city`,`min_salary`) USING BTREE,
  KEY `cal_max_by_city_experience` (`experience`,`city`,`max_salary`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hot_words`
--

DROP TABLE IF EXISTS `hot_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hot_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `weight` float DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_hot_words_on_osp_id` (`osp_id`) USING BTREE,
  KEY `osp_id_and_hotword_name` (`osp_id`,`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_requirements`
--

DROP TABLE IF EXISTS `job_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext,
  `created_time` datetime DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `url_md5` varchar(34) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `author_url` varchar(150) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `view_num` int(11) unsigned DEFAULT NULL,
  `review_num` int(11) unsigned DEFAULT NULL,
  `extracted_time` datetime NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `similar_position` varchar(2000) DEFAULT NULL,
  `work_place` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `scale` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `finance` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6389147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memo_taggings`
--

DROP TABLE IF EXISTS `memo_taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memo_taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `disagree_num` int(11) DEFAULT '0',
  `tag_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_taggings_on_tag_id_and_taggable_id_and_taggable_type` (`tag_id`,`taggable_id`,`taggable_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43773854 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_osp_zyr`
--

DROP TABLE IF EXISTS `new_osp_zyr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_osp_zyr` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tags` varchar(2000) CHARACTER SET utf8 DEFAULT '',
  `url` text CHARACTER SET utf8,
  `url_md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tags_for_search` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `synonyms` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `license` text CHARACTER SET utf8,
  `view_num_ossean` int(11) DEFAULT '0',
  `homepage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `extracted_time` datetime DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `composite_score` double DEFAULT '0',
  `relative_memos_num` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `filtration` int(11) DEFAULT NULL,
  `update_mark` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_source_project_popularities`
--

DROP TABLE IF EXISTS `open_source_project_popularities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_project_popularities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) DEFAULT NULL,
  `year_col` int(11) DEFAULT '0',
  `month_col` int(11) DEFAULT '0',
  `popularity` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osp_pop_index` (`osp_id`,`year_col`,`month_col`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_source_projects`
--

DROP TABLE IF EXISTS `open_source_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_projects` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7735812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1135075 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_source_projects_tmp`
--

DROP TABLE IF EXISTS `open_source_projects_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_projects_tmp` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1019499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osp_with_synonyms`
--

DROP TABLE IF EXISTS `osp_with_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osp_with_synonyms` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `url` text CHARACTER SET utf8,
  `synonyms` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ossean_monitors`
--

DROP TABLE IF EXISTS `ossean_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ossean_monitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `crawler_charge` varchar(255) DEFAULT NULL,
  `day_crawler` decimal(10,0) DEFAULT NULL,
  `week_crawler` decimal(10,0) DEFAULT NULL,
  `month_crawler` decimal(10,0) DEFAULT NULL,
  `crawler_sum` decimal(10,0) DEFAULT NULL,
  `extractor_charge` varchar(255) DEFAULT NULL,
  `day_extractor` decimal(10,0) DEFAULT NULL,
  `week_extractor` decimal(10,0) DEFAULT NULL,
  `month_extractor` decimal(10,0) DEFAULT NULL,
  `extract_rate` varchar(50) DEFAULT NULL,
  `flow_num` varchar(255) DEFAULT NULL,
  `flow_rate` decimal(10,3) DEFAULT '0.000',
  `match_num` decimal(10,0) DEFAULT NULL,
  `new_memos` decimal(10,0) DEFAULT NULL,
  `week_new_memos` decimal(10,0) DEFAULT NULL,
  `month_new_memos` decimal(10,0) DEFAULT NULL,
  `total_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pointers`
--

DROP TABLE IF EXISTS `pointers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointers` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SourceTableName` varchar(255) DEFAULT NULL,
  `TargetTableName` varchar(255) DEFAULT NULL,
  `Pointer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relation_recommends`
--

DROP TABLE IF EXISTS `relation_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_recommends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) DEFAULT NULL,
  `relative_osp_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `replies_num` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `vote_up_num` int(11) DEFAULT NULL,
  `collection_num` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composite_id_by_ospId_relativeMemoId` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `match_weight_sort` (`match_weight`) USING BTREE,
  KEY `find_by_osp_id` (`osp_id`) USING BTREE,
  KEY `osp_id_weight_query` (`osp_id`,`match_weight`) USING BTREE,
  KEY `relative_memo_to_osp_osp_id_created` (`osp_id`,`created_time`) USING BTREE,
  KEY `relative_memo_to_osp_osp_id_replies_num` (`osp_id`,`replies_num`) USING BTREE,
  KEY `check_if_synchronized` (`has_synchronized`) USING BTREE,
  KEY `index_relative_memo_to_open_source_projects_on_relative_memo_id` (`relative_memo_id`) USING BTREE,
  KEY `relative_memo_to_osp_osp_id_view_num_crawled` (`osp_id`,`view_num_crawled`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_1`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_1` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1373449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_10`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_10` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=263244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_11`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_11` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_11` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164752 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_12`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_12` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_12` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23254 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_13`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_13` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_13` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142751 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_14`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_14` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_14` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28563 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_15`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_15` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_15` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159357 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_16`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_16` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_16` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_17`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_17` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_17` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154495 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_18`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_18` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_18` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_19`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_19` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_19` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_2`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_2` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=755840 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_20`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_20` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_20` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_20` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43738 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_21`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_21` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_21` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_22`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_22` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_22` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155052 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_23`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_23` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_23` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_23` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_24`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_24` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_24` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_24` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=185869 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_25`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_25` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_25` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_25` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36949 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_26`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_26` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_26` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_26` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_27`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_27` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_27` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_27` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78232 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_28`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_28` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_28` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143286 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_29`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_29` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_29` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_29` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_3`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_3` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=413363 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_30`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_30` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_30` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_30` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_31`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_31` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_31` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_31` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_32`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_32` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_32` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_32` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_33`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_33` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_33` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_33` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135720 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_34`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_34` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_34` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_34` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_35`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_35` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_35` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_35` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_36`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_36` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_36` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15986 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_37`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_37` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_37` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_37` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65672 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_38`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_38`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_38` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_38` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_38` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2840 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_39`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_39`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_39` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_39` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_39` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11078 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_4`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_4` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=393511 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_40`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_40` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_40` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_40` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11583 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_41`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_41`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_41` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_41` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_41` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_42`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_42`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_42` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_42` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_42` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4600 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_43`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_43`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_43` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_43` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_43` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_44`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_44` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_44` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_44` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8656 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_45`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_45`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_45` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_45` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_45` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1086 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_46`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_46` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_46` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_46` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111490 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_47`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_47`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_47` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_47` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_47` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1823 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_48`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_48`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_48` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_48` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_48` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20950 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_49`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_49`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_49` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_49` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_49` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1554 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_5`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_5` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=439414 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_50`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_50` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_50` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_50` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40548 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_51`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_51` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_51` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_51` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2768 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_52`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_52` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_52` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_52` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_53`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_53` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_53` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_53` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_54`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_54` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_54` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_54` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_55`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_55` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_55` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_55` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_56`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_56`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_56` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_56` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_56` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_57`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_57` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_57` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_57` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_58`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_58` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_58` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_58` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_59`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_59` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_59` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_59` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_6`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_6` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210297 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_60`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_60` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_60` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_60` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_61`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_61` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_61` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_61` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_62`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_62` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_62` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_62` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_63`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_63`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_63` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_63` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_63` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_64`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_64`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_64` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_64` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_64` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_65`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_65`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_65` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_65` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_65` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_66`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_66`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_66` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_66` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_66` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_67`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_67`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_67` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_67` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_67` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_68`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_68` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_68` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_68` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_69`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_69` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_69` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_69` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_7`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_7` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=376439 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_70`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_70`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_70` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index_70` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_70` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8410826 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_8`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_8` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=477630 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memo_to_open_source_projects_9`
--

DROP TABLE IF EXISTS `relative_memo_to_open_source_projects_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memo_to_open_source_projects_9` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_memo_id` int(11) NOT NULL,
  `match_weight` float DEFAULT '0',
  `replies_num` int(11) DEFAULT NULL,
  `view_num_crawled` int(11) DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `view_num_trustie` int(11) DEFAULT NULL,
  `has_synchronized` tinyint(1) DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `match_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `osp_id_relative_memo_id_unique_index` (`osp_id`,`relative_memo_id`) USING BTREE,
  KEY `relative_memo_id_index` (`relative_memo_id`) USING BTREE,
  KEY `has_synchronized_index_9` (`has_synchronized`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=410278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memos`
--

DROP TABLE IF EXISTS `relative_memos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `tags` varchar(2000) DEFAULT '',
  `source` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `url_md5` varchar(36) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `author_url` varchar(255) DEFAULT NULL,
  `view_num` int(11) DEFAULT '0',
  `review_num` int(11) DEFAULT '0',
  `view_num_ossean` int(11) DEFAULT '0',
  `extracted_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relative_memos_on_url_md5` (`url_md5`) USING BTREE,
  UNIQUE KEY `unique_urlmd5` (`url_md5`),
  KEY `search_memo_type` (`memo_type`) USING BTREE,
  KEY `index_relative_memos_on_url` (`url`) USING BTREE,
  KEY `index_relative_memos_on_source` (`source`) USING BTREE,
  KEY `created_time_index` (`created_time`),
  KEY `type_created_time_index` (`memo_type`,`created_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6884623 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relative_memos_tmp`
--

DROP TABLE IF EXISTS `relative_memos_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_memos_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `memo_type` varchar(255) DEFAULT NULL,
  `tags` varchar(2000) DEFAULT '',
  `source` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `url_md5` varchar(36) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `author_url` varchar(255) DEFAULT NULL,
  `view_num` int(11) DEFAULT '0',
  `review_num` int(11) DEFAULT '0',
  `view_num_ossean` int(11) DEFAULT '0',
  `extracted_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relative_memos_on_url_md5` (`url_md5`) USING BTREE,
  UNIQUE KEY `unique_urlmd5` (`url_md5`),
  KEY `search_memo_type` (`memo_type`) USING BTREE,
  KEY `index_relative_memos_on_url` (`url`) USING BTREE,
  KEY `index_relative_memos_on_source` (`source`) USING BTREE,
  KEY `created_time_index` (`created_time`),
  KEY `type_created_time_index` (`memo_type`,`created_time`)
) ENGINE=InnoDB AUTO_INCREMENT=703001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simility_recommend_up_downs`
--

DROP TABLE IF EXISTS `simility_recommend_up_downs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simility_recommend_up_downs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) NOT NULL,
  `relative_osp_id` int(11) NOT NULL,
  `up_down_value` int(11) DEFAULT '0',
  `last_up_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `osp_id` (`osp_id`,`up_down_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simility_recommends`
--

DROP TABLE IF EXISTS `simility_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simility_recommends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `osp_id` int(11) DEFAULT NULL,
  `relative_osp_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solr_incremental_index_cursors`
--

DROP TABLE IF EXISTS `solr_incremental_index_cursors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solr_incremental_index_cursors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cursor` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonymmings`
--

DROP TABLE IF EXISTS `synonymmings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonymmings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `synonym_id` int(11) DEFAULT NULL,
  `synonymming_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `synonym_id` (`synonym_id`,`synonymming_id`) USING BTREE,
  KEY `synonymming_id` (`synonymming_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2107426 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonymmings_2017`
--

DROP TABLE IF EXISTS `synonymmings_2017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonymmings_2017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prjId` int(11) DEFAULT NULL,
  `synonyms` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_prjId_name` (`prjId`,`synonyms`) USING BTREE,
  KEY `synonym_id` (`prjId`) USING BTREE,
  KEY `index_name` (`synonyms`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1119072 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonymmings_backup`
--

DROP TABLE IF EXISTS `synonymmings_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonymmings_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prjId` int(11) DEFAULT NULL,
  `synonyms` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_prjId_name` (`prjId`,`synonyms`) USING BTREE,
  KEY `synonym_id` (`prjId`) USING BTREE,
  KEY `index_name` (`synonyms`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1136348 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1299998 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `disagree_num` int(11) DEFAULT '0',
  `tag_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_taggings_on_tag_id_and_taggable_id_and_taggable_type` (`tag_id`,`taggable_id`,`taggable_type`) USING BTREE,
  KEY `taggab_id_type_context_index` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=3557203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name_index` (`name`) USING BTREE,
  KEY `index_tags_on_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7678223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`) USING BTREE,
  KEY `index_versions_on_sharing` (`sharing`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22 16:07:22
