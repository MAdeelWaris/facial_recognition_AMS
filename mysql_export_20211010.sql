-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: student_management_system
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add attendance',7,'add_attendance'),(26,'Can change attendance',7,'change_attendance'),(27,'Can delete attendance',7,'delete_attendance'),(28,'Can view attendance',7,'view_attendance'),(29,'Can add courses',8,'add_courses'),(30,'Can change courses',8,'change_courses'),(31,'Can delete courses',8,'delete_courses'),(32,'Can view courses',8,'view_courses'),(33,'Can add session year model',9,'add_sessionyearmodel'),(34,'Can change session year model',9,'change_sessionyearmodel'),(35,'Can delete session year model',9,'delete_sessionyearmodel'),(36,'Can view session year model',9,'view_sessionyearmodel'),(37,'Can add subjects',10,'add_subjects'),(38,'Can change subjects',10,'change_subjects'),(39,'Can delete subjects',10,'delete_subjects'),(40,'Can view subjects',10,'view_subjects'),(41,'Can add students',11,'add_students'),(42,'Can change students',11,'change_students'),(43,'Can delete students',11,'delete_students'),(44,'Can view students',11,'view_students'),(45,'Can add staffs',12,'add_staffs'),(46,'Can change staffs',12,'change_staffs'),(47,'Can delete staffs',12,'delete_staffs'),(48,'Can view staffs',12,'view_staffs'),(49,'Can add notification student',13,'add_notificationstudent'),(50,'Can change notification student',13,'change_notificationstudent'),(51,'Can delete notification student',13,'delete_notificationstudent'),(52,'Can view notification student',13,'view_notificationstudent'),(53,'Can add notification staffs',14,'add_notificationstaffs'),(54,'Can change notification staffs',14,'change_notificationstaffs'),(55,'Can delete notification staffs',14,'delete_notificationstaffs'),(56,'Can view notification staffs',14,'view_notificationstaffs'),(57,'Can add attendance report',15,'add_attendancereport'),(58,'Can change attendance report',15,'change_attendancereport'),(59,'Can delete attendance report',15,'delete_attendancereport'),(60,'Can view attendance report',15,'view_attendancereport'),(61,'Can add admin hod',16,'add_adminhod'),(62,'Can change admin hod',16,'change_adminhod'),(63,'Can delete admin hod',16,'delete_adminhod'),(64,'Can view admin hod',16,'view_adminhod');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_student_m` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_student_m` FOREIGN KEY (`user_id`) REFERENCES `student_management_app_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(16,'student_management_app','adminhod'),(7,'student_management_app','attendance'),(15,'student_management_app','attendancereport'),(8,'student_management_app','courses'),(6,'student_management_app','customuser'),(14,'student_management_app','notificationstaffs'),(13,'student_management_app','notificationstudent'),(9,'student_management_app','sessionyearmodel'),(12,'student_management_app','staffs'),(11,'student_management_app','students'),(10,'student_management_app','subjects');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-08-08 13:43:48.756430'),(2,'contenttypes','0002_remove_content_type_name','2021-08-08 13:43:49.176056'),(3,'auth','0001_initial','2021-08-08 13:43:50.890834'),(4,'auth','0002_alter_permission_name_max_length','2021-08-08 13:43:51.193323'),(5,'auth','0003_alter_user_email_max_length','2021-08-08 13:43:51.229844'),(6,'auth','0004_alter_user_username_opts','2021-08-08 13:43:51.259825'),(7,'auth','0005_alter_user_last_login_null','2021-08-08 13:43:51.282810'),(8,'auth','0006_require_contenttypes_0002','2021-08-08 13:43:51.300806'),(9,'auth','0007_alter_validators_add_error_messages','2021-08-08 13:43:51.318788'),(10,'auth','0008_alter_user_username_max_length','2021-08-08 13:43:51.343773'),(11,'auth','0009_alter_user_last_name_max_length','2021-08-08 13:43:51.368760'),(12,'auth','0010_alter_group_name_max_length','2021-08-08 13:43:51.448709'),(13,'auth','0011_update_proxy_permissions','2021-08-08 13:43:51.499676'),(14,'auth','0012_alter_user_first_name_max_length','2021-08-08 13:43:51.559640'),(15,'student_management_app','0001_initial','2021-08-08 13:44:02.648166'),(16,'admin','0001_initial','2021-08-08 13:44:03.805827'),(17,'admin','0002_logentry_remove_auto_add','2021-08-08 13:44:03.851797'),(18,'admin','0003_logentry_add_action_flag_choices','2021-08-08 13:44:03.887775'),(19,'sessions','0001_initial','2021-08-08 13:44:04.046680');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8tmbol15pdpv40omuczxc7vm5mo4s5tv','.eJxVjEsOAiEQRO_C2hi-GXBpMucgDXTLRCETgZXx7jI7Z1evqvI-zMPo2Y-Gb78ldmOGXf67APGJ9RhaHwlr9wUqPLAcEfb9uhbYXvf5Wms6wdmToeUpsRAM2YUkaR4TBKFltBhJSqWFVuCCnGjAcJEI0QJF65Q1i3TckI7s-wPgeTsn:1mCnIF:DU98P2wRHHUsPfkXTj_pzA2vDBo4Z35nXPks5a32lvQ','2021-08-22 18:13:03.754672'),('cq82dbrgxnxkxmat4e16qfvvt2ses7pw','.eJxVjM0OwiAQhN-FszEUKT8eTfocZJddpFFIU-jJ-O62N3ubmW_yfUSAreewNV7DTOIulBOX_xEhvrgepPWNuPZQoMKTyxFhWa5Tgfn92F9TpVM5ezK0vEusjBLZe4LIVkEy3rMfWTuZyCAa7eLo0FoXSYPnwY1AAyq0McmbJhLfHwz4O9A:1mXd0R:_FKoCguYPkTdHcW1Y-WC81qScSWktFnluqnwvmcQSHE','2021-10-19 05:28:47.084408'),('j5stflc8yf9c937wgg2mhw3xr1o4f6w9','.eJxVjM0OgjAQhN-lZ2Poz0Lr0YTnaHa7WyFKQ2w5Gd9duMltZr7J91ERtzbFrco7zqxuyqjL_0aYnlIOUNvGUlpcsOBDliPiul7HBefXfX-NhU_l7JmwTrsENRgOg-6t0c5apyFLR-CQMWRrvaTE0DtiP1DyELiDLjuCQFoMSK--P6oROl0:1mCnLR:FtimawPHpaO8poF80m3_rMukstczYKvzKOh_cLLIRN8','2021-08-22 18:16:21.150296');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_adminhod`
--

