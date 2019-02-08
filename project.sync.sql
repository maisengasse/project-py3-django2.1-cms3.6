-- MySQL dump 10.15  Distrib 10.0.36-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	10.0.36-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can use Structure mode',1,'use_structure'),(2,'Can change page',2,'change_page'),(3,'Can add permission',3,'add_permission'),(4,'Can change permission',3,'change_permission'),(5,'Can delete permission',3,'delete_permission'),(6,'Can add user',4,'add_user'),(7,'Can change user',4,'change_user'),(8,'Can delete user',4,'delete_user'),(9,'Can add group',5,'add_group'),(10,'Can change group',5,'change_group'),(11,'Can delete group',5,'delete_group'),(12,'Can add content type',6,'add_contenttype'),(13,'Can change content type',6,'change_contenttype'),(14,'Can delete content type',6,'delete_contenttype'),(15,'Can add session',7,'add_session'),(16,'Can change session',7,'change_session'),(17,'Can delete session',7,'delete_session'),(18,'Can add site',8,'add_site'),(19,'Can change site',8,'change_site'),(20,'Can delete site',8,'delete_site'),(21,'Can add log entry',9,'add_logentry'),(22,'Can change log entry',9,'change_logentry'),(23,'Can delete log entry',9,'delete_logentry'),(24,'Can add Page global permission',10,'add_globalpagepermission'),(25,'Can change Page global permission',10,'change_globalpagepermission'),(26,'Can delete Page global permission',10,'delete_globalpagepermission'),(27,'Can add urlconf revision',11,'add_urlconfrevision'),(28,'Can change urlconf revision',11,'change_urlconfrevision'),(29,'Can delete urlconf revision',11,'delete_urlconfrevision'),(30,'Can add page',2,'add_page'),(31,'Can delete page',2,'delete_page'),(32,'Can view page',2,'view_page'),(33,'Can publish page',2,'publish_page'),(34,'Can edit static placeholders',2,'edit_static_placeholder'),(35,'Can add cms plugin',12,'add_cmsplugin'),(36,'Can change cms plugin',12,'change_cmsplugin'),(37,'Can delete cms plugin',12,'delete_cmsplugin'),(38,'Can add title',13,'add_title'),(39,'Can change title',13,'change_title'),(40,'Can delete title',13,'delete_title'),(41,'Can add placeholder',1,'add_placeholder'),(42,'Can change placeholder',1,'change_placeholder'),(43,'Can delete placeholder',1,'delete_placeholder'),(44,'Can add user setting',14,'add_usersettings'),(45,'Can change user setting',14,'change_usersettings'),(46,'Can delete user setting',14,'delete_usersettings'),(47,'Can add static placeholder',15,'add_staticplaceholder'),(48,'Can change static placeholder',15,'change_staticplaceholder'),(49,'Can delete static placeholder',15,'delete_staticplaceholder'),(50,'Can add User (page)',16,'add_pageuser'),(51,'Can change User (page)',16,'change_pageuser'),(52,'Can delete User (page)',16,'delete_pageuser'),(53,'Can add alias plugin model',17,'add_aliaspluginmodel'),(54,'Can change alias plugin model',17,'change_aliaspluginmodel'),(55,'Can delete alias plugin model',17,'delete_aliaspluginmodel'),(56,'Can add placeholder reference',18,'add_placeholderreference'),(57,'Can change placeholder reference',18,'change_placeholderreference'),(58,'Can delete placeholder reference',18,'delete_placeholderreference'),(59,'Can add Page permission',19,'add_pagepermission'),(60,'Can change Page permission',19,'change_pagepermission'),(61,'Can delete Page permission',19,'delete_pagepermission'),(62,'Can add User group (page)',21,'add_pageusergroup'),(63,'Can change User group (page)',21,'change_pageusergroup'),(64,'Can delete User group (page)',21,'delete_pageusergroup'),(65,'Can add cache key',23,'add_cachekey'),(66,'Can change cache key',23,'change_cachekey'),(67,'Can delete cache key',23,'delete_cachekey'),(68,'Can add version',24,'add_version'),(69,'Can change version',24,'change_version'),(70,'Can delete version',24,'delete_version'),(71,'Can add revision',25,'add_revision'),(72,'Can change revision',25,'change_revision'),(73,'Can delete revision',25,'delete_revision'),(74,'Can add clipboard',26,'add_clipboard'),(75,'Can change clipboard',26,'change_clipboard'),(76,'Can delete clipboard',26,'delete_clipboard'),(77,'Can add folder permission',27,'add_folderpermission'),(78,'Can change folder permission',27,'change_folderpermission'),(79,'Can delete folder permission',27,'delete_folderpermission'),(80,'Can add Folder',28,'add_folder'),(81,'Can change Folder',28,'change_folder'),(82,'Can delete Folder',28,'delete_folder'),(83,'Can use directory listing',28,'can_use_directory_listing'),(84,'Can add thumbnail option',29,'add_thumbnailoption'),(85,'Can change thumbnail option',29,'change_thumbnailoption'),(86,'Can delete thumbnail option',29,'delete_thumbnailoption'),(87,'Can add clipboard item',30,'add_clipboarditem'),(88,'Can change clipboard item',30,'change_clipboarditem'),(89,'Can delete clipboard item',30,'delete_clipboarditem'),(90,'Can add file',31,'add_file'),(91,'Can change file',31,'change_file'),(92,'Can delete file',31,'delete_file'),(93,'Can add image',32,'add_image'),(94,'Can change image',32,'change_image'),(95,'Can delete image',32,'delete_image'),(96,'Can add source',33,'add_source'),(97,'Can change source',33,'change_source'),(98,'Can delete source',33,'delete_source'),(99,'Can add thumbnail',34,'add_thumbnail'),(100,'Can change thumbnail',34,'change_thumbnail'),(101,'Can delete thumbnail',34,'delete_thumbnail'),(102,'Can add thumbnail dimensions',35,'add_thumbnaildimensions'),(103,'Can change thumbnail dimensions',35,'change_thumbnaildimensions'),(104,'Can delete thumbnail dimensions',35,'delete_thumbnaildimensions'),(105,'Can add remote filer image',36,'add_remotefilerimage'),(106,'Can change remote filer image',36,'change_remotefilerimage'),(107,'Can delete remote filer image',36,'delete_remotefilerimage'),(108,'Can add Editierbares Bild',37,'add_editableimage'),(109,'Can change Editierbares Bild',37,'change_editableimage'),(110,'Can delete Editierbares Bild',37,'delete_editableimage'),(111,'Can add Editierbarer Text',38,'add_editablechars'),(112,'Can change Editierbarer Text',38,'change_editablechars'),(113,'Can delete Editierbarer Text',38,'delete_editablechars'),(114,'Can add Formatierter Text',39,'add_editablerichtext'),(115,'Can change Formatierter Text',39,'change_editablerichtext'),(116,'Can delete Formatierter Text',39,'delete_editablerichtext'),(117,'Can add model-workflow',40,'add_workflow'),(118,'Can change model-workflow',40,'change_workflow'),(119,'Can delete model-workflow',40,'delete_workflow'),(120,'Can add Slider',41,'add_stencilslider'),(121,'Can change Slider',41,'change_stencilslider'),(122,'Can delete Slider',41,'delete_stencilslider'),(123,'Can add Inhalt',42,'add_stencildata'),(124,'Can change Inhalt',42,'change_stencildata'),(125,'Can delete Inhalt',42,'delete_stencildata');
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
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$Dri4JDY2Rhao$TZcnJCbzPDYHxC1+okLERfeYmWTvJ8tgYU6Up9/46zY=','2019-02-07 14:22:00.515386',1,'maisengasse','','','admin@maisengasse.at',1,1,'2019-01-17 15:18:44.416637');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (4,0,'de','BigImage','2019-01-28 10:06:23.402505','2019-02-07 11:36:04.816222',NULL,2,1,0,'001G'),(5,1,'de','BigText','2019-01-28 10:07:52.829234','2019-01-28 10:12:47.415433',NULL,3,1,0,'0004'),(6,2,'de','BigImageWithText','2019-01-28 10:08:18.609898','2019-01-28 13:35:35.934936',NULL,3,1,0,'0005'),(7,3,'de','TeaserGroup','2019-01-28 10:08:37.997311','2019-01-28 10:08:38.006787',NULL,3,1,3,'0006'),(8,0,'de','Teaser','2019-01-28 10:08:38.009322','2019-01-28 13:39:19.768319',7,3,2,0,'00060001'),(9,1,'de','Teaser','2019-01-28 10:08:38.042362','2019-01-28 13:39:25.383303',7,3,2,0,'00060002'),(10,2,'de','Teaser','2019-01-28 10:08:38.068393','2019-01-28 13:39:31.872098',7,3,2,0,'00060003'),(11,6,'de','ImageWithColumnText','2019-01-28 10:08:56.696616','2019-01-28 13:57:29.868623',NULL,3,1,2,'0007'),(12,0,'de','ColumnText','2019-01-28 10:08:56.708300','2019-01-28 13:43:13.368251',11,3,2,0,'00070001'),(13,1,'de','ColumnText','2019-01-28 10:08:56.740667','2019-01-28 13:43:21.957564',11,3,2,0,'00070002'),(14,5,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-01-28 10:09:29.407800',NULL,3,1,0,'000U'),(15,8,'de','HighlightGroup','2019-01-28 10:09:48.666802','2019-01-28 10:09:48.675844',NULL,3,1,4,'0009'),(16,0,'de','Highlight','2019-01-28 10:09:48.678317','2019-01-28 14:15:00.262289',15,3,2,0,'00090001'),(17,1,'de','Highlight','2019-01-28 10:09:48.710745','2019-01-28 14:15:43.274758',15,3,2,0,'00090002'),(18,2,'de','Highlight','2019-01-28 10:09:48.735225','2019-01-28 14:15:53.435631',15,3,2,0,'00090003'),(19,3,'de','Highlight','2019-01-28 10:09:48.759636','2019-01-28 15:21:57.108261',15,3,2,0,'00090004'),(20,9,'de','Highlight','2019-01-28 10:10:15.559038','2019-01-28 14:17:40.583871',NULL,3,1,0,'000A'),(74,4,'de','BigImageWithText','2019-01-28 10:08:18.609898','2019-01-28 13:35:41.101767',NULL,3,1,0,'000K'),(183,5,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-01-28 14:10:10.989920',NULL,1,1,0,'0014'),(184,7,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-01-28 15:22:28.246544',NULL,3,1,0,'0015'),(337,0,'de','BigImage','2019-01-28 10:06:23.402505','2019-02-07 11:36:07.228357',NULL,4,1,0,'001H'),(338,1,'de','BigText','2019-01-28 10:07:52.829234','2019-02-07 11:36:07.251285',NULL,5,1,0,'001I'),(339,2,'de','BigImageWithText','2019-01-28 10:08:18.609898','2019-02-07 11:36:07.261195',NULL,5,1,0,'001J'),(340,3,'de','TeaserGroup','2019-01-28 10:08:37.997311','2019-02-07 11:36:07.271128',NULL,5,1,3,'001K'),(341,0,'de','Teaser','2019-01-28 10:08:38.009322','2019-02-07 11:36:07.280158',340,5,2,0,'001K0001'),(342,1,'de','Teaser','2019-01-28 10:08:38.042362','2019-02-07 11:36:07.290773',340,5,2,0,'001K0002'),(343,2,'de','Teaser','2019-01-28 10:08:38.068393','2019-02-07 11:36:07.301493',340,5,2,0,'001K0003'),(344,6,'de','ImageWithColumnText','2019-01-28 10:08:56.696616','2019-02-07 11:36:07.311717',NULL,5,1,2,'001L'),(345,0,'de','ColumnText','2019-01-28 10:08:56.708300','2019-02-07 11:36:07.320917',344,5,2,0,'001L0001'),(346,1,'de','ColumnText','2019-01-28 10:08:56.740667','2019-02-07 11:36:07.331665',344,5,2,0,'001L0002'),(347,8,'de','HighlightGroup','2019-01-28 10:09:48.666802','2019-02-07 11:36:07.341911',NULL,5,1,4,'001M'),(348,0,'de','Highlight','2019-01-28 10:09:48.678317','2019-02-07 11:36:07.351189',347,5,2,0,'001M0001'),(349,1,'de','Highlight','2019-01-28 10:09:48.710745','2019-02-07 11:36:07.361637',347,5,2,0,'001M0002'),(350,2,'de','Highlight','2019-01-28 10:09:48.735225','2019-02-07 11:36:07.372099',347,5,2,0,'001M0003'),(351,3,'de','Highlight','2019-01-28 10:09:48.759636','2019-02-07 11:36:07.383652',347,5,2,0,'001M0004'),(352,9,'de','Highlight','2019-01-28 10:10:15.559038','2019-02-07 11:36:07.393462',NULL,5,1,0,'001N'),(353,4,'de','BigImageWithText','2019-01-28 10:08:18.609898','2019-02-07 11:36:07.403069',NULL,5,1,0,'001O'),(354,5,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-02-07 11:36:07.412647',NULL,5,1,0,'001P'),(355,7,'de','ImageWithText','2019-01-28 10:09:29.397063','2019-02-07 11:36:07.422353',NULL,5,1,0,'001Q');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (2,'maisengasse','maisengasse','2019-01-17 15:20:18.859672','2019-01-28 14:40:24.116445','2019-01-17 15:20:18.894786',NULL,0,0,NULL,NULL,'INHERIT',0,NULL,1,NULL,NULL,1,'de',0,3,0,2),(3,'maisengasse','maisengasse','2019-01-17 15:20:18.895180','2019-02-07 11:36:07.187000','2019-01-17 15:20:18.894786',NULL,0,0,NULL,NULL,'INHERIT',0,NULL,1,NULL,NULL,0,'de',0,2,0,2),(4,'maisengasse','maisengasse','2019-01-28 14:40:05.786899','2019-01-28 14:40:05.815547','2019-01-28 15:29:33.168449',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,8,0,3),(5,'maisengasse','maisengasse','2019-01-28 14:40:35.625256','2019-01-28 14:40:35.646263','2019-01-28 15:29:35.373752',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,9,0,4),(6,'maisengasse','maisengasse','2019-01-28 14:40:44.070577','2019-01-28 14:40:44.089020',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,NULL,0,5),(7,'maisengasse','maisengasse','2019-01-28 14:40:52.138691','2019-01-28 14:40:52.166260',NULL,NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,1,'de',0,NULL,0,6),(8,'maisengasse','maisengasse','2019-01-28 15:29:33.168686','2019-01-28 15:29:33.168714','2019-01-28 15:29:33.168449',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,4,0,3),(9,'maisengasse','maisengasse','2019-01-28 15:29:35.373918','2019-01-28 15:29:35.373941','2019-01-28 15:29:35.373752',NULL,1,0,NULL,NULL,'INHERIT',0,NULL,0,NULL,NULL,0,'de',0,5,0,4),(10,'maisengasse','maisengasse','2019-01-28 15:29:40.961298','2019-02-07 15:10:39.869254','2019-02-07 15:10:28.680597',NULL,0,0,'legal',NULL,'INHERIT',0,NULL,0,'',NULL,1,'de',0,12,0,7),(11,'maisengasse','maisengasse','2019-01-28 15:29:47.749721','2019-02-07 15:24:24.959868','2019-02-07 15:24:48.287490',NULL,0,0,'privacy',NULL,'INHERIT',0,NULL,0,'',NULL,1,'de',0,13,0,8),(12,'maisengasse','maisengasse','2019-02-07 15:10:28.680740','2019-02-07 15:24:34.407155','2019-02-07 15:10:28.680597',NULL,0,0,'legal',NULL,'INHERIT',0,NULL,0,'',NULL,0,'de',0,10,0,7),(13,'maisengasse','maisengasse','2019-02-07 15:24:48.287664','2019-02-07 15:24:48.287685','2019-02-07 15:24:48.287490',NULL,0,0,'privacy',NULL,'INHERIT',0,NULL,0,'',NULL,0,'de',0,11,0,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,2,2),(2,2,3),(3,3,4),(4,3,5),(5,4,8),(6,4,9),(7,5,10),(8,5,11),(9,6,12),(10,6,13),(11,7,14),(12,7,15),(13,8,16),(14,8,17),(15,9,18),(16,9,19),(17,10,20),(18,10,21),(19,11,22),(20,11,23),(21,12,24),(22,12,25),(23,13,26),(24,13,27);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'clipboard',NULL),(2,'header',NULL),(3,'content',NULL),(4,'header',NULL),(5,'content',NULL),(6,'footer',NULL),(7,'footer',NULL),(8,'header',NULL),(9,'content',NULL),(10,'header',NULL),(11,'content',NULL),(12,'header',NULL),(13,'content',NULL),(14,'header',NULL),(15,'content',NULL),(16,'header',NULL),(17,'content',NULL),(18,'header',NULL),(19,'content',NULL),(20,'header',NULL),(21,'content',NULL),(22,'header',NULL),(23,'content',NULL),(24,'header',NULL),(25,'content',NULL),(26,'header',NULL),(27,'content',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (2,'de','Startseite','','','','startseite','',0,NULL,'2019-01-17 15:20:18.861068',1,1,0,2,3),(3,'de','Startseite','','','','startseite','',0,NULL,'2019-01-17 15:20:18.861068',1,0,1,3,2),(4,'de','Menü 1','','','','menu-1','menu-1',0,NULL,'2019-01-28 14:40:05.795016',1,1,0,4,8),(5,'de','Menü 2','','','','menu-2','menu-2',0,NULL,'2019-01-28 14:40:35.626035',1,1,0,5,9),(6,'de','Untermenü 1','','','','untermenu-1','menu-2/untermenu-1',0,NULL,'2019-01-28 14:40:44.071077',0,1,1,6,NULL),(7,'de','Untermenü 2','','','','untermenu-2','menu-2/untermenu-2',0,NULL,'2019-01-28 14:40:52.139361',0,1,1,7,NULL),(8,'de','Menü 1','','','','menu-1','menu-1',0,NULL,'2019-01-28 14:40:05.795016',1,0,0,8,4),(9,'de','Menü 2','','','','menu-2','menu-2',0,NULL,'2019-01-28 14:40:35.626035',1,0,0,9,5),(10,'de','Impressum','','','','impressum','impressum',0,NULL,'2019-01-28 15:29:40.962098',1,1,0,10,12),(11,'de','Datenschutz','','','','datenschutz','datenschutz',0,NULL,'2019-01-28 15:29:47.750501',1,1,0,11,13),(12,'de','Impressum','','','','impressum','impressum',0,NULL,'2019-01-28 15:29:40.962098',1,0,0,12,10),(13,'de','Datenschutz','','','','datenschutz','datenschutz',0,NULL,'2019-01-28 15:29:47.750501',1,0,0,13,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_treenode`
--

LOCK TABLES `cms_treenode` WRITE;
/*!40000 ALTER TABLE `cms_treenode` DISABLE KEYS */;
INSERT INTO `cms_treenode` VALUES (2,'0001',1,0,NULL,1),(3,'0002',1,0,NULL,1),(4,'0003',1,2,NULL,1),(5,'00030001',2,0,4,1),(6,'00030002',2,0,4,1),(7,'0004',1,0,NULL,1),(8,'0005',1,0,NULL,1);
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
INSERT INTO `cms_urlconfrevision` VALUES (1,'8dec0eca-940e-4c28-823b-2eeafe4b4efa');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_usersettings`
--

LOCK TABLES `cms_usersettings` WRITE;
/*!40000 ALTER TABLE `cms_usersettings` DISABLE KEYS */;
INSERT INTO `cms_usersettings` VALUES (1,'de',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-01-17 15:20:18.930303','2','Startseite',1,'[{\"added\": {}}]',2,1),(2,'2019-01-17 17:19:37.841176','1','Standardbild',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(3,'2019-01-17 17:20:22.830473','2','SEO-Bild',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(4,'2019-01-17 18:14:54.833574','2','Startseite',2,'',2,1),(5,'2019-01-28 10:02:28.822770','1','1',3,'',42,1),(6,'2019-01-28 10:05:21.231546','3','3',3,'',42,1),(7,'2019-01-28 10:06:03.538242','3','Testbild1.png',2,'[{\"changed\": {\"fields\": [\"subject_location\"]}}]',32,1),(8,'2019-01-28 10:10:53.872678','21','21',3,'',41,1),(9,'2019-01-28 10:10:59.213419','2','Startseite',2,'',2,1),(10,'2019-01-28 10:12:49.418422','2','Startseite',2,'',2,1),(11,'2019-01-28 10:20:38.699805','3','Testbild1.png',3,'',32,1),(12,'2019-01-28 10:20:38.752126','6','Testbild4.png',3,'',32,1),(13,'2019-01-28 10:20:49.239082','4','Standardbild2',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(14,'2019-01-28 10:20:59.132181','5','Standardbild 3',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(15,'2019-01-28 10:21:03.770289','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(16,'2019-01-28 10:21:24.367597','2','Startseite',2,'',2,1),(17,'2019-01-28 13:34:20.596205','2','Startseite',2,'',2,1),(18,'2019-01-28 13:35:42.845532','2','Startseite',2,'',2,1),(19,'2019-01-28 13:39:35.642954','2','Startseite',2,'',2,1),(20,'2019-01-28 13:43:24.350311','2','Startseite',2,'',2,1),(21,'2019-01-28 13:57:31.713101','2','Startseite',2,'',2,1),(22,'2019-01-28 13:57:49.986979','2','Startseite',2,'',2,1),(23,'2019-01-28 14:10:32.008143','2','Startseite',2,'',2,1),(24,'2019-01-28 14:15:07.508767','2','Startseite',2,'',2,1),(25,'2019-01-28 14:16:03.846057','2','Startseite',2,'',2,1),(26,'2019-01-28 14:17:42.571830','2','Startseite',2,'',2,1),(27,'2019-01-28 14:40:05.817132','4','Menü 1',1,'[{\"added\": {}}]',2,1),(28,'2019-01-28 14:40:15.648755','2','Startseite',2,'Die Deutsch Seite \"Startseite\" wurde erfolgreich auf nicht öffentlich gesetzt',2,1),(29,'2019-01-28 14:40:21.856737','2','Startseite',2,'',2,1),(30,'2019-01-28 14:40:28.523641','2','Startseite',2,'',2,1),(31,'2019-01-28 14:40:35.647769','5','Menü 2',1,'[{\"added\": {}}]',2,1),(32,'2019-01-28 14:40:44.090318','6','Untermenü 1',1,'[{\"added\": {}}]',2,1),(33,'2019-01-28 14:40:52.167772','7','Untermenü 2',1,'[{\"added\": {}}]',2,1),(34,'2019-01-28 15:20:50.940669','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',32,1),(35,'2019-01-28 15:21:01.811137','4','Standardbild 2',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',32,1),(36,'2019-01-28 15:21:10.013677','5','Standardbild 3',2,'[{\"changed\": {\"fields\": [\"file\", \"subject_location\"]}}]',32,1),(37,'2019-01-28 15:21:43.846103','7','Standardbild 4',2,'[{\"changed\": {\"fields\": [\"name\", \"subject_location\"]}}]',32,1),(38,'2019-01-28 15:22:02.796615','2','Startseite',2,'',2,1),(39,'2019-01-28 15:22:53.793507','2','Startseite',2,'',2,1),(40,'2019-01-28 15:29:33.196497','4','Menü 1',2,'',2,1),(41,'2019-01-28 15:29:35.394679','5','Menü 2',2,'',2,1),(42,'2019-01-28 15:29:40.980949','10','Impressum',1,'[{\"added\": {}}]',2,1),(43,'2019-01-28 15:29:47.798490','11','Datenschutz',1,'[{\"added\": {}}]',2,1),(44,'2019-01-28 15:56:53.683597','10','Impressum',2,'[]',2,1),(45,'2019-02-07 11:36:07.435400','2','Startseite',2,'',2,1),(46,'2019-02-07 15:07:01.871034','10','Impressum',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',2,1),(47,'2019-02-07 15:07:43.182800','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"reverse_id\", \"xframe_options\"]}}]',2,1),(48,'2019-02-07 15:10:28.708362','10','Impressum',2,'',2,1),(49,'2019-02-07 15:10:32.424765','10','Impressum',2,'Die Deutsch Seite \"Impressum\" wurde erfolgreich auf nicht öffentlich gesetzt',2,1),(50,'2019-02-07 15:10:39.876742','10','Impressum',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(51,'2019-02-07 15:13:19.083372','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(52,'2019-02-07 15:24:24.968596','11','Datenschutz',2,'[{\"changed\": {\"fields\": [\"xframe_options\"]}}]',2,1),(53,'2019-02-07 15:24:34.424332','10','Impressum',2,'',2,1),(54,'2019-02-07 15:24:48.310964','11','Datenschutz',2,'',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(5,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(17,'cms','aliaspluginmodel'),(12,'cms','cmsplugin'),(10,'cms','globalpagepermission'),(2,'cms','page'),(19,'cms','pagepermission'),(22,'cms','pagetype'),(16,'cms','pageuser'),(21,'cms','pageusergroup'),(1,'cms','placeholder'),(18,'cms','placeholderreference'),(15,'cms','staticplaceholder'),(13,'cms','title'),(20,'cms','treenode'),(11,'cms','urlconfrevision'),(14,'cms','usersettings'),(6,'contenttypes','contenttype'),(33,'easy_thumbnails','source'),(34,'easy_thumbnails','thumbnail'),(35,'easy_thumbnails','thumbnaildimensions'),(38,'editables','editablechars'),(37,'editables','editableimage'),(39,'editables','editablerichtext'),(26,'filer','clipboard'),(30,'filer','clipboarditem'),(31,'filer','file'),(28,'filer','folder'),(27,'filer','folderpermission'),(32,'filer','image'),(29,'filer','thumbnailoption'),(36,'filerpool','remotefilerimage'),(23,'menus','cachekey'),(25,'reversion','revision'),(24,'reversion','version'),(7,'sessions','session'),(8,'sites','site'),(42,'stencils','stencildata'),(41,'stencils','stencilslider'),(40,'workflows','workflow');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-17 15:17:22.386599'),(2,'auth','0001_initial','2019-01-17 15:17:22.583004'),(3,'admin','0001_initial','2019-01-17 15:17:22.647494'),(4,'admin','0002_logentry_remove_auto_add','2019-01-17 15:17:22.659497'),(5,'contenttypes','0002_remove_content_type_name','2019-01-17 15:17:22.710838'),(6,'auth','0002_alter_permission_name_max_length','2019-01-17 15:17:22.739074'),(7,'auth','0003_alter_user_email_max_length','2019-01-17 15:17:22.768443'),(8,'auth','0004_alter_user_username_opts','2019-01-17 15:17:22.778330'),(9,'auth','0005_alter_user_last_login_null','2019-01-17 15:17:22.800738'),(10,'auth','0006_require_contenttypes_0002','2019-01-17 15:17:22.803533'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-17 15:17:22.814960'),(12,'auth','0008_alter_user_username_max_length','2019-01-17 15:17:22.846455'),(13,'sites','0001_initial','2019-01-17 15:17:22.860061'),(14,'cms','0001_initial','2019-01-17 15:17:23.368059'),(15,'cms','0002_auto_20140816_1918','2019-01-17 15:17:24.133256'),(16,'cms','0003_auto_20140926_2347','2019-01-17 15:17:24.166314'),(17,'cms','0004_auto_20140924_1038','2019-01-17 15:17:24.434282'),(18,'cms','0005_auto_20140924_1039','2019-01-17 15:17:24.460931'),(19,'cms','0006_auto_20140924_1110','2019-01-17 15:17:24.807346'),(20,'cms','0007_auto_20141028_1559','2019-01-17 15:17:24.829159'),(21,'cms','0008_auto_20150208_2149','2019-01-17 15:17:24.876173'),(22,'cms','0008_auto_20150121_0059','2019-01-17 15:17:24.901370'),(23,'cms','0009_merge','2019-01-17 15:17:24.904868'),(24,'cms','0010_migrate_use_structure','2019-01-17 15:17:24.954789'),(25,'cms','0011_auto_20150419_1006','2019-01-17 15:17:25.055718'),(26,'cms','0012_auto_20150607_2207','2019-01-17 15:17:25.187172'),(27,'cms','0013_urlconfrevision','2019-01-17 15:17:25.200752'),(28,'cms','0014_auto_20160404_1908','2019-01-17 15:17:25.232527'),(29,'cms','0015_auto_20160421_0000','2019-01-17 15:17:25.279850'),(30,'cms','0016_auto_20160608_1535','2019-01-17 15:17:25.380650'),(31,'cms','0017_pagetype','2019-01-17 15:17:25.508473'),(32,'cms','0018_pagenode','2019-01-17 15:17:25.816521'),(33,'cms','0019_set_pagenode','2019-01-17 15:17:25.877396'),(34,'cms','0020_old_tree_cleanup','2019-01-17 15:17:26.342065'),(35,'easy_thumbnails','0001_initial','2019-01-17 15:17:26.431949'),(36,'easy_thumbnails','0002_thumbnaildimensions','2019-01-17 15:17:26.477521'),(37,'filer','0001_initial','2019-01-17 15:17:27.228729'),(38,'filer','0002_auto_20150606_2003','2019-01-17 15:17:27.296893'),(39,'filer','0003_thumbnailoption','2019-01-17 15:17:27.311983'),(40,'filer','0004_auto_20160328_1434','2019-01-17 15:17:27.354887'),(41,'filer','0005_auto_20160623_1425','2019-01-17 15:17:27.531677'),(42,'filer','0006_auto_20160623_1627','2019-01-17 15:17:27.587946'),(43,'filer','0007_auto_20161016_1055','2019-01-17 15:17:27.602285'),(44,'filer','0008_auto_20171117_1313','2019-01-17 15:17:27.618316'),(45,'filer','0009_auto_20171220_1635','2019-01-17 15:17:27.663071'),(46,'filer','0010_auto_20180414_2058','2019-01-17 15:17:27.704687'),(47,'menus','0001_initial','2019-01-17 15:17:27.720951'),(48,'reversion','0001_squashed_0004_auto_20160611_1202','2019-01-17 15:17:27.870975'),(49,'sessions','0001_initial','2019-01-17 15:17:27.890764'),(50,'sites','0002_alter_domain_unique','2019-01-17 15:17:27.910483'),(51,'cms','0018_create_pagenode','2019-01-17 15:17:27.917357'),(52,'editables','0001_initial','2019-01-17 17:04:29.857951'),(53,'filerpool','0001_initial','2019-01-17 17:04:29.928756'),(54,'stencils','0001_initial','2019-01-17 17:04:30.070323'),(55,'workflows','0001_initial','2019-01-17 17:04:30.194595');
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
INSERT INTO `django_session` VALUES ('5snd6q0ypyemgrmvmmaf16a7gcml08r7','OWU2M2QxZDMyZGE0OTliMjY4YTE2NzU5OGYzNDhiMzZhMGY2Yzk3NTp7ImNtc19lZGl0Ijp0cnVlLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZX0=','2019-02-21 11:33:14.119041'),('d0nfcgg9bcax3e2c2y8b7yg71mfd4i4v','NDUzZThjMmY1OTkyMTc2ZGVkNjUzYzFhNWJjOTBlMTVmM2RiYWM5Zjp7ImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiY21zX2VkaXQiOnRydWUsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-02-11 10:01:39.154660'),('gtwxjdypd4fs0c1b2t01vacriailpcon','MTkzNGMyYjg2MjgyZDQ1MmQwYzA1ODU3MDQxMjM2MTY3NmU4ZjFiYjp7ImNtc19wcmV2aWV3IjpmYWxzZSwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJfYXV0aF91c2VyX2hhc2giOiJiMmFkOThiMGRjYzBjMzVhYzVkYTI5M2NjZTE2NDY1ZDc2NWVlNTlkIiwiY21zX2VkaXQiOnRydWUsImZpbGVyX2xhc3RfZm9sZGVyX2lkIjoiMyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2019-02-21 15:27:56.862029'),('i2y4pumyevpfvlhwqgnuj99vaip3rxhe','MjljOTY5ZGIxZDRiY2RlY2RlMjI4ZDVkMTFmNjdiOWEzNTgxZTYzMjp7ImNtc19lZGl0IjpmYWxzZX0=','2019-02-11 10:01:38.371541'),('llceel31x3cax4ftbezv7iydmq5q1sq4','OWE5MTc2YTU3OTI5MzJjYTMzNDYyZWIyNzQ5OGEyOWM0YjU0OGE0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyYWQ5OGIwZGNjMGMzNWFjNWRhMjkzY2NlMTY0NjVkNzY1ZWU1OWQiLCJ3aXphcmRfd2l6YXJkX2NyZWF0ZV92aWV3Ijp7InN0ZXAiOiIwIiwiZXh0cmFfZGF0YSI6e30sInN0ZXBfZGF0YSI6e30sInN0ZXBfZmlsZXMiOnt9fSwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJjbXNfZWRpdCI6dHJ1ZSwiY21zX3ByZXZpZXciOmZhbHNlLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-01-31 15:41:31.337222'),('pn9i8l4on5j475k3dt7jxey0vudqd86c','OWU2M2QxZDMyZGE0OTliMjY4YTE2NzU5OGYzNDhiMzZhMGY2Yzk3NTp7ImNtc19lZGl0Ijp0cnVlLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZX0=','2019-02-21 14:21:41.693657'),('qhisxc17z5i460zfhj1c2x4pe7mcseov','YWEwMDM5MDVkZWMwYzRlZGNhNTkyZmYzOWY0MDljYTllOTVlNjVkZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiY21zX3ByZXZpZXciOnRydWUsImNtc19lZGl0IjpmYWxzZSwiZmlsZXJfbGFzdF9mb2xkZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhZDk4YjBkY2MwYzM1YWM1ZGEyOTNjY2UxNjQ2NWQ3NjVlZTU5ZCIsImNtc190b29sYmFyX2Rpc2FibGVkIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2019-01-31 18:17:47.209081'),('rue9twyfmxdv9bac9gwpcvkisar082qf','ZThhMzY3NTZlYWM4MWVjMzFlYzAwZWRlOWQ2MjJiMTkxZTc0YzA5YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyYWQ5OGIwZGNjMGMzNWFjNWRhMjkzY2NlMTY0NjVkNzY1ZWU1OWQiLCJjbXNfdG9vbGJhcl9kaXNhYmxlZCI6ZmFsc2UsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJjbXNfZWRpdCI6dHJ1ZSwiZmlsZXJfbGFzdF9mb2xkZXJfaWQiOm51bGwsImNtc19wcmV2aWV3IjpmYWxzZX0=','2019-02-11 15:57:11.979427'),('zm4grr1qtv0o92ic205y2hkvp93jdr33','N2QyZTQxN2U4ZmYzODVlZTE3N2ViNDQ2MWQ4NDdlNDU4NmI1YmFhNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiY21zX3Rvb2xiYXJfZGlzYWJsZWQiOmZhbHNlLCJfYXV0aF91c2VyX2hhc2giOiJiMmFkOThiMGRjYzBjMzVhYzVkYTI5M2NjZTE2NDY1ZDc2NWVlNTlkIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJjbXNfcHJldmlldyI6ZmFsc2UsImNtc19lZGl0Ijp0cnVlfQ==','2019-02-21 13:46:04.731685');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_source` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg','2019-01-28 10:18:04.106254'),(2,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg','2019-01-28 10:05:53.917606'),(4,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png','2019-01-28 15:20:32.823361'),(5,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png','2019-01-28 15:21:04.583309'),(7,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png','2019-01-28 15:20:53.684148'),(8,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg','2019-01-28 15:22:25.267240'),(9,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png','2019-01-28 15:22:25.350881'),(10,'f9bde26a1556cd667f742bd34ec7c55e','filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png','2019-01-28 15:22:25.436384');
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:23.816320',1),(2,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:23.958469',1),(3,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.099058',1),(4,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.238170',1),(5,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:19:24.386149',1),(6,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__210x0_q85_subsampling-2_upscale.jpg','2019-01-17 17:19:27.170165',1),(7,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.715675',1),(8,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.910150',1),(9,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.813397',1),(10,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.621989',1),(11,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.167379',2),(12,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.304220',2),(13,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.444840',2),(14,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.581898',2),(15,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-17 17:20:03.730846',2),(16,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__210x0_q85_subsampling-2_upscale.jpg','2019-01-17 17:20:06.091831',2),(17,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.199141',2),(18,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.392634',2),(19,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.296815',2),(20,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:02:42.102644',2),(21,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__1200x630_q85_crop_subject_location-1440,898_subsampling-2.jpg','2019-01-18 15:13:52.670825',2),(22,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__120x80_q85_subsampling-2.jpg','2019-01-28 10:02:42.523412',2),(23,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__120x80_q85_subsampling-2.jpg','2019-01-28 10:02:43.012236',1),(24,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1200x0_q85_subsampling-2.jpg','2019-01-18 15:13:53.156319',1),(25,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:53.284111',1),(26,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:53.422040',1),(27,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:53.713689',1),(28,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__1200x0_q85_subsampling-2.jpg','2019-01-18 15:13:53.888651',2),(29,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.003753',2),(30,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.138802',2),(31,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-01-18 15:13:54.431528',2),(37,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.775798',4),(38,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__48x48_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.858792',5),(39,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.859655',4),(40,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__16x16_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.949951',5),(42,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:51.953137',4),(44,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.093108',4),(45,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__64x64_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.143642',5),(46,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.177612',4),(48,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__32x32_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.244694',5),(50,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__180x180_q85_crop_subsampling-2_upscale.jpg','2019-01-28 10:05:52.331039',5),(52,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:05:53.920078',2),(59,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__120x80_q85_subsampling-2.jpg','2019-01-28 10:06:18.953123',4),(60,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__120x80_q85_subsampling-2.jpg','2019-01-28 10:06:19.057765',5),(62,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__600x0_q85_subsampling-2.jpg','2019-01-28 10:18:03.933408',1),(63,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg__1200x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:18:04.108167',1),(64,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__1200x0_q85_subsampling-2.jpg','2019-01-28 10:19:53.073261',5),(65,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.167178',5),(66,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.277341',5),(67,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:19:53.544616',5),(72,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:20:41.291797',4),(73,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.384060',4),(74,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.458560',4),(75,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.529007',4),(76,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:49.600575',4),(77,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__210x0_q85_subsampling-2_upscale.jpg','2019-01-28 10:20:53.458830',5),(78,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.285805',5),(79,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.359099',5),(80,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.437120',5),(81,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:20:59.509770',5),(82,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 10:21:01.224675',4),(83,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:03.910436',4),(84,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:03.982213',4),(85,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:04.056100',4),(86,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 10:21:04.127349',4),(87,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__1200x0_q85_subsampling-2.jpg','2019-01-28 13:14:54.226909',4),(88,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.354039',4),(89,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.461852',4),(90,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 13:14:54.723278',4),(91,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/02/6b/026bf769-d9e3-40d7-89ca-86405176f96b/testbild2.png__210x0_q85_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:32.827341',4),(92,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.121134',7),(93,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.202449',7),(94,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.279626',7),(95,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:51.357259',7),(96,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/1f/b0/1fb00cd4-befd-418b-a090-9c5caa1aeeae/modlab_wallpaper_04.png__210x0_q85_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:20:53.686609',7),(97,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:01.992001',8),(98,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:02.103222',8),(99,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:02.220143',8),(100,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:02.329101',8),(101,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/5f/05/5f058dbd-3361-40d8-af33-a1544c3c1fef/testbild3.png__210x0_q85_subject_location-1440,898_subsampling-2_upscale.jpg','2019-01-28 15:21:04.585855',5),(102,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__16x16_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:10.168395',9),(103,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__64x64_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:10.240467',9),(104,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__48x48_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:10.312601',9),(105,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__32x32_q85_crop_subject_location-1440,891_subsampling-2_upscale.jpg','2019-01-28 15:21:10.383568',9),(106,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__1200x0_q85_subsampling-2.jpg','2019-01-28 15:21:14.492120',9),(107,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:14.587056',9),(108,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:14.697615',9),(109,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:14.963305',9),(110,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__1200x0_q85_subsampling-2.jpg','2019-01-28 15:21:15.237025',8),(111,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__480x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:15.366358',8),(112,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__800x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:15.514432',8),(113,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__2400x0_q85_subsampling-2_upscale.jpg','2019-01-28 15:21:15.811968',8),(114,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__16x16_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.177775',10),(115,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__64x64_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.261432',10),(116,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__48x48_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.345398',10),(117,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__32x32_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.427590',10),(118,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__180x180_q85_crop_subsampling-2_upscale.png','2019-01-28 15:21:32.539506',10),(119,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__210x0_q85_subsampling-2_upscale.png','2019-01-28 15:21:35.528687',10),(120,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__16x16_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-01-28 15:21:44.019532',10),(121,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__64x64_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-01-28 15:21:44.100032',10),(122,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__48x48_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-01-28 15:21:44.173235',10),(123,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__32x32_q85_crop_subject_location-1440,898_subsampling-2_upscale.png','2019-01-28 15:21:44.254099',10),(124,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg__120x80_q85_subsampling-2.jpg','2019-01-28 15:22:25.269768',8),(125,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png__120x80_q85_subsampling-2.jpg','2019-01-28 15:22:25.353243',9),(126,'f9bde26a1556cd667f742bd34ec7c55e','filer_public_thumbnails/filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png__120x80_q85_subsampling-2.png','2019-01-28 15:22:25.438741',10);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editables_editablerichtext`
--

LOCK TABLES `editables_editablerichtext` WRITE;
/*!40000 ALTER TABLE `editables_editablerichtext` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_file`
--

