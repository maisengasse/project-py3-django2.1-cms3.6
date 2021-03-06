-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pls_change_me
-- ------------------------------------------------------
-- Server version	10.1.43-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `addresses_addressdata`
--

DROP TABLE IF EXISTS `addresses_addressdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses_addressdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(16) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `salutation` varchar(256) DEFAULT NULL,
  `company` varchar(256) DEFAULT NULL,
  `person` varchar(256) DEFAULT NULL,
  `street` varchar(256) DEFAULT NULL,
  `number` varchar(256) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `phone` varchar(256) DEFAULT NULL,
  `phone_home` varchar(256) DEFAULT NULL,
  `phone_mobile` varchar(256) DEFAULT NULL,
  `fax` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `uid` varchar(256) DEFAULT NULL,
  `web` varchar(200) DEFAULT NULL,
  `parent_type_id` int(11) DEFAULT NULL,
  `district` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_addressdat_parent_type_id_b6bd270e_fk_django_co` (`parent_type_id`),
  CONSTRAINT `addresses_addressdat_parent_type_id_b6bd270e_fk_django_co` FOREIGN KEY (`parent_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses_addressdata`
--

LOCK TABLES `addresses_addressdata` WRITE;
/*!40000 ALTER TABLE `addresses_addressdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses_addressdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses_geolocation`
--

DROP TABLE IF EXISTS `addresses_geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses_geolocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `zoom` int(11) DEFAULT NULL,
  `parent_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_geolocatio_parent_type_id_407830d5_fk_django_co` (`parent_type_id`),
  CONSTRAINT `addresses_geolocatio_parent_type_id_407830d5_fk_django_co` FOREIGN KEY (`parent_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses_geolocation`
--

LOCK TABLES `addresses_geolocation` WRITE;
/*!40000 ALTER TABLE `addresses_geolocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses_geolocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Editor'),(2,'translators');
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(106,1,12),(104,1,13),(105,1,14),(3,1,24),(4,1,25),(5,1,26),(6,1,27),(7,1,28),(8,1,29),(9,1,30),(10,1,31),(11,1,32),(12,1,33),(13,1,34),(14,1,35),(15,1,36),(16,1,37),(17,1,38),(18,1,39),(19,1,40),(20,1,41),(21,1,42),(22,1,43),(23,1,44),(24,1,45),(25,1,46),(26,1,47),(27,1,48),(28,1,49),(29,1,50),(30,1,51),(31,1,52),(32,1,53),(33,1,54),(34,1,55),(35,1,56),(36,1,57),(37,1,58),(38,1,59),(39,1,60),(40,1,61),(41,1,62),(42,1,63),(43,1,64),(44,1,74),(45,1,75),(46,1,76),(47,1,77),(48,1,78),(49,1,79),(50,1,80),(51,1,81),(52,1,82),(53,1,83),(54,1,84),(55,1,85),(56,1,86),(57,1,87),(58,1,88),(59,1,89),(60,1,90),(61,1,91),(62,1,92),(63,1,93),(64,1,94),(65,1,95),(66,1,96),(67,1,97),(68,1,98),(69,1,99),(70,1,100),(71,1,101),(72,1,102),(73,1,103),(74,1,104),(75,1,105),(76,1,106),(77,1,107),(78,1,108),(79,1,109),(80,1,110),(81,1,111),(82,1,112),(83,1,113),(84,1,114),(85,1,115),(86,1,116),(87,1,117),(88,1,118),(89,1,119),(90,1,120),(91,1,121),(92,1,122),(93,1,123),(94,1,124),(95,1,125),(96,1,126),(97,1,127),(98,1,128),(99,1,132),(100,1,137),(101,1,138),(102,1,139),(103,1,140),(107,1,145),(108,1,146),(109,1,147),(110,1,148),(111,1,154),(112,1,155),(113,1,156),(114,1,157),(115,1,158),(116,1,159),(117,1,160),(118,1,164),(119,1,165),(120,1,166),(121,1,167),(122,1,168),(123,1,169),(124,1,170),(125,1,171),(126,1,172),(127,1,173),(128,1,174),(129,1,175),(130,1,176);
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can use Structure mode',1,'use_structure'),(2,'Can change page',2,'change_page'),(3,'Can add permission',3,'add_permission'),(4,'Can change permission',3,'change_permission'),(5,'Can delete permission',3,'delete_permission'),(6,'Can add user',4,'add_user'),(7,'Can change user',4,'change_user'),(8,'Can delete user',4,'delete_user'),(9,'Can add group',5,'add_group'),(10,'Can change group',5,'change_group'),(11,'Can delete group',5,'delete_group'),(12,'Can add content type',6,'add_contenttype'),(13,'Can change content type',6,'change_contenttype'),(14,'Can delete content type',6,'delete_contenttype'),(15,'Can add session',7,'add_session'),(16,'Can change session',7,'change_session'),(17,'Can delete session',7,'delete_session'),(18,'Can add site',8,'add_site'),(19,'Can change site',8,'change_site'),(20,'Can delete site',8,'delete_site'),(21,'Can add log entry',9,'add_logentry'),(22,'Can change log entry',9,'change_logentry'),(23,'Can delete log entry',9,'delete_logentry'),(24,'Can add Page global permission',10,'add_globalpagepermission'),(25,'Can change Page global permission',10,'change_globalpagepermission'),(26,'Can delete Page global permission',10,'delete_globalpagepermission'),(27,'Can add urlconf revision',11,'add_urlconfrevision'),(28,'Can change urlconf revision',11,'change_urlconfrevision'),(29,'Can delete urlconf revision',11,'delete_urlconfrevision'),(30,'Can add page',2,'add_page'),(31,'Can delete page',2,'delete_page'),(32,'Can view page',2,'view_page'),(33,'Can publish page',2,'publish_page'),(34,'Can edit static placeholders',2,'edit_static_placeholder'),(35,'Can add cms plugin',12,'add_cmsplugin'),(36,'Can change cms plugin',12,'change_cmsplugin'),(37,'Can delete cms plugin',12,'delete_cmsplugin'),(38,'Can add title',13,'add_title'),(39,'Can change title',13,'change_title'),(40,'Can delete title',13,'delete_title'),(41,'Can add placeholder',1,'add_placeholder'),(42,'Can change placeholder',1,'change_placeholder'),(43,'Can delete placeholder',1,'delete_placeholder'),(44,'Can add user setting',14,'add_usersettings'),(45,'Can change user setting',14,'change_usersettings'),(46,'Can delete user setting',14,'delete_usersettings'),(47,'Can add static placeholder',15,'add_staticplaceholder'),(48,'Can change static placeholder',15,'change_staticplaceholder'),(49,'Can delete static placeholder',15,'delete_staticplaceholder'),(50,'Can add User (page)',16,'add_pageuser'),(51,'Can change User (page)',16,'change_pageuser'),(52,'Can delete User (page)',16,'delete_pageuser'),(53,'Can add alias plugin model',17,'add_aliaspluginmodel'),(54,'Can change alias plugin model',17,'change_aliaspluginmodel'),(55,'Can delete alias plugin model',17,'delete_aliaspluginmodel'),(56,'Can add placeholder reference',18,'add_placeholderreference'),(57,'Can change placeholder reference',18,'change_placeholderreference'),(58,'Can delete placeholder reference',18,'delete_placeholderreference'),(59,'Can add Page permission',19,'add_pagepermission'),(60,'Can change Page permission',19,'change_pagepermission'),(61,'Can delete Page permission',19,'delete_pagepermission'),(62,'Can add User group (page)',21,'add_pageusergroup'),(63,'Can change User group (page)',21,'change_pageusergroup'),(64,'Can delete User group (page)',21,'delete_pageusergroup'),(65,'Can add cache key',23,'add_cachekey'),(66,'Can change cache key',23,'change_cachekey'),(67,'Can delete cache key',23,'delete_cachekey'),(68,'Can add version',24,'add_version'),(69,'Can change version',24,'change_version'),(70,'Can delete version',24,'delete_version'),(71,'Can add revision',25,'add_revision'),(72,'Can change revision',25,'change_revision'),(73,'Can delete revision',25,'delete_revision'),(74,'Can add clipboard',26,'add_clipboard'),(75,'Can change clipboard',26,'change_clipboard'),(76,'Can delete clipboard',26,'delete_clipboard'),(77,'Can add folder permission',27,'add_folderpermission'),(78,'Can change folder permission',27,'change_folderpermission'),(79,'Can delete folder permission',27,'delete_folderpermission'),(80,'Can add Folder',28,'add_folder'),(81,'Can change Folder',28,'change_folder'),(82,'Can delete Folder',28,'delete_folder'),(83,'Can use directory listing',28,'can_use_directory_listing'),(84,'Can add thumbnail option',29,'add_thumbnailoption'),(85,'Can change thumbnail option',29,'change_thumbnailoption'),(86,'Can delete thumbnail option',29,'delete_thumbnailoption'),(87,'Can add clipboard item',30,'add_clipboarditem'),(88,'Can change clipboard item',30,'change_clipboarditem'),(89,'Can delete clipboard item',30,'delete_clipboarditem'),(90,'Can add file',31,'add_file'),(91,'Can change file',31,'change_file'),(92,'Can delete file',31,'delete_file'),(93,'Can add image',32,'add_image'),(94,'Can change image',32,'change_image'),(95,'Can delete image',32,'delete_image'),(96,'Can add source',33,'add_source'),(97,'Can change source',33,'change_source'),(98,'Can delete source',33,'delete_source'),(99,'Can add thumbnail',34,'add_thumbnail'),(100,'Can change thumbnail',34,'change_thumbnail'),(101,'Can delete thumbnail',34,'delete_thumbnail'),(102,'Can add thumbnail dimensions',35,'add_thumbnaildimensions'),(103,'Can change thumbnail dimensions',35,'change_thumbnaildimensions'),(104,'Can delete thumbnail dimensions',35,'delete_thumbnaildimensions'),(105,'Can add remote filer image',36,'add_remotefilerimage'),(106,'Can change remote filer image',36,'change_remotefilerimage'),(107,'Can delete remote filer image',36,'delete_remotefilerimage'),(108,'Can add Editierbares Bild',37,'add_editableimage'),(109,'Can change Editierbares Bild',37,'change_editableimage'),(110,'Can delete Editierbares Bild',37,'delete_editableimage'),(111,'Can add Editierbarer Text',38,'add_editablechars'),(112,'Can change Editierbarer Text',38,'change_editablechars'),(113,'Can delete Editierbarer Text',38,'delete_editablechars'),(114,'Can add Formatierter Text',39,'add_editablerichtext'),(115,'Can change Formatierter Text',39,'change_editablerichtext'),(116,'Can delete Formatierter Text',39,'delete_editablerichtext'),(117,'Can add model-workflow',40,'add_workflow'),(118,'Can change model-workflow',40,'change_workflow'),(119,'Can delete model-workflow',40,'delete_workflow'),(120,'Can add Slider',41,'add_stencilslider'),(121,'Can change Slider',41,'change_stencilslider'),(122,'Can delete Slider',41,'delete_stencilslider'),(123,'Can add Inhalt',42,'add_stencildata'),(124,'Can change Inhalt',42,'change_stencildata'),(125,'Can delete Inhalt',42,'delete_stencildata'),(126,'Can add page sitemap properties',43,'add_pagesitemapproperties'),(127,'Can change page sitemap properties',43,'change_pagesitemapproperties'),(128,'Can delete page sitemap properties',43,'delete_pagesitemapproperties'),(129,'Can view permission',3,'view_permission'),(130,'Can view group',5,'view_group'),(131,'Can view user',4,'view_user'),(132,'Can view content type',6,'view_contenttype'),(133,'Can view session',7,'view_session'),(134,'Can view page sitemap properties',43,'view_pagesitemapproperties'),(135,'Can view site',8,'view_site'),(136,'Can view log entry',9,'view_logentry'),(137,'Can view Inhalt',42,'view_stencildata'),(138,'Can view Slider',41,'view_stencilslider'),(139,'Can view cms plugin',12,'view_cmsplugin'),(140,'Can view alias plugin model',17,'view_aliaspluginmodel'),(141,'Can view Page global permission',10,'view_globalpagepermission'),(142,'Can view Page permission',19,'view_pagepermission'),(143,'Can view User (page)',16,'view_pageuser'),(144,'Can view User group (page)',21,'view_pageusergroup'),(145,'Can view placeholder',1,'view_placeholder'),(146,'Can view placeholder reference',18,'view_placeholderreference'),(147,'Can view static placeholder',15,'view_staticplaceholder'),(148,'Can view title',13,'view_title'),(149,'Can view user setting',14,'view_usersettings'),(150,'Can view urlconf revision',11,'view_urlconfrevision'),(151,'Can view cache key',23,'view_cachekey'),(152,'Can view revision',25,'view_revision'),(153,'Can view version',24,'view_version'),(154,'Can view clipboard',26,'view_clipboard'),(155,'Can view clipboard item',30,'view_clipboarditem'),(156,'Can view file',31,'view_file'),(157,'Can view Folder',28,'view_folder'),(158,'Can view folder permission',27,'view_folderpermission'),(159,'Can view image',32,'view_image'),(160,'Can view thumbnail option',29,'view_thumbnailoption'),(161,'Can view source',33,'view_source'),(162,'Can view thumbnail',34,'view_thumbnail'),(163,'Can view thumbnail dimensions',35,'view_thumbnaildimensions'),(164,'Can view remote filer image',36,'view_remotefilerimage'),(165,'Can view Editierbarer Text',38,'view_editablechars'),(166,'Can view Editierbares Bild',37,'view_editableimage'),(167,'Can view Formatierter Text',39,'view_editablerichtext'),(168,'Can add Adresse',44,'add_addressdata'),(169,'Can change Adresse',44,'change_addressdata'),(170,'Can delete Adresse',44,'delete_addressdata'),(171,'Can view Adresse',44,'view_addressdata'),(172,'Can add Geo-Koordinaten',45,'add_geolocation'),(173,'Can change Geo-Koordinaten',45,'change_geolocation'),(174,'Can delete Geo-Koordinaten',45,'delete_geolocation'),(175,'Can view Geo-Koordinaten',45,'view_geolocation'),(176,'Can view model-workflow',40,'view_workflow');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$afUwI5tw1BFV$S1RESfeDX/lx7I1vJ0chYyuTzpcR1+9YewgYNqMpCUM=','2019-12-12 12:16:38.701721',1,'maisengasse','','','admin@maisengasse.at',1,1,'2019-01-17 15:18:44.416637'),(2,'pbkdf2_sha256$150000$ZibPvfdM3eBd$YItugmJzAndazNPBnRsGM+nY5YtVplJ1FvdWE7usK+U=','2019-12-12 12:34:41.783494',0,'editor','','','',1,1,'2019-12-12 12:34:09.000000');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,2,2);
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_aliaspluginmodel`
--

DROP TABLE IF EXISTS `cms_aliaspluginmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_aliaspluginmodel` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  `alias_placeholder_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` (`plugin_id`),
  KEY `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` (`alias_placeholder_id`),
  CONSTRAINT `cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place` FOREIGN KEY (`alias_placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id` FOREIGN KEY (`plugin_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_aliaspluginmodel`
--

LOCK TABLES `cms_aliaspluginmodel` WRITE;
/*!40000 ALTER TABLE `cms_aliaspluginmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_aliaspluginmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cmsplugin`
--

DROP TABLE IF EXISTS `cms_cmsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(5) unsigned NOT NULL,
  `language` varchar(15) NOT NULL,
  `plugin_type` varchar(50) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `placeholder_id` int(11) DEFAULT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_cmsplugin_path_4917bb44_uniq` (`path`),
  KEY `cms_cmsplugin_language_bbea8a48` (`language`),
  KEY `cms_cmsplugin_plugin_type_94e96ebf` (`plugin_type`),
  KEY `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` (`parent_id`),
  KEY `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` (`placeholder_id`),
  CONSTRAINT `cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1083 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (7,10,'de','TeaserGroup','2019-01-28 10:08:37.997311','2019-04-11 13:58:01.816254',NULL,3,1,3,'002W'),(8,0,'de','Teaser','2019-01-28 10:08:38.009322','2019-01-28 13:39:19.768319',7,3,2,0,'002W0001'),(9,1,'de','Teaser','2019-01-28 10:08:38.042362','2019-01-28 13:39:25.383303',7,3,2,0,'002W0002'),(10,2,'de','Teaser','2019-01-28 10:08:38.068393','2019-04-11 14:10:04.544989',7,3,2,0,'002W0003'),(20,13,'de','Highlight','2019-01-28 10:10:15.559038','2019-12-10 14:34:54.208064',NULL,3,1,0,'003Z'),(184,4,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-04-11 14:05:11.958066',NULL,3,1,0,'005X'),(432,0,'de','Testimonial','2019-03-05 10:12:34.136782','2019-12-10 14:47:04.304171',433,3,2,0,'001S0001'),(433,14,'de','Slider','2019-03-05 10:34:29.973447','2019-12-10 14:18:26.897521',NULL,3,1,2,'001S'),(545,0,'de','FullImage','2019-04-11 14:11:21.732939','2019-04-11 14:11:21.762359',NULL,2,1,0,'002I'),(546,1,'de','FullImageWithText','2019-04-11 14:12:31.275984','2019-04-11 14:13:35.557483',NULL,3,1,0,'0039'),(548,3,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-04-11 14:13:10.886071',NULL,3,1,0,'005W'),(550,2,'de','FullImageWithText','2019-04-11 14:12:31.275984','2019-04-11 14:13:44.837053',NULL,3,1,0,'006H'),(551,5,'de','FullImageWithColumnText','2019-04-11 14:15:50.332493','2019-04-11 14:17:00.695408',NULL,3,1,2,'005T'),(552,0,'de','ColumnText','2019-04-11 14:15:50.351884','2019-04-11 14:17:23.972970',551,3,2,0,'005T0001'),(553,1,'de','ColumnText','2019-04-11 14:15:50.377841','2019-04-11 14:17:30.083039',551,3,2,0,'005T0002'),(596,0,'de','FullText','2019-04-11 14:43:10.192397','2019-04-11 14:43:32.889944',NULL,3,1,0,'0038'),(619,0,'de','FullText','2019-04-11 15:12:13.775088','2019-04-11 15:13:28.184754',NULL,23,1,0,'003N'),(621,6,'de','FullVideo','2019-12-10 10:42:05.128739','2019-12-10 10:48:04.705765',NULL,3,1,0,'005U'),(622,9,'de','ImageGallery','2019-12-10 10:50:24.048777','2019-12-10 10:50:48.273709',NULL,3,1,0,'005Y'),(628,15,'de','TimelineGroup','2019-12-10 11:06:25.438569','2019-12-10 11:06:25.442563',NULL,3,1,5,'003V'),(629,0,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-10 13:39:58.498426',628,3,2,0,'003V0001'),(630,16,'de','AccordionGroup','2019-12-10 11:08:09.927886','2019-12-10 11:08:09.932165',NULL,3,1,2,'003W'),(631,0,'de','CollapsibleGroup','2019-12-10 11:08:09.935711','2019-12-10 13:30:24.575729',630,3,2,1,'003W0001'),(632,1,'de','CollapsibleGroup','2019-12-10 11:08:09.949121','2019-12-10 11:08:09.955606',630,3,2,1,'003W0002'),(633,0,'de','FullText','2019-12-10 11:08:49.677044','2019-12-10 11:08:49.680530',631,3,3,0,'003W00010001'),(635,0,'de','FullText','2019-12-10 11:08:49.677044','2019-12-10 11:08:55.409490',632,3,3,0,'003W00020001'),(649,1,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-10 13:34:27.536908',628,3,2,0,'003V0002'),(650,2,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-10 13:34:33.621874',628,3,2,0,'003V0003'),(651,3,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-10 13:34:39.575160',628,3,2,0,'003V0004'),(652,4,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-10 13:34:47.495179',628,3,2,0,'003V0005'),(735,1,'de','Testimonial','2019-03-05 10:12:34.136782','2019-12-10 14:47:10.667616',433,3,2,0,'001S0002'),(745,12,'de','HighlightGroup','2019-12-10 14:31:56.584252','2019-12-10 14:31:56.588615',NULL,3,1,4,'004O'),(746,0,'de','Highlight','2019-12-10 14:31:56.599494','2019-12-10 14:31:56.606032',745,3,2,0,'004O0001'),(747,1,'de','Highlight','2019-12-10 14:31:56.610279','2019-12-10 14:31:56.619473',745,3,2,0,'004O0002'),(748,2,'de','Highlight','2019-12-10 14:31:56.623569','2019-12-10 14:31:56.633576',745,3,2,0,'004O0003'),(749,3,'de','Highlight','2019-12-10 14:31:56.637685','2019-12-10 14:31:56.645832',745,3,2,0,'004O0004'),(790,11,'de','TeamGroup','2019-12-10 14:46:31.667244','2019-12-10 14:46:31.671855',NULL,3,1,3,'0056'),(791,0,'de','TeamMember','2019-12-10 14:46:31.675428','2019-12-10 14:46:31.682086',790,3,2,0,'00560001'),(792,1,'de','TeamMember','2019-12-10 14:46:31.685529','2019-12-10 14:46:31.693808',790,3,2,0,'00560002'),(793,2,'de','TeamMember','2019-12-10 14:46:31.697594','2019-12-10 14:46:31.708358',790,3,2,0,'00560003'),(874,7,'de','VideoWithText','2019-12-10 14:51:35.031520','2019-12-10 15:07:45.563186',NULL,3,1,0,'005O'),(875,6,'de','VideoWithText','2019-12-10 14:51:35.031520','2019-12-10 14:52:58.095989',NULL,1,1,0,'005P'),(876,8,'de','VideoWithText','2019-12-10 14:51:35.031520','2019-12-10 15:06:37.499618',NULL,3,1,0,'005Q'),(1041,0,'de','FullImage','2019-04-11 14:11:21.732939','2019-12-12 12:30:10.622466',NULL,4,1,0,'006I'),(1042,14,'de','Slider','2019-03-05 10:34:29.973447','2019-12-12 12:30:10.654456',NULL,5,1,2,'006J'),(1043,0,'de','Testimonial','2019-03-05 10:12:34.136782','2019-12-12 12:30:10.661311',1042,5,2,0,'006J0001'),(1044,1,'de','Testimonial','2019-03-05 10:12:34.136782','2019-12-12 12:30:10.666843',1042,5,2,0,'006J0002'),(1045,10,'de','TeaserGroup','2019-01-28 10:08:37.997311','2019-12-12 12:30:10.671516',NULL,5,1,3,'006K'),(1046,0,'de','Teaser','2019-01-28 10:08:38.009322','2019-12-12 12:30:10.674340',1045,5,2,0,'006K0001'),(1047,1,'de','Teaser','2019-01-28 10:08:38.042362','2019-12-12 12:30:10.684872',1045,5,2,0,'006K0002'),(1048,2,'de','Teaser','2019-01-28 10:08:38.068393','2019-12-12 12:30:10.697944',1045,5,2,0,'006K0003'),(1049,0,'de','FullText','2019-04-11 14:43:10.192397','2019-12-12 12:30:10.703133',NULL,5,1,0,'006L'),(1050,1,'de','FullImageWithText','2019-04-11 14:12:31.275984','2019-12-12 12:30:10.712177',NULL,5,1,0,'006M'),(1051,15,'de','TimelineGroup','2019-12-10 11:06:25.438569','2019-12-12 12:30:10.720379',NULL,5,1,5,'006N'),(1052,0,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-12 12:30:10.728213',1051,5,2,0,'006N0001'),(1053,1,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-12 12:30:10.747703',1051,5,2,0,'006N0002'),(1054,2,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-12 12:30:10.760070',1051,5,2,0,'006N0003'),(1055,3,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-12 12:30:10.765128',1051,5,2,0,'006N0004'),(1056,4,'de','TimelineEntry','2019-12-10 11:07:32.673239','2019-12-12 12:30:10.777484',1051,5,2,0,'006N0005'),(1057,16,'de','AccordionGroup','2019-12-10 11:08:09.927886','2019-12-12 12:30:10.783315',NULL,5,1,2,'006O'),(1058,0,'de','CollapsibleGroup','2019-12-10 11:08:09.935711','2019-12-12 12:30:10.791778',1057,5,2,1,'006O0001'),(1059,0,'de','FullText','2019-12-10 11:08:49.677044','2019-12-12 12:30:10.809404',1058,5,3,0,'006O00010001'),(1060,1,'de','CollapsibleGroup','2019-12-10 11:08:09.949121','2019-12-12 12:30:10.822590',1057,5,2,1,'006O0002'),(1061,0,'de','FullText','2019-12-10 11:08:49.677044','2019-12-12 12:30:10.838769',1060,5,3,0,'006O00020001'),(1062,13,'de','Highlight','2019-01-28 10:10:15.559038','2019-12-12 12:30:10.858248',NULL,5,1,0,'006P'),(1063,12,'de','HighlightGroup','2019-12-10 14:31:56.584252','2019-12-12 12:30:10.862893',NULL,5,1,4,'006Q'),(1064,0,'de','Highlight','2019-12-10 14:31:56.599494','2019-12-12 12:30:10.870994',1063,5,2,0,'006Q0001'),(1065,1,'de','Highlight','2019-12-10 14:31:56.610279','2019-12-12 12:30:10.892311',1063,5,2,0,'006Q0002'),(1066,2,'de','Highlight','2019-12-10 14:31:56.623569','2019-12-12 12:30:10.900331',1063,5,2,0,'006Q0003'),(1067,3,'de','Highlight','2019-12-10 14:31:56.637685','2019-12-12 12:30:10.918146',1063,5,2,0,'006Q0004'),(1068,11,'de','TeamGroup','2019-12-10 14:46:31.667244','2019-12-12 12:30:10.936476',NULL,5,1,3,'006R'),(1069,0,'de','TeamMember','2019-12-10 14:46:31.675428','2019-12-12 12:30:10.939754',1068,5,2,0,'006R0001'),(1070,1,'de','TeamMember','2019-12-10 14:46:31.685529','2019-12-12 12:30:10.958681',1068,5,2,0,'006R0002'),(1071,2,'de','TeamMember','2019-12-10 14:46:31.697594','2019-12-12 12:30:10.968983',1068,5,2,0,'006R0003'),(1072,7,'de','VideoWithText','2019-12-10 14:51:35.031520','2019-12-12 12:30:10.987983',NULL,5,1,0,'006S'),(1073,8,'de','VideoWithText','2019-12-10 14:51:35.031520','2019-12-12 12:30:10.997125',NULL,5,1,0,'006T'),(1074,5,'de','FullImageWithColumnText','2019-04-11 14:15:50.332493','2019-12-12 12:30:11.006411',NULL,5,1,2,'006U'),(1075,0,'de','ColumnText','2019-04-11 14:15:50.351884','2019-12-12 12:30:11.009573',1074,5,2,0,'006U0001'),(1076,1,'de','ColumnText','2019-04-11 14:15:50.377841','2019-12-12 12:30:11.023114',1074,5,2,0,'006U0002'),(1077,6,'de','FullVideo','2019-12-10 10:42:05.128739','2019-12-12 12:30:11.041210',NULL,5,1,0,'006V'),(1078,3,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-12-12 12:30:11.050206',NULL,5,1,0,'006W'),(1079,4,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-12-12 12:30:11.059599',NULL,5,1,0,'006X'),(1080,9,'de','ImageGallery','2019-12-10 10:50:24.048777','2019-12-12 12:30:11.063683',NULL,5,1,0,'006Y'),(1081,2,'de','FullImageWithText','2019-04-11 14:12:31.275984','2019-12-12 12:30:11.072655',NULL,5,1,0,'006Z'),(1082,0,'de','FullText','2019-04-11 15:12:13.775088','2019-12-12 12:30:11.300062',NULL,27,1,0,'0070');
/*!40000 ALTER TABLE `cms_cmsplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission`
--

DROP TABLE IF EXISTS `cms_globalpagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` (`group_id`),
  KEY `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_globalpagepermission_group_id_991b4733_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission`
--

LOCK TABLES `cms_globalpagepermission` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission_sites`
--

DROP TABLE IF EXISTS `cms_globalpagepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_globalpagepermission_globalpagepermission_id__db684f41_uniq` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermis_site_id_00460b53_fk_django_si` (`site_id`),
  CONSTRAINT `cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa` FOREIGN KEY (`globalpagepermission_id`) REFERENCES `cms_globalpagepermission` (`id`),
  CONSTRAINT `cms_globalpagepermis_site_id_00460b53_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission_sites`
--

LOCK TABLES `cms_globalpagepermission_sites` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `changed_by` varchar(255) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `changed_date` datetime(6) NOT NULL,
  `publication_date` datetime(6) DEFAULT NULL,
  `publication_end_date` datetime(6) DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) DEFAULT NULL,
  `navigation_extenders` varchar(80) DEFAULT NULL,
  `template` varchar(100) NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `limit_visibility_in_menu` smallint(6) DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL,
  `application_urls` varchar(200) DEFAULT NULL,
  `application_namespace` varchar(200) DEFAULT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `xframe_options` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `is_page_type` tinyint(1) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_node_id_publisher_is_draft_c1293d6a_uniq` (`node_id`,`publisher_is_draft`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_publication_date_684fabf7` (`publication_date`),
  KEY `cms_page_publication_end_date_12a0c46a` (`publication_end_date`),
  KEY `cms_page_in_navigation_01c24279` (`in_navigation`),
  KEY `cms_page_soft_root_51efccbe` (`soft_root`),
  KEY `cms_page_reverse_id_ffc9ede2` (`reverse_id`),
  KEY `cms_page_navigation_extenders_c24af8dd` (`navigation_extenders`),
  KEY `cms_page_limit_visibility_in_menu_30db6aa6` (`limit_visibility_in_menu`),
  KEY `cms_page_is_home_edadca07` (`is_home`),
  KEY `cms_page_application_urls_9ef47497` (`application_urls`),
  KEY `cms_page_publisher_is_draft_141cba60` (`publisher_is_draft`),
  CONSTRAINT `cms_page_node_id_c87b85a9_fk_cms_treenode_id` FOREIGN KEY (`node_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_page_publisher_public_id_d619fca0_fk_cms_page_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (2,'maisengasse','maisengasse','2019-01-17 15:20:18.859672','2019-04-11 14:29:39.746055','2019-01-17 15:20:18.894786',NULL,1,0,NULL,NULL,'default.html',0,NULL,0,NULL,NULL,1,'de',0,3,0,2),(3,'maisengasse','maisengasse','2019-01-17 15:20:18.895180','2019-12-12 12:30:10.569740','2019-01-17 15:20:18.894786',NULL,1,0,NULL,NULL,'default.html',0,NULL,0,NULL,NULL,0,'de',0,2,0,2),(4,'maisengasse','maisengasse','2019-01-28 14:40:05.786899','2019-01-28 14:40:05.815547','2019-01-28 15:29:33.168449',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,8,0,3),(5,'maisengasse','maisengasse','2019-01-28 14:40:35.625256','2019-01-28 14:40:35.646263','2019-01-28 15:29:35.373752',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,9,0,4),(6,'maisengasse','maisengasse','2019-01-28 14:40:44.070577','2019-01-28 14:40:44.089020','2019-12-10 13:53:33.054849',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,16,0,5),(7,'maisengasse','maisengasse','2019-01-28 14:40:52.138691','2019-01-28 14:40:52.166260','2019-12-10 13:53:35.846024',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,17,0,6),(8,'maisengasse','maisengasse','2019-01-28 15:29:33.168686','2019-12-12 12:30:11.095182','2019-01-28 15:29:33.168449',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,4,0,3),(9,'maisengasse','maisengasse','2019-01-28 15:29:35.373918','2019-12-12 12:30:11.137069','2019-01-28 15:29:35.373752',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,5,0,4),(10,'maisengasse','maisengasse','2019-01-28 15:29:40.961298','2019-02-07 15:10:39.869254','2019-02-07 15:10:28.680597',NULL,0,0,'legal',NULL,'INHERIT',0,NULL,0,'',NULL,1,'de',0,12,0,7),(11,'maisengasse','maisengasse','2019-01-28 15:29:47.749721','2019-02-07 15:24:24.959868','2019-02-07 15:24:48.287490',NULL,0,0,'privacy',NULL,'INHERIT',0,NULL,0,'',NULL,1,'de',0,13,0,8),(12,'maisengasse','maisengasse','2019-02-07 15:10:28.680740','2019-12-12 12:30:11.228193','2019-02-07 15:10:28.680597',NULL,0,0,'legal',NULL,'INHERIT',0,NULL,0,'',NULL,0,'de',0,10,0,7),(13,'maisengasse','maisengasse','2019-02-07 15:24:48.287664','2019-12-12 12:30:11.254522','2019-02-07 15:24:48.287490',NULL,0,0,'privacy',NULL,'INHERIT',0,NULL,0,'',NULL,0,'de',0,11,0,8),(14,'maisengasse','maisengasse','2019-04-11 12:49:33.793002','2019-04-11 13:42:12.702940','2019-04-11 12:50:01.769482',NULL,0,0,'home',NULL,'default.html',0,NULL,1,'',NULL,1,'de',0,15,0,9),(15,'maisengasse','maisengasse','2019-04-11 12:50:01.769660','2019-12-12 12:30:11.308718','2019-04-11 12:50:01.769482',NULL,0,0,'home',NULL,'default.html',0,NULL,1,'',NULL,0,'de',0,14,0,9),(16,'maisengasse','maisengasse','2019-12-10 13:53:33.055007','2019-12-12 12:30:11.178179','2019-12-10 13:53:33.054849',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,6,0,5),(17,'maisengasse','maisengasse','2019-12-10 13:53:35.846182','2019-12-12 12:30:11.199122','2019-12-10 13:53:35.846024',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,7,0,6);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_placeholders`
--

DROP TABLE IF EXISTS `cms_page_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` (`placeholder_id`),
  CONSTRAINT `cms_page_placeholder_placeholder_id_6b120886_fk_cms_place` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,2,2),(2,2,3),(3,3,4),(4,3,5),(5,4,8),(6,4,9),(7,5,10),(8,5,11),(9,6,12),(10,6,13),(11,7,14),(12,7,15),(13,8,16),(14,8,17),(15,9,18),(16,9,19),(17,10,20),(18,10,21),(19,11,22),(20,11,23),(21,12,24),(22,12,25),(23,13,26),(24,13,27),(25,14,28),(26,14,29),(27,15,30),(28,15,31),(29,16,32),(30,16,33),(31,17,34),(32,17,35);
/*!40000 ALTER TABLE `cms_page_placeholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagepermission`
--

DROP TABLE IF EXISTS `cms_pagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_group_id_af5af193_fk_auth_group_id` (`group_id`),
  KEY `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` (`page_id`),
  KEY `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cms_pagepermission_group_id_af5af193_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cms_pagepermission_page_id_0ae9a163_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagepermission`
--

LOCK TABLES `cms_pagepermission` WRITE;
/*!40000 ALTER TABLE `cms_pagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageuser`
--

DROP TABLE IF EXISTS `cms_pageuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageuser`
--

LOCK TABLES `cms_pageuser` WRITE;
/*!40000 ALTER TABLE `cms_pageuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageusergroup`
--

DROP TABLE IF EXISTS `cms_pageusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageusergroup`
--

LOCK TABLES `cms_pageusergroup` WRITE;
/*!40000 ALTER TABLE `cms_pageusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholder`
--

DROP TABLE IF EXISTS `cms_placeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_slot_0bc04d21` (`slot`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'clipboard',NULL),(2,'header',NULL),(3,'content',NULL),(4,'header',NULL),(5,'content',NULL),(6,'footer',NULL),(7,'footer',NULL),(8,'header',NULL),(9,'content',NULL),(10,'header',NULL),(11,'content',NULL),(12,'header',NULL),(13,'content',NULL),(14,'header',NULL),(15,'content',NULL),(16,'header',NULL),(17,'content',NULL),(18,'header',NULL),(19,'content',NULL),(20,'header',NULL),(21,'content',NULL),(22,'header',NULL),(23,'content',NULL),(24,'header',NULL),(25,'content',NULL),(26,'header',NULL),(27,'content',NULL),(28,'header',NULL),(29,'content',NULL),(30,'header',NULL),(31,'content',NULL),(32,'header',NULL),(33,'content',NULL),(34,'header',NULL),(35,'content',NULL),(36,'clipboard',NULL);
/*!40000 ALTER TABLE `cms_placeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholderreference`
--

DROP TABLE IF EXISTS `cms_placeholderreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholderreference` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `placeholder_ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cms_placeholderreference_placeholder_ref_id_244759b1` (`placeholder_ref_id`),
  CONSTRAINT `cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place` FOREIGN KEY (`placeholder_ref_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholderreference`
--

LOCK TABLES `cms_placeholderreference` WRITE;
/*!40000 ALTER TABLE `cms_placeholderreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_placeholderreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_staticplaceholder`
--

DROP TABLE IF EXISTS `cms_staticplaceholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_staticplaceholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `dirty` tinyint(1) NOT NULL,
  `creation_method` varchar(20) NOT NULL,
  `draft_id` int(11) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_staticplaceholder_code_site_id_21ba079c_uniq` (`code`,`site_id`),
  KEY `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` (`site_id`),
  KEY `cms_staticplaceholder_draft_id_5aee407b` (`draft_id`),
  KEY `cms_staticplaceholder_public_id_876aaa66` (`public_id`),
  CONSTRAINT `cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id` FOREIGN KEY (`draft_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id` FOREIGN KEY (`public_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_staticplaceholder`
--

LOCK TABLES `cms_staticplaceholder` WRITE;
/*!40000 ALTER TABLE `cms_staticplaceholder` DISABLE KEYS */;
INSERT INTO `cms_staticplaceholder` VALUES (1,'','footer',0,'template',6,7,NULL);
/*!40000 ALTER TABLE `cms_staticplaceholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_title`
--

DROP TABLE IF EXISTS `cms_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  `slug` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `redirect` varchar(2048) DEFAULT NULL,
  `creation_date` datetime(6) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_state` smallint(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_title_language_page_id_61aaf084_uniq` (`language`,`page_id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_title_page_id_5fade2a3_fk_cms_page_id` (`page_id`),
  KEY `cms_title_language_50a0dfa1` (`language`),
  KEY `cms_title_slug_4947d146` (`slug`),
  KEY `cms_title_path_c484314c` (`path`),
  KEY `cms_title_has_url_overwrite_ecf27bb9` (`has_url_overwrite`),
  KEY `cms_title_publisher_is_draft_95874c88` (`publisher_is_draft`),
  KEY `cms_title_publisher_state_9a952b0f` (`publisher_state`),
  CONSTRAINT `cms_title_page_id_5fade2a3_fk_cms_page_id` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `cms_title_publisher_public_id_003a2702_fk_cms_title_id` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (2,'de','Demoseite','','','','demo','demo',0,NULL,'2019-01-17 15:20:18.861068',1,1,0,2,3),(3,'de','Demoseite','','','','demo','demo',0,NULL,'2019-01-17 15:20:18.861068',1,0,0,3,2),(4,'de','Menü 1','','','','menu-1','menu-1',0,NULL,'2019-01-28 14:40:05.795016',1,1,0,4,8),(5,'de','Menü 2','','','','menu-2','menu-2',0,NULL,'2019-01-28 14:40:35.626035',1,1,0,5,9),(6,'de','Untermenü 1','','','','untermenu-1','menu-2/untermenu-1',0,NULL,'2019-01-28 14:40:44.071077',1,1,0,6,16),(7,'de','Untermenü 2','','','','untermenu-2','menu-2/untermenu-2',0,NULL,'2019-01-28 14:40:52.139361',1,1,0,7,17),(8,'de','Menü 1','','','','menu-1','menu-1',0,NULL,'2019-01-28 14:40:05.795016',1,0,0,8,4),(9,'de','Menü 2','','','','menu-2','menu-2',0,NULL,'2019-01-28 14:40:35.626035',1,0,0,9,5),(10,'de','Impressum','','','','impressum','impressum',0,NULL,'2019-01-28 15:29:40.962098',1,1,0,10,12),(11,'de','Datenschutz','','','','datenschutz','datenschutz',0,NULL,'2019-01-28 15:29:47.750501',1,1,0,11,13),(12,'de','Impressum','','','','impressum','impressum',0,NULL,'2019-01-28 15:29:40.962098',1,0,0,12,10),(13,'de','Datenschutz','','','','datenschutz','datenschutz',0,NULL,'2019-01-28 15:29:47.750501',1,0,0,13,11),(14,'de','Startseite','','','','home','',0,NULL,'2019-04-11 12:49:33.795870',1,1,0,14,15),(15,'de','Startseite','','','','home','',0,NULL,'2019-04-11 12:49:33.795870',1,0,0,15,14),(16,'de','Untermenü 1','','','','untermenu-1','menu-2/untermenu-1',0,NULL,'2019-01-28 14:40:44.071077',1,0,0,16,6),(17,'de','Untermenü 2','','','','untermenu-2','menu-2/untermenu-2',0,NULL,'2019-01-28 14:40:52.139361',1,0,0,17,7);
/*!40000 ALTER TABLE `cms_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_treenode`
--

DROP TABLE IF EXISTS `cms_treenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_treenode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` (`parent_id`),
  KEY `cms_treenode_site_id_d3f46985_fk_django_site_id` (`site_id`),
  CONSTRAINT `cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id` FOREIGN KEY (`parent_id`) REFERENCES `cms_treenode` (`id`),
  CONSTRAINT `cms_treenode_site_id_d3f46985_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_treenode`
--

LOCK TABLES `cms_treenode` WRITE;
/*!40000 ALTER TABLE `cms_treenode` DISABLE KEYS */;
INSERT INTO `cms_treenode` VALUES (2,'0005',1,0,NULL,1),(3,'0003',1,0,NULL,1),(4,'0004',1,2,NULL,1),(5,'00040001',2,0,4,1),(6,'00040002',2,0,4,1),(7,'0006',1,0,NULL,1),(8,'0007',1,0,NULL,1),(9,'0001',1,0,NULL,1);
/*!40000 ALTER TABLE `cms_treenode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_urlconfrevision`
--

DROP TABLE IF EXISTS `cms_urlconfrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_urlconfrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_urlconfrevision`
--

LOCK TABLES `cms_urlconfrevision` WRITE;
/*!40000 ALTER TABLE `cms_urlconfrevision` DISABLE KEYS */;
INSERT INTO `cms_urlconfrevision` VALUES (1,'f388c4bf-b0a1-4d86-b409-e159484af2b6');
/*!40000 ALTER TABLE `cms_urlconfrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_usersettings`
--

DROP TABLE IF EXISTS `cms_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(10) NOT NULL,
  `clipboard_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` (`clipboard_id`),
  CONSTRAINT `cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id` FOREIGN KEY (`clipboard_id`) REFERENCES `cms_placeholder` (`id`),
  CONSTRAINT `cms_usersettings_user_id_09633b2d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_usersettings`
--

LOCK TABLES `cms_usersettings` WRITE;
/*!40000 ALTER TABLE `cms_usersettings` DISABLE KEYS */;
INSERT INTO `cms_usersettings` VALUES (1,'de',1,1),(2,'de',36,2);
/*!40000 ALTER TABLE `cms_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-01-17 15:20:18.930303','2','Startseite',1,'[{\"added\": {}}]',2,1),(2,'2019-01-17 17:19:37.841176','1','Standardbild',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(3,'2019-01-17 17:20:22.830473','2','SEO-Bild',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(4,'2019-01-17 18:14:54.833574','2','Startseite',2,'',2,1),(5,'2019-01-28 10:02:28.822770','1','1',3,'',42,1),(6,'2019-01-28 10:05:21.231546','3','3',3,'',42,1),(7,'2019-01-28 10:06:03.538242','3','Testbild1.png',2,'[{\"changed\": {\"fields\": [\"subject_location\"]}}]',32,1),(8,'2019-01-28 10:10:53.872678','21','21',3,'',41,1),(9,'2019-01-28 10:10:59.213419','2','Startseite',2,'',2,1),(10,'2019-01-28 10:12:49.418422','2','Startseite',2,'',2,1),(11,'2019-01-28 10:20:38.699805','3','Testbild1.png',3,'',32,1),(12,'2019-01-28 10:20:38.752126','6','Testbild4.png',3,'',32,1),(13,'2019-01-28 10:20:49.239082','4','Standardbild2',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(14,'2019-01-28 10:20:59.132181','5','Standardbild 3',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(15,'2019-01-28 10:21:03.770289','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(16,'2019-01-28 10:21:24.367597','2','Startseite',2,'',2,1),(17,'2019-01-28 13:34:20.596205','2','Startseite',2,'',2,1),(18,'2019-01-28 13:35:42.845532','2','Startseite',2,'',2,1),(19,'2019-01-28 13:39:35.642954','2','Startseite',2,'',2,1),(20,'2019-01-28 13:43:24.350311','2','Startseite',2,'',2,1),(21,'2019-01-28 13:57:31.713101','2','Startseite',2,'',2,1),(22,'2019-01-28 13:57:49.986979','2','Startseite',2,'',2,1),(23,'2019-01-28 14:10:32.008143','2','Startseite',2,'',2,1),(24,'2019-01-28 14:15:07.508767','2','Startseite',2,'',2,1),(25,'2019-01-28 14:16:03.846057','2','Startseite',2,'',2,1),(26,'2019-01-28 14:17:42.571830','2','Startseite',2,'',2,1),(27,'2019-01-28 14:40:05.817132','4','Menü 1',1,'[{\"added\": {}}]',2,1),(28,'2019-01-28 14:40:15.648755','2','Startseite',2,'Die Deutsch Seite \"Startseite\" wurde erfolgreich auf nicht öffentlich gesetzt',2,1),(29,'2019-01-28 14:40:21.856737','2','Startseite',2,'',2,1),(30,'2019-01-28 14:40:28.523641','2','Startseite',2,'',2,1),(31,'2019-01-28 14:40:35.647769','5','Menü 2',1,'[{\"added\": {}}]',2,1),(32,'2019-01-28 14:40:44.090318','6','Untermenü 1',1,'[{\"added\": {}}]',2,1),(33,'2019-01-28 14:40:52.167772','7','Untermenü 2',1,'[{\"added\": {}}]',2,1),(34,'2019-01-28 15:20:50.940669','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',32,1),(35,'2019-01-28 15:21:01.811137','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',32,1),(36,'2019-01-28 15:21:10.013677','5','Standardbild 3',2,'[{\"changed\": {\"fields\": [\"file\", \"subject_location\"]}}]',32,1),(37,'2019-01-28 15:21:43.846103','7','Standardbild 4',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(38,'2019-01-28 15:22:02.796615','2','Startseite',2,'',2,1),(39,'2019-01-28 15:22:53.793507','2','Startseite',2,'',2,1),(40,'2019-01-28 15:29:33.196497','4','Menü 1',2,'',2,1),(41,'2019-01-28 15:29:35.394679','5','Menü 2',2,'',2,1),(42,'2019-01-28 15:29:40.980949','10','Impressum',1,'[{\"added\": {}}]',2,1),(43,'2019-01-28 15:29:47.798490','11','Datenschutz',1,'[{\"added\": {}}]',2,1),(44,'2019-01-28 15:56:53.683597','10','Impressum',2,'[]',2,1),(45,'2019-02-07 11:36:07.435400','2','Startseite',2,'',2,1),(46,'2019-02-07 15:07:01.871034','10','Impressum',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',2,1),(47,'2019-02-07 15:07:43.182800','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',2,1),(48,'2019-02-07 15:10:28.708362','10','Impressum',2,'',2,1),(49,'2019-02-07 15:10:32.424765','10','Impressum',2,'Die Deutsch Seite \"Impressum\" wurde erfolgreich auf nicht öffentlich gesetzt',2,1),(50,'2019-02-07 15:10:39.876742','10','Impressum',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(51,'2019-02-07 15:13:19.083372','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(52,'2019-02-07 15:24:24.968596','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(53,'2019-02-07 15:24:34.424332','10','Impressum',2,'',2,1),(54,'2019-02-07 15:24:48.310964','11','Datenschutz',2,'',2,1),(55,'2019-02-15 14:14:15.664557','2','Startseite',2,'',2,1),(56,'2019-02-15 14:15:30.303662','2','Startseite',2,'',2,1),(57,'2019-02-15 14:22:21.817470','2','Startseite',2,'',2,1),(58,'2019-03-05 09:36:28.112801','2','Startseite',2,'',2,1),(59,'2019-03-05 10:34:50.060904','2','Startseite',2,'',2,1),(60,'2019-03-05 10:38:27.777393','2','Startseite',2,'',2,1),(61,'2019-03-05 10:39:27.242101','2','Startseite',2,'',2,1),(62,'2019-04-11 12:49:24.198997','2','Demo',2,'[{\"changed\": {\"fields\": [\"title\", \"slug\"]}}]',2,1),(63,'2019-04-11 12:49:33.819564','14','Startseite',1,'[{\"added\": {}}]',2,1),(64,'2019-04-11 12:49:40.221179','14','Startseite',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',2,1),(65,'2019-04-11 12:50:01.798487','14','Startseite',2,'',2,1),(66,'2019-04-11 12:54:18.431253','2','Demo',2,'',2,1),(67,'2019-04-11 13:42:16.155349','2','Demo',2,'',2,1),(68,'2019-04-11 13:42:20.773619','14','Startseite',2,'',2,1),(69,'2019-04-11 14:17:51.870851','14','Bild mit Text',3,'',42,1),(70,'2019-04-11 14:19:37.798090','2','Demo',2,'',2,1),(71,'2019-04-11 14:29:39.748042','2','Demoseite',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',2,1),(72,'2019-04-11 14:29:43.161924','2','Demoseite',2,'',2,1),(73,'2019-04-11 14:44:02.518425','2','Demoseite',2,'',2,1),(74,'2019-04-11 15:09:42.418046','1','Editor',1,'[{\"added\": {}}]',5,1),(75,'2019-04-11 15:09:47.508340','2','translators',1,'[{\"added\": {}}]',5,1),(76,'2019-12-10 10:34:46.661628','620','sdf',3,'',42,1),(77,'2019-12-10 10:59:07.292113','623','Code mit Text',3,'',42,1),(78,'2019-12-10 11:32:14.956263','637','dsfdsf',3,'',42,1),(79,'2019-12-10 12:33:21.133739','8','maisengasse.svg',3,'',31,1),(80,'2019-12-10 12:34:50.981015','456','Testimonial',3,'',42,1),(81,'2019-12-10 12:36:03.704222','15','Highlights',3,'',42,1),(82,'2019-12-10 13:30:24.595523','636','None',3,'',42,1),(83,'2019-12-10 13:35:10.166107','2','Demoseite',2,'',2,1),(84,'2019-12-10 13:40:00.200700','2','Demoseite',2,'',2,1),(85,'2019-12-10 13:53:33.081008','6','Untermenü 1',2,'',2,1),(86,'2019-12-10 13:53:35.870563','7','Untermenü 2',2,'',2,1),(87,'2019-12-10 13:53:39.091363','11','Datenschutz',2,'',2,1),(88,'2019-12-10 14:18:08.315640','10','Profile',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',32,1),(89,'2019-12-10 14:18:26.918705','639','Testimonial',3,'',42,1),(90,'2019-12-10 14:29:04.367258','624','Team Gruppe',3,'',42,1),(91,'2019-12-10 14:32:06.363299','640','Highlight Gruppe',3,'',42,1),(92,'2019-12-10 14:35:16.612558','740','Highlight Gruppe',3,'',42,1),(93,'2019-12-10 14:35:39.161274','2','Demoseite',2,'',2,1),(94,'2019-12-10 14:45:50.988589','10','Profile',3,'',32,1),(95,'2019-12-10 14:46:37.323508','736','Team Gruppe',3,'',42,1),(96,'2019-12-10 14:46:39.682718','2','Demoseite',2,'',2,1),(97,'2019-12-10 14:47:19.358634','2','Demoseite',2,'',2,1),(98,'2019-12-10 14:58:36.322300','646','646',3,'',42,1),(99,'2019-12-10 14:59:05.284587','2','Demoseite',2,'',2,1),(100,'2019-12-10 15:04:32.252412','2','Demoseite',2,'',2,1),(101,'2019-12-10 15:06:15.694714','2','Demoseite',2,'',2,1),(102,'2019-12-10 15:06:42.050432','2','Demoseite',2,'',2,1),(103,'2019-12-12 12:33:29.136380','1','Editor',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',5,1),(104,'2019-12-12 12:34:09.302163','2','editor',1,'[{\"added\": {}}]',4,1),(105,'2019-12-12 12:34:23.501484','2','editor',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (44,'addresses','addressdata'),(45,'addresses','geolocation'),(9,'admin','logentry'),(5,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(17,'cms','aliaspluginmodel'),(12,'cms','cmsplugin'),(10,'cms','globalpagepermission'),(2,'cms','page'),(19,'cms','pagepermission'),(22,'cms','pagetype'),(16,'cms','pageuser'),(21,'cms','pageusergroup'),(1,'cms','placeholder'),(18,'cms','placeholderreference'),(15,'cms','staticplaceholder'),(13,'cms','title'),(20,'cms','treenode'),(11,'cms','urlconfrevision'),(14,'cms','usersettings'),(6,'contenttypes','contenttype'),(43,'djangocms_page_sitemap','pagesitemapproperties'),(33,'easy_thumbnails','source'),(34,'easy_thumbnails','thumbnail'),(35,'easy_thumbnails','thumbnaildimensions'),(38,'editables','editablechars'),(37,'editables','editableimage'),(39,'editables','editablerichtext'),(26,'filer','clipboard'),(30,'filer','clipboarditem'),(31,'filer','file'),(28,'filer','folder'),(27,'filer','folderpermission'),(32,'filer','image'),(29,'filer','thumbnailoption'),(36,'filerpool','remotefilerimage'),(23,'menus','cachekey'),(25,'reversion','revision'),(24,'reversion','version'),(7,'sessions','session'),(8,'sites','site'),(42,'stencils','stencildata'),(41,'stencils','stencilslider'),(40,'workflows','workflow');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-17 15:17:22.386599'),(2,'auth','0001_initial','2019-01-17 15:17:22.583004'),(3,'admin','0001_initial','2019-01-17 15:17:22.647494'),(4,'admin','0002_logentry_remove_auto_add','2019-01-17 15:17:22.659497'),(5,'contenttypes','0002_remove_content_type_name','2019-01-17 15:17:22.710838'),(6,'auth','0002_alter_permission_name_max_length','2019-01-17 15:17:22.739074'),(7,'auth','0003_alter_user_email_max_length','2019-01-17 15:17:22.768443'),(8,'auth','0004_alter_user_username_opts','2019-01-17 15:17:22.778330'),(9,'auth','0005_alter_user_last_login_null','2019-01-17 15:17:22.800738'),(10,'auth','0006_require_contenttypes_0002','2019-01-17 15:17:22.803533'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-17 15:17:22.814960'),(12,'auth','0008_alter_user_username_max_length','2019-01-17 15:17:22.846455'),(13,'sites','0001_initial','2019-01-17 15:17:22.860061'),(14,'cms','0001_initial','2019-01-17 15:17:23.368059'),(15,'cms','0002_auto_20140816_1918','2019-01-17 15:17:24.133256'),(16,'cms','0003_auto_20140926_2347','2019-01-17 15:17:24.166314'),(17,'cms','0004_auto_20140924_1038','2019-01-17 15:17:24.434282'),(18,'cms','0005_auto_20140924_1039','2019-01-17 15:17:24.460931'),(19,'cms','0006_auto_20140924_1110','2019-01-17 15:17:24.807346'),(20,'cms','0007_auto_20141028_1559','2019-01-17 15:17:24.829159'),(21,'cms','0008_auto_20150208_2149','2019-01-17 15:17:24.876173'),(22,'cms','0008_auto_20150121_0059','2019-01-17 15:17:24.901370'),(23,'cms','0009_merge','2019-01-17 15:17:24.904868'),(24,'cms','0010_migrate_use_structure','2019-01-17 15:17:24.954789'),(25,'cms','0011_auto_20150419_1006','2019-01-17 15:17:25.055718'),(26,'cms','0012_auto_20150607_2207','2019-01-17 15:17:25.187172'),(27,'cms','0013_urlconfrevision','2019-01-17 15:17:25.200752'),(28,'cms','0014_auto_20160404_1908','2019-01-17 15:17:25.232527'),(29,'cms','0015_auto_20160421_0000','2019-01-17 15:17:25.279850'),(30,'cms','0016_auto_20160608_1535','2019-01-17 15:17:25.380650'),(31,'cms','0017_pagetype','2019-01-17 15:17:25.508473'),(32,'cms','0018_pagenode','2019-01-17 15:17:25.816521'),(33,'cms','0019_set_pagenode','2019-01-17 15:17:25.877396'),(34,'cms','0020_old_tree_cleanup','2019-01-17 15:17:26.342065'),(35,'easy_thumbnails','0001_initial','2019-01-17 15:17:26.431949'),(36,'easy_thumbnails','0002_thumbnaildimensions','2019-01-17 15:17:26.477521'),(37,'filer','0001_initial','2019-01-17 15:17:27.228729'),(38,'filer','0002_auto_20150606_2003','2019-01-17 15:17:27.296893'),(39,'filer','0003_thumbnailoption','2019-01-17 15:17:27.311983'),(40,'filer','0004_auto_20160328_1434','2019-01-17 15:17:27.354887'),(41,'filer','0005_auto_20160623_1425','2019-01-17 15:17:27.531677'),(42,'filer','0006_auto_20160623_1627','2019-01-17 15:17:27.587946'),(43,'filer','0007_auto_20161016_1055','2019-01-17 15:17:27.602285'),(44,'filer','0008_auto_20171117_1313','2019-01-17 15:17:27.618316'),(45,'filer','0009_auto_20171220_1635','2019-01-17 15:17:27.663071'),(46,'filer','0010_auto_20180414_2058','2019-01-17 15:17:27.704687'),(47,'menus','0001_initial','2019-01-17 15:17:27.720951'),(48,'reversion','0001_squashed_0004_auto_20160611_1202','2019-01-17 15:17:27.870975'),(49,'sessions','0001_initial','2019-01-17 15:17:27.890764'),(50,'sites','0002_alter_domain_unique','2019-01-17 15:17:27.910483'),(51,'cms','0018_create_pagenode','2019-01-17 15:17:27.917357'),(52,'editables','0001_initial','2019-01-17 17:04:29.857951'),(53,'filerpool','0001_initial','2019-01-17 17:04:29.928756'),(54,'stencils','0001_initial','2019-01-17 17:04:30.070323'),(55,'workflows','0001_initial','2019-01-17 17:04:30.194595'),(56,'djangocms_page_sitemap','0001_initial','2019-02-13 09:26:32.936550'),(57,'djangocms_page_sitemap','0002_auto_20151018_1451','2019-02-13 09:26:32.964795'),(58,'djangocms_page_sitemap','0003_auto_20151018_1612','2019-02-13 09:26:32.985974'),(59,'djangocms_page_sitemap','0004_auto_20180202_1044','2019-02-13 09:26:33.043768'),(60,'djangocms_page_sitemap','0005_auto_20180324_1050','2019-02-13 09:26:33.075319'),(61,'stencils','0002_stencildata_container','2019-02-15 14:11:56.620929'),(62,'stencils','0003_auto_20190215_1459','2019-02-15 14:11:56.631901'),(63,'stencils','0004_auto_20190304_1426','2019-03-05 09:34:14.492344'),(64,'stencils','0005_auto_20190304_1448','2019-03-05 09:34:14.514857'),(65,'stencils','0006_auto_20190404_0944','2019-04-11 12:31:08.851987'),(66,'addresses','0001_initial','2019-12-09 16:16:20.205867'),(67,'addresses','0002_addressdata_district','2019-12-09 16:16:20.390453'),(68,'addresses','0003_geolocation','2019-12-09 16:16:20.449050'),(69,'admin','0003_logentry_add_action_flag_choices','2019-12-09 16:16:20.584114'),(70,'auth','0009_alter_user_last_name_max_length','2019-12-09 16:16:20.682780'),(71,'auth','0010_alter_group_name_max_length','2019-12-09 16:16:20.778872'),(72,'auth','0011_update_proxy_permissions','2019-12-09 16:16:20.808269'),(73,'cms','0021_auto_20180507_1432','2019-12-09 16:16:20.816537'),(74,'cms','0022_auto_20180620_1551','2019-12-09 16:16:20.831924'),(75,'filer','0011_auto_20190418_0137','2019-12-09 16:16:20.891178'),(76,'stencils','0007_auto_20190612_1324','2019-12-09 16:16:20.984158'),(77,'editables','0002_auto_20191209_1722','2019-12-09 16:22:46.940988'),(78,'stencils','0008_auto_20191209_1722','2019-12-09 16:22:47.359211');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3z4zyq30f9x6f00hcxdvfwfgzr3n4n7a','NDA4MzBiZmU3ZjVlNDNhNmZiZGMxOWYyZTNlZDA5Yjg2MWQxMTdhNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGYzZGRiNzQ2ZDI5NjQwNzlhMmI0NDQ1OTk0NGMzMTcyNDI4MTUzOCIsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX3ByZXZpZXciOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSIsImNtc19lZGl0Ijp0cnVlfQ==','2019-03-19 11:00:40.217432'),('5snd6q0ypyemgrmvmmaf16a7gcml08r7','OWU2M2QxZDMyZGE0OTliMjY4YTE2NzU5OGYzNDhiMzZhMGY2Yzk3NTp7ImNtc19lZGl0Ijp0cnVlLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZX0=','2019-02-21 11:33:14.119041'),('65zt730ti6a53ggtu04ijkmu5invtnp4','OTY2MDNiNzdhODE0NTcwZGUxNzc1OTc2MDZlNTZmNzg1ZDQ1MzE4Yjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMyYjkzNjNlOTUyMTA4ZGNiOGU5NTIwN2ZmNGQxNTRiOGM1ZjE0NDgiLCJmaWxlcl9sYXN0X2ZvbGRlcl9pZCI6IjMifQ==','2019-12-24 14:26:40.890249'),('af60m8nspfuz2co404hbqnmnnpqwzv6l','OGNiOGZlYzEwNmEzOGY5MTlhMTE5YmNhZmVhZWZmZTJhYWYzYWRlYjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMyYjkzNjNlOTUyMTA4ZGNiOGU5NTIwN2ZmNGQxNTRiOGM1ZjE0NDgiLCJjbXNfbG9nX2xhdGVzdCI6MTA1fQ==','2019-12-26 12:34:23.505432'),('bo5fe98kvul5qvh07u54ukt5874w7aj2','ZDYzMmNiMjMxMGY3YmU5MTUyNTUwOWNjNjc3MDYyZGIxMzlhNWY4ZTp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJjbXNfcHJldmlldyI6ZmFsc2UsIl9hdXRoX3VzZXJfaGFzaCI6IjhmM2RkYjc0NmQyOTY0MDc5YTJiNDQ0NTk5NDRjMzE3MjQyODE1MzgifQ==','2019-04-25 15:13:29.460626'),('d0nfcgg9bcax3e2c2y8b7yg71mfd4i4v','NDUzZThjMmY1OTkyMTc2ZGVkNjUzYzFhNWJjOTBlMTVmM2RiYWM5Zjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-02-11 10:01:39.154660'),('epw1jviod3xdeof538frd63phmex5gre','NDUzZThjMmY1OTkyMTc2ZGVkNjUzYzFhNWJjOTBlMTVmM2RiYWM5Zjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-03-19 09:35:58.211754'),('ezg6nctzlb5x45k1g5s3kv6aqha04a2i','ZjFiMDA5ZDM3ZWI3MDExNjkzOWU0OWMzNjMyOTI2NTRhODUwZjQ0Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODFkMjk1MDFlZGI0YzFjZDY4OTNjYTdmYzlhZjI4ZTMzNjI5NTJjIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJjbXNfZWRpdCI6dHJ1ZSwiY21zX3ByZXZpZXciOmZhbHNlfQ==','2019-12-26 12:35:17.683730'),('fq5267x14v6u2uy5wr7izr5ukdr7to5u','ZTZkMmRjN2I1NjEyZTFiNjhlOGQyY2IxZjEzYzE5N2VkNDY3Nzc1ODp7ImNtc19lZGl0Ijp0cnVlLCJjbXNfdG9vbGJhcl9kaXNhYmxlZCI6ZmFsc2UsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-03-01 10:52:43.591346'),('gtwxjdypd4fs0c1b2t01vacriailpcon','MTkzNGMyYjg2MjgyZDQ1MmQwYzA1ODU3MDQxMjM2MTY3NmU4ZjFiYjp7ImNtc19wcmV2aWV3IjpmYWxzZSwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJfYXV0aF91c2VyX2hhc2giOiJiMmFkOThiMGRjYzBjMzVhYzVkYTI5M2NjZTE2NDY1ZDc2NWVlNTlkIiwiY21zX2VkaXQiOnRydWUsImZpbGVyX2xhc3RfZm9sZGVyX2lkIjoiMyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2019-02-21 15:27:56.862029'),('i2y4pumyevpfvlhwqgnuj99vaip3rxhe','MjljOTY5ZGIxZDRiY2RlY2RlMjI4ZDVkMTFmNjdiOWEzNTgxZTYzMjp7ImNtc19lZGl0IjpmYWxzZX0=','2019-02-11 10:01:38.371541'),('llceel31x3cax4ftbezv7iydmq5q1sq4','OWE5MTc2YTU3OTI5MzJjYTMzNDYyZWIyNzQ5OGEyOWM0YjU0OGE0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyYWQ5OGIwZGNjMGMzNWFjNWRhMjkzY2NlMTY0NjVkNzY1ZWU1OWQiLCJ3aXphcmRfd2l6YXJkX2NyZWF0ZV92aWV3Ijp7InN0ZXAiOiIwIiwiZXh0cmFfZGF0YSI6e30sInN0ZXBfZGF0YSI6e30sInN0ZXBfZmlsZXMiOnt9fSwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJjbXNfZWRpdCI6dHJ1ZSwiY21zX3ByZXZpZXciOmZhbHNlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-31 15:41:31.337222'),('n7b9edy3sgwaasgh5xdkds0tjkgep9d1','OTY2MDNiNzdhODE0NTcwZGUxNzc1OTc2MDZlNTZmNzg1ZDQ1MzE4Yjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMyYjkzNjNlOTUyMTA4ZGNiOGU5NTIwN2ZmNGQxNTRiOGM1ZjE0NDgiLCJmaWxlcl9sYXN0X2ZvbGRlcl9pZCI6IjMifQ==','2019-12-24 15:07:46.735248'),('pn9i8l4on5j475k3dt7jxey0vudqd86c','OWU2M2QxZDMyZGE0OTliMjY4YTE2NzU5OGYzNDhiMzZhMGY2Yzk3NTp7ImNtc19lZGl0Ijp0cnVlLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZX0=','2019-02-21 14:21:41.693657'),('qhisxc17z5i460zfhj1c2x4pe7mcseov','YWEwMDM5MDVkZWMwYzRlZGNhNTkyZmYzOWY0MDljYTllOTVlNjVkZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiY21zX3ByZXZpZXciOnRydWUsImNtc19lZGl0IjpmYWxzZSwiZmlsZXJfbGFzdF9mb2xkZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhZDk4YjBkY2MwYzM1YWM1ZGEyOTNjY2UxNjQ2NWQ3NjVlZTU5ZCIsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2019-01-31 18:17:47.209081'),('rue9twyfmxdv9bac9gwpcvkisar082qf','ZThhMzY3NTZlYWM4MWVjMzFlYzAwZWRlOWQ2MjJiMTkxZTc0YzA5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyYWQ5OGIwZGNjMGMzNWFjNWRhMjkzY2NlMTY0NjVkNzY1ZWU1OWQiLCJjbXNfdG9vbGJhcl9kaXNhYmxlZCI6ZmFsc2UsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJjbXNfZWRpdCI6dHJ1ZSwiZmlsZXJfbGFzdF9mb2xkZXJfaWQiOm51bGwsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-02-11 15:57:11.979427'),('uz2oo05rqsfkhspsjct3zlknbvor8o1a','YWI1MWQ0NmJhZTYxNjEzMzI5ZmU2MTE1OGYxMzQyYmRlNGNkYWRhZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc19lZGl0Ijp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiJiMmFkOThiMGRjYzBjMzVhYzVkYTI5M2NjZTE2NDY1ZDc2NWVlNTlkIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlfQ==','2019-03-01 14:29:17.110218'),('xtmdelp3cpiir3is261n8ozz05lug3a5','OWU5NjE0NTE5NGE5MTg2YzI3Y2QzZDVhZmI3MDY0NzhkZGViYTcxZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhmM2RkYjc0NmQyOTY0MDc5YTJiNDQ0NTk5NDRjMzE3MjQyODE1MzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsImNtc19lZGl0Ijp0cnVlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX3ByZXZpZXciOmZhbHNlfQ==','2019-04-25 14:44:14.499407'),('zm4grr1qtv0o92ic205y2hkvp93jdr33','N2QyZTQxN2U4ZmYzODVlZTE3N2ViNDQ2MWQ4NDdlNDU4NmI1YmFhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJfYXV0aF91c2VyX2hhc2giOiJiMmFkOThiMGRjYzBjMzVhYzVkYTI5M2NjZTE2NDY1ZDc2NWVlNTlkIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc19lZGl0Ijp0cnVlfQ==','2019-02-21 13:46:04.731685');
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
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
-- Table structure for table `djangocms_page_sitemap_pagesitemapproperties`
--

DROP TABLE IF EXISTS `djangocms_page_sitemap_pagesitemapproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djangocms_page_sitemap_pagesitemapproperties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changefreq` varchar(20) NOT NULL,
  `priority` decimal(2,1) NOT NULL,
  `extended_object_id` int(11) NOT NULL,
  `public_extension_id` int(11) DEFAULT NULL,
  `include_in_sitemap` tinyint(1) NOT NULL,
  `noarchive` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL,
  `robots_extra` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extended_object_id` (`extended_object_id`),
  UNIQUE KEY `public_extension_id` (`public_extension_id`),
  CONSTRAINT `djangocms_page_sitem_extended_object_id_65dc451b_fk_cms_page_` FOREIGN KEY (`extended_object_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `djangocms_page_sitem_public_extension_id_9fbfef09_fk_djangocms` FOREIGN KEY (`public_extension_id`) REFERENCES `djangocms_page_sitemap_pagesitemapproperties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djangocms_page_sitemap_pagesitemapproperties`
--

LOCK TABLES `djangocms_page_sitemap_pagesitemapproperties` WRITE;
/*!40000 ALTER TABLE `djangocms_page_sitemap_pagesitemapproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `djangocms_page_sitemap_pagesitemapproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_source_storage_hash_name_481ce32d_uniq` (`storage_hash`,`name`),
  KEY `easy_thumbnails_source_storage_hash_946cbcc9` (`storage_hash`),
  KEY `easy_thumbnails_source_name_5fe0edc6` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_source` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg','2019-12-10 14:39:34.243186'),(2,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg','2019-12-10 10:41:54.964833'),(4,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png','2019-01-28 15:20:32.823361'),(5,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png','2019-01-28 15:21:04.583309'),(7,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png','2019-01-28 15:20:53.684148'),(8,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg','2019-12-10 10:50:35.719638'),(9,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png','2019-12-10 14:48:38.586627'),(10,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png','2019-12-10 11:09:58.296445'),(12,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/47/5f/475f33bd-3b10-4e34-a9e6-38606784f599/maisengasse.svg','2019-12-10 12:34:29.978074'),(14,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/ce/96/ce96c645-9f6e-4b45-9656-895476143eec/highlight.svg','2019-12-10 14:22:59.344516');
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq` (`storage_hash`,`name`,`source_id`),
  KEY `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` (`source_id`),
  KEY `easy_thumbnails_thumbnail_storage_hash_f1435f49` (`storage_hash`),
  KEY `easy_thumbnails_thumbnail_name_b5882c31` (`name`),
  CONSTRAINT `easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:23.816320',1),(2,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:23.958469',1),(3,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.099058',1),(4,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.238170',1),(5,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.386149',1),(6,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__210x0_q85_subsampling-2_upscale.jpg','2019-01-17 17:19:27.170165',1),(7,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:55.059937',1),(8,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:55.150676',1),(9,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:55.341085',1),(10,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:55.245883',1),(11,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.167379',2),(12,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.304220',2),(13,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.444840',2),(14,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.581898',2),(15,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.730846',2),(16,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__210x0_q85_subsampling-2_upscale.jpg','2019-01-17 17:20:06.091831',2),(17,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:54.590178',2),(18,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:54.683988',2),(19,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:54.870999',2),(20,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 10:41:54.777295',2),(21,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__1200x630_q85_crop_subject_location-1440,898_subsampling-2.jpg','2019-12-09 16:16:37.673836',2),(22,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__120x80_q85_subsampling-2.jpg','2019-12-10 10:41:54.967228',2),(23,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__120x80_q85_subsampling-2.jpg','2019-12-10 10:41:55.438949',1),(24,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1200x0_q85_subsampling-2.jpg','2019-03-05 09:35:32.032589',1),(25,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:55.062437',1),(26,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:55.189990',1),(27,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-03-05 09:35:32.573273',1),(28,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__1200x0_q85_subsampling-2.jpg','2019-01-18 15:13:53.888651',2),(29,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.003753',2),(30,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.138802',2),(31,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.431528',2),(37,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.775798',4),(38,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.858792',5),(39,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.859655',4),(40,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.949951',5),(42,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.953137',4),(44,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.093108',4),(45,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.143642',5),(46,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.177612',4),(48,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.244694',5),(50,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.331039',5),(52,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:05:53.920078',2),(59,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__120x80_q85_subsampling-2.jpg','2019-01-28 10:06:18.953123',4),(60,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__120x80_q85_subsampling-2.jpg','2019-01-28 10:06:19.057765',5),(62,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__600x0_q85_subsampling-2.jpg','2019-12-09 16:22:54.950708',1),(63,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1200x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:55.344173',1),(64,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__1200x0_q85_subsampling-2.jpg','2019-01-28 10:19:53.073261',5),(65,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.167178',5),(66,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.277341',5),(67,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.544616',5),(72,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:20:41.291797',4),(73,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.384060',4),(74,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.458560',4),(75,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.529007',4),(76,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.600575',4),(77,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__210x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:20:53.458830',5),(78,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.285805',5),(79,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.359099',5),(80,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.437120',5),(81,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.509770',5),(82,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:21:01.224675',4),(83,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:03.910436',4),(84,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:03.982213',4),(85,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:04.056100',4),(86,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:04.127349',4),(87,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__1200x0_q85_subsampling-2.jpg','2019-01-28 13:14:54.226909',4),(88,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.354039',4),(89,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.461852',4),(90,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.723278',4),(91,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:32.827341',4),(92,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.121134',7),(93,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.202449',7),(94,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.279626',7),(95,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.357259',7),(96,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__210x0_q85_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:53.686609',7),(97,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:41:55.543477',8),(98,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:41:55.870314',8),(99,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:41:55.757012',8),(100,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:41:55.648885',8),(101,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 15:21:04.585855',5),(102,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:36:40.100452',9),(103,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:36:40.313164',9),(104,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:36:40.241220',9),(105,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 10:36:40.172260',9),(106,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__1200x0_q85_subsampling-2.jpg','2019-12-09 16:22:52.982573',9),(107,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__480x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:53.077781',9),(108,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__800x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:53.185021',9),(109,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__2400x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:53.445432',9),(110,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__1200x0_q85_subsampling-2.jpg','2019-12-09 16:22:53.632378',8),(111,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:53.762698',8),(112,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:53.905254',8),(113,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-12-09 16:22:54.196842',8),(114,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__16x16_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.177775',10),(115,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__64x64_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.261432',10),(116,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__48x48_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.345398',10),(117,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__32x32_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.427590',10),(118,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__180x180_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.539506',10),(119,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__210x0_q85_subsampling-2_upscale.png','2019-01-28 15:21:35.528687',10),(120,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 10:41:56.141044',10),(121,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 10:41:56.380590',10),(122,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 10:41:56.299700',10),(123,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 10:41:56.219128',10),(124,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__120x80_q85_subsampling-2.jpg','2019-12-10 10:41:55.986507',8),(125,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__120x80_q85_subsampling-2.jpg','2019-12-10 10:41:56.064724',9),(126,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__120x80_q85_subsampling-2.png','2019-12-10 10:41:56.463305',10),(127,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__1200x0_q85_subsampling-2.png','2019-12-09 16:22:54.367296',10),(128,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__480x0_q85_subsampling-2_upscale.png','2019-12-09 16:22:54.464939',10),(129,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__800x0_q85_subsampling-2_upscale.png','2019-12-09 16:22:54.576767',10),(130,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__2400x0_q85_subsampling-2_upscale.png','2019-12-09 16:22:54.822128',10),(131,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__1920x1080_q85_crop_subject_location-1440,898_subsampling-2.png','2019-12-10 10:42:05.857987',10),(132,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__2400x0_q85_subsampling-2.jpg','2019-12-10 10:50:34.283740',1),(133,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__2400x0_q85_subsampling-2.png','2019-12-10 10:50:34.532312',10),(134,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__600x0_q85_subsampling-2.png','2019-12-10 10:50:34.966519',10),(135,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__1200x0_q85_subsampling-2_upscale.png','2019-12-10 10:50:35.117694',10),(136,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__2400x0_q85_subsampling-2.jpg','2019-12-10 10:50:35.414751',8),(137,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__600x0_q85_subsampling-2.jpg','2019-12-10 10:50:35.550615',8),(138,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__1200x0_q85_subsampling-2_upscale.jpg','2019-12-10 10:50:35.721980',8),(139,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__2400x0_q85_subsampling-2.jpg','2019-12-10 10:50:36.003961',9),(140,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__600x0_q85_subsampling-2.jpg','2019-12-10 10:50:36.104835',9),(141,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__1200x0_q85_subsampling-2_upscale.jpg','2019-12-10 10:50:36.244172',9),(142,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__500x500_q85_crop_subject_location-1440,898_subsampling-2.jpg','2019-12-10 11:05:34.675248',1),(143,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__480x480_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 11:05:34.801986',1),(144,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__800x800_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 11:05:34.951446',1),(145,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__500x500_q85_crop_subsampling-2.jpg','2019-12-10 11:05:35.084031',1),(146,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1000x1000_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 11:05:35.257538',1),(147,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1000x1000_q85_crop_subsampling-2_upscale.jpg','2019-12-10 11:05:35.437102',1),(148,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__1200x675_q85_crop_subject_location-1440,898_subsampling-2.png','2019-12-10 11:09:57.841405',10),(149,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__480x270_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 11:09:57.940635',10),(150,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__800x450_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 11:09:58.057336',10),(151,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__2400x1350_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-12-10 11:09:58.298553',10),(167,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-12-10 14:39:34.245235',1),(168,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__500x500_q85_crop_subject_location-1440,891_subsampling-2.jpg','2019-12-10 14:46:32.483914',9),(169,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__480x480_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 14:46:32.589602',9),(170,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__800x800_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 14:46:32.717230',9),(171,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__500x500_q85_crop_subsampling-2.jpg','2019-12-10 14:46:32.826824',9),(172,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__1000x1000_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 14:46:32.986366',9),(173,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__1000x1000_q85_crop_subsampling-2_upscale.jpg','2019-12-10 14:46:33.145382',9),(174,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__300x300_q85_crop_subject_location-1440,891_subsampling-2.jpg','2019-12-10 14:48:38.275967',9),(175,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__300x300_q85_crop_subsampling-2.jpg','2019-12-10 14:48:38.366884',9),(176,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__600x600_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-12-10 14:48:38.479407',9),(177,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__600x600_q85_crop_subsampling-2_upscale.jpg','2019-12-10 14:48:38.589106',9);
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnaildimensions`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnaildimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnaildimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thumbnail_id` (`thumbnail_id`),
  CONSTRAINT `easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum` FOREIGN KEY (`thumbnail_id`) REFERENCES `easy_thumbnails_thumbnail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnaildimensions`
--

LOCK TABLES `easy_thumbnails_thumbnaildimensions` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnaildimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editables_editablechars`
--

DROP TABLE IF EXISTS `editables_editablechars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editables_editablechars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `as_template` tinyint(1) NOT NULL,
  `content` varchar(255) NOT NULL,
  `content_de` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editables_editablechars`
--

LOCK TABLES `editables_editablechars` WRITE;
/*!40000 ALTER TABLE `editables_editablechars` DISABLE KEYS */;
/*!40000 ALTER TABLE `editables_editablechars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editables_editableimage`
--

DROP TABLE IF EXISTS `editables_editableimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editables_editableimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `as_template` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editables_editableimage`
--

LOCK TABLES `editables_editableimage` WRITE;
/*!40000 ALTER TABLE `editables_editableimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `editables_editableimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editables_editablerichtext`
--

DROP TABLE IF EXISTS `editables_editablerichtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editables_editablerichtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `as_template` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `content_de` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editables_editablerichtext`
--

LOCK TABLES `editables_editablerichtext` WRITE;
/*!40000 ALTER TABLE `editables_editablerichtext` DISABLE KEYS */;
INSERT INTO `editables_editablerichtext` VALUES (1,'footer',0,'\n                                <p>\n                                    Büro Maisengasse OG <br>\n                                    Maisengasse 18 <br>\n                                    6500 Landeck <br>&nbsp;<br>\n                                    <a href=\"mailto:office@maisengasse.at\">office@maisengasse.at</a>\n                                    <a href=\"http://www.maisengasse.at/\">www.maisengasse.at</a>\n                                </p>\n                                ','\n                                <p>\n                                    Büro Maisengasse OG <br>\n                                    Maisengasse 18 <br>\n                                    6500 Landeck <br>&nbsp;<br>\n                                    <a href=\"mailto:office@maisengasse.at\">office@maisengasse.at</a>\n                                    <a href=\"http://www.maisengasse.at/\">www.maisengasse.at</a>\n                                </p>\n                                ');
/*!40000 ALTER TABLE `editables_editablerichtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_clipboard`
--

DROP TABLE IF EXISTS `filer_clipboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_clipboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_clipboard_user_id_b52ff0bc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `filer_clipboard_user_id_b52ff0bc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_clipboard`
--

LOCK TABLES `filer_clipboard` WRITE;
/*!40000 ALTER TABLE `filer_clipboard` DISABLE KEYS */;
INSERT INTO `filer_clipboard` VALUES (1,1);
/*!40000 ALTER TABLE `filer_clipboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_clipboarditem`
--

DROP TABLE IF EXISTS `filer_clipboarditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_clipboarditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clipboard_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id` (`clipboard_id`),
  KEY `filer_clipboarditem_file_id_06196f80_fk_filer_file_id` (`file_id`),
  CONSTRAINT `filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id` FOREIGN KEY (`clipboard_id`) REFERENCES `filer_clipboard` (`id`),
  CONSTRAINT `filer_clipboarditem_file_id_06196f80_fk_filer_file_id` FOREIGN KEY (`file_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_clipboarditem`
--

LOCK TABLES `filer_clipboarditem` WRITE;
/*!40000 ALTER TABLE `filer_clipboarditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `filer_clipboarditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_file`
--

DROP TABLE IF EXISTS `filer_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `_file_size` bigint(20) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL,
  `has_all_mandatory_data` tinyint(1) NOT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `uploaded_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_file_folder_id_af803bbb_fk_filer_folder_id` (`folder_id`),
  KEY `filer_file_polymorphic_ctype_id_f44903c1_fk_django_co` (`polymorphic_ctype_id`),
  KEY `filer_file_owner_id_b9e32671_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `filer_file_folder_id_af803bbb_fk_filer_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `filer_file_owner_id_b9e32671_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `filer_file_polymorphic_ctype_id_f44903c1_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_file`
--

LOCK TABLES `filer_file` WRITE;
/*!40000 ALTER TABLE `filer_file` DISABLE KEYS */;
INSERT INTO `filer_file` VALUES (1,'filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg',361700,'189fd19417c28b2e754cf1682d1c43fc0706da58',1,'jerli_bg02.jpg','Standardbild',NULL,'2019-01-17 17:19:23.614083','2019-01-17 17:19:37.837037',1,3,1,32),(2,'filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg',361700,'189fd19417c28b2e754cf1682d1c43fc0706da58',1,'jerli_bg02.jpg','SEO-Bild',NULL,'2019-01-17 17:20:03.001630','2019-01-17 17:20:22.826882',1,3,1,32),(4,'filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg',55368,'c299aa00055fea13f7c632fce4fdcb7a9c56e3e1',1,'Testbild2.png','Standardbild 2',NULL,'2019-01-28 10:05:51.674839','2019-01-28 15:21:01.804874',1,3,1,32),(5,'filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png',28131,'cffe68eded5719ada7207d37d3643ce99bc94ae7',1,'Testbild3.png','Standardbild 3',NULL,'2019-01-28 10:05:51.683556','2019-01-28 15:21:10.012299',1,3,1,32),(7,'filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png',27503,'7940beead55f1587624547ade96fc32495127316',1,'Dots.png','Standardbild 4',NULL,'2019-01-28 15:21:32.085238','2019-01-28 15:21:43.844725',1,3,1,32),(9,'filer_public/47/5f/475f33bd-3b10-4e34-a9e6-38606784f599/maisengasse.svg',11021,'1007657edf6c2994749606d8d19a4a194f6da022',0,'maisengasse.svg','',NULL,'2019-12-10 12:34:29.980104','2019-12-10 12:34:29.980122',1,4,1,31),(11,'filer_public/ce/96/ce96c645-9f6e-4b45-9656-895476143eec/highlight.svg',992,'05ba2eb6bf3b7d8906e9269842aec6217a81871c',0,'highlight.svg','',NULL,'2019-12-10 14:22:59.351786','2019-12-10 14:22:59.351822',1,4,1,31);
/*!40000 ALTER TABLE `filer_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_folder`
--

DROP TABLE IF EXISTS `filer_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filer_folder_parent_id_name_bc773258_uniq` (`parent_id`,`name`),
  KEY `filer_folder_tree_id_b016223c` (`tree_id`),
  KEY `filer_folder_owner_id_be530fb4_fk_auth_user_id` (`owner_id`),
  KEY `filer_folder_tree_id_lft_088ce52b_idx` (`tree_id`,`lft`),
  CONSTRAINT `filer_folder_owner_id_be530fb4_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `filer_folder_parent_id_308aecda_fk_filer_folder_id` FOREIGN KEY (`parent_id`) REFERENCES `filer_folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folder`
--

LOCK TABLES `filer_folder` WRITE;
/*!40000 ALTER TABLE `filer_folder` DISABLE KEYS */;
INSERT INTO `filer_folder` VALUES (1,'Bilder','2019-01-17 17:07:42.716674','2019-01-17 17:07:42.716711','2019-01-17 17:07:42.716725',1,4,1,0,1,NULL),(2,'Downloads','2019-01-17 17:07:48.588977','2019-01-17 17:07:48.589019','2019-01-17 17:07:48.589035',1,4,2,0,1,NULL),(3,'Testbilder','2019-01-17 17:07:54.586338','2019-01-17 17:07:54.586377','2019-01-17 17:07:54.586392',2,3,1,1,1,1),(4,'maisengasse','2019-12-10 12:33:55.714543','2019-12-10 12:33:55.714568','2019-12-10 12:33:55.714577',2,3,2,1,1,2);
/*!40000 ALTER TABLE `filer_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_folderpermission`
--

DROP TABLE IF EXISTS `filer_folderpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_folderpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `everybody` tinyint(1) NOT NULL,
  `can_edit` smallint(6) DEFAULT NULL,
  `can_read` smallint(6) DEFAULT NULL,
  `can_add_children` smallint(6) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id` (`folder_id`),
  KEY `filer_folderpermission_group_id_8901bafa_fk_auth_group_id` (`group_id`),
  KEY `filer_folderpermission_user_id_7673d4b6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `filer_folderpermission_group_id_8901bafa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `filer_folderpermission_user_id_7673d4b6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folderpermission`
--

LOCK TABLES `filer_folderpermission` WRITE;
/*!40000 ALTER TABLE `filer_folderpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `filer_folderpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_image`
--

DROP TABLE IF EXISTS `filer_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_image` (
  `file_ptr_id` int(11) NOT NULL,
  `_height` int(11) DEFAULT NULL,
  `_width` int(11) DEFAULT NULL,
  `date_taken` datetime(6) DEFAULT NULL,
  `default_alt_text` varchar(255) DEFAULT NULL,
  `default_caption` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `must_always_publish_author_credit` tinyint(1) NOT NULL,
  `must_always_publish_copyright` tinyint(1) NOT NULL,
  `subject_location` varchar(64) NOT NULL,
  PRIMARY KEY (`file_ptr_id`),
  CONSTRAINT `filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id` FOREIGN KEY (`file_ptr_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_image`
--

LOCK TABLES `filer_image` WRITE;
/*!40000 ALTER TABLE `filer_image` DISABLE KEYS */;
INSERT INTO `filer_image` VALUES (1,1800,2880,'2019-01-17 17:19:23.591376',NULL,NULL,NULL,0,0,'1440,898'),(2,1800,2880,'2019-01-17 17:20:02.974992',NULL,NULL,NULL,0,0,'1440,898'),(4,1800,2880,'2019-01-28 10:05:51.659988',NULL,NULL,NULL,0,0,'1440,891'),(5,1800,2880,'2019-01-28 10:05:51.667846',NULL,NULL,NULL,0,0,'1440,891'),(7,1800,2880,'2019-01-28 15:21:32.078733',NULL,NULL,NULL,0,0,'1440,898');
/*!40000 ALTER TABLE `filer_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_thumbnailoption`
--

DROP TABLE IF EXISTS `filer_thumbnailoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_thumbnailoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `crop` tinyint(1) NOT NULL,
  `upscale` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_thumbnailoption`
--

LOCK TABLES `filer_thumbnailoption` WRITE;
/*!40000 ALTER TABLE `filer_thumbnailoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `filer_thumbnailoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filerpool_remotefilerimage`
--

DROP TABLE IF EXISTS `filerpool_remotefilerimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filerpool_remotefilerimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_id` (`image_id`),
  CONSTRAINT `filerpool_remotefile_image_id_0eef252b_fk_filer_ima` FOREIGN KEY (`image_id`) REFERENCES `filer_image` (`file_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filerpool_remotefilerimage`
--

LOCK TABLES `filerpool_remotefilerimage` WRITE;
/*!40000 ALTER TABLE `filerpool_remotefilerimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `filerpool_remotefilerimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_cachekey`
--

DROP TABLE IF EXISTS `menus_cachekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_cachekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `site` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (131,'de',1,'cms_3.7.0_menu_nodes_de_1:public'),(132,'de',1,'cms_3.7.0_menu_nodes_de_1_2_user:draft');
/*!40000 ALTER TABLE `menus_cachekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_auth_user_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stencils_stencildata`
--

DROP TABLE IF EXISTS `stencils_stencildata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stencils_stencildata` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `body` longtext,
  `images` longtext,
  `files` longtext,
  `caption` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `link_label` varchar(255) DEFAULT NULL,
  `cssclass` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `container` varchar(20) DEFAULT NULL,
  `ratio` double DEFAULT NULL,
  `code` longtext,
  `body_de` longtext,
  `caption_de` varchar(255) DEFAULT NULL,
  `link_de` varchar(255) DEFAULT NULL,
  `link_label_de` varchar(255) DEFAULT NULL,
  `subtitle_de` varchar(255) DEFAULT NULL,
  `title_de` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `stencils_stencildata_cmsplugin_ptr_id_b614621a_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stencils_stencildata`
--

LOCK TABLES `stencils_stencildata` WRITE;
/*!40000 ALTER TABLE `stencils_stencildata` DISABLE KEYS */;
INSERT INTO `stencils_stencildata` VALUES (7,'Teaser Gruppe',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,NULL,'',NULL,NULL,NULL,NULL,'Teaser Gruppe'),(8,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL,'',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(9,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL,'',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(10,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAAxcQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(20,'Highlight',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQB9cQEoWAIAAABpZHECWAIAAAAxMXEDWAcAAABjYXB0aW9ucQRYAAAAAHEFdWEu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Highlight'),(184,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Bild mit Text'),(432,'Testimonial',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>',NULL,NULL,NULL,NULL,'Testimonial'),(545,NULL,NULL,'','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(546,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA0cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Vollbild mit Text'),(548,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Bild mit Text'),(550,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA0cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Vollbild mit Text'),(551,'Vollbild mit Textspalten',NULL,'','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,NULL,'',NULL,NULL,NULL,NULL,'Vollbild mit Textspalten'),(552,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Textspalte'),(553,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Textspalte'),(596,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(619,'Datenschutzerklärung',NULL,'<h4><strong>DATENSCHUTZERKL&Auml;RUNG</strong></h4>\r\n\r\n<p>Der Schutz Ihrer pers&ouml;nlichen Daten ist uns ein besonderes Anliegen. Wir verarbeiten Ihre Daten daher ausschlie&szlig;lich auf Grundlage der gesetzlichen Bestimmungen (DSGVO, TKG 2003). In diesen Datenschutzinformationen informieren wir Sie &uuml;ber die wichtigsten Aspekte der Datenverarbeitung im Rahmen unserer Website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>KONTAKT MIT UNS</strong></h4>\r\n\r\n<p>Wenn Sie per Formular auf der Website oder per E-Mail Kontakt mit uns aufnehmen, werden Ihre angegebenen Daten zwecks Bearbeitung der Anfrage und f&uuml;r den Fall von Anschlussfragen sechs Monate bei uns gespeichert. Diese Daten geben wir nicht ohne Ihre Einwilligung weiter.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>COOKIES</strong></h4>\r\n\r\n<p>Unsere Website verwendet sogenannte Cookies. Dabei handelt es sich um kleine Textdateien, die mit Hilfe des Browsers auf Ihrem Endger&auml;t abgelegt werden. Sie richten keinen Schaden an. Wir nutzen Cookies dazu, unser Angebot nutzerfreundlich zu gestalten.</p>\r\n\r\n<p>Einige Cookies bleiben auf Ihrem Endger&auml;t gespeichert, bis Sie diese l&ouml;schen. Sie erm&ouml;glichen es uns, Ihren Browser beim n&auml;chsten Besuch wiedererkennen zu k&ouml;nnen. Wenn Sie dies nicht w&uuml;nschen, so k&ouml;nnen Sie Ihren Browser so einrichten, dass er Sie &uuml;ber das Setzen von Cookies informiert und Sie dies nur im Einzelfall erlauben. Bei der Deaktivierung von Cookies kann die Funktionalit&auml;t unserer Website eingeschr&auml;nkt sein.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE ANALYTICS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Funktionen des Webanalysedienstes Google Analytics von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Google Analytics verwendet sogenannte Cookies, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie erm&ouml;glichen. Die durch das Cookie erzeugten Informationen &uuml;ber Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA &uuml;bertragen und dort gespeichert.</p>\r\n\r\n<p>Sie k&ouml;nnen die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht s&auml;mtliche Funktionen dieser Website vollumf&auml;nglich werden nutzen k&ouml;nnen.</p>\r\n\r\n<p>Sie k&ouml;nnen dar&uuml;ber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link&nbsp;<a href=\"http://tools.google.com/dlpage/gaoptout?hl=de\" target=\"_blank\">http://tools.google.com/dlpage/gaoptout?hl=de</a>&nbsp;verf&uuml;gbare Browser-Plugin herunterladen und installieren.</p>\r\n\r\n<p>Wir haben mit dem Anbieter einen entsprechenden Vertrag zur Auftragsdatenverarbeitung abgeschlossen.</p>\r\n\r\n<p>Ihre IP-Adresse wird erfasst, aber umgehend (durch L&ouml;schung der letzten 8 Bit) pseudonymisiert. Dadurch ist nur mehr eine grobe Lokalisierung m&ouml;glich. Die im Rahmen von Google Analytics von Ihrem Browser &uuml;bermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengef&uuml;hrt.</p>\r\n\r\n<p>Die Datenverarbeitung erfolgt auf Basis der gesetzlichen Bestimmungen des &sect; 96 Abs 3 TKG sowie des Art 6 Abs 1 lit a (Einwilligung) und/oder f (berechtigtes Interesse) der DSGVO.</p>\r\n\r\n<p>Unser Anliegen im Sinne der DSGVO (berechtigtes Interesse) ist die Verbesserung unseres Angebotes und unseres Webauftritts. Da uns die Privatsph&auml;re unserer Nutzer wichtig ist, werden die Nutzerdaten pseudonymisiert. Die Nutzerdaten werden durch Google ausgewertet, um Reports zu erstellen.</p>\r\n\r\n<p>Sie k&ouml;nnen die Erfassung durch Google Analytics verhindern, indem Sie auf folgenden Link klicken. Es wird ein Opt-Out-Cookie gesetzt, das die zuk&uuml;nftige Erfassung Ihrer Daten beim Besuch dieser Website verhindert:&nbsp;<a href=\"javascript:gaOptout()\">Google Analytics deaktivieren</a>.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"https://www.google.com/analytics/learn/privacy.html?hl=de\" target=\"_blank\">https://www.google.com/analytics/learn/privacy.html?hl=de</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>EINBINDUNG VON DIENSTEN UND INHALTEN DRITTER</strong></h4>\r\n\r\n<p>Es kann vorkommen, dass wir auf unserer Website Inhalte Dritter, wie zum Beispiel YouTube oder anderer Webseiten einbinden. Wir bem&uuml;hen uns, dass Inhalte unserer Partner datenschutzkonform verwendet werden, jedoch haben wir keinen Einfluss darauf.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google entnehmen:&nbsp;<a href=\"https://www.google.at/intl/de/policies/privacy/\" target=\"_blank\">https://www.google.at/intl/de/policies/privacy/</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE-MAPS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Kartenmaterial von Google Maps von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Bei jedem Aufruf von Google Maps wird von Google ein Cookie gesetzt, um bei der Anzeige der Seite Nutzereinstellungen und -daten zu verarbeiten.</p>\r\n\r\n<p>Dieses Cookie wird im Regelfall nicht durch das Schlie&szlig;en des Browsers gel&ouml;scht, sondern l&auml;uft nach einer bestimmten Zeit ab, soweit es nicht von Ihnen zuvor manuell gel&ouml;scht wird.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"http://www.google.com/intl/de_de/help/terms_maps.html\" target=\"_blank\">http://www.google.com/intl/de_de/help/terms_maps.html</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>FACEBOOK</strong></h4>\r\n\r\n<p>Unsere Website verwendet Plugins des sozialen Netzwerkes facebook.com der Facebook Inc. in 1601 S. California Ave, Palo Alto, CA 94304, USA. Das Plugin stellt eine Verbindung zu den Facebook-Servern her um es korrekt darstellen zu k&ouml;nnen. Dabei wird an den Facebook-Server &uuml;bermittelt, welche unserer Internetseiten Sie besucht haben. Wenn sie w&auml;hrenddessen bei Facebook eingeloggt sind, ordnet Facebook diese Information Ihrem pers&ouml;nlichen Facebook-Benutzerkonto zu.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Facebook entnehmen:&nbsp;<a href=\"https://www.facebook.com/privacy/explanation\" target=\"_blank\">https://www.facebook.com/privacy/explanation</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>NEWSLETTER</strong></h4>\r\n\r\n<p>Sie haben die M&ouml;glichkeit, &uuml;ber unsere Website unseren Newsletter zu abonnieren. Hierf&uuml;r ben&ouml;tigen wir Ihre E-Mail-Adresse und ihre Erkl&auml;rung, dass Sie mit dem Bezug des Newsletters einverstanden sind. Sobald Sie sich f&uuml;r den Newsletter angemeldet haben, senden wir Ihnen ein Best&auml;tigungs-E-Mail mit einem Link zur Best&auml;tigung der Anmeldung.</p>\r\n\r\n<p>Das Abo des Newsletters k&ouml;nnen Sie jederzeit stornieren. Senden Sie Ihre Stornierung bitte an folgende E-Mail-Adresse:&nbsp;<a href=\"mailto:info@tld.at\">info@tld.at</a>. Wir l&ouml;schen anschlie&szlig;end umgehend Ihre Daten im Zusammenhang mit dem Newsletter-Versand.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>IHRE RECHTE</strong></h4>\r\n\r\n<p>Ihnen stehen grunds&auml;tzlich die Rechte auf Auskunft, Berichtigung, L&ouml;schung, Einschr&auml;nkung, Daten&uuml;bertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verst&ouml;&szlig;t oder Ihre datenschutzrechtlichen Anspr&uuml;che sonst in einer Weise verletzt worden sind, k&ouml;nnen Sie sich bei der Aufsichtsbeh&ouml;rde beschweren. In &Ouml;sterreich ist dies die Datenschutzbeh&ouml;rde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>SIE ERREICHEN UNS UNTER FOLGENDEN KONTAKTDATEN:</strong></h4>\r\n\r\n<p>Kontakdaten</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'2-cols','container',NULL,NULL,'<h4><strong>DATENSCHUTZERKL&Auml;RUNG</strong></h4>\r\n\r\n<p>Der Schutz Ihrer pers&ouml;nlichen Daten ist uns ein besonderes Anliegen. Wir verarbeiten Ihre Daten daher ausschlie&szlig;lich auf Grundlage der gesetzlichen Bestimmungen (DSGVO, TKG 2003). In diesen Datenschutzinformationen informieren wir Sie &uuml;ber die wichtigsten Aspekte der Datenverarbeitung im Rahmen unserer Website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>KONTAKT MIT UNS</strong></h4>\r\n\r\n<p>Wenn Sie per Formular auf der Website oder per E-Mail Kontakt mit uns aufnehmen, werden Ihre angegebenen Daten zwecks Bearbeitung der Anfrage und f&uuml;r den Fall von Anschlussfragen sechs Monate bei uns gespeichert. Diese Daten geben wir nicht ohne Ihre Einwilligung weiter.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>COOKIES</strong></h4>\r\n\r\n<p>Unsere Website verwendet sogenannte Cookies. Dabei handelt es sich um kleine Textdateien, die mit Hilfe des Browsers auf Ihrem Endger&auml;t abgelegt werden. Sie richten keinen Schaden an. Wir nutzen Cookies dazu, unser Angebot nutzerfreundlich zu gestalten.</p>\r\n\r\n<p>Einige Cookies bleiben auf Ihrem Endger&auml;t gespeichert, bis Sie diese l&ouml;schen. Sie erm&ouml;glichen es uns, Ihren Browser beim n&auml;chsten Besuch wiedererkennen zu k&ouml;nnen. Wenn Sie dies nicht w&uuml;nschen, so k&ouml;nnen Sie Ihren Browser so einrichten, dass er Sie &uuml;ber das Setzen von Cookies informiert und Sie dies nur im Einzelfall erlauben. Bei der Deaktivierung von Cookies kann die Funktionalit&auml;t unserer Website eingeschr&auml;nkt sein.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE ANALYTICS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Funktionen des Webanalysedienstes Google Analytics von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Google Analytics verwendet sogenannte Cookies, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie erm&ouml;glichen. Die durch das Cookie erzeugten Informationen &uuml;ber Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA &uuml;bertragen und dort gespeichert.</p>\r\n\r\n<p>Sie k&ouml;nnen die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht s&auml;mtliche Funktionen dieser Website vollumf&auml;nglich werden nutzen k&ouml;nnen.</p>\r\n\r\n<p>Sie k&ouml;nnen dar&uuml;ber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link&nbsp;<a href=\"http://tools.google.com/dlpage/gaoptout?hl=de\" target=\"_blank\">http://tools.google.com/dlpage/gaoptout?hl=de</a>&nbsp;verf&uuml;gbare Browser-Plugin herunterladen und installieren.</p>\r\n\r\n<p>Wir haben mit dem Anbieter einen entsprechenden Vertrag zur Auftragsdatenverarbeitung abgeschlossen.</p>\r\n\r\n<p>Ihre IP-Adresse wird erfasst, aber umgehend (durch L&ouml;schung der letzten 8 Bit) pseudonymisiert. Dadurch ist nur mehr eine grobe Lokalisierung m&ouml;glich. Die im Rahmen von Google Analytics von Ihrem Browser &uuml;bermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengef&uuml;hrt.</p>\r\n\r\n<p>Die Datenverarbeitung erfolgt auf Basis der gesetzlichen Bestimmungen des &sect; 96 Abs 3 TKG sowie des Art 6 Abs 1 lit a (Einwilligung) und/oder f (berechtigtes Interesse) der DSGVO.</p>\r\n\r\n<p>Unser Anliegen im Sinne der DSGVO (berechtigtes Interesse) ist die Verbesserung unseres Angebotes und unseres Webauftritts. Da uns die Privatsph&auml;re unserer Nutzer wichtig ist, werden die Nutzerdaten pseudonymisiert. Die Nutzerdaten werden durch Google ausgewertet, um Reports zu erstellen.</p>\r\n\r\n<p>Sie k&ouml;nnen die Erfassung durch Google Analytics verhindern, indem Sie auf folgenden Link klicken. Es wird ein Opt-Out-Cookie gesetzt, das die zuk&uuml;nftige Erfassung Ihrer Daten beim Besuch dieser Website verhindert:&nbsp;<a href=\"javascript:gaOptout()\">Google Analytics deaktivieren</a>.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"https://www.google.com/analytics/learn/privacy.html?hl=de\" target=\"_blank\">https://www.google.com/analytics/learn/privacy.html?hl=de</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>EINBINDUNG VON DIENSTEN UND INHALTEN DRITTER</strong></h4>\r\n\r\n<p>Es kann vorkommen, dass wir auf unserer Website Inhalte Dritter, wie zum Beispiel YouTube oder anderer Webseiten einbinden. Wir bem&uuml;hen uns, dass Inhalte unserer Partner datenschutzkonform verwendet werden, jedoch haben wir keinen Einfluss darauf.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google entnehmen:&nbsp;<a href=\"https://www.google.at/intl/de/policies/privacy/\" target=\"_blank\">https://www.google.at/intl/de/policies/privacy/</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE-MAPS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Kartenmaterial von Google Maps von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Bei jedem Aufruf von Google Maps wird von Google ein Cookie gesetzt, um bei der Anzeige der Seite Nutzereinstellungen und -daten zu verarbeiten.</p>\r\n\r\n<p>Dieses Cookie wird im Regelfall nicht durch das Schlie&szlig;en des Browsers gel&ouml;scht, sondern l&auml;uft nach einer bestimmten Zeit ab, soweit es nicht von Ihnen zuvor manuell gel&ouml;scht wird.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"http://www.google.com/intl/de_de/help/terms_maps.html\" target=\"_blank\">http://www.google.com/intl/de_de/help/terms_maps.html</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>FACEBOOK</strong></h4>\r\n\r\n<p>Unsere Website verwendet Plugins des sozialen Netzwerkes facebook.com der Facebook Inc. in 1601 S. California Ave, Palo Alto, CA 94304, USA. Das Plugin stellt eine Verbindung zu den Facebook-Servern her um es korrekt darstellen zu k&ouml;nnen. Dabei wird an den Facebook-Server &uuml;bermittelt, welche unserer Internetseiten Sie besucht haben. Wenn sie w&auml;hrenddessen bei Facebook eingeloggt sind, ordnet Facebook diese Information Ihrem pers&ouml;nlichen Facebook-Benutzerkonto zu.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Facebook entnehmen:&nbsp;<a href=\"https://www.facebook.com/privacy/explanation\" target=\"_blank\">https://www.facebook.com/privacy/explanation</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>NEWSLETTER</strong></h4>\r\n\r\n<p>Sie haben die M&ouml;glichkeit, &uuml;ber unsere Website unseren Newsletter zu abonnieren. Hierf&uuml;r ben&ouml;tigen wir Ihre E-Mail-Adresse und ihre Erkl&auml;rung, dass Sie mit dem Bezug des Newsletters einverstanden sind. Sobald Sie sich f&uuml;r den Newsletter angemeldet haben, senden wir Ihnen ein Best&auml;tigungs-E-Mail mit einem Link zur Best&auml;tigung der Anmeldung.</p>\r\n\r\n<p>Das Abo des Newsletters k&ouml;nnen Sie jederzeit stornieren. Senden Sie Ihre Stornierung bitte an folgende E-Mail-Adresse:&nbsp;<a href=\"mailto:info@tld.at\">info@tld.at</a>. Wir l&ouml;schen anschlie&szlig;end umgehend Ihre Daten im Zusammenhang mit dem Newsletter-Versand.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>IHRE RECHTE</strong></h4>\r\n\r\n<p>Ihnen stehen grunds&auml;tzlich die Rechte auf Auskunft, Berichtigung, L&ouml;schung, Einschr&auml;nkung, Daten&uuml;bertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verst&ouml;&szlig;t oder Ihre datenschutzrechtlichen Anspr&uuml;che sonst in einer Weise verletzt worden sind, k&ouml;nnen Sie sich bei der Aufsichtsbeh&ouml;rde beschweren. In &Ouml;sterreich ist dies die Datenschutzbeh&ouml;rde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>SIE ERREICHEN UNS UNTER FOLGENDEN KONTAKTDATEN:</strong></h4>\r\n\r\n<p>Kontakdaten</p>',NULL,NULL,NULL,NULL,'Datenschutzerklärung'),(621,'Video volle Breite',NULL,NULL,'gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',NULL,NULL,NULL,NULL,NULL,'Video volle Breite'),(622,'Bildergalerie',NULL,NULL,'gAJdcQAofXEBKFgCAAAAaWRxAlgBAAAAMXEDWAcAAABjYXB0aW9ucQRYAAAAAHEFdX1xBihoAlgBAAAAN3EHaARoBXV9cQgoaAJYAQAAADRxCWgEaAV1fXEKKGgCWAEAAAA1cQtoBGgFdWUu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Bildergalerie'),(628,'Timeline Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Timeline Gruppe'),(629,'2000',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2000'),(630,'Accordion Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'Accordion Gruppe'),(631,'Name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name'),(632,'Name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name'),(633,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col',NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(635,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col',NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(649,'2005',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2005'),(650,'2010',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2010'),(651,'2015',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2015'),(652,'2020',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2020'),(735,'Testimonial',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>',NULL,NULL,NULL,NULL,'Testimonial'),(745,'Highlight Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Highlight Gruppe'),(746,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(747,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(748,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(749,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(790,'Team Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Team Gruppe'),(791,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(792,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(793,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(874,'Video mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Video mit Text'),(875,'Video mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Video mit Text'),(876,'Video mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Video mit Text'),(1041,NULL,NULL,'','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(1043,'Testimonial',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>',NULL,NULL,NULL,NULL,'Testimonial'),(1044,'Testimonial',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\r\n\r\n<p><strong>Admin</strong>, B&uuml;ro Maisengasse</p>',NULL,NULL,NULL,NULL,'Testimonial'),(1045,'Teaser Gruppe',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,NULL,'',NULL,NULL,NULL,NULL,'Teaser Gruppe'),(1046,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL,'',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(1047,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL,'',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(1048,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAAxcQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>',NULL,'/',NULL,NULL,'Teaser'),(1049,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(1050,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA0cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Vollbild mit Text'),(1051,'Timeline Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Timeline Gruppe'),(1052,'2000',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2000'),(1053,'2005',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2005'),(1054,'2010',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2010'),(1055,'2015',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2015'),(1056,'2020',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'2020'),(1057,'Accordion Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'Accordion Gruppe'),(1058,'Name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name'),(1059,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col',NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(1060,'Name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Name'),(1061,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col',NULL,NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Text volle Breite'),(1062,'Highlight',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQB9cQEoWAIAAABpZHECWAIAAAAxMXEDWAcAAABjYXB0aW9ucQRYAAAAAHEFdWEu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Highlight'),(1063,'Highlight Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Highlight Gruppe'),(1064,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(1065,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(1066,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(1067,'Highlight',NULL,'<p>Highlight-Text<p>',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLC3NhLg==',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Highlight-Text<p>',NULL,NULL,NULL,NULL,'Highlight'),(1068,'Team Gruppe',NULL,NULL,'gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Team Gruppe'),(1069,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(1070,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(1071,'Name','Jobtitel',NULL,'gAJdcQB9cQFYAgAAAGlkcQJLBXNhLg==',NULL,NULL,'/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/',NULL,'Jobtitel','Name'),(1072,'Video mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Video mit Text'),(1073,'Video mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Video mit Text'),(1074,'Vollbild mit Textspalten',NULL,'','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,NULL,'',NULL,NULL,NULL,NULL,'Vollbild mit Textspalten'),(1075,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Textspalte'),(1076,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Textspalte'),(1077,'Video volle Breite',NULL,NULL,'gAJdcQB9cQEoWAIAAABpZHECWAEAAAA3cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kwZ8AHFvCEQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',NULL,NULL,NULL,NULL,NULL,'Video volle Breite'),(1078,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Bild mit Text'),(1079,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Bild mit Text'),(1080,'Bildergalerie',NULL,NULL,'gAJdcQAofXEBKFgCAAAAaWRxAlgBAAAAMXEDWAcAAABjYXB0aW9ucQRYAAAAAHEFdX1xBihoAlgBAAAAN3EHaARoBXV9cQgoaAJYAQAAADRxCWgEaAV1fXEKKGgCWAEAAAA1cQtoBGgFdWUu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL,'container',NULL,'',NULL,NULL,NULL,NULL,NULL,'Bildergalerie'),(1081,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA0cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right','container',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>',NULL,NULL,NULL,NULL,'Vollbild mit Text'),(1082,'Datenschutzerklärung',NULL,'<h4><strong>DATENSCHUTZERKL&Auml;RUNG</strong></h4>\r\n\r\n<p>Der Schutz Ihrer pers&ouml;nlichen Daten ist uns ein besonderes Anliegen. Wir verarbeiten Ihre Daten daher ausschlie&szlig;lich auf Grundlage der gesetzlichen Bestimmungen (DSGVO, TKG 2003). In diesen Datenschutzinformationen informieren wir Sie &uuml;ber die wichtigsten Aspekte der Datenverarbeitung im Rahmen unserer Website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>KONTAKT MIT UNS</strong></h4>\r\n\r\n<p>Wenn Sie per Formular auf der Website oder per E-Mail Kontakt mit uns aufnehmen, werden Ihre angegebenen Daten zwecks Bearbeitung der Anfrage und f&uuml;r den Fall von Anschlussfragen sechs Monate bei uns gespeichert. Diese Daten geben wir nicht ohne Ihre Einwilligung weiter.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>COOKIES</strong></h4>\r\n\r\n<p>Unsere Website verwendet sogenannte Cookies. Dabei handelt es sich um kleine Textdateien, die mit Hilfe des Browsers auf Ihrem Endger&auml;t abgelegt werden. Sie richten keinen Schaden an. Wir nutzen Cookies dazu, unser Angebot nutzerfreundlich zu gestalten.</p>\r\n\r\n<p>Einige Cookies bleiben auf Ihrem Endger&auml;t gespeichert, bis Sie diese l&ouml;schen. Sie erm&ouml;glichen es uns, Ihren Browser beim n&auml;chsten Besuch wiedererkennen zu k&ouml;nnen. Wenn Sie dies nicht w&uuml;nschen, so k&ouml;nnen Sie Ihren Browser so einrichten, dass er Sie &uuml;ber das Setzen von Cookies informiert und Sie dies nur im Einzelfall erlauben. Bei der Deaktivierung von Cookies kann die Funktionalit&auml;t unserer Website eingeschr&auml;nkt sein.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE ANALYTICS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Funktionen des Webanalysedienstes Google Analytics von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Google Analytics verwendet sogenannte Cookies, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie erm&ouml;glichen. Die durch das Cookie erzeugten Informationen &uuml;ber Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA &uuml;bertragen und dort gespeichert.</p>\r\n\r\n<p>Sie k&ouml;nnen die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht s&auml;mtliche Funktionen dieser Website vollumf&auml;nglich werden nutzen k&ouml;nnen.</p>\r\n\r\n<p>Sie k&ouml;nnen dar&uuml;ber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link&nbsp;<a href=\"http://tools.google.com/dlpage/gaoptout?hl=de\" target=\"_blank\">http://tools.google.com/dlpage/gaoptout?hl=de</a>&nbsp;verf&uuml;gbare Browser-Plugin herunterladen und installieren.</p>\r\n\r\n<p>Wir haben mit dem Anbieter einen entsprechenden Vertrag zur Auftragsdatenverarbeitung abgeschlossen.</p>\r\n\r\n<p>Ihre IP-Adresse wird erfasst, aber umgehend (durch L&ouml;schung der letzten 8 Bit) pseudonymisiert. Dadurch ist nur mehr eine grobe Lokalisierung m&ouml;glich. Die im Rahmen von Google Analytics von Ihrem Browser &uuml;bermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengef&uuml;hrt.</p>\r\n\r\n<p>Die Datenverarbeitung erfolgt auf Basis der gesetzlichen Bestimmungen des &sect; 96 Abs 3 TKG sowie des Art 6 Abs 1 lit a (Einwilligung) und/oder f (berechtigtes Interesse) der DSGVO.</p>\r\n\r\n<p>Unser Anliegen im Sinne der DSGVO (berechtigtes Interesse) ist die Verbesserung unseres Angebotes und unseres Webauftritts. Da uns die Privatsph&auml;re unserer Nutzer wichtig ist, werden die Nutzerdaten pseudonymisiert. Die Nutzerdaten werden durch Google ausgewertet, um Reports zu erstellen.</p>\r\n\r\n<p>Sie k&ouml;nnen die Erfassung durch Google Analytics verhindern, indem Sie auf folgenden Link klicken. Es wird ein Opt-Out-Cookie gesetzt, das die zuk&uuml;nftige Erfassung Ihrer Daten beim Besuch dieser Website verhindert:&nbsp;<a href=\"javascript:gaOptout()\">Google Analytics deaktivieren</a>.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"https://www.google.com/analytics/learn/privacy.html?hl=de\" target=\"_blank\">https://www.google.com/analytics/learn/privacy.html?hl=de</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>EINBINDUNG VON DIENSTEN UND INHALTEN DRITTER</strong></h4>\r\n\r\n<p>Es kann vorkommen, dass wir auf unserer Website Inhalte Dritter, wie zum Beispiel YouTube oder anderer Webseiten einbinden. Wir bem&uuml;hen uns, dass Inhalte unserer Partner datenschutzkonform verwendet werden, jedoch haben wir keinen Einfluss darauf.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google entnehmen:&nbsp;<a href=\"https://www.google.at/intl/de/policies/privacy/\" target=\"_blank\">https://www.google.at/intl/de/policies/privacy/</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE-MAPS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Kartenmaterial von Google Maps von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Bei jedem Aufruf von Google Maps wird von Google ein Cookie gesetzt, um bei der Anzeige der Seite Nutzereinstellungen und -daten zu verarbeiten.</p>\r\n\r\n<p>Dieses Cookie wird im Regelfall nicht durch das Schlie&szlig;en des Browsers gel&ouml;scht, sondern l&auml;uft nach einer bestimmten Zeit ab, soweit es nicht von Ihnen zuvor manuell gel&ouml;scht wird.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"http://www.google.com/intl/de_de/help/terms_maps.html\" target=\"_blank\">http://www.google.com/intl/de_de/help/terms_maps.html</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>FACEBOOK</strong></h4>\r\n\r\n<p>Unsere Website verwendet Plugins des sozialen Netzwerkes facebook.com der Facebook Inc. in 1601 S. California Ave, Palo Alto, CA 94304, USA. Das Plugin stellt eine Verbindung zu den Facebook-Servern her um es korrekt darstellen zu k&ouml;nnen. Dabei wird an den Facebook-Server &uuml;bermittelt, welche unserer Internetseiten Sie besucht haben. Wenn sie w&auml;hrenddessen bei Facebook eingeloggt sind, ordnet Facebook diese Information Ihrem pers&ouml;nlichen Facebook-Benutzerkonto zu.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Facebook entnehmen:&nbsp;<a href=\"https://www.facebook.com/privacy/explanation\" target=\"_blank\">https://www.facebook.com/privacy/explanation</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>NEWSLETTER</strong></h4>\r\n\r\n<p>Sie haben die M&ouml;glichkeit, &uuml;ber unsere Website unseren Newsletter zu abonnieren. Hierf&uuml;r ben&ouml;tigen wir Ihre E-Mail-Adresse und ihre Erkl&auml;rung, dass Sie mit dem Bezug des Newsletters einverstanden sind. Sobald Sie sich f&uuml;r den Newsletter angemeldet haben, senden wir Ihnen ein Best&auml;tigungs-E-Mail mit einem Link zur Best&auml;tigung der Anmeldung.</p>\r\n\r\n<p>Das Abo des Newsletters k&ouml;nnen Sie jederzeit stornieren. Senden Sie Ihre Stornierung bitte an folgende E-Mail-Adresse:&nbsp;<a href=\"mailto:info@tld.at\">info@tld.at</a>. Wir l&ouml;schen anschlie&szlig;end umgehend Ihre Daten im Zusammenhang mit dem Newsletter-Versand.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>IHRE RECHTE</strong></h4>\r\n\r\n<p>Ihnen stehen grunds&auml;tzlich die Rechte auf Auskunft, Berichtigung, L&ouml;schung, Einschr&auml;nkung, Daten&uuml;bertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verst&ouml;&szlig;t oder Ihre datenschutzrechtlichen Anspr&uuml;che sonst in einer Weise verletzt worden sind, k&ouml;nnen Sie sich bei der Aufsichtsbeh&ouml;rde beschweren. In &Ouml;sterreich ist dies die Datenschutzbeh&ouml;rde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>SIE ERREICHEN UNS UNTER FOLGENDEN KONTAKTDATEN:</strong></h4>\r\n\r\n<p>Kontakdaten</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'2-cols','container',NULL,NULL,'<h4><strong>DATENSCHUTZERKL&Auml;RUNG</strong></h4>\r\n\r\n<p>Der Schutz Ihrer pers&ouml;nlichen Daten ist uns ein besonderes Anliegen. Wir verarbeiten Ihre Daten daher ausschlie&szlig;lich auf Grundlage der gesetzlichen Bestimmungen (DSGVO, TKG 2003). In diesen Datenschutzinformationen informieren wir Sie &uuml;ber die wichtigsten Aspekte der Datenverarbeitung im Rahmen unserer Website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>KONTAKT MIT UNS</strong></h4>\r\n\r\n<p>Wenn Sie per Formular auf der Website oder per E-Mail Kontakt mit uns aufnehmen, werden Ihre angegebenen Daten zwecks Bearbeitung der Anfrage und f&uuml;r den Fall von Anschlussfragen sechs Monate bei uns gespeichert. Diese Daten geben wir nicht ohne Ihre Einwilligung weiter.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>COOKIES</strong></h4>\r\n\r\n<p>Unsere Website verwendet sogenannte Cookies. Dabei handelt es sich um kleine Textdateien, die mit Hilfe des Browsers auf Ihrem Endger&auml;t abgelegt werden. Sie richten keinen Schaden an. Wir nutzen Cookies dazu, unser Angebot nutzerfreundlich zu gestalten.</p>\r\n\r\n<p>Einige Cookies bleiben auf Ihrem Endger&auml;t gespeichert, bis Sie diese l&ouml;schen. Sie erm&ouml;glichen es uns, Ihren Browser beim n&auml;chsten Besuch wiedererkennen zu k&ouml;nnen. Wenn Sie dies nicht w&uuml;nschen, so k&ouml;nnen Sie Ihren Browser so einrichten, dass er Sie &uuml;ber das Setzen von Cookies informiert und Sie dies nur im Einzelfall erlauben. Bei der Deaktivierung von Cookies kann die Funktionalit&auml;t unserer Website eingeschr&auml;nkt sein.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE ANALYTICS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Funktionen des Webanalysedienstes Google Analytics von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Google Analytics verwendet sogenannte Cookies, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie erm&ouml;glichen. Die durch das Cookie erzeugten Informationen &uuml;ber Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA &uuml;bertragen und dort gespeichert.</p>\r\n\r\n<p>Sie k&ouml;nnen die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht s&auml;mtliche Funktionen dieser Website vollumf&auml;nglich werden nutzen k&ouml;nnen.</p>\r\n\r\n<p>Sie k&ouml;nnen dar&uuml;ber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link&nbsp;<a href=\"http://tools.google.com/dlpage/gaoptout?hl=de\" target=\"_blank\">http://tools.google.com/dlpage/gaoptout?hl=de</a>&nbsp;verf&uuml;gbare Browser-Plugin herunterladen und installieren.</p>\r\n\r\n<p>Wir haben mit dem Anbieter einen entsprechenden Vertrag zur Auftragsdatenverarbeitung abgeschlossen.</p>\r\n\r\n<p>Ihre IP-Adresse wird erfasst, aber umgehend (durch L&ouml;schung der letzten 8 Bit) pseudonymisiert. Dadurch ist nur mehr eine grobe Lokalisierung m&ouml;glich. Die im Rahmen von Google Analytics von Ihrem Browser &uuml;bermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengef&uuml;hrt.</p>\r\n\r\n<p>Die Datenverarbeitung erfolgt auf Basis der gesetzlichen Bestimmungen des &sect; 96 Abs 3 TKG sowie des Art 6 Abs 1 lit a (Einwilligung) und/oder f (berechtigtes Interesse) der DSGVO.</p>\r\n\r\n<p>Unser Anliegen im Sinne der DSGVO (berechtigtes Interesse) ist die Verbesserung unseres Angebotes und unseres Webauftritts. Da uns die Privatsph&auml;re unserer Nutzer wichtig ist, werden die Nutzerdaten pseudonymisiert. Die Nutzerdaten werden durch Google ausgewertet, um Reports zu erstellen.</p>\r\n\r\n<p>Sie k&ouml;nnen die Erfassung durch Google Analytics verhindern, indem Sie auf folgenden Link klicken. Es wird ein Opt-Out-Cookie gesetzt, das die zuk&uuml;nftige Erfassung Ihrer Daten beim Besuch dieser Website verhindert:&nbsp;<a href=\"javascript:gaOptout()\">Google Analytics deaktivieren</a>.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"https://www.google.com/analytics/learn/privacy.html?hl=de\" target=\"_blank\">https://www.google.com/analytics/learn/privacy.html?hl=de</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>EINBINDUNG VON DIENSTEN UND INHALTEN DRITTER</strong></h4>\r\n\r\n<p>Es kann vorkommen, dass wir auf unserer Website Inhalte Dritter, wie zum Beispiel YouTube oder anderer Webseiten einbinden. Wir bem&uuml;hen uns, dass Inhalte unserer Partner datenschutzkonform verwendet werden, jedoch haben wir keinen Einfluss darauf.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google entnehmen:&nbsp;<a href=\"https://www.google.at/intl/de/policies/privacy/\" target=\"_blank\">https://www.google.at/intl/de/policies/privacy/</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>GOOGLE-MAPS</strong></h4>\r\n\r\n<p>Unsere Website verwendet Kartenmaterial von Google Maps von Google LLC in 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA. Bei jedem Aufruf von Google Maps wird von Google ein Cookie gesetzt, um bei der Anzeige der Seite Nutzereinstellungen und -daten zu verarbeiten.</p>\r\n\r\n<p>Dieses Cookie wird im Regelfall nicht durch das Schlie&szlig;en des Browsers gel&ouml;scht, sondern l&auml;uft nach einer bestimmten Zeit ab, soweit es nicht von Ihnen zuvor manuell gel&ouml;scht wird.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Google Analytics entnehmen:&nbsp;<a href=\"http://www.google.com/intl/de_de/help/terms_maps.html\" target=\"_blank\">http://www.google.com/intl/de_de/help/terms_maps.html</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>FACEBOOK</strong></h4>\r\n\r\n<p>Unsere Website verwendet Plugins des sozialen Netzwerkes facebook.com der Facebook Inc. in 1601 S. California Ave, Palo Alto, CA 94304, USA. Das Plugin stellt eine Verbindung zu den Facebook-Servern her um es korrekt darstellen zu k&ouml;nnen. Dabei wird an den Facebook-Server &uuml;bermittelt, welche unserer Internetseiten Sie besucht haben. Wenn sie w&auml;hrenddessen bei Facebook eingeloggt sind, ordnet Facebook diese Information Ihrem pers&ouml;nlichen Facebook-Benutzerkonto zu.</p>\r\n\r\n<p>Weitere Informationen k&ouml;nnen Sie der Datenschutzerkl&auml;rung von Facebook entnehmen:&nbsp;<a href=\"https://www.facebook.com/privacy/explanation\" target=\"_blank\">https://www.facebook.com/privacy/explanation</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>NEWSLETTER</strong></h4>\r\n\r\n<p>Sie haben die M&ouml;glichkeit, &uuml;ber unsere Website unseren Newsletter zu abonnieren. Hierf&uuml;r ben&ouml;tigen wir Ihre E-Mail-Adresse und ihre Erkl&auml;rung, dass Sie mit dem Bezug des Newsletters einverstanden sind. Sobald Sie sich f&uuml;r den Newsletter angemeldet haben, senden wir Ihnen ein Best&auml;tigungs-E-Mail mit einem Link zur Best&auml;tigung der Anmeldung.</p>\r\n\r\n<p>Das Abo des Newsletters k&ouml;nnen Sie jederzeit stornieren. Senden Sie Ihre Stornierung bitte an folgende E-Mail-Adresse:&nbsp;<a href=\"mailto:info@tld.at\">info@tld.at</a>. Wir l&ouml;schen anschlie&szlig;end umgehend Ihre Daten im Zusammenhang mit dem Newsletter-Versand.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>IHRE RECHTE</strong></h4>\r\n\r\n<p>Ihnen stehen grunds&auml;tzlich die Rechte auf Auskunft, Berichtigung, L&ouml;schung, Einschr&auml;nkung, Daten&uuml;bertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer Daten gegen das Datenschutzrecht verst&ouml;&szlig;t oder Ihre datenschutzrechtlichen Anspr&uuml;che sonst in einer Weise verletzt worden sind, k&ouml;nnen Sie sich bei der Aufsichtsbeh&ouml;rde beschweren. In &Ouml;sterreich ist dies die Datenschutzbeh&ouml;rde.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>SIE ERREICHEN UNS UNTER FOLGENDEN KONTAKTDATEN:</strong></h4>\r\n\r\n<p>Kontakdaten</p>',NULL,NULL,NULL,NULL,'Datenschutzerklärung');
/*!40000 ALTER TABLE `stencils_stencildata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stencils_stencilslider`
--

DROP TABLE IF EXISTS `stencils_stencilslider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stencils_stencilslider` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cssclass` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `arrows` tinyint(1) NOT NULL,
  `dots` tinyint(1) NOT NULL,
  `show` int(11) NOT NULL,
  `title_de` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `stencils_stencilslid_cmsplugin_ptr_id_5f049911_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stencils_stencilslider`
--

LOCK TABLES `stencils_stencilslider` WRITE;
/*!40000 ALTER TABLE `stencils_stencilslider` DISABLE KEYS */;
INSERT INTO `stencils_stencilslider` VALUES (433,'Testimonial-Slider',NULL,NULL,0,0,1,'Testimonial-Slider'),(1042,'Testimonial-Slider',NULL,NULL,0,0,1,'Testimonial-Slider');
/*!40000 ALTER TABLE `stencils_stencilslider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows_workflow`
--

DROP TABLE IF EXISTS `workflows_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `state` int(11) NOT NULL,
  `published_from` datetime(6) DEFAULT NULL,
  `published_to` datetime(6) DEFAULT NULL,
  `parent_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workflows_workflow_parent_id_parent_type_id_e85a3dc6_uniq` (`parent_id`,`parent_type_id`),
  KEY `workflows_workflow_parent_type_id_d0152be0_fk_django_co` (`parent_type_id`),
  CONSTRAINT `workflows_workflow_parent_type_id_d0152be0_fk_django_co` FOREIGN KEY (`parent_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows_workflow`
--

LOCK TABLES `workflows_workflow` WRITE;
/*!40000 ALTER TABLE `workflows_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflows_workflow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 12:38:19
