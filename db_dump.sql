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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (5,'autem'),(7,'beatae'),(1,'blanditiis'),(12,'explicabo'),(8,'inventore'),(10,'magnam'),(4,'maxime'),(6,'minus'),(13,'occaecati'),(3,'officiis'),(14,'ratione'),(11,'sint'),(9,'tenetur'),(2,'voluptas'),(15,'voluptatem');
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
INSERT INTO `ozon_cards` VALUES (1,5,'3278881362343732','794',1907.89,225.44),(2,6,'4532649188605827','155',1402.10,159.47),(3,7,'5423550812746842','239',1652.85,333.81),(4,8,'8728362089165722','985',698.94,396.55),(5,9,'9252285335077977','136',1755.28,133.01),(6,10,'7273718941287070','396',1253.03,71.21),(7,11,'8492761926217245','935',1133.22,21.91),(8,12,'5672518378984944','901',286.99,21.23),(9,13,'8035803460675233','695',1804.61,261.71),(10,14,'9190982425549293','180',1368.99,76.45),(11,15,'7398186841465126','319',1686.09,242.02),(12,16,'9018102840837331','540',677.26,111.81),(13,17,'1920856290549586','176',1131.40,285.80),(14,18,'2447180696886027','906',1615.67,174.44),(15,19,'3888602184445159','845',1520.53,156.58),(16,20,'3564536961544664','385',735.54,442.57),(17,21,'3900960683342851','624',602.96,378.08),(18,22,'8886201894304101','920',1061.35,457.26),(19,23,'9824243587008197','488',1523.71,256.21),(20,24,'3488860645705030','144',1803.75,181.06),(21,25,'1944494789021672','764',945.57,72.84),(22,26,'3790201967238563','364',1901.20,434.86),(23,27,'5470887189478125','378',345.87,467.79),(24,28,'2431989851994302','490',147.16,31.58),(25,29,'1855357323018784','901',1723.54,317.37),(26,30,'6294133848071021','767',1414.06,153.30),(27,31,'4706225751679065','182',1543.73,291.43),(28,32,'6387320448584679','781',1128.01,272.81),(29,33,'1324589264884766','336',118.47,253.65),(30,34,'4228344735526417','243',1981.62,237.95),(31,35,'4662646683473336','863',930.68,390.08),(32,36,'5542265046235168','197',301.17,214.38),(33,37,'7228256681485043','876',1938.75,128.27),(34,38,'4370192845296862','172',900.47,4.15),(35,39,'7216486016551693','250',1206.67,257.95),(36,40,'7924369827171490','729',672.17,290.37),(37,41,'9057761398937628','745',761.16,374.37),(38,42,'6416787111077919','827',1475.98,131.53),(39,43,'1911745535463363','517',1067.92,138.33),(40,44,'8031169213679757','768',1593.94,377.49),(41,45,'4455689621146882','906',1045.89,462.18),(42,46,'1476542537011229','304',116.22,304.89),(43,47,'8869588918378516','906',1958.13,102.25),(44,48,'1767831782876486','656',530.51,234.86),(45,49,'5974419420475654','312',1264.58,225.55),(46,50,'4226495621013636','187',1217.94,376.10),(47,51,'9406472534071861','707',187.33,219.88),(48,52,'9259342863592516','150',1545.95,348.91),(49,53,'2531781634891996','750',574.19,131.95),(50,54,'5123549320992016','278',1305.72,334.58),(51,55,'4484935753366609','703',970.07,206.06),(52,56,'6449812022583927','286',120.29,339.50),(53,57,'2930132258186129','318',1013.61,402.00),(54,58,'5496177493814589','279',1607.89,209.70),(55,59,'7165250880424689','731',561.09,148.24),(56,60,'6766383068503762','625',2.91,126.95),(57,61,'3386607512214879','173',231.55,166.67),(58,62,'3873636912304040','650',96.12,201.69),(59,63,'8853238223483594','992',192.61,252.35),(60,64,'3110692763069752','184',1102.93,237.88),(61,65,'7518275081964731','706',256.56,308.99),(62,66,'7345704231782765','328',1369.70,330.07),(63,67,'3215325256178329','579',445.28,256.77),(64,68,'9096962218216240','673',881.18,145.24),(65,69,'2175803256413107','660',830.96,103.32),(66,70,'8079382428801929','899',275.41,10.00),(67,71,'7180436882979382','302',660.90,488.62),(68,72,'9052588112505606','527',1688.95,397.10),(69,73,'4937824674232376','660',1318.86,213.03),(70,74,'2368533795843914','780',1631.02,402.63),(71,75,'6217534670829371','660',656.43,384.81);
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
INSERT INTO `payment_cards` VALUES (1,'7862700874517235','837',794.98),(2,'7524743275887646','520',799.24),(3,'7592776770627006','861',430.75),(4,'7534702975407616','514',914.54),(5,'7900713679757475','502',1621.88),(6,'7711712674967105','134',1746.30),(7,'7250763674297240','921',1688.51),(8,'7480787279227997','297',206.88),(9,'7857798173347726','667',1946.64),(10,'7973794978317307','139',591.04),(11,'7345784171727336','248',1633.64),(12,'7587749076897974','827',243.01),(13,'7178752670987912','342',1221.47),(14,'7243738471957820','568',281.92),(15,'7141728470017150','774',598.56),(16,'7245732879057547','118',916.51),(17,'7229777271787571','390',1805.22),(18,'7541700373907942','589',1784.90),(19,'7827746578447825','634',991.81),(20,'7694798878597331','173',821.19),(21,'7807780976277706','685',274.86),(22,'7731724770437475','321',1614.28),(23,'7294705373837756','672',1823.23),(24,'7646750175667327','944',1425.02),(25,'7744758777027752','691',62.53),(26,'7180780975107120','165',4.11),(27,'7790794973787042','169',512.72),(28,'7051748572787933','850',746.66),(29,'7360768473417654','323',556.27),(30,'7644739070177914','573',1773.00),(31,'7851760074487440','869',1920.26),(32,'7231727776957643','220',1471.57),(33,'7277718270777841','980',733.78),(34,'7896738772477073','660',1794.30),(35,'7615738670887280','226',1717.06),(36,'7870778072917117','738',402.16),(37,'7872776271957687','866',399.40),(38,'7440760477007691','419',1405.03),(39,'7445712172697981','194',1159.48),(40,'7581717071067022','811',1777.78),(41,'7070768772287077','729',543.36),(42,'7256746675677436','530',174.10),(43,'7996772476337992','160',713.27),(44,'7579783074167590','731',1482.97),(45,'7598776970567968','710',975.55),(46,'7400754075007880','913',1764.57),(47,'7694782970657834','980',786.92),(48,'7028795977157701','426',1413.86),(49,'7445710872057699','897',666.08),(50,'7004702271017437','894',214.30),(51,'7883709778377897','979',389.25),(52,'7038760879267812','352',1935.10),(53,'7992706773537567','799',370.87),(54,'7593741172807165','986',871.65),(55,'7219778972917087','608',1125.02),(56,'7116789471267947','424',1921.13),(57,'7718771474197952','555',1345.03),(58,'7842719774587700','215',1080.41),(59,'7314795478297287','951',1742.78),(60,'7515796572817511','743',81.47),(61,'7056716276417720','713',495.31),(62,'7190721074827779','506',1845.52),(63,'7255751177897415','737',598.59),(64,'7367794176087216','329',1251.81),(65,'7364794476337332','786',1635.74),(66,'7798754173127936','772',1853.31),(67,'7390717276917940','669',680.21),(68,'7800798475237664','776',1533.67),(69,'7576758371887191','453',784.93),(70,'7780772873017321','731',1097.87),(71,'7635753477647223','836',854.49),(72,'7677710875077216','601',280.40),(73,'7026771274877298','125',496.73),(74,'7155703276947379','830',1847.55),(75,'7180713371267232','804',441.38),(76,'7750709572247837','562',113.01),(77,'7739753174397603','728',1368.31),(78,'7322756378487553','298',889.12),(79,'7559746376427821','263',888.17),(80,'7673703671637705','136',167.23),(81,'7296723372767682','625',1749.86),(82,'7619747675247191','446',699.02),(83,'7592791377947231','794',332.16),(84,'7513707278197883','964',307.23),(85,'7882795671367808','673',1526.04),(86,'7899721173597161','754',311.51),(87,'7594750777547250','987',371.61),(88,'7965727674817581','517',1151.76),(89,'7485769970457124','539',141.19),(90,'7884721674257480','212',367.13),(91,'7541716171797414','580',854.57),(92,'7532738573277483','491',1455.23),(93,'7329746673447324','627',1920.58),(94,'7041732575057552','323',1163.12),(95,'7162706878517059','766',1050.60),(96,'7403744179967660','383',1183.54),(97,'7013729174177212','829',833.44),(98,'7650700370677323','476',240.04),(99,'7344736477877848','891',1705.46),(100,'7622755879237944','956',1853.73);
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
  KEY `ix_pd_rating` (`rating`),
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
INSERT INTO `profiles` VALUES (1,1,1,'Douglas','Bartell','Male','1981-02-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(2,2,9,'Roman','Vandervort','Male','1988-12-09','2021-08-03 09:32:43','2021-08-03 09:32:43'),(3,3,1,'Mckayla','Cremin','Male','1983-07-18','2021-08-03 09:32:43','2021-08-03 09:32:43'),(4,4,4,'Ethan','Lebsack','Male','1987-07-09','2021-08-03 09:32:43','2021-08-03 09:32:43'),(5,5,5,'Giovanny','West','Male','2011-06-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(6,6,9,'Billy','Mann','Male','1970-09-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(7,7,4,'Lavern','Considine','Male','2011-01-17','2021-08-03 09:32:43','2021-08-03 09:32:43'),(8,8,4,'Branson','Thompson','Male','2009-08-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(9,9,10,'Casey','Osinski','Male','1976-01-16','2021-08-03 09:32:43','2021-08-03 09:32:43'),(10,10,9,'Jerry','Labadie','Male','2006-01-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(11,11,13,'Jaleel','Murphy','Female','1976-07-04','2021-08-03 09:32:43','2021-08-03 09:32:43'),(12,12,12,'Maeve','Runolfsdottir','Male','1975-10-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(13,13,6,'Brenda','Dicki','Female','1985-03-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(14,14,5,'Jewell','Hoppe','Male','1976-08-04','2021-08-03 09:32:43','2021-08-03 09:32:43'),(15,15,9,'Wilton','Medhurst','Female','1970-12-21','2021-08-03 09:32:43','2021-08-03 09:32:43'),(16,16,13,'Kenyatta','Gleichner','Female','1977-08-02','2021-08-03 09:32:43','2021-08-03 09:32:43'),(17,17,12,'Douglas','Kessler','Female','2018-12-31','2021-08-03 09:32:43','2021-08-03 09:32:43'),(18,18,4,'Donavon','Rutherford','Male','2000-10-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(19,19,12,'Coy','Turcotte','Male','2012-01-20','2021-08-03 09:32:43','2021-08-03 09:32:43'),(20,20,8,'Eleazar','Rempel','Female','2020-05-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(21,21,14,'Frederick','Wisoky','Male','1986-11-08','2021-08-03 09:32:43','2021-08-03 09:32:43'),(22,22,6,'Kennith','Jenkins','Male','1989-03-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(23,23,1,'Benjamin','McCullough','Male','2001-10-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(24,24,13,'Vincenza','Bosco','Male','1975-02-24','2021-08-03 09:32:43','2021-08-03 09:32:43'),(25,25,5,'Nya','Kuvalis','Female','1974-11-26','2021-08-03 09:32:43','2021-08-03 09:32:43'),(26,26,1,'Idella','Von','Female','2014-10-17','2021-08-03 09:32:43','2021-08-03 09:32:43'),(27,27,3,'Rodger','Leannon','Female','1997-10-22','2021-08-03 09:32:43','2021-08-03 09:32:43'),(28,28,13,'Vivienne','Stanton','Female','1991-07-20','2021-08-03 09:32:43','2021-08-03 09:32:43'),(29,29,13,'Marilou','Balistreri','Male','2008-04-29','2021-08-03 09:32:43','2021-08-03 09:32:43'),(30,30,10,'Verna','McGlynn','Female','1991-09-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(31,31,10,'Deion','Torphy','Male','1982-07-04','2021-08-03 09:32:43','2021-08-03 09:32:43'),(32,32,5,'Louisa','Stiedemann','Male','2018-11-18','2021-08-03 09:32:43','2021-08-03 09:32:43'),(33,33,8,'Dan','Krajcik','Male','1972-12-01','2021-08-03 09:32:43','2021-08-03 09:32:43'),(34,34,13,'Margarette','Brakus','Male','2009-11-20','2021-08-03 09:32:43','2021-08-03 09:32:43'),(35,35,12,'Beverly','Cartwright','Female','1996-09-09','2021-08-03 09:32:43','2021-08-03 09:32:43'),(36,36,6,'Ardella','Lowe','Female','1994-05-05','2021-08-03 09:32:43','2021-08-03 09:32:43'),(37,37,9,'Royce','Fisher','Male','1974-11-02','2021-08-03 09:32:43','2021-08-03 09:32:43'),(38,38,13,'Pearlie','Homenick','Female','1974-03-17','2021-08-03 09:32:43','2021-08-03 09:32:43'),(39,39,10,'Tremayne','Grant','Male','2006-01-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(40,40,11,'Diamond','Breitenberg','Female','2014-05-25','2021-08-03 09:32:43','2021-08-03 09:32:43'),(41,41,10,'Milo','Okuneva','Male','2018-01-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(42,42,4,'Johanna','Metz','Male','1977-04-07','2021-08-03 09:32:43','2021-08-03 09:32:43'),(43,43,1,'Clovis','Schimmel','Female','2010-11-27','2021-08-03 09:32:43','2021-08-03 09:32:43'),(44,44,6,'Alycia','Stroman','Female','2020-04-02','2021-08-03 09:32:43','2021-08-03 09:32:43'),(45,45,1,'Mattie','Connelly','Female','1993-03-25','2021-08-03 09:32:43','2021-08-03 09:32:43'),(46,46,12,'Telly','Altenwerth','Male','1995-09-29','2021-08-03 09:32:43','2021-08-03 09:32:43'),(47,47,1,'Chasity','Kilback','Female','1999-01-12','2021-08-03 09:32:43','2021-08-03 09:32:43'),(48,48,10,'Josiane','Kutch','Female','2005-12-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(49,49,5,'Maryam','Murazik','Male','1999-12-18','2021-08-03 09:32:43','2021-08-03 09:32:43'),(50,50,9,'Lexus','Ryan','Male','2012-03-07','2021-08-03 09:32:43','2021-08-03 09:32:43'),(51,51,1,'Mabelle','Daugherty','Male','1981-06-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(52,52,5,'Robbie','McClure','Female','1987-04-03','2021-08-03 09:32:43','2021-08-03 09:32:43'),(53,53,7,'Jefferey','Schimmel','Female','2019-01-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(54,54,4,'Robb','Stokes','Male','2013-02-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(55,55,1,'Adolphus','Hermann','Female','2019-10-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(56,56,5,'Jamel','Legros','Female','1998-03-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(57,57,9,'Rosendo','Emmerich','Female','2002-12-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(58,58,2,'Cierra','Dare','Female','2011-03-15','2021-08-03 09:32:43','2021-08-03 09:32:43'),(59,59,12,'Van','Swaniawski','Male','1976-08-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(60,60,9,'Flavio','Stracke','Female','2016-06-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(61,61,8,'Muhammad','Wolf','Female','1995-07-01','2021-08-03 09:32:43','2021-08-03 09:32:43'),(62,62,14,'Timmothy','Nikolaus','Male','1971-03-10','2021-08-03 09:32:43','2021-08-03 09:32:43'),(63,63,2,'Liliana','Heathcote','Male','2001-09-26','2021-08-03 09:32:43','2021-08-03 09:32:43'),(64,64,9,'Jevon','McCullough','Male','2011-12-23','2021-08-03 09:32:43','2021-08-03 09:32:43'),(65,65,9,'German','Fadel','Female','1994-09-10','2021-08-03 09:32:43','2021-08-03 09:32:43'),(66,66,7,'Malvina','Schimmel','Female','1992-10-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(67,67,7,'Santina','Reynolds','Male','2009-10-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(68,68,13,'Loren','Kuvalis','Female','1997-12-25','2021-08-03 09:32:43','2021-08-03 09:32:43'),(69,69,14,'Isai','Little','Male','1979-02-24','2021-08-03 09:32:43','2021-08-03 09:32:43'),(70,70,4,'Euna','Ferry','Female','1971-10-27','2021-08-03 09:32:43','2021-08-03 09:32:43'),(71,71,3,'Yasmine','Ryan','Female','2008-11-29','2021-08-03 09:32:43','2021-08-03 09:32:43'),(72,72,5,'Fatima','Sauer','Male','2021-01-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(73,73,2,'Melvin','Torp','Male','2005-01-16','2021-08-03 09:32:43','2021-08-03 09:32:43'),(74,74,8,'Pedro','Connelly','Male','2000-01-31','2021-08-03 09:32:43','2021-08-03 09:32:43'),(75,75,5,'Meghan','Towne','Female','2017-09-26','2021-08-03 09:32:43','2021-08-03 09:32:43'),(76,76,2,'Ransom','Sawayn','Female','1997-01-03','2021-08-03 09:32:43','2021-08-03 09:32:43'),(77,77,9,'Tina','Crist','Female','2015-03-07','2021-08-03 09:32:43','2021-08-03 09:32:43'),(78,78,11,'Daniela','Heaney','Male','1992-01-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(79,79,12,'Telly','Blanda','Male','1994-12-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(80,80,14,'Leanne','Reilly','Female','1977-06-10','2021-08-03 09:32:43','2021-08-03 09:32:43'),(81,81,3,'Adrain','Wisoky','Male','2004-09-10','2021-08-03 09:32:43','2021-08-03 09:32:43'),(82,82,1,'Ilene','Collins','Female','2010-01-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(83,83,9,'Emily','Herman','Female','2003-08-24','2021-08-03 09:32:43','2021-08-03 09:32:43'),(84,84,2,'Paolo','Johnson','Male','2011-08-02','2021-08-03 09:32:43','2021-08-03 09:32:43'),(85,85,8,'Reva','Dibbert','Female','2021-02-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(86,86,6,'Sarai','Dach','Female','1971-04-21','2021-08-03 09:32:43','2021-08-03 09:32:43'),(87,87,6,'Celia','Considine','Female','1995-10-29','2021-08-03 09:32:43','2021-08-03 09:32:43'),(88,88,12,'Adrian','Cartwright','Male','1973-06-19','2021-08-03 09:32:43','2021-08-03 09:32:43'),(89,89,14,'Macie','Dooley','Male','1987-10-12','2021-08-03 09:32:43','2021-08-03 09:32:43'),(90,90,4,'Meta','Kiehn','Female','1976-03-13','2021-08-03 09:32:43','2021-08-03 09:32:43'),(91,91,5,'Elian','Bergstrom','Male','2000-05-16','2021-08-03 09:32:43','2021-08-03 09:32:43'),(92,92,1,'Viola','Kilback','Male','2021-03-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(93,93,4,'Adrain','Terry','Female','1979-06-08','2021-08-03 09:32:43','2021-08-03 09:32:43'),(94,94,14,'Jamel','Legros','Male','2018-06-03','2021-08-03 09:32:43','2021-08-03 09:32:43'),(95,95,3,'Emilie','Moen','Male','1981-11-06','2021-08-03 09:32:43','2021-08-03 09:32:43'),(96,96,12,'Helmer','Heathcote','Male','1979-09-11','2021-08-03 09:32:43','2021-08-03 09:32:43'),(97,97,12,'Alysha','D\'Amore','Male','1975-03-14','2021-08-03 09:32:43','2021-08-03 09:32:43'),(98,98,8,'Shawn','Kozey','Male','1994-11-18','2021-08-03 09:32:43','2021-08-03 09:32:43'),(99,99,2,'Armando','Feeney','Male','1971-06-05','2021-08-03 09:32:43','2021-08-03 09:32:43'),(100,100,2,'Stefan','Baumbach','Female','2014-11-23','2021-08-03 09:32:43','2021-08-03 09:32:43');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (2,'corrupti'),(16,'debitis'),(13,'et'),(11,'iste'),(18,'itaque'),(3,'minima'),(4,'molestiae'),(5,'molestiare'),(12,'molestiate'),(19,'nostrum'),(1,'officiis'),(8,'placeat'),(14,'quia'),(17,'quidem'),(7,'quo'),(10,'saepe'),(15,'unde'),(9,'velit'),(6,'voluptate'),(20,'voluptatibus');
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
INSERT INTO `users` VALUES (1,'d234be8@edd94.08','+79618540228','2021-08-03 09:32:43','2021-08-03 09:32:43'),(2,'fdcb9b1@9796c.d6','+79604516466','2021-08-03 09:32:43','2021-08-03 09:32:43'),(3,'b41e933@52b05.29','+79247397560','2021-08-03 09:32:43','2021-08-03 09:32:43'),(4,'3e5da8a@43b30.9b','+79891537590','2021-08-03 09:32:43','2021-08-03 09:32:43'),(5,'b10ce38@16c15.df','+79758199549','2021-08-03 09:32:43','2021-08-03 09:32:43'),(6,'3c8611d@e80e3.1b','+79847908737','2021-08-03 09:32:43','2021-08-03 09:32:43'),(7,'d94d544@d1ca1.5c','+79418541581','2021-08-03 09:32:43','2021-08-03 09:32:43'),(8,'1bc16af@11a1d.35','+79879162792','2021-08-03 09:32:43','2021-08-03 09:32:43'),(9,'5cf54c3@4efc7.e8','+79650977875','2021-08-03 09:32:43','2021-08-03 09:32:43'),(10,'64a4099@b5a8c.b4','+79073233162','2021-08-03 09:32:43','2021-08-03 09:32:43'),(11,'b30e868@92e06.c1','+79389775015','2021-08-03 09:32:43','2021-08-03 09:32:43'),(12,'af96e98@41e04.eb','+79760952224','2021-08-03 09:32:43','2021-08-03 09:32:43'),(13,'c01d36c@2fb98.13','+79434845145','2021-08-03 09:32:43','2021-08-03 09:32:43'),(14,'474245b@97e71.be','+79514762887','2021-08-03 09:32:43','2021-08-03 09:32:43'),(15,'0386961@0c5d3.ce','+79341221835','2021-08-03 09:32:43','2021-08-03 09:32:43'),(16,'3d0c8d5@d7ed6.59','+79343303749','2021-08-03 09:32:43','2021-08-03 09:32:43'),(17,'bf88943@ba5f1.d9','+79114225455','2021-08-03 09:32:43','2021-08-03 09:32:43'),(18,'9fcceab@98c0e.1f','+79371735592','2021-08-03 09:32:43','2021-08-03 09:32:43'),(19,'b02af76@ea2c8.49','+79253054414','2021-08-03 09:32:43','2021-08-03 09:32:43'),(20,'815ff6a@58cf6.2f','+79687089393','2021-08-03 09:32:43','2021-08-03 09:32:43'),(21,'ed9eda8@72d08.50','+79174262706','2021-08-03 09:32:43','2021-08-03 09:32:43'),(22,'215975b@b64b0.81','+79117875346','2021-08-03 09:32:43','2021-08-03 09:32:43'),(23,'69babf7@89083.97','+79315972835','2021-08-03 09:32:43','2021-08-03 09:32:43'),(24,'c400c96@21c29.86','+79830787677','2021-08-03 09:32:43','2021-08-03 09:32:43'),(25,'43bf598@c002a.74','+79366381886','2021-08-03 09:32:43','2021-08-03 09:32:43'),(26,'de7d2d4@96c49.ac','+79375193253','2021-08-03 09:32:43','2021-08-03 09:32:43'),(27,'95e01b0@09b30.64','+79014361147','2021-08-03 09:32:43','2021-08-03 09:32:43'),(28,'1618fe5@e8706.b0','+79535228176','2021-08-03 09:32:43','2021-08-03 09:32:43'),(29,'dd9d0c4@c867a.b6','+79420019604','2021-08-03 09:32:43','2021-08-03 09:32:43'),(30,'b8570e1@0867a.c3','+79713250118','2021-08-03 09:32:43','2021-08-03 09:32:43'),(31,'fb31d5f@60720.22','+79623210851','2021-08-03 09:32:43','2021-08-03 09:32:43'),(32,'756d980@36d75.e9','+79988070511','2021-08-03 09:32:43','2021-08-03 09:32:43'),(33,'c36a862@8f89c.19','+79428114712','2021-08-03 09:32:43','2021-08-03 09:32:43'),(34,'6d6a93f@c7899.4c','+79809642968','2021-08-03 09:32:43','2021-08-03 09:32:43'),(35,'d953c5f@85f50.0b','+79030254820','2021-08-03 09:32:43','2021-08-03 09:32:43'),(36,'8439f2d@d41ba.0b','+79796330888','2021-08-03 09:32:43','2021-08-03 09:32:43'),(37,'8128c3b@6775e.b2','+79690862666','2021-08-03 09:32:43','2021-08-03 09:32:43'),(38,'3069151@d569e.17','+79463100910','2021-08-03 09:32:43','2021-08-03 09:32:43'),(39,'d381895@6c3b4.e8','+79883744298','2021-08-03 09:32:43','2021-08-03 09:32:43'),(40,'0cc9314@b6d2d.1e','+79613128921','2021-08-03 09:32:43','2021-08-03 09:32:43'),(41,'eb7dbfe@a7328.76','+79719940201','2021-08-03 09:32:43','2021-08-03 09:32:43'),(42,'c29e75d@a6335.87','+79276054600','2021-08-03 09:32:43','2021-08-03 09:32:43'),(43,'2b28451@c3bf6.0f','+79371579630','2021-08-03 09:32:43','2021-08-03 09:32:43'),(44,'6bd9317@26b8b.aa','+79091398691','2021-08-03 09:32:43','2021-08-03 09:32:43'),(45,'b3983b7@7ae21.28','+79251809241','2021-08-03 09:32:43','2021-08-03 09:32:43'),(46,'131a459@a5f36.af','+79967283810','2021-08-03 09:32:43','2021-08-03 09:32:43'),(47,'53a9106@614e3.6c','+79381806767','2021-08-03 09:32:43','2021-08-03 09:32:43'),(48,'0cfc19a@d9d3b.3e','+79609740688','2021-08-03 09:32:43','2021-08-03 09:32:43'),(49,'890f23a@1c4a3.36','+79214716159','2021-08-03 09:32:43','2021-08-03 09:32:43'),(50,'618a3cd@4f454.34','+79258655068','2021-08-03 09:32:43','2021-08-03 09:32:43'),(51,'b7a5a9d@936f2.01','+79326687632','2021-08-03 09:32:43','2021-08-03 09:32:43'),(52,'e7d0cd1@d8785.c7','+79102805380','2021-08-03 09:32:43','2021-08-03 09:32:43'),(53,'6f64a1f@a4b45.ba','+79800555409','2021-08-03 09:32:43','2021-08-03 09:32:43'),(54,'e99a2c4@2e54a.c9','+79263278014','2021-08-03 09:32:43','2021-08-03 09:32:43'),(55,'edeec5d@4db62.0d','+79459378976','2021-08-03 09:32:43','2021-08-03 09:32:43'),(56,'422e719@198ff.a5','+79241477833','2021-08-03 09:32:43','2021-08-03 09:32:43'),(57,'c7c0ba2@89e35.87','+79617207740','2021-08-03 09:32:43','2021-08-03 09:32:43'),(58,'f6e61a2@1346b.c8','+79142558685','2021-08-03 09:32:43','2021-08-03 09:32:43'),(59,'fd345d9@4e74a.4b','+79903810172','2021-08-03 09:32:43','2021-08-03 09:32:43'),(60,'b901128@8dc75.cb','+79459643886','2021-08-03 09:32:43','2021-08-03 09:32:43'),(61,'58516b4@fc093.7e','+79449237183','2021-08-03 09:32:43','2021-08-03 09:32:43'),(62,'b8eb332@a1bd7.44','+79857207327','2021-08-03 09:32:43','2021-08-03 09:32:43'),(63,'1991898@12bfb.81','+79633909596','2021-08-03 09:32:43','2021-08-03 09:32:43'),(64,'227ecc8@71751.27','+79997206131','2021-08-03 09:32:43','2021-08-03 09:32:43'),(65,'868daf7@83ebd.2a','+79695034256','2021-08-03 09:32:43','2021-08-03 09:32:43'),(66,'d68c56e@e6228.e6','+79623061359','2021-08-03 09:32:43','2021-08-03 09:32:43'),(67,'c347652@c234e.a8','+79412279847','2021-08-03 09:32:43','2021-08-03 09:32:43'),(68,'c67db6d@0e079.a8','+79944025504','2021-08-03 09:32:43','2021-08-03 09:32:43'),(69,'c00941a@d2692.2c','+79406088688','2021-08-03 09:32:43','2021-08-03 09:32:43'),(70,'d4abb2e@74f95.96','+79822362347','2021-08-03 09:32:43','2021-08-03 09:32:43'),(71,'d37df70@b4e6b.30','+79177109686','2021-08-03 09:32:43','2021-08-03 09:32:43'),(72,'e04d8e1@af2cb.a6','+79137280391','2021-08-03 09:32:43','2021-08-03 09:32:43'),(73,'53e32a6@8929e.26','+79741297726','2021-08-03 09:32:43','2021-08-03 09:32:43'),(74,'6e05d9a@5df57.9f','+79145416730','2021-08-03 09:32:43','2021-08-03 09:32:43'),(75,'ff8eef3@c600d.f4','+79832830581','2021-08-03 09:32:43','2021-08-03 09:32:43'),(76,'1ff920d@6c3d9.1d','+79882142701','2021-08-03 09:32:43','2021-08-03 09:32:43'),(77,'0ec536b@d0319.7a','+79115677620','2021-08-03 09:32:43','2021-08-03 09:32:43'),(78,'291aa21@39f57.45','+79223872953','2021-08-03 09:32:43','2021-08-03 09:32:43'),(79,'ce3fc51@d52ab.57','+79418543752','2021-08-03 09:32:43','2021-08-03 09:32:43'),(80,'7719a89@4dd89.4a','+79426805970','2021-08-03 09:32:43','2021-08-03 09:32:43'),(81,'1a97bbd@82fa9.78','+79492411989','2021-08-03 09:32:43','2021-08-03 09:32:43'),(82,'278519f@92b3e.47','+79326037028','2021-08-03 09:32:43','2021-08-03 09:32:43'),(83,'2057918@1d274.aa','+79945337800','2021-08-03 09:32:43','2021-08-03 09:32:43'),(84,'394d789@e0f8e.77','+79841874470','2021-08-03 09:32:43','2021-08-03 09:32:43'),(85,'a0cc6bc@641d9.48','+79190589924','2021-08-03 09:32:43','2021-08-03 09:32:43'),(86,'ae86127@2bd4e.2e','+79180519922','2021-08-03 09:32:43','2021-08-03 09:32:43'),(87,'458faf6@540db.c6','+79480557656','2021-08-03 09:32:43','2021-08-03 09:32:43'),(88,'16f41f1@cd617.b9','+79209170726','2021-08-03 09:32:43','2021-08-03 09:32:43'),(89,'3f65528@17688.63','+79820396908','2021-08-03 09:32:43','2021-08-03 09:32:43'),(90,'f2f7935@3bc31.b3','+79453319086','2021-08-03 09:32:43','2021-08-03 09:32:43'),(91,'ea079db@d8d07.73','+79036305246','2021-08-03 09:32:43','2021-08-03 09:32:43'),(92,'335e46a@974f1.e2','+79733861654','2021-08-03 09:32:43','2021-08-03 09:32:43'),(93,'e9511eb@002fe.44','+79773830600','2021-08-03 09:32:43','2021-08-03 09:32:43'),(94,'95424ab@c742f.ba','+79981110061','2021-08-03 09:32:43','2021-08-03 09:32:43'),(95,'b3b5f81@cea76.26','+79840480769','2021-08-03 09:32:43','2021-08-03 09:32:43'),(96,'f9dc40d@cd215.30','+79814997336','2021-08-03 09:32:43','2021-08-03 09:32:43'),(97,'8cbfebc@b115d.1a','+79465152380','2021-08-03 09:32:43','2021-08-03 09:32:43'),(98,'d033c47@609e9.1e','+79532490503','2021-08-03 09:32:43','2021-08-03 09:32:43'),(99,'aa15945@29f77.e9','+79966908158','2021-08-03 09:32:43','2021-08-03 09:32:43'),(100,'4320fcc@ae540.5a','+79517775913','2021-08-03 09:32:43','2021-08-03 09:32:43');
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

-- Dump completed on 2021-08-03  9:33:04
