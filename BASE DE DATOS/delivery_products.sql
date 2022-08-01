-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `id_category` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Helado de Chocolate ','Helado Artesanal sabor Chocolate con con chispas de chocolate ',45,'https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658217284771?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658217285353?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658217285576?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b',2,'2022-07-19 07:54:45','2022-07-19 07:54:46'),(2,'Helado de Fresa ','3 bolas de Helado de fresa ',45,'https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658218743120?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658218743475?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658218743705?alt=media&token=74a8dbe8-32c5-4c8b-af13-7ec8babb4e9b',2,'2022-07-19 08:19:03','2022-07-19 08:19:04'),(3,'Limonada','1L de bebida refrescante elaborada con agua natural o mineral, azúcar y jugo de limón',20,'https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658473667932?alt=media&token=9ea24317-87d8-45f0-b1c9-6222168cceff','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658473669392?alt=media&token=9ea24317-87d8-45f0-b1c9-6222168cceff','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658473669745?alt=media&token=9ea24317-87d8-45f0-b1c9-6222168cceff',1,'2022-07-22 07:07:48','2022-07-22 07:07:50'),(4,'Hamburguesas de Pollo','hamburguesas ',45,'https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658511834304?alt=media&token=4f09ad3f-5a74-4e53-bb88-ae47b5edc734','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658511835081?alt=media&token=4f09ad3f-5a74-4e53-bb88-ae47b5edc734','https://firebasestorage.googleapis.com/v0/b/delivery-e5e9e.appspot.com/o/image_1658511835373?alt=media&token=4f09ad3f-5a74-4e53-bb88-ae47b5edc734',11,'2022-07-22 17:43:54','2022-07-22 17:43:56');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-22 15:45:03
