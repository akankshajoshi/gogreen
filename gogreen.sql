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
INSERT INTO `auth_user` VALUES (1,'admin','','','a@gmail.com','sha1$f6df0$425681add19de3d8a54005ca8ceddd582813d73f',1,1,1,'2013-08-15 01:20:09','2013-08-15 00:23:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-08-15 01:30:51',1,30,'1','GrnVchrHome object',1,''),(2,'2013-08-15 01:31:16',1,30,'2','GrnVchrHome object',1,''),(3,'2013-08-15 01:31:49',1,30,'3','GrnVchrHome object',1,''),(4,'2013-08-15 01:32:17',1,30,'4','GrnVchrHome object',1,''),(5,'2013-08-15 01:32:46',1,30,'5','GrnVchrHome object',1,'');
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
INSERT INTO `django_session` VALUES ('1cde185ab17595d1495fd3a9259be0a3','ZDlmYjlmOWVhOTQ3ZjE2MDI1YWExNTlmZmI4NDQ4NjE4YjlkODBhNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-08-29 01:20:09'),('41eebb4507761c617e62d748d29a8848','ZDlmYjlmOWVhOTQ3ZjE2MDI1YWExNTlmZmI4NDQ4NjE4YjlkODBhNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-08-29 00:32:23');
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
  `vichar_type` int(11) DEFAULT NULL,
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
-- Table structure for table `greenvichar_grnvchrhome`
--

DROP TABLE IF EXISTS `greenvichar_grnvchrhome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenvichar_grnvchrhome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenvichar_grnvchrhome`
--

LOCK TABLES `greenvichar_grnvchrhome` WRITE;
/*!40000 ALTER TABLE `greenvichar_grnvchrhome` DISABLE KEYS */;
INSERT INTO `greenvichar_grnvchrhome` VALUES (1,1,'test event','test event','uploads/grnvichar/IMG_0028_1.JPG'),(2,2,'test article','test article','uploads/grnvichar/IMG_0050.JPG'),(3,3,'test pics vedio','test video','uploads/grnvichar/IMG_0044.JPG'),(4,4,'test quotes','test quotes','uploads/grnvichar/IMG_0052.JPG'),(5,5,'test questionre','test questionre','uploads/grnvichar/IMG_0047.JPG');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_category`
--

LOCK TABLES `website_category` WRITE;
/*!40000 ALTER TABLE `website_category` DISABLE KEYS */;
INSERT INTO `website_category` VALUES (1,'ENERGY AND POWER','2013-08-15 00:24:36',0,1),(2,'AYURVEDA AND HERBAL','2013-08-15 00:24:37',0,1),(3,'ENVIRONMENT','2013-08-15 00:24:37',0,1),(4,'GIFTS AND CRAFTS','2013-08-15 00:24:38',0,1),(5,'HEALTH AND BEAUTY','2013-08-15 00:24:39',0,1),(6,'FASHION AND ACCESSORIES','2013-08-15 00:24:40',0,1),(7,'BUSINESS SERVICES','2013-08-15 00:24:40',0,1),(8,'GREEN INDUSTRY','2013-08-15 00:24:40',0,1),(9,'HOUSE AND BUILDING','2013-08-15 00:24:41',0,1),(10,'LIFESTYLE','2013-08-15 00:24:41',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_company`
--

