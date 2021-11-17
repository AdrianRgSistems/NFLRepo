CREATE DATABASE  IF NOT EXISTS `nfl_pools` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nfl_pools`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nfl_pools
-- ------------------------------------------------------
-- Server version	8.0.27

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
INSERT INTO `AspNetUserRoles` VALUES ('1a415993-1a4e-4931-9c86-4e3b76ee237d','3826fd2b-4536-49b8-a378-f97b76d54e71'),('3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('4089028c-f922-456c-9de7-eed03ef1db9f','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('84149160-69fc-40e9-9295-59306318bbee','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('a5ba2d8c-e1a7-49bd-aaa5-c3e231ea5714','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('d1a6245e-993f-4edf-b8e6-ae68b5a66cfb','c71e5ce5-d6d0-4024-b670-889256c8e4a9'),('e6c24e54-dc20-4599-8631-debfbdfe995d','c71e5ce5-d6d0-4024-b670-889256c8e4a9');
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
INSERT INTO `AspNetUsers` VALUES ('1a415993-1a4e-4931-9c86-4e3b76ee237d','admin@gmail.com','ADMIN@GMAIL.COM','admin@gmail.com','ADMIN@GMAIL.COM',1,'AQAAAAEAACcQAAAAEACmGCeVUvJ4zSIc4Bky7KTXi49O+Ob5PukRn6mYHj9DiLv6wkHbTDpJPMa6h4VASw==','R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR','f0354bab-cc5b-4b0b-a1fc-fabc9e5d1003',NULL,0,0,NULL,1,0,'administrador del sitema'),('3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee','rgft@gmail.com','RGFT@GMAIL.COM','rgft@gmail.com','RGFT@GMAIL.COM',1,'AQAAAAEAACcQAAAAEPPOGCjYkw0qjBumlNrz8W2lII1q2TA/PEw+/bCdVRYx+Jn7mDbKESFr9nPPoZhFPg==','KRP7Q4UKPDZBBQCURHZMFDWDKTIEXASU','b739eaf6-c3f7-47fe-9080-bb46dd1f2486',NULL,0,0,NULL,1,0,'adrian de la o hernandez'),('4089028c-f922-456c-9de7-eed03ef1db9f','user4@gmail.com','USER4@GMAIL.COM','user4@gmail.com','USER4@GMAIL.COM',1,'AQAAAAEAACcQAAAAEEPuOU03vCii3dWLYXKtgXKE8UwPBCYWzKCRBirPdmiKXZ+av2OwjM/jUt1GpoU4SA==','2FQ2IV2PQQLR4FV4W75ZXZFBO7AQYG47','993d7862-853b-4b4e-b9a7-73ff504a5e6f',NULL,0,0,NULL,1,0,'usuario de pruebas 4'),('84149160-69fc-40e9-9295-59306318bbee','user2@gmail.com','USER2@GMAIL.COM','user2@gmail.com','USER2@GMAIL.COM',1,'AQAAAAEAACcQAAAAEJXX9rKNsAM7bp+bjzNxhxFMNnAc7PMuJUWYffg+iPOdL7BZYyaFNqL570HFPhF4Pg==','FSSJYQTMK5U55OLXMVDIIJHGGTCW3FTU','591814a0-7037-4c49-b39e-9122c6e3d954',NULL,0,0,NULL,1,0,'usuario de pruebas 2'),('a5ba2d8c-e1a7-49bd-aaa5-c3e231ea5714','Administrador@mail.com','ADMINISTRADOR@MAIL.COM','Administrador@mail.com','ADMINISTRADOR@MAIL.COM',1,'AQAAAAEAACcQAAAAEGS9BMR/NccmiYhb6HKi+zxp4TWWPHyodhzpzlkf3js1XOBG22qk4XHV/D9wVibVYg==','E5ESK2M3OZ4ITA3J2MZ5P6AMHQYHXJIC','8d5fdf36-c529-4538-870e-98605f7a2a00',NULL,0,0,NULL,1,0,'Administrador Adicional del sistema'),('c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4','gorda@gmail.com','GORDA@GMAIL.COM','gorda@gmail.com','GORDA@GMAIL.COM',1,'AQAAAAEAACcQAAAAEAjzVWfSp5ro7cpGuAXepnenbz4WDS1GZfUJjJ/kRFOcbqCWiVdfU04JenpGYSMwXg==','PPUG7IG7U33YGRYGB6FZMCZ3MBEYOBDV','c0a3e9b3-b4c5-4845-afe4-7fcaead9a78f',NULL,0,0,NULL,1,0,'patricia la gordita'),('d1a6245e-993f-4edf-b8e6-ae68b5a66cfb','user3@gmail.com','USER3@GMAIL.COM','user3@gmail.com','USER3@GMAIL.COM',1,'AQAAAAEAACcQAAAAEFrgv6B8LjBV3NLQlGN7mzgwy/aOFbEc7vj+pRGwQJpGl3eHu0uobjOanqyj4qW/JA==','ZY5JYLIE6QOG4ROU2G2GHRFT4S5AUSFL','e1c5fbd3-9b1e-4f00-9d4f-393602e6f1a0',NULL,0,0,NULL,1,0,'usuario de pruebas 3'),('e6c24e54-dc20-4599-8631-debfbdfe995d','user1@gmail.com','USER1@GMAIL.COM','user1@gmail.com','USER1@GMAIL.COM',1,'AQAAAAEAACcQAAAAEI6Bw5BT8Dq1ByLiX701VCK956shWFsgLWbjYW/G1c2fc06QUg35wPVS0ojKLDMGzA==','XBHU3DPYORNFZXR6X2LM4INPIYBGMCD3','af42ea03-c3de-47a5-85ce-c7f3b451a2fa',NULL,0,0,NULL,1,0,'usuario de pruebas 1');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forecast`
--