DROP TABLE IF EXISTS `student_management_app_adminhod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_adminhod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `student_management_a_admin_id_2d75304f_fk_student_m` FOREIGN KEY (`admin_id`) REFERENCES `student_management_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_adminhod`
--

LOCK TABLES `student_management_app_adminhod` WRITE;
/*!40000 ALTER TABLE `student_management_app_adminhod` DISABLE KEYS */;
INSERT INTO `student_management_app_adminhod` VALUES (1,'2021-08-08 13:44:50.570697','2021-08-08 13:44:50.570697',1);
/*!40000 ALTER TABLE `student_management_app_adminhod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_attendance`
--

DROP TABLE IF EXISTS `student_management_app_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `session_year_id_id` int NOT NULL,
  `subject_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_session_year_id_id_0d30545d_fk_student_m` (`session_year_id_id`),
  KEY `student_management_a_subject_id_id_9ae82fd0_fk_student_m` (`subject_id_id`),
  CONSTRAINT `student_management_a_session_year_id_id_0d30545d_fk_student_m` FOREIGN KEY (`session_year_id_id`) REFERENCES `student_management_app_sessionyearmodel` (`id`),
  CONSTRAINT `student_management_a_subject_id_id_9ae82fd0_fk_student_m` FOREIGN KEY (`subject_id_id`) REFERENCES `student_management_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_attendance`
