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
-- Table structure for table `goods_table`
--

DROP TABLE IF EXISTS `goods_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_table` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `img` varchar(125) COLLATE utf8_bin NOT NULL,
  `message` longtext COLLATE utf8_bin,
  `price` double DEFAULT NULL,
  `collect` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `kind` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_table`
--

LOCK TABLES `goods_table` WRITE;
/*!40000 ALTER TABLE `goods_table` DISABLE KEYS */;
INSERT INTO `goods_table` VALUES ('1','https://s5.mogucdn.com/mlcdn/776a41/191030_3g5fc5k3djc7f27eb6d30fa328kb1_750x1125.jpg_440x587.v1cAC.40.webp','白色丝袜',66.7,77,'pop','pants'),('10','https://s5.mogucdn.com/mlcdn/776a41/191104_08bh2fba3c00e0hbl07j783g36ehf_750x1125.jpg_440x587.v1cAC.40.webp','打底裤秋季女袜',109,33,'new','pants'),('11','https://s5.mogucdn.com/mlcdn/776a41/191104_8ef9e560hj4eb6310112c73h3j25j_750x1125.jpg_440x587.v1cAC.40.webp','高腰牛仔裤',1069,332,'sell','pants'),('12','https://s5.mogucdn.com/mlcdn/776a41/191104_14c818dbfe8675b78db8ghfk6lj12_750x1125.jpg_440x587.v1cAC.40.webp','黑色宽松运动裤',169,32,'pop','pants'),('13','https://s5.mogucdn.com/mlcdn/776a41/191110_081fd366hb3l5jlgfc932i6g83bk4_750x1125.jpg_440x587.v1cAC.40.webp','秋装喇叭袖',35.1,17000,'pop','clothes'),('14','https://s5.mogucdn.com/mlcdn/776a41/191110_22hci1gh8fc0idi82kclagigef874_750x1125.jpg_440x587.v1cAC.40.webp','秋冬名媛公主裙',101,371,'sell','pants'),('15','https://s5.mogucdn.com/mlcdn/c45406/191009_26gbd9c9gii3l27l397jcal82j39c_3999x5999.jpg_440x587.v1cAC.40.webp','复古灯笼袖',79,112,'sell','clothes'),('16','https://s5.mogucdn.com/mlcdn/c45406/190805_77egh4cd5fkja11h8jba7kaaa0jdc_640x960.jpg_440x587.v1cAC.40.webp','V领显瘦毛衣',59.5,85,'pop','clothes'),('17','https://s5.mogucdn.com/mlcdn/c45406/191113_3bgg68bff55b1hgffhi00i3b0kkgk_3999x5900.jpg_440x587.v1cAC.40.webp','连帽套头毛衣',69.9,10,'new','clothes'),('18','https://s5.mogucdn.com/mlcdn/55cf19/180813_87f04jll31hl8ij9f3d0b59349c95_640x960.jpg_440x587.v1cAC.40.webp','宽松字母泡泡袖',59.5,9952,'pop','clothes'),('2','https://s5.mogucdn.com/mlcdn/776a41/191104_08d4ih63dfl7h1ggglb077a2jih08_750x1125.jpg_440x587.v1cAC.40.webp','白色裙子',128,255,'new','pants'),('3','https://s5.mogucdn.com/mlcdn/776a41/191030_635fch4eh1ei0ghce7d04gd29lgak_750x1125.jpg_440x587.v1cAC.40.webp','黑色漂亮裙子',256,376,'sell','pants'),('4','https://s5.mogucdn.com/mlcdn/776a41/191030_075hg9d288045ca35h4b23342c093_750x1125.jpg_440x587.v1cAC.40.webp','赫本小黑裙',71.14,2525,'pop','pants'),('5','https://s5.mogucdn.com/mlcdn/c45406/191029_7be58ijgibilbli09dgcehg72124j_640x960.jpg_440x587.v1cAC.40.webp','仙女韩范小白裙',109,33,'new','pants'),('6','https://s5.mogucdn.com/mlcdn/776a41/191104_1fjahe25aehc8e662i7bji8002abi_750x1125.jpg_440x587.v1cAC.40.webp','秋季法式白裙',98,494,'sell','pants'),('7','https://s5.mogucdn.com/mlcdn/776a41/191104_373i6dd9belbjg59ebhce084ceh3h_750x1125.jpg_440x587.v1cAC.40.webp','春秋螺纹灰色打底裤',28,487,'pop','pants'),('8','https://s5.mogucdn.com/mlcdn/776a41/191104_3473i6lil32h11c7jd2if9b4fah0f_750x1125.jpg_440x587.v1cAC.40.webp','黑子牛仔裤',98,876,'new','pants'),('9','https://s5.mogucdn.com/mlcdn/776a41/191104_625l8c9fhd581ace37c675ealc728_750x1125.jpg_440x587.v1cAC.40.webp','加绒牛仔裤',109,33,'sell','pants');
/*!40000 ALTER TABLE `goods_table` ENABLE KEYS */;
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
