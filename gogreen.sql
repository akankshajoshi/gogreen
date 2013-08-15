-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: gogreen
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add blog',9,'add_blog'),(26,'Can change blog',9,'change_blog'),(27,'Can delete blog',9,'delete_blog'),(28,'Can add business type',10,'add_businesstype'),(29,'Can change business type',10,'change_businesstype'),(30,'Can delete business type',10,'delete_businesstype'),(31,'Can add company',11,'add_company'),(32,'Can change company',11,'change_company'),(33,'Can delete company',11,'delete_company'),(34,'Can add company img',12,'add_companyimg'),(35,'Can change company img',12,'change_companyimg'),(36,'Can delete company img',12,'delete_companyimg'),(37,'Can add comment',13,'add_comment'),(38,'Can change comment',13,'change_comment'),(39,'Can delete comment',13,'delete_comment'),(40,'Can add contact us',14,'add_contactus'),(41,'Can change contact us',14,'change_contactus'),(42,'Can delete contact us',14,'delete_contactus'),(43,'Can add green o meter',15,'add_greenometer'),(44,'Can change green o meter',15,'change_greenometer'),(45,'Can delete green o meter',15,'delete_greenometer'),(46,'Can add category',16,'add_category'),(47,'Can change category',16,'change_category'),(48,'Can delete category',16,'delete_category'),(49,'Can add subcategory',17,'add_subcategory'),(50,'Can change subcategory',17,'change_subcategory'),(51,'Can delete subcategory',17,'delete_subcategory'),(52,'Can add popular keyword',18,'add_popularkeyword'),(53,'Can change popular keyword',18,'change_popularkeyword'),(54,'Can delete popular keyword',18,'delete_popularkeyword'),(55,'Can add heading',19,'add_heading'),(56,'Can change heading',19,'change_heading'),(57,'Can delete heading',19,'delete_heading'),(58,'Can add big banner',20,'add_bigbanner'),(59,'Can change big banner',20,'change_bigbanner'),(60,'Can delete big banner',20,'delete_bigbanner'),(61,'Can add company count',21,'add_companycount'),(62,'Can change company count',21,'change_companycount'),(63,'Can delete company count',21,'delete_companycount'),(64,'Can add testimonials',22,'add_testimonials'),(65,'Can change testimonials',22,'change_testimonials'),(66,'Can delete testimonials',22,'delete_testimonials'),(67,'Can add contact us',23,'add_contactus'),(68,'Can change contact us',23,'change_contactus'),(69,'Can delete contact us',23,'delete_contactus'),(70,'Can add contact us text',24,'add_contactustext'),(71,'Can change contact us text',24,'change_contactustext'),(72,'Can delete contact us text',24,'delete_contactustext'),(73,'Can add terms n condition',25,'add_termsncondition'),(74,'Can change terms n condition',25,'change_termsncondition'),(75,'Can delete terms n condition',25,'delete_termsncondition'),(76,'Can add about us',26,'add_aboutus'),(77,'Can change about us',26,'change_aboutus'),(78,'Can delete about us',26,'delete_aboutus'),(79,'Can add enquiry',27,'add_enquiry'),(80,'Can change enquiry',27,'change_enquiry'),(81,'Can delete enquiry',27,'delete_enquiry'),(82,'Can add logo',28,'add_logo'),(83,'Can change logo',28,'change_logo'),(84,'Can delete logo',28,'delete_logo'),(85,'Can add paid logo',29,'add_paidlogo'),(86,'Can change paid logo',29,'change_paidlogo'),(87,'Can delete paid logo',29,'delete_paidlogo'),(88,'Can add grn vchr home',30,'add_grnvchrhome'),(89,'Can change grn vchr home',30,'change_grnvchrhome'),(90,'Can delete grn vchr home',30,'delete_grnvchrhome'),(91,'Can add green vichar',31,'add_greenvichar'),(92,'Can change green vichar',31,'change_greenvichar'),(93,'Can delete green vichar',31,'delete_greenvichar'),(94,'Can add comments',32,'add_comments'),(95,'Can change comments',32,'change_comments'),(96,'Can delete comments',32,'delete_comments'),(97,'Can add green vichar img',33,'add_greenvicharimg'),(98,'Can change green vichar img',33,'change_greenvicharimg'),(99,'Can delete green vichar img',33,'delete_greenvicharimg'),(100,'Can add event',34,'add_event'),(101,'Can change event',34,'change_event'),(102,'Can delete event',34,'delete_event'),(103,'Can add article',35,'add_article'),(104,'Can change article',35,'change_article'),(105,'Can delete article',35,'delete_article'),(106,'Can add pics video',36,'add_picsvideo'),(107,'Can change pics video',36,'change_picsvideo'),(108,'Can delete pics video',36,'delete_picsvideo'),(109,'Can add story quotes',37,'add_storyquotes'),(110,'Can change story quotes',37,'change_storyquotes'),(111,'Can delete story quotes',37,'delete_storyquotes'),(112,'Can add questionire',38,'add_questionire'),(113,'Can change questionire',38,'change_questionire'),(114,'Can delete questionire',38,'delete_questionire');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','a@gmail.com','sha1$384a4$c5ad30f1b9cf4eb54ba04cabbe642acf1c70dec0',1,1,1,'2013-08-14 23:08:25','2013-08-14 22:54:26');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_aboutus`
--

DROP TABLE IF EXISTS `common_aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_aboutus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_aboutus_6f403c1` (`updated_by_id`),
  CONSTRAINT `updated_by_id_refs_id_56e0468f` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_aboutus`
