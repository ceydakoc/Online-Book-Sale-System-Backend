-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: online-book-sale-system-db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Bilim Kurgu'),(2,'Çocuk - Gençlik'),(3,'Edebiyat'),(4,'Korku - Gerilim');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorites_user_id` (`user_id`),
  KEY `fk_favorites_product_id` (`product_id`),
  CONSTRAINT `fk_favorites_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorites_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,3,1),(4,3,12),(5,3,9),(6,2,6),(7,2,5),(8,2,12),(9,2,4),(10,2,7),(11,4,1),(12,4,5),(13,4,9),(14,4,6),(15,4,7),(16,4,2),(17,5,1),(18,5,14),(19,5,10),(20,2,3),(21,2,15),(22,2,11),(23,3,2),(24,3,6),(25,3,7);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2020-05-31 21:06:53','Customer registered with E-mail: ceyda.koc@ceng.deu.edu.tr','Register'),(2,'2020-05-31 21:06:57','Customer (E-mail: ceyda.koc@ceng.deu.edu.tr) logged out. ','Login / Logout'),(3,'2020-05-31 21:07:02','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(4,'2020-05-31 21:07:11','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(5,'2020-05-31 21:07:15','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(6,'2020-05-31 21:08:21','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 1) to favorites.','Add / Remove from Favorites'),(7,'2020-05-31 21:08:23','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added review to product (Id: 1) with 9','Add / Update Review'),(8,'2020-05-31 21:08:30','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added review to product (Id: 7) with 8','Add / Update Review'),(9,'2020-05-31 21:08:31','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 7) to favorites.','Add / Remove from Favorites'),(10,'2020-05-31 21:08:35','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 6) to favorites.','Add / Remove from Favorites'),(11,'2020-05-31 21:08:36','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) removed the product (Id: 6) from favorites.','Add / Remove from Favorites'),(12,'2020-05-31 21:08:39','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added review to product (Id: 6) with 8','Add / Update Review'),(13,'2020-05-31 21:08:51','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 12) to favorites.','Add / Remove from Favorites'),(14,'2020-05-31 21:09:37','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 9) to favorites.','Add / Remove from Favorites'),(15,'2020-05-31 21:09:51','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added review to product (Id: 9) with 9','Add / Update Review'),(16,'2020-05-31 21:09:53','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(17,'2020-05-31 21:10:19','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(18,'2020-05-31 21:10:20','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged out. ','Login / Logout'),(19,'2020-05-31 21:10:29','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged in locally. ','Login / Logout'),(20,'2020-05-31 21:12:10','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 2) with 10','Add / Update Review'),(21,'2020-05-31 21:12:18','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 1) with 10','Add / Update Review'),(22,'2020-05-31 21:12:23','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 3) with 6','Add / Update Review'),(23,'2020-05-31 21:12:29','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 4) with 8','Add / Update Review'),(24,'2020-05-31 21:12:41','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 6) with 9','Add / Update Review'),(25,'2020-05-31 21:12:42','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 6) to favorites.','Add / Remove from Favorites'),(26,'2020-05-31 21:12:46','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 5) to favorites.','Add / Remove from Favorites'),(27,'2020-05-31 21:12:51','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 7) with 10','Add / Update Review'),(28,'2020-05-31 21:13:01','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 12) with 7','Add / Update Review'),(29,'2020-05-31 21:13:03','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 12) to favorites.','Add / Remove from Favorites'),(30,'2020-05-31 21:32:18','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added review to product (Id: 15) with 6','Add / Update Review'),(31,'2020-05-31 21:33:07','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 4) to favorites.','Add / Remove from Favorites'),(32,'2020-05-31 21:33:10','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 7) to favorites.','Add / Remove from Favorites'),(33,'2020-05-31 21:35:01','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged out. ','Login / Logout'),(34,'2020-05-31 21:35:22','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged in locally. ','Login / Logout'),(35,'2020-05-31 21:43:27','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged out.','Login / Logout'),(36,'2020-05-31 21:43:46','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged in locally. ','Login / Logout'),(37,'2020-05-31 21:44:10','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged out. ','Login / Logout'),(38,'2020-05-31 21:45:05','Customer registered with E-mail: mustafa1955koc@gmail.com','Register'),(39,'2020-05-31 21:45:14','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) logged in locally. ','Login / Logout'),(40,'2020-05-31 21:45:20','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 1) to favorites.','Add / Remove from Favorites'),(41,'2020-05-31 21:45:26','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 5) with 9','Add / Update Review'),(42,'2020-05-31 21:45:27','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 5) to favorites.','Add / Remove from Favorites'),(43,'2020-05-31 21:45:32','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 9) with 7','Add / Update Review'),(44,'2020-05-31 21:45:35','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 9) to favorites.','Add / Remove from Favorites'),(45,'2020-05-31 21:45:42','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 8) with 9','Add / Update Review'),(46,'2020-05-31 21:45:49','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) updated review for product (Id: 5) with 8','Add / Update Review'),(47,'2020-05-31 21:45:59','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 6) with 7','Add / Update Review'),(48,'2020-05-31 21:46:05','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) updated review for product (Id: 6) with 6','Add / Update Review'),(49,'2020-05-31 21:46:06','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 6) to favorites.','Add / Remove from Favorites'),(50,'2020-05-31 21:46:16','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 7) with 6','Add / Update Review'),(51,'2020-05-31 21:46:17','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 7) to favorites.','Add / Remove from Favorites'),(52,'2020-05-31 21:46:30','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 1) with 10','Add / Update Review'),(53,'2020-05-31 21:46:34','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added review to product (Id: 2) with 10','Add / Update Review'),(54,'2020-05-31 21:46:36','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) added the product (Id: 2) to favorites.','Add / Remove from Favorites'),(55,'2020-05-31 21:48:10','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) logged out. ','Login / Logout'),(56,'2020-05-31 21:48:36','Customer registered with E-mail: samiozlu@gmail.com','Register'),(57,'2020-05-31 21:48:44','Customer (Id: 5, E-mail: samiozlu@gmail.com) logged in locally. ','Login / Logout'),(58,'2020-05-31 21:48:50','Customer (Id: 5, E-mail: samiozlu@gmail.com) added the product (Id: 1) to favorites.','Add / Remove from Favorites'),(59,'2020-05-31 21:49:39','Customer (Id: 5, E-mail: samiozlu@gmail.com) added review to product (Id: 14) with 10','Add / Update Review'),(60,'2020-05-31 21:49:43','Customer (Id: 5, E-mail: samiozlu@gmail.com) added the product (Id: 14) to favorites.','Add / Remove from Favorites'),(61,'2020-05-31 21:50:10','Customer (Id: 5, E-mail: samiozlu@gmail.com) added review to product (Id: 7) with 8','Add / Update Review'),(62,'2020-05-31 21:50:38','Customer (Id: 5, E-mail: samiozlu@gmail.com) added review to product (Id: 10) with 8','Add / Update Review'),(63,'2020-05-31 21:50:43','Customer (Id: 5, E-mail: samiozlu@gmail.com) added the product (Id: 10) to favorites.','Add / Remove from Favorites'),(64,'2020-05-31 21:51:13','Customer (Id: 5, E-mail: samiozlu@gmail.com) logged out. ','Login / Logout'),(65,'2020-05-31 21:51:20','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(66,'2020-05-31 21:52:42','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(67,'2020-05-31 21:52:43','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged out. ','Login / Logout'),(68,'2020-05-31 21:52:48','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(69,'2020-05-31 21:53:55','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(70,'2020-05-31 21:54:00','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged in locally. ','Login / Logout'),(71,'2020-05-31 21:55:06','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 3) to favorites.','Add / Remove from Favorites'),(72,'2020-05-31 21:55:14','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 15) to favorites.','Add / Remove from Favorites'),(73,'2020-05-31 21:55:24','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) added the product (Id: 11) to favorites.','Add / Remove from Favorites'),(74,'2020-05-31 21:55:27','Customer (Id: 2, E-mail: evren.ozlu@ceng.deu.edu.tr) logged out. ','Login / Logout'),(75,'2020-05-31 22:01:07','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(76,'2020-05-31 22:02:34','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(77,'2020-05-31 22:03:17','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(78,'2020-05-31 22:06:24','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(79,'2020-05-31 22:09:02','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(80,'2020-05-31 22:11:47','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(81,'2020-05-31 22:11:57','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(82,'2020-05-31 22:13:33','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(83,'2020-05-31 22:13:38','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(84,'2020-05-31 22:13:55','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(85,'2020-05-31 22:15:18','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(86,'2020-05-31 22:15:30','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(87,'2020-05-31 22:20:24','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(88,'2020-05-31 22:22:31','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(89,'2020-05-31 22:22:38','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(90,'2020-05-31 22:23:12','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(91,'2020-05-31 22:23:18','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(92,'2020-05-31 22:27:16','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(93,'2020-05-31 22:27:20','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(94,'2020-05-31 22:34:03','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(95,'2020-05-31 22:34:10','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) logged in locally. ','Login / Logout'),(96,'2020-05-31 22:34:47','Customer (Id: 4, E-mail: mustafa1955koc@gmail.com) logged out. ','Login / Logout'),(97,'2020-05-31 22:34:51','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged in locally.','Login / Logout'),(98,'2020-05-31 22:36:31','Admin (Id: 1, E-mail: ceydakocc@gmail.com) logged out.','Login / Logout'),(99,'2020-05-31 22:36:37','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(100,'2020-05-31 22:36:47','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 2) to favorites.','Add / Remove from Favorites'),(101,'2020-05-31 22:37:19','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(102,'2020-05-31 22:38:00','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(103,'2020-05-31 22:38:03','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 6) to favorites.','Add / Remove from Favorites'),(104,'2020-05-31 22:38:08','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) removed the product (Id: 7) from favorites.','Add / Remove from Favorites'),(105,'2020-05-31 22:38:08','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) added the product (Id: 7) to favorites.','Add / Remove from Favorites'),(106,'2020-05-31 22:38:14','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged in socially. ','Login / Logout'),(107,'2020-05-31 22:38:15','Customer (Id: 3, E-mail: ceyda.koc@ceng.deu.edu.tr) logged out. ','Login / Logout');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Emine Güler','emineguler@gmail.com','Don Kişot Stok','Merhabalar, Don Kişot\'un stoğu ne zaman gelir acaba? Teşekkürler.','2020-05-31 21:57:41',1),(2,'Evren Özlü','evren.ozlu@ceng.deu.edu.tr','Sipariş Takibi','Son siparişim gecikmesi ile ilgili bilgi alabilir miyim?','2020-05-31 22:00:55',0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` double NOT NULL,
  `date` datetime NOT NULL,
  `address` text,
  PRIMARY KEY (`id`),
  KEY `fk_orders_user_id` (`user_id`),
  CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,167.8,'2020-05-31 21:08:14','Buca / İzmir'),(2,3,189.9,'2020-05-31 21:10:10','Buca / İzmir'),(3,2,50.2,'2020-05-31 21:11:48','Dokuz Eylül Üniversitesi / Tınaztepe Kampüsü'),(4,2,149.9,'2020-05-31 21:16:06','Kuruçeşme Mah. 205/7 Sk. No: 3 D.2 Buca / İzmir'),(5,2,96.8,'2020-05-31 21:32:47','	Kuruçeşme Mah. 205/7 Sk. No: 3 D.2 Buca / İzmir'),(6,4,449.70000000000005,'2020-05-31 21:47:00','Karabağlar / İzmir'),(7,4,374.30000000000007,'2020-05-31 21:47:36','Karabağlar / İzmir'),(8,5,317.7,'2020-05-31 21:49:19','Köşk / Aydın'),(9,5,71.5,'2020-05-31 21:49:56','Köşk / Aydın'),(10,5,30.6,'2020-05-31 21:50:26','Köşk / Aydın'),(11,5,114.5,'2020-05-31 21:50:57','Köşk / Aydın'),(12,3,449.70000000000005,'2020-05-31 21:52:00','Gülyaka Mah. Saim Çıkrıkçı Cad. No:149 D.8 Karabağlar / İzmir'),(13,3,449.70000000000005,'2020-05-31 21:52:31','Karabağlar / İzmir'),(14,2,276.99,'2020-05-31 21:54:48','Buca / İzmir'),(15,4,21,'2020-05-31 22:34:42','Gülyaka Mah. Saim Çıkrıkçı Cad. No:149 D.8 Karabağlar / İzmir'),(16,3,149.9,'2020-05-31 22:37:56','Gülyaka Mah. Saim Çıkrıkçı Cad. No:149 D.8 Karabağlar / İzmir');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_order_details_product_id` (`product_id`),
  KEY `fk_order_details_order_id` (`order_id`),
  CONSTRAINT `fk_order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_details_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
