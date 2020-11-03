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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (8,'Largo Gomes','123456','do Sul','41841-367','Natal do Leste','São Paulo','Haiti','2020-11-02 06:35:19','2020-11-02 10:50:01'),(9,'Av. Hortência Cordeiro','744','d\'Oeste','77104-918','Maitê do Sul','São Paulo','Colômbia','2020-11-02 04:30:18','2020-11-02 04:30:18'),(10,'Travessa Dominato','43480','do Leste','04135-972','José do Sul','Amapá','Tonga','2020-11-02 04:31:57','2020-11-02 04:31:57'),(11,'Av. Miguel','123456','d\'Oeste','15815-342','Santa Ana','Goiás','Palaos','2020-11-02 04:32:58','2020-11-02 11:10:08'),(12,'R. Diego Cortês','888','do Sul','20512-457','Clara do Norte','Acre','Indonésia','2020-11-02 04:35:39','2020-11-02 04:35:39'),(13,'Travessa Ariadna','29276','do Norte','48604-929','Sérgio do Sul','Pernambuco','Guatemala','2020-11-02 04:38:51','2020-11-02 04:38:51'),(14,'Travessa Elizabeth Rios','60','do Norte','39736-043','Velasques do Norte','Amapá','Omã','2020-11-02 04:44:12','2020-11-02 04:44:12'),(15,'R. Ivana','14550','d\'Oeste','91648-389','Porto Suzana d\'Oeste','Maranhão','Honduras','2020-11-02 04:45:01','2020-11-02 04:45:01'),(16,'Travessa Matias','123456','do Sul','92645-699','Jácomo do Norte','Distrito Federal','Montenegro','2020-11-02 04:45:55','2020-11-02 11:19:48'),(17,'Travessa Luna','277','d\'Oeste','09786-545','Serrano d\'Oeste','Distrito Federal','Etiópia','2020-11-02 04:54:58','2020-11-02 04:54:58'),(18,'Largo Nádia Verdugo','032','d\'Oeste','49603-506','Batista do Norte','Rio Grande do Sul','Colômbia','2020-11-02 04:55:57','2020-11-02 04:55:57'),(19,'Largo Casanova','18171','do Norte','78181-107','Vila Luzia do Norte','São Paulo','Arabia Saudita','2020-11-02 07:52:00','2020-11-02 07:52:00'),(20,'R. Malena','85967','do Norte','52742-939','Vila Júlia do Sul','Amazonas','Guatemala','2020-11-02 07:55:35','2020-11-02 07:55:35'),(21,'Avenida Mia Brito','543','d\'Oeste','91223-678','Soto do Norte','Minas Gerais','Argélia','2020-11-02 07:56:17','2020-11-02 07:56:17'),(22,'R. Caldeira','3','do Norte','19817-945','Vila Alessandra do Sul','Bahia','Áustria','2020-11-02 07:56:55','2020-11-02 07:56:55'),(23,'Avenida Norma Ramires','6','do Sul','96175-576','Verdugo do Leste','Rio de Janeiro','Equador','2020-11-02 08:09:25','2020-11-02 08:09:25'),(24,'R. Luna','7716','d\'Oeste','52215-975','Porto Julieta','Pará','Emirados Árabes Unidos','2020-11-02 08:16:14','2020-11-02 08:16:14'),(25,'Av. Emília Padilha','15','do Sul','14637-923','Sanches do Norte','Distrito Federal','Coréia do Sul','2020-11-02 08:33:43','2020-11-02 08:33:43'),(26,'Av. Gomes','8342','do Leste','27021-076','São Diego do Sul','Distrito Federal','Marrocos','2020-11-02 08:37:48','2020-11-02 08:37:48'),(27,'Rua Ketlin Campos','198','do Norte','85023-122','Tábata do Leste','Goiás','Venezuela','2020-11-02 08:43:54','2020-11-02 08:43:54'),(28,'Avenida Benjamin Queirós','5529','do Leste','13631-855','Rocha do Leste','Sergipe','Sudão','2020-11-02 08:47:18','2020-11-02 08:47:18'),(29,'Travessa Valentin','3','do Leste','17838-213','Vila David','Rondônia','Botsuana','2020-11-02 08:53:35','2020-11-02 08:53:35'),(30,'Travessa Jácomo Vega','135','d\'Oeste','16898-526','Medina do Norte','Amapá','Noruega','2020-11-02 09:00:20','2020-11-02 09:00:20'),(31,'Rua Malena Verdugo','123456','do Leste','64124-770','Santa Elias','Rondônia','Singapura','2020-11-02 09:00:27','2020-11-02 11:16:28'),(32,'Avenida Franco Vila','3','do Leste','03030-359','São Carla d\'Oeste','Goiás','França','2020-11-02 09:09:13','2020-11-02 09:09:13'),(33,'R. Carla','2226','d\'Oeste','46184-818','Vila Madalena','Paraná','Espanha','2020-11-02 09:09:17','2020-11-02 09:09:17'),(34,'Avenida Feliciano','2886','do Norte','06842-649','São Emanuel do Sul','Maranhão','Vietnã','2020-11-02 09:09:20','2020-11-02 09:09:20'),(35,'Av. Paulo','123456','do Sul','19557-872','Vila Isabel','Mato Grosso','Fiji','2020-11-02 09:15:25','2020-11-03 07:23:55'),(36,'R. Valência','8808','do Leste','08964-753','Santa Paulina','Alagoas','Nova Guiné','2020-11-02 09:15:30','2020-11-02 09:15:30'),(37,'Rua Tessália Cervantes','61','do Norte','34272-560','Verdugo d\'Oeste','Mato Grosso','Bélgica','2020-11-02 09:15:33','2020-11-02 09:15:33'),(38,'Travessa Pablo','1','d\'Oeste','28269-345','Santa Suzana do Sul','Alagoas','Antigua e Barbuda','2020-11-02 09:25:00','2020-11-02 09:25:00'),(40,'Av. de Oliveira','31','do Sul','09478-973','Hernani do Sul','São Paulo','Uruguai','2020-11-02 09:25:05','2020-11-02 09:25:05'),(41,'Rua Soto','244','do Norte','37396-722','São Ornela do Norte','Ceará','Eslovênia','2020-11-02 09:25:06','2020-11-02 09:25:06'),(42,'Largo Julieta','48952','do Sul','33946-122','Rafaela d\'Oeste','Rio Grande do Sul','Canadá','2020-11-02 09:25:07','2020-11-02 09:25:07'),(44,'Travessa Christian','3750','do Leste','78074-774','Prado d\'Oeste','Paraná','Finlândia','2020-11-02 09:44:51','2020-11-02 09:44:51'),(45,'Av. Vitória','348','d\'Oeste','73081-911','Aragão do Norte','Pará','Paquistão','2020-11-02 09:48:02','2020-11-02 09:48:02'),(47,'Travessa Michele','0','do Sul','40715-594','Porto Alexa do Leste','Amapá','Afeganistão','2020-11-02 09:49:09','2020-11-02 09:49:09'),(48,'Av. Lucas Bittencourt','5','do Leste','31181-047','Sebastião do Sul','Pará','Botsuana','2020-11-02 09:51:48','2020-11-02 09:51:48'),(49,'Rua Carla','9286','d\'Oeste','25968-009','São Ivana do Norte','Rio de Janeiro','Uruguai','2020-11-02 09:52:16','2020-11-02 09:52:16'),(51,'Rua Fábio','20','do Leste','23907-598','Sepúlveda do Norte','Pernambuco','Afeganistão','2020-11-02 09:56:43','2020-11-02 09:56:43'),(52,'Av. Gil','5427','do Sul','44036-955','Rezende do Leste','Alagoas','Laos','2020-11-02 09:57:26','2020-11-02 09:57:26'),(53,'Av. Sandoval','123456','do Norte','31903-013','Porto Matias d\'Oeste','Pernambuco','Barbados','2020-11-02 09:57:51','2020-11-02 11:07:59'),(54,'Travessa Luana','123456','do Sul','10377-211','Jerônimo do Norte','Paraíba','Malauí','2020-11-02 09:58:17','2020-11-02 11:11:32'),(55,'Avenida de Oliveira','5822','do Sul','13319-568','Camacho do Sul','Espírito Santo','Áustria','2020-11-02 09:59:44','2020-11-02 09:59:44'),(56,'Largo Alonso Rodrigues','277','d\'Oeste','94554-921','Serra do Sul','Santa Catarina','Bulgária','2020-11-02 10:00:13','2020-11-02 10:00:13'),(57,'Av. Esteves','43364','d\'Oeste','72064-283','Porto José','Alagoas','Luxemburgo','2020-11-02 10:01:10','2020-11-02 10:01:10'),(58,'Largo Violeta','78839','d\'Oeste','07610-864','Ian d\'Oeste','Espírito Santo','Eritrea','2020-11-02 10:02:00','2020-11-02 10:02:00'),(59,'R. Padrão','15','do Sul','25751-742','Vega do Norte','Maranhão','Quirguistão','2020-11-02 10:04:14','2020-11-02 10:04:14'),(60,'Travessa Luana','1639','do Sul','89441-314','Porto Samuel do Norte','Espírito Santo','Chad','2020-11-02 10:07:00','2020-11-02 10:07:00'),(61,'R. Samuel','045','do Leste','82913-714','Porto Aaron','Pará','Vaticano','2020-11-02 10:34:45','2020-11-02 10:34:45'),(62,'Av. Espinoza','288','do Leste','79328-751','Santa Jasmin d\'Oeste','Bahia','Chile','2020-11-02 10:38:07','2020-11-02 10:38:07'),(63,'Largo Ian','123456','do Sul','56065-249','São Francisco','Roraima','Togo','2020-11-02 10:40:31','2020-11-02 11:04:08'),(64,'Travessa Uchoa','18','do Leste','08812-856','São Alexa do Leste','Pará','Croácia','2020-11-02 10:41:41','2020-11-02 10:41:41'),(66,'Travessa Josefina','058','do Sul','50040-273','Porto Olívia','Alagoas','Gâmbia','2020-11-02 10:48:03','2020-11-02 10:48:03'),(67,'Travessa Caldeira','28223','do Norte','85677-394','Estrada do Sul','Rio Grande do Norte','Malásia','2020-11-02 10:49:15','2020-11-02 10:49:15'),(68,'Largo Amélia','80','d\'Oeste','50673-810','Santa Ketlin','Rondônia','Benin','2020-11-02 10:50:00','2020-11-02 10:50:00'),(69,'Largo Luara Dias','4','do Norte','95165-144','Ortega do Norte','Maranhão','Estônia','2020-11-02 10:52:02','2020-11-02 10:52:02'),(70,'Travessa Josefina Bezerra','32222','do Sul','34363-715','Demian do Norte','Paraná','Turquia','2020-11-02 10:54:39','2020-11-02 10:54:39'),(71,'Avenida Sara Mendes','34','d\'Oeste','14662-696','Cristóvão do Norte','Piauí','Madagascar','2020-11-02 11:03:32','2020-11-02 11:03:32'),(72,'Avenida Felipe Aragão','123456','do Norte','97231-265','Camacho do Leste','Amazonas','Suécia','2020-11-02 11:04:07','2020-11-02 11:08:32'),(73,'Largo Irene','24','d\'Oeste','34747-965','Vila Renata do Leste','Rondônia','Polônia','2020-11-02 11:06:47','2020-11-02 11:06:47'),(74,'Rua Benjamin','295','do Norte','65525-256','Vila Luana','Ceará','Nigéria','2020-11-02 11:07:59','2020-11-02 11:07:59'),(75,'Av. Evandro Urias','504','do Sul','73214-479','São Emanuel','Rio Grande do Sul','Croácia','2020-11-02 11:08:32','2020-11-02 11:08:32'),(76,'Travessa Estêvão','890','do Leste','59686-365','Santiago d\'Oeste','Rio Grande do Sul','Singapura','2020-11-02 11:10:07','2020-11-02 11:10:07'),(78,'Largo David','20045','d\'Oeste','23483-478','Cervantes do Sul','Paraná','Antigua e Barbuda','2020-11-02 11:16:28','2020-11-02 11:16:28'),(79,'Travessa Leandro das Dores','50','do Norte','88706-321','Mendonça d\'Oeste','Acre','Níger','2020-11-02 11:18:38','2020-11-02 11:18:38'),(80,'Largo Christian','7','d\'Oeste','78032-269','Vila Antonieta do Norte','Amazonas','Arabia Saudita','2020-11-02 11:19:48','2020-11-02 11:19:48'),(81,'Av. Joana Garcia','844','do Sul','53267-935','Valência d\'Oeste','Pernambuco','Vanuatu','2020-11-03 07:23:55','2020-11-03 07:23:55');
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

-- Dump completed on 2020-11-03  7:40:32
