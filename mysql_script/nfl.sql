CREATE DATABASE  IF NOT EXISTS `nfl_pools` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nfl_pools`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: nfl_pools
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20211012050706_AddNew','5.0.10'),('20211012054330_lafff','5.0.10'),('20211012171534_addroles','5.0.10');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
INSERT INTO `AspNetRoles` VALUES ('3826fd2b-4536-49b8-a378-f97b76d54e71','Admin','ADMIN','50db14cc-90cf-4e5c-8834-288fb798fe57'),('c71e5ce5-d6d0-4024-b670-889256c8e4a9','User','USER','1160395a-f216-4b40-9527-a4dfa104a268');
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
INSERT INTO `AspNetUserClaims` VALUES (1,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name','rgft@gmail.com'),(2,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.microsoft.com/ws/2008/06/identity/claims/role','User'),(3,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name','rgft@gmail.com'),(4,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.microsoft.com/ws/2008/06/identity/claims/role','User'),(5,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name','rgft@gmail.com'),(6,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','http://schemas.microsoft.com/ws/2008/06/identity/claims/role','User');
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
INSERT INTO `AspNetUserRoles` VALUES ('3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4','c71e5ce5-d6d0-4024-b670-889256c8e4a9');
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','rgft@gmail.com','RGFT@GMAIL.COM','rgft@gmail.com','RGFT@GMAIL.COM',1,'AQAAAAEAACcQAAAAEPPOGCjYkw0qjBumlNrz8W2lII1q2TA/PEw+/bCdVRYx+Jn7mDbKESFr9nPPoZhFPg==','KRP7Q4UKPDZBBQCURHZMFDWDKTIEXASU','b739eaf6-c3f7-47fe-9080-bb46dd1f2486',NULL,0,0,NULL,1,0,'adrian de la o hernandez'),('c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4','gorda@gmail.com','GORDA@GMAIL.COM','gorda@gmail.com','GORDA@GMAIL.COM',1,'AQAAAAEAACcQAAAAEAjzVWfSp5ro7cpGuAXepnenbz4WDS1GZfUJjJ/kRFOcbqCWiVdfU04JenpGYSMwXg==','PPUG7IG7U33YGRYGB6FZMCZ3MBEYOBDV','c0a3e9b3-b4c5-4845-afe4-7fcaead9a78f',NULL,0,0,NULL,1,0,'patricia la gordita');
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conference` varchar(75) DEFAULT NULL,
  `conference_short` varchar(25) DEFAULT NULL,
  `alias` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (1,'NATIONAL FOOTBALL CONFERENCE','NATIONAL','NFC'),(2,'AMERICAN FOOTBALL CONFERENCE','AMERICAN','AFC');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceCodes`
--

DROP TABLE IF EXISTS `DeviceCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeviceCodes` (
  `UserCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DeviceCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SubjectId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SessionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `Expiration` datetime(6) NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserCode`),
  UNIQUE KEY `IX_DeviceCodes_DeviceCode` (`DeviceCode`),
  KEY `IX_DeviceCodes_Expiration` (`Expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceCodes`
--

LOCK TABLES `DeviceCodes` WRITE;
/*!40000 ALTER TABLE `DeviceCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `divisions_name` varchar(45) DEFAULT NULL,
  `id_conference` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_conference_idx` (`id_conference`),
  CONSTRAINT `fk_conference` FOREIGN KEY (`id_conference`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'NFC WEST',1),(2,'NFC NORTH',1),(3,'NFC SOUTH',1),(4,'NFC EAST',1),(5,'AFC SOUTH',2),(6,'AFC EAST',2),(7,'AFC NORTH',2),(8,'AFC WEST',2);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forecast`
--

