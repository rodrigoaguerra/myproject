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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `doc` varchar(18) NOT NULL,
  `birthdate` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `ie` varchar(12) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dumping data for table `customers`
--
LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (6,1,'Maximiano Diego Rezende (edit)  (edit)  (edit)  (edit)  (edit)  (edit)  (edit)  (edit) ','testcustomer@hotmail.com','41.790.847/0001-02','1997-12-01','8','(98) 95528-1633','','2020-11-02 06:35:19','2020-11-02 10:50:01'),(7,1,'Sr. Christopher Dominato Guerra','tais49@romero.com','46.707.985/0001-90','2019-10-23','9','(42) 92065-9165',NULL,'2020-11-02 04:30:18','2020-11-02 04:30:18'),(8,1,'Sr. Dante Thales Gomes Sobrinho','jasmin.rico@uol.com.br','86.503.753/0001-35','1928-04-10','10','(32) 95617-6020',NULL,'2020-11-02 04:31:57','2020-11-02 04:31:57'),(9,1,' Cliente Editado (edit)','testcustomer@hotmail.com','91.150.838/0001-17','1985-07-11','11','(79) 97480-7565','','2020-11-02 04:32:58','2020-11-02 11:10:08'),(10,1,'Sr. Ziraldo Valentin Neto','carla.benites@mares.com','83.115.441/0001-66','2018-09-10','12','(55) 93460-7155',NULL,'2020-11-02 04:35:39','2020-11-02 04:35:39'),(11,1,'Guilherme Zamana das Dores','constancia.darosa@darosa.org','51.374.530/0001-30','1936-05-14','13','(22) 90783-7357',NULL,'2020-11-02 04:38:51','2020-11-02 04:38:51'),(12,1,'Hugo Giovane Faria','santiago.fabiana@grego.com','78.060.803/0001-29','1972-12-09','14','(98) 92635-8841',NULL,'2020-11-02 04:44:12','2020-11-02 04:44:12'),(13,1,'Nicole Santiago Neto','dominato.sofia@estrada.net','05.159.307/0001-53','1932-06-20','15','(38) 95680-5818',NULL,'2020-11-02 04:45:01','2020-11-02 04:45:01'),(14,1,' Cliente Editado (edit)','testcustomer@hotmail.com','08.678.710/0001-87','2010-12-10','16','(33) 97728-3233','','2020-11-02 04:45:55','2020-11-02 11:19:48'),(15,1,'Dr. Adriana Vega Ortiz Neto','guilherme51@r7.com','44.208.233/0001-50','1974-06-24','17','(71) 98863-2980',NULL,'2020-11-02 04:54:58','2020-11-02 04:54:58'),(16,1,'Dr. Vicente Hugo Paes Sobrinho','thales.marinho@terra.com.br','38.541.941/0001-05','1951-05-22','18','(19) 91098-6024',NULL,'2020-11-02 04:55:57','2020-11-02 04:55:57'),(17,1,' Cliente Editado (edit)','testcustomer@hotmail.com','42.560.679/0001-13','1961-02-16','19','(69) 94882-3937','','2020-11-02 07:52:00','2020-11-02 11:18:38'),(18,1,'Sr. Daniel Romero','xsoares@ig.com.br','49.510.951/0001-08','1963-05-12','20','(27) 90217-0799',NULL,'2020-11-02 07:55:35','2020-11-02 07:55:35'),(19,1,'Sra. Allison Luzia Martines','leonardo11@gmail.com','36.692.019/0001-93','1934-08-29','21','(44) 95228-7426',NULL,'2020-11-02 07:56:17','2020-11-02 07:56:17'),(20,1,'Srta. Paulina Camacho','paulo87@gmail.com','21.461.425/0001-78','1922-09-30','22','(53) 99756-2130',NULL,'2020-11-02 07:56:55','2020-11-02 07:56:55'),(21,1,'Diego das Dores Sobrinho','roque.maximo@dasdores.net','28.584.655/0001-73','1994-12-31','23','(93) 90634-6930',NULL,'2020-11-02 08:09:25','2020-11-02 08:09:25'),(22,1,'Srta. Melissa Rafaela Pena Filho','isabella00@dacruz.com.br','18.924.747/0001-00','1958-04-27','24','(87) 94011-8084',NULL,'2020-11-02 08:16:14','2020-11-02 08:16:14'),(23,1,'Dr. Ariana Cordeiro Leon','diego77@teles.com.br','20.381.841/0001-01','1972-11-14','25','(68) 93744-0965',NULL,'2020-11-02 08:33:43','2020-11-02 08:33:43'),(24,1,'Sr. Teobaldo Bezerra','carmona.jorge@hotmail.com','18.954.124/0001-71','1949-12-03','26','(99) 95524-1251',NULL,'2020-11-02 08:37:48','2020-11-02 08:37:48'),(25,1,'Luzia das Dores Fontes Jr.','garcia.abril@dias.com','19.198.794/0001-78','1997-03-13','27','(15) 96371-3509',NULL,'2020-11-02 08:43:54','2020-11-02 08:43:54'),(26,1,'Elias Casanova Maldonado','gabriela.verdara@espinoza.net.br','91.495.746/0001-79','2013-02-19','28','(28) 93049-4150',NULL,'2020-11-02 08:47:18','2020-11-02 08:47:18'),(27,1,'Abril Soares','ramires.rafael@uol.com.br','58.638.674/0001-04','2004-08-24','29','(49) 91045-9049',NULL,'2020-11-02 08:53:35','2020-11-02 08:53:35'),(28,1,'Luis Molina Pena Sobrinho','ramos.emilia@dasneves.com.br','05.247.539/0001-63','2017-09-17','30','(27) 92207-9960',NULL,'2020-11-02 09:00:20','2020-11-02 09:00:20'),(29,1,' Cliente Editado (edit)','testcustomer@hotmail.com','81.266.406/0001-12','1947-08-31','31','(95) 94602-9011','','2020-11-02 09:00:27','2020-11-02 11:16:28'),(30,1,'Ashley Juliana Mendes','zsoto@gmail.com','05.529.391/0001-50','1950-02-04','32','(51) 92349-3918',NULL,'2020-11-02 09:09:13','2020-11-02 09:09:13'),(31,1,'Manuela Esteves','leandro70@molina.net.br','34.295.738/0001-45','1930-04-09','33','(75) 97817-4271',NULL,'2020-11-02 09:09:17','2020-11-02 09:09:17'),(32,1,'Emanuel Madeira Cruz','montenegro.carla@delatorre.br','17.995.862/0001-02','1972-12-04','34','(19) 90459-3913',NULL,'2020-11-02 09:09:20','2020-11-02 09:09:20'),(33,1,' Cliente Editado (edit)','testcustomer@hotmail.com','63.352.631/0001-90','1922-07-25','35','(18) 94371-8132','','2020-11-02 09:15:25','2020-11-03 07:23:55'),(34,1,'Catarina Solano','marinho.maite@matias.com','27.840.031/0001-07','1982-08-28','36','(15) 94459-8574',NULL,'2020-11-02 09:15:30','2020-11-02 09:15:30'),(35,1,'Luzia Fontes Barreto Neto','adriana.desouza@yahoo.com','22.669.533/0001-01','1942-11-30','37','(86) 92358-7331',NULL,'2020-11-02 09:15:33','2020-11-02 09:15:33'),(36,1,'Alexa Caldeira','tmatos@terra.com.br','36.709.558/0001-98','2013-09-18','38','(35) 90984-3865',NULL,'2020-11-02 09:25:00','2020-11-02 09:25:00'),(38,1,'Sr. Leonardo Andres Montenegro Sobrinho','sleal@abreu.org','26.505.486/0001-03','1940-04-23','40','(16) 96809-7443',NULL,'2020-11-02 09:25:05','2020-11-02 09:25:05'),(39,1,'Dr. João Medina Sobrinho','teobaldo.camacho@gmail.com','59.968.131/0001-00','1942-09-30','41','(37) 99662-9332',NULL,'2020-11-02 09:25:06','2020-11-02 09:25:06'),(40,1,'Emílio Gustavo Quintana Jr.','zmedina@yahoo.com','17.085.428/0001-87','1965-03-12','42','(21) 94291-4871',NULL,'2020-11-02 09:25:07','2020-11-02 09:25:07'),(42,1,'Gustavo Pereira Maldonado Sobrinho','fabio61@ig.com.br','92.135.961/0001-21','1934-04-01','44','(49) 94231-1690',NULL,'2020-11-02 09:44:51','2020-11-02 09:44:51'),(43,1,'Matias Espinoza','ariana77@yahoo.com','09.603.761/0001-02','1929-11-18','45','(47) 93305-4182',NULL,'2020-11-02 09:48:02','2020-11-02 09:48:02'),(45,1,'Dr. Elizabeth Salgado','alonso.pena@branco.net.br','73.769.688/0001-42','2007-09-19','47','(31) 92928-6749',NULL,'2020-11-02 09:49:09','2020-11-02 09:49:09'),(46,1,'Sr. Jerônimo Pacheco','delatorre.luana@ig.com.br','76.216.735/0001-19','1927-05-09','48','(86) 99559-4123',NULL,'2020-11-02 09:51:48','2020-11-02 09:51:48'),(47,1,'Maximiano Prado Chaves','aurias@velasques.net','50.746.120/0001-00','1925-04-10','49','(19) 95559-2825',NULL,'2020-11-02 09:52:16','2020-11-02 09:52:16'),(49,1,'Malena Oliveira Delatorre','andrea94@valentin.com.br','28.603.333/0001-24','1997-04-02','51','(61) 99735-8850',NULL,'2020-11-02 09:56:43','2020-11-02 09:56:43'),(50,1,'Henrique Evandro Gomes Sobrinho','matos.mario@terra.com.br','17.369.426/0001-10','1946-07-18','52','(43) 91969-3445',NULL,'2020-11-02 09:57:26','2020-11-02 09:57:26'),(51,1,' Cliente Editado (edit)','testcustomer@hotmail.com','17.543.023/0001-45','2004-05-02','53','(42) 97591-9560','','2020-11-02 09:57:51','2020-11-02 11:07:59'),(52,1,' Cliente Editado (edit)','testcustomer@hotmail.com','00.192.478/0001-60','1941-10-27','54','(41) 95659-5846','','2020-11-02 09:58:17','2020-11-02 11:11:32'),(53,1,'Srta. Agustina Carla Benites','cabreu@terra.com.br','28.285.779/0001-58','1954-06-22','55','(66) 96173-5782',NULL,'2020-11-02 09:59:44','2020-11-02 09:59:44'),(54,1,'Christopher Soares','cruz.gustavo@burgos.com','94.673.051/0001-28','2006-07-31','56','(88) 98939-6018',NULL,'2020-11-02 10:00:13','2020-11-02 10:00:13'),(55,1,'Srta. Valéria Prado Chaves Jr.','michele38@beltrao.com','52.707.863/0001-05','1926-06-24','57','(97) 98445-0129',NULL,'2020-11-02 10:01:10','2020-11-02 10:01:10'),(56,1,'Gabriel Branco Furtado Jr.','rafaela.ferreira@davila.com','13.061.923/0001-03','1999-07-02','58','(38) 90467-5992',NULL,'2020-11-02 10:02:00','2020-11-02 10:02:00'),(57,1,'Salomé de Aguiar Quintana','jeronimo11@fontes.net.br','62.316.575/0001-75','2003-11-01','59','(31) 96778-4917',NULL,'2020-11-02 10:04:14','2020-11-02 10:04:14'),(58,1,'Sra. Hortência Fidalgo Furtado','ornela.galindo@ferreira.br','51.636.438/0001-00','1988-06-03','60','(91) 97245-1909',NULL,'2020-11-02 10:07:00','2020-11-02 10:07:00'),(59,1,'Dr. Emílio D\'ávila Soto','deoliveira.sofia@uol.com.br','15.449.920/0001-69','1996-11-21','61','(62) 97160-6250',NULL,'2020-11-02 10:34:45','2020-11-02 10:34:45'),(60,1,'Malena Sales Ferreira','clara.garcia@velasques.com','78.122.206/0001-81','2009-06-05','62','(42) 98862-6660',NULL,'2020-11-02 10:38:07','2020-11-02 10:38:07'),(61,1,' Cliente Editado (edit)','testcustomer@hotmail.com','15.443.094/0001-40','1958-12-06','63','(61) 99473-3863','','2020-11-02 10:40:31','2020-11-02 11:04:08'),(62,1,'Luciana Domingues Escobar Sobrinho','tdasneves@fernandes.br','59.486.545/0001-00','2016-05-07','64','(54) 90363-5596',NULL,'2020-11-02 10:41:41','2020-11-02 10:41:41'),(64,1,'Sra. Valentina Salazar','julia.vasques@gomes.org','73.988.301/0001-49','1934-06-01','66','(53) 93239-0300',NULL,'2020-11-02 10:48:03','2020-11-02 10:48:03'),(65,1,'Gian Estêvão Furtado Filho','wcolaco@gmail.com','60.750.157/0001-66','1983-06-23','67','(85) 94371-4823',NULL,'2020-11-02 10:49:15','2020-11-02 10:49:15'),(66,1,'Ketlin Beatriz Duarte','lfidalgo@serrano.com','27.651.078/0001-22','1998-10-08','68','(27) 97865-7467',NULL,'2020-11-02 10:50:00','2020-11-02 10:50:00'),(67,1,'Sr. Adriano Azevedo','molina.elizabeth@terra.com.br','41.128.199/0001-15','1982-05-24','69','(22) 97125-2834',NULL,'2020-11-02 10:52:02','2020-11-02 10:52:02'),(68,1,'Thales Noel Faro','balestero.noel@correia.br','89.665.404/0001-08','1975-02-19','70','(95) 99721-2506',NULL,'2020-11-02 10:54:39','2020-11-02 10:54:39'),(69,1,'Sr. Everton Bittencourt Solano','violeta.velasques@ig.com.br','48.975.262/0001-06','1992-11-26','71','(38) 94984-5355',NULL,'2020-11-02 11:03:32','2020-11-02 11:03:32'),(70,1,' Cliente Editado (edit)','testcustomer@hotmail.com','52.170.931/0001-31','2007-06-19','72','(99) 93298-6514','','2020-11-02 11:04:07','2020-11-02 11:08:32'),(71,1,'Sr. Andres Ian Velasques','bpadilha@yahoo.com','81.415.493/0001-22','1992-04-02','73','(51) 92808-2582',NULL,'2020-11-02 11:06:47','2020-11-02 11:06:47'),(72,1,'Sra. Mia Taís Gusmão Sobrinho','hortencia89@burgos.com','97.862.252/0001-61','1980-02-01','74','(12) 98361-3026',NULL,'2020-11-02 11:07:59','2020-11-02 11:07:59'),(73,1,'Anderson Quintana Maia Neto','nadia.gusmao@maldonado.br','99.507.639/0001-25','1928-04-19','75','(38) 90772-6987',NULL,'2020-11-02 11:08:32','2020-11-02 11:08:32'),(74,1,'Sr. Gabriel Oliveira Sobrinho','jpereira@ig.com.br','25.177.056/0001-47','1969-12-29','76','(91) 97199-7032',NULL,'2020-11-02 11:10:07','2020-11-02 11:10:07'),(76,1,'Emílio Serrano','paula58@gmail.com','92.865.540/0001-56','1966-12-03','78','(32) 90371-0820',NULL,'2020-11-02 11:16:28','2020-11-02 11:16:28'),(77,1,'Amanda Torres','aortega@gusmao.com','46.628.536/0001-57','1969-12-12','79','(41) 99807-2375',NULL,'2020-11-02 11:18:38','2020-11-02 11:18:38'),(78,1,'Gabriel Saraiva','noel18@velasques.net.br','65.905.067/0001-10','1959-06-16','80','(65) 98667-5001',NULL,'2020-11-02 11:19:48','2020-11-02 11:19:48'),(79,1,'Dr. Vicente Escobar Neto','aaron.dasilva@hotmail.com','49.365.123/0001-15','1922-03-17','81','(87) 94247-5017',NULL,'2020-11-03 07:23:55','2020-11-03 07:23:55');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