--

LOCK TABLES `student_management_app_attendance` WRITE;
/*!40000 ALTER TABLE `student_management_app_attendance` DISABLE KEYS */;
INSERT INTO `student_management_app_attendance` VALUES (1,'2021-08-08','2021-08-08 17:45:10.031847','2021-08-08 17:45:10.031847',1,1),(2,'2021-08-08','2021-08-08 18:17:05.061831','2021-08-08 18:17:05.061831',1,1),(3,'2021-10-05','2021-10-05 04:28:09.572573','2021-10-05 04:28:09.572573',1,2),(4,'2021-10-05','2021-10-05 04:29:15.175943','2021-10-05 04:29:15.175943',1,1),(5,'2021-10-05','2021-10-05 05:27:39.571989','2021-10-05 05:27:39.571989',1,3);
/*!40000 ALTER TABLE `student_management_app_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_attendancereport`
--

DROP TABLE IF EXISTS `student_management_app_attendancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_attendancereport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `attendance_id_id` int NOT NULL,
  `student_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_attendance_id_id_f765f2a1_fk_student_m` (`attendance_id_id`),
  KEY `student_management_a_student_id_id_5a58ceea_fk_student_m` (`student_id_id`),
  CONSTRAINT `student_management_a_attendance_id_id_f765f2a1_fk_student_m` FOREIGN KEY (`attendance_id_id`) REFERENCES `student_management_app_attendance` (`id`),
  CONSTRAINT `student_management_a_student_id_id_5a58ceea_fk_student_m` FOREIGN KEY (`student_id_id`) REFERENCES `student_management_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_attendancereport`
--

LOCK TABLES `student_management_app_attendancereport` WRITE;
/*!40000 ALTER TABLE `student_management_app_attendancereport` DISABLE KEYS */;
INSERT INTO `student_management_app_attendancereport` VALUES (1,1,'2021-08-08 17:45:10.042840','2021-08-08 17:45:10.042840',1,14),(2,1,'2021-08-08 17:45:10.054832','2021-08-08 17:45:10.054832',1,15),(3,1,'2021-08-08 17:45:10.066824','2021-08-08 17:45:10.066824',1,16),(4,0,'2021-08-08 18:17:05.085833','2021-08-08 18:17:05.085833',2,14),(5,0,'2021-08-08 18:17:05.101828','2021-08-08 18:17:05.101828',2,15),(6,1,'2021-08-08 18:17:05.109843','2021-08-08 18:17:05.109843',2,16),(7,1,'2021-10-05 04:28:09.582574','2021-10-05 04:28:09.582574',3,17),(8,0,'2021-10-05 04:29:15.200864','2021-10-05 04:29:15.200864',4,14),(9,0,'2021-10-05 04:29:15.210911','2021-10-05 04:29:15.210911',4,15),(10,1,'2021-10-05 04:29:15.218978','2021-10-05 04:29:15.218978',4,16),(11,0,'2021-10-05 05:27:39.590979','2021-10-05 05:27:39.590979',5,18);
/*!40000 ALTER TABLE `student_management_app_attendancereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_courses`
--

DROP TABLE IF EXISTS `student_management_app_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_courses`
--

LOCK TABLES `student_management_app_courses` WRITE;
/*!40000 ALTER TABLE `student_management_app_courses` DISABLE KEYS */;
INSERT INTO `student_management_app_courses` VALUES (1,'Class 6th','2021-08-08 13:47:03.599136','2021-08-08 13:47:03.600135'),(2,'Class 7th','2021-08-08 13:47:10.888073','2021-08-08 13:47:10.888073'),(3,'Class 8th','2021-08-08 13:47:22.610606','2021-08-08 13:47:22.610606'),(4,'Class 9th','2021-10-05 04:34:19.187030','2021-10-05 04:34:19.187030');
/*!40000 ALTER TABLE `student_management_app_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_customuser`
--

DROP TABLE IF EXISTS `student_management_app_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_customuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_customuser`
--

LOCK TABLES `student_management_app_customuser` WRITE;
/*!40000 ALTER TABLE `student_management_app_customuser` DISABLE KEYS */;
INSERT INTO `student_management_app_customuser` VALUES (1,'pbkdf2_sha256$260000$WzzNvMp9CxtsVYehvyrljo$iu8MJbBhlTgxEsBmoKjGpcn/FwEB+kwmI91LnXxqXeU=','2021-10-05 05:19:44.503398',1,'admin','admin','admin','admin@gmail.com',1,1,'2021-08-08 13:44:49.991614','1'),(2,'pbkdf2_sha256$260000$tRSDDr6Np2MY7STsmQ84gX$3eddoCOMzjkl2EaZWnQIw1PEcqpxMks2uc2M3YD42TU=','2021-10-05 05:25:25.686070',0,'Shahzad1','Shahzad','Akbar','shahzad@gmail.com',0,1,'2021-08-08 13:49:08.829204','2'),(3,'pbkdf2_sha256$260000$g499EpgPASMsghqAi4f4QO$q7P34FHFToT9iy1j1w+fTBxxZgBQRFru1O7q7VZlqSM=',NULL,0,'waseem1','Waseem','Khan','waseem@gmail.com',0,1,'2021-08-08 13:49:42.877442','2'),(4,'pbkdf2_sha256$260000$TsJMt2ET6XMECe7d3BH58E$esbBFJ/JRzjiQdZC5hiZGBQsSAzrd1rrsiTucD2AgrI=',NULL,0,'jameel1','Jameel','Akhtar','jameel@gmail.com',0,1,'2021-08-08 13:50:24.580040','2'),(5,'pbkdf2_sha256$260000$enFytzdDozIOUFSxWE3yYH$MIzrLCGIi461wMgTaYiWXaxH2Smpb0F+H8+kqzst3Tc=','2021-08-08 18:13:03.740744',0,'waris1','Waris','Khan','waris@gmail.com',0,1,'2021-08-08 13:51:04.281412','2'),(6,'pbkdf2_sha256$260000$jrs0PBRaog6pDM7U1hOk9Q$j2CRCauKEqCKsud0d5f/mxxoO9E1Yq11LZBctmz0e9Q=',NULL,0,'mushtaq1','Mushtaq','Ahmad','mushtaq@gmail.com',0,1,'2021-08-08 13:52:14.828214','2'),(22,'pbkdf2_sha256$260000$Eqp2KK2exRVD9xVO1bS0Sc$TLLCFpDaGpMLMCI7GhT+UobAN7X3XccwWqfv2GTLp98=','2021-10-04 21:59:15.924043',0,'sajjad6','Sajjad','Akbar','sajjad6@gmail.com',0,1,'2021-08-08 17:18:11.843153','3'),(23,'pbkdf2_sha256$260000$1DVVIAwfktXWAlG3zIELJl$GXBmTHDZMNEeW8bdkfs3eqVubnlgXtW9G1YqRl1z604=',NULL,0,'ikram6','Ikram','Hanif','ikram6@gmail.com',0,1,'2021-08-08 17:20:35.040907','3'),(24,'pbkdf2_sha256$260000$gR9drHfCMVAmMeu9A7R0mn$Ax/8TyUI9GDQ8hHsmW23/ZgLM41YY2hr0UwhzE1i9DE=','2021-08-08 18:14:45.277078',0,'adeel6','Adeel','Waris','adeel6@gmail.com',0,1,'2021-08-08 17:24:22.246463','3'),(25,'pbkdf2_sha256$260000$EuE2DGgyfe5KdQRax4SeVN$CEIMGhi1L84cR0ik0XKtDYZbMT5ZJZ9+tkuTsmP5nuU=','2021-10-05 04:41:44.170936',0,'adeel_waris','adeel','waris','adeel7@gmail.com',0,1,'2021-10-05 04:26:10.710086','3'),(26,'pbkdf2_sha256$260000$QrQccoAB7jBGHJwJn5NR23$Whha7n8lTP+wPPH98zhsxFJtQxBlfRssu2s4qE8nwpA=','2021-10-05 04:38:52.101484',0,'abdullah','abdullah','nisar','abdullah@gmail.com',0,1,'2021-10-05 04:33:38.066677','2'),(27,'pbkdf2_sha256$260000$gQ4naFVI4uXp5F7CUQaZyT$Qxcs4cTvnCP5Fj20F6VKQUu+UklFV4ERNzPGAKVnrn0=',NULL,0,'ssg','sg','ssg','ssg@gmail.com',0,1,'2021-10-05 05:20:22.690181','2'),(28,'pbkdf2_sha256$260000$ild3KzMWIf73CZcx2Ofmzi$YzQWOLuTzS6UEciaIz1FCcwRrTEg0CmxQOR61YTjTlE=','2021-10-05 05:28:47.073417',0,'moeen_1','moeen','moeen','moeen@gmail.com',0,1,'2021-10-05 05:21:45.208022','3');
/*!40000 ALTER TABLE `student_management_app_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_customuser_groups`
--

DROP TABLE IF EXISTS `student_management_app_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_customuser_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customuser_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_management_app_c_customuser_id_group_id_d872a780_uniq` (`customuser_id`,`group_id`),
  KEY `student_management_a_group_id_61accfd6_fk_auth_grou` (`group_id`),
  CONSTRAINT `student_management_a_customuser_id_1e347552_fk_student_m` FOREIGN KEY (`customuser_id`) REFERENCES `student_management_app_customuser` (`id`),
  CONSTRAINT `student_management_a_group_id_61accfd6_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_customuser_groups`
--

LOCK TABLES `student_management_app_customuser_groups` WRITE;
/*!40000 ALTER TABLE `student_management_app_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_management_app_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_customuser_user_permissions`
--

DROP TABLE IF EXISTS `student_management_app_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_customuser_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customuser_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_management_app_c_customuser_id_permission_af9a6989_uniq` (`customuser_id`,`permission_id`),
  KEY `student_management_a_permission_id_cd344297_fk_auth_perm` (`permission_id`),
  CONSTRAINT `student_management_a_customuser_id_41a474d7_fk_student_m` FOREIGN KEY (`customuser_id`) REFERENCES `student_management_app_customuser` (`id`),
  CONSTRAINT `student_management_a_permission_id_cd344297_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_customuser_user_permissions`
--

LOCK TABLES `student_management_app_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `student_management_app_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_management_app_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_notificationstaffs`
--

DROP TABLE IF EXISTS `student_management_app_notificationstaffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_notificationstaffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `staff_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_staff_id_id_2d336ab5_fk_student_m` (`staff_id_id`),
  CONSTRAINT `student_management_a_staff_id_id_2d336ab5_fk_student_m` FOREIGN KEY (`staff_id_id`) REFERENCES `student_management_app_staffs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_notificationstaffs`
--

LOCK TABLES `student_management_app_notificationstaffs` WRITE;
/*!40000 ALTER TABLE `student_management_app_notificationstaffs` DISABLE KEYS */;
INSERT INTO `student_management_app_notificationstaffs` VALUES (1,'This Message is just for Testing Purpose','2021-08-08 18:11:04.958612','2021-08-08 18:11:04.958612',4),(2,'For Testing','2021-10-05 04:38:16.151046','2021-10-05 04:38:16.151046',6),(3,'Testing','2021-10-05 05:24:58.036165','2021-10-05 05:24:58.036165',7);
/*!40000 ALTER TABLE `student_management_app_notificationstaffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_notificationstudent`
--

DROP TABLE IF EXISTS `student_management_app_notificationstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_notificationstudent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_student_id_id_f8c05ed7_fk_student_m` (`student_id_id`),
  CONSTRAINT `student_management_a_student_id_id_f8c05ed7_fk_student_m` FOREIGN KEY (`student_id_id`) REFERENCES `student_management_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_notificationstudent`
--

LOCK TABLES `student_management_app_notificationstudent` WRITE;
/*!40000 ALTER TABLE `student_management_app_notificationstudent` DISABLE KEYS */;
INSERT INTO `student_management_app_notificationstudent` VALUES (1,'This Message is just for Testing Purpose','2021-08-08 18:11:19.777765','2021-08-08 18:11:19.777765',16),(2,'Testing','2021-10-05 04:38:36.021357','2021-10-05 04:38:36.021357',17);
/*!40000 ALTER TABLE `student_management_app_notificationstudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_sessionyearmodel`
--

DROP TABLE IF EXISTS `student_management_app_sessionyearmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_sessionyearmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_start_year` date NOT NULL,
  `session_end_year` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_sessionyearmodel`
--

LOCK TABLES `student_management_app_sessionyearmodel` WRITE;
/*!40000 ALTER TABLE `student_management_app_sessionyearmodel` DISABLE KEYS */;
INSERT INTO `student_management_app_sessionyearmodel` VALUES (1,'2021-01-01','2021-12-31'),(2,'2021-06-05','2021-12-05');
/*!40000 ALTER TABLE `student_management_app_sessionyearmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_staffs`
--

DROP TABLE IF EXISTS `student_management_app_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_staffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fcm_token` longtext NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `student_management_a_admin_id_5bfdd57d_fk_student_m` FOREIGN KEY (`admin_id`) REFERENCES `student_management_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_staffs`
--

LOCK TABLES `student_management_app_staffs` WRITE;
/*!40000 ALTER TABLE `student_management_app_staffs` DISABLE KEYS */;
INSERT INTO `student_management_app_staffs` VALUES (1,'Islamabad','2021-08-08 13:49:09.360083','2021-08-08 13:49:09.360083','',2),(2,'Islmabad','2021-08-08 13:49:43.387241','2021-08-08 13:49:43.387241','',3),(3,'Islamabad','2021-08-08 13:50:25.102835','2021-08-08 13:50:25.103835','',4),(4,'Islamabad','2021-08-08 13:51:04.813227','2021-08-08 13:51:04.814227','',5),(5,'Islamabad','2021-08-08 13:52:15.276040','2021-08-08 13:52:15.276040','',6),(6,'qau','2021-10-05 04:33:38.428745','2021-10-05 04:33:38.428745','',26),(7,'qau','2021-10-05 05:20:23.365350','2021-10-05 05:20:23.366349','',27);
/*!40000 ALTER TABLE `student_management_app_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_students`
--

DROP TABLE IF EXISTS `student_management_app_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(255) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fcm_token` longtext NOT NULL,
  `admin_id` int NOT NULL,
  `course_id_id` int NOT NULL,
  `session_year_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `student_management_a_course_id_id_fcd09bed_fk_student_m` (`course_id_id`),
  KEY `student_management_a_session_year_id_id_594fc55d_fk_student_m` (`session_year_id_id`),
  CONSTRAINT `student_management_a_admin_id_1a8517ae_fk_student_m` FOREIGN KEY (`admin_id`) REFERENCES `student_management_app_customuser` (`id`),
  CONSTRAINT `student_management_a_course_id_id_fcd09bed_fk_student_m` FOREIGN KEY (`course_id_id`) REFERENCES `student_management_app_courses` (`id`),
  CONSTRAINT `student_management_a_session_year_id_id_594fc55d_fk_student_m` FOREIGN KEY (`session_year_id_id`) REFERENCES `student_management_app_sessionyearmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_students`
--

LOCK TABLES `student_management_app_students` WRITE;
/*!40000 ALTER TABLE `student_management_app_students` DISABLE KEYS */;
INSERT INTO `student_management_app_students` VALUES (14,'Male','/media/cover_2Dd2ceC.jpg','Islamabad','2021-08-08 17:18:12.216160','2021-08-08 17:18:12.216160','',22,1,1),(15,'Male','/media/cover_Z07mZn2.jpg','islamabad','2021-08-08 17:20:35.433670','2021-08-08 17:20:35.433670','',23,1,1),(16,'Male','/media/cover_iz1Xsgj.jpg','islamabad','2021-08-08 17:24:22.628220','2021-08-08 17:24:22.628220','',24,1,1),(17,'Male','/media/cover_ArZ8OPG.jpg','qau','2021-10-05 04:26:11.120019','2021-10-05 04:26:11.120019','',25,2,1),(18,'Male','/media/cover_pkfqgAB.jpg','qau','2021-10-05 05:21:45.979545','2021-10-05 05:21:45.979545','',28,3,1);
/*!40000 ALTER TABLE `student_management_app_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_management_app_subjects`
--

DROP TABLE IF EXISTS `student_management_app_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_management_app_subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_id_id` int NOT NULL,
  `staff_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_management_a_course_id_id_342668dd_fk_student_m` (`course_id_id`),
  KEY `student_management_a_staff_id_id_5f47119a_fk_student_m` (`staff_id_id`),
  CONSTRAINT `student_management_a_course_id_id_342668dd_fk_student_m` FOREIGN KEY (`course_id_id`) REFERENCES `student_management_app_courses` (`id`),
  CONSTRAINT `student_management_a_staff_id_id_5f47119a_fk_student_m` FOREIGN KEY (`staff_id_id`) REFERENCES `student_management_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_management_app_subjects`
--

LOCK TABLES `student_management_app_subjects` WRITE;
/*!40000 ALTER TABLE `student_management_app_subjects` DISABLE KEYS */;
INSERT INTO `student_management_app_subjects` VALUES (1,'Science','2021-08-08 13:54:24.137514','2021-08-08 13:54:24.137514',1,2),(2,'Science','2021-08-08 13:54:33.383949','2021-08-08 13:54:33.383949',2,2),(3,'Science','2021-08-08 13:54:41.630460','2021-08-08 13:54:41.630460',3,2),(4,'Mathematics','2021-08-08 13:54:52.520643','2021-08-08 13:54:52.520643',1,3),(5,'Mathematics','2021-08-08 13:55:14.360503','2021-08-08 13:55:14.360503',2,3),(6,'Mathematics','2021-08-08 13:55:26.994199','2021-08-08 13:55:26.994199',3,3),(7,'English','2021-08-08 13:55:37.451363','2021-08-08 13:55:37.451363',1,4),(8,'English','2021-08-08 13:55:45.930699','2021-08-08 13:55:45.930699',2,4),(9,'English','2021-08-08 13:55:54.034400','2021-08-08 13:55:54.034400',3,4),(10,'Pak Studies','2021-08-08 13:56:09.168391','2021-08-08 13:56:09.168391',1,5),(11,'Pak Studies','2021-08-08 13:56:20.041661','2021-08-08 13:56:20.041661',2,5),(12,'Pak Studies','2021-08-08 13:56:31.670738','2021-08-08 13:56:31.670738',3,5),(13,'Urdu','2021-08-08 13:56:42.752379','2021-08-08 13:56:42.752379',1,5),(14,'Urdu','2021-08-08 13:56:52.401179','2021-08-08 13:56:52.401179',2,5),(15,'Urdu','2021-08-08 13:57:01.215610','2021-08-08 13:57:01.215610',3,5),(16,'Chemistry','2021-08-08 13:57:33.828561','2021-08-08 13:57:33.828561',1,6),(17,'Chemistry','2021-08-08 13:57:44.895461','2021-08-08 13:57:44.895461',2,6),(18,'Chemistry','2021-08-08 13:57:51.791308','2021-08-08 13:57:51.791308',3,6),(19,'Geography','2021-10-05 04:34:46.854882','2021-10-05 04:34:46.854882',4,26),(20,'Pak Study','2021-10-05 05:23:51.636565','2021-10-05 05:23:51.637569',3,27);
/*!40000 ALTER TABLE `student_management_app_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10 21:34:31
