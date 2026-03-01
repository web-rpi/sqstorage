/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for Linux (aarch64)
--
-- Host: db    Database: sqstorage
-- ------------------------------------------------------
-- Server version	11.4.10-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customFields`
--

DROP TABLE IF EXISTS `customFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customFields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `dataType` int(10) unsigned NOT NULL,
  `default` varchar(64) DEFAULT NULL,
  `defaultVisible` tinyint(1) NOT NULL DEFAULT 0,
  `visibleIn` varchar(1024) DEFAULT NULL,
  `fieldValues` varchar(1280) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customFields`
--

LOCK TABLES `customFields` WRITE;
/*!40000 ALTER TABLE `customFields` DISABLE KEYS */;
/*!40000 ALTER TABLE `customFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_rev`
--

DROP TABLE IF EXISTS `database_rev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_rev` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbrev` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbr` (`dbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_rev`
--

LOCK TABLES `database_rev` WRITE;
/*!40000 ALTER TABLE `database_rev` DISABLE KEYS */;
INSERT INTO `database_rev` VALUES
(1,10);
/*!40000 ALTER TABLE `database_rev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldData`
--

DROP TABLE IF EXISTS `fieldData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldData` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fieldId` bigint(20) unsigned NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `intNeg` bigint(20) DEFAULT NULL,
  `intPos` bigint(20) unsigned DEFAULT NULL,
  `intNegPos` bigint(20) DEFAULT NULL,
  `floatNeg` double DEFAULT NULL,
  `floatPos` double unsigned DEFAULT NULL,
  `string` varchar(256) DEFAULT NULL,
  `selection` varchar(1280) DEFAULT NULL,
  `mselection` varchar(1280) DEFAULT NULL,
  `qrcode` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldData`
--

LOCK TABLES `fieldData` WRITE;
/*!40000 ALTER TABLE `fieldData` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headCategories`
--

DROP TABLE IF EXISTS `headCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `headCategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  `amount` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headCategories`
--

LOCK TABLES `headCategories` WRITE;
/*!40000 ALTER TABLE `headCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `headCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemId` bigint(20) unsigned NOT NULL,
  `sizeX` int(11) NOT NULL,
  `sizeY` int(11) NOT NULL,
  `thumb` mediumblob NOT NULL,
  `imageData` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `comment` tinytext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `serialnumber` varchar(64) DEFAULT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  `headcategory` bigint(20) unsigned NOT NULL,
  `subcategories` text DEFAULT NULL,
  `storageid` bigint(20) unsigned DEFAULT NULL,
  `coverimage` bigint(20) unsigned DEFAULT NULL,
  `checkedin` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `jsondoc` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'mail','{}'),
(2,'updater','{\"githubuser\":\"jrie\",\"githubrepo\":\"sqstorage\",\"githubbranch\":\"main\"}');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subCategories`
--

DROP TABLE IF EXISTS `subCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subCategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  `headcategory` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory` (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subCategories`
--

LOCK TABLES `subCategories` WRITE;
/*!40000 ALTER TABLE `subCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `subCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
INSERT INTO `usergroups` VALUES
(1,'Administrator','2022-05-29 12:53:44'),
(2,'Gast','2022-05-29 12:53:44'),
(3,'Benutzer','2022-05-29 12:53:44');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `mailaddress` varchar(254) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_access` int(1) NOT NULL DEFAULT 1,
  `failcount` int(11) NOT NULL DEFAULT 0,
  `lastfail` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'test','test@test.de','$2y$10$jnlP.cVbjzue0VjNFNZr6eJiPNqqYUZx2TyrFP9DOGX5dJIHKs5GW',1,0,0,'2026-03-01 15:16:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL,
  `usergroupid` bigint(20) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES
(1,1,1,'2026-03-01 15:16:05');
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tokens`
--

DROP TABLE IF EXISTS `users_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tokens`
--

LOCK TABLES `users_tokens` WRITE;
/*!40000 ALTER TABLE `users_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sqstorage'
--

--
-- Dumping routines for database 'sqstorage'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-01 16:17:31