INSERT INTO `orders_details` VALUES (1,1,8,1),(2,1,1,1),(3,2,12,1),(4,3,8,1),(5,3,7,1),(6,3,15,1),(7,4,2,1),(8,5,10,2),(9,5,15,3),(10,6,2,3),(11,7,1,2),(12,7,7,3),(13,7,14,2),(14,8,8,1),(15,8,1,2),(16,9,14,5),(17,10,7,2),(18,11,10,5),(19,12,2,3),(20,13,1,3),(21,14,11,1),(22,14,5,1),(23,14,6,1),(24,14,9,1),(25,14,12,1),(26,14,13,1),(27,15,3,1),(28,15,4,1),(29,16,2,1);
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `cat_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_cat_id` (`cat_id`),
  CONSTRAINT `fk_products_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Yüzüklerin Efendisi Kitap Seti','https://www.trendyol.com/assets/product/media/images/20191218/13/1587974/60978988/1/1_org_zoom.jpg','https://www.trendyol.com/assets/product/media/images/20191218/13/1587974/60978988/1/1_org_zoom.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000057163-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000070718-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000070734-1.jpg','Yazar: J.R.R. Tolkien\n \nYayınevi: Metis Yayıncılık\n \nYüzüklerin Efendisi son yüzyılın en çok okunan yüz kitabı arasında en başta geliyor; bilimkurgu, fantezi, polisiye, best-seller ya da ana akım demeden, tüm türler arasında tartışmasız bir önderliğe sahip. Bir açıdan bakarsanız bir fantezi romanı, başka bir açıdan baktığınızda, insanlık durumu, sorumluluk, iktidar ve savaş üzerine bir roman. Bir yolculuk, bir büyüme öyküsü; fedakârlık ve dostluk üzerine, hırs ve ihanet üzerine bir roman.\n\nSayfa Sayısı: 1350\n \nBaskı Yılı: 2015',149.9,63,'Yüzüklerin Efendisi - J.R.R. Tolkien',1),(2,'Harry Potter Kitap Seti','https://www.nobelkitap.com/img/2000/harry-potter-seti-7-kitap-takim-2fe5b2f86b3e444fa204c00d4e2e1567.jpg','https://www.nobelkitap.com/img/2000/harry-potter-seti-7-kitap-takim-2fe5b2f86b3e444fa204c00d4e2e1567.jpg;https://i.idefix.com/cache/600x600-0/originals/0000000105599-1.jpg;https://i.idefix.com/cache/500x400-0/originals/0000000105931-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000107298-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000110898-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000141001-1.jpg;https://i.dr.com.tr/cache/600x600-0/originals/0000000187015-1.jpg;https://i.idefix.com/cache/600x600-0/originals/0000000247902-1.jpg\n','Yazar: J. K. Rowling\n \nYayınevi: Yapı Kredi Yayınları\n \n1- Harry Potter ve Felsefe Taşı\n2- Harry Potter ve Sırlar Odası\n3- Harry Potter ve Azkaban Tutsağı\n4- Harry Potter ve Ateş Kadehi\n5- Harry Potter ve Zümrüdüanka Yoldaşlığı\n6- Harry Potter ve Melez Prens\n\nSayfa Sayısı: 4046\n \nBaskı Yılı: 2017',149.9,65,'Harry Potter - J. K. Rowling',1),(3,'Don Kişot','https://cdn.kidega.com/product-images-opt/publication/97/89/75/9789750815874.png?v=2020-05-06-19','null','Yazar: Miguel de Cervantes Saavedra\n\nYayınevi: Yapı Kredi Yayınları\n\nDon Kişot’u bilirsiniz, hani şu ince-uzun, sakallı, şövalye romanları okuya okuya sonunda şövalye olmaya özenen roman karakteri. Dulcinea del Toboso’ya âşıktır, kendi gibi zayıf, çelimsiz Rocinante adlı bir atı vardır. Seyisi-yardımcısı-dostu Sanço Panza ile atışır sık sık. İşte yeldeğirmenlerine savaş açan bu aşık, yaşlı şövalye, Miguel de Cervantes Saavedra’nın yazdığı bu romanın başkahramanıdır.       \n\nSayfa Sayısı: 289\n\nBaskı Yılı: 2018',15.5,1,'Don Kişot - Miguel de Cervantes Saavedra',2),(4,'Mutlu Prens','https://i.dr.com.tr/cache/600x600-0/originals/0001703855001-1.jpg','null','Yazar: Oscar Wilde\n \nYayınevi: İş Bankası Kültür Yayınları\n \nOscar Wilde’ın 1888’de yayımlanan Mutlu Prens’teki masalları oğulları için yazdığı düşünülse de, yazar hedef kitlesini “yediden yetmişe çocuk ruhlu insanlar, şaşırma ve sevinme gibi çocuksu yetilerini koruyanlar” olarak açıklamıştır. Wilde bu masallarda bencilliği ve duyarsızlığı gözler önüne serer ve eleştirir.\n\nSayfa Sayısı: 56\n \nBaskı Yılı: 2017',5.5,0,'Mutlu Prens - Oscar Wilde',2),(5,'Pal Sokağı Çocukları','https://i.dr.com.tr/cache/600x600-0/originals/0000000291906-1.jpg',NULL,'Yazar: Ferenc Molnar\n \nYayınevi: Yapı Kredi Yayınları\n \nNemecsek, Boka ve Pal Sokağı\'nın öbür çocukları 1907 lımıroa Budapeşte\'nin yoksul Jozsefvaros semtinden yola çıktılar. Bugün artık bütün dünyada tanınıyorlar. Bugüne kadar bütün dünyada her yaştan milyonlarca insan onların dokunaklı hikayesini okudu; tıpkı Budapeşteli çocuklar gibi onlar da Boka\'nın cesaretine hayran oldu, Nemecsek\'in ürkek ama kararlı kahramanlığı karşısında gözyaşlarını tutamadı. Şimdi artık Pal Sokağı Çocukları\'nın Arsa\'sında kocaman çok katlı evler var. Ama ne gam: Dünyanın bütün çocukları Pal Sokağı\'ndandır!\n\nSayfa Sayısı: 235\n \nBaskı Yılı: 2017',14,9,'Pal Sokağı Çocukları - Ferenc Molnar',2),(6,'Kürk Mantolu Madonna','https://cdn.kidega.com/product-images-opt/publication/97/89/75/9789753638029.png?v=2020-05-06-19',NULL,'Yazar: Sabahattin Ali\n \nYayınevi: Yapı Kredi Yayınları\n \nKimi tutkular rehberimiz olur yaşam boyunca. Kollarıyla bizi sarar. Sorgulamaktan peşlerinden gideriz ve hiç pişman olmayacağımızı biliriz. Yapıtlarında insanların görünmeyen yüzlerini ortaya çıkaran Sabahattin Ali, bu kitabında güçlü bir tutkunun resimini çiziyor. Düzenin sildiği kişiliklere, yaşamın uçuculuğuna ve aşkın olanaksızlığına dair, yanıtlanması zor sorular soruyor.\n\nSayfa Sayısı: 160\n \nBaskı Yılı: 2018',4.99,22,'Kürk Mantolu Madonna - Sabahattin Ali',3),(7,'Şeker Portakalı','https://cdn.kidega.com/product-images-opt/publication/97/89/75/9789750738609.png?v=2020-05-06-19',NULL,'Yazar: Jose Mauro de Vasconcelos\n \nYayınevi: Can Yayınları\n \nVasconcelos’un çocukluğundan derin izler taşıyan Şeker Portakalı, yaşamın beklenmedik değişimleri karşısında büyük sarsıntılar yaşayan küçük Zeze’nin başından geçenleri anlatır. Vasconcelos, tam on iki günde yazdığı bu romanı “yirmi yıldan fazla bir zaman yüreğinde taşıdığını” söyler.\n\nSayfa Sayısı: 200\n \nBaskı Yılı: 2018',15.3,34,'Şeker Portakalı - Jose Mauro de Vasconcelos',3),(8,'Simyacı','https://cdn.kidega.com/product-images-opt/publication/97/89/75/9789750726439.png?v=2020-05-06-19',NULL,'Yazar: Paulo Coelho\n \nYayınevi: Can Yayınları\n \nSimyacı, İspanya\'dan kalkıp Mısır piramitlerinin eteklerinde hazinesini aramaya giden Endülüslü çoban Santiago\'nun masalsı yaşamının öyküsü. Ama aynı zamanda bir \"nasihatname\"\n\nSayfa Sayısı: 188\n \nBaskı Yılı: 2017',17.9,16,'Simyacı - Paulo Coelho',3),(9,'Sineklerin Tanrısı','https://cdn.kidega.com/product-images-opt/publication/97/89/75/9789754582901.png?v=2020-05-06-19',NULL,'Yazar: William Golding\n \nYayınevi: İş Bankası Kültür Yayınları\n \nDünya klasikleri arasında gösterilen “Sineklerin Tanrısı”, William Golding’in en önemli eserleri arasında gösteriliyor. Nobel ödülü almasıyla ise tüm dünyada büyük üne kavuşan eser, ıssız ada yaşamını bambaşka bir yönden ele alıyor. Karakter analizlerine ve davranışlara odaklanan kitap, saf ve temiz çocukların bile aslında ne kadar vahşileşebileceklerini gözler önüne seriyor. Okuyucuları, davranışlar üzerinde düşünmeye iten bu kitapla siz de hayatta kalma mücaledesine giren çocukların derinden etkileyen hikayesiyle baş başa kalacaksınız.\n\nSayfa Sayısı: 262\n \nBaskı Yılı: 2017',9.9,8,'Sineklerin Tanrısı - William Golding',3),(10,'1984','https://i.dr.com.tr/cache/600x600-0/originals/0000000064038-1.jpg',NULL,'Yazar: George Orwell\n \nYayınevi: Can Yayınları\n \nDistopya olarak nitelendirilen George Orwell’ın bu şahane eseri, geçmişin aslında ne kadar da gelecekten izler taşıdığını ortaya koyuyor. 1948’de kaleme aldığı bu eser ile Orwell, günümüz modern dünyasına bir protesto bırakıyor. Her ne kadar kitabında 1984 yılını tasvir etse de kitabın derinliklerinde bugünden izler de bulabilmeniz mümkün.\n\nSayfa Sayısı: 352\n \nBaskı Yılı: 2017',22.9,5,'1984 - George Orwell',3),(11,'KLON','https://www.kolnkutuphane.de/Uploads/UrunResimleri/buyuk/klongeoffrey-girardkorku-gerilim-fa4c.jpg',NULL,'Yazar: Geoffrey Girard\n \nYayınevi: Panama Yayıncılık\n \nBir grup bilim adamı, yeni nesil biyolojik silah üretmek amacıyla akıl almaz bir bilimsel programa imza atarak yüzyılın en ünlü seri katillerinin DNA’larını kopyalar. Jeffrey Dahmer, Ted Bundy gibi bilinen en acımasız ölüm makinelerinin genleri, artık kopyalarında yaşamaktadır.\n\nSayfa Sayısı: 454\n \nBaskı Yılı: 2016',20.3,44,'KLON - Geoffrey Girard',4),(12,'Dan Brown Kitap Seti','https://img-trendyol.mncdn.com/Assets/ProductImages/oa/170/4314340/1/2789788615054_1_org_zoom.jpg?boutiqueId=319591','https://img-trendyol.mncdn.com/Assets/ProductImages/oa/170/4314340/1/2789788615054_1_org_zoom.jpg?boutiqueId=319591;https://kbimages1-a.akamaihd.net/0197be5e-e430-4852-8ac2-fd091201cc23/1200/1200/False/baslangc.jpg;https://i.pinimg.com/originals/73/cc/de/73ccde0b81ac64f92369e73c64b14d3f.jpg;https://www.altinkitaplar.com.tr/static/img/2013/04/kayip-sembol-tum-listelerde-1-numara-m.jpg;https://www.hepgun.com/wp-content/uploads/2018/12/da_vinci_sifresi.jpg;https://www.boyutstore.com/ProductImages/92512/original/melekler_seytanlar.jpg\n','Yazar: Dan Brown\n \nYayınevi: Altın Kitaplar\n \nBaşlangıç\nDa Vinci Şifresi\nMelekler ve Şeytanlar\nCehennem\nKayıp Sembol\n\nSayfa Sayısı: 2711\n \nBaskı Yılı: 2018',189.9,8,'Dan Brown Kitap Seti',4),(13,'Mucize Adam','https://www.kolnkutuphane.de/Uploads/UrunResimleri/buyuk/mucize-adamwilliam-r.-leibowitzkorku-ger-44b5.jpg',NULL,'Yazar: William R. Leibowitz\n \nYayınevi: Pegasus Yayınları\n \nTerk Edildi\nYüceltildi\nDışlandı\nDünyayı Değiştirdi\nYağmurlu bir gece, bir şehrin arka sokaklarında kan donduran bir suç işlenir: Bir bebek siyah bir çöp torbası içinde çöp kutusuna atılmıştır. Ama o, sıradan bir bebek değildir, insanlığın kaderini değiştirebilecek bir zekaya sahiptir.\n\nSayfa Sayısı: 440\n \nBaskı Yılı: 2018',37.9,19,'Mucize Adam - William R. Leibowitz',4),(14,'Çavdar Tarlasında Çocuklar','https://img-trendyol.mncdn.com//assets/product/media/images/20191106/11/543391/6033948/1/1_org_zoom.jpg',NULL,'Yazar: Jerome David Salinger\n \nYayınevi: Yapı Kredi Yayınları\n \nPek çok insanın hakkında konuştuğum için üzgünüm. Bildiğim tek şey; size anlattığım herkesi biraz özlüyorum. Bizim Stradlater\'i ve Ackley\'i bile sözgelimi. Sanırım o lanet Maurice\'i bile özlüyorum. Sakın kimseye birşey anlatmayın. Herkesi özlemeye başlıyorsunuz sonra. Çavdar Tarlasında çocuklar, Salinger\'in tek romanı. Ergenlik çağının içinde, yetişkin dünyanın düzenine karşı isyankar bir çocuğun, bir Noel öncesi başına gelenler.\n\nSayfa Sayısı: 198\n \nBaskı Yılı: 2017',14.3,10,'Çavdar Tarlasında Çocuklar - Jerome David Salinger',3),(15,'Anneannemin Kuyruklu Yıldızı','https://cdn03.ciceksepeti.com/cicek/kcx93008094/XL/anneannemin-kuyrukluyildizi-muzaffer-izgu-bilgi-yayinevi-1.jpeg',NULL,'Yazar: Muzaffer İzgü\n \nYayınevi: Bilgi Yayınevi\n \nBabamla bazı pazar günleri bitpazarına gideriz. Çok değil, yılda birkaç kez. Babam, orada satılan şeylerin önünde durur, uzun uzun bakar, sonra bana:\n-Kimbilir bunu kimler kullanmıştı Metin, der. Acaba yeniyken nasıldı? Sonra niçin buraya düştü?\n\nSayfa Sayısı: 110\n \nBaskı Yılı: 2011',17,29,'Anneannemin Kuyruklu Yıldızı - Muzaffer İzgü',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rating_user_id` (`user_id`),
  KEY `fk_rating_product_id` (`product_id`),
  CONSTRAINT `fk_rating_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rating_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,3,1,9),(2,3,7,8),(3,3,6,8),(4,3,9,9),(5,2,2,10),(6,2,1,10),(7,2,3,6),(8,2,4,8),(9,2,6,9),(10,2,7,10),(11,2,12,7),(12,2,15,6),(13,4,5,8),(14,4,9,7),(15,4,8,9),(16,4,6,6),(17,4,7,6),(18,4,1,10),(19,4,2,10),(20,5,14,10),(21,5,7,8),(22,5,10,8);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
  `role` int DEFAULT '555',
  `photoUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ceydakocc','$2b$10$ldGxMm2jV1m5sH3NLuX0D.5IGhwxwg1elcT01kB28pXpqySEtJsVC','ceydakocc@gmail.com','Ceyda','Koç',777,'https://pbs.twimg.com/profile_images/552958969434865664/AR4GD9LC_400x400.jpeg','local'),(2,'evren.ozlu','$2b$10$.Imqh4qaQBNqQNKtOb0NMO5XkhKIoHn0dRE4wX1UmeZKFJW/BAJ2G','evren.ozlu@ceng.deu.edu.tr','Evren','Özlü',555,'https://image.shutterstock.com/image-vector/person-gray-photo-placeholder-man-260nw-1259815156.jpg','local'),(3,'ceyda.koc','$2b$10$Dn9I7I4rKesVxKMGrDMpAeCQ2mCfxBx3ij9d4kNksr/oNLwsJYpS6','ceyda.koc@ceng.deu.edu.tr','CEYDA','KOÇ',555,'https://lh3.googleusercontent.com/a-/AOh14GiVhWEfg0193wR2sRElA6l_bM-TOlV61gwD31PJ=s96-c','social'),(4,'mustafa1955koc','$2b$10$xfV.KYGz018K409rq3HHrugU.5gzGPapY6iEo14SMZOalrYfyu6eq','mustafa1955koc@gmail.com','Mustafa','Koç',555,'https://image.shutterstock.com/image-vector/person-gray-photo-placeholder-man-260nw-1259815156.jpg','local'),(5,'samiozlu','$2b$10$Dk.p.Le4sgD29p.1CNUuheEUdzAx.3wCRiXEFDtqm5jXUe.lPGPra','samiozlu@gmail.com','Sami','Özlü',555,'https://image.shutterstock.com/image-vector/person-gray-photo-placeholder-man-260nw-1259815156.jpg','local');
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

-- Dump completed on 2020-05-31 22:38:58
