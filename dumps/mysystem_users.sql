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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(62) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int NOT NULL,
  `status` int NOT NULL,
  `date_create` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'Rodrigo','Alves Guerra','rodrigoa.guerra@hotmail.com','$2y$11$R2UbtmndwkVqJaIaYCYijOvC59UwGmsRJowe2byt0HnAHiHsIsTaa',1,1,'2020-08-20'),(8,'Leandro','Alberto Guerra','contato@rodrigoalvesguerra.com.br','$2y$11$I8VgdGdLigZaInIvSlK0tuoKuTPgfQzoiCQzh2Y6nWHg1JyipcaGu',-1,-1,'2020-08-20'),(9,'Leandro','Alberto Guerra','rodrigoa.guerra92@gmail.com','$2y$11$hEaSV1mbe.2uRPX/saiwLu08R.DmVoaeL3nQETkOSDaBsMLVNRg3i',-1,-1,'2020-08-21'),(10,'Tábata','Leon','helena26@santiago.com.br','$2y$11$DYQlNq/U.m2cBI8Xl7G3peV9YrumpsAZm6aT/9Q.7HyBPlnqNvX9K',-1,-1,'2020-11-11'),(11,'Ricardo','Santiago','dmatias@gmail.com','$2y$11$6mpuRijbaWzcfU3Xo0WCfOhUEQRbeIWSCDTQCVT9OwGLunuGO.ofa',-1,-1,'2020-11-11'),(12,'Antônio','Serrano','nlira@uol.com.br','$2y$11$G3HvaZIpUUBkMmJGWPXBTOT3poFjN/pQRjJm9xq0C8uI.2.CzuDVu',-1,-1,'2020-11-12'),(13,'Agustina','Fernandes','qsantiago@desouza.net.br','$2y$11$QINuDgZxwTzvIq4jNy..OuUDYF8raN2KIr4IUZP6pkX1oZTgj4ZsC',-1,-1,'2020-11-12'),(14,'Samanta','Salas','ferraz.valentin@r7.com','$2y$11$eAJB3XsVzYHwXOWyf3z.5eA87w7RKgZ2zZe5jNkba3Hxetyavk7PC',-1,-1,'2020-11-12'),(15,'Mariana','Feliciano','ferminiano.alma@ortega.org','$2y$11$YLLXc.OFRQfXsfyScpnxauVB6aMIo.lnMIuP/v1wYg8nYwpUTwbcC',-1,0,'2020-11-12'),(16,'Carla','Montenegro','ferreira.fatima@rico.org','$2y$11$4VZsD9vOR6HNkYq5aPqLcu4EVBL.rCA12Cfl1k.Jt9cFhhm.OikU2',-1,0,'2020-11-12'),(17,'Adriano','Correia','catarina.pontes@terra.com.br','$2y$11$6KNjxDAAJ61dZQnvGqwraef5VUNEAoMWNjiO7ovAfnCNDS.o9Ljpu',-1,0,'2020-11-12'),(18,'Valentin','Padilha','joao.maldonado@urias.net.br','$2y$11$WNuY5OymPnmWQ1tp2a4NDO5WYjWQS3qJ9ElCHDXP.22H6S55uPLdy',-1,0,'2020-11-12'),(19,'Malena','Ortiz','agustina07@uol.com.br','$2y$11$89Mq0UTL5zWzsxjsQe2Xn.Bgp0ysGT03J.2WcwuFE/JkXXhKlvn/O',-1,-1,'2020-11-12'),(20,'Elizabeth','Cortês','teobaldo37@faro.br','$2y$11$TynJVZjRWxSSyfmI5u5cXOxMvBBpRpWbH.TZy/ONeYTBOZE8tt06y',-1,-1,'2020-11-12'),(21,'Teobaldo','das Dores','daniel99@hotmail.com','$2y$11$B8aldbt2u/CV4d3eOFksCOpJUGbF4S1UcvXLFnTPph3DChYcFPzpO',-1,0,'2020-11-12'),(22,'Henrique','Garcia','tbrito@aranda.net','$2y$11$UBBJFr/PNmzpgMntmW4z9.1JoEJcpsVb70neY3HDrnybVEFIbKWT2',-1,0,'2020-11-12'),(23,'Camila','Fernandes','jteles@rico.net','$2y$11$5KMczwr/jYdJWUOUL5LYFebGHJkORNGPt34UDFD7.VXF7CBuubSoS',-1,0,'2020-11-13'),(24,'Noelí','Salazar','espinoza.paulina@uol.com.br','$2y$11$ZSeZHEnsa6BLOAtikSIQSOCfUs5AObPBxQKUI.zFn1mcOtDJuE/pO',-1,0,'2020-11-13'),(25,'Isabella','Rangel','estrada.francisco@lovato.org','$2y$11$DivIWvKGKSPguiUT3kt1K.0OLh7xCJjaD6kvsZM2ICjIQfmgCzRPK',-1,0,'2020-11-13'),(26,'Rafaela','Zambrano','noel.pedrosa@santiago.com.br','$2y$11$vqxGpw/MX/2kGDCBMrAXMOIMo9/M0swfLxAj0tQHbiLCoT7ixEFg6',-1,0,'2020-11-13'),(27,'Samanta','Cruz','fmarin@cervantes.com.br','$2y$11$rF.eLfGQGAqPa.DUfX1BMuI3HgC5VILcxXOAir1l.pG0AVPXM7YbK',-1,0,'2020-11-13'),(28,'Alma','Pontes','tomas.torres@ig.com.br','$2y$11$wKHV73ztTxaKLzGfNhkSl.Ak60bf6LrSC.GeW5mWJKZRk/SS2gksu',-1,0,'2020-11-13'),(29,'Malena','Esteves','lcarrara@corona.br','$2y$11$6kPdkvEBt/xS2VYhOY/pt.bPgbTfhFelccfAc5ZShtaIRxMeqxPoG',-1,0,'2020-11-13'),(30,'Mia','Aranda','carolina51@gmail.com','$2y$11$3IC0W7t3iHegVrip0RQrBebs4TY94dl3sxyRuOZJ9ARX404X0VGq.',-1,0,'2020-11-13'),(31,'Luciano','Torres','fverdugo@ig.com.br','$2y$11$V38tAyRAML3glQB0CDQLl.KAV01WUPZck1pq22uz1r2M4iPCAEq9.',-1,0,'2020-11-13'),(32,'Melissa','Beltrão','wvale@chaves.com','$2y$11$MfQLeSsWcJ4GEubAyiJzDOQPL6.63mlRVorSNtJu63AuxER5Bk5pK',-1,0,'2020-11-13'),(33,'Santiago','Gonçalves','eduardo14@ferminiano.net.br','$2y$11$/0cdXlb7k2uA0JmfYe4ThufryW2qn3EiefGgmVJAAKVKb3xT9C222',-1,0,'2020-11-13'),(34,'Simon','de Aguiar','amelia.dias@duarte.br','$2y$11$r8um4bSc5bg3B0RVzQdyC.U6syuSCngdrK2N4xZeWqjSLQrO3GG/C',-1,0,'2020-11-13'),(35,'Beatriz','das Dores','tabata.garcia@matias.com','$2y$11$ybiF8oaE818eUG4430DwGeZ5H3SmqSBFHNhdE1Bezcm4fcXRceZVO',-1,-1,'2020-11-13'),(36,'Júlia','Perez','mserrano@cortes.br','$2y$11$f.a5r3hzwAGXogk0j9K0quk5dM3Gv53.ozPe7PitVCHGq6gP5T4sC',-1,0,'2020-11-13'),(37,'Carla','Galhardo','samuel73@sandoval.br','$2y$11$pJZmqvlOqznLMz1HwdERw./LS5o9OTRDuZUIy.bC/C4exiy3nBRAm',-1,0,'2020-11-13'),(38,'Alexa','Fonseca','eduardo45@galvao.com.br','$2y$11$oNxpVUQ6Iy2P.pZTPnd2guM8133Yk8C/GiRezob0aNkAwUrPnq/8O',-1,0,'2020-11-13'),(39,'Felipe','Rocha','ufernandes@meireles.com.br','$2y$11$o8dl/jW4bDOc121yTQcCd.ZI0lA4IrnErKjV5MHtyCPpje5Xuyb9a',-1,0,'2020-11-13'),(40,'Isabel','Soares','dacruz.natal@paz.com.br','$2y$11$ai3fOXzztpMWOu0PqhxtYenAhmGpjXQqh33LbZlYIpLtW2ibYFB2q',-1,0,'2020-11-13'),(41,'Andrea','Abreu','joao88@estrada.br','$2y$11$vs.sVWCl7GvxlOmoRSIwfeB70x49h4BLZb0z.wBYDwYhb.uHnfEzu',-1,0,'2020-11-13'),(42,'Clara','Neves','kdias@mares.org','$2y$11$PZEqEj1.kk92A8DAqdlznehOaaTQLObF2wdkXWrTHXHFT1qp12Aou',-1,0,'2020-11-13'),(43,'Abril','Sanches','rdasilva@pacheco.net.br','$2y$11$iY34i3b567xFQqnTBflMte/UDOt7XP0ViPFOnMpmlhBhkQj065IFW',-1,0,'2020-11-13'),(44,'Camila','Pedrosa','martines.ivan@yahoo.com','$2y$11$GDu6NBGnIVAOZaLPD8fyIuct2hqh.hBQGaV4O.eGX58QUvRcSb6R2',-1,0,'2020-11-13'),(45,'Fernando','Abreu','inacio12@r7.com','$2y$11$YnRLDCEFKl/29dmG9E.fZeEwsfclASvcFdtNjcfLRKCi4iVSxWVzW',-1,0,'2020-11-13'),(46,'Juliana','Galhardo','daniel.queiros@r7.com','$2y$11$TCuVEl3ztJOxvCT25CmoZuwe58J4jwnPQnd4sAgXEWfku9UuwcGhq',-1,0,'2020-11-13'),(47,'Diego','Pereira','hernani82@meireles.com','$2y$11$yvu35at7Bp1uH4w1HWJvzeZskVWpWnlSaGs2sAghWQHBApCoegoHS',-1,0,'2020-11-13'),(48,'Mário','Caldeira','mbenites@ig.com.br','$2y$11$o5Ds9Etx6pNdpvyBytPx1ev9tvy2heCUT51Z.XW8IcScAwPGIZTT2',-1,0,'2020-11-13'),(49,'Diego','Maldonado','tessalia.campos@terra.com.br','$2y$11$FSqSkkT1gk3vuWdQH0qX5.um7.pxoaSlMDnypiCHlrxkwtHJTIGmO',-1,0,'2020-11-13'),(50,'Hortência','Padrão','qsales@yahoo.com','$2y$11$KfX2JGwUF691sLZbOyIls.x6EDK2jq6XPIsHrhEHTLZU4cuEDDzs2',-1,0,'2020-11-13'),(51,'Rodrigo','Galvão','miranda16@yahoo.com','$2y$11$e6CCLzgC/yvQPSnm0QUYWOK1CTtgzRdYmqTmtdFMTLrLTJee7EKV6',-1,0,'2020-11-13'),(52,'Sérgio','Rezende','alonso.oliveira@yahoo.com','$2y$11$FHIicc6dXyKtW.QvRXX7AO9s4hEpWommHGAes5ETQ/zyfg6C3Roiu',-1,0,'2020-11-13'),(53,'João','Chaves','ocorona@hotmail.com','$2y$11$Q9aDhKuMEutlX.iyBXezY.zeIY8yoyx6AXEY1Ks0rKJ/RPcx8dMrm',-1,0,'2020-11-13'),(54,'Martinho','Azevedo','grico@r7.com','$2y$11$tMGzgv7AZCSHSU8DIrLXNeQM149VexTu/P7Wqx8j8FGjpxJu3EfJu',-1,0,'2020-11-14'),(55,'Valentin','Corona','jimenes.nicole@guerra.com.br','$2y$11$DTmf35V63pjeB6i75nKyn.0tnWQ4oZN6Qpqgr/u2PJt9FBX4ydCvK',-1,0,'2020-11-14');
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

-- Dump completed on 2020-11-14 13:34:00
