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
INSERT INTO `ozon_cards` VALUES (1,5,'7796576644433919','525',791.42,278.63),(2,6,'6391391584022268','313',1525.05,50.67),(3,7,'2971812237012136','757',553.62,95.29),(4,8,'2102136585191504','795',1400.44,90.01),(5,9,'8193511289801566','688',166.74,226.74),(6,10,'1155753362047419','847',38.66,300.51),(7,11,'9523939383963803','182',1051.50,176.24),(8,12,'2665881380703912','335',672.89,448.85),(9,13,'5312732416883466','226',1763.02,492.68),(10,14,'3540509848718063','670',1630.87,87.49),(11,15,'4857656282402518','486',1285.98,462.73),(12,16,'7284743653323351','875',1053.73,23.94),(13,17,'6928235379814848','828',1541.16,210.42),(14,18,'8131729720955583','262',756.93,174.24),(15,19,'6462990521416987','950',1469.96,418.17),(16,20,'9790437394976368','234',1919.38,174.44),(17,21,'8787352082402641','548',1889.85,114.65),(18,22,'3805883647695337','237',641.02,71.33),(19,23,'7764397645861004','825',63.93,369.91),(20,24,'6428816825575283','873',1750.46,397.10),(21,25,'4107409571544488','896',537.72,342.64),(22,26,'6578139042166911','290',181.67,408.61),(23,27,'8321654567654188','863',372.23,190.53),(24,28,'4122632592628336','389',327.42,426.42),(25,29,'7956375929292365','204',246.92,135.02),(26,30,'9817179855403309','791',153.09,37.45),(27,31,'2303549715768390','921',212.11,394.19),(28,32,'6613778190713011','484',930.32,22.14),(29,33,'8432996855495838','254',493.53,358.94),(30,34,'8641182892153593','731',1295.39,65.53),(31,35,'7409251073231089','946',1356.76,283.47),(32,36,'8195367217775867','500',1205.69,339.50),(33,37,'6277905674529094','411',65.51,62.52),(34,38,'5742333674558271','898',32.75,208.77),(35,39,'1346945962631936','788',1034.66,144.42),(36,40,'9028634936617259','630',1731.46,278.58),(37,41,'2697344381252302','412',610.69,241.54),(38,42,'5493142676505976','592',160.69,379.06),(39,43,'5945526174722576','745',133.17,88.79),(40,44,'7193917252876917','871',638.93,11.04),(41,45,'2367724211119826','879',783.76,179.44),(42,46,'6568115330621852','806',1290.90,434.77),(43,47,'4701503210577189','477',70.18,458.19),(44,48,'5289670676678216','807',1058.83,142.96),(45,49,'8571413929831497','653',1821.99,354.42),(46,50,'8299936329183502','774',1837.05,170.52),(47,51,'9545752579877364','285',1821.94,467.66),(48,52,'9492921175799264','458',475.99,497.01),(49,53,'3304368675197538','513',236.34,106.04),(50,54,'7352903641301540','330',206.96,373.59),(51,55,'4829897223781974','173',167.88,87.21),(52,56,'6581620112624707','974',1251.43,105.80),(53,57,'2627342382342907','682',1209.03,39.13),(54,58,'6199688558307494','997',1651.73,67.40),(55,59,'2767619636837827','907',434.91,195.60),(56,60,'3732410283131262','736',903.35,67.43),(57,61,'3873272510094868','231',881.86,383.20),(58,62,'5582321973518101','844',1548.48,193.08),(59,63,'6471893462603498','670',678.48,396.47),(60,64,'9521420394516650','389',1451.99,332.08),(61,65,'2285749326147591','211',846.94,372.38),(62,66,'5079129282199226','247',153.25,445.84),(63,67,'3056520768718732','404',234.69,284.83),(64,68,'5466795143605946','664',983.13,286.74),(65,69,'4533318713355113','256',996.39,484.59),(66,70,'4161863927174667','518',206.29,60.11),(67,71,'3624187965237980','133',1714.77,88.16),(68,72,'3785116524737867','392',669.33,349.39),(69,73,'5408417936714819','307',1766.47,361.17),(70,74,'9657678739667466','643',1731.29,257.66),(71,75,'9815416983981488','823',1724.06,447.59);
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
INSERT INTO `payment_cards` VALUES (1,'7888776271477446','810',1228.42),(2,'7698765071597843','769',380.70),(3,'7716701379157542','967',390.24),(4,'7081781978587833','633',933.16),(5,'7550735671287571','529',1337.83),(6,'7911755670487568','731',1607.25),(7,'7910714379847497','577',326.94),(8,'7223762574617429','787',1069.64),(9,'7378729073147704','621',1569.40),(10,'7183756172627625','406',1656.72),(11,'7118710671767561','354',1457.48),(12,'7793778475417356','241',1430.85),(13,'7105738075887803','326',1697.04),(14,'7485788379627163','933',293.63),(15,'7950731877377735','517',227.49),(16,'7175753771607190','524',1579.40),(17,'7530728578347320','188',1059.75),(18,'7353717778267603','585',1776.00),(19,'7818743076987202','924',1955.57),(20,'7136774873387442','280',1348.75),(21,'7768782378117588','555',1539.12),(22,'7325732276347205','210',1996.31),(23,'7621711677147227','992',559.75),(24,'7421726770747570','665',867.40),(25,'7280710376737061','355',469.65),(26,'7322790875787168','195',51.40),(27,'7807796574077137','519',1838.91),(28,'7197722875497062','698',280.67),(29,'7703710073877640','134',542.03),(30,'7239738271987842','656',1131.29),(31,'7970716078907970','264',0.96),(32,'7453726979837111','647',1412.48),(33,'7704740979307428','414',921.57),(34,'7255789477087859','257',588.07),(35,'7943784073747347','651',47.93),(36,'7279732878047036','792',1480.88),(37,'7391773475037313','152',701.30),(38,'7576783274367681','189',909.42),(39,'7972750175897446','515',1938.44),(40,'7459739475917774','190',351.23),(41,'7576736070707269','225',1774.77),(42,'7018742870907167','607',639.55),(43,'7904756771257920','308',791.10),(44,'7281722072587631','446',57.56),(45,'7987785473127997','149',557.65),(46,'7228730678487325','174',870.51),(47,'7926733278817414','480',1749.91),(48,'7103789371597117','194',353.68),(49,'7566730578267217','644',755.66),(50,'7071722278997830','512',1594.30),(51,'7609766074717379','533',541.34),(52,'7906772378977318','908',1085.31),(53,'7013744071627490','969',726.26),(54,'7912747976577849','350',1681.47),(55,'7367731874907496','111',1142.04),(56,'7817737574277009','786',1580.25),(57,'7659792776647536','721',1693.58),(58,'7158725477937210','702',1434.65),(59,'7576773079267442','488',1661.05),(60,'7856779373997616','894',1141.46),(61,'7200729278597421','578',782.94),(62,'7361763670977575','627',415.70),(63,'7277776670027711','595',1238.83),(64,'7443736174747291','128',568.07),(65,'7324777378947152','168',1853.42),(66,'7402723679727155','873',1667.77),(67,'7587743974347853','969',548.85),(68,'7469752372127489','831',1190.63),(69,'7536789878857732','104',1655.11),(70,'7122712872747989','214',1327.92),(71,'7937770076887341','679',389.90),(72,'7041762279917091','533',265.80),(73,'7219769878347082','912',549.16),(74,'7659747573997572','697',1205.20),(75,'7020729274027134','519',1858.07),(76,'7244743774557962','506',736.28),(77,'7484732071487780','512',1900.27),(78,'7374702479977915','630',394.92),(79,'7218750078467732','211',846.30),(80,'7741744179837596','127',719.41),(81,'7707746171867544','249',396.39),(82,'7490785878227539','305',1043.45),(83,'7923705575057361','361',741.70),(84,'7979779070137693','487',146.42),(85,'7072714174897027','700',511.75),(86,'7275761072287310','880',813.83),(87,'7430793173717059','265',1480.37),(88,'7149752571817332','204',1169.77),(89,'7574711978727008','478',163.11),(90,'7143747479417285','643',331.55),(91,'7014757278247405','596',1086.62),(92,'7060767271837896','942',1983.26),(93,'7147776473827615','939',1641.67),(94,'7302704973407555','779',221.55),(95,'7286710376567973','908',1152.93),(96,'7182718473757324','544',999.08),(97,'7014757178157366','445',1643.38),(98,'7954731176927530','616',556.91),(99,'7669751275567246','605',141.34),(100,'7665712076047660','543',961.70);
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
INSERT INTO `products` VALUES (1,'voluptas',1,'Commodi voluptatum placeat repellendus.',NULL),(2,'ut',2,'Sed consectetur exercitationem aut debitis sunt ut ut et.',NULL),(3,'explicabo',3,'Asperiores corporis quis ut qui odio est quia voluptas.',NULL),(4,'odio',4,'Id tempore occaecati provident sint ut voluptatem.',NULL),(5,'vero',5,'Quibusdam at eveniet neque.',NULL),(6,'est',6,'Minus dolores voluptatem nam ipsam quasi.',NULL),(7,'in',7,'Delectus consequuntur a dicta qui molestias velit modi.',NULL),(8,'est',8,'Adipisci debitis eaque dolore fugit ipsam sint et.',NULL),(9,'nulla',9,'Illo laboriosam ut assumenda molestiae possimus dignissimos.',NULL),(10,'enim',10,'Itaque sed vero quo eveniet eos laudantium consequatur molestiae.',NULL),(11,'consequatur',11,'Occaecati natus et labore explicabo quam fugiat rerum aperiam.',NULL),(12,'a',12,'Harum consequatur delectus dolores qui sunt deleniti.',NULL),(13,'rerum',13,'Nesciunt aliquam ut ab.',NULL),(14,'minus',14,'Ad ab veniam quia consequatur sint voluptatem aut rem.',NULL),(15,'et',15,'Quas facilis fuga doloremque maxime rerum voluptatum voluptatibus.',NULL),(16,'enim',1,'Cum aut eum hic odit.',NULL),(17,'officia',2,'Illum molestiae sunt non quos sed.',NULL),(18,'qui',3,'Vitae dolores omnis aut vero repellendus sint tempore quia.',NULL),(19,'voluptatum',4,'Assumenda non illum soluta est.',NULL),(20,'sit',5,'Ducimus beatae quis aut rerum voluptatem non asperiores doloremque.',NULL),(21,'corporis',6,'Minima nulla nemo necessitatibus ut est eaque.',NULL),(22,'enim',7,'Voluptatem id omnis aliquam ullam dolor sint.',NULL),(23,'dolor',8,'Alias ducimus iste earum excepturi.',NULL),(24,'dolor',9,'Eligendi rerum ut neque eum in atque pariatur.',NULL),(25,'neque',10,'Vitae aut qui aliquam sint quae veritatis recusandae.',NULL),(26,'delectus',11,'Optio fuga est fugiat optio repellendus et nemo.',NULL),(27,'rem',12,'Tempore tenetur ut libero explicabo sed suscipit.',NULL),(28,'et',13,'Ut porro reiciendis dolorem voluptas ut iure.',NULL),(29,'eligendi',14,'Inventore a rerum dolore facilis aut impedit placeat.',NULL),(30,'consequuntur',15,'Nihil itaque aspernatur in facilis.',NULL),(31,'id',1,'Eligendi magnam architecto maxime.',NULL),(32,'aperiam',2,'Veritatis sed voluptas a.',NULL),(33,'odio',3,'In repellat nobis doloribus rem deserunt et.',NULL),(34,'facere',4,'Officia unde quae explicabo.',NULL),(35,'aut',5,'Dolorum vitae ut voluptatem nihil nobis rerum dolor.',NULL),(36,'omnis',6,'Ex saepe consequatur distinctio libero.',NULL),(37,'quia',7,'Labore qui quis quisquam voluptatem modi expedita omnis.',NULL),(38,'aut',8,'Voluptates a odit cum inventore eos explicabo.',NULL),(39,'ab',9,'Eos facilis ut dignissimos laboriosam consequatur.',NULL),(40,'ut',10,'Qui id omnis ex.',NULL),(41,'voluptatem',11,'Nulla maxime error laudantium explicabo dignissimos delectus.',NULL),(42,'delectus',12,'Eos et ipsam nulla id.',NULL),(43,'architecto',13,'Nostrum animi non enim incidunt.',NULL),(44,'voluptas',14,'Ratione occaecati placeat error et consequatur.',NULL),(45,'corrupti',15,'Consequatur commodi distinctio repudiandae nulla vero non.',NULL),(46,'mollitia',1,'Voluptatem deserunt in distinctio et unde voluptatem.',NULL),(47,'esse',2,'Repellendus omnis excepturi qui ut cupiditate sint.',NULL),(48,'necessitatibus',3,'Et enim voluptatem explicabo dolorem fuga.',NULL),(49,'dolor',4,'Dolore harum sit inventore ab ipsa dicta.',NULL),(50,'voluptatem',5,'Aut magni architecto voluptatem quia.',NULL),(51,'cupiditate',6,'Qui quis voluptatem suscipit natus qui cumque.',NULL),(52,'sed',7,'Dolores sint voluptatem aut voluptatem at eos.',NULL),(53,'atque',8,'Placeat id ullam et.',NULL),(54,'corporis',9,'Velit id cupiditate aspernatur eius.',NULL),(55,'occaecati',10,'Illo sed aspernatur occaecati optio laudantium.',NULL),(56,'quibusdam',11,'Est et tempore eligendi occaecati voluptate est.',NULL),(57,'ipsum',12,'Necessitatibus ducimus quia a accusamus.',NULL),(58,'minus',13,'Eos id necessitatibus sit amet maiores.',NULL),(59,'natus',14,'Quia amet voluptatem illo quod.',NULL),(60,'quaerat',15,'Maiores eligendi assumenda id sed architecto voluptatibus.',NULL),(61,'nihil',1,'Minus ut est quas molestiae qui commodi ut.',NULL),(62,'dolor',2,'Sed ea aut in quos et excepturi.',NULL),(63,'accusamus',3,'Aperiam temporibus nisi et sit laboriosam.',NULL),(64,'magni',4,'Non commodi necessitatibus magnam qui temporibus aut voluptas.',NULL),(65,'dolor',5,'Repellat tempora omnis voluptates aut quis magnam.',NULL),(66,'voluptatem',6,'Pariatur eligendi adipisci vitae delectus.',NULL),(67,'ad',7,'Necessitatibus ut quas est hic qui et vitae.',NULL),(68,'aperiam',8,'Nobis vero sapiente et cumque.',NULL),(69,'nesciunt',9,'Laudantium fugit iure perferendis inventore sed quaerat id nulla.',NULL),(70,'nulla',10,'Ut consequuntur recusandae dolorem temporibus.',NULL),(71,'qui',11,'Autem consequatur magnam quia soluta placeat quis.',NULL),(72,'dignissimos',12,'Aspernatur distinctio pariatur non accusantium.',NULL),(73,'id',13,'Nemo fugit quia incidunt.',NULL),(74,'ea',14,'Qui quis aut labore deserunt.',NULL),(75,'at',15,'Praesentium autem dolor ex aliquam dignissimos et.',NULL),(76,'nulla',1,'Voluptas molestiae illo cumque commodi omnis.',NULL),(77,'quaerat',2,'Accusamus aut esse voluptatibus quaerat illo blanditiis error.',NULL),(78,'amet',3,'Odio ipsum ut qui eveniet debitis delectus.',NULL),(79,'nulla',4,'Consequatur ex cumque maiores dolore.',NULL),(80,'dignissimos',5,'Ea eveniet eligendi quas a reprehenderit consequatur voluptatem.',NULL),(81,'libero',6,'Commodi suscipit reprehenderit optio aut praesentium rerum.',NULL),(82,'voluptatem',7,'Minima enim sed animi et et maxime sequi.',NULL),(83,'id',8,'Corrupti voluptas quasi sit laudantium corrupti.',NULL),(84,'veniam',9,'Dolor aut quasi temporibus est in delectus.',NULL),(85,'voluptatem',10,'Alias esse distinctio animi.',NULL),(86,'est',11,'Ratione dolore esse quis porro sunt sunt praesentium fugit.',NULL),(87,'qui',12,'Illo provident aut reiciendis labore sed.',NULL),(88,'et',13,'Nihil molestias mollitia rerum ut laudantium ex.',NULL),(89,'pariatur',14,'Corrupti quis aut voluptas nulla qui impedit.',NULL),(90,'sint',15,'Quos eum rerum ea ut temporibus quo.',NULL),(91,'velit',1,'Maiores officiis sed nostrum occaecati qui.',NULL),(92,'et',2,'Corrupti fuga eius quam rerum adipisci et eos.',NULL),(93,'eos',3,'Saepe perferendis placeat ratione impedit eos.',NULL),(94,'in',4,'Eaque accusamus dolor nam accusantium.',NULL),(95,'ipsa',5,'Sit ipsum incidunt expedita consequuntur officiis et quo.',NULL),(96,'quo',6,'Sit voluptates maiores id accusamus officia doloremque nemo aut.',NULL),(97,'eius',7,'Et non eum occaecati voluptatum.',NULL),(98,'blanditiis',8,'Vel provident similique at aliquam.',NULL),(99,'quia',9,'Nostrum placeat rerum et fuga.',NULL),(100,'aut',10,'Optio aut voluptatem dolorem omnis et.',NULL);
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
INSERT INTO `profiles` VALUES (1,1,11,'Douglas','Bartell','Male','1981-02-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(2,2,11,'Roman','Vandervort','Male','1988-12-09','2021-08-02 21:21:49','2021-08-02 21:21:49'),(3,3,8,'Mckayla','Cremin','Male','1983-07-18','2021-08-02 21:21:49','2021-08-02 21:21:49'),(4,4,5,'Ethan','Lebsack','Male','1987-07-09','2021-08-02 21:21:49','2021-08-02 21:21:49'),(5,5,1,'Giovanny','West','Male','2011-06-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(6,6,5,'Billy','Mann','Male','1970-09-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(7,7,5,'Lavern','Considine','Male','2011-01-17','2021-08-02 21:21:49','2021-08-02 21:21:49'),(8,8,10,'Branson','Thompson','Male','2009-08-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(9,9,5,'Casey','Osinski','Male','1976-01-16','2021-08-02 21:21:49','2021-08-02 21:21:49'),(10,10,12,'Jerry','Labadie','Male','2006-01-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(11,11,14,'Jaleel','Murphy','Female','1976-07-04','2021-08-02 21:21:49','2021-08-02 21:21:49'),(12,12,5,'Maeve','Runolfsdottir','Male','1975-10-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(13,13,10,'Brenda','Dicki','Female','1985-03-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(14,14,6,'Jewell','Hoppe','Male','1976-08-04','2021-08-02 21:21:49','2021-08-02 21:21:49'),(15,15,1,'Wilton','Medhurst','Female','1970-12-21','2021-08-02 21:21:49','2021-08-02 21:21:49'),(16,16,13,'Kenyatta','Gleichner','Female','1977-08-02','2021-08-02 21:21:49','2021-08-02 21:21:49'),(17,17,7,'Douglas','Kessler','Female','2018-12-31','2021-08-02 21:21:49','2021-08-02 21:21:49'),(18,18,8,'Donavon','Rutherford','Male','2000-10-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(19,19,6,'Coy','Turcotte','Male','2012-01-20','2021-08-02 21:21:49','2021-08-02 21:21:49'),(20,20,3,'Eleazar','Rempel','Female','2020-05-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(21,21,14,'Frederick','Wisoky','Male','1986-11-08','2021-08-02 21:21:49','2021-08-02 21:21:49'),(22,22,2,'Kennith','Jenkins','Male','1989-03-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(23,23,10,'Benjamin','McCullough','Male','2001-10-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(24,24,1,'Vincenza','Bosco','Male','1975-02-24','2021-08-02 21:21:49','2021-08-02 21:21:49'),(25,25,1,'Nya','Kuvalis','Female','1974-11-26','2021-08-02 21:21:49','2021-08-02 21:21:49'),(26,26,3,'Idella','Von','Female','2014-10-17','2021-08-02 21:21:49','2021-08-02 21:21:49'),(27,27,13,'Rodger','Leannon','Female','1997-10-22','2021-08-02 21:21:49','2021-08-02 21:21:49'),(28,28,12,'Vivienne','Stanton','Female','1991-07-20','2021-08-02 21:21:49','2021-08-02 21:21:49'),(29,29,7,'Marilou','Balistreri','Male','2008-04-29','2021-08-02 21:21:49','2021-08-02 21:21:49'),(30,30,13,'Verna','McGlynn','Female','1991-09-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(31,31,3,'Deion','Torphy','Male','1982-07-04','2021-08-02 21:21:49','2021-08-02 21:21:49'),(32,32,2,'Louisa','Stiedemann','Male','2018-11-18','2021-08-02 21:21:49','2021-08-02 21:21:49'),(33,33,14,'Dan','Krajcik','Male','1972-12-01','2021-08-02 21:21:49','2021-08-02 21:21:49'),(34,34,9,'Margarette','Brakus','Male','2009-11-20','2021-08-02 21:21:49','2021-08-02 21:21:49'),(35,35,14,'Beverly','Cartwright','Female','1996-09-09','2021-08-02 21:21:49','2021-08-02 21:21:49'),(36,36,1,'Ardella','Lowe','Female','1994-05-05','2021-08-02 21:21:49','2021-08-02 21:21:49'),(37,37,6,'Royce','Fisher','Male','1974-11-02','2021-08-02 21:21:49','2021-08-02 21:21:49'),(38,38,12,'Pearlie','Homenick','Female','1974-03-17','2021-08-02 21:21:49','2021-08-02 21:21:49'),(39,39,13,'Tremayne','Grant','Male','2006-01-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(40,40,14,'Diamond','Breitenberg','Female','2014-05-25','2021-08-02 21:21:49','2021-08-02 21:21:49'),(41,41,4,'Milo','Okuneva','Male','2018-01-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(42,42,5,'Johanna','Metz','Male','1977-04-07','2021-08-02 21:21:49','2021-08-02 21:21:49'),(43,43,14,'Clovis','Schimmel','Female','2010-11-27','2021-08-02 21:21:49','2021-08-02 21:21:49'),(44,44,12,'Alycia','Stroman','Female','2020-04-02','2021-08-02 21:21:49','2021-08-02 21:21:49'),(45,45,4,'Mattie','Connelly','Female','1993-03-25','2021-08-02 21:21:49','2021-08-02 21:21:49'),(46,46,11,'Telly','Altenwerth','Male','1995-09-29','2021-08-02 21:21:49','2021-08-02 21:21:49'),(47,47,14,'Chasity','Kilback','Female','1999-01-12','2021-08-02 21:21:49','2021-08-02 21:21:49'),(48,48,8,'Josiane','Kutch','Female','2005-12-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(49,49,14,'Maryam','Murazik','Male','1999-12-18','2021-08-02 21:21:49','2021-08-02 21:21:49'),(50,50,1,'Lexus','Ryan','Male','2012-03-07','2021-08-02 21:21:49','2021-08-02 21:21:49'),(51,51,5,'Mabelle','Daugherty','Male','1981-06-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(52,52,7,'Robbie','McClure','Female','1987-04-03','2021-08-02 21:21:49','2021-08-02 21:21:49'),(53,53,5,'Jefferey','Schimmel','Female','2019-01-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(54,54,5,'Robb','Stokes','Male','2013-02-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(55,55,9,'Adolphus','Hermann','Female','2019-10-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(56,56,3,'Jamel','Legros','Female','1998-03-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(57,57,13,'Rosendo','Emmerich','Female','2002-12-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(58,58,13,'Cierra','Dare','Female','2011-03-15','2021-08-02 21:21:49','2021-08-02 21:21:49'),(59,59,14,'Van','Swaniawski','Male','1976-08-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(60,60,14,'Flavio','Stracke','Female','2016-06-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(61,61,2,'Muhammad','Wolf','Female','1995-07-01','2021-08-02 21:21:49','2021-08-02 21:21:49'),(62,62,8,'Timmothy','Nikolaus','Male','1971-03-10','2021-08-02 21:21:49','2021-08-02 21:21:49'),(63,63,6,'Liliana','Heathcote','Male','2001-09-26','2021-08-02 21:21:49','2021-08-02 21:21:49'),(64,64,5,'Jevon','McCullough','Male','2011-12-23','2021-08-02 21:21:49','2021-08-02 21:21:49'),(65,65,8,'German','Fadel','Female','1994-09-10','2021-08-02 21:21:49','2021-08-02 21:21:49'),(66,66,8,'Malvina','Schimmel','Female','1992-10-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(67,67,1,'Santina','Reynolds','Male','2009-10-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(68,68,9,'Loren','Kuvalis','Female','1997-12-25','2021-08-02 21:21:49','2021-08-02 21:21:49'),(69,69,12,'Isai','Little','Male','1979-02-24','2021-08-02 21:21:49','2021-08-02 21:21:49'),(70,70,8,'Euna','Ferry','Female','1971-10-27','2021-08-02 21:21:49','2021-08-02 21:21:49'),(71,71,1,'Yasmine','Ryan','Female','2008-11-29','2021-08-02 21:21:49','2021-08-02 21:21:49'),(72,72,10,'Fatima','Sauer','Male','2021-01-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(73,73,5,'Melvin','Torp','Male','2005-01-16','2021-08-02 21:21:49','2021-08-02 21:21:49'),(74,74,7,'Pedro','Connelly','Male','2000-01-31','2021-08-02 21:21:49','2021-08-02 21:21:49'),(75,75,5,'Meghan','Towne','Female','2017-09-26','2021-08-02 21:21:49','2021-08-02 21:21:49'),(76,76,5,'Ransom','Sawayn','Female','1997-01-03','2021-08-02 21:21:49','2021-08-02 21:21:49'),(77,77,11,'Tina','Crist','Female','2015-03-07','2021-08-02 21:21:49','2021-08-02 21:21:49'),(78,78,9,'Daniela','Heaney','Male','1992-01-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(79,79,11,'Telly','Blanda','Male','1994-12-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(80,80,13,'Leanne','Reilly','Female','1977-06-10','2021-08-02 21:21:49','2021-08-02 21:21:49'),(81,81,4,'Adrain','Wisoky','Male','2004-09-10','2021-08-02 21:21:49','2021-08-02 21:21:49'),(82,82,8,'Ilene','Collins','Female','2010-01-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(83,83,14,'Emily','Herman','Female','2003-08-24','2021-08-02 21:21:49','2021-08-02 21:21:49'),(84,84,2,'Paolo','Johnson','Male','2011-08-02','2021-08-02 21:21:49','2021-08-02 21:21:49'),(85,85,11,'Reva','Dibbert','Female','2021-02-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(86,86,7,'Sarai','Dach','Female','1971-04-21','2021-08-02 21:21:49','2021-08-02 21:21:49'),(87,87,14,'Celia','Considine','Female','1995-10-29','2021-08-02 21:21:49','2021-08-02 21:21:49'),(88,88,8,'Adrian','Cartwright','Male','1973-06-19','2021-08-02 21:21:49','2021-08-02 21:21:49'),(89,89,13,'Macie','Dooley','Male','1987-10-12','2021-08-02 21:21:49','2021-08-02 21:21:49'),(90,90,9,'Meta','Kiehn','Female','1976-03-13','2021-08-02 21:21:49','2021-08-02 21:21:49'),(91,91,9,'Elian','Bergstrom','Male','2000-05-16','2021-08-02 21:21:49','2021-08-02 21:21:49'),(92,92,14,'Viola','Kilback','Male','2021-03-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(93,93,3,'Adrain','Terry','Female','1979-06-08','2021-08-02 21:21:49','2021-08-02 21:21:49'),(94,94,13,'Jamel','Legros','Male','2018-06-03','2021-08-02 21:21:49','2021-08-02 21:21:49'),(95,95,1,'Emilie','Moen','Male','1981-11-06','2021-08-02 21:21:49','2021-08-02 21:21:49'),(96,96,6,'Helmer','Heathcote','Male','1979-09-11','2021-08-02 21:21:49','2021-08-02 21:21:49'),(97,97,1,'Alysha','D\'Amore','Male','1975-03-14','2021-08-02 21:21:49','2021-08-02 21:21:49'),(98,98,11,'Shawn','Kozey','Male','1994-11-18','2021-08-02 21:21:49','2021-08-02 21:21:49'),(99,99,13,'Armando','Feeney','Male','1971-06-05','2021-08-02 21:21:49','2021-08-02 21:21:49'),(100,100,2,'Stefan','Baumbach','Female','2014-11-23','2021-08-02 21:21:49','2021-08-02 21:21:49');
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
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`fk_rw_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `users` VALUES (1,'7b64a24@0c7ce.e5','+79966922895','2021-08-02 21:21:49','2021-08-02 21:21:49'),(2,'c81cc03@c2cc4.18','+79912406528','2021-08-02 21:21:49','2021-08-02 21:21:49'),(3,'a41a47f@5a7ad.50','+79634692895','2021-08-02 21:21:49','2021-08-02 21:21:49'),(4,'57de438@041c9.8a','+79794742419','2021-08-02 21:21:49','2021-08-02 21:21:49'),(5,'49c8610@3ebb3.9f','+79186533562','2021-08-02 21:21:49','2021-08-02 21:21:49'),(6,'8f95079@b6d57.ed','+79606884104','2021-08-02 21:21:49','2021-08-02 21:21:49'),(7,'c33b414@810f7.ff','+79052037351','2021-08-02 21:21:49','2021-08-02 21:21:49'),(8,'57bb06b@37cf3.79','+79691207206','2021-08-02 21:21:49','2021-08-02 21:21:49'),(9,'2448c33@f92bd.6e','+79869054679','2021-08-02 21:21:49','2021-08-02 21:21:49'),(10,'f15b71c@c6993.9d','+79097979652','2021-08-02 21:21:49','2021-08-02 21:21:49'),(11,'02c745c@9543e.f1','+79213599801','2021-08-02 21:21:49','2021-08-02 21:21:49'),(12,'a851ad3@e1d97.98','+79328387978','2021-08-02 21:21:49','2021-08-02 21:21:49'),(13,'8e6493a@cb5ce.07','+79335500844','2021-08-02 21:21:49','2021-08-02 21:21:49'),(14,'c6e0e33@a1774.5a','+79477371596','2021-08-02 21:21:49','2021-08-02 21:21:49'),(15,'3f951d7@9ebbd.16','+79562897401','2021-08-02 21:21:49','2021-08-02 21:21:49'),(16,'be2ed4c@58b7d.72','+79406717668','2021-08-02 21:21:49','2021-08-02 21:21:49'),(17,'dab8e3d@8fab7.df','+79909478779','2021-08-02 21:21:49','2021-08-02 21:21:49'),(18,'9a42ab7@49020.69','+79007098649','2021-08-02 21:21:49','2021-08-02 21:21:49'),(19,'ce39198@4ed79.ec','+79767063606','2021-08-02 21:21:49','2021-08-02 21:21:49'),(20,'7e3f3c2@760aa.40','+79527834685','2021-08-02 21:21:49','2021-08-02 21:21:49'),(21,'0810fd7@bd842.6f','+79915153135','2021-08-02 21:21:49','2021-08-02 21:21:49'),(22,'1cc9bea@f7ba9.b1','+79142924238','2021-08-02 21:21:49','2021-08-02 21:21:49'),(23,'0121c2a@b6cce.55','+79895617970','2021-08-02 21:21:49','2021-08-02 21:21:49'),(24,'5cad49f@da1c7.e1','+79620108744','2021-08-02 21:21:49','2021-08-02 21:21:49'),(25,'a25cc15@81814.f6','+79152251796','2021-08-02 21:21:49','2021-08-02 21:21:49'),(26,'8ffdc17@258e2.0a','+79993566049','2021-08-02 21:21:49','2021-08-02 21:21:49'),(27,'6491afe@63be1.03','+79460767683','2021-08-02 21:21:49','2021-08-02 21:21:49'),(28,'46f1ec0@c66ba.0d','+79564473568','2021-08-02 21:21:49','2021-08-02 21:21:49'),(29,'d311d04@6e5c3.81','+79292259779','2021-08-02 21:21:49','2021-08-02 21:21:49'),(30,'d30bd31@fa6a0.f7','+79522753483','2021-08-02 21:21:49','2021-08-02 21:21:49'),(31,'1960e27@4c3ed.3b','+79631410885','2021-08-02 21:21:49','2021-08-02 21:21:49'),(32,'3354c0a@fee82.e8','+79230909772','2021-08-02 21:21:49','2021-08-02 21:21:49'),(33,'fab4fdf@ee9e5.d2','+79057778184','2021-08-02 21:21:49','2021-08-02 21:21:49'),(34,'8815055@e7e40.88','+79114233688','2021-08-02 21:21:49','2021-08-02 21:21:49'),(35,'46518c8@92c6a.87','+79502130263','2021-08-02 21:21:49','2021-08-02 21:21:49'),(36,'c628852@4d1b6.6e','+79977759783','2021-08-02 21:21:49','2021-08-02 21:21:49'),(37,'74e8c4a@24eac.b0','+79699062575','2021-08-02 21:21:49','2021-08-02 21:21:49'),(38,'794163f@96b31.f6','+79579929160','2021-08-02 21:21:49','2021-08-02 21:21:49'),(39,'fcc91cf@85559.dc','+79291641714','2021-08-02 21:21:49','2021-08-02 21:21:49'),(40,'e39d160@01cdd.00','+79058854278','2021-08-02 21:21:49','2021-08-02 21:21:49'),(41,'ade5b17@76635.dc','+79564046518','2021-08-02 21:21:49','2021-08-02 21:21:49'),(42,'f003084@2834d.5b','+79700767639','2021-08-02 21:21:49','2021-08-02 21:21:49'),(43,'9c8d73d@4c3c1.07','+79675540381','2021-08-02 21:21:49','2021-08-02 21:21:49'),(44,'18d1653@938f3.08','+79948180457','2021-08-02 21:21:49','2021-08-02 21:21:49'),(45,'992aa03@25176.73','+79507134276','2021-08-02 21:21:49','2021-08-02 21:21:49'),(46,'d82c3b6@7c1fa.c8','+79144447867','2021-08-02 21:21:49','2021-08-02 21:21:49'),(47,'2124f2c@bdee9.40','+79467750278','2021-08-02 21:21:49','2021-08-02 21:21:49'),(48,'c31c61f@44f9f.04','+79738076328','2021-08-02 21:21:49','2021-08-02 21:21:49'),(49,'8a5c4a1@55d5b.90','+79272416286','2021-08-02 21:21:49','2021-08-02 21:21:49'),(50,'82811e0@ab013.6f','+79654611616','2021-08-02 21:21:49','2021-08-02 21:21:49'),(51,'e8f5bb3@bf6ee.ea','+79466073453','2021-08-02 21:21:49','2021-08-02 21:21:49'),(52,'3519630@e35c7.81','+79839661717','2021-08-02 21:21:49','2021-08-02 21:21:49'),(53,'cf7a66b@57bf4.51','+79252027600','2021-08-02 21:21:49','2021-08-02 21:21:49'),(54,'ed8e30f@0a411.b4','+79432875752','2021-08-02 21:21:49','2021-08-02 21:21:49'),(55,'b730dad@15a81.97','+79062155624','2021-08-02 21:21:49','2021-08-02 21:21:49'),(56,'d139c3c@56ea2.ac','+79256451384','2021-08-02 21:21:49','2021-08-02 21:21:49'),(57,'a1cb729@60119.e5','+79928227253','2021-08-02 21:21:49','2021-08-02 21:21:49'),(58,'c4eab02@20ad1.f1','+79609394048','2021-08-02 21:21:49','2021-08-02 21:21:49'),(59,'4cff27d@15338.94','+79835759212','2021-08-02 21:21:49','2021-08-02 21:21:49'),(60,'ddec1da@118c5.b7','+79304500132','2021-08-02 21:21:49','2021-08-02 21:21:49'),(61,'6621566@46b7d.12','+79747057411','2021-08-02 21:21:49','2021-08-02 21:21:49'),(62,'2a5b8f3@8986c.e5','+79576189734','2021-08-02 21:21:49','2021-08-02 21:21:49'),(63,'b272c49@c656f.a2','+79121436567','2021-08-02 21:21:49','2021-08-02 21:21:49'),(64,'3d458f5@c4967.14','+79981382374','2021-08-02 21:21:49','2021-08-02 21:21:49'),(65,'d8aaacb@3b427.c7','+79777800824','2021-08-02 21:21:49','2021-08-02 21:21:49'),(66,'76f5b01@4ad18.6b','+79293718649','2021-08-02 21:21:49','2021-08-02 21:21:49'),(67,'9a51fba@44db2.1e','+79743638223','2021-08-02 21:21:49','2021-08-02 21:21:49'),(68,'f926fc3@347f6.17','+79276708407','2021-08-02 21:21:49','2021-08-02 21:21:49'),(69,'f02a1e4@f3f1e.c3','+79676295624','2021-08-02 21:21:49','2021-08-02 21:21:49'),(70,'acb3609@13dfe.17','+79556026613','2021-08-02 21:21:49','2021-08-02 21:21:49'),(71,'f853452@92634.2a','+79937190893','2021-08-02 21:21:49','2021-08-02 21:21:49'),(72,'b8dd9cd@b5f4c.9f','+79418329252','2021-08-02 21:21:49','2021-08-02 21:21:49'),(73,'3910737@d01ca.ef','+79574479398','2021-08-02 21:21:49','2021-08-02 21:21:49'),(74,'d70b860@1459e.e0','+79161772314','2021-08-02 21:21:49','2021-08-02 21:21:49'),(75,'365c89a@a4a04.b9','+79955080624','2021-08-02 21:21:49','2021-08-02 21:21:49'),(76,'6cf0b90@dc4ea.19','+79489105104','2021-08-02 21:21:49','2021-08-02 21:21:49'),(77,'ab02cf6@313f0.65','+79401528339','2021-08-02 21:21:49','2021-08-02 21:21:49'),(78,'4b54f59@0fb55.98','+79106715213','2021-08-02 21:21:49','2021-08-02 21:21:49'),(79,'40e343c@1f843.12','+79079530731','2021-08-02 21:21:49','2021-08-02 21:21:49'),(80,'284e8a1@27c44.ab','+79635116742','2021-08-02 21:21:49','2021-08-02 21:21:49'),(81,'699b4aa@e802a.8e','+79403061767','2021-08-02 21:21:49','2021-08-02 21:21:49'),(82,'0b6e45a@09179.ea','+79805738042','2021-08-02 21:21:49','2021-08-02 21:21:49'),(83,'e6dd5c3@de6b1.97','+79720153874','2021-08-02 21:21:49','2021-08-02 21:21:49'),(84,'91e19b9@5c30c.0a','+79748005731','2021-08-02 21:21:49','2021-08-02 21:21:49'),(85,'fcb2c5c@9ac6b.58','+79233510416','2021-08-02 21:21:49','2021-08-02 21:21:49'),(86,'5706d13@a4403.1b','+79505616757','2021-08-02 21:21:49','2021-08-02 21:21:49'),(87,'c45eb42@ec9ec.b8','+79512212393','2021-08-02 21:21:49','2021-08-02 21:21:49'),(88,'b00e57f@9b55b.72','+79733901821','2021-08-02 21:21:49','2021-08-02 21:21:49'),(89,'dbd6707@4f691.a1','+79239129267','2021-08-02 21:21:49','2021-08-02 21:21:49'),(90,'6546d61@d87af.8a','+79575299257','2021-08-02 21:21:49','2021-08-02 21:21:49'),(91,'070f922@28d76.46','+79958182800','2021-08-02 21:21:49','2021-08-02 21:21:49'),(92,'4e89e53@7ac4d.0b','+79057469026','2021-08-02 21:21:49','2021-08-02 21:21:49'),(93,'e48cf2a@b3743.e2','+79099077103','2021-08-02 21:21:49','2021-08-02 21:21:49'),(94,'537ecd8@b73b9.01','+79328463482','2021-08-02 21:21:49','2021-08-02 21:21:49'),(95,'d5cd1ee@dafa5.09','+79637737277','2021-08-02 21:21:49','2021-08-02 21:21:49'),(96,'20d16f5@172b7.1b','+79138352422','2021-08-02 21:21:49','2021-08-02 21:21:49'),(97,'8188cc3@71442.2e','+79798169268','2021-08-02 21:21:49','2021-08-02 21:21:49'),(98,'e07ef2e@6daee.86','+79565521105','2021-08-02 21:21:49','2021-08-02 21:21:49'),(99,'163b07f@18b75.d9','+79322036490','2021-08-02 21:21:49','2021-08-02 21:21:49'),(100,'674f67c@d98bd.1c','+79651314896','2021-08-02 21:21:49','2021-08-02 21:21:49');
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

-- Dump completed on 2021-08-02 21:32:49
