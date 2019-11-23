-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: small
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `goods_img_table`
--

DROP TABLE IF EXISTS `goods_img_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_img_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(145) COLLATE utf8_bin NOT NULL,
  `imgid` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_img_table`
--

LOCK TABLES `goods_img_table` WRITE;
/*!40000 ALTER TABLE `goods_img_table` DISABLE KEYS */;
INSERT INTO `goods_img_table` VALUES (1,'https://s11.mogucdn.com/mlcdn/776a41/191106_2ej91iibg602c8fbc777hicj3ci3f_750x1000.jpg_468x468.jpg','1'),(22,'https://s5.mogucdn.com/mlcdn/c45406/190829_5j56k32a27jijde52dl6238f269ji_640x960.jpg_468x468.jpg','1'),(23,'https://s11.mogucdn.com/mlcdn/c45406/190829_69ej20id7ad6570j4ld550a3j8463_640x960.jpg_468x468.jpg','1'),(24,'https://s5.mogucdn.com/mlcdn/c45406/190829_35c1dfh3ik0f63b38fk04533dgf3c_640x960.jpg_468x468.jpg','1'),(25,'https://s5.mogucdn.com/mlcdn/c45406/190829_3h86ej1dih0172j8e5ei3bef48817_640x960.jpg_468x468.jpg','1'),(26,'https://s5.mogucdn.com/mlcdn/c45406/190829_6f178cbge9b13e89le93bal6e4c61_650x650.jpg_750x999.jpg','1'),(27,'https://s5.mogucdn.com/mlcdn/c45406/190829_4dkf1048bgihc3g0bkd5ek0ij0918_650x650.jpg_750x999.jpg','1'),(28,'https://s5.mogucdn.com/mlcdn/c45406/190829_1dek89g7c37gf94ck9ecb6aig3gfl_650x683.jpg_750x999.jpg','1'),(29,'https://s5.mogucdn.com/mlcdn/c45406/190829_582bff54bib54g30c6ga162c9jjhf_650x650.jpg_750x999.jpg','1'),(30,'https://s5.mogucdn.com/mlcdn/c45406/190829_6ke99cchc7a84j59k7e66ijajfe12_650x650.jpg_750x999.jpg','1'),(31,'https://s5.mogucdn.com/mlcdn/c45406/190829_1adfgi8c411b6ih5fik190g0blhg6_650x650.jpg_750x999.jpg','1'),(32,'https://s5.mogucdn.com/mlcdn/c45406/191031_852hb9983bfkkeg3lg6j140afd6la_2000x2000.jpg_750x999.jpg','4'),(33,'https://s5.mogucdn.com/mlcdn/c45406/191031_6aekaj21c60lee6ecc85l1k4cg6jf_750x865.jpg_750x999.jpg','4'),(34,'https://s5.mogucdn.com/mlcdn/c45406/191031_5gh5b42c2h05k25jjj5leeaikc5ck_750x893.jpg_750x999.jpg','4'),(35,'https://s5.mogucdn.com/mlcdn/c45406/191031_71kahhkk80afdlj9agl468gcaf241_750x906.jpg_750x999.jpg','4'),(36,'https://s11.mogucdn.com/mlcdn/c45406/191031_3h7la2i14k3e5ge94172c91cbf06e_750x712.jpg_750x999.jpg','4'),(37,'https://s5.mogucdn.com/mlcdn/c45406/191031_27b0fjd2555i5j6a321h06ad9ejic_750x874.jpg_750x999.jpg','4'),(38,'https://s11.mogucdn.com/mlcdn/c45406/191031_2lc38f6g3ckj6k3c7k0elea7b266d_750x876.jpg_750x999.jpg','4'),(39,'https://s5.mogucdn.com/mlcdn/c45406/191031_4kcl92j9h03785da83f08e99cbh91_750x724.jpg_750x999.jpg','4'),(40,'https://s5.mogucdn.com/mlcdn/c45406/191031_5bh9h36dil9k3c62i9a3gdh982d91_2364x2955.jpg_750x999.jpg','4');
/*!40000 ALTER TABLE `goods_img_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-23 19:18:54
