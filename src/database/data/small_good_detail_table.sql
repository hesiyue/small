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
-- Table structure for table `good_detail_table`
--

DROP TABLE IF EXISTS `good_detail_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `good_detail_table` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `title` longtext COLLATE utf8_bin,
  `oldprice` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `desc` longtext COLLATE utf8_bin,
  `img` varchar(185) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_detail_table`
--

LOCK TABLES `good_detail_table` WRITE;
/*!40000 ALTER TABLE `good_detail_table` DISABLE KEYS */;
INSERT INTO `good_detail_table` VALUES ('1','秋季新款法式复古中长款系绳收腰针织连衣裙宽松显廋打底毛衣裙子',155,109,'仙女穿的裙子哇','https://s11.mogucdn.com/mlcdn/776a41/191106_2ej91iibg602c8fbc777hicj3ci3f_750x1000.jpg_468x468.jpg'),('4','赫本气质范斜拉链装饰收腰短款小黑裙纯色显瘦长袖A字连衣裙',118.58,71.14,'时尚百搭','https://s5.mogucdn.com/mlcdn/c45406/191031_852hb9983bfkkeg3lg6j140afd6la_2000x2000.jpg_750x999.jpg');
/*!40000 ALTER TABLE `good_detail_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-23 19:18:55