--

LOCK TABLES `common_aboutus` WRITE;
/*!40000 ALTER TABLE `common_aboutus` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_aboutus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_contactus`
--

DROP TABLE IF EXISTS `common_contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `text` longtext NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `type` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `moderation_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `done_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_contactus_5493075d` (`done_by_id`),
  CONSTRAINT `done_by_id_refs_id_70d189aa` FOREIGN KEY (`done_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_contactus`
--

LOCK TABLES `common_contactus` WRITE;
/*!40000 ALTER TABLE `common_contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_contactustext`
--

DROP TABLE IF EXISTS `common_contactustext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_contactustext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_contactustext_6f403c1` (`updated_by_id`),
  CONSTRAINT `updated_by_id_refs_id_3325e017` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_contactustext`
--

LOCK TABLES `common_contactustext` WRITE;
/*!40000 ALTER TABLE `common_contactustext` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_contactustext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_enquiry`
--

DROP TABLE IF EXISTS `common_enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `text` longtext NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `creation_date` datetime NOT NULL,
  `moderation_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `done_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_enquiry_5493075d` (`done_by_id`),
  CONSTRAINT `done_by_id_refs_id_37386101` FOREIGN KEY (`done_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_enquiry`
--

LOCK TABLES `common_enquiry` WRITE;
/*!40000 ALTER TABLE `common_enquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_termsncondition`
--

DROP TABLE IF EXISTS `common_termsncondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_termsncondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `updated_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `common_termsncondition_6f403c1` (`updated_by_id`),
  CONSTRAINT `updated_by_id_refs_id_3d5b04ac` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_termsncondition`
--

LOCK TABLES `common_termsncondition` WRITE;
/*!40000 ALTER TABLE `common_termsncondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `common_termsncondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'blog','website','blog'),(10,'business type','website','businesstype'),(11,'company','website','company'),(12,'company img','website','companyimg'),(13,'comment','website','comment'),(14,'contact us','website','contactus'),(15,'green o meter','website','greenometer'),(16,'category','website','category'),(17,'subcategory','website','subcategory'),(18,'popular keyword','website','popularkeyword'),(19,'heading','homepage','heading'),(20,'big banner','homepage','bigbanner'),(21,'company count','homepage','companycount'),(22,'testimonials','homepage','testimonials'),(23,'contact us','common','contactus'),(24,'contact us text','common','contactustext'),(25,'terms n condition','common','termsncondition'),(26,'about us','common','aboutus'),(27,'enquiry','common','enquiry'),(28,'logo','logo','logo'),(29,'paid logo','logo','paidlogo'),(30,'grn vchr home','greenvichar','grnvchrhome'),(31,'green vichar','greenvichar','greenvichar'),(32,'comments','greenvichar','comments'),(33,'green vichar img','greenvichar','greenvicharimg'),(34,'event','greenvichar','event'),(35,'article','greenvichar','article'),(36,'pics video','greenvichar','picsvideo'),(37,'story quotes','greenvichar','storyquotes'),(38,'questionire','greenvichar','questionire');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eee6d59f21894ed6f028a4fd5b14dcc1','ZDlmYjlmOWVhOTQ3ZjE2MDI1YWExNTlmZmI4NDQ4NjE4YjlkODBhNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-08-28 23:08:26');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
-- Table structure for table `greenvichar_article`
--

DROP TABLE IF EXISTS `greenvichar_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_article_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_72305cff` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_article`
--

LOCK TABLES `greenvichar_article` WRITE;
/*!40000 ALTER TABLE `greenvichar_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_comments`
--

DROP TABLE IF EXISTS `greenvichar_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grnvichar_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `text` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `moderation_date` datetime NOT NULL,
  `is_approve` tinyint(1) NOT NULL,
  `approve_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_comments_11944be1` (`grnvichar_id`),
  KEY `greenvichar_comments_5d1bd22d` (`approve_by_id`),
  CONSTRAINT `approve_by_id_refs_id_645c2435` FOREIGN KEY (`approve_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `grnvichar_id_refs_id_1fa642e6` FOREIGN KEY (`grnvichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_comments`
--

LOCK TABLES `greenvichar_comments` WRITE;
/*!40000 ALTER TABLE `greenvichar_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_event`
--

DROP TABLE IF EXISTS `greenvichar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_event_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_2b886927` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_event`
--

LOCK TABLES `greenvichar_event` WRITE;
/*!40000 ALTER TABLE `greenvichar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_greenvichar`
--

DROP TABLE IF EXISTS `greenvichar_greenvichar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_greenvichar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `vichar_type` varchar(50) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `publish_date` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `approved_by` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_greenvichar_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_43e16b16` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_greenvichar`
--

LOCK TABLES `greenvichar_greenvichar` WRITE;
/*!40000 ALTER TABLE `greenvichar_greenvichar` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_greenvichar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_greenvicharimg`
--

DROP TABLE IF EXISTS `greenvichar_greenvicharimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_greenvicharimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_greenvicharimg_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_2859b8d3` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_greenvicharimg`
--

LOCK TABLES `greenvichar_greenvicharimg` WRITE;
/*!40000 ALTER TABLE `greenvichar_greenvicharimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_greenvicharimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_grnvchrhome`
--

DROP TABLE IF EXISTS `greenvichar_grnvchrhome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_grnvchrhome` (
  `type` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_grnvchrhome`
--

LOCK TABLES `greenvichar_grnvchrhome` WRITE;
/*!40000 ALTER TABLE `greenvichar_grnvchrhome` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_grnvchrhome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_picsvideo`
--

DROP TABLE IF EXISTS `greenvichar_picsvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_picsvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `links` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_picsvideo_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_3febdfa7` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_picsvideo`
--

LOCK TABLES `greenvichar_picsvideo` WRITE;
/*!40000 ALTER TABLE `greenvichar_picsvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_picsvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_questionire`
--

DROP TABLE IF EXISTS `greenvichar_questionire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_questionire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `greenvichar_questionire_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_79fe4857` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_questionire`
--

LOCK TABLES `greenvichar_questionire` WRITE;
/*!40000 ALTER TABLE `greenvichar_questionire` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_questionire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenvichar_storyquotes`
--

DROP TABLE IF EXISTS `greenvichar_storyquotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_storyquotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `green_vichar_id` int(11) NOT NULL,
  `text` varchar(200) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`id`),
  KEY `greenvichar_storyquotes_5c26833` (`green_vichar_id`),
  CONSTRAINT `green_vichar_id_refs_id_132b6b0d` FOREIGN KEY (`green_vichar_id`) REFERENCES `greenvichar_greenvichar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_storyquotes`
--

LOCK TABLES `greenvichar_storyquotes` WRITE;
/*!40000 ALTER TABLE `greenvichar_storyquotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenvichar_storyquotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_bigbanner`
--

DROP TABLE IF EXISTS `homepage_bigbanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_bigbanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `published_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homepage_bigbanner_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_2148edd9` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_bigbanner`
--

LOCK TABLES `homepage_bigbanner` WRITE;
/*!40000 ALTER TABLE `homepage_bigbanner` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_bigbanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_companycount`
--

DROP TABLE IF EXISTS `homepage_companycount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_companycount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text1` varchar(10) NOT NULL,
  `text2` varchar(10) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homepage_companycount_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_5c41f7d8` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_companycount`
--

LOCK TABLES `homepage_companycount` WRITE;
/*!40000 ALTER TABLE `homepage_companycount` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_companycount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_heading`
--

DROP TABLE IF EXISTS `homepage_heading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_heading` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(150) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homepage_heading_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_382be245` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_heading`
--

LOCK TABLES `homepage_heading` WRITE;
/*!40000 ALTER TABLE `homepage_heading` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_heading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_testimonials`
--

DROP TABLE IF EXISTS `homepage_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `description` varchar(400) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `published_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homepage_testimonials_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_28da091e` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_testimonials`
--

LOCK TABLES `homepage_testimonials` WRITE;
/*!40000 ALTER TABLE `homepage_testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `homepage_testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo_logo`
--

DROP TABLE IF EXISTS `logo_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logo_logo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_url` varchar(200) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logo_logo_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_6af6c81c` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo_logo`
--

LOCK TABLES `logo_logo` WRITE;
/*!40000 ALTER TABLE `logo_logo` DISABLE KEYS */;
/*!40000 ALTER TABLE `logo_logo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo_paidlogo`
--

DROP TABLE IF EXISTS `logo_paidlogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logo_paidlogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_url` varchar(200) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logo_paidlogo_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_2c2d5cba` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo_paidlogo`
--

LOCK TABLES `logo_paidlogo` WRITE;
/*!40000 ALTER TABLE `logo_paidlogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `logo_paidlogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logo_paidlogo_category`
--

DROP TABLE IF EXISTS `logo_paidlogo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logo_paidlogo_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paidlogo_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paidlogo_id` (`paidlogo_id`,`category_id`),
  KEY `logo_paidlogo_category_2ab37485` (`paidlogo_id`),
  KEY `logo_paidlogo_category_42dc49bc` (`category_id`),
  CONSTRAINT `paidlogo_id_refs_id_576130ff` FOREIGN KEY (`paidlogo_id`) REFERENCES `logo_paidlogo` (`id`),
  CONSTRAINT `category_id_refs_id_7b0307b5` FOREIGN KEY (`category_id`) REFERENCES `website_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logo_paidlogo_category`
--

LOCK TABLES `logo_paidlogo_category` WRITE;
/*!40000 ALTER TABLE `logo_paidlogo_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `logo_paidlogo_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_blog`
--

DROP TABLE IF EXISTS `website_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `linkurl` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `text` longtext,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_blog`
--

LOCK TABLES `website_blog` WRITE;
/*!40000 ALTER TABLE `website_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_businesstype`
--

DROP TABLE IF EXISTS `website_businesstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_businesstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_businesstype`
--

LOCK TABLES `website_businesstype` WRITE;
/*!40000 ALTER TABLE `website_businesstype` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_businesstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_category`
--

DROP TABLE IF EXISTS `website_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_category`
--

LOCK TABLES `website_category` WRITE;
/*!40000 ALTER TABLE `website_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_comment`
--

DROP TABLE IF EXISTS `website_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `text` longtext NOT NULL,
  `creation_date` datetime NOT NULL,
  `moderation_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `done_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_comment_543518c6` (`company_id`),
  KEY `website_comment_5493075d` (`done_by_id`),
  CONSTRAINT `done_by_id_refs_id_24b77cd6` FOREIGN KEY (`done_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `company_id_refs_id_5792aff3` FOREIGN KEY (`company_id`) REFERENCES `website_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_comment`
--

LOCK TABLES `website_comment` WRITE;
/*!40000 ALTER TABLE `website_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_company`
--

DROP TABLE IF EXISTS `website_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) NOT NULL,
  `company_tagline` varchar(200) DEFAULT NULL,
  `meta_desc` longtext,
  `meta_kword` varchar(50) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `contact_person` varchar(30) DEFAULT NULL,
  `contact_email` varchar(75) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `business_description` longtext,
  `deals_in` varchar(200) DEFAULT NULL,
  `green_o_meter` varchar(100) DEFAULT NULL,
  `year_founded` int(11) DEFAULT NULL,
  `no_of_emp` int(11) DEFAULT NULL,
  `turnover` int(11) DEFAULT NULL,
  `certifications` varchar(200) DEFAULT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `brouchers` varchar(100) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` date NOT NULL,
  `modified_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_company_6162aa58` (`modified_by_id`),
  CONSTRAINT `modified_by_id_refs_id_2a87a4b0` FOREIGN KEY (`modified_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_company`
--

LOCK TABLES `website_company` WRITE;
/*!40000 ALTER TABLE `website_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_company_business_type`
--

DROP TABLE IF EXISTS `website_company_business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_company_business_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `businesstype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`,`businesstype_id`),
  KEY `website_company_business_type_543518c6` (`company_id`),
  KEY `website_company_business_type_6c9ea312` (`businesstype_id`),
  CONSTRAINT `company_id_refs_id_74bb7dcb` FOREIGN KEY (`company_id`) REFERENCES `website_company` (`id`),
  CONSTRAINT `businesstype_id_refs_id_8c999db` FOREIGN KEY (`businesstype_id`) REFERENCES `website_businesstype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_company_business_type`
--

LOCK TABLES `website_company_business_type` WRITE;
/*!40000 ALTER TABLE `website_company_business_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_company_business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_company_subcategory`
--

DROP TABLE IF EXISTS `website_company_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_company_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`,`subcategory_id`),
  KEY `website_company_subcategory_543518c6` (`company_id`),
  KEY `website_company_subcategory_6ec4c7cb` (`subcategory_id`),
  CONSTRAINT `subcategory_id_refs_id_5c3c35f5` FOREIGN KEY (`subcategory_id`) REFERENCES `website_subcategory` (`id`),
  CONSTRAINT `company_id_refs_id_59391c3c` FOREIGN KEY (`company_id`) REFERENCES `website_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_company_subcategory`
--

LOCK TABLES `website_company_subcategory` WRITE;
/*!40000 ALTER TABLE `website_company_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_company_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_companyimg`
--

DROP TABLE IF EXISTS `website_companyimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_companyimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_companyimg_543518c6` (`company_id`),
  CONSTRAINT `company_id_refs_id_48ba14cd` FOREIGN KEY (`company_id`) REFERENCES `website_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_companyimg`
--

LOCK TABLES `website_companyimg` WRITE;
/*!40000 ALTER TABLE `website_companyimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_companyimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_contactus`
--

DROP TABLE IF EXISTS `website_contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(75) NOT NULL,
  `text` longtext NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `creation_date` datetime NOT NULL,
  `moderation_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `done_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_contactus_543518c6` (`company_id`),
  CONSTRAINT `company_id_refs_id_529567d0` FOREIGN KEY (`company_id`) REFERENCES `website_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_contactus`
--

LOCK TABLES `website_contactus` WRITE;
/*!40000 ALTER TABLE `website_contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_greenometer`
--

DROP TABLE IF EXISTS `website_greenometer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_greenometer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_greenometer`
--

LOCK TABLES `website_greenometer` WRITE;
/*!40000 ALTER TABLE `website_greenometer` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_greenometer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_popularkeyword`
--

DROP TABLE IF EXISTS `website_popularkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_popularkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(200) NOT NULL,
  `timestamp` datetime NOT NULL,
  `subcat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_popularkeyword_6c7f082c` (`subcat_id`),
  CONSTRAINT `subcat_id_refs_id_6372146` FOREIGN KEY (`subcat_id`) REFERENCES `website_subcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_popularkeyword`
--

LOCK TABLES `website_popularkeyword` WRITE;
/*!40000 ALTER TABLE `website_popularkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_popularkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_subcategory`
--

DROP TABLE IF EXISTS `website_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `created_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_subcategory`
--

LOCK TABLES `website_subcategory` WRITE;
/*!40000 ALTER TABLE `website_subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_subcategory_category`
--

DROP TABLE IF EXISTS `website_subcategory_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_subcategory_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory_id` (`subcategory_id`,`category_id`),
  KEY `website_subcategory_category_6ec4c7cb` (`subcategory_id`),
  KEY `website_subcategory_category_42dc49bc` (`category_id`),
  CONSTRAINT `subcategory_id_refs_id_2a53145f` FOREIGN KEY (`subcategory_id`) REFERENCES `website_subcategory` (`id`),
  CONSTRAINT `category_id_refs_id_4bdef1fe` FOREIGN KEY (`category_id`) REFERENCES `website_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_subcategory_category`
--

LOCK TABLES `website_subcategory_category` WRITE;
/*!40000 ALTER TABLE `website_subcategory_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_subcategory_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-15  9:46:42