LOCK TABLES `website_company` WRITE;
/*!40000 ALTER TABLE `website_company` DISABLE KEYS */;
INSERT INTO `website_company` VALUES (1,'Rainbow Designs',NULL,NULL,NULL,'Bangaluru, Karnataka','Bengaluru','Karnataka','',NULL,NULL,'','','We create jewellery which includes glass beads, crystals,wood,brass etc which are both traditional and fashionable. https://www.facebook.com/FahionJewelry The rich look and the amazing color combinations will definitely create a \'WOW\' effect!!!',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(2,'Rahul Handicrafts',NULL,NULL,NULL,'By Pass Road, Near Rajasthan Marble, Muttathara, Vallakadavu P. O, Trivanduram No. 8,\nThiruvananthapuram -695 008, Kerala,India','Thiruvananthapuram','Kerala','(91)-(471)-2505150',NULL,NULL,'','','Kerala has always been famous for its rich and vibrant tradition and unique wooden crafts, coconut shell crafts, metal crafts and bamboo crafts . Rahul handicrafts is the manufacturer and supplier of handicrafts.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(3,'Raga Creations',NULL,NULL,NULL,'No. 267/271, Kanak Chambers, Shop No. 305, 3rd Floor, Opposite Adarsh Hotel, Kalbadevi Road, Mumbai - 400 002, Maharashtra, India','Mumbai','Maharashtra','(91)-9820810080',NULL,NULL,'','','Raga creations is designed to cater to those looking for international design and quality at local prices. Every jewel here is a hand-picked masterpiece. The range includes the finest imitation jewelry. raga creations is one of mumbai\'s most contemporary imitation jewelers, specializing in the latest variation of fashionable ornaments. ',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(4,'Raga jewels',NULL,NULL,NULL,'Noida, Uttar Pradesh','Noida','Uttar Pradesh','',NULL,NULL,'','','Manufacturer of Fashion Jewellery, Beaded Jewellery, Handmade Jewellery etc.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(5,'Raga In Banaras Multi service pvt ltd ',NULL,NULL,NULL,'Ck-10/53, Manikarnika Chowk, Varanasi H O, Varanasi - 221001','Varanasi','Uttar Pradesh','91-(0542) 2402945',NULL,NULL,'','','We provide multi service in several domains of multicultural education & trading sector. Our Education providing methodology is to provide true and meaningful information to bring about change at every level of our society and at the same time our trading section provides multi service and practical training for preparing Ayurvedic herbs (natural medicine) and making 100% recyclable hand made product by natural raw materials and our mission is to keep our clients and believers close to the nature as much as possible...',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(6,'Radhika\'s World of Crafts',NULL,NULL,NULL,'Bengaluru, Karnataka','Bengaluru','Karnataka','',NULL,NULL,'','','Radhika Enterprises is a trusted name in the field of authentic Indian Handicrafts. Our speciality lies in the wide range of Brass artifacts in antique-finish. Over the last decade, we have organised and taken part in over a hundred exhibitions at prominent places at Bangaluru and other major cities. We are regularly invited by most of the State Governments to participate in their craft fairs. Our parent company has won several awards. Our artifacts adorn the homes of crme de la crme, connosiurs, art lovers across the world.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(7,'Rachnatmak Arts',NULL,NULL,NULL,'Jaipur, Rajasthan','Jaipur','Rajasthan','',NULL,NULL,'','','Rachnatmak arts is best known for its handmade paper envelopes. Ranging from paper quilling, to gota work, paper mache work, patch work, bandhej work, etc. we use a variety of arts to make colourful and attractive envelopes.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(8,'Rachaita',NULL,NULL,NULL,'Mumbai, Maharashtra','Mumbai','Maharashtra','',NULL,NULL,'','','the contents of this label are as unique as the label itself. It houses simple yet elegant designs born out of passion for creativity by Lubna in 2010 and is based in Mumbai. The funky colors and geometric designs of lubna\'s handmade jewellery make even the most simplest clothes look chic.It has things that complete all looks, name it and u have it, that\'s not all u can even get things custom made!! Can\'t find something to complete ur look for a kurta u found at a store ! Don\'t let it concern u, here u get exactly what u need. not jus jewelry but if u lookin for genuine gifts to those special frnds there are bags, frames, key chains etc too with innovative designs that will touch hearts.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(9,'R. S. King Jewellers',NULL,NULL,NULL,'No. 578, 1st Floor, Kashi Nath Ji Ki Gali, Gopal Ji Ka, Rasta, Johri Bazar, Jaipur - 302 003, Rajasthan, India','Jaipur','Rajasthan','(91)-9636396762',NULL,NULL,'','','Established in the year 2005, at Jaipur, (Rajasthan, India) we R. S. King Jewellers, are considered among the affluent Manufacturers, Exporters, Wholesalers and Suppliers of an exquisite collection of Kundan Meena Pendant, Kundan Meena Jewelery, Gold Ornament Stone Works, Jeweled Sword, Kundan Meena Sword, Ancient Groom Sword, Antiqe Kundan Meena Sword, Antique Groom Sword, Meena Kundan Jewellery, Kundan Meena Pendant, Kundan Meena Jewelery, Kundan Meena Armlets, Kundan Meena Earrings, Kundan Meena Necklaces, Kundan Meena Necklace Sets, Kundan Meena Bangles, Kundan Meena Purse, Bridal Kundan Meena Purse, Kundan Meena Bridal Purse & Clutches. ',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(10,'R V EXPORTS',NULL,NULL,NULL,'A-127, Baljeet Vihar , Nithari Ext. Nangloi,\nNew Delhi 110041\nIndia','Delhi','New Delhi','91-8802514334',NULL,NULL,'','www.rvexport.com','Established in the year 2003, R V EXPORTS posses master craftsmanship complemented by an enviable vendor base, have skillfully woven magic into the motifs and designs used. A professionally managed organization, R V EXPORTS has recognized itself as one of the leading Manufacturer of unique collection of Indian Fashion Jewellery consisting of Glass Beads Bracelets, etc.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(11,'Quillkaari',NULL,NULL,NULL,'Delhi, New Delhi','Delhi','New Delhi','',NULL,NULL,'quillkaari@gmail.com','','Think beautiful, unique, quirky designs. Think quilling, a paper art form that dates back to the Renaissance. Now put the two together, and you have Quillkaari\'s beautiful range of handcrafted jewelry and gifts that are gorgeous, witty and luscious - in short, a showstopping conversation-starter! And yes, it\'s paper! At Quillkaari each piece is handcrafted by me from start to finish --- with a lot of love, a lot of patience, and a lot of time! Each design has been inspired by the delight of colours and moods that we find in nature: flowers, butterflies, rainbows, blue skies and sunsets. And the things from life we associate them with: Rangeela dil, Limchu ice candy, work-a-day lives and unconventional loves, among them!',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(12,'PUSHKARAM',NULL,NULL,NULL,'Pushkar, Rajasthan','Pushkar','Rajasthan','91-9414415534',NULL,NULL,'info@pushkaram.com','www.pushkaram.com','Pushkaram is an online home shoppe destination. Where one can buy handicrafts products only in India. A complete online shop for fashion, specialist for handicrafts bag. For women tops, skirts, suits, Indian saree, dress material, garments. For men shorts, pants, trouser, shirts, kurta. For kids dresses and many more varieties. The handicraft bag manufactured by us covers all kinds of bags including shoulder bags, hand bags, tote bags, messenger bags and many more products,. These bags are perfectly decorated with various embroidery, mirrors and other embellishments. Our bag match with any kind of outfit providing a grace to the presentation of end user.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(13,'baba craft',NULL,NULL,NULL,'Pushkar, Rajasthan','Pushkar','Rajasthan','',NULL,NULL,'','','a unique and nice collection of jewellery and handmade products available here.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(14,'PurpleCircle',NULL,NULL,NULL,'noida, Uttar Pradesh','Noida','Uttar Pradesh','',NULL,NULL,'','','A design studio based in noida, focusing on expressing thoughts through quirky and cheerful products that are 100% handmade.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(15,'Purple Winter Creations',NULL,NULL,NULL,'Chennai, Tamil Nadu','Chennai','Tamil Nadu','',NULL,NULL,'','','Purple Winter Creations is based out of Chennai, focusing on creative hand crafted products. Currently we are selling glass paintings, representing Indian art form & cultures.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(16,'bharathi ethnics',NULL,NULL,NULL,'Hyderabad, Andhra Pradesh','Hyderabad','Andhra Pradesh','',NULL,NULL,'','','Exclusive in Fashion jewellery followed by hyderabad traditions. Specialist in Hyderabad Lac Bangles,Pearls,antique Jewellery and trendy watches.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(17,'Bhavana arts',NULL,NULL,NULL,'Plot No 38/A, Near Sushma Cinema Hall, Vijawada Highway, Vanasthalipuram, Hyderabad - 500070','Hyderabad','Andhra Pradesh','91-9347484989',NULL,NULL,'bhavanaads_4u@yahoo.com','','It is an one stop shop craft or anticrafts that you can use to decorate your store or use that as an gift for all occasions and as return gifts as well.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(18,'Bhrti Impex',NULL,NULL,NULL,'Temple Shri Amrit Raghunath Ji, Opposite Hawamahal, Jaipur - 302002, Rajasthan, India','Jaipur','Rajasthan','(91)-9214526134',NULL,NULL,'','','Bhrti impex was established in the year 1991. We are manufacturer, supplier, trader, wholesaler and exporter of Oxidized Silver Ring, Oxidized Silver Earring, Oxidize Silver Earring, Gold Ring, Gold Earring, Gold Bracelet, Gold Pendant, Gold Necklace etc. We present masterpieces of craftsmanship in the field of silver jewellery. Every piece is designed keeping in mind the taste & style of the buyer. Bhrti impex expanding its reach in the foreign (export) market. Our items are crafted and manufactured under expert supervision of professionals and designers. ',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(19,'Bindurekha Fashion Studio',NULL,NULL,NULL,'Office No 4 & 5 Building D1 SAI Nagar Society, Opp To Big Bazar, Sinhagad Road-Vadgaon Budruk, Pune - 411041','Pune','Maharashtra','91-9822296370',NULL,NULL,'','','Bindurekha products are a polished blend of designer creativity fueled by designer findings, exotic stones and beads assuring an exclusive product that stands out unlike mass production items. We have 3 series:<br><br> Attitude Series: Designer findings and exotic glass, wooden, ceramic and fancy beads.<br><br> Elegance Series: 92.5 Silver findings fused with semi precious stones<br><br> Bindurekha Pearls: Natural and shell pearls fused with semi precious stones and enamel/ Mina work findings.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(20,'BioGreen Healthcare ',NULL,NULL,NULL,'Prabhakar, Plot No. AM-2/4, Wagle Industrial Area,\nNear Mulund Check Naka, Thane (West) - 400 604, Maharashtra.','Thane','Maharashtra','91-022 - 25827640 / 25829423',NULL,NULL,'biogreenhealthcare@gmail.com','www.biogreenhealthcare.com','Biogreen Healthcare has been in healthcare segment since last 5 years. We manufacture/Market Ayurvedic Herbal medicines, Health nutritional supplements, skin care, hair care products. Our company is well known for producing formulation with,quality,purity, safety, attributes. All the products are controlled by stringent quality control procedures & evaluating through clinical terms and supported by term of scientists, pharmacists.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(21,'Bkreations',NULL,NULL,NULL,'Chennai, Tamil Nadu','Chennai','Tamil Nadu','',NULL,NULL,'bkreations@gmail.com','','B\'Kreations is a handpicked collection of jewellery and fashion accessories from across India. From earrings, necklaces, bracelets, to clothing you will find the finest fashion accessories at affordable costs.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(22,'blossoms2urdoors',NULL,NULL,NULL,'hosur, Hosur, Karnataka, India 635110','Hosur','Karnataka','',NULL,NULL,'','','EXCLUSIVE RANGE OF HAIR CLIPS',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(23,'Blessed creation',NULL,NULL,NULL,'Chennai , Tamil Nadu','Chennai','Tamil Nadu','',NULL,NULL,'','','Manufacturer and Retailer of Beaded Necklace, Wallhangings and handicrafts Products.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(24,'blushh',NULL,NULL,NULL,'New Delhi, Delhi','Delhi','New Delhi','',NULL,NULL,'','','one stop shop for all kinds of creative jwellery and accessories suiting all pockets and age.. customization is also welcome..',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(25,'BohoMe',NULL,NULL,NULL,'Bangaluru, Karnataka','Bengaluru','Karnataka','',NULL,NULL,'','','\"It is the mysterious, unattainable things that pick your heart. A curiously shaped leaf, the way the moon hangs in the sky on a certain night, the pattern on a fish, or even a creature from a dream. And you long to keep that inexpressible, natural, rare occurrence at a place close to you - at your home, on your body. But this desire is not easily understood or fulfilled, which is to be expected because it is an instinct for uniqueness, coming from somewhere deep inside of you. At Boho Me, I try to give an expression to that inner desire, that faint whim or vibrant fancy, collecting my components of work nomadically from this place and that and putting them together and out for you who have the same bent of heart, the same bohemian longing.\"',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(26,'BowsAndRoses',NULL,NULL,NULL,'Mumbai, Maharashtra','Mumbai','Maharashtra','',NULL,NULL,'','','Hair Accessories for Little Princesses',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(27,'Brass House India',NULL,NULL,NULL,'C96, Gandhi Nagar, Moradabad - 244001, Uttar Pradesh, India','Moradabad','Uttar Pradesh','(91)-(591)-2313326',NULL,NULL,'','','Brass House India offers a diverse range of products under a single roof at the most competitive prices. We are a leading and renowned manufacturer and exporter of EPNS Ware, Brass Hardware, Wood Carvings, Nautical Gifts, Herbal Products, etc. We are an importer of the raw materials and scraps required for the manufacture of our products, from the markets of USA and Europe. Ever since our inception in 1990, there has been no looking back for us and we have crossed every hurdle with much ease. This has become possible due to the unalterable trust and tremendous support of our clients. It is due to their satisfaction, that we have grown from strength to strength. We are known for our authentic trade practices and regular introduction of innovative and improved products',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(28,'Bridal Kundan',NULL,NULL,NULL,'Mumbai, Maharashtra','Mumbai','Maharashtra','',NULL,NULL,'','','Unique Heavy Kundan Sets for Bridal wear.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(29,'Bubu\'s Fashion',NULL,NULL,NULL,'tirupur, Tamil Nadu','Tirupur','Tamil Nadu','',NULL,NULL,'','','We are expertised in quilled jewellery(Paper jewellery) and other quileed products. We can even provide quiled jewellery based on the buyers requirements and color. These jewellery are light-weighted and eco-friendly.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(30,'Buddha Marble Arts',NULL,NULL,NULL,'S-1, Shri Ram Apartment,\nGandhipath\nVaishali Nagar, Jaipur (Rajasthan)','Jaipur','Rajasthan','91-9829139946',NULL,NULL,'info@buddhamarblearts.com','www.buddhamarblearts.com','Buddha marble art is a Jaipur, India based manufacturing and trading company dealing in buddha statues of marble, stone, marble garden decoration marble architecture, animals, carving, pots etc. We are committed to customer satisfaction and strive for premium quality products and services, competitive prices and on-schedule delivery.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(31,'buddhaa electrified',NULL,NULL,NULL,'Delhi, New Delhi','Delhi','New Delhi','',NULL,NULL,' buddhaaelectrified@gmail.com','','Sailing through the hustle bustle of Dilli 6, the inner soul finds its spark and connects with the vibrancy beyond, giving way to the buddhaa within and an idea born. \"buddhaa electrified\" - a feeling of freedom and hope from within the constraints of society carves its way into this world. \"be\" fuels our sense of belief for value added designing and also our novelty factor is that every product is uniquely handcrafted. Buddhaa Electrified ... \"be\" mad about: SAREES QUIRKY JEWELRY KEY CHAINS',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(32,'Bulbul',NULL,NULL,NULL,'Meerut, Uttar Pradesh\n','Meerut','Uttar Pradesh','',NULL,NULL,'','','Hand-made woolen sweaters, cardigans, caps, mufflers, gloves, bottle-covers, wrap-arounds for infants and babies in the age-group 0-12 months. Completely Indian and inspired by the true class offered by our daadis and naanis!',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1),(33,'Butterfly Handicraft',NULL,NULL,NULL,'Thane, Maharashtra','Thane','Maharashtra','',NULL,NULL,'','','We are specialist in making paper flowers and other craft items.',NULL,NULL,NULL,NULL,NULL,NULL,'','','2013-08-15','2013-08-15',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_company_subcategory`
--

LOCK TABLES `website_company_subcategory` WRITE;
/*!40000 ALTER TABLE `website_company_subcategory` DISABLE KEYS */;
INSERT INTO `website_company_subcategory` VALUES (1,1,38),(2,1,47),(3,2,25),(4,2,47),(5,3,38),(6,3,40),(7,3,47),(8,4,38),(9,4,47),(10,5,47),(12,6,24),(11,6,25),(13,6,47),(14,7,26),(15,7,47),(16,8,47),(17,9,40),(18,9,47),(20,10,12),(24,10,27),(21,10,33),(22,10,38),(23,10,40),(19,10,43),(25,10,47),(26,11,47),(27,12,38),(28,12,47),(29,12,48),(30,12,58),(31,13,47),(32,14,47),(33,15,25),(34,15,47),(35,16,38),(36,16,40),(37,16,47),(38,17,47),(39,18,40),(40,18,47),(41,19,38),(42,19,47),(43,20,11),(44,20,12),(46,20,33),(47,20,35),(45,20,37),(48,20,50),(49,21,38),(50,21,40),(51,21,47),(52,22,47),(53,23,38),(54,23,47),(55,24,40),(56,24,47),(57,25,38),(58,25,47),(59,26,47),(60,27,25),(61,27,47),(63,28,38),(62,28,40),(64,28,47),(65,29,47),(66,30,25),(67,30,47),(68,30,52),(69,31,47),(70,32,29),(71,32,47),(72,33,26),(73,33,47);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_subcategory`
--

LOCK TABLES `website_subcategory` WRITE;
/*!40000 ALTER TABLE `website_subcategory` DISABLE KEYS */;
INSERT INTO `website_subcategory` VALUES (1,'BIOGAS PLANT','2013-08-15 00:24:36',0,1),(2,'BIOMASS AND BIOFUEL','2013-08-15 00:24:36',0,1),(3,'ENERGY STORAGE','2013-08-15 00:24:36',0,1),(4,'LED POWER PRODUCTS','2013-08-15 00:24:37',0,1),(5,'RENEWABLE ENERGY','2013-08-15 00:24:37',0,1),(6,'SOLAR ENERGY','2013-08-15 00:24:37',0,1),(7,'SOLAR PARKS','2013-08-15 00:24:37',0,1),(8,'WIND ENERGY','2013-08-15 00:24:37',0,1),(9,'WIND FARMS','2013-08-15 00:24:37',0,1),(10,'AROMATHERAPY PRODUCTS','2013-08-15 00:24:37',0,1),(11,'AYURVEDIC PRODUCTS','2013-08-15 00:24:37',0,1),(12,'HERBAL PRODUCTS','2013-08-15 00:24:37',0,1),(13,'NATURAL PRODUCTS','2013-08-15 00:24:37',0,1),(14,'ENVIRONMENT SERVICES','2013-08-15 00:24:38',0,1),(15,'ENVIRONMENTAL PRODUCTS','2013-08-15 00:24:38',0,1),(16,'POLLUTION CONTROL EQUIPMENT','2013-08-15 00:24:38',0,1),(17,'RECYCLING','2013-08-15 00:24:38',0,1),(18,'WASTE MANAGEMENT','2013-08-15 00:24:38',0,1),(19,'WATER TREATMENT SYSTEM','2013-08-15 00:24:38',0,1),(20,'BAMBOO CRAFT','2013-08-15 00:24:38',0,1),(21,'BEAD CRAFT','2013-08-15 00:24:38',0,1),(22,'EARTHENWARE PRODUCTS','2013-08-15 00:24:38',0,1),(23,'GIFT ITEMS','2013-08-15 00:24:38',0,1),(24,'JEWELLERY ACCESSORIES','2013-08-15 00:24:38',0,1),(25,'PAINTINGS AND SCULPTURES','2013-08-15 00:24:39',0,1),(26,'PAPER CRAFT','2013-08-15 00:24:39',0,1),(27,'RELIGIOUS AND FESTIVITY CRAFTS','2013-08-15 00:24:39',0,1),(28,'WROUGHT IRON CRAFT','2013-08-15 00:24:39',0,1),(29,'BABY CARE PRODUCTS','2013-08-15 00:24:39',0,1),(30,'BATH PRODUCTS','2013-08-15 00:24:39',0,1),(31,'BODYCARE PRODUCTS','2013-08-15 00:24:39',0,1),(32,'COSMETIC AND MAKE-UP','2013-08-15 00:24:39',0,1),(33,'HAIRCARE PRODUCTS','2013-08-15 00:24:39',0,1),(34,'HOMECARE PRODUCTS','2013-08-15 00:24:39',0,1),(35,'MEDICARE PRODUCTS','2013-08-15 00:24:39',0,1),(36,'PETCARE PRODUCTS','2013-08-15 00:24:40',0,1),(37,'SKINCARE PRODUCTS','2013-08-15 00:24:40',0,1),(38,'BEADED JEWELLERY','2013-08-15 00:24:40',0,1),(39,'ECO APPARELS','2013-08-15 00:24:40',0,1),(40,'ETHNIC AND REGIONAL JEWELLERY','2013-08-15 00:24:40',0,1),(41,'FASHION JEWELERY','2013-08-15 00:24:40',0,1),(42,'AUTOMOBILES','2013-08-15 00:24:40',0,1),(43,'AYURVEDA AND HERBAL','2013-08-15 00:24:40',0,1),(44,'BUSINESS SERVICES','2013-08-15 00:24:40',0,1),(45,'ENERGY AND POWER','2013-08-15 00:24:41',0,1),(46,'ENVIRONMENT','2013-08-15 00:24:41',0,1),(47,'HANDICRAFTS','2013-08-15 00:24:41',0,1),(48,'JUTE INDUSTRY','2013-08-15 00:24:41',0,1),(49,'KHADI INDUSTRY','2013-08-15 00:24:41',0,1),(50,'ORGANIC INDUSTRY','2013-08-15 00:24:41',0,1),(51,'PACKAGING AND PAPER INDUSTRY','2013-08-15 00:24:41',0,1),(52,'GREEN BUILDING SUPPLIES','2013-08-15 00:24:41',0,1),(53,'REAL ESTATE','2013-08-15 00:24:41',0,1),(54,'EDUCATION','2013-08-15 00:24:41',0,1),(55,'NATURAL FOOD OUTLETS','2013-08-15 00:24:41',0,1),(56,'PERSONALCARE','2013-08-15 00:24:42',0,1),(57,'RELIGION AND FESTIVAL','2013-08-15 00:24:42',0,1),(58,'SHOPPING','2013-08-15 00:24:42',0,1),(59,'TRANSPORTATION','2013-08-15 00:24:42',0,1),(60,'TRAVEL','2013-08-15 00:24:42',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_subcategory_category`
--

LOCK TABLES `website_subcategory_category` WRITE;
/*!40000 ALTER TABLE `website_subcategory_category` DISABLE KEYS */;
INSERT INTO `website_subcategory_category` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,4),(21,21,4),(22,22,4),(23,23,4),(24,24,4),(25,25,4),(26,26,4),(27,27,4),(28,28,4),(29,29,5),(30,30,5),(31,31,5),(32,32,5),(33,33,5),(34,34,5),(35,35,5),(36,36,5),(37,37,5),(38,38,6),(39,39,6),(40,40,6),(41,41,6),(42,42,8),(43,43,8),(44,44,8),(45,45,8),(46,46,8),(47,47,8),(48,48,8),(49,49,8),(50,50,8),(51,51,8),(52,52,9),(53,53,9),(54,54,10),(55,55,10),(56,56,10),(57,57,10),(58,58,10),(59,59,10),(60,60,10);
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

-- Dump completed on 2013-08-15 12:29:10
