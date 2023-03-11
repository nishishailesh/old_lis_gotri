-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: biochemistry
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

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
-- Table structure for table `Date_of_entry`
--

DROP TABLE IF EXISTS `Date_of_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Date_of_entry` (
  `Date_of_entry` date NOT NULL,
  PRIMARY KEY (`Date_of_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reportable_range`
--

DROP TABLE IF EXISTS `Reportable_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reportable_range` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `abnormal_alert`
--

DROP TABLE IF EXISTS `abnormal_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abnormal_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checklist_daily`
--

DROP TABLE IF EXISTS `checklist_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_daily` (
  `Date_of_entry` date NOT NULL,
  `Remark` varchar(100) NOT NULL,
  `Reagent_refilling_(morning)` varchar(20) NOT NULL,
  `Internal_QC_CAL_Maintenance_ERBA_XL640_(morning)` varchar(20) NOT NULL,
  `QC_Comment_Erba_XL640(Morning)` varchar(15) NOT NULL,
  `Internal_QC_MUIRA_(morning)` varchar(20) NOT NULL,
  `QC_Comment_Muira(Morning)` varchar(15) NOT NULL,
  `HDL_QC_ERBA_XL640_(morning)` varchar(20) NOT NULL,
  `Refrigerator_temperature_(morning)` varchar(20) NOT NULL,
  `Environmental_Parameters_(morning)` varchar(20) NOT NULL,
  `Equipment_log_(morning)` varchar(20) NOT NULL,
  `External_QC(10-20)_(morning)` varchar(20) NOT NULL,
  `Internal_QC_CAL_Maintenance_ERBA_XL640_(evening)` varchar(20) NOT NULL,
  `QC_Comment_Erba_XL640(Evening)` varchar(15) NOT NULL,
  `Internal_QC_MUIRA_(Evening)` varchar(20) NOT NULL,
  `QC_Comment_Miura(Evening)` varchar(15) NOT NULL,
  `Refrigerator_temperature_(Evening)` varchar(20) NOT NULL,
  `Environmental_Parameters_(Evening)` varchar(20) NOT NULL,
  `Reset_ID_(1)` varchar(10) NOT NULL,
  `Print_IDs_Ward_OPD(25-30)` varchar(10) NOT NULL,
  `Dutylist(25-30)` varchar(20) NOT NULL,
  `Backup_checked` varchar(10) NOT NULL,
  `Restored` varchar(10) NOT NULL,
  `Turn_Around_Time` varchar(50) NOT NULL,
  PRIMARY KEY (`Date_of_entry`),
  UNIQUE KEY `Date_of_entry_2` (`Date_of_entry`),
  KEY `Date_of_entry` (`Date_of_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinician`
--

DROP TABLE IF EXISTS `clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinician` (
  `clinician` varchar(30) NOT NULL,
  PRIMARY KEY (`clinician`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `critical_alert`
--

DROP TABLE IF EXISTS `critical_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `critical_alert` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `result` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `name_of_examination` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) DEFAULT NULL,
  `sample_type` varchar(20) NOT NULL,
  `preservative` varchar(30) NOT NULL,
  `method_of_analysis` varchar(35) NOT NULL,
  `analyzer` varchar(50) NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sample_id`,`id`),
  KEY `sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examination.new`
--

DROP TABLE IF EXISTS `examination.new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination.new` (
  `result` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `name_of_examination` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) DEFAULT NULL,
  `sample_type` varchar(20) NOT NULL,
  `preservative` varchar(30) NOT NULL,
  `method_of_analysis` varchar(30) NOT NULL,
  `sample_id` bigint(12) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sample_id`,`id`),
  KEY `result` (`result`),
  KEY `unit` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `Date_of_entry` date NOT NULL,
  `Remark` varchar(100) NOT NULL,
  `Reagent_refilling_(morning)` varchar(20) NOT NULL,
  `Internal_QC_CAL_Maintenance_ERBA_XL640_(morning)` varchar(20) NOT NULL,
  `QC_Comment_Erba_XL640(Morning)` varchar(15) NOT NULL,
  `Internal_QC_MUIRA_(morning)` varchar(20) NOT NULL,
  `QC_Comment_Muira(Morning)` varchar(15) NOT NULL,
  `HDL_QC_ERBA_XL640_(morning)` varchar(20) NOT NULL,
  `Refrigerator_temperature_(morning)` varchar(20) NOT NULL,
  `Environmental_Parameters_(morning)` varchar(20) NOT NULL,
  `Equipment_log_(morning)` varchar(20) NOT NULL,
  `External_QC(10-20)_(morning)` varchar(20) NOT NULL,
  `Internal_QC_CAL_Maintenance_ERBA_XL640_(evening)` varchar(20) NOT NULL,
  `QC_Comment_Erba_XL640(Evening)` varchar(15) NOT NULL,
  `Internal_QC_MUIRA_(Evening)` varchar(20) NOT NULL,
  `QC_Comment_Miura(Evening)` varchar(15) NOT NULL,
  `Refrigerator_temperature_(Evening)` varchar(20) NOT NULL,
  `Environmental_Parameters_(Evening)` varchar(20) NOT NULL,
  `Reset_ID_(1)` varchar(10) NOT NULL,
  `Print_IDs_Ward_OPD(25-30)` varchar(10) NOT NULL,
  `Dutylist(25-30)` varchar(20) NOT NULL,
  `Backup_checked` varchar(10) NOT NULL,
  `Restored` varchar(10) NOT NULL,
  `Turn_Around_Time` varchar(50) NOT NULL,
  PRIMARY KEY (`Date_of_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_incharge`
--

DROP TABLE IF EXISTS `lab_incharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_incharge` (
  `id` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location` varchar(30) NOT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_trace`
--

DROP TABLE IF EXISTS `login_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_trace` (
  `login_time` varchar(20) NOT NULL,
  `login_id` varchar(15) NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preservative`
--

DROP TABLE IF EXISTS `preservative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preservative` (
  `preservative` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile` varchar(50) NOT NULL,
  `T1` int(11) DEFAULT NULL,
  `T2` int(11) DEFAULT NULL,
  `T3` int(11) DEFAULT NULL,
  `T4` int(11) DEFAULT NULL,
  `T5` int(11) DEFAULT NULL,
  `T6` int(11) DEFAULT NULL,
  `T7` int(11) DEFAULT NULL,
  `T8` int(11) DEFAULT NULL,
  `T9` int(11) DEFAULT NULL,
  `T10` int(11) DEFAULT NULL,
  `T11` int(11) DEFAULT NULL,
  `T12` int(11) DEFAULT NULL,
  `sample_type` varchar(30) DEFAULT NULL,
  `preservative` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc`
--

DROP TABLE IF EXISTS `qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc` (
  `qc_id` int(11) NOT NULL,
  `repeat` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL DEFAULT '',
  `result` varchar(30) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qc_id`,`repeat`,`ex_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_old`
--

DROP TABLE IF EXISTS `qc_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_old` (
  `qc_id` int(11) NOT NULL,
  `repeat` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL DEFAULT '',
  `result` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`qc_id`,`repeat`,`ex_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_other`
--

DROP TABLE IF EXISTS `qc_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_other` (
  `qc_id` int(11) NOT NULL,
  `repeat` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL DEFAULT '',
  `result` varchar(30) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qc_id`,`repeat`,`ex_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_target`
--

DROP TABLE IF EXISTS `qc_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_target` (
  `qc_type` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`qc_type`,`ex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_target_other`
--

DROP TABLE IF EXISTS `qc_target_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_target_other` (
  `qc_type` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`qc_type`,`ex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_target_xl`
--

DROP TABLE IF EXISTS `qc_target_xl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_target_xl` (
  `qc_type` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`qc_type`,`ex_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qc_xl`
--

DROP TABLE IF EXISTS `qc_xl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_xl` (
  `qc_id` int(11) NOT NULL,
  `repeat` int(11) NOT NULL,
  `ex_code` varchar(30) NOT NULL DEFAULT '',
  `result` varchar(30) DEFAULT NULL,
  `target` varchar(30) DEFAULT NULL,
  `sd` varchar(30) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`qc_id`,`repeat`,`ex_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr` (
  `name` varchar(50) NOT NULL,
  `qr` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_06_environment_parameters`
--

DROP TABLE IF EXISTS `record_2011_06_environment_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_06_environment_parameters` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_06_equipment_log`
--

DROP TABLE IF EXISTS `record_2011_06_equipment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_06_equipment_log` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_06_refrigerator_temperature`
--

DROP TABLE IF EXISTS `record_2011_06_refrigerator_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_06_refrigerator_temperature` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_07_environmental_parameters`
--

DROP TABLE IF EXISTS `record_2011_07_environmental_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_07_environmental_parameters` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(100) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_07_equipment_log`
--

DROP TABLE IF EXISTS `record_2011_07_equipment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_07_equipment_log` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_07_refrigerator_temperature`
--

DROP TABLE IF EXISTS `record_2011_07_refrigerator_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_07_refrigerator_temperature` (
  `f0` int(11) NOT NULL AUTO_INCREMENT,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_08_environmental_parameters`
--

DROP TABLE IF EXISTS `record_2011_08_environmental_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_08_environmental_parameters` (
  `f0` int(11) NOT NULL,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_08_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_08_equipment_log`
--

DROP TABLE IF EXISTS `record_2011_08_equipment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_08_equipment_log` (
  `f0` int(11) NOT NULL,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='equipment_log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_2011_08_refrigerator_temperature`
--

DROP TABLE IF EXISTS `record_2011_08_refrigerator_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_2011_08_refrigerator_temperature` (
  `f0` int(11) NOT NULL,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record_YYYY_MM_refrigerator_temperature Blank`
--

DROP TABLE IF EXISTS `record_YYYY_MM_refrigerator_temperature Blank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_YYYY_MM_refrigerator_temperature Blank` (
  `f0` int(11) NOT NULL,
  `f1` varchar(50) NOT NULL,
  `f2` varchar(50) NOT NULL,
  `f3` varchar(50) NOT NULL,
  `f4` varchar(50) NOT NULL,
  `f5` varchar(50) NOT NULL,
  `f6` varchar(50) NOT NULL,
  `f7` varchar(50) NOT NULL,
  `f8` varchar(50) NOT NULL,
  `f9` varchar(50) NOT NULL,
  `f10` varchar(50) NOT NULL,
  `f11` varchar(50) NOT NULL,
  `f12` varchar(50) NOT NULL,
  `f13` varchar(50) NOT NULL,
  `f14` varchar(50) NOT NULL,
  `f15` varchar(50) NOT NULL,
  `f16` varchar(50) NOT NULL,
  `f17` varchar(50) NOT NULL,
  `f18` varchar(50) NOT NULL,
  `f19` varchar(50) NOT NULL,
  `f20` varchar(50) NOT NULL,
  `f21` varchar(50) NOT NULL,
  `f22` varchar(50) NOT NULL,
  `f23` varchar(50) NOT NULL,
  `f24` varchar(50) NOT NULL,
  `f25` varchar(50) NOT NULL,
  `f26` varchar(50) NOT NULL,
  `f27` varchar(50) NOT NULL,
  `f28` varchar(50) NOT NULL,
  `f29` varchar(50) NOT NULL,
  `f30` varchar(50) NOT NULL,
  PRIMARY KEY (`f0`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='record_refrigerator_01_2011';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_summary_header`
--

DROP TABLE IF EXISTS `report_summary_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_summary_header` (
  `header` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportable_range`
--

DROP TABLE IF EXISTS `reportable_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportable_range` (
  `code` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `operator` varchar(20) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`,`sample_type`,`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `sample_id` bigint(12) NOT NULL,
  `patient_id` varchar(40) DEFAULT NULL,
  `patient_name` varchar(40) DEFAULT NULL,
  `clinician` varchar(30) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `sample_type` varchar(30) DEFAULT NULL,
  `preservative` varchar(30) DEFAULT NULL,
  `sample_details` varchar(30) DEFAULT NULL,
  `urgent` varchar(30) DEFAULT NULL,
  `sample_receipt_time` varchar(40) DEFAULT NULL,
  `details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_details`
--

DROP TABLE IF EXISTS `sample_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_details` (
  `sample_details` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_trace`
--

DROP TABLE IF EXISTS `sample_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_trace` (
  `sample_id` int(10) NOT NULL,
  `entry_by` varchar(12) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_type`
--

DROP TABLE IF EXISTS `sample_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_type` (
  `sample_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_verification`
--

DROP TABLE IF EXISTS `sample_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_verification` (
  `sample_id` bigint(12) NOT NULL,
  `technician` varchar(40) NOT NULL DEFAULT 'Verification_pending',
  `sign_first` varchar(100) NOT NULL DEFAULT 'Verification_pending',
  `sign` varchar(100) NOT NULL DEFAULT 'Verification_pending',
  `sign_time` varchar(40) DEFAULT NULL,
  `sign_time_last` varchar(40) DEFAULT NULL,
  `sign_3` varchar(100) DEFAULT NULL,
  `sign_3_time` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope`
--

DROP TABLE IF EXISTS `scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope` (
  `result` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `name_of_examination` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) DEFAULT NULL,
  `sample_type` varchar(20) NOT NULL,
  `preservative` varchar(30) NOT NULL,
  `method_of_analysis` varchar(40) NOT NULL,
  `analyzer` varchar(50) NOT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `critical_high` float NOT NULL,
  `critical_low` float NOT NULL,
  `Available` varchar(20) NOT NULL,
  `NABL_Accredited` varchar(20) NOT NULL,
  `details` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scope_original`
--

DROP TABLE IF EXISTS `scope_original`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_original` (
  `result` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `name_of_examination` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `referance_range` varchar(200) DEFAULT NULL,
  `sample_type` varchar(20) NOT NULL,
  `preservative` varchar(30) NOT NULL,
  `method_of_analysis` varchar(30) NOT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signature_a`
--

DROP TABLE IF EXISTS `signature_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_a` (
  `id` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signature_authority`
--

DROP TABLE IF EXISTS `signature_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_authority` (
  `login_name` varchar(15) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `grade` int(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`login_name`),
  KEY `sign` (`sign`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signature_t`
--

DROP TABLE IF EXISTS `signature_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_t` (
  `id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sop`
--

DROP TABLE IF EXISTS `sop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sop` (
  `Name of SOP` varchar(2000) DEFAULT NULL,
  `Sub-Name of SOP` varchar(2000) DEFAULT NULL,
  `Code` varchar(10) NOT NULL,
  `General Remarks` varchar(2000) DEFAULT NULL,
  `A. Purpose of examination` varchar(2000) DEFAULT NULL,
  `B. Principle of examination` varchar(2000) DEFAULT NULL,
  `C. Performance specifications` varchar(2000) DEFAULT NULL,
  `D. Sample type required` varchar(2000) DEFAULT NULL,
  `E. Preservatives needed` varchar(2000) DEFAULT NULL,
  `F. Reagents required` varchar(2000) DEFAULT NULL,
  `G. Calibration method` varchar(2000) DEFAULT NULL,
  `H. Detailed work bench instruction / programming steps` varchar(2000) DEFAULT NULL,
  `I. Quality control procedure` varchar(2000) DEFAULT NULL,
  `J. Interferences` varchar(2000) DEFAULT NULL,
  `K. Calculation of results and uncertainty` varchar(2000) DEFAULT NULL,
  `L. Biological reference interval` varchar(2000) DEFAULT NULL,
  `M. Reportable interval for examination results` varchar(2000) DEFAULT NULL,
  `N. Critical values` varchar(2000) DEFAULT NULL,
  `O. Interpretation by the laboratory` varchar(2000) DEFAULT NULL,
  `P. Potential sources of variability` varchar(2000) DEFAULT NULL,
  `Cross-References` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit` varchar(30) NOT NULL,
  PRIMARY KEY (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `urgent`
--

DROP TABLE IF EXISTS `urgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urgent` (
  `urgent` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-11 12:24:10
