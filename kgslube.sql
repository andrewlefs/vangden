-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kgslube
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add category',6,'add_category'),(17,'Can change category',6,'change_category'),(18,'Can delete category',6,'delete_category'),(19,'Can add catalogue',7,'add_catalogue'),(20,'Can change catalogue',7,'change_catalogue'),(21,'Can delete catalogue',7,'delete_catalogue'),(22,'Can add Post',8,'add_post'),(23,'Can change Post',8,'change_post'),(24,'Can delete Post',8,'delete_post'),(25,'Can add product',9,'add_product'),(26,'Can change product',9,'change_product'),(27,'Can delete product',9,'delete_product'),(28,'Can add site',10,'add_site'),(29,'Can change site',10,'change_site'),(30,'Can delete site',10,'delete_site'),(31,'Can add url',11,'add_url'),(32,'Can change url',11,'change_url'),(33,'Can delete url',11,'delete_url'),(34,'Can add rule',12,'add_rule'),(35,'Can change rule',12,'change_rule'),(36,'Can delete rule',12,'delete_rule');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$1MXd0KoL1n0I$pWj/d2TQvE+IcqLytwV7rxCKc2K3O036jnxcKBvaVzQ=','2016-02-25 02:30:06',1,'tuanquanghpvn','','','tuanquanghpvn@gmail.com',1,1,'2016-02-18 08:15:34');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue`
--

DROP TABLE IF EXISTS `catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_parent_id_04dd888d_fk_catalogue_id` (`parent_id`),
  KEY `catalogue_2dbcba41` (`slug`),
  CONSTRAINT `catalogue_parent_id_04dd888d_fk_catalogue_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue`
--

LOCK TABLES `catalogue` WRITE;
/*!40000 ALTER TABLE `catalogue` DISABLE KEYS */;
INSERT INTO `catalogue` VALUES (11,'Total','total','','2016-02-24 14:48:49','2016-02-24 14:50:29',16),(12,'BP','bp','','2016-02-24 14:48:58','2016-02-24 14:51:02',16),(13,'Black Gold','black-gold','','2016-02-24 14:49:07','2016-02-24 14:51:18',16),(14,'Castrol','castrol','','2016-02-24 14:49:15','2016-02-24 14:51:09',16),(15,'Petrolimex','petrolimex','','2016-02-24 14:49:24','2016-02-24 14:50:44',16),(16,'Dầu nhờn','dau-nhon','','2016-02-24 14:50:11','2016-02-24 14:50:11',NULL);
/*!40000 ALTER TABLE `catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'Tin công ty','tin-cong-ty','','2016-02-24 15:01:34','2016-02-24 15:01:34');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(7,'catalogues','catalogue'),(6,'categories','category'),(4,'contenttypes','contenttype'),(8,'posts','post'),(9,'products','product'),(12,'robots','rule'),(11,'robots','url'),(5,'sessions','session'),(10,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-02-18 08:13:54'),(2,'contenttypes','0002_remove_content_type_name','2016-02-18 08:13:55'),(3,'auth','0001_initial','2016-02-18 08:13:58'),(4,'auth','0002_alter_permission_name_max_length','2016-02-18 08:13:59'),(5,'auth','0003_alter_user_email_max_length','2016-02-18 08:13:59'),(6,'auth','0004_alter_user_username_opts','2016-02-18 08:13:59'),(7,'auth','0005_alter_user_last_login_null','2016-02-18 08:14:00'),(8,'auth','0006_require_contenttypes_0002','2016-02-18 08:14:00'),(9,'auth','0007_alter_validators_add_error_messages','2016-02-18 08:14:00'),(10,'catalogues','0001_initial','2016-02-18 08:14:00'),(11,'categories','0001_initial','2016-02-18 08:14:01'),(12,'categories','0002_remove_category_type','2016-02-18 08:14:01'),(13,'posts','0001_initial','2016-02-18 08:14:02'),(14,'posts','0002_auto_20160215_0620','2016-02-18 08:14:02'),(15,'posts','0003_auto_20160215_0629','2016-02-18 08:14:02'),(16,'products','0001_initial','2016-02-18 08:14:02'),(17,'products','0002_auto_20160215_0620','2016-02-18 08:14:02'),(18,'products','0003_auto_20160215_0629','2016-02-18 08:14:02'),(19,'sessions','0001_initial','2016-02-18 08:14:03'),(20,'products','0004_auto_20160219_0845','2016-02-19 08:45:21'),(21,'sites','0001_initial','2016-02-24 13:47:37'),(22,'robots','0001_initial','2016-02-24 13:47:37'),(23,'sites','0002_alter_domain_unique','2016-02-24 13:47:37'),(24,'products','0005_auto_20160225_0226','2016-02-25 02:29:43');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('58166xmtipv1pmei9nt8r8je3iz8uw4p','ZmM0NzA2NmJmOWFjODc0NDA3OTczOWI2MmRiYzRkODJmMGU2NWM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjU5YjFkOTIyYmJmZDBjY2JkY2IxMDlkZWNkM2U3ZTQxNzAyZWU4In0=','2016-02-18 10:27:57'),('7geunltkwq9zrafwtv9elmh4heqek7hg','ZmM0NzA2NmJmOWFjODc0NDA3OTczOWI2MmRiYzRkODJmMGU2NWM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjU5YjFkOTIyYmJmZDBjY2JkY2IxMDlkZWNkM2U3ZTQxNzAyZWU4In0=','2016-02-18 10:52:26'),('7lpi3pojp46rn51ngccc5dwkfj286ej8','YzE5OTU0MmI3YjY3OTA2ZGZmYzA4ZjE3MWJlNjk1ZWUwZjRiOTQyZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjY1OWIxZDkyMmJiZmQwY2NiZGNiMTA5ZGVjZDNlN2U0MTcwMmVlOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-02-25 03:30:06'),('dwgav7x0hl7x7zw6zvqstbw5ng289c54','ZmM0NzA2NmJmOWFjODc0NDA3OTczOWI2MmRiYzRkODJmMGU2NWM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjU5YjFkOTIyYmJmZDBjY2JkY2IxMDlkZWNkM2U3ZTQxNzAyZWU4In0=','2016-02-19 09:53:16'),('feicwwjfufb9nu5qlicuf1ulezt1rn2b','OWExNzg3OTA5MDEyN2NiNGRmYWFmZjNiNjAzM2NjOTc1NWY3YzIxNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2NTliMWQ5MjJiYmZkMGNjYmRjYjEwOWRlY2QzZTdlNDE3MDJlZTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-02-19 03:03:19'),('he69j7j03bhqwbs236d8ctvv0bbf0myu','YmY5NGJmZDg0NDA1NmYyNWY1MDQ0YTE1MTA0MWJhZjY0YzZlZjQ4Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiNjU5YjFkOTIyYmJmZDBjY2JkY2IxMDlkZWNkM2U3ZTQxNzAyZWU4In0=','2016-02-19 04:04:16'),('ir24dx4crsa0f2fac66qn2omueh423i0','ZjliMjc1NDlhYWI4MmU2YTA2NGZmNmE2MWU3Y2ViNWRhMGYwNjIzODp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2NTliMWQ5MjJiYmZkMGNjYmRjYjEwOWRlY2QzZTdlNDE3MDJlZTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-02-24 15:47:56'),('k4iinl7jswdrhg42bin503nzic74vph3','NTBhYmUzMjRkYTVjZDhhODY2Mzg4ODYyNmM4NmE1NDkyYmU5MWY2Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjY1OWIxZDkyMmJiZmQwY2NiZGNiMTA5ZGVjZDNlN2U0MTcwMmVlOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-02-18 11:10:56'),('ntfnzx6tz1783t637rr3rn5xa5x16f6d','ZmM0NzA2NmJmOWFjODc0NDA3OTczOWI2MmRiYzRkODJmMGU2NWM4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjU5YjFkOTIyYmJmZDBjY2JkY2IxMDlkZWNkM2U3ZTQxNzAyZWU4In0=','2016-02-18 09:15:50'),('qy3bne4vevdkj3y19sobiz8bjcdsj3il','OWExNzg3OTA5MDEyN2NiNGRmYWFmZjNiNjAzM2NjOTc1NWY3YzIxNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2NTliMWQ5MjJiYmZkMGNjYmRjYjEwOWRlY2QzZTdlNDE3MDJlZTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-02-19 08:07:48'),('wp8zwl2pn1spzh9k4umgf662farzo6bf','OWExNzg3OTA5MDEyN2NiNGRmYWFmZjNiNjAzM2NjOTc1NWY3YzIxNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI2NTliMWQ5MjJiYmZkMGNjYmRjYjEwOWRlY2QzZTdlNDE3MDJlZTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-02-19 01:57:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_2dbcba41` (`slug`),
  KEY `post_b583a629` (`category_id`),
  CONSTRAINT `post_category_id_475713ab_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tag` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `catalogue_id` int(11) NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `price_sale` double NOT NULL,
  `attachment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_catalogue_id_a39e6c6f_fk_catalogue_id` (`catalogue_id`),
  KEY `product_2dbcba41` (`slug`),
  CONSTRAINT `product_catalogue_id_a39e6c6f_fk_catalogue_id` FOREIGN KEY (`catalogue_id`) REFERENCES `catalogue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (11,'MWF SOLUBLE OIL','mwf-soluble-oil','MWF SOLUBLE OIL','2016-02-25 02:30:28','2016-02-25 03:14:43','products/dau_nhot_total.1392431078.jpg',0,'<p>MWF SOLUBLE OIL</p>','',1,11,0,0,'attachments/MWF_SOLUBLE_OIL.pdf');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule`
--

DROP TABLE IF EXISTS `robots_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule`
--

LOCK TABLES `robots_rule` WRITE;
/*!40000 ALTER TABLE `robots_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_allowed`
--

DROP TABLE IF EXISTS `robots_rule_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_allowed_rule_id_83b262d4_uniq` (`rule_id`,`url_id`),
  KEY `robots_rule_allowed_e1150e65` (`rule_id`),
  KEY `robots_rule_allowed_29608e0a` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_allowed`
--

LOCK TABLES `robots_rule_allowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_disallowed`
--

DROP TABLE IF EXISTS `robots_rule_disallowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_disallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_disallowed_rule_id_4d9b6222_uniq` (`rule_id`,`url_id`),
  KEY `robots_rule_disallowed_e1150e65` (`rule_id`),
  KEY `robots_rule_disallowed_29608e0a` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_disallowed`
--

LOCK TABLES `robots_rule_disallowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_disallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_disallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_sites`
--

DROP TABLE IF EXISTS `robots_rule_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `robots_rule_sites_rule_id_093f04ea_uniq` (`rule_id`,`site_id`),
  KEY `robots_rule_sites_e1150e65` (`rule_id`),
  KEY `robots_rule_sites_9365d6e7` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_sites`
--

LOCK TABLES `robots_rule_sites` WRITE;
/*!40000 ALTER TABLE `robots_rule_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_url`
--

DROP TABLE IF EXISTS `robots_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_url`
--

LOCK TABLES `robots_url` WRITE;
/*!40000 ALTER TABLE `robots_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_url` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-25 10:30:49
