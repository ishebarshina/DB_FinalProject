-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: ozon
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Current Database: `ozon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ozon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ozon`;

--
-- Table structure for table `cashback_ozon_card`
--

DROP TABLE IF EXISTS `cashback_ozon_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashback_ozon_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_cb_catalog_id` int unsigned NOT NULL,
  `cashback` float DEFAULT '0.05' COMMENT 'Величина кешбэка от 0.0 до 1.0',
  PRIMARY KEY (`id`),
  KEY `fk_cb_catalog_id` (`fk_cb_catalog_id`),
  CONSTRAINT `cashback_ozon_card_ibfk_1` FOREIGN KEY (`fk_cb_catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_ozon_card`
--

LOCK TABLES `cashback_ozon_card` WRITE;
/*!40000 ALTER TABLE `cashback_ozon_card` DISABLE KEYS */;
INSERT INTO `cashback_ozon_card` VALUES (1,11,0.25554),(2,4,0.206),(3,8,0.113024),(4,9,0),(5,2,0.104919),(6,9,0.161),(7,10,0.22598),(8,10,0.07),(9,15,0),(10,14,0.225);
/*!40000 ALTER TABLE `cashback_ozon_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'blanditiis'),(2,'voluptas'),(3,'officiis'),(4,'maxime'),(5,'autem'),(6,'minus'),(7,'beatae'),(8,'inventore'),(9,'tenetur'),(10,'magnam'),(11,'sint'),(12,'explicabo'),(13,'occaecati'),(14,'ratione'),(15,'voluptatem');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (7,'Chelyabinsk'),(6,'Kazan'),(12,'Krasnoyarsk'),(1,'Moscow'),(5,'Nizhniy Novgorod'),(3,'Novosibirsk'),(8,'Omsk'),(13,'Perm'),(10,'Rostov'),(2,'Saint Petersburg'),(9,'Samara'),(11,'Ufa'),(15,'Volgograd'),(14,'Voronezh'),(4,'Yekaterinburg');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_d_user_id` bigint unsigned DEFAULT NULL,
  `fk_d_product_id` int unsigned DEFAULT NULL,
  `discount` float DEFAULT '0' COMMENT 'Величина скидки от 0.0 до 1.0',
  `only_ozon_card` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_d_user_id` (`fk_d_user_id`),
  KEY `fk_d_product_id` (`fk_d_product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`fk_d_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_ibfk_2` FOREIGN KEY (`fk_d_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `discout_percent` CHECK (((`discount` >= 0.0) and (`discount` < 1.0))),
  CONSTRAINT `discout_user_product` CHECK (((`fk_d_user_id` is not null) or (`fk_d_product_id` is not null)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,3,0.5,'1'),(2,3,8,0.4,'0'),(3,5,9,0.3,'0'),(4,7,NULL,0.2,'1'),(5,NULL,3,0.1,'1');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_discounts` BEFORE INSERT ON `discounts` FOR EACH ROW BEGIN 
	IF (NEW.fk_d_user_id IS NULL AND NEW.fk_d_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- insert discounts trigger';
	END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_discounts` BEFORE UPDATE ON `discounts` FOR EACH ROW BEGIN 
	IF (NEW.fk_d_user_id IS NULL AND NEW.fk_d_product_id IS NULL) 
		THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'both fields IS NULL -- update discounts trigger';
	END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_fv_user_id` bigint unsigned NOT NULL,
  `fk_fv_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_fv_product_id` (`fk_fv_product_id`),
  KEY `fk_fv_user_id` (`fk_fv_user_id`),
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`fk_fv_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`fk_fv_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (1,40,55),(2,34,25),(3,32,74),(4,22,54),(5,22,2),(6,42,98),(7,56,4),(8,56,41),(9,52,16),(10,57,88),(11,45,84),(12,38,2),(13,54,15),(14,24,52),(15,59,72),(16,56,27),(17,43,9),(18,26,90),(19,59,83),(20,30,39),(21,20,43),(22,59,32),(23,60,7),(24,37,18),(25,30,78),(26,24,47),(27,35,70),(28,35,24),(29,60,39),(30,46,37),(31,58,90),(32,28,49),(33,40,2),(34,20,77),(35,60,62),(36,24,18),(37,50,81),(38,22,78),(39,44,6),(40,36,82),(41,25,96),(42,45,72),(43,41,38),(44,54,95),(45,32,92),(46,31,69),(47,27,31),(48,51,92),(49,41,67),(50,40,89),(51,58,47),(52,47,58),(53,55,84),(54,55,41),(55,41,55),(56,43,99),(57,28,25),(58,23,17),(59,35,14),(60,28,30),(61,39,78),(62,26,54),(63,39,96),(64,22,24),(65,51,22),(66,36,85),(67,58,52),(68,42,52),(69,22,85),(70,50,33),(71,42,95),(72,26,36),(73,60,76),(74,46,56),(75,60,69),(76,37,22),(77,50,57),(78,45,29),(79,30,94),(80,60,43),(81,40,64),(82,24,81),(83,60,68),(84,46,15),(85,46,54),(86,24,8),(87,38,69),(88,41,99),(89,49,5),(90,43,37),(91,28,81),(92,58,75),(93,41,38),(94,54,26),(95,23,28),(96,39,84),(97,21,82),(98,22,19),(99,45,65),(100,56,62);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_o_user_id` bigint unsigned NOT NULL,
  `payment_type` enum('ozon_card','other_card') DEFAULT NULL,
  `delivery_address` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_o_user_id` (`fk_o_user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_o_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,52,'ozon_card','quidem'),(2,49,'other_card','sunt'),(3,49,'other_card','quod'),(4,62,'ozon_card','hic'),(5,81,'other_card','sapiente'),(6,4,'ozon_card','soluta'),(7,93,'ozon_card','neque'),(8,63,'other_card','id'),(9,80,'ozon_card','quas'),(10,55,'ozon_card','quas'),(11,68,'other_card','aut'),(12,34,'other_card','amet'),(13,43,'other_card','similique'),(14,41,'other_card','qui'),(15,39,'ozon_card','necessitatibus'),(16,13,'other_card','magni'),(17,88,'ozon_card','et'),(18,61,'ozon_card','aut'),(19,62,'other_card','voluptas'),(20,19,'ozon_card','consequuntur'),(21,37,'ozon_card','et'),(22,85,'other_card','sapiente'),(23,32,'other_card','qui'),(24,92,'ozon_card','quia'),(25,68,'ozon_card','saepe'),(26,40,'ozon_card','ab'),(27,45,'ozon_card','odio'),(28,59,'other_card','voluptas'),(29,29,'other_card','pariatur'),(30,54,'other_card','enim'),(31,46,'ozon_card','est'),(32,42,'ozon_card','non'),(33,61,'other_card','unde'),(34,33,'ozon_card','dolorum'),(35,3,'other_card','quia'),(36,48,'ozon_card','culpa'),(37,77,'other_card','dolore'),(38,15,'ozon_card','possimus'),(39,98,'ozon_card','dolorem'),(40,38,'other_card','assumenda'),(41,43,'ozon_card','perspiciatis'),(42,37,'ozon_card','blanditiis'),(43,24,'other_card','alias'),(44,75,'ozon_card','voluptas'),(45,74,'ozon_card','hic'),(46,9,'other_card','non'),(47,24,'ozon_card','sunt'),(48,86,'ozon_card','magni'),(49,27,'other_card','impedit'),(50,81,'other_card','cum'),(51,80,'ozon_card','deserunt'),(52,85,'other_card','accusantium'),(53,11,'other_card','facilis'),(54,77,'other_card','aut'),(55,70,'ozon_card','temporibus'),(56,36,'other_card','consequuntur'),(57,4,'other_card','quisquam'),(58,14,'other_card','voluptas'),(59,87,'ozon_card','tenetur'),(60,94,'ozon_card','eum'),(61,52,'other_card','autem'),(62,85,'other_card','quisquam'),(63,61,'ozon_card','atque'),(64,18,'ozon_card','vel'),(65,46,'ozon_card','accusantium'),(66,84,'ozon_card','eum'),(67,71,'ozon_card','culpa'),(68,60,'other_card','necessitatibus'),(69,48,'ozon_card','magni'),(70,80,'other_card','tempora'),(71,18,'other_card','facilis'),(72,27,'other_card','eaque'),(73,2,'other_card','aperiam'),(74,9,'ozon_card','qui'),(75,11,'other_card','inventore'),(76,34,'ozon_card','repellendus'),(77,15,'ozon_card','id'),(78,30,'ozon_card','qui'),(79,88,'ozon_card','sequi'),(80,20,'other_card','officiis'),(81,86,'other_card','voluptas'),(82,87,'other_card','aut'),(83,81,'ozon_card','rerum'),(84,78,'ozon_card','est'),(85,17,'other_card','laudantium'),(86,83,'other_card','laboriosam'),(87,40,'ozon_card','sit'),(88,85,'ozon_card','ipsum'),(89,90,'other_card','voluptatem'),(90,37,'ozon_card','et'),(91,41,'ozon_card','omnis'),(92,80,'ozon_card','nisi'),(93,30,'ozon_card','quod'),(94,38,'ozon_card','possimus'),(95,33,'ozon_card','libero'),(96,94,'ozon_card','earum'),(97,68,'ozon_card','minus'),(98,85,'other_card','rerum'),(99,85,'ozon_card','fuga'),(100,28,'other_card','consequatur');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_opd_order_id` bigint unsigned NOT NULL,
  `fk_opd_product_id` int unsigned NOT NULL,
  `total` int unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_opd_order_id` (`fk_opd_order_id`),
  KEY `fk_opd_product_id` (`fk_opd_product_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`fk_opd_order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`fk_opd_product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,7,29,3),(2,4,60,3),(3,14,17,9),(4,47,2,4),(5,4,2,1),(6,52,27,6),(7,92,26,3),(8,52,57,1),(9,85,36,3),(10,85,51,2),(11,87,22,4),(12,84,46,1),(13,47,59,1),(14,51,95,7),(15,14,90,4),(16,9,68,4),(17,35,79,3),(18,84,76,1),(19,89,42,4),(20,83,4,6),(21,76,11,5),(22,98,91,9),(23,35,85,8),(24,10,9,3),(25,37,66,8),(26,60,78,7),(27,9,72,3),(28,75,94,2),(29,16,76,1),(30,41,17,4),(31,47,95,1),(32,28,45,9),(33,79,87,1),(34,24,76,6),(35,87,33,1),(36,34,32,6),(37,71,42,6),(38,78,55,7),(39,1,67,8),(40,43,2,3),(41,22,9,3),(42,85,60,5),(43,97,40,1),(44,85,64,8),(45,24,55,6),(46,85,82,5),(47,22,88,2),(48,48,72,5),(49,55,37,6),(50,27,24,4),(51,4,95,6),(52,1,42,3),(53,66,46,4),(54,76,14,4),(55,75,69,9),(56,1,19,8),(57,93,70,2),(58,97,71,2),(59,31,18,4),(60,60,17,3),(61,44,93,1),(62,74,65,6),(63,89,83,5),(64,77,86,3),(65,26,66,8),(66,76,67,6),(67,95,46,8),(68,71,60,7),(69,71,13,2),(70,80,93,9),(71,72,84,3),(72,87,23,5),(73,91,77,8),(74,66,81,8),(75,18,99,9),(76,18,47,4),(77,78,66,4),(78,2,12,3),(79,89,91,7),(80,88,79,8),(81,57,33,2),(82,97,63,4),(83,81,14,4),(84,4,75,1),(85,98,20,5),(86,16,74,5),(87,9,14,3),(88,73,98,7),(89,64,60,3),(90,41,62,1),(91,47,7,1),(92,65,65,1),(93,19,77,4),(94,94,94,8),(95,59,39,1),(96,4,45,9),(97,9,99,7),(98,96,42,9),(99,10,79,4),(100,57,91,1),(101,15,8,9),(102,65,69,3),(103,100,90,9),(104,15,92,7),(105,22,18,8),(106,33,45,2),(107,79,96,2),(108,52,92,7),(109,32,81,2),(110,19,97,4),(111,22,82,9),(112,79,78,5),(113,86,40,7),(114,22,20,9),(115,77,35,6),(116,67,50,2),(117,40,52,2),(118,75,80,9),(119,53,36,7),(120,91,23,4),(121,1,60,1),(122,72,93,2),(123,2,99,4),(124,90,18,7),(125,55,45,6),(126,41,40,3),(127,14,98,1),(128,88,56,7),(129,38,39,7),(130,56,57,7),(131,100,70,9),(132,97,10,7),(133,84,45,8),(134,38,91,2),(135,23,97,3),(136,73,97,2),(137,61,41,7),(138,6,24,3),(139,3,6,6),(140,48,54,2),(141,40,58,7),(142,62,24,3),(143,100,57,8),(144,57,88,5),(145,15,62,5),(146,45,67,1),(147,30,54,6),(148,72,50,3),(149,25,23,5),(150,56,76,7);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ozon_cards`
--

DROP TABLE IF EXISTS `ozon_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ozon_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_oc_user_id` bigint unsigned NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `CVV` varchar(3) NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `points` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `fk_oc_user_id` (`fk_oc_user_id`),
  UNIQUE KEY `card_number` (`card_number`),
  CONSTRAINT `ozon_cards_ibfk_1` FOREIGN KEY (`fk_oc_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ozon_card_number` CHECK (regexp_like(`card_number`,_utf8mb4'^[0-9]{16}$')),
  CONSTRAINT `ozon_CVV` CHECK (regexp_like(`CVV`,_utf8mb4'^[0-9]{3}$'))
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ozon_cards`
--

LOCK TABLES `ozon_cards` WRITE;
/*!40000 ALTER TABLE `ozon_cards` DISABLE KEYS */;
INSERT INTO `ozon_cards` VALUES (1,5,'4225811689091200','526',612.29,53.45),(2,6,'6544783795575274','569',373.84,183.70),(3,7,'3485350960929933','339',703.50,480.39),(4,8,'7737874715287396','439',1514.80,326.53),(5,9,'9936105614663166','143',1036.38,223.34),(6,10,'7108148731081079','406',1361.10,189.25),(7,11,'8657206913758665','220',230.49,86.88),(8,12,'5707184691093013','473',808.22,387.69),(9,13,'6980996899019606','832',405.01,284.75),(10,14,'3159542376362917','866',1249.38,282.56),(11,15,'9562156151141888','209',630.34,104.49),(12,16,'1894882814656839','179',996.62,112.32),(13,17,'6653520650728742','948',281.05,434.79),(14,18,'9335120340096436','115',547.77,158.87),(15,19,'7902893719799083','248',257.70,75.05),(16,20,'4274432377906987','156',635.86,200.65),(17,21,'1473153422525656','252',592.00,485.53),(18,22,'9704930874288216','878',1853.73,17.40),(19,23,'4539876121901666','974',1288.05,150.24),(20,24,'6132954913534116','651',60.18,154.50),(21,25,'5092411943198240','923',334.53,43.87),(22,26,'9431479136632940','271',611.57,478.63),(23,27,'8819525378114295','603',1407.97,419.16),(24,28,'1716894925993149','694',1175.26,477.83),(25,29,'1138289110404525','950',1106.18,464.17),(26,30,'9840214371901524','304',1928.23,68.60),(27,31,'8142600946234085','555',1009.96,2.33),(28,32,'5574574820209856','621',1900.04,4.29),(29,33,'2735944620277798','490',1812.53,113.89),(30,34,'4780475484328897','918',1839.67,433.76),(31,35,'6202359173506977','283',55.62,263.40),(32,36,'5954255329025849','154',1369.59,121.56),(33,37,'2451169291063459','696',1000.35,254.43),(34,38,'1393722839636132','876',1213.55,221.63),(35,39,'4563685115694292','674',197.64,288.13),(36,40,'6263275930065755','975',562.79,243.44),(37,41,'6311541271279404','663',662.23,387.96),(38,42,'8975193187269842','403',1478.27,341.72),(39,43,'2797953522878829','927',1987.52,103.28),(40,44,'1463673913113335','274',381.99,186.60),(41,45,'3637410986372861','539',1642.21,320.22),(42,46,'7649795668389321','708',1221.67,11.64),(43,47,'3555414790744931','542',304.11,141.35),(44,48,'9614944583833581','974',6.57,49.08),(45,49,'5328199319832935','772',185.64,110.61),(46,50,'8448527190121251','521',519.74,446.51),(47,51,'7168773571732659','876',1534.57,122.06),(48,52,'9267874959482491','261',797.67,228.24),(49,53,'1772154013821290','130',147.01,132.64),(50,54,'1952760041485938','724',1651.56,22.79),(51,55,'7754654584633681','101',232.54,287.58),(52,56,'5742918597001948','663',1634.87,103.45),(53,57,'6238361173376858','227',1515.30,180.92),(54,58,'5825636143301568','284',1678.37,289.30),(55,59,'4379227462355355','706',1842.02,290.63),(56,60,'2289975148953221','941',1875.92,441.32),(57,61,'6393413695047113','605',1542.68,85.49),(58,62,'5866272140041858','527',180.35,12.58),(59,63,'8696280649426294','663',742.17,486.90),(60,64,'7801871611795744','618',599.35,384.81),(61,65,'9540492740154293','841',52.16,327.97),(62,66,'2812135463338605','502',1406.05,86.04),(63,67,'7760316195211130','308',226.87,436.53),(64,68,'1225555350937806','474',1632.61,415.17),(65,69,'7324120610569662','813',165.21,15.41),(66,70,'9155494952811559','894',461.13,251.31),(67,71,'8391639257858751','739',1945.93,365.30),(68,72,'7606530727195674','121',1121.64,366.33),(69,73,'9826735562968418','419',613.36,232.77),(70,74,'4668677598741045','160',638.87,198.21),(71,75,'1214936661941870','776',941.81,48.91);
/*!40000 ALTER TABLE `ozon_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_cards`
--

DROP TABLE IF EXISTS `payment_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `card_number` varchar(16) NOT NULL,
  `CVV` varchar(3) NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `card_number` CHECK (regexp_like(`card_number`,_utf8mb4'^[0-9]{16}$')),
  CONSTRAINT `CVV` CHECK (regexp_like(`CVV`,_utf8mb4'^[0-9]{3}$'))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_cards`
--

LOCK TABLES `payment_cards` WRITE;
/*!40000 ALTER TABLE `payment_cards` DISABLE KEYS */;
INSERT INTO `payment_cards` VALUES (1,'7076708872137800','428',847.04),(2,'7021783671227099','216',704.47),(3,'7370779678747983','366',1057.23),(4,'7752718276507707','626',1614.61),(5,'7277796770077131','673',1586.76),(6,'7053788572707696','702',526.35),(7,'7303772877347489','319',1500.55),(8,'7018784271577261','851',786.33),(9,'7457711171837582','425',128.73),(10,'7234797871947035','633',1715.56),(11,'7509797673587859','303',1099.99),(12,'7070770373097435','324',1877.89),(13,'7946791777487992','746',1228.05),(14,'7912772478827244','614',250.51),(15,'7909717771577255','823',515.99),(16,'7873759873737068','301',1826.49),(17,'7893773079747681','535',749.29),(18,'7420797876347238','359',1452.06),(19,'7763764279227686','698',533.99),(20,'7337788774287477','194',180.70),(21,'7136741176517022','241',1434.58),(22,'7115742477797625','808',128.09),(23,'7954758370537514','473',1060.12),(24,'7404743679667525','753',113.37),(25,'7103734674227075','197',634.39),(26,'7259734579517720','776',1192.46),(27,'7723783279937469','432',873.70),(28,'7075706671057326','386',1227.48),(29,'7112771872607146','955',637.49),(30,'7737773174487049','907',688.10),(31,'7025709373907673','277',1926.30),(32,'7224723575037813','600',684.67),(33,'7041717877687312','327',653.50),(34,'7874739673597608','967',1993.79),(35,'7089745870257747','700',186.13),(36,'7461703077667742','471',1677.78),(37,'7953725374047265','201',1535.35),(38,'7498719474727781','542',225.27),(39,'7087710072397896','790',295.97),(40,'7435773373627610','970',17.66),(41,'7138766579167585','261',282.38),(42,'7165740475297431','612',1108.53),(43,'7061764470427275','327',873.07),(44,'7423780877737445','912',363.98),(45,'7198744776447879','518',1374.85),(46,'7040713975787472','666',1466.15),(47,'7772766770217104','509',1925.56),(48,'7448735474297083','213',767.45),(49,'7538754170957848','965',530.96),(50,'7438739576637134','709',1978.09),(51,'7909758171827167','358',1867.01),(52,'7805723177397005','825',33.42),(53,'7662726773497943','704',1061.11),(54,'7633758070007259','367',1413.27),(55,'7641708975197332','194',1050.87),(56,'7312798579927008','156',573.40),(57,'7245737071137457','951',729.67),(58,'7980781071137133','393',465.89),(59,'7184722475697175','249',610.43),(60,'7027722270287477','371',157.05),(61,'7484719074987921','204',1628.44),(62,'7720716476597804','140',1617.74),(63,'7909712478917086','781',1061.38),(64,'7378730073677934','618',152.53),(65,'7650702571767806','554',213.31),(66,'7015775977507477','221',480.65),(67,'7796726579347879','635',670.26),(68,'7889744575567448','616',1052.81),(69,'7906795770687466','216',494.38),(70,'7846749479317176','179',1822.92),(71,'7291772377437549','564',1870.66),(72,'7125782077297186','769',325.50),(73,'7578740873037295','608',1886.81),(74,'7018726272587502','765',384.67),(75,'7740712674127681','256',1648.74),(76,'7598751978057468','932',447.24),(77,'7339702971277546','419',270.32),(78,'7608764073787970','748',1383.29),(79,'7293739470917273','184',1297.08),(80,'7959785774117480','253',821.15),(81,'7540747077347260','190',1441.21),(82,'7300734078007984','571',1330.71),(83,'7752776875867627','440',19.55),(84,'7911753279277041','479',1972.21),(85,'7663736478287051','792',1395.46),(86,'7177779274337791','691',1829.86),(87,'7598725274647567','499',1031.44),(88,'7246768676957418','105',1548.43),(89,'7851793871387875','967',388.68),(90,'7077780678007585','573',1749.90),(91,'7793734773547730','632',1535.71),(92,'7061700678457211','567',1932.45),(93,'7269745174497891','200',1767.91),(94,'7083776475757582','270',397.40),(95,'7423752373487172','833',1122.21),(96,'7357710774627993','621',1841.10),(97,'7860754271327033','793',1507.06),(98,'7454701377017470','324',1672.82),(99,'7431764879507808','270',1047.57),(100,'7048767172167065','710',399.64);
/*!40000 ALTER TABLE `payment_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fk_pd_catalog_id` int unsigned NOT NULL,
  `desription` text,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pd_catalog_id` (`fk_pd_catalog_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_pd_catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'voluptas',1,'Commodi voluptatum placeat repellendus.',NULL),(2,'ut',2,'Sed consectetur exercitationem aut debitis sunt ut ut et.',NULL),(3,'explicabo',3,'Asperiores corporis quis ut qui odio est quia voluptas.',NULL),(4,'odio',4,'Id tempore occaecati provident sint ut voluptatem.',NULL),(5,'vero',5,'Quibusdam at eveniet neque.',NULL),(6,'est',6,'Minus dolores voluptatem nam ipsam quasi.',NULL),(7,'in',7,'Delectus consequuntur a dicta qui molestias velit modi.',NULL),(8,'est',8,'Adipisci debitis eaque dolore fugit ipsam sint et.',NULL),(9,'nulla',9,'Illo laboriosam ut assumenda molestiae possimus dignissimos.',NULL),(10,'enim',10,'Itaque sed vero quo eveniet eos laudantium consequatur molestiae.',NULL),(11,'consequatur',11,'Occaecati natus et labore explicabo quam fugiat rerum aperiam.',NULL),(12,'a',12,'Harum consequatur delectus dolores qui sunt deleniti.',NULL),(13,'rerum',13,'Nesciunt aliquam ut ab.',3.25),(14,'minus',14,'Ad ab veniam quia consequatur sint voluptatem aut rem.',2.5),(15,'et',15,'Quas facilis fuga doloremque maxime rerum voluptatum voluptatibus.',3),(16,'enim',1,'Cum aut eum hic odit.',2.6),(17,'officia',2,'Illum molestiae sunt non quos sed.',4),(18,'qui',3,'Vitae dolores omnis aut vero repellendus sint tempore quia.',3),(19,'voluptatum',4,'Assumenda non illum soluta est.',5),(20,'sit',5,'Ducimus beatae quis aut rerum voluptatem non asperiores doloremque.',2),(21,'corporis',6,'Minima nulla nemo necessitatibus ut est eaque.',3),(22,'enim',7,'Voluptatem id omnis aliquam ullam dolor sint.',4.33333),(23,'dolor',8,'Alias ducimus iste earum excepturi.',5),(24,'dolor',9,'Eligendi rerum ut neque eum in atque pariatur.',3),(25,'neque',10,'Vitae aut qui aliquam sint quae veritatis recusandae.',3.33333),(26,'delectus',11,'Optio fuga est fugiat optio repellendus et nemo.',3.5),(27,'rem',12,'Tempore tenetur ut libero explicabo sed suscipit.',2.66667),(28,'et',13,'Ut porro reiciendis dolorem voluptas ut iure.',3.5),(29,'eligendi',14,'Inventore a rerum dolore facilis aut impedit placeat.',2.75),(30,'consequuntur',15,'Nihil itaque aspernatur in facilis.',4),(31,'id',1,'Eligendi magnam architecto maxime.',3),(32,'aperiam',2,'Veritatis sed voluptas a.',2),(33,'odio',3,'In repellat nobis doloribus rem deserunt et.',NULL),(34,'facere',4,'Officia unde quae explicabo.',4),(35,'aut',5,'Dolorum vitae ut voluptatem nihil nobis rerum dolor.',3.8),(36,'omnis',6,'Ex saepe consequatur distinctio libero.',5),(37,'quia',7,'Labore qui quis quisquam voluptatem modi expedita omnis.',2),(38,'aut',8,'Voluptates a odit cum inventore eos explicabo.',2.66667),(39,'ab',9,'Eos facilis ut dignissimos laboriosam consequatur.',2.57143),(40,'ut',10,'Qui id omnis ex.',4.33333),(41,'voluptatem',11,'Nulla maxime error laudantium explicabo dignissimos delectus.',5),(42,'delectus',12,'Eos et ipsam nulla id.',3.5),(43,'architecto',13,'Nostrum animi non enim incidunt.',4),(44,'voluptas',14,'Ratione occaecati placeat error et consequatur.',1),(45,'corrupti',15,'Consequatur commodi distinctio repudiandae nulla vero non.',3.66667),(46,'mollitia',1,'Voluptatem deserunt in distinctio et unde voluptatem.',5),(47,'esse',2,'Repellendus omnis excepturi qui ut cupiditate sint.',5),(48,'necessitatibus',3,'Et enim voluptatem explicabo dolorem fuga.',2.25),(49,'dolor',4,'Dolore harum sit inventore ab ipsa dicta.',3.4),(50,'voluptatem',5,'Aut magni architecto voluptatem quia.',3.5),(51,'cupiditate',6,'Qui quis voluptatem suscipit natus qui cumque.',3),(52,'sed',7,'Dolores sint voluptatem aut voluptatem at eos.',2.5),(53,'atque',8,'Placeat id ullam et.',NULL),(54,'corporis',9,'Velit id cupiditate aspernatur eius.',NULL),(55,'occaecati',10,'Illo sed aspernatur occaecati optio laudantium.',NULL),(56,'quibusdam',11,'Est et tempore eligendi occaecati voluptate est.',NULL),(57,'ipsum',12,'Necessitatibus ducimus quia a accusamus.',NULL),(58,'minus',13,'Eos id necessitatibus sit amet maiores.',NULL),(59,'natus',14,'Quia amet voluptatem illo quod.',NULL),(60,'quaerat',15,'Maiores eligendi assumenda id sed architecto voluptatibus.',NULL),(61,'nihil',1,'Minus ut est quas molestiae qui commodi ut.',NULL),(62,'dolor',2,'Sed ea aut in quos et excepturi.',NULL),(63,'accusamus',3,'Aperiam temporibus nisi et sit laboriosam.',NULL),(64,'magni',4,'Non commodi necessitatibus magnam qui temporibus aut voluptas.',NULL),(65,'dolor',5,'Repellat tempora omnis voluptates aut quis magnam.',NULL),(66,'voluptatem',6,'Pariatur eligendi adipisci vitae delectus.',NULL),(67,'ad',7,'Necessitatibus ut quas est hic qui et vitae.',NULL),(68,'aperiam',8,'Nobis vero sapiente et cumque.',NULL),(69,'nesciunt',9,'Laudantium fugit iure perferendis inventore sed quaerat id nulla.',NULL),(70,'nulla',10,'Ut consequuntur recusandae dolorem temporibus.',NULL),(71,'qui',11,'Autem consequatur magnam quia soluta placeat quis.',NULL),(72,'dignissimos',12,'Aspernatur distinctio pariatur non accusantium.',NULL),(73,'id',13,'Nemo fugit quia incidunt.',NULL),(74,'ea',14,'Qui quis aut labore deserunt.',NULL),(75,'at',15,'Praesentium autem dolor ex aliquam dignissimos et.',NULL),(76,'nulla',1,'Voluptas molestiae illo cumque commodi omnis.',NULL),(77,'quaerat',2,'Accusamus aut esse voluptatibus quaerat illo blanditiis error.',NULL),(78,'amet',3,'Odio ipsum ut qui eveniet debitis delectus.',NULL),(79,'nulla',4,'Consequatur ex cumque maiores dolore.',NULL),(80,'dignissimos',5,'Ea eveniet eligendi quas a reprehenderit consequatur voluptatem.',NULL),(81,'libero',6,'Commodi suscipit reprehenderit optio aut praesentium rerum.',NULL),(82,'voluptatem',7,'Minima enim sed animi et et maxime sequi.',NULL),(83,'id',8,'Corrupti voluptas quasi sit laudantium corrupti.',NULL),(84,'veniam',9,'Dolor aut quasi temporibus est in delectus.',NULL),(85,'voluptatem',10,'Alias esse distinctio animi.',NULL),(86,'est',11,'Ratione dolore esse quis porro sunt sunt praesentium fugit.',NULL),(87,'qui',12,'Illo provident aut reiciendis labore sed.',NULL),(88,'et',13,'Nihil molestias mollitia rerum ut laudantium ex.',NULL),(89,'pariatur',14,'Corrupti quis aut voluptas nulla qui impedit.',NULL),(90,'sint',15,'Quos eum rerum ea ut temporibus quo.',NULL),(91,'velit',1,'Maiores officiis sed nostrum occaecati qui.',NULL),(92,'et',2,'Corrupti fuga eius quam rerum adipisci et eos.',NULL),(93,'eos',3,'Saepe perferendis placeat ratione impedit eos.',NULL),(94,'in',4,'Eaque accusamus dolor nam accusantium.',NULL),(95,'ipsa',5,'Sit ipsum incidunt expedita consequuntur officiis et quo.',NULL),(96,'quo',6,'Sit voluptates maiores id accusamus officia doloremque nemo aut.',NULL),(97,'eius',7,'Et non eum occaecati voluptatum.',NULL),(98,'blanditiis',8,'Vel provident similique at aliquam.',NULL),(99,'quia',9,'Nostrum placeat rerum et fuga.',NULL),(100,'aut',10,'Optio aut voluptatem dolorem omnis et.',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtcs_shops`
--

DROP TABLE IF EXISTS `produtcs_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtcs_shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_product_id` int unsigned NOT NULL,
  `fk_shop_id` int unsigned NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `total` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `ix_pd_shop` (`fk_product_id`,`fk_shop_id`),
  KEY `fk_shop_id` (`fk_shop_id`),
  CONSTRAINT `produtcs_shops_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produtcs_shops_ibfk_2` FOREIGN KEY (`fk_shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtcs_shops`
--

LOCK TABLES `produtcs_shops` WRITE;
/*!40000 ALTER TABLE `produtcs_shops` DISABLE KEYS */;
INSERT INTO `produtcs_shops` VALUES (1,1,1,561526.00,1),(2,2,2,79123312.96,6),(3,3,3,537048.00,7),(4,4,4,15.91,9),(5,5,5,18407058.25,1),(6,6,6,321324.57,0),(7,7,7,167360017.45,9),(8,8,8,135.14,1),(9,9,9,1248760.92,7),(10,10,10,5.32,7),(11,11,11,145158.39,6),(12,12,12,15705121.75,0),(13,13,13,266983833.81,9),(14,14,14,117426.79,1),(15,15,15,9203.28,6),(16,16,16,926.14,5),(17,17,17,785552.03,2),(18,18,18,273.13,2),(19,19,19,129298697.52,6),(20,20,20,337.00,9),(21,21,1,0.00,5),(22,22,2,782.73,4),(23,23,3,0.00,8),(24,24,4,6117.92,3),(25,25,5,288721682.71,5),(26,26,6,15422014.38,8),(27,27,7,0.00,0),(28,28,8,2036.88,5),(29,29,9,226322.86,0),(30,30,10,137994.34,3),(31,31,11,13121.89,5),(32,32,12,1.50,0),(33,33,13,4517.63,4),(34,34,14,6.78,8),(35,35,15,3.06,0),(36,36,16,23.52,0),(37,37,17,36256506.94,8),(38,38,18,0.00,2),(39,39,19,19293432.18,3),(40,40,20,497.49,6),(41,41,1,19176.70,5),(42,42,2,2177776.00,0),(43,43,3,2.97,8),(44,44,4,6.97,6),(45,45,5,1072082.41,4),(46,46,6,0.83,6),(47,47,7,22.59,5),(48,48,8,0.00,6),(49,49,9,9.00,5),(50,50,10,11310072.20,9),(51,51,11,11768057.39,5),(52,52,12,25.05,5),(53,53,13,0.00,9),(54,54,14,206553737.62,3),(55,55,15,652217.17,7),(56,56,16,36549403.28,3),(57,57,17,489751121.04,2),(58,58,18,60.34,4),(59,59,19,260042978.56,1),(60,60,20,0.90,1),(61,61,1,161.61,7),(62,62,2,2239.29,3),(63,63,3,48481.13,0),(64,64,4,805.51,9),(65,65,5,361816.91,7),(66,66,6,2185.97,4),(67,67,7,47246.35,5),(68,68,8,240326812.00,8),(69,69,9,62.83,7),(70,70,10,0.00,2),(71,71,11,14912.88,5),(72,72,12,1224.00,5),(73,73,13,0.00,6),(74,74,14,0.45,1),(75,75,15,649.09,1),(76,76,16,509.34,6),(77,77,17,572.14,3),(78,78,18,54.28,7),(79,79,19,374086.81,9),(80,80,20,218.91,7),(81,81,1,2.72,0),(82,82,2,46.32,1),(83,83,3,65049.03,4),(84,84,4,1720350.56,0),(85,85,5,6506307.97,2),(86,86,6,17685.95,5),(87,87,7,0.00,4),(88,88,8,2781829.67,2),(89,89,9,59.74,6),(90,90,10,4766.81,6),(91,91,11,7645.00,7),(92,92,12,422.17,9),(93,93,13,1.88,7),(94,94,14,0.00,9),(95,95,15,3550.00,2),(96,96,16,1319.45,9),(97,97,17,2828251.70,4),(98,98,18,4.10,3),(99,99,19,20644543.78,8),(100,100,20,0.77,7);
/*!40000 ALTER TABLE `produtcs_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_pf_user_id` bigint unsigned NOT NULL,
  `fk_pf_city_id` int unsigned DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `fk_pf_user_id` (`fk_pf_user_id`),
  KEY `ix_user_name` (`first_name`,`last_name`),
  KEY `fk_pf_city_id` (`fk_pf_city_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`fk_pf_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`fk_pf_city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,1,'Douglas','Bartell','Male','1981-02-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(2,2,1,'Roman','Vandervort','Male','1988-12-09','2021-08-03 09:13:22','2021-08-03 09:13:22'),(3,3,2,'Mckayla','Cremin','Male','1983-07-18','2021-08-03 09:13:22','2021-08-03 09:13:22'),(4,4,9,'Ethan','Lebsack','Male','1987-07-09','2021-08-03 09:13:22','2021-08-03 09:13:22'),(5,5,8,'Giovanny','West','Male','2011-06-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(6,6,13,'Billy','Mann','Male','1970-09-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(7,7,14,'Lavern','Considine','Male','2011-01-17','2021-08-03 09:13:22','2021-08-03 09:13:22'),(8,8,3,'Branson','Thompson','Male','2009-08-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(9,9,13,'Casey','Osinski','Male','1976-01-16','2021-08-03 09:13:22','2021-08-03 09:13:22'),(10,10,12,'Jerry','Labadie','Male','2006-01-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(11,11,6,'Jaleel','Murphy','Female','1976-07-04','2021-08-03 09:13:22','2021-08-03 09:13:22'),(12,12,11,'Maeve','Runolfsdottir','Male','1975-10-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(13,13,5,'Brenda','Dicki','Female','1985-03-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(14,14,7,'Jewell','Hoppe','Male','1976-08-04','2021-08-03 09:13:22','2021-08-03 09:13:22'),(15,15,7,'Wilton','Medhurst','Female','1970-12-21','2021-08-03 09:13:22','2021-08-03 09:13:22'),(16,16,13,'Kenyatta','Gleichner','Female','1977-08-02','2021-08-03 09:13:22','2021-08-03 09:13:22'),(17,17,2,'Douglas','Kessler','Female','2018-12-31','2021-08-03 09:13:22','2021-08-03 09:13:22'),(18,18,13,'Donavon','Rutherford','Male','2000-10-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(19,19,14,'Coy','Turcotte','Male','2012-01-20','2021-08-03 09:13:22','2021-08-03 09:13:22'),(20,20,5,'Eleazar','Rempel','Female','2020-05-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(21,21,11,'Frederick','Wisoky','Male','1986-11-08','2021-08-03 09:13:22','2021-08-03 09:13:22'),(22,22,10,'Kennith','Jenkins','Male','1989-03-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(23,23,2,'Benjamin','McCullough','Male','2001-10-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(24,24,7,'Vincenza','Bosco','Male','1975-02-24','2021-08-03 09:13:22','2021-08-03 09:13:22'),(25,25,14,'Nya','Kuvalis','Female','1974-11-26','2021-08-03 09:13:22','2021-08-03 09:13:22'),(26,26,9,'Idella','Von','Female','2014-10-17','2021-08-03 09:13:22','2021-08-03 09:13:22'),(27,27,3,'Rodger','Leannon','Female','1997-10-22','2021-08-03 09:13:22','2021-08-03 09:13:22'),(28,28,14,'Vivienne','Stanton','Female','1991-07-20','2021-08-03 09:13:22','2021-08-03 09:13:22'),(29,29,6,'Marilou','Balistreri','Male','2008-04-29','2021-08-03 09:13:22','2021-08-03 09:13:22'),(30,30,13,'Verna','McGlynn','Female','1991-09-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(31,31,6,'Deion','Torphy','Male','1982-07-04','2021-08-03 09:13:22','2021-08-03 09:13:22'),(32,32,6,'Louisa','Stiedemann','Male','2018-11-18','2021-08-03 09:13:22','2021-08-03 09:13:22'),(33,33,11,'Dan','Krajcik','Male','1972-12-01','2021-08-03 09:13:22','2021-08-03 09:13:22'),(34,34,6,'Margarette','Brakus','Male','2009-11-20','2021-08-03 09:13:22','2021-08-03 09:13:22'),(35,35,13,'Beverly','Cartwright','Female','1996-09-09','2021-08-03 09:13:22','2021-08-03 09:13:22'),(36,36,5,'Ardella','Lowe','Female','1994-05-05','2021-08-03 09:13:22','2021-08-03 09:13:22'),(37,37,14,'Royce','Fisher','Male','1974-11-02','2021-08-03 09:13:22','2021-08-03 09:13:22'),(38,38,11,'Pearlie','Homenick','Female','1974-03-17','2021-08-03 09:13:22','2021-08-03 09:13:22'),(39,39,12,'Tremayne','Grant','Male','2006-01-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(40,40,14,'Diamond','Breitenberg','Female','2014-05-25','2021-08-03 09:13:22','2021-08-03 09:13:22'),(41,41,3,'Milo','Okuneva','Male','2018-01-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(42,42,2,'Johanna','Metz','Male','1977-04-07','2021-08-03 09:13:22','2021-08-03 09:13:22'),(43,43,13,'Clovis','Schimmel','Female','2010-11-27','2021-08-03 09:13:22','2021-08-03 09:13:22'),(44,44,2,'Alycia','Stroman','Female','2020-04-02','2021-08-03 09:13:22','2021-08-03 09:13:22'),(45,45,12,'Mattie','Connelly','Female','1993-03-25','2021-08-03 09:13:22','2021-08-03 09:13:22'),(46,46,12,'Telly','Altenwerth','Male','1995-09-29','2021-08-03 09:13:22','2021-08-03 09:13:22'),(47,47,11,'Chasity','Kilback','Female','1999-01-12','2021-08-03 09:13:22','2021-08-03 09:13:22'),(48,48,2,'Josiane','Kutch','Female','2005-12-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(49,49,5,'Maryam','Murazik','Male','1999-12-18','2021-08-03 09:13:22','2021-08-03 09:13:22'),(50,50,4,'Lexus','Ryan','Male','2012-03-07','2021-08-03 09:13:22','2021-08-03 09:13:22'),(51,51,7,'Mabelle','Daugherty','Male','1981-06-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(52,52,8,'Robbie','McClure','Female','1987-04-03','2021-08-03 09:13:22','2021-08-03 09:13:22'),(53,53,6,'Jefferey','Schimmel','Female','2019-01-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(54,54,3,'Robb','Stokes','Male','2013-02-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(55,55,11,'Adolphus','Hermann','Female','2019-10-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(56,56,6,'Jamel','Legros','Female','1998-03-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(57,57,7,'Rosendo','Emmerich','Female','2002-12-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(58,58,3,'Cierra','Dare','Female','2011-03-15','2021-08-03 09:13:22','2021-08-03 09:13:22'),(59,59,9,'Van','Swaniawski','Male','1976-08-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(60,60,8,'Flavio','Stracke','Female','2016-06-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(61,61,14,'Muhammad','Wolf','Female','1995-07-01','2021-08-03 09:13:22','2021-08-03 09:13:22'),(62,62,1,'Timmothy','Nikolaus','Male','1971-03-10','2021-08-03 09:13:22','2021-08-03 09:13:22'),(63,63,5,'Liliana','Heathcote','Male','2001-09-26','2021-08-03 09:13:22','2021-08-03 09:13:22'),(64,64,9,'Jevon','McCullough','Male','2011-12-23','2021-08-03 09:13:22','2021-08-03 09:13:22'),(65,65,2,'German','Fadel','Female','1994-09-10','2021-08-03 09:13:22','2021-08-03 09:13:22'),(66,66,9,'Malvina','Schimmel','Female','1992-10-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(67,67,12,'Santina','Reynolds','Male','2009-10-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(68,68,5,'Loren','Kuvalis','Female','1997-12-25','2021-08-03 09:13:22','2021-08-03 09:13:22'),(69,69,2,'Isai','Little','Male','1979-02-24','2021-08-03 09:13:22','2021-08-03 09:13:22'),(70,70,9,'Euna','Ferry','Female','1971-10-27','2021-08-03 09:13:22','2021-08-03 09:13:22'),(71,71,10,'Yasmine','Ryan','Female','2008-11-29','2021-08-03 09:13:22','2021-08-03 09:13:22'),(72,72,9,'Fatima','Sauer','Male','2021-01-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(73,73,12,'Melvin','Torp','Male','2005-01-16','2021-08-03 09:13:22','2021-08-03 09:13:22'),(74,74,8,'Pedro','Connelly','Male','2000-01-31','2021-08-03 09:13:22','2021-08-03 09:13:22'),(75,75,14,'Meghan','Towne','Female','2017-09-26','2021-08-03 09:13:22','2021-08-03 09:13:22'),(76,76,7,'Ransom','Sawayn','Female','1997-01-03','2021-08-03 09:13:22','2021-08-03 09:13:22'),(77,77,5,'Tina','Crist','Female','2015-03-07','2021-08-03 09:13:22','2021-08-03 09:13:22'),(78,78,2,'Daniela','Heaney','Male','1992-01-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(79,79,8,'Telly','Blanda','Male','1994-12-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(80,80,5,'Leanne','Reilly','Female','1977-06-10','2021-08-03 09:13:22','2021-08-03 09:13:22'),(81,81,2,'Adrain','Wisoky','Male','2004-09-10','2021-08-03 09:13:22','2021-08-03 09:13:22'),(82,82,6,'Ilene','Collins','Female','2010-01-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(83,83,12,'Emily','Herman','Female','2003-08-24','2021-08-03 09:13:22','2021-08-03 09:13:22'),(84,84,1,'Paolo','Johnson','Male','2011-08-02','2021-08-03 09:13:22','2021-08-03 09:13:22'),(85,85,8,'Reva','Dibbert','Female','2021-02-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(86,86,7,'Sarai','Dach','Female','1971-04-21','2021-08-03 09:13:22','2021-08-03 09:13:22'),(87,87,13,'Celia','Considine','Female','1995-10-29','2021-08-03 09:13:22','2021-08-03 09:13:22'),(88,88,3,'Adrian','Cartwright','Male','1973-06-19','2021-08-03 09:13:22','2021-08-03 09:13:22'),(89,89,1,'Macie','Dooley','Male','1987-10-12','2021-08-03 09:13:22','2021-08-03 09:13:22'),(90,90,10,'Meta','Kiehn','Female','1976-03-13','2021-08-03 09:13:22','2021-08-03 09:13:22'),(91,91,4,'Elian','Bergstrom','Male','2000-05-16','2021-08-03 09:13:22','2021-08-03 09:13:22'),(92,92,4,'Viola','Kilback','Male','2021-03-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(93,93,8,'Adrain','Terry','Female','1979-06-08','2021-08-03 09:13:22','2021-08-03 09:13:22'),(94,94,13,'Jamel','Legros','Male','2018-06-03','2021-08-03 09:13:22','2021-08-03 09:13:22'),(95,95,13,'Emilie','Moen','Male','1981-11-06','2021-08-03 09:13:22','2021-08-03 09:13:22'),(96,96,11,'Helmer','Heathcote','Male','1979-09-11','2021-08-03 09:13:22','2021-08-03 09:13:22'),(97,97,3,'Alysha','D\'Amore','Male','1975-03-14','2021-08-03 09:13:22','2021-08-03 09:13:22'),(98,98,7,'Shawn','Kozey','Male','1994-11-18','2021-08-03 09:13:22','2021-08-03 09:13:22'),(99,99,13,'Armando','Feeney','Male','1971-06-05','2021-08-03 09:13:22','2021-08-03 09:13:22'),(100,100,1,'Stefan','Baumbach','Female','2014-11-23','2021-08-03 09:13:22','2021-08-03 09:13:22');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_rw_poducts_id` int unsigned NOT NULL,
  `fk_rw_user_id` bigint unsigned NOT NULL,
  `stars` tinyint NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_rw_poducts_id` (`fk_rw_poducts_id`),
  KEY `fk_rw_user_id` (`fk_rw_user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`fk_rw_poducts_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`fk_rw_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `stars_number` CHECK (((`stars` >= 1) and (`stars` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,50,66,5,'Velit corporis ut repudiandae ab qui magnam. Deleniti temporibus minus explicabo labore. Ut eum ut enim molestias velit eos. Deleniti quo voluptatem et harum debitis eum.'),(2,17,97,5,'Id et et sed iusto quia quis commodi. Ut odio ut soluta vero aut sint. Et sit sit voluptatem architecto in quaerat a. Perspiciatis magnam quo amet qui distinctio.'),(3,36,68,5,'Dolorem incidunt ab iste modi. Error natus commodi sit dolorum. Voluptatum molestiae consequuntur non nulla quis. Aspernatur ratione sed sed doloribus maxime.'),(4,25,98,4,'Iusto neque distinctio sed est sit. Nihil temporibus et aliquid vitae. Ut necessitatibus perferendis consectetur.'),(5,39,74,2,'Eos maxime officiis voluptatem laudantium inventore rerum. Et quaerat rerum fugiat sint. Quasi rerum voluptates qui assumenda cumque dolorem.'),(6,42,97,4,'Sequi facere consequatur eaque et vitae. Magni dolor beatae pariatur fugiat. Reiciendis non id voluptas non nihil ut quos. Unde ab distinctio quod cumque. Officia qui et illo facilis et.'),(7,34,89,4,'Maxime excepturi soluta non fugit. Temporibus occaecati consequatur velit culpa qui. Vel est ea et assumenda sit voluptatem nihil et. Veritatis dignissimos alias inventore rem nisi fuga nisi ut.'),(8,21,96,3,'Voluptate ipsa velit in veritatis aut. Cum est quos consequatur consectetur est cupiditate. Facere enim pariatur et doloribus adipisci. Ut aut sit fugit accusamus veniam ut.'),(9,14,57,2,'Est qui sint aspernatur recusandae. Voluptas et occaecati eum.\nIn quidem tempore eaque impedit. Necessitatibus similique cum asperiores sit ab nam. Ea aspernatur mollitia non veritatis rerum.'),(10,49,68,3,'Ut sit id omnis. Quia id est quibusdam ipsum hic nam. Voluptatem consequuntur neque quisquam quia iure aut nihil.'),(11,31,97,1,'Quo ut adipisci et. Voluptates hic maxime voluptatem unde sint.'),(12,52,63,2,'Quae ipsum dolor molestiae delectus iusto illo et. Molestiae sed ea similique ipsa molestias. Fugiat aut dolorum enim architecto.'),(13,29,95,3,'Fugiat harum omnis eius perspiciatis aut et. Ratione iure dolores totam molestiae dolores laudantium quia. Ex architecto iusto vero illum id reprehenderit voluptates consequatur.'),(14,16,76,1,'Sit voluptatem dignissimos modi sed qui earum. Aut aut enim dicta sed dolore excepturi. Aliquid laudantium in laudantium rerum temporibus molestiae fugiat.'),(15,35,70,3,'Reprehenderit non numquam temporibus sed distinctio qui. Placeat consequatur consequatur dolores et. Cumque occaecati sapiente quam possimus quo laboriosam. Ut eaque autem quo qui est.'),(16,13,72,4,'Laudantium saepe a omnis ipsum quis. Est aut ratione voluptas voluptatem.'),(17,27,59,2,'Doloremque at aliquid hic ut itaque et. Unde nihil in fugiat eos. Beatae numquam dolore dignissimos corporis sit iure. Quia aliquam sapiente voluptates quia quisquam exercitationem.'),(18,22,96,3,'Sit nihil autem dolor ullam molestias non. Veritatis impedit aspernatur assumenda quasi repellat. Illum quod iure sint alias est nam.'),(19,16,72,2,'Ut et animi exercitationem dignissimos repudiandae odit architecto nostrum. Ut quis illum et. Nam ut inventore eius nihil. Ipsum neque perferendis vel.'),(20,22,82,5,'Id ipsum fuga assumenda corrupti ut voluptatum. Reiciendis excepturi assumenda voluptatem in praesentium quia omnis.'),(21,43,88,5,'Pariatur consequatur voluptatem aliquam similique. Accusamus ullam rem et ullam. Modi eius totam quam accusamus facere.'),(22,40,81,4,'Sed ad rerum beatae impedit. Fugiat ab autem inventore optio. Aliquam similique sed reiciendis quae.'),(23,16,68,1,'Non rerum qui enim iure pariatur molestiae. Odio omnis est cum minima ex. Ut doloremque aut qui cum. Voluptates perspiciatis nobis alias tempore illum repudiandae.'),(24,27,76,4,'Animi optio porro qui eum consectetur consequatur explicabo. Sint et occaecati sequi itaque eligendi. Eveniet possimus eveniet distinctio minima.'),(25,49,88,2,'Laboriosam maxime illum eaque eos aut earum. Incidunt commodi velit amet voluptatibus voluptas. Et porro necessitatibus omnis ea culpa unde. Fuga exercitationem autem possimus rerum minima ut est.'),(26,39,90,1,'Qui neque aut ducimus consequuntur voluptatem delectus. Ullam ab id earum harum id magnam ut. Voluptatem quae qui eum eos dignissimos iure. Ut facilis eveniet porro alias rerum facilis.'),(27,13,84,4,'Fugiat tempore a et voluptates. Quis accusantium hic rerum blanditiis. Tempore eius inventore ut error non voluptas sint. Doloribus voluptate nisi ullam harum rerum.'),(28,49,73,5,'Vero eum amet cupiditate. Qui iusto dolor quos deserunt asperiores consequatur. Debitis molestias id rerum aut delectus ad velit. Est est laborum omnis consequuntur.'),(29,38,83,5,'Dolore quis numquam autem iste dolorem suscipit qui. Similique labore ea ut. Non officiis aut inventore quod nulla quia est.'),(30,45,82,4,'Qui magnam dolor quas sed. Sit aliquid nesciunt at nostrum quis quia. Est dolor illo sint dolor voluptatem sint ut.'),(31,32,84,3,'Error expedita hic et quas consequatur omnis. Corrupti ut enim et quidem pariatur.\nNam perspiciatis porro magnam. Quibusdam ut odio fuga dicta totam.'),(32,16,96,5,'Rem dolorem error ullam sit repellendus ratione. Velit pariatur omnis veritatis aut perspiciatis quo. Alias voluptas quos temporibus vitae sed iste sint. Nostrum ut culpa nam placeat dolorem enim.'),(33,18,56,3,'Magni provident quisquam et est laboriosam. Non impedit reprehenderit soluta suscipit earum vero fugiat sed. Est quis qui illum dolore aperiam quia aut est.'),(34,39,83,1,'Eos aliquid et iusto corrupti incidunt fugit unde. Debitis nulla fugit quia vel qui. Eveniet nisi necessitatibus qui mollitia non quaerat. Nostrum quisquam illo doloribus aperiam totam ex.'),(35,28,76,2,'Earum iste officia vero. Minus veritatis omnis quia et. Saepe quia culpa adipisci alias quo minus ut laboriosam.\nOccaecati atque non esse. Sed asperiores et et similique.'),(36,28,70,5,'Nihil molestiae qui quae quidem. Nam est dignissimos et est velit a vero. Adipisci beatae unde vitae cumque vitae non.'),(37,18,81,4,'In fugiat voluptatem veniam debitis. Qui quam perspiciatis soluta accusantium. Et explicabo reiciendis illum aspernatur suscipit consequatur distinctio.'),(38,22,88,5,'Illum rerum veniam aspernatur non expedita earum iure. Dolorum nulla quia minima quis eos quos. Amet voluptate sint et suscipit ullam quis nisi omnis.'),(39,29,90,3,'Et delectus et iste nihil. Vel rerum voluptatem est accusantium saepe dolor.'),(40,29,57,4,'Voluptatem est perspiciatis reprehenderit odit a rerum. Aut eligendi quo corrupti alias. Neque voluptatum voluptas facilis fugiat.'),(41,14,62,3,'Aliquid dolores blanditiis cupiditate quidem minima. Repellat aperiam distinctio voluptatibus numquam et ut. Ut eaque ratione facere eos sed blanditiis exercitationem.'),(42,42,79,3,'Consequatur sit in blanditiis voluptatem atque. Reprehenderit ipsum numquam veniam. Ut qui iusto consequatur et. Sint sint odit aut assumenda.'),(43,38,98,2,'Omnis vel fugit voluptas hic magnam. Ex veniam voluptatum qui ad ratione culpa optio. Quas dolores rerum quo magnam. Autem dolorem provident perspiciatis quos natus nisi.'),(44,50,96,2,'Exercitationem ut quod eum et incidunt sed voluptatem. Voluptas explicabo modi velit et dolorem. Velit pariatur omnis voluptatibus.'),(45,48,96,1,'Et dolorem fuga dolor. Nisi cupiditate ut nulla porro modi optio iste. Atque non accusamus rerum dolorem id commodi iure modi.'),(46,29,56,1,'Est magnam atque esse similique est est voluptas. Accusamus et ullam saepe nam et incidunt. Sed vel omnis dolorem sint perferendis incidunt. Sunt aut molestiae amet sint.'),(47,31,66,3,'Et dolorem accusantium quibusdam eveniet molestiae. Aut omnis sed ab est dolor accusantium est.'),(48,26,56,4,'Odio rerum doloremque et temporibus nihil. Quas vel explicabo corrupti aspernatur. Qui consequatur consequatur et. Similique dolorem quis atque atque sunt.'),(49,43,89,3,'Eos facere doloremque est cum voluptas facere. Rerum fugiat debitis et consequatur. Ut sit aperiam rerum quas voluptate.'),(50,40,95,5,'Similique nulla alias temporibus numquam. Saepe qui recusandae et cumque asperiores corrupti. Quasi doloremque sit in aut.'),(51,17,96,3,'Et id nostrum labore officia rerum. Placeat rerum excepturi sint odit neque. Quae dicta ut aut labore odio ducimus. Illo eveniet corrupti et dolore a aut enim.'),(52,47,75,5,'Molestias perspiciatis veritatis porro et nulla sapiente distinctio. Natus totam voluptatibus numquam. Ea nostrum explicabo natus doloribus. Autem sit vero sed repellendus porro.'),(53,38,98,1,'Eaque voluptas dolor eos recusandae optio. Aut qui quis corrupti aut ipsum. Iste omnis incidunt optio est ipsa.'),(54,32,96,1,'Sit illo quia accusamus iusto minima qui in. Minus et ut perferendis.'),(55,45,71,5,'Voluptatem aspernatur nemo nam consequatur omnis optio illum sit. Aut mollitia illo eius voluptas quasi. Natus consequuntur saepe saepe.'),(56,21,58,2,'Temporibus repellendus est iste libero reprehenderit. Aut est dolorem et cumque. Ratione incidunt non ea nemo.'),(57,24,98,3,'Qui natus nihil omnis optio. Officiis exercitationem quo expedita animi recusandae enim nulla. Et est fugiat consequatur voluptatem cum aut ut deserunt.'),(58,46,83,5,'Sit consequuntur explicabo tempora eum eum rerum. Quia qui qui dolorem et reiciendis modi. Voluptates reiciendis soluta magnam eligendi animi. Quo ipsa voluptas aut possimus.'),(59,39,63,5,'Est consequatur dolore sapiente est et temporibus. Corporis sunt quibusdam id ratione est error recusandae. Amet eum voluptatem voluptatem est labore.'),(60,45,90,2,'Quod maxime omnis suscipit sint consequatur. Esse hic consequatur natus nisi quo perspiciatis. Perspiciatis fugiat dolorem similique consequatur. Quia facere delectus asperiores similique unde rerum.'),(61,52,66,3,'Id et molestiae numquam ea numquam. Aut ab aut exercitationem quo unde explicabo. Quidem error aut assumenda doloremque est. Dolorem sit sed amet.'),(62,30,62,4,'Consequatur quo totam neque harum modi suscipit amet. Ex ut eum doloribus cupiditate. Veniam asperiores magnam deserunt sit sint et. Est perferendis laborum ea neque neque natus soluta.'),(63,48,60,2,'Odio atque et quasi fugit. Libero maiores qui quibusdam veritatis enim rem eum. Ipsum ut molestiae quia veritatis sunt repellat.'),(64,51,77,5,'Consequatur tempora soluta fuga eum. Qui doloremque velit laborum impedit quia iste eos. Aliquam modi quia perspiciatis corporis.'),(65,35,64,5,'Illo molestiae consequatur in maxime incidunt explicabo. Et porro atque tempore necessitatibus reiciendis dolorum eos. Ratione voluptatibus delectus qui quia quisquam non architecto.'),(66,39,64,2,'Cupiditate ipsa dolor recusandae distinctio voluptas. Dolores quia velit ea excepturi et.'),(67,39,67,5,'A quia non tempora debitis sit et. Nobis cumque dicta voluptas fuga. Dolores velit et dolore nam alias harum id veniam.'),(68,26,72,3,'Nihil eius eos ut placeat natus. Recusandae commodi laudantium voluptatibus illo. Delectus reprehenderit quia deserunt veniam laboriosam.'),(69,25,77,3,'Dicta et ut vel. Laboriosam necessitatibus rerum quia totam maiores. Officiis adipisci veritatis consequatur perferendis necessitatibus. Inventore reiciendis accusamus repellendus maiores ea.'),(70,21,94,4,'Temporibus et eos eaque voluptas qui. Temporibus et laborum qui reiciendis maxime. Sit dignissimos veritatis est ipsum voluptatem dolor sed. Illum voluptatum et pariatur repudiandae iste.'),(71,20,93,2,'In autem et consequuntur ut soluta ut et. Minima dolores blanditiis natus aut. Rerum voluptas illum in veniam doloremque aut. Dolorem eum repellendus perspiciatis vero.'),(72,51,73,3,'Autem aut eaque non pariatur voluptate. Voluptatem voluptatum et delectus dolores nisi delectus. Autem nihil sit minus earum non sint ad. Neque vel exercitationem sint quibusdam.'),(73,49,88,2,'Cupiditate nesciunt maxime est saepe. Culpa sit vero aut ea sit. Iste quia pariatur ex corporis. Consectetur modi qui inventore.'),(74,47,93,5,'Est vero qui dicta. Aut et ut et ea. Adipisci perspiciatis commodi rerum tenetur et. Error quibusdam assumenda laudantium vero.'),(75,32,87,2,'Id non asperiores qui et quia. Sunt placeat officia placeat dolorum deleniti fugit. Officia nihil iusto voluptatem omnis ad sapiente. Dignissimos error earum ut recusandae in omnis minima.'),(76,35,73,5,'Exercitationem laboriosam asperiores et repellendus consequuntur accusamus adipisci nemo. Reiciendis commodi ducimus in.'),(77,31,85,5,'Voluptatem distinctio sint enim aut alias ut. Delectus est ut non cupiditate. Commodi in aperiam modi repudiandae. Cupiditate a enim qui laboriosam soluta.'),(78,15,92,5,'Non dolor alias eum vel voluptatem. Laudantium excepturi voluptatem quia in pariatur aliquam. Dolorum vel hic consequatur inventore nostrum quos voluptatibus.'),(79,19,92,5,'Culpa alias fugit dolor temporibus repellat. Placeat ea quia quis non laboriosam quaerat. Vitae porro veritatis velit sunt eum dolorum voluptatem.'),(80,41,85,5,'Esse odio veritatis cumque doloremque nam pariatur. Quisquam libero doloribus qui porro expedita voluptatem. Blanditiis blanditiis adipisci dolores qui dolore. Culpa saepe placeat et aliquid qui.'),(81,35,63,4,'Facere omnis voluptatum distinctio quam aut id et mollitia. Ratione laborum eos error voluptatem optio ut est. Nisi facilis tempore veritatis blanditiis. Odit perferendis ex officiis error natus.'),(82,51,75,1,'Dolore aspernatur quia commodi et. Nisi id voluptatem aut. Inventore laudantium libero hic et qui et. Est sunt voluptas quae voluptates maiores. Natus et est eum assumenda.'),(83,34,81,4,'Autem rerum id odio incidunt aliquid sed. Nesciunt corporis eligendi delectus voluptas culpa. Error qui consequatur consectetur aut aut dignissimos.'),(84,25,61,3,'Praesentium ex cum ut inventore quia. Vel sit et ut non quaerat illum magnam aspernatur. Eveniet voluptate quia id sunt hic.'),(85,15,92,1,'Nisi in aliquam minus reiciendis et et voluptas. Mollitia beatae est delectus aut delectus et. Non nostrum earum enim reprehenderit eum placeat.'),(86,39,73,2,'Minima sunt itaque architecto nobis sed odit in. Sunt laudantium maiores assumenda veritatis. Odit qui aut et minus doloribus architecto. Aut iste qui in.'),(87,16,79,4,'Id eum qui at voluptas ut qui ullam. Sed et blanditiis quos deleniti ad nisi animi fugit. Consequatur sint sit quaerat blanditiis nam pariatur aut.'),(88,27,80,2,'Ut molestiae cum et. Molestiae labore ea fugiat incidunt quas quisquam.'),(89,40,62,4,'Et non aspernatur praesentium vitae. Distinctio voluptatem earum enim. Aut porro deleniti dolorem similique.'),(90,48,59,5,'Cum aspernatur harum dicta in sit sed. Commodi maxime qui quod repudiandae ab. Eos voluptas hic similique suscipit voluptates. Inventore aut voluptates molestiae aut.'),(91,44,93,1,'Nesciunt velit qui voluptas rerum. Architecto quasi sequi veritatis tempore quidem. Hic nihil maxime iure autem nesciunt iusto. Error quidem consectetur tenetur adipisci ut voluptatem.'),(92,48,78,1,'Illo velit occaecati quae aspernatur dolor. Aut aut voluptatem quae laborum sunt beatae. In voluptate officia dolor sint dolor.'),(93,13,59,4,'Dolor assumenda iste deserunt et eos ut non. Sapiente recusandae est aut rem aliquid. Sint qui voluptas accusamus est est. Alias provident voluptatum voluptas molestiae quo eveniet repudiandae.'),(94,49,82,5,'Fugiat et in aliquam aliquam consectetur asperiores neque. Voluptatem est eum veritatis consequatur dolores. Accusantium aliquam et ab sed ratione dolores exercitationem.'),(95,35,67,2,'Consequatur illo ab voluptas at. Sunt voluptas explicabo dolor.'),(96,23,61,5,'Aut est atque ea iure placeat voluptatem. Modi odit est illo. Odit voluptas et unde quia exercitationem.'),(97,37,71,2,'Ab sed et magni facilis ut omnis accusantium. Nulla laboriosam vel aspernatur molestiae et voluptas. Quidem qui quia aut. Omnis laboriosam voluptatem ut accusantium assumenda numquam et.'),(98,18,92,2,'Officiis expedita numquam fugit consequatur. Commodi quo reiciendis mollitia eius quia labore. Sint inventore sit similique laboriosam. Quos reprehenderit autem vero eligendi.'),(99,13,90,1,'Sed a eos enim corrupti et saepe. Alias aliquam laborum et velit quam illum occaecati. Vel quia et dolor et voluptatem.'),(100,19,76,5,'Sunt sapiente odio dolorum amet corporis harum dolores. Doloremque ex ex modi voluptas optio et. Provident vero ratione dolor ex doloremque.');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_review` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = NEW.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = NEW.fk_rw_poducts_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_review` AFTER UPDATE ON `reviews` FOR EACH ROW BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = NEW.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = NEW.fk_rw_poducts_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_delete_review` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN 
	DECLARE new_rating FLOAT;
	SELECT avg(r.stars) 
	FROM reviews r 
	WHERE r.fk_rw_poducts_id = OLD.fk_rw_poducts_id
	GROUP BY r.fk_rw_poducts_id INTO new_rating;
	UPDATE products SET rating = new_rating	WHERE id = OLD.fk_rw_poducts_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'officiis'),(2,'corrupti'),(3,'minima'),(4,'molestiae'),(5,'molestiae'),(6,'voluptate'),(7,'quo'),(8,'placeat'),(9,'velit'),(10,'saepe'),(11,'iste'),(12,'molestiae'),(13,'et'),(14,'quia'),(15,'unde'),(16,'debitis'),(17,'quidem'),(18,'itaque'),(19,'nostrum'),(20,'voluptatibus');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `email_regexp` CHECK (regexp_like(`email`,_utf8mb4'^[a-zA-Z0-9_-]+@([a-zA-Z0-9_.])+([a-zA-Z0-9_-])$')),
  CONSTRAINT `phone_regexp` CHECK (regexp_like(`phone`,_utf8mb4'^\\+7[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ead6900@66042.27','+79836038875','2021-08-03 09:13:22','2021-08-03 09:13:22'),(2,'83da133@0eb57.21','+79543341752','2021-08-03 09:13:22','2021-08-03 09:13:22'),(3,'ac207a7@3eff9.fa','+79647080209','2021-08-03 09:13:22','2021-08-03 09:13:22'),(4,'bc5e7a7@f5f0f.ca','+79937837986','2021-08-03 09:13:22','2021-08-03 09:13:22'),(5,'8ff8dd7@3da96.a8','+79264940626','2021-08-03 09:13:22','2021-08-03 09:13:22'),(6,'2aa64c9@474b5.53','+79909766179','2021-08-03 09:13:22','2021-08-03 09:13:22'),(7,'a7b6a72@849e4.be','+79589617082','2021-08-03 09:13:22','2021-08-03 09:13:22'),(8,'fa0d295@6935d.71','+79547607017','2021-08-03 09:13:22','2021-08-03 09:13:22'),(9,'5dc17e2@ea6ab.b6','+79070231505','2021-08-03 09:13:22','2021-08-03 09:13:22'),(10,'be4a22a@59e1d.dd','+79733246014','2021-08-03 09:13:22','2021-08-03 09:13:22'),(11,'6ecda4f@c505c.35','+79814639247','2021-08-03 09:13:22','2021-08-03 09:13:22'),(12,'110e347@87f1a.74','+79028343103','2021-08-03 09:13:22','2021-08-03 09:13:22'),(13,'4a03d41@f7192.1f','+79735913496','2021-08-03 09:13:22','2021-08-03 09:13:22'),(14,'86da654@ec0d9.d5','+79122546131','2021-08-03 09:13:22','2021-08-03 09:13:22'),(15,'d5ddba6@e5337.ad','+79424337971','2021-08-03 09:13:22','2021-08-03 09:13:22'),(16,'f6b9fbf@842e0.03','+79621695858','2021-08-03 09:13:22','2021-08-03 09:13:22'),(17,'d9d40fd@19871.af','+79870311899','2021-08-03 09:13:22','2021-08-03 09:13:22'),(18,'17d4adf@65a1a.cd','+79159625114','2021-08-03 09:13:22','2021-08-03 09:13:22'),(19,'00b2a24@08637.58','+79256158580','2021-08-03 09:13:22','2021-08-03 09:13:22'),(20,'61e1aff@a65a1.65','+79932766750','2021-08-03 09:13:22','2021-08-03 09:13:22'),(21,'7629856@28513.a8','+79190158720','2021-08-03 09:13:22','2021-08-03 09:13:22'),(22,'ccf72d9@849d1.10','+79670342228','2021-08-03 09:13:22','2021-08-03 09:13:22'),(23,'a4fbc21@b1130.1c','+79524536223','2021-08-03 09:13:22','2021-08-03 09:13:22'),(24,'f48db60@f6541.f4','+79618212180','2021-08-03 09:13:22','2021-08-03 09:13:22'),(25,'d86a129@cee1f.f5','+79559351916','2021-08-03 09:13:22','2021-08-03 09:13:22'),(26,'2870784@46acb.70','+79782528889','2021-08-03 09:13:22','2021-08-03 09:13:22'),(27,'286ec78@dfb8a.41','+79099912051','2021-08-03 09:13:22','2021-08-03 09:13:22'),(28,'2b23b7f@0ba8e.20','+79885001486','2021-08-03 09:13:22','2021-08-03 09:13:22'),(29,'274795e@91992.49','+79462641911','2021-08-03 09:13:22','2021-08-03 09:13:22'),(30,'34e33d6@8501c.35','+79001063395','2021-08-03 09:13:22','2021-08-03 09:13:22'),(31,'cd07250@f8e28.36','+79890757732','2021-08-03 09:13:22','2021-08-03 09:13:22'),(32,'68b2154@9a961.72','+79443775714','2021-08-03 09:13:22','2021-08-03 09:13:22'),(33,'fd31050@14be5.5c','+79063701751','2021-08-03 09:13:22','2021-08-03 09:13:22'),(34,'9022b03@30d1f.c1','+79903875956','2021-08-03 09:13:22','2021-08-03 09:13:22'),(35,'e2a77d4@3ec0d.13','+79869619436','2021-08-03 09:13:22','2021-08-03 09:13:22'),(36,'cd4eab4@5d022.17','+79065522510','2021-08-03 09:13:22','2021-08-03 09:13:22'),(37,'a51a79c@a9d89.f0','+79035054736','2021-08-03 09:13:22','2021-08-03 09:13:22'),(38,'3f48101@fadfb.fe','+79716459384','2021-08-03 09:13:22','2021-08-03 09:13:22'),(39,'11a1403@3e994.5e','+79906143344','2021-08-03 09:13:22','2021-08-03 09:13:22'),(40,'2c9e66e@a5aaf.b3','+79773965450','2021-08-03 09:13:22','2021-08-03 09:13:22'),(41,'04e4a7c@e3205.1b','+79072546930','2021-08-03 09:13:22','2021-08-03 09:13:22'),(42,'fdf0566@9b4da.85','+79192403787','2021-08-03 09:13:22','2021-08-03 09:13:22'),(43,'7dfc818@f16a8.7f','+79118205864','2021-08-03 09:13:22','2021-08-03 09:13:22'),(44,'e64bcfc@c9ead.e5','+79959912901','2021-08-03 09:13:22','2021-08-03 09:13:22'),(45,'809ca06@4c5d1.77','+79675458558','2021-08-03 09:13:22','2021-08-03 09:13:22'),(46,'7df13b0@d7744.34','+79929348803','2021-08-03 09:13:22','2021-08-03 09:13:22'),(47,'65e98f5@18903.c0','+79054504473','2021-08-03 09:13:22','2021-08-03 09:13:22'),(48,'aa6652a@59d2d.43','+79417789392','2021-08-03 09:13:22','2021-08-03 09:13:22'),(49,'92be4f6@ac527.4d','+79886907296','2021-08-03 09:13:22','2021-08-03 09:13:22'),(50,'6177453@99cfd.ff','+79368270122','2021-08-03 09:13:22','2021-08-03 09:13:22'),(51,'7c2d851@8c02f.3c','+79477169074','2021-08-03 09:13:22','2021-08-03 09:13:22'),(52,'95219ab@f29dd.a8','+79839120649','2021-08-03 09:13:22','2021-08-03 09:13:22'),(53,'86f408d@3ffe5.56','+79167696108','2021-08-03 09:13:22','2021-08-03 09:13:22'),(54,'0c7964d@abf8d.42','+79551000464','2021-08-03 09:13:22','2021-08-03 09:13:22'),(55,'f290b26@6ec06.25','+79409782822','2021-08-03 09:13:22','2021-08-03 09:13:22'),(56,'ff48e9a@96412.99','+79924478498','2021-08-03 09:13:22','2021-08-03 09:13:22'),(57,'3febe6c@b838a.6f','+79903724595','2021-08-03 09:13:22','2021-08-03 09:13:22'),(58,'ac227b6@79cdc.8a','+79094786274','2021-08-03 09:13:22','2021-08-03 09:13:22'),(59,'a86d67a@20bfb.4e','+79310007781','2021-08-03 09:13:22','2021-08-03 09:13:22'),(60,'a59dd7f@48618.9c','+79654989029','2021-08-03 09:13:22','2021-08-03 09:13:22'),(61,'92ef209@7367b.b7','+79550614930','2021-08-03 09:13:22','2021-08-03 09:13:22'),(62,'76674d5@3e79d.85','+79806818001','2021-08-03 09:13:22','2021-08-03 09:13:22'),(63,'787ec7b@ecaf6.41','+79138773504','2021-08-03 09:13:22','2021-08-03 09:13:22'),(64,'4d20f26@76fc6.80','+79247061943','2021-08-03 09:13:22','2021-08-03 09:13:22'),(65,'3f7da62@1abcf.de','+79501600880','2021-08-03 09:13:22','2021-08-03 09:13:22'),(66,'91e5f8c@35817.cd','+79037092628','2021-08-03 09:13:22','2021-08-03 09:13:22'),(67,'117f635@5a434.6c','+79093108410','2021-08-03 09:13:22','2021-08-03 09:13:22'),(68,'e652d32@456b7.b1','+79931689742','2021-08-03 09:13:22','2021-08-03 09:13:22'),(69,'dd06b0d@f7b1c.e5','+79027808933','2021-08-03 09:13:22','2021-08-03 09:13:22'),(70,'e046201@6af8e.27','+79071602977','2021-08-03 09:13:22','2021-08-03 09:13:22'),(71,'fba5be9@2be8f.65','+79307305816','2021-08-03 09:13:22','2021-08-03 09:13:22'),(72,'356ed33@80d5e.fd','+79606061991','2021-08-03 09:13:22','2021-08-03 09:13:22'),(73,'a4b1ea0@ef9b0.d9','+79987500066','2021-08-03 09:13:22','2021-08-03 09:13:22'),(74,'150ca2c@a6b3a.eb','+79621509931','2021-08-03 09:13:22','2021-08-03 09:13:22'),(75,'e2c2a2d@7c75c.12','+79190409079','2021-08-03 09:13:22','2021-08-03 09:13:22'),(76,'a995532@01c07.8d','+79968017782','2021-08-03 09:13:22','2021-08-03 09:13:22'),(77,'a72215c@351ac.b4','+79606972475','2021-08-03 09:13:22','2021-08-03 09:13:22'),(78,'bcbeea2@83dd0.ba','+79782126826','2021-08-03 09:13:22','2021-08-03 09:13:22'),(79,'553731f@ed8c2.e0','+79104739105','2021-08-03 09:13:22','2021-08-03 09:13:22'),(80,'17aa7ab@88fb6.a4','+79573248198','2021-08-03 09:13:22','2021-08-03 09:13:22'),(81,'056a29e@ebea6.5e','+79140272666','2021-08-03 09:13:22','2021-08-03 09:13:22'),(82,'47826ee@0adb9.4e','+79680428641','2021-08-03 09:13:22','2021-08-03 09:13:22'),(83,'6d77f37@742aa.2c','+79024946379','2021-08-03 09:13:22','2021-08-03 09:13:22'),(84,'a2af09b@e516f.a5','+79441896147','2021-08-03 09:13:22','2021-08-03 09:13:22'),(85,'2d029fc@54cac.47','+79549730195','2021-08-03 09:13:22','2021-08-03 09:13:22'),(86,'4bf95fc@0840b.5a','+79763877285','2021-08-03 09:13:22','2021-08-03 09:13:22'),(87,'d1b2d35@a7b64.2d','+79481771350','2021-08-03 09:13:22','2021-08-03 09:13:22'),(88,'f137560@5334d.08','+79373521317','2021-08-03 09:13:22','2021-08-03 09:13:22'),(89,'b3afc73@81e3b.3e','+79094340667','2021-08-03 09:13:22','2021-08-03 09:13:22'),(90,'5b7617b@33cdb.33','+79103630112','2021-08-03 09:13:22','2021-08-03 09:13:22'),(91,'ae4a024@560ca.ca','+79903542591','2021-08-03 09:13:22','2021-08-03 09:13:22'),(92,'c8dc2c4@960c2.c9','+79521077992','2021-08-03 09:13:22','2021-08-03 09:13:22'),(93,'47ca6be@149c0.af','+79542809618','2021-08-03 09:13:22','2021-08-03 09:13:22'),(94,'18f2ca2@f818d.26','+79976389963','2021-08-03 09:13:22','2021-08-03 09:13:22'),(95,'5f48b3b@31f02.c3','+79934186552','2021-08-03 09:13:22','2021-08-03 09:13:22'),(96,'609474c@e15cb.af','+79338408787','2021-08-03 09:13:22','2021-08-03 09:13:22'),(97,'03f5969@c9ed7.f2','+79405111486','2021-08-03 09:13:22','2021-08-03 09:13:22'),(98,'744f47a@4a3a7.6c','+79542136367','2021-08-03 09:13:22','2021-08-03 09:13:22'),(99,'1dd9119@d1622.4e','+79138751736','2021-08-03 09:13:22','2021-08-03 09:13:22'),(100,'903ae24@5bc49.b2','+79678808000','2021-08-03 09:13:22','2021-08-03 09:13:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-03  9:20:38
