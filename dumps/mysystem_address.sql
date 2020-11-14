CREATE DATABASE  IF NOT EXISTS `mysystem` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mysystem`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: mysystem
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `number` varchar(7) NOT NULL,
  `hood` varchar(100) NOT NULL,
  `zip_code` varchar(9) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (11,'Av. Miguel','123456','d\'Oeste','15815-342','Santa Ana','Goiás','Palaos','2020-11-02 04:32:58','2020-11-13 02:07:32'),(12,'R. Diego Cortês','888','do Sul','20512-457','Clara do Norte','Acre','Indonésia','2020-11-02 04:35:39','2020-11-02 04:35:39'),(13,'Travessa Ariadna','123456','do Norte','48604-929','Sérgio do Sul','Pernambuco','Guatemala','2020-11-02 04:38:51','2020-11-11 01:36:10'),(16,'Travessa Matias','123456','do Sul','92645-699','Jácomo do Norte','Distrito Federal','Montenegro','2020-11-02 04:45:55','2020-11-13 02:48:46'),(18,'Largo Nádia Verdugo','123456','d\'Oeste','49603-506','Batista do Norte','Rio Grande do Sul','Colômbia','2020-11-02 04:55:57','2020-11-13 02:04:11'),(22,'R. Caldeira','123456','do Norte','19817-945','Vila Alessandra do Sul','Bahia','Áustria','2020-11-02 07:56:55','2020-11-13 03:03:57'),(23,'Avenida Norma Ramires','123456','do Sul','96175-576','Verdugo do Leste','Rio de Janeiro','Equador','2020-11-02 08:09:25','2020-11-13 02:52:12'),(25,'Av. Emília Padilha','123456','do Sul','14637-923','Sanches do Norte','Distrito Federal','Coréia do Sul','2020-11-02 08:33:43','2020-11-13 12:20:21'),(28,'Avenida Benjamin Queirós','123456','do Leste','13631-855','Rocha do Leste','Sergipe','Sudão','2020-11-02 08:47:18','2020-11-11 12:24:27'),(30,'Travessa Jácomo Vega','135','d\'Oeste','16898-526','Medina do Norte','Amapá','Noruega','2020-11-02 09:00:20','2020-11-02 09:00:20'),(31,'Rua Malena Verdugo','123456','do Leste','64124-770','Santa Elias','Rondônia','Singapura','2020-11-02 09:00:27','2020-11-13 02:14:55'),(32,'Avenida Franco Vila','3','do Leste','03030-359','São Carla d\'Oeste','Goiás','França','2020-11-02 09:09:13','2020-11-02 09:09:13'),(44,'Travessa Christian','123456','do Leste','78074-774','Prado d\'Oeste','Paraná','Finlândia','2020-11-02 09:44:51','2020-11-13 02:51:42'),(45,'Av. Vitória','348','d\'Oeste','73081-911','Aragão do Norte','Pará','Paquistão','2020-11-02 09:48:02','2020-11-02 09:48:02'),(55,'Avenida de Oliveira','123456','do Sul','13319-568','Camacho do Sul','Espírito Santo','Áustria','2020-11-02 09:59:44','2020-11-13 03:07:58'),(76,'Travessa Estêvão','123456','do Leste','59686-365','Santiago d\'Oeste','Rio Grande do Sul','Singapura','2020-11-02 11:10:07','2020-11-11 12:43:43'),(81,'Av. Joana Garcia','123456','do Sul','53267-935','Valência d\'Oeste','Pernambuco','Vanuatu','2020-11-03 07:23:55','2020-11-10 11:55:39'),(82,'Largo Amélia Ferminiano','123456','d\'Oeste','55090-605','Paula d\'Oeste','Rio Grande do Sul','Arabia Saudita','2020-11-10 10:07:00','2020-11-10 11:57:00'),(86,'R. José Maia','123456','do Leste','44467-304','Rivera d\'Oeste','Rio Grande do Norte','Países Baixos','2020-11-10 11:55:39','2020-11-13 01:09:39'),(87,'R. Irene','690','do Norte','45501-632','Santa Micaela do Sul','Goiás','Antigua e Barbuda','2020-11-10 11:56:44','2020-11-10 11:56:44'),(88,'R. Andres Cruz','123456','d\'Oeste','70450-696','Vila Rebeca','Alagoas','Bósnia e Herzegovina','2020-11-10 11:56:59','2020-11-13 02:53:22'),(90,'Av. Pâmela','4','d\'Oeste','98868-717','Vila Rafael do Norte','Santa Catarina','Costa do Marfim','2020-11-11 12:00:12','2020-11-11 12:00:12'),(92,'R. Agustina Zambrano','123456','do Leste','71836-091','Soares do Sul','Alagoas','Ilhas Samoa','2020-11-11 12:15:08','2020-11-14 03:17:57'),(93,'Avenida Bezerra','706','do Leste','93585-023','Juliana do Sul','Rio Grande do Norte','Laos','2020-11-11 12:17:19','2020-11-11 12:17:19'),(94,'Rua Beatriz Benites','123456','do Sul','47716-544','Porto Dante','Pernambuco','República Dominicana','2020-11-11 12:19:00','2020-11-13 03:07:46'),(97,'Travessa Marinho','5410','do Leste','98757-588','Maia d\'Oeste','Pernambuco','São Tomé e Príncipe','2020-11-11 12:38:23','2020-11-11 12:38:23'),(98,'Avenida Ferreira','123456','do Sul','37154-974','D\'ávila d\'Oeste','Sergipe','Eslováquia','2020-11-11 12:39:13','2020-11-13 02:59:29'),(102,'Travessa José','123456','do Sul','46699-274','Mendonça do Leste','Distrito Federal','Nigéria','2020-11-11 12:45:42','2020-11-13 02:40:11'),(103,'Largo Horácio','123456','d\'Oeste','62678-083','Santa Rafael','Santa Catarina','São Vicente e as Granadinas','2020-11-11 12:45:58','2020-11-13 12:21:25'),(107,'Largo Abril','123456','do Sul','60642-031','Uchoa d\'Oeste','Alagoas','Suécia','2020-11-11 01:29:52','2020-11-12 10:34:31'),(108,'Largo Dante Dias','179','do Norte','68328-198','Santa Hernani','Rio de Janeiro','Chad','2020-11-11 01:31:25','2020-11-11 01:31:25'),(109,'Rua da Cruz','123456','do Norte','11638-529','Valdez do Leste','Rio Grande do Norte','Benin','2020-11-11 01:32:01','2020-11-12 11:20:16'),(113,'Rua Isabella','123456','d\'Oeste','39915-678','Porto Thales d\'Oeste','Mato Grosso','Santa Luzia','2020-11-11 01:36:10','2020-11-11 02:17:38'),(114,'R. Inácio Branco','123456','do Sul','66299-327','Santa Irene do Leste','Amazonas','Paraguai','2020-11-11 02:14:48','2020-11-13 02:47:04'),(116,'Av. Serra','83860','do Sul','65768-270','Brito do Leste','Rio Grande do Sul','Níger','2020-11-11 02:15:22','2020-11-11 02:15:22'),(117,'Avenida Fontes','123456','d\'Oeste','45477-211','Roque do Sul','Paraná','Vaticano','2020-11-11 02:17:38','2020-11-13 02:51:50'),(120,'Travessa Batista','123456','do Sul','77385-789','Matos d\'Oeste','Amapá','República Checa','2020-11-12 10:28:36','2020-11-12 11:18:03'),(122,'R. Santana','123456','d\'Oeste','37973-484','Aranda d\'Oeste','Pará','Espanha','2020-11-12 10:33:16','2020-11-13 12:21:01'),(123,'Avenida Júlia Mascarenhas','123456','d\'Oeste','89921-764','São Simon d\'Oeste','Sergipe','Egito','2020-11-12 10:34:30','2020-11-13 03:05:20'),(124,'R. Azevedo','123456','d\'Oeste','31741-981','Porto Silvana','Roraima','Sri Lanka','2020-11-12 10:53:20','2020-11-13 02:05:18'),(126,'Rua Valéria','7687','do Leste','44905-069','Elias do Norte','São Paulo','Tuvalu','2020-11-12 11:18:03','2020-11-12 11:18:03'),(127,'Av. Miranda Furtado','123456','do Norte','08439-198','Demian do Leste','Piauí','Haiti','2020-11-12 11:20:15','2020-11-12 11:21:19'),(129,'Travessa Ian','92955','do Leste','37961-082','Zaragoça do Norte','Paraná','Moldávia','2020-11-13 12:11:07','2020-11-13 12:11:07'),(132,'Largo Francisco','123456','do Norte','36201-815','Vicente do Sul','Goiás','Canadá','2020-11-13 12:21:00','2020-11-13 02:50:43'),(133,'R. Leandro','9','d\'Oeste','24426-531','Garcia do Norte','Acre','Barein','2020-11-13 12:21:25','2020-11-13 12:21:25'),(134,'Avenida Alma','1251','do Sul','68056-151','Lozano do Leste','Pará','Malta','2020-11-13 01:00:46','2020-11-13 01:00:46'),(135,'Avenida Alan Bezerra','123456','do Sul','18079-977','Andrea d\'Oeste','Santa Catarina','Bielorrússia','2020-11-13 01:09:39','2020-11-13 03:07:30'),(136,'Avenida Verdugo','9','do Leste','38741-105','Sales do Leste','Rondônia','Nauru','2020-11-13 01:11:52','2020-11-13 01:11:52'),(139,'Largo Demian Sepúlveda','32188','d\'Oeste','20607-746','Samanta do Sul','Ceará','Botsuana','2020-11-13 02:05:18','2020-11-13 02:05:18'),(140,'Avenida Campos','123456','do Norte','51295-598','Ivan do Leste','Mato Grosso','Bangladesh','2020-11-13 02:07:32','2020-11-14 01:48:22'),(142,'Rua Joana','611','d\'Oeste','36019-230','Ivan do Leste','Maranhão','Polônia','2020-11-13 02:14:54','2020-11-13 02:14:54'),(143,'Av. Vicente das Neves','79083','do Leste','01811-788','Norma d\'Oeste','Tocantins','Irlanda','2020-11-13 02:40:10','2020-11-13 02:40:10'),(144,'Largo Franco Marinho','777','d\'Oeste','79168-402','Mendes do Norte','Paraíba','Bósnia e Herzegovina','2020-11-13 02:47:04','2020-11-13 02:47:04'),(145,'Travessa Tomás','1','do Norte','53579-952','Dias do Sul','Sergipe','Grécia','2020-11-13 02:48:46','2020-11-13 02:48:46'),(146,'Av. Ávila','8','d\'Oeste','49525-022','Vila Bianca','São Paulo','Argentina','2020-11-13 02:49:53','2020-11-13 02:49:53'),(147,'Largo Abril Guerra','120','do Leste','04863-885','Vila Ketlin','Bahia','Reino Unido','2020-11-13 02:50:43','2020-11-13 02:50:43'),(148,'Rua Barreto','81','d\'Oeste','88188-415','Agostinho do Leste','Pará','Peru','2020-11-13 02:51:42','2020-11-13 02:51:42'),(150,'Av. Amélia','23139','do Leste','02571-636','Emiliano d\'Oeste','Amazonas','El Salvador','2020-11-13 02:52:11','2020-11-13 02:52:11'),(151,'Av. Vieira','80','do Leste','71437-130','Romero do Sul','Pernambuco','Albânia','2020-11-13 02:53:22','2020-11-13 02:53:22'),(152,'Av. Delvalle','2','do Sul','99126-478','Vila Thales','São Paulo','Mônaco','2020-11-13 02:57:05','2020-11-13 02:57:05'),(153,'R. Fábio Toledo','88','d\'Oeste','14173-929','São Tábata d\'Oeste','Pernambuco','Equador','2020-11-13 02:59:29','2020-11-13 02:59:29'),(154,'R. Roque','4955','do Sul','71465-064','Bruno d\'Oeste','Piauí','Albânia','2020-11-13 03:03:57','2020-11-13 03:03:57'),(155,'Rua Rocha','1','do Leste','48248-816','Porto Simão','Roraima','Gana','2020-11-13 03:04:53','2020-11-13 03:04:53'),(156,'Rua Samanta Ferraz','6088','do Sul','51184-149','Rodrigues do Norte','Espírito Santo','Panamá','2020-11-13 03:05:20','2020-11-13 03:05:20'),(157,'R. Micaela Reis','462','do Norte','32073-872','Gonçalves do Leste','Amazonas','Moçambique','2020-11-13 03:07:30','2020-11-13 03:07:30'),(158,'R. Ian Valentin','112','do Leste','95103-495','Natal do Sul','Alagoas','Eslovênia','2020-11-13 03:07:45','2020-11-13 03:07:45'),(159,'Largo Giovane','8','do Norte','93447-452','Lozano d\'Oeste','Bahia','Venezuela','2020-11-13 03:07:58','2020-11-13 03:07:58'),(160,'Largo das Dores','4979','do Norte','14260-516','de Aguiar do Sul','Piauí','Afeganistão','2020-11-14 01:48:21','2020-11-14 01:48:21'),(161,'Avenida Toledo','8','do Sul','70347-788','Anderson do Leste','Rondônia','Itália','2020-11-14 03:17:56','2020-11-14 03:17:56');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 13:34:00