LOCK TABLES `filer_file` WRITE;
/*!40000 ALTER TABLE `filer_file` DISABLE KEYS */;
INSERT INTO `filer_file` VALUES (1,'filer_public/3c/bb/3cbb6d32-98d5-4012-83d7-9e8d4f630923/jerli_bg02.jpg',361700,'189fd19417c28b2e754cf1682d1c43fc0706da58',1,'jerli_bg02.jpg','Standardbild',NULL,'2019-01-17 17:19:23.614083','2019-01-17 17:19:37.837037',1,3,1,32),(2,'filer_public/31/ee/31eef8dc-2b91-4769-81fd-c41a8881531b/jerli_bg02.jpg',361700,'189fd19417c28b2e754cf1682d1c43fc0706da58',1,'jerli_bg02.jpg','SEO-Bild',NULL,'2019-01-17 17:20:03.001630','2019-01-17 17:20:22.826882',1,3,1,32),(4,'filer_public/26/37/2637b654-bec2-4462-a139-5142e2421b40/command2.jpg',55368,'c299aa00055fea13f7c632fce4fdcb7a9c56e3e1',1,'Testbild2.png','Standardbild 2',NULL,'2019-01-28 10:05:51.674839','2019-01-28 15:21:01.804874',1,3,1,32),(5,'filer_public/8c/50/8c50a3cb-e5fc-4cb8-9d9a-cbfd81b947e6/mount.png',28131,'cffe68eded5719ada7207d37d3643ce99bc94ae7',1,'Testbild3.png','Standardbild 3',NULL,'2019-01-28 10:05:51.683556','2019-01-28 15:21:10.012299',1,3,1,32),(7,'filer_public/42/47/4247ecb6-40c9-4f47-8943-077fadaf7d58/dots.png',27503,'7940beead55f1587624547ade96fc32495127316',1,'Dots.png','Standardbild 4',NULL,'2019-01-28 15:21:32.085238','2019-01-28 15:21:43.844725',1,3,1,32);
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
  KEY `filer_folder_lft_2c2b69f1` (`lft`),
  KEY `filer_folder_rght_34946267` (`rght`),
  KEY `filer_folder_tree_id_b016223c` (`tree_id`),
  KEY `filer_folder_level_b631d28a` (`level`),
  KEY `filer_folder_owner_id_be530fb4_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `filer_folder_owner_id_be530fb4_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `filer_folder_parent_id_308aecda_fk_filer_folder_id` FOREIGN KEY (`parent_id`) REFERENCES `filer_folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folder`
