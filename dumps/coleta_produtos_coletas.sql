-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: coleta_produtos
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `coletas`
--

DROP TABLE IF EXISTS `coletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coletas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `cpf_number` varchar(16) DEFAULT NULL,
  `address` varchar(145) DEFAULT NULL,
  `address_number` varchar(15) DEFAULT NULL,
  `address_cep` varchar(25) DEFAULT NULL,
  `ntfsc_name` varchar(50) DEFAULT NULL,
  `ntfsc_number` varchar(25) DEFAULT NULL,
  `os_number` varchar(25) DEFAULT NULL,
  `ntfsc_dev_number` varchar(25) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `textarea1` varchar(255) DEFAULT NULL,
  `textarea2` varchar(255) DEFAULT NULL,
  `images` varchar(355) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coletas`
--

LOCK TABLES `coletas` WRITE;
/*!40000 ALTER TABLE `coletas` DISABLE KEYS */;
INSERT INTO `coletas` VALUES (1,NULL,'Rodrigo Alves Guerra',NULL,NULL,NULL,NULL,NULL,'Gilberto Antonio Alves Guerra','123.456.789',NULL,NULL,NULL,'LEgal','muito bem','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','init','2020-02-20 00:29:20','2020-02-20 00:29:20'),(2,16,'Rodrigo Alves Guerra','41998446368','085.163.449-40','Rua Amazonas','396','83404400','Rodrigo Alves Guerra','123.456.789','123.456.789','123.123.123','Muito bom','LEgal','muito bem','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 00:37:55','2020-02-27 22:36:10'),(3,16,'Leandro Alberto Guerra','41998446368','08516344940','Rua Amazonas','396','83404400','Rodrigo Alves Guerra','123.445.678','122.123.448','123.456.789','Olá Mundo','Ola tudo bem','Muito Legal','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 21:51:43','2020-02-27 22:25:20'),(4,NULL,'Leandro Alberto Guerra',NULL,NULL,NULL,NULL,NULL,'Gilberto Antonio Alves Guerra','123.445.678',NULL,NULL,NULL,'Ola tudo bem','Muito Legal','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','init','2020-02-20 21:52:14','2020-02-20 21:52:14'),(5,16,'Leandro Alberto Guerra','41998446368','08516344940','Rua Amazonas','368','83404400','Rodrigo Alves Guerra','123.445.678','122.123.448','123.123.123','Muito legal','Ola tudo bem','Muito Legal','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 21:52:24','2020-02-27 22:30:54'),(6,NULL,'Leandro Alberto Guerra',NULL,NULL,NULL,NULL,NULL,'Gilberto Antonio Alves Guerra','123.445.678',NULL,NULL,NULL,'Ola tudo bem','Muito Legal','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','init','2020-02-20 21:54:18','2020-02-20 21:54:18'),(7,NULL,'Rodrigo Alves Guerra',NULL,NULL,NULL,NULL,NULL,'Gilberto Antonio Alves Guerra','113.154.879',NULL,NULL,NULL,'Legal','Muito bemm','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','init','2020-02-20 22:02:48','2020-02-20 22:02:48'),(8,NULL,'Rodrigo Alves Guerra',NULL,NULL,NULL,NULL,NULL,'Gilberto Antonio Alves Guerra','113.154.879',NULL,NULL,NULL,'Legal','Muito bemm','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','init','2020-02-20 22:06:41','2020-02-20 22:06:41'),(9,16,'Felipe Alves Guerra','4198446368','08516344940','Rua Amazonas','41998446368','83404400','Rodrigo Alves Guerra','122.345.678','122.123.448','123.456.789','asdasd','Olá mundo','Muito Bem!','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 22:13:06','2020-02-27 01:10:48'),(10,16,'Felipe Alves Guerra','41998446368','08516344944','Rua Amazonas','396','8340440','Rodrigo Alves Guerra','122.345.678','123.456.789','123.123.123','Legal','Olá mundo','Muito Bem!','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 22:14:51','2020-02-27 00:45:52'),(11,16,'Maldito ninja ','41984463668','08516344940','Rua Amazonas','41998446368','83404400','Rodrigo Alves Guerra','123.131.231','123.456.789','123.123.123','Muito legal','Olá mundo !','muito bem','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-20 22:50:49','2020-02-27 00:54:11'),(12,16,'Karen Camargo ','41998446368','08516344940','Rua Amazonas','41998446368','83404400','Rodrigo Alves Guerra','744.456.444','122.123.448','123.456.789','fodasse','Olá mundo \"','Atualiza agora !','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-22 16:56:12','2020-02-27 01:07:32'),(13,16,'Karen Camargo ','4199846368','08516344940','Rua Amazonas','41998446368','83404400','Rodrigo Alves Guerra','744.456.444','123.456.789','123.456.789','Muito legal','Olá mundo \"','Atualiza agora !','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-22 16:58:22','2020-02-27 00:59:46'),(14,11,'Karen Camargo ','41998446368','08516344940','Rua Amazonas','41998446368','83404400','Rodrigo Alves Guerra','744.456.444','213131231','123.123.123','fodasse','Olá mundo \"','Atualiza agora !','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-22 16:59:46','2020-02-27 01:16:06'),(15,16,'Karen Camargo ','41998446368','08516344940','Rua Amazonas','396','83404400','Rodrigo Alves Guerra','744.456.444','123.456.789','123.123.123','Novo','Olá mundo \"','Atualiza agora !','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-22 17:02:54','2020-02-26 22:19:18'),(16,16,'Karen Camargo 11','41998446368','08516344940','Rua Amazonas','396','83404400','Rodrigo Alves Guerra','744.456.444','123.456.789','123.123.123','Isso','Olá mundo \"','Atualiza agora !','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-22 17:05:48','2020-02-27 21:55:31'),(17,11,'Rodrigo Alves Guerra','4198446368','085.163.449-40','Rua Amazonas','396','8340440','Gilberto Antonio Alves Guerra','123.456.789','123.456.789','123.123.123','Sistema','Olá mundo!','Olá mundo','[\"5e5556b41d80b.png\",\"5e5556b41dbb0.png\",\"5e5556b41e460.png\",\"5e5556b41e808.png\",\"5e5556b41ee8e.png\",\"5e5556b41f31a.png\",\"5e5556b41f60e.png\",\"5e5556b41fabd.png\",\"5e5556b41fe7f.png\",\"5e5556b420cbd.png\",\"5e5556b4214bc.png\",\"5e5556b421c09.png\",\"5e5556b4222dc.png\",\"5e5556b422498.png\",\"5e5556b422913.png\",\"5e5556b422b5c.png\"]','received','2020-02-25 14:17:40','2020-02-26 20:54:18');
/*!40000 ALTER TABLE `coletas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-28 19:56:53
