-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (x86_64)
--
-- Host: localhost    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `employees`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `employees` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `employees`;

--
-- Temporary view structure for view `current_dept_emp`
--

DROP TABLE IF EXISTS `current_dept_emp`;
/*!50001 DROP VIEW IF EXISTS `current_dept_emp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `current_dept_emp` AS SELECT 
 1 AS `emp_no`,
 1 AS `dept_no`,
 1 AS `from_date`,
 1 AS `to_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_emp`
--

DROP TABLE IF EXISTS `dept_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_emp` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_emp`
--

LOCK TABLES `dept_emp` WRITE;
/*!40000 ALTER TABLE `dept_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dept_emp_latest_date`
--

DROP TABLE IF EXISTS `dept_emp_latest_date`;
/*!50001 DROP VIEW IF EXISTS `dept_emp_latest_date`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dept_emp_latest_date` AS SELECT 
 1 AS `emp_no`,
 1 AS `from_date`,
 1 AS `to_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dept_manager`
--

DROP TABLE IF EXISTS `dept_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_manager`
--

LOCK TABLES `dept_manager` WRITE;
/*!40000 ALTER TABLE `dept_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaries` (
  `emp_no` int NOT NULL,
  `salary` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (to_days(`from_date`))
(PARTITION p01 VALUES LESS THAN (725007) ENGINE = InnoDB,
 PARTITION p02 VALUES LESS THAN (725372) ENGINE = InnoDB,
 PARTITION p03 VALUES LESS THAN (725737) ENGINE = InnoDB,
 PARTITION p04 VALUES LESS THAN (726102) ENGINE = InnoDB,
 PARTITION p05 VALUES LESS THAN (726468) ENGINE = InnoDB,
 PARTITION p06 VALUES LESS THAN (726833) ENGINE = InnoDB,
 PARTITION p07 VALUES LESS THAN (727198) ENGINE = InnoDB,
 PARTITION p08 VALUES LESS THAN (727563) ENGINE = InnoDB,
 PARTITION p09 VALUES LESS THAN (727929) ENGINE = InnoDB,
 PARTITION p10 VALUES LESS THAN (728294) ENGINE = InnoDB,
 PARTITION p11 VALUES LESS THAN (728659) ENGINE = InnoDB,
 PARTITION p12 VALUES LESS THAN (729024) ENGINE = InnoDB,
 PARTITION p13 VALUES LESS THAN (729390) ENGINE = InnoDB,
 PARTITION p14 VALUES LESS THAN (729755) ENGINE = InnoDB,
 PARTITION p15 VALUES LESS THAN (730120) ENGINE = InnoDB,
 PARTITION p16 VALUES LESS THAN (730485) ENGINE = InnoDB,
 PARTITION p17 VALUES LESS THAN (730851) ENGINE = InnoDB,
 PARTITION p18 VALUES LESS THAN (730882) ENGINE = InnoDB,
 PARTITION p19 VALUES LESS THAN (730910) ENGINE = InnoDB,
 PARTITION p20 VALUES LESS THAN (730941) ENGINE = InnoDB,
 PARTITION p21 VALUES LESS THAN (730971) ENGINE = InnoDB,
 PARTITION p22 VALUES LESS THAN (731002) ENGINE = InnoDB,
 PARTITION p23 VALUES LESS THAN (731032) ENGINE = InnoDB,
 PARTITION p24 VALUES LESS THAN (731063) ENGINE = InnoDB,
 PARTITION p25 VALUES LESS THAN (731094) ENGINE = InnoDB,
 PARTITION p26 VALUES LESS THAN (731124) ENGINE = InnoDB,
 PARTITION p27 VALUES LESS THAN (731155) ENGINE = InnoDB,
 PARTITION p28 VALUES LESS THAN (731185) ENGINE = InnoDB,
 PARTITION p29 VALUES LESS THAN (731216) ENGINE = InnoDB,
 PARTITION p30 VALUES LESS THAN (731247) ENGINE = InnoDB,
 PARTITION p31 VALUES LESS THAN (731275) ENGINE = InnoDB,
 PARTITION p32 VALUES LESS THAN (731306) ENGINE = InnoDB,
 PARTITION p33 VALUES LESS THAN (731336) ENGINE = InnoDB,
 PARTITION p34 VALUES LESS THAN (731367) ENGINE = InnoDB,
 PARTITION p35 VALUES LESS THAN (731397) ENGINE = InnoDB,
 PARTITION p36 VALUES LESS THAN (731428) ENGINE = InnoDB,
 PARTITION p37 VALUES LESS THAN (731459) ENGINE = InnoDB,
 PARTITION p38 VALUES LESS THAN (731489) ENGINE = InnoDB,
 PARTITION p39 VALUES LESS THAN (731520) ENGINE = InnoDB,
 PARTITION p40 VALUES LESS THAN (731550) ENGINE = InnoDB,
 PARTITION p41 VALUES LESS THAN (1095728) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `emp_no` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (to_days(`from_date`))
(PARTITION p01 VALUES LESS THAN (725371) ENGINE = InnoDB,
 PARTITION p02 VALUES LESS THAN (725736) ENGINE = InnoDB,
 PARTITION p03 VALUES LESS THAN (726101) ENGINE = InnoDB,
 PARTITION p04 VALUES LESS THAN (726467) ENGINE = InnoDB,
 PARTITION p05 VALUES LESS THAN (726832) ENGINE = InnoDB,
 PARTITION p06 VALUES LESS THAN (727197) ENGINE = InnoDB,
 PARTITION p07 VALUES LESS THAN (727562) ENGINE = InnoDB,
 PARTITION p08 VALUES LESS THAN (727928) ENGINE = InnoDB,
 PARTITION p09 VALUES LESS THAN (728293) ENGINE = InnoDB,
 PARTITION p10 VALUES LESS THAN (728658) ENGINE = InnoDB,
 PARTITION p11 VALUES LESS THAN (729023) ENGINE = InnoDB,
 PARTITION p12 VALUES LESS THAN (729389) ENGINE = InnoDB,
 PARTITION p13 VALUES LESS THAN (729754) ENGINE = InnoDB,
 PARTITION p14 VALUES LESS THAN (730119) ENGINE = InnoDB,
 PARTITION p15 VALUES LESS THAN (730484) ENGINE = InnoDB,
 PARTITION p16 VALUES LESS THAN (730850) ENGINE = InnoDB,
 PARTITION p17 VALUES LESS THAN (731215) ENGINE = InnoDB,
 PARTITION p18 VALUES LESS THAN (731580) ENGINE = InnoDB,
 PARTITION p19 VALUES LESS THAN (1096092) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `employees`
--

USE `employees`;

--
-- Final view structure for view `current_dept_emp`
--

/*!50001 DROP VIEW IF EXISTS `current_dept_emp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `current_dept_emp` AS select `l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`l`.`from_date` AS `from_date`,`l`.`to_date` AS `to_date` from (`dept_emp` `d` join `dept_emp_latest_date` `l` on(((`d`.`emp_no` = `l`.`emp_no`) and (`d`.`from_date` = `l`.`from_date`) and (`l`.`to_date` = `d`.`to_date`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dept_emp_latest_date`
--

/*!50001 DROP VIEW IF EXISTS `dept_emp_latest_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dept_emp_latest_date` AS select `dept_emp`.`emp_no` AS `emp_no`,max(`dept_emp`.`from_date`) AS `from_date`,max(`dept_emp`.`to_date`) AS `to_date` from `dept_emp` group by `dept_emp`.`emp_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17 11:28:57