LOCK TABLES `forecast` WRITE;
/*!40000 ALTER TABLE `forecast` DISABLE KEYS */;
INSERT INTO `forecast` VALUES (1,5,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee',2,65),(3,6,'3bc66e06-8369-4bac-8cf3-3c2d8a32e6ee',1,90),(4,6,'c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4',0,75),(16,10,'1a415993-1a4e-4931-9c86-4e3b76ee237d',13,45),(17,10,'e6c24e54-dc20-4599-8631-debfbdfe995d',5,30),(18,10,'84149160-69fc-40e9-9295-59306318bbee',8,55),(19,10,'d1a6245e-993f-4edf-b8e6-ae68b5a66cfb',9,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forecast_detail`
--

LOCK TABLES `forecast_detail` WRITE;
/*!40000 ALTER TABLE `forecast_detail` DISABLE KEYS */;
INSERT INTO `forecast_detail` VALUES (203,16,137,'MIA',0,1),(204,16,138,'CAR',0,1),(205,16,139,'DAL',0,1),(206,16,140,'PHI',0,1),(207,16,141,'GB',0,1),(208,16,142,'IND',0,1),(209,16,143,'MIN',0,1),(210,16,144,'KC',0,1),(211,16,145,'NE',0,1),(212,16,146,'BUF',0,1),(213,16,147,'PIT',0,0),(214,16,148,'TEN',0,1),(215,16,149,'WFT',0,1),(216,16,150,'SF',0,1),(217,17,137,'BAL',0,0),(218,17,138,'CAR',0,1),(219,17,139,'ATL',0,0),(220,17,140,'PHI',0,1),(221,17,141,'SEA',0,0),(222,17,142,'JAC',0,0),(223,17,143,'MIN',0,1),(224,17,144,'KC',0,1),(225,17,145,'CLE',0,0),(226,17,146,'BUF',0,1),(227,17,147,'DET',0,0),(228,17,148,'NO',0,0),(229,17,149,'TB',0,0),(230,17,150,'LAR',0,0),(231,18,137,'MIA',0,1),(232,18,138,'ARI',0,0),(233,18,139,'DAL',0,1),(234,18,140,'DEN',0,0),(235,18,141,'GB',0,1),(236,18,142,'IND',0,1),(237,18,143,'LAC',0,0),(238,18,144,'LV',0,0),(239,18,145,'NE',0,1),(240,18,146,'NYJ',0,0),(241,18,147,'PIT',0,0),(242,18,148,'TEN',0,1),(243,18,149,'WFT',0,1),(244,18,150,'SF',0,1),(245,19,137,'MIA',0,1),(246,19,138,'CAR',0,1),(247,19,139,'DAL',0,1),(248,19,140,'PHI',0,1),(249,19,141,'GB',0,1),(250,19,142,'JAC',0,0),(251,19,143,'LAC',0,0),(252,19,144,'KC',0,1),(253,19,145,'NE',0,1),(254,19,146,'BUF',0,1),(255,19,147,'PIT',0,0),(256,19,148,'NO',0,0),(257,19,149,'WFT',0,1),(258,19,150,'LAR',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,'2021-09-09','DAL','TB',29,31,3,'TB'),(2,1,'2021-09-12','PHI','ATL',32,6,3,'PHI'),(3,1,'2021-09-12','PIT','BUF',23,16,3,'PIT'),(4,1,'2021-09-12','NYJ','CAR',14,19,3,'CAR'),(5,1,'2021-09-12','MIN','CIN',24,27,3,'CIN'),(6,1,'2021-09-12','SF','DET',41,33,3,'SF'),(7,1,'2021-09-12','JAC','HOU',21,37,3,'HOU'),(8,1,'2021-09-12','SEA','IND',28,16,3,'SEA'),(9,1,'2021-09-12','CLE','KC',29,33,3,'KC'),(10,1,'2021-09-12','CHI','LAR',14,34,3,'LAR'),(11,1,'2021-09-12','MIA','NE',17,16,3,'MIA'),(12,1,'2021-09-12','GB','NO',3,38,3,'NO'),(13,1,'2021-09-12','DEN','NYG',27,13,3,'DEN'),(14,1,'2021-09-12','ARI','TEN',38,13,3,'ARI'),(15,1,'2021-09-12','LAC','WFT',20,16,3,'LAC'),(16,1,'2021-09-13','BAL','LV',27,33,3,'LV'),(17,2,'2021-09-16','NYG','WFT',29,30,3,'WFT'),(18,2,'2021-09-19','MIN','ARI',33,34,3,'ARI'),(19,2,'2021-09-19','KC','BAL',35,36,3,'BAL'),(20,2,'2021-09-19','NO','CAR',7,26,3,'CAR'),(21,2,'2021-09-19','CIN','CHI',17,20,3,'CHI'),(22,2,'2021-09-19','HOU','CLE',21,31,3,'CLE'),(23,2,'2021-09-19','LAR','IND',27,24,3,'LAR'),(24,2,'2021-09-19','DEN','JAC',23,13,3,'DEN'),(25,2,'2021-09-19','DAL','LAC',20,17,3,'DAL'),(26,2,'2021-09-19','BUF','MIA',35,0,3,'BUF'),(27,2,'2021-09-19','NE','NYJ',25,6,3,'NE'),(28,2,'2021-09-19','SF','PHI',17,11,3,'SF'),(29,2,'2021-09-19','LV','PIT',26,17,3,'LV'),(30,2,'2021-09-19','TEN','SEA',33,30,3,'TEN'),(31,2,'2021-09-19','ATL','TB',25,48,3,'TB'),(32,2,'2021-09-20','DET','GB',17,35,3,'GB'),(33,3,'2021-09-23','CAR','HOU',24,9,3,'CAR'),(34,3,'2021-09-26','WFT','BUF',21,43,3,'BUF'),(35,3,'2021-09-26','CHI','CLE',6,26,3,'CLE'),(36,3,'2021-09-26','NYJ','DEN',0,26,3,'DEN'),(37,3,'2021-09-26','BAL','DET',19,17,3,'BAL'),(38,3,'2021-09-26','ARI','JAC',31,19,3,'ARI'),(39,3,'2021-09-26','LAC','KC',30,24,3,'LAC'),(40,3,'2021-09-26','TB','LAR',24,34,3,'LAR'),(41,3,'2021-09-26','MIA','LV',28,31,3,'LV'),(42,3,'2021-09-26','SEA','MIN',19,30,3,'MIN'),(43,3,'2021-09-26','NO','NE',28,13,3,'NO'),(44,3,'2021-09-26','ATL','NYG',17,14,3,'ATL'),(45,3,'2021-09-26','CIN','PIT',24,10,3,'CIN'),(46,3,'2021-09-26','GB','SF',30,28,3,'GB'),(47,3,'2021-09-26','IND','TEN',16,25,3,'TEN'),(48,3,'2021-09-27','PHI','DAL',21,41,3,'DAL'),(49,4,'2021-09-30','JAC','CIN',21,24,3,'CIN'),(50,4,'2021-10-03','WFT','ATL',34,30,3,'WFT'),(51,4,'2021-10-03','HOU','BUF',0,40,3,'BUF'),(52,4,'2021-10-03','DET','CHI',14,24,3,'CHI'),(53,4,'2021-10-03','CAR','DAL',28,36,3,'DAL'),(54,4,'2021-10-03','BAL','DEN',23,7,3,'BAL'),(55,4,'2021-10-03','PIT','GB',17,27,3,'GB'),(56,4,'2021-10-03','ARI','LAR',37,20,3,'ARI'),(57,4,'2021-10-03','IND','MIA',27,17,3,'IND'),(58,4,'2021-10-03','CLE','MIN',14,7,3,'CLE'),(59,4,'2021-10-03','TB','NE',19,17,3,'TB'),(60,4,'2021-10-03','NYG','NO',27,21,3,'NYG'),(61,4,'2021-10-03','TEN','NYJ',24,27,3,'NYJ'),(62,4,'2021-10-03','KC','PHI',42,30,3,'KC'),(63,4,'2021-10-03','SEA','SF',28,21,3,'SEA'),(64,4,'2021-10-04','LV','LAC',14,28,3,'LAC'),(65,5,'2021-10-07','LAR','SEA',26,17,3,'LAR'),(66,5,'2021-10-10','SF','ARI',10,17,3,'ARI'),(67,5,'2021-10-10','NYJ','ATL',20,27,3,'ATL'),(68,5,'2021-10-10','PHI','CAR',21,18,3,'PHI'),(69,5,'2021-10-10','GB','CIN',25,22,3,'GB'),(70,5,'2021-10-10','NYG','DAL',20,44,3,'DAL'),(71,5,'2021-10-10','NE','HOU',25,22,3,'NE'),(72,5,'2021-10-10','TEN','JAC',37,19,3,'TEN'),(73,5,'2021-10-10','BUF','KC',28,20,3,'BUF'),(74,5,'2021-10-10','CLE','LAC',42,47,3,'LAC'),(75,5,'2021-10-10','CHI','LV',20,9,3,'CHI'),(76,5,'2021-10-10','DET','MIN',17,19,3,'MIN'),(77,5,'2021-10-10','DEN','PIT',19,27,3,'PIT'),(78,5,'2021-10-10','MIA','TB',17,45,3,'TB'),(79,5,'2021-10-10','NO','WFT',33,22,3,'NO'),(80,5,'2021-10-11','IND','BAL',25,31,3,'BAL'),(81,6,'2021-10-14','TB','PHI',28,22,3,'TB'),(82,6,'2021-10-17','LAC','BAL',6,34,3,'BAL'),(83,6,'2021-10-17','MIN','CAR',34,28,3,'MIN'),(84,6,'2021-10-17','GB','CHI',24,14,3,'GB'),(85,6,'2021-10-17','ARI','CLE',37,14,3,'ARI'),(86,6,'2021-10-17','LV','DEN',34,24,3,'LV'),(87,6,'2021-10-17','CIN','DET',34,11,3,'CIN'),(88,6,'2021-10-17','HOU','IND',3,31,3,'IND'),(89,6,'2021-10-17','MIA','JAC',20,23,3,'JAC'),(90,6,'2021-10-17','DAL','NE',35,29,3,'DAL'),(91,6,'2021-10-17','LAR','NYG',38,11,3,'LAR'),(92,6,'2021-10-17','SEA','PIT',20,23,3,'PIT'),(93,6,'2021-10-17','KC','WFT',31,13,3,'KC'),(94,6,'2021-10-18','BUF','TEN',31,34,3,'TEN'),(95,7,'2021-10-21','DEN','CLE',14,17,3,'CLE'),(96,7,'2021-10-24','HOU','ARI',5,31,3,'ARI'),(97,7,'2021-10-24','CIN','BAL',41,17,3,'CIN'),(98,7,'2021-10-24','WFT','GB',10,24,3,'GB'),(99,7,'2021-10-24','DET','LAR',19,28,3,'LAR'),(100,7,'2021-10-24','PHI','LV',22,33,3,'LV'),(101,7,'2021-10-24','ATL','MIA',30,28,3,'ATL'),(102,7,'2021-10-24','NYJ','NE',13,54,3,'NE'),(103,7,'2021-10-24','CAR','NYG',3,25,3,'NYG'),(104,7,'2021-10-24','IND','SF',30,18,3,'IND'),(105,7,'2021-10-24','CHI','TB',3,38,3,'TB'),(106,7,'2021-10-24','KC','TEN',3,27,3,'TEN'),(107,7,'2021-10-25','NO','SEA',13,10,3,'NO'),(108,8,'2021-10-28','GB','ARI',24,21,3,'GB'),(109,8,'2021-10-31','CAR','ATL',19,13,3,'CAR'),(110,8,'2021-10-31','MIA','BUF',11,26,3,'BUF'),(111,8,'2021-10-31','SF','CHI',33,22,3,'SF'),(112,8,'2021-10-31','PIT','CLE',15,10,3,'PIT'),(113,8,'2021-10-31','WFT','DEN',10,17,3,'DEN'),(114,8,'2021-10-31','PHI','DET',44,6,3,'PHI'),(115,8,'2021-10-31','LAR','HOU',38,22,3,'LAR'),(116,8,'2021-10-31','TEN','IND',34,31,3,'TEN'),(117,8,'2021-10-31','NE','LAC',27,24,3,'NE'),(118,8,'2021-10-31','DAL','MIN',20,16,3,'DAL'),(119,8,'2021-10-31','TB','NO',27,36,3,'NO'),(120,8,'2021-10-31','CIN','NYJ',31,34,3,'NYJ'),(121,8,'2021-10-31','JAC','SEA',7,31,3,'SEA'),(122,8,'2021-11-01','NYG','KC',17,20,3,'KC'),(123,9,'2021-11-04','NYJ','IND',30,45,3,'IND'),(124,9,'2021-11-07','MIN','BAL',31,34,3,'BAL'),(125,9,'2021-11-07','NE','CAR',24,6,3,'NE'),(126,9,'2021-11-07','CLE','CIN',41,16,3,'CLE'),(127,9,'2021-11-07','DEN','DAL',30,16,3,'DEN'),(128,9,'2021-11-07','BUF','JAC',6,9,3,'JAC'),(129,9,'2021-11-07','GB','KC',7,13,3,'KC'),(130,9,'2021-11-07','TEN','LAR',28,16,3,'TEN'),(131,9,'2021-11-07','HOU','MIA',9,17,3,'MIA'),(132,9,'2021-11-07','ATL','NO',27,25,3,'ATL'),(133,9,'2021-11-07','LV','NYG',16,23,3,'NYG'),(134,9,'2021-11-07','LAC','PHI',27,24,3,'LAC'),(135,9,'2021-11-07','ARI','SF',31,17,3,'ARI'),(136,9,'2021-11-08','CHI','PIT',27,29,3,'PIT'),(137,10,'2021-11-11','BAL','MIA',10,22,3,'MIA'),(138,10,'2021-11-14','CAR','ARI',34,10,3,'CAR'),(139,10,'2021-11-14','ATL','DAL',3,43,3,'DAL'),(140,10,'2021-11-14','PHI','DEN',30,13,3,'PHI'),(141,10,'2021-11-14','SEA','GB',0,17,3,'GB'),(142,10,'2021-11-14','JAC','IND',17,23,3,'IND'),(143,10,'2021-11-14','MIN','LAC',27,20,3,'MIN'),(144,10,'2021-11-14','KC','LV',41,14,3,'KC'),(145,10,'2021-11-14','CLE','NE',7,45,3,'NE'),(146,10,'2021-11-14','BUF','NYJ',45,17,3,'BUF'),(147,10,'2021-11-14','DET','PIT',16,16,3,NULL),(148,10,'2021-11-14','NO','TEN',21,23,3,'TEN'),(149,10,'2021-11-14','TB','WFT',19,29,3,'WFT'),(150,10,'2021-11-15','LAR','SF',10,31,3,'SF'),(151,11,'2021-11-18','NE','ATL',0,0,1,NULL),(152,11,'2021-11-21','IND','BUF',0,0,1,NULL),(153,11,'2021-11-21','WFT','CAR',0,0,1,NULL),(154,11,'2021-11-21','BAL','CHI',0,0,1,NULL),(155,11,'2021-11-21','DET','CLE',0,0,1,NULL),(156,11,'2021-11-21','SF','JAC',0,0,1,NULL),(157,11,'2021-11-21','DAL','KC',0,0,1,NULL),(158,11,'2021-11-21','PIT','LAC',0,0,1,NULL),(159,11,'2021-11-21','CIN','LV',0,0,1,NULL),(160,11,'2021-11-21','GB','MIN',0,0,1,NULL),(161,11,'2021-11-21','MIA','NYJ',0,0,1,NULL),(162,11,'2021-11-21','NO','PHI',0,0,1,NULL),(163,11,'2021-11-21','ARI','SEA',0,0,1,NULL),(164,11,'2021-11-21','HOU','TEN',0,0,1,NULL),(165,11,'2021-11-22','NYG','TB',0,0,1,NULL),(166,12,'2021-11-25','LV','DAL',0,0,1,NULL),(167,12,'2021-11-25','CHI','DET',0,0,1,NULL),(168,12,'2021-11-25','BUF','NO',0,0,1,NULL),(169,12,'2021-11-28','CLE','BAL',0,0,1,NULL),(170,12,'2021-11-28','PIT','CIN',0,0,1,NULL),(171,12,'2021-11-28','LAC','DEN',0,0,1,NULL),(172,12,'2021-11-28','LAR','GB',0,0,1,NULL),(173,12,'2021-11-28','NYJ','HOU',0,0,1,NULL),(174,12,'2021-11-28','TB','IND',0,0,1,NULL),(175,12,'2021-11-28','ATL','JAC',0,0,1,NULL),(176,12,'2021-11-28','CAR','MIA',0,0,1,NULL),(177,12,'2021-11-28','TEN','NE',0,0,1,NULL),(178,12,'2021-11-28','PHI','NYG',0,0,1,NULL),(179,12,'2021-11-28','MIN','SF',0,0,1,NULL),(180,12,'2021-11-29','SEA','WFT',0,0,1,NULL),(181,13,'2021-12-02','DAL','NO',0,0,1,NULL),(182,13,'2021-12-05','TB','ATL',0,0,1,NULL),(183,13,'2021-12-05','ARI','CHI',0,0,1,NULL),(184,13,'2021-12-05','LAC','CIN',0,0,1,NULL),(185,13,'2021-12-05','MIN','DET',0,0,1,NULL),(186,13,'2021-12-05','IND','HOU',0,0,1,NULL),(187,13,'2021-12-05','DEN','KC',0,0,1,NULL),(188,13,'2021-12-05','JAC','LAR',0,0,1,NULL),(189,13,'2021-12-05','WFT','LV',0,0,1,NULL),(190,13,'2021-12-05','NYG','MIA',0,0,1,NULL),(191,13,'2021-12-05','PHI','NYJ',0,0,1,NULL),(192,13,'2021-12-05','BAL','PIT',0,0,1,NULL),(193,13,'2021-12-05','SF','SEA',0,0,1,NULL),(194,13,'2021-12-06','NE','BUF',0,0,1,NULL),(195,14,'2021-12-09','PIT','MIN',0,0,1,NULL),(196,14,'2021-12-12','ATL','CAR',0,0,1,NULL),(197,14,'2021-12-12','SF','CIN',0,0,1,NULL),(198,14,'2021-12-12','BAL','CLE',0,0,1,NULL),(199,14,'2021-12-12','DET','DEN',0,0,1,NULL),(200,14,'2021-12-12','CHI','GB',0,0,1,NULL),(201,14,'2021-12-12','SEA','HOU',0,0,1,NULL),(202,14,'2021-12-12','LV','KC',0,0,1,NULL),(203,14,'2021-12-12','NYG','LAC',0,0,1,NULL),(204,14,'2021-12-12','NO','NYJ',0,0,1,NULL),(205,14,'2021-12-12','BUF','TB',0,0,1,NULL),(206,14,'2021-12-12','JAC','TEN',0,0,1,NULL),(207,14,'2021-12-12','DAL','WFT',0,0,1,NULL),(208,14,'2021-12-13','LAR','ARI',0,0,1,NULL),(209,15,'2021-12-16','KC','LAC',0,0,1,NULL),(210,15,'2021-12-19','GB','BAL',0,0,1,NULL),(211,15,'2021-12-19','CAR','BUF',0,0,1,NULL),(212,15,'2021-12-19','LV','CLE',0,0,1,NULL),(213,15,'2021-12-19','CIN','DEN',0,0,1,NULL),(214,15,'2021-12-19','ARI','DET',0,0,1,NULL),(215,15,'2021-12-19','NE','IND',0,0,1,NULL),(216,15,'2021-12-19','HOU','JAC',0,0,1,NULL),(217,15,'2021-12-19','SEA','LAR',0,0,1,NULL),(218,15,'2021-12-19','NYJ','MIA',0,0,1,NULL),(219,15,'2021-12-19','DAL','NYG',0,0,1,NULL),(220,15,'2021-12-19','WFT','PHI',0,0,1,NULL),(221,15,'2021-12-19','TEN','PIT',0,0,1,NULL),(222,15,'2021-12-19','ATL','SF',0,0,1,NULL),(223,15,'2021-12-19','NO','TB',0,0,1,NULL),(224,15,'2021-12-20','MIN','CHI',0,0,1,NULL),(225,16,'2021-12-23','SF','TEN',0,0,1,NULL),(226,16,'2021-12-25','IND','ARI',0,0,1,NULL),(227,16,'2021-12-25','CLE','GB',0,0,1,NULL),(228,16,'2021-12-26','DET','ATL',0,0,1,NULL),(229,16,'2021-12-26','TB','CAR',0,0,1,NULL),(230,16,'2021-12-26','BAL','CIN',0,0,1,NULL),(231,16,'2021-12-26','WFT','DAL',0,0,1,NULL),(232,16,'2021-12-26','LAC','HOU',0,0,1,NULL),(233,16,'2021-12-26','PIT','KC',0,0,1,NULL),(234,16,'2021-12-26','DEN','LV',0,0,1,NULL),(235,16,'2021-12-26','LAR','MIN',0,0,1,NULL),(236,16,'2021-12-26','BUF','NE',0,0,1,NULL),(237,16,'2021-12-26','JAC','NYJ',0,0,1,NULL),(238,16,'2021-12-26','NYG','PHI',0,0,1,NULL),(239,16,'2021-12-26','CHI','SEA',0,0,1,NULL),(240,16,'2021-12-27','MIA','NO',0,0,1,NULL),(241,17,'2022-01-02','LAR','BAL',0,0,1,NULL),(242,17,'2022-01-02','ATL','BUF',0,0,1,NULL),(243,17,'2022-01-02','NYG','CHI',0,0,1,NULL),(244,17,'2022-01-02','KC','CIN',0,0,1,NULL),(245,17,'2022-01-02','ARI','DAL',0,0,1,NULL),(246,17,'2022-01-02','MIN','GB',0,0,1,NULL),(247,17,'2022-01-02','LV','IND',0,0,1,NULL),(248,17,'2022-01-02','DEN','LAC',0,0,1,NULL),(249,17,'2022-01-02','JAC','NE',0,0,1,NULL),(250,17,'2022-01-02','CAR','NO',0,0,1,NULL),(251,17,'2022-01-02','TB','NYJ',0,0,1,NULL),(252,17,'2022-01-02','DET','SEA',0,0,1,NULL),(253,17,'2022-01-02','HOU','SF',0,0,1,NULL),(254,17,'2022-01-02','MIA','TEN',0,0,1,NULL),(255,17,'2022-01-02','PHI','WFT',0,0,1,NULL),(256,17,'2022-01-03','CLE','PIT',0,0,1,NULL),(257,18,'2022-01-09','SEA','ARI',0,0,1,NULL),(258,18,'2022-01-09','NO','ATL',0,0,1,NULL),(259,18,'2022-01-09','PIT','BAL',0,0,1,NULL),(260,18,'2022-01-09','NYJ','BUF',0,0,1,NULL),(261,18,'2022-01-09','CIN','CLE',0,0,1,NULL),(262,18,'2022-01-09','KC','DEN',0,0,1,NULL),(263,18,'2022-01-09','GB','DET',0,0,1,NULL),(264,18,'2022-01-09','TEN','HOU',0,0,1,NULL),(265,18,'2022-01-09','IND','JAC',0,0,1,NULL),(266,18,'2022-01-09','SF','LAR',0,0,1,NULL),(267,18,'2022-01-09','LAC','LV',0,0,1,NULL),(268,18,'2022-01-09','NE','MIA',0,0,1,NULL),(269,18,'2022-01-09','CHI','MIN',0,0,1,NULL),(270,18,'2022-01-09','WFT','NYG',0,0,1,NULL),(271,18,'2022-01-09','DAL','PHI',0,0,1,NULL),(272,18,'2022-01-09','CAR','TB',0,0,1,NULL);
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
INSERT INTO `PersistedGrants` VALUES ('8Fdscs+lmL56GlaiygFq5uizTXxwxxOB+INwok6y6Lk=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','44F2D4F16E600BD7F28E680632965371','NFL.Client',NULL,'2021-11-17 02:58:26.000000','2021-11-17 03:03:26.000000',NULL,'{\"CreationTime\":\"2021-11-17T02:58:26Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1637048550\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"BmQnQXbtaCvg9Xy7KtIHFg\",\"WasConsentShown\":false,\"SessionId\":\"44F2D4F16E600BD7F28E680632965371\",\"CodeChallenge\":\"iFJsHAELOnOASNWrFWemSQL2Ovs1dyD/4KGrr66ODq8=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('C2zU0dqU01V3JpoN4qDhcbmZo0f+deN56NRNbW50y00=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','93FD6E2FFE952501FD93D5229AD69C81','NFL.Client',NULL,'2021-11-15 07:56:38.000000','2021-11-15 08:01:38.000000',NULL,'{\"CreationTime\":\"2021-11-15T07:56:38Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1636962697\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"2vLfMf9lpuHds46QNrDBYw\",\"WasConsentShown\":false,\"SessionId\":\"93FD6E2FFE952501FD93D5229AD69C81\",\"CodeChallenge\":\"R6vUZDcFeU5M88nkLKGlhlIoR5QXNhZ77L/9sT2AQGM=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('GEP2KgW/cB7odrJ9+bCU03/+JT4Wr6rwWGTh2hna/aY=','authorization_code','c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4','4B68EB12DA4D42F38D6E7BE0542AED11','NFL.Client',NULL,'2021-11-15 05:37:51.000000','2021-11-15 05:42:51.000000',NULL,'{\"CreationTime\":\"2021-11-15T05:37:51Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"c16d7749-8b15-4f9e-a7d1-d9f60d32e6a4\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"gorda@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"PPUG7IG7U33YGRYGB6FZMCZ3MBEYOBDV\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"User\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"gorda@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"gorda@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"gorda@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1636954467\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"ZoUE_IC4Vn4mS9ykJ-jUIQ\",\"WasConsentShown\":false,\"SessionId\":\"4B68EB12DA4D42F38D6E7BE0542AED11\",\"CodeChallenge\":\"+9tThfetFmmg3VMMt2GXFH1mL4bxS+fokiBc+C3pVIY=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('JzRS1Y8kPX3WIQTyys1G8gXfeU86+sJ7UcU9RyHNB7Y=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','E139F25908EE43D1DCFA8490839604E4','NFL.Client',NULL,'2021-11-16 05:06:05.000000','2021-11-16 05:11:05.000000',NULL,'{\"CreationTime\":\"2021-11-16T05:06:05Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1637012306\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"HfhJuAlt2AaFRlJqBnGYrA\",\"WasConsentShown\":false,\"SessionId\":\"E139F25908EE43D1DCFA8490839604E4\",\"CodeChallenge\":\"Zkd9NzwW1/2Q2BZ/mKVRP+DWxCQrTNCiYf0+wDm7SMM=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('ORiSo6KY51NS3Wc1tdNoaBSlZDg2pe8dzvCd+o/hXYo=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','42C72B9AEBF8F8CCFDC43C08B83E9776','NFL.Client',NULL,'2021-11-15 05:27:32.000000','2021-11-15 05:32:32.000000',NULL,'{\"CreationTime\":\"2021-11-15T05:27:32Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1636953363\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"2-142GjmbKivInJOa-ycwQ\",\"WasConsentShown\":false,\"SessionId\":\"42C72B9AEBF8F8CCFDC43C08B83E9776\",\"CodeChallenge\":\"fS2iMMyP4MEMkIcLy39ScubRDzDVrNDLfLyB6HcWowM=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('R03Z+rCnvdREIdEHgmXmi3eqcwruSphqtaEkb4yMkfU=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','44F2D4F16E600BD7F28E680632965371','NFL.Client',NULL,'2021-11-17 05:13:07.000000','2021-11-17 05:18:07.000000',NULL,'{\"CreationTime\":\"2021-11-17T05:13:07Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1637048550\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"3KKRhWnB949SHAp2a0uuGA\",\"WasConsentShown\":false,\"SessionId\":\"44F2D4F16E600BD7F28E680632965371\",\"CodeChallenge\":\"gjaUC8OJfGPJU22uKRtUriseHDC+76HqsYgZzXnAeU4=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}'),('VF4dOUO/qoMoMuV+gnPXVxq2k2jJgwexN+wiEUSJyNo=','authorization_code','1a415993-1a4e-4931-9c86-4e3b76ee237d','44F2D4F16E600BD7F28E680632965371','NFL.Client',NULL,'2021-11-17 02:26:18.000000','2021-11-17 02:31:18.000000',NULL,'{\"CreationTime\":\"2021-11-17T02:26:18Z\",\"Lifetime\":300,\"ClientId\":\"NFL.Client\",\"Subject\":{\"AuthenticationType\":\"Identity.Application\",\"Claims\":[{\"Type\":\"sub\",\"Value\":\"1a415993-1a4e-4931-9c86-4e3b76ee237d\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"AspNet.Identity.SecurityStamp\",\"Value\":\"R7NSJPHTX3S6FVAPMJMLWPUODUAOL7LR\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"role\",\"Value\":\"Admin\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"preferred_username\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"name\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email\",\"Value\":\"admin@gmail.com\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"email_verified\",\"Value\":\"true\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#boolean\"},{\"Type\":\"amr\",\"Value\":\"pwd\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"idp\",\"Value\":\"local\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#string\"},{\"Type\":\"auth_time\",\"Value\":\"1637048550\",\"ValueType\":\"http://www.w3.org/2001/XMLSchema#integer64\"}]},\"IsOpenId\":true,\"RequestedScopes\":[\"NFL.ServerAPI\",\"openid\",\"profile\"],\"RedirectUri\":\"https://localhost:5001/authentication/login-callback\",\"Nonce\":null,\"StateHash\":\"9R4H91tUIBGklEfJG5gIWA\",\"WasConsentShown\":false,\"SessionId\":\"44F2D4F16E600BD7F28E680632965371\",\"CodeChallenge\":\"1OFa0JqsE3IF5MY0tTfRTpX5E77u8yBSnrxBsE3jZGc=\",\"CodeChallengeMethod\":\"S256\",\"Description\":null,\"Properties\":{}}');
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
-- Table structure for table `spool`
--

DROP TABLE IF EXISTS `spool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spool` (
  `idspool` int NOT NULL AUTO_INCREMENT,
  `participants` int DEFAULT NULL,
  `week_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `winners` int DEFAULT NULL,
  PRIMARY KEY (`idspool`),
  UNIQUE KEY `idspool_UNIQUE` (`idspool`),
  KEY `weekfore_idx` (`week_id`),
  CONSTRAINT `weekfore` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spool`
--

LOCK TABLES `spool` WRITE;
/*!40000 ALTER TABLE `spool` DISABLE KEYS */;
INSERT INTO `spool` VALUES (1,0,4,0.00,0),(2,0,4,0.00,0),(3,0,4,0.00,0),(4,0,4,0.00,0),(5,0,4,0.00,0),(6,0,4,0.00,0),(8,4,10,200.00,1);
/*!40000 ALTER TABLE `spool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spool_winners`
--

DROP TABLE IF EXISTS `spool_winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spool_winners` (
  `idspool_winners` int NOT NULL AUTO_INCREMENT,
  `spool_id` int DEFAULT NULL,
  `id_User` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `id_forecast` int DEFAULT NULL,
  PRIMARY KEY (`idspool_winners`),
  UNIQUE KEY `idspool_winners_UNIQUE` (`idspool_winners`),
  KEY `fkuser_idx` (`id_User`),
  KEY `fkforecast_idx` (`id_forecast`),
  KEY `fkspool_idx` (`spool_id`),
  CONSTRAINT `fkforecast` FOREIGN KEY (`id_forecast`) REFERENCES `forecast` (`idforecast`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkspool` FOREIGN KEY (`spool_id`) REFERENCES `spool` (`idspool`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkuser` FOREIGN KEY (`id_User`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spool_winners`
--

LOCK TABLES `spool_winners` WRITE;
/*!40000 ALTER TABLE `spool_winners` DISABLE KEYS */;
INSERT INTO `spool_winners` VALUES (8,8,'1a415993-1a4e-4931-9c86-4e3b76ee237d',200.00,16);
/*!40000 ALTER TABLE `spool_winners` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Seattle Seahawks','Seahawks','SEA',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/SEA'),(2,'San Francisco 49ers','49er','SF',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/SF'),(3,'Los Angeles Rams','Rams','LAR',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LA'),(4,'Arizona Cardinals','Cardinals','ARI',1,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/ARI'),(5,'Green Bay Packers','Packers','GB',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/GB'),(6,'Chicago Bears','Bears','CHI',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CHI'),(7,'Minnesota Vikings',' Vikings','MIN',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/MIN'),(8,'Detroit Lions','Lions','DET',2,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DET'),(9,'Tampa Bay Buccaneers','Buccaneers','TB',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/TB'),(10,'Carolina Panthers','Panthers','CAR',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CAR'),(11,'New Orleans Saints','Saints','NO',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NO'),(12,'Atlanta Falcons','Falcons','ATL',3,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/ATL'),(13,'Dallas Cowboys','Cowboys','DAL',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DAL'),(14,'Washington Football Team','Washington','WFT',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/WAS'),(15,'Philadelphia Eagles','Eagles','PHI',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/PHI'),(16,'New York Giants','Giants','NYG',4,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NYG'),(17,'Tennessee Titans','Titans','TEN',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/TEN'),(18,'Houston Texans','Texans','HOU',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/HOU'),(19,'Indianapolis Colts','Colts','IND',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/IND'),(20,'Jacksonville Jaguars','Jaguars','JAC',5,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/JAX'),(21,'Buffalo Bills','Bills','BUF',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/BUF'),(22,'Miami Dolphins','Dolphins','MIA',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/MIA'),(23,'New England Patriots','Patriots','NE',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NE'),(24,'New York Jets','Jets','NYJ',6,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/NYJ'),(25,'Cincinnati Bengals','Bengals','CIN',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CIN'),(26,'Baltimore Ravens','Ravens','BAL',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/BAL'),(27,'Cleveland Browns','Browns','CLE',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/CLE'),(28,'Pittsburgh Steelers','Steelers','PIT',7,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/PIT'),(29,'Los Angeles Chargers','Chargers','LAC',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LAC'),(30,'Las Vegas Raiders','Raiders','LV',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/LV'),(31,'Denver Broncos','Broncos','DEN',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/DEN'),(32,'Kansas City Chiefs','Chiefs','KC',8,'https://static.www.nfl.com/t_q-best/league/api/clubs/logos/KC'),(33,'Empate','Emp','EMP',2,NULL);
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
INSERT INTO `weeks` VALUES (1,1,'WEEK 1',1,3,60),(2,2,'WEEK 2',1,3,52),(3,3,'WEEK 3',1,3,62),(4,4,'WEEK 4',1,3,42),(5,5,'WEEK 5',1,3,56),(6,6,'WEEK 6',1,3,64),(7,7,'WEEK 7',1,3,23),(8,8,'WEEK 8',1,3,37),(9,9,'WEEK 9',1,3,56),(10,10,'WEEK 10',1,3,41),(11,11,'WEEK 11',1,0,NULL),(12,12,'WEEK 12',1,0,NULL),(13,13,'WEEK 13',1,0,NULL),(14,14,'WEEK 14',1,0,NULL),(15,15,'WEEK 15',1,0,NULL),(16,16,'WEEK 16',1,0,NULL),(17,17,'WEEK 17',1,0,NULL),(18,18,'WEEK 18',1,0,NULL);
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

-- Dump completed on 2021-11-17  0:14:35
