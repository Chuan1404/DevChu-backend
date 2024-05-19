-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: file_system
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_commnet_file` (`file_id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_commnet_file` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_id` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorite_user` (`user_id`),
  KEY `FKeov6qv86vhcyhban111gqgeg8` (`file_id`),
  CONSTRAINT `fk_favorite_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKeov6qv86vhcyhban111gqgeg8` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_seq`
--

DROP TABLE IF EXISTS `favorite_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_seq`
--

LOCK TABLES `favorite_seq` WRITE;
/*!40000 ALTER TABLE `favorite_seq` DISABLE KEYS */;
INSERT INTO `favorite_seq` VALUES (1);
/*!40000 ALTER TABLE `favorite_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `root` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `high` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `type` enum('JPEG','PNG') DEFAULT NULL,
  `size` bigint NOT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_user` (`user_id`),
  CONSTRAINT `fk_file_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,100000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/cat-636172.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134222156_1716134221919_cat-636172.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134230572_1716134230165_cat-636172.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134234002_cat-636172.jpg','JPEG',2566625,4272,2848,'fddc6bc9-3636-429f-abd2-e2b2920833b0','cat 1'),(2,200000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/cat-1853372.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134229694_1716134229417_cat-1853372.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134234611_1716134234179_cat-1853372.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134238185_cat-1853372.jpg','JPEG',3722424,4272,2848,'fddc6bc9-3636-429f-abd2-e2b2920833b0','cat 2'),(3,300000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/cat-2448839.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134249372_1716134249139_cat-2448839.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134254442_1716134254093_cat-2448839.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134264541_cat-2448839.jpg','JPEG',1314349,3456,5184,'fddc6bc9-3636-429f-abd2-e2b2920833b0','cat 3 '),(4,500000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/cat-8130334%20-%20Copy.png','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134235409_1716134234889_cat-8130334%20-%20Copy.png','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134248795_1716134248035_cat-8130334%20-%20Copy.png','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134255768_cat-8130334%20-%20Copy.png','PNG',2219887,6000,4000,'fddc6bc9-3636-429f-abd2-e2b2920833b0','cat 4'),(5,200000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/IMG_4743.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134254678_1716134254437_IMG_4743.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134274427_1716134271439_IMG_4743.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134287441_IMG_4743.jpg','JPEG',18101866,6000,4000,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Girl 1'),(6,300000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/iguana-8283668.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134274840_1716134274597_iguana-8283668.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134286438_1716134286012_iguana-8283668.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134293180_iguana-8283668.jpg','JPEG',9165732,5219,3724,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Iguana'),(7,300000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/wren-8233065.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134288315_1716134288104_wren-8233065.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134293771_1716134293449_wren-8233065.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134298411_wren-8233065.jpg','JPEG',788805,3404,2069,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Bird'),(8,500000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/donkey-cart-8269449.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134289793_1716134289537_donkey-cart-8269449.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134294751_1716134294377_donkey-cart-8269449.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134299116_donkey-cart-8269449.jpg','JPEG',4318964,4222,2815,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Oxcart'),(9,200000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/river-8279466.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134299423_1716134299209_river-8279466.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134311469_1716134311021_river-8279466.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134325778_river-8279466.jpg','JPEG',4987386,5568,3632,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Valley'),(10,200000,_binary '','https://devchu-filesell-private.s3.ap-southeast-1.amazonaws.com/images/root/pumpkins-8287968.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/medium/1716134313357_1716134312645_pumpkins-8287968.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/high/1716134327171_1716134326792_pumpkins-8287968.jpg','https://devchu-filesell-public.s3.ap-southeast-1.amazonaws.com/images/display/1716134338014_pumpkins-8287968.jpg','JPEG',2725986,5967,3731,'fddc6bc9-3636-429f-abd2-e2b2920833b0','Squash');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_tag`
--

DROP TABLE IF EXISTS `file_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `probs` double NOT NULL,
  `file_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKplqieta0s10ytcjh5lwx3uobh` (`file_id`),
  KEY `FK6d156ft7cdh7b90w5qrqnrgkc` (`tag_id`),
  CONSTRAINT `FK6d156ft7cdh7b90w5qrqnrgkc` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `FKplqieta0s10ytcjh5lwx3uobh` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_tag`
--

LOCK TABLES `file_tag` WRITE;
/*!40000 ALTER TABLE `file_tag` DISABLE KEYS */;
INSERT INTO `file_tag` VALUES (1,0.43,1,2),(2,0.17,1,1),(3,0.76,2,2),(4,0.25,2,3),(5,0.95,3,4),(6,0.24,3,5),(7,0.64,4,2),(8,1,4,7),(9,0.27,4,6),(10,0.77,5,8),(11,0.21,5,9),(12,0.24,5,5),(13,0.99,6,10),(14,0.25,6,11),(15,0.4,7,13),(16,1,7,16),(17,0.22,7,14),(18,0.24,7,15),(19,0.2,7,12),(20,0.4,8,17),(21,0.18,8,18),(22,0.94,9,20),(23,0.18,9,19),(24,0.55,10,21),(25,0.26,10,22);
/*!40000 ALTER TABLE `file_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` double DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `method` enum('MOMO') DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `momo_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_receipt_user` (`user_id`),
  CONSTRAINT `fk_receipt_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_file`
--

DROP TABLE IF EXISTS `receipt_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_file` (
  `receipt_id` int NOT NULL,
  `file_id` int NOT NULL,
  PRIMARY KEY (`receipt_id`,`file_id`),
  KEY `FKbkls8cf78ppbw3ief32rd2hv0` (`file_id`),
  CONSTRAINT `FKbkls8cf78ppbw3ief32rd2hv0` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKm7ndby680mar3jn7ax5xmiots` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_file`
--

LOCK TABLES `receipt_file` WRITE;
/*!40000 ALTER TABLE `receipt_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `expire_date` datetime(6) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_token_user` (`user_id`),
  CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (1,'8fba2405-e7a3-404a-9011-d48b12d58f3c','2024-05-20 00:30:06.587937','fddc6bc9-3636-429f-abd2-e2b2920833b0');
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('ROLE_ADMIN','ROLE_CUSTOMER','ROLE_EDITOR') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_CUSTOMER'),(3,'ROLE_EDITOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'wood brown'),(2,'tabby'),(3,'black'),(4,'egyptian_cat'),(5,'smoky black'),(6,'grullo'),(7,'cat'),(8,'flute'),(9,'licorice'),(10,'common_iguana'),(11,'outer space'),(12,'dark gray'),(13,'water_ouzel'),(14,'ash grey'),(15,'pale silver'),(16,'bird'),(17,'oxcart'),(18,'gainsboro'),(19,'rifle green'),(20,'valley'),(21,'spaghetti_squash'),(22,'carrot orange');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_right`
--

DROP TABLE IF EXISTS `usage_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_right` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_id` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expire_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_right_user` (`user_id`),
  KEY `fk_right_file` (`file_id`),
  CONSTRAINT `fk_right_file` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `fk_right_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_right`
--

LOCK TABLES `usage_right` WRITE;
/*!40000 ALTER TABLE `usage_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` enum('BANNED','UNVERIFIED','VERIFIED') DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('fddc6bc9-3636-429f-abd2-e2b2920833b0','admin@gmail.com','$2a$10$KgLDv2F3sopQAmrnRipWke4QQ4IceQyB8ayc2u7k6uw4qmqmYmr0O',NULL,'ADMINISTRATOR','VERIFIED','2024-05-19 22:48:38.510067');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('fddc6bc9-3636-429f-abd2-e2b2920833b0','ROLE_ADMIN');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_code`
--

DROP TABLE IF EXISTS `verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_code_user` (`user_id`),
  CONSTRAINT `fk_code_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_code`
--

LOCK TABLES `verification_code` WRITE;
/*!40000 ALTER TABLE `verification_code` DISABLE KEYS */;
INSERT INTO `verification_code` VALUES (1,'70267dfe-3b7a-421f-b2c1-c3c4fba2ecfc','fddc6bc9-3636-429f-abd2-e2b2920833b0');
/*!40000 ALTER TABLE `verification_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:14:18