DROP TABLE IF EXISTS `forecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forecast` (
  `idforecast` int NOT NULL AUTO_INCREMENT,
  `idWeek` int DEFAULT NULL,
  `idUser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hits` int DEFAULT NULL,
  `tiebreaker` int DEFAULT NULL,
  PRIMARY KEY (`idforecast`),
  KEY `fk_week_idx` (`idWeek`),
  KEY `fk_user_idx` (`idUser`),
  CONSTRAINT `fk_user` FOREIGN KEY (`idUser`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_week_spool` FOREIGN KEY (`idWeek`) REFERENCES `weeks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forecast`
--

LOCK TABLES `forecast` WRITE;
/*!40000 ALTER TABLE `forecast` DISABLE KEYS */;
INSERT INTO `forecast` VALUES (1,5,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee',2,65),(3,6,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee',1,90),(4,6,'c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4',0,75);
/*!40000 ALTER TABLE `forecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forecast_detail`
--

DROP TABLE IF EXISTS `forecast_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forecast_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `forecast_id` int DEFAULT NULL COMMENT 'lla ve foranea de pronostico',
  `game` int DEFAULT NULL COMMENT 'identificador de juego',
  `win` varchar(4) DEFAULT NULL COMMENT 'id del equipo ganador',
  `set` int DEFAULT '0' COMMENT 'establece si la prediccion se completo',
  `is_correct` int DEFAULT '0' COMMENT 'define si el pronostico fue correcto',
  PRIMARY KEY (`id`),
  KEY `fk_game-_idx` (`game`),
  KEY `fk-forecast_idx` (`forecast_id`),
  KEY `fk_win_idx` (`win`),
  CONSTRAINT `fk-forecast` FOREIGN KEY (`forecast_id`) REFERENCES `forecast` (`idforecast`),
  CONSTRAINT `fk_game-` FOREIGN KEY (`game`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_win` FOREIGN KEY (`win`) REFERENCES `teams` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forecast_detail`
--

LOCK TABLES `forecast_detail` WRITE;
/*!40000 ALTER TABLE `forecast_detail` DISABLE KEYS */;
INSERT INTO `forecast_detail` VALUES (1,1,1,'LAR',1,1),(2,1,2,'KC',1,0),(3,1,3,'LV',1,0),(4,1,4,'LAC',1,1),(21,3,17,'TB',0,1),(22,3,18,'HOU',0,0),(23,3,19,'LAR',0,0),(24,3,20,'NE',0,0),(25,3,21,'CLE',0,0),(26,3,22,'DET',0,0),(27,3,23,'LV',0,0),(28,3,24,'PIT',0,0),(29,3,25,'LAC',0,0),(30,3,26,'WFT',0,0),(31,3,27,'CAR',0,0),(32,3,28,'JAC',0,0),(33,3,29,'GB',0,0),(34,3,32,'TEN',0,0),(35,4,17,'TB',0,0),(36,4,18,'HOU',0,0),(37,4,19,'LAR',0,0),(38,4,20,'DAL',0,0),(39,4,21,'CLE',0,0),(40,4,22,'DET',0,0),(41,4,23,'DEN',0,0),(42,4,24,'PIT',0,0),(43,4,25,'BAL',0,0),(44,4,26,'KC',0,0),(45,4,27,'MIN',0,0),(46,4,28,'MIA',0,0),(47,4,29,'GB',0,0),(48,4,32,'BUF',0,0);
/*!40000 ALTER TABLE `forecast_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `forecast_detail_AFTER_UPDATE` AFTER UPDATE ON `forecast_detail` FOR EACH ROW BEGIN
	call UPDATE_FORECAST(OLD.forecast_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `week_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `visitor` varchar(4) DEFAULT NULL,
  `local` varchar(4) DEFAULT NULL,
  `visitor_score` int DEFAULT NULL,
  `local_score` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `win` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_week_idx` (`week_id`),
  KEY `fk_local_idx` (`local`),
  KEY `fk_visitor_idx` (`visitor`),
  KEY `fkwin_idx` (`win`),
  CONSTRAINT `fk_local` FOREIGN KEY (`local`) REFERENCES `teams` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_visitor` FOREIGN KEY (`visitor`) REFERENCES `teams` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_week` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkwin` FOREIGN KEY (`win`) REFERENCES `teams` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,5,'2021-10-07','LAR','SEA',26,17,3,'LAR'),(2,5,'2021-10-10','BUF','KC',38,17,3,'BUF'),(3,5,'2021-10-11','CHI','LV',20,9,3,'CHI'),(4,5,'2021-10-12','CLE','LAC',42,47,3,'LAC'),(5,5,'2021-10-13','DEN','PIT',19,27,3,'PIT'),(6,5,'2021-10-14','DET','MIN',17,19,3,'MIN'),(7,5,'2021-10-15','GB','CIN',25,22,3,'GB'),(8,5,'2021-10-16','MIA','TB',17,22,3,'TB'),(9,5,'2021-10-17','NE','HOU',25,22,3,'NE'),(10,5,'2021-10-18','NO','WFT',33,22,3,'NO'),(11,5,'2021-10-19','NYG','DAL',20,44,3,'DAL'),(12,5,'2021-10-20','NYJ','ATL',20,27,3,'ATL'),(13,5,'2021-10-21','PHI','CAR',21,18,3,'PHI'),(14,5,'2021-10-22','SF','ARI',10,17,3,'ARI'),(15,5,'2021-10-23','TEN','JAC',37,19,3,'TEN'),(16,5,'2021-10-11','IND','BAL',25,31,3,'BAL'),(17,6,'2021-10-14','TB','PHI',0,0,1,NULL),(18,6,'2021-10-17','HOU','IND',0,0,1,NULL),(19,6,'2021-10-17','LAR','NYG',0,0,1,NULL),(20,6,'2021-10-17','DAL','NE',0,0,1,NULL),(21,6,'2021-10-17','ARI','CLE',0,0,1,NULL),(22,6,'2021-10-17','CIN','DET',0,0,1,NULL),(23,6,'2021-10-17','LV','DEN',0,0,1,NULL),(24,6,'2021-10-17','SEA','PIT',0,0,1,NULL),(25,6,'2021-10-17','LAC','BAL',0,0,1,NULL),(26,6,'2021-10-17','KC','WFT',0,0,1,NULL),(27,6,'2021-10-17','MIN','CAR',0,0,1,NULL),(28,6,'2021-10-17','MIA','JAC',0,0,1,NULL),(29,6,'2021-10-17','GB','CHI',0,0,1,NULL),(32,6,'2021-10-18','BUF','TEN',0,0,1,NULL),(33,7,'2021-10-21','DEN','CLE',0,0,1,NULL),(34,7,'2021-10-24','IND','SF',0,0,1,NULL),(35,7,'2021-10-24','WFT','GB',0,0,1,NULL),(36,7,'2021-10-24','CAR','NYG',0,0,1,NULL),(37,7,'2021-10-24','NYJ','NE',0,0,1,NULL),(38,7,'2021-10-24','KC','TEN',0,0,1,NULL),(39,7,'2021-10-24','DET','LAR',0,0,1,NULL),(40,7,'2021-10-24','ATL','MIA',0,0,1,NULL),(41,7,'2021-10-24','PHI','LV',0,0,1,NULL),(42,7,'2021-10-24','CIN','BAL',0,0,1,NULL),(43,7,'2021-10-24','CHI','TB',0,0,1,NULL),(44,7,'2021-10-24','HOU','ARI',0,0,1,NULL),(45,7,'2021-10-25','NO','SEA',0,0,1,NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `games_BEFORE_UPDATE` BEFORE UPDATE ON `games` FOR EACH ROW BEGIN
    IF NEW.status = 3 THEN
		IF OLD.VISITOR_SCORE > OLD.local_score THEN
			SET NEW.win = OLD.visitor;
		ELSEIF OLD.VISITOR_SCORE = OLD.local_score  THEN
			SET NEW.win = NULL;
		ELSE
			SET NEW.win = OLD.local;
		END IF;
        call UPDATE_GAMES(OLD.id, NEW.win);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PersistedGrants`
--

DROP TABLE IF EXISTS `PersistedGrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersistedGrants` (
  `Key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SubjectId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SessionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ClientId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `Expiration` datetime(6) DEFAULT NULL,
  `ConsumedTime` datetime(6) DEFAULT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Key`),
  KEY `IX_PersistedGrants_Expiration` (`Expiration`),
  KEY `IX_PersistedGrants_SubjectId_ClientId_Type` (`SubjectId`,`ClientId`,`Type`),
  KEY `IX_PersistedGrants_SubjectId_SessionId_Type` (`SubjectId`,`SessionId`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersistedGrants`
--

LOCK TABLES `PersistedGrants` WRITE;
/*!40000 ALTER TABLE `PersistedGrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersistedGrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,2021);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id_team` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `alias` varchar(4) NOT NULL,
  `division_id` int DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_team`),
  UNIQUE KEY `mote_index` (`alias`),
  UNIQUE KEY `id_team_UNIQUE` (`id_team`),
  UNIQUE KEY `last_name_UNIQUE` (`last_name`),
  KEY `fk_division_idx` (`division_id`),
  CONSTRAINT `fk_division` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Seattle Seahawks','Seahawks','SEA',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/SEA'),(2,'San Francisco 49ers','49er','SF',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/SF'),(3,'Los Angeles Rams','Rams','LAR',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LA'),(4,'Arizona Cardinals','Cardinals','ARI',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/ARI'),(5,'Green Bay Packers','Packers','GB',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/GB'),(6,'Chicago Bears','Bears','CHI',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CHI'),(7,'Minnesota Vikings',' Vikings','MIN',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/MIN'),(8,'Detroit Lions','Lions','DET',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DET'),(9,'Tampa Bay Buccaneers','Buccaneers','TB',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/TB'),(10,'Carolina Panthers','Panthers','CAR',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CAR'),(11,'New Orleans Saints','Saints','NO',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NO'),(12,'Atlanta Falcons','Falcons','ATL',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/ATL'),(13,'Dallas Cowboys','Cowboys','DAL',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DAL'),(14,'Washington Football Team','Washington','WFT',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/WAS'),(15,'Philadelphia Eagles','Eagles','PHI',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/PHI'),(16,'New York Giants','Giants','NYG',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NYG'),(17,'Tennessee Titans','Titans','TEN',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/TEN'),(18,'Houston Texans','Texans','HOU',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/HOU'),(19,'Indianapolis Colts','Colts','IND',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/IND'),(20,'Jacksonville Jaguars','Jaguars','JAC',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/JAX'),(21,'Buffalo Bills','Bills','BUF',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/BUF'),(22,'Miami Dolphins','Dolphins','MIA',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/MIA'),(23,'New England Patriots','Patriots','NE',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NE'),(24,'New York Jets','Jets','NYJ',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NYJ'),(25,'Cincinnati Bengals','Bengals','CIN',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CIN'),(26,'Baltimore Ravens','Ravens','BAL',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/BAL'),(27,'Cleveland Browns','Browns','CLE',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CLE'),(28,'Pittsburgh Steelers','Steelers','PIT',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/PIT'),(29,'Los Angeles Chargers','Chargers','LAC',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LAC'),(30,'Las Vegas Raiders','Raiders','LV',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LV'),(31,'Denver Broncos','Broncos','DEN',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DEN'),(32,'Kansas City Chiefs','Chiefs','KC',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/KC');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeks`
--

DROP TABLE IF EXISTS `weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeks` (
  `id` int NOT NULL,
  `week_number` int DEFAULT NULL,
  `week_name` varchar(45) DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `last_score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedule_idx` (`schedule_id`),
  CONSTRAINT `fk_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeks`
--

LOCK TABLES `weeks` WRITE;
/*!40000 ALTER TABLE `weeks` DISABLE KEYS */;
INSERT INTO `weeks` VALUES (1,1,'WEEK 1',1,3,60),(2,2,'WEEK 2',1,3,52),(3,3,'WEEK 3',1,3,62),(4,4,'WEEK 4',1,3,42),(5,5,'WEEK 5',1,3,56),(6,6,'WEEK 6',1,2,NULL),(7,7,'WEEK 7',1,0,NULL),(8,8,'WEEK 8',1,0,NULL),(9,9,'WEEK 9',1,0,NULL),(10,10,'WEEK 10',1,0,NULL),(11,11,'WEEK 11',1,0,NULL),(12,12,'WEEK 12',1,0,NULL),(13,13,'WEEK 13',1,0,NULL),(14,14,'WEEK 14',1,0,NULL),(15,15,'WEEK 15',1,0,NULL),(16,16,'WEEK 16',1,0,NULL),(17,17,'WEEK 17',1,0,NULL),(18,18,'WEEK 18',1,0,NULL);
/*!40000 ALTER TABLE `weeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nfl_pools'
--

--
-- Dumping routines for database 'nfl_pools'
--
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_FORECAST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_FORECAST`(ID int)
BEGIN
	set @count = (select count(is_correct) from forecast_detail where forecast_detail.forecast_id = ID and forecast_detail.is_correct = '1');
    update forecast set forecast.hits = @count where forecast.idforecast = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_GAMES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_GAMES`(ID INT, WIN varchar(4))
BEGIN
	UPDATE forecast_detail set forecast_detail.is_correct = '1' where (forecast_detail.game = ID and forecast_detail.win = WIN);	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 20:42:14