--

LOCK TABLES `filer_folder` WRITE;
/*!40000 ALTER TABLE `filer_folder` DISABLE KEYS */;
INSERT INTO `filer_folder` VALUES (1,'Bilder','2019-01-17 17:07:42.716674','2019-01-17 17:07:42.716711','2019-01-17 17:07:42.716725',1,4,1,0,1,NULL),(2,'Downloads','2019-01-17 17:07:48.588977','2019-01-17 17:07:48.589019','2019-01-17 17:07:48.589035',1,2,2,0,1,NULL),(3,'Testbilder','2019-01-17 17:07:54.586338','2019-01-17 17:07:54.586377','2019-01-17 17:07:54.586392',2,3,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (73,'de',1,'cms_3.5.3_menu_nodes_de_1_1_user:draft'),(74,'de',1,'cms_3.5.3_menu_nodes_de_1:public');
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
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `stencils_stencildata_cmsplugin_ptr_id_b614621a_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stencils_stencildata`
--

LOCK TABLES `stencils_stencildata` WRITE;
/*!40000 ALTER TABLE `stencils_stencildata` DISABLE KEYS */;
INSERT INTO `stencils_stencildata` VALUES (4,'Vollbild',NULL,'','gAJdcQAofXEBKFgHAAAAY2FwdGlvbnECWAAAAABxA1gCAAAAaWRxBFgBAAAAMXEFdX1xBihoAmgDaARYAQAAADRxB3V9cQgoaAJoA2gEWAEAAAA1cQl1ZS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(5,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col'),(6,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left'),(7,'Teaser Gruppe',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(8,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(9,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(10,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(11,'Vollbild mit Textspalten',NULL,'','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAAxcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(12,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(13,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(14,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAIAAABpZHECWAEAAAA1cQNYBwAAAGNhcHRpb25xBFgAAAAAcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left'),(15,'Highlights',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(16,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAAxcQV1YS4=',NULL,NULL,NULL,NULL,NULL),(17,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA0cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(18,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(19,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA3cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(20,'Highlights',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA0cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(74,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right'),(183,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left'),(184,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right'),(337,'Vollbild',NULL,'','gAJdcQAofXEBKFgHAAAAY2FwdGlvbnECWAAAAABxA1gCAAAAaWRxBFgBAAAAMXEFdX1xBihoAmgDaARYAQAAADRxB3V9cQgoaAJoA2gEWAEAAAA1cQl1ZS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(338,'Text volle Breite',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,'1-col'),(339,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left'),(340,'Teaser Gruppe',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(341,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(342,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(343,'Teaser',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>','gAJdcQB9cQFYAgAAAGlkcQJLAXNhLg==','gAJdcQAu',NULL,'/',NULL,NULL,NULL),(344,'Vollbild mit Textspalten',NULL,'','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAAxcQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(345,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(346,'Textspalte',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(347,'Highlights',NULL,'','gAJdcQAu','gAJdcQAu',NULL,NULL,NULL,NULL,NULL),(348,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAAxcQV1YS4=',NULL,NULL,NULL,NULL,NULL),(349,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA0cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(350,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(351,'Highlight',NULL,'<p>Hightlight-Text</p>\r\n\r\n<p>&nbsp;</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA3cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(352,'Highlights',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQAu','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA0cQV1YS4=',NULL,NULL,NULL,NULL,NULL),(353,'Vollbild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right'),(354,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'left'),(355,'Bild mit Text',NULL,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>','gAJdcQB9cQEoWAcAAABjYXB0aW9ucQJYAAAAAHEDWAIAAABpZHEEWAEAAAA1cQV1YS4=','gAJdcQAu',NULL,NULL,NULL,NULL,'right');
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
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `stencils_stencilslid_cmsplugin_ptr_id_5f049911_fk_cms_cmspl` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stencils_stencilslider`
--

LOCK TABLES `stencils_stencilslider` WRITE;
/*!40000 ALTER TABLE `stencils_stencilslider` DISABLE KEYS */;
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

-- Dump completed on 2019-02-08  8:44:35