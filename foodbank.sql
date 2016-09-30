CREATE DATABASE  IF NOT EXISTS `foodbank` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `foodbank`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: foodbank
-- ------------------------------------------------------
-- Server version	5.6.28

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `ZIP` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (76,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(77,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(78,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(79,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(80,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(81,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(82,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(83,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(84,'2275 S Bascom Ave','','','','',NULL,NULL),(85,'2275 S Bascom Ave','','','','',NULL,NULL),(86,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(87,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(88,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(89,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(90,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(91,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(92,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(93,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(94,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(95,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(96,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(97,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(98,'2275 S Bascom','1510','campbell','ca','95008',NULL,NULL),(99,'2275 S Bascom','1510','campbell','ca','95008',NULL,NULL),(100,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(101,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(102,'14 some street','1234','la','ca','95008',NULL,NULL),(103,'14 some street','1234','la','ca','95008',NULL,NULL),(104,'222','msms','smmmw','ca','95008',NULL,NULL),(105,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(106,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(107,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(108,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(109,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(110,'2275 S Bascom Ave','','','','',NULL,NULL),(111,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(112,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(113,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(114,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(115,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(116,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(117,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL),(118,'2275 S Bascom Ave','1234','Campbell','California','95008',NULL,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `pickup` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `claimed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_offer_user1_idx` (`user_id`),
  CONSTRAINT `fk_offer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (7,'Meat','1 beef','0000-00-00 00:00:00','2016-09-29 17:11:33','2016-09-29 17:11:33',86,92),(8,'Drinks','red wine','0000-00-00 00:00:00','2016-09-29 17:11:46','2016-09-29 17:11:46',86,105),(9,'Meat','hahaha',NULL,NULL,NULL,86,107),(10,'Meat','do u need a meat?','0000-00-00 00:00:00','2016-09-29 18:04:53','2016-09-29 18:04:53',106,112),(11,'Meat','I have a lot of chunky beef!!','0000-00-00 00:00:00','2016-09-29 18:50:41','2016-09-29 18:50:41',115,116),(12,'Meat','a lot of cool meat!!','0000-00-00 00:00:00','2016-09-29 18:54:49','2016-09-29 18:54:49',115,116),(13,'Meat','gdsfjahg','0000-00-00 00:00:00','2016-09-29 19:58:44','2016-09-29 19:58:44',115,118),(14,'Meat','PITAAAAAA!!','0000-00-00 00:00:00','2016-09-29 20:00:31','2016-09-29 20:00:31',117,0),(15,'Meat','BREAD!!!','0000-00-00 00:00:00','2016-09-29 20:01:55','2016-09-29 20:01:55',117,0);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `needed_by` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_request_user1_idx` (`user_id`),
  CONSTRAINT `fk_request_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (17,'Meat','I need 2 pounds of meat!!!','0000-00-00 00:00:00','2016-09-29 17:12:49','2016-09-29 17:12:49',88,109),(18,'Pastry','I neeeeed! hot dogs','0000-00-00 00:00:00','2016-09-29 17:13:03','2016-09-29 17:13:03',88,111),(19,'Meat','mamama','0000-00-00 00:00:00','2016-09-29 18:40:53','2016-09-29 18:40:53',109,0),(20,'Meat','mamama','0000-00-00 00:00:00','2016-09-29 18:41:03','2016-09-29 18:41:03',109,0),(21,'Meat','mamama','0000-00-00 00:00:00','2016-09-29 18:43:58','2016-09-29 18:43:58',109,0),(22,'Meat','BURGER!!!','0000-00-00 00:00:00','2016-09-29 20:01:29','2016-09-29 20:01:29',118,117),(23,'Meat','COKE!!!','0000-00-00 00:00:00','2016-09-29 20:02:21','2016-09-29 20:02:21',118,117);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_address1_idx` (`address_id`),
  CONSTRAINT `fk_user_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (76,'oooll@mail.ru','$2b$12$xTvm0emgkf4FQL8bsfZIMeuTDq5h5b/V79QaQnbj73ZDqIhNxYxOK','bakery',NULL,NULL,1,76),(77,'oooll@mail.ru','$2b$12$8E6sp23rKv9lifsuJOgi2ONfdmpMhFn5gSJHrED2oTb9o1d08bT02','bakery',NULL,NULL,1,77),(78,'oooll11@mail.ru','$2b$12$yXxcTITLFx6vN2H.mqWIzOkqtgyxGe/xASFjGlWegeNKWIGKkSWkm','foodbank',NULL,NULL,2,78),(79,'oooll11@mail.ru','$2b$12$3wnUUB5gxqEPGwjAVn5gCOeE1l985EegwAEDjNtH/j1CbvQ3Anx1S','foodbank',NULL,NULL,2,79),(80,'rita@mail.ru','$2b$12$UaxaJs.SuuEmsOteiMqcHO3YqtMt7amfP5twSL9QPXA2.H1.w4ux.','rita bakery',NULL,NULL,1,80),(81,'rita@mail.ru','$2b$12$abPpp1dx8.u1hW6Hv0TcueiXT4a6X5OcgELMcvzypoIsLDFePerWW','rita bakery',NULL,NULL,1,81),(82,'df@mail.ru','$2b$12$XZrg9B.iibz5W14SuuEvWOwHQe9FQm9YXekzgyvHCr5xVrXCZhupq','bankfood',NULL,NULL,2,82),(83,'df@mail.ru','$2b$12$8V6w7uWZeapvjDT0wjy2g.EGPZMXiItcRR1W2UxjENsgXFSGw2C7W','bankfood',NULL,NULL,2,83),(84,'nfnf@nana.com','$2b$12$EQvOq2W6nMEinAjEe9k3/OC2Soh2xtHeuwSg1IHCVjcIFFAaDb.t.','bankfood1',NULL,NULL,2,84),(85,'nfnf@nana.com','$2b$12$C67Ypj1izbMla1pX2mldouRiuOa96tKIbbCbFdJyd6uiNnQSOIg2G','bankfood1',NULL,NULL,2,85),(86,'pasta@mail.ru','$2b$12$O8/EtLAakPUWbZgjVeSpz.c/ETTP6XmcyeYWl3iWRm7mK0MqNzKOO','pasta restaurant ',NULL,NULL,1,86),(87,'pasta@mail.ru','$2b$12$cp46MQCd57PPYExOcufbDObDHbTMNOQq7wtYKYthCRj67.IW2QOO6','pasta restaurant ',NULL,NULL,1,87),(88,'farm@mail.ru','$2b$12$0CyjgghHR/.9z.TVIXBHyuWS.cF3flrByn.byPB2qGyWXS3IDAvJu','farm',NULL,NULL,2,88),(89,'farm@mail.ru','$2b$12$b7fS1/.PecbPnSbFZgYtZOej.mDq2NVpoEBv6.coL9X0aZSmYaL5e','farm',NULL,NULL,2,89),(90,'newrest@mail.ru','$2b$12$C8NC5XNndJrAw3toNpvMSusiuCuecGYJ2HdCqcgqv7Fcs7Xs1g60W','new restaurant',NULL,NULL,1,90),(91,'newrest@mail.ru','$2b$12$N.tRh5StXR6DrzRaDJ4afuxpP4yuD7V0QCewrsBW8YcO6ov0zQbNe','new restaurant',NULL,NULL,1,91),(92,'kinder@mail.ru','$2b$12$KAcbOqz.MqoZ/j6rZlbu0OZ2h4Iv3zLizG6QLHV06mKtw3X3VBfPS','kindergarden',NULL,NULL,2,92),(93,'kinder@mail.ru','$2b$12$w0xQXO1omnwyl2vIXkvMyuBeI85x3rM0dUEWVBBK8WRJ94WvwGlsS','kindergarden',NULL,NULL,2,93),(94,'pasta1@mail.ru','$2b$12$9zjNfgVvQJnc30P1ySXVKOM5BMM/QTJb/VoIcTX3erHMJjbnk0fo.','pasta1',NULL,NULL,1,94),(95,'pasta1@mail.ru','$2b$12$zFACQX3QoEj7pOFpkwHdae9msRfcKYawXgBFQe4Q0dmK4X7Nste8K','pasta1',NULL,NULL,1,95),(96,'res@mail.ru','$2b$12$RGtRB//k8b8Q4PBAFGCFsuAGaNefx60WfDKU1xhbY2dAHfrO1SqDa','bankff',NULL,NULL,2,96),(97,'res@mail.ru','$2b$12$3vweMN4T.tVPES5EnWXvBuniN7gGCLuUAeVEKwLS4lWBkHML75A2O','bankff',NULL,NULL,2,97),(98,'olia@mail.ru','$2b$12$MYDRYUxvRScCbHH.SvCN/.hSqeygcF5WcZCYcdBMqRQHX2iNhCvDS','olia',NULL,NULL,1,98),(99,'olia@mail.ru','$2b$12$2yu4SecQEErRoWqXYugYJeR7IpUGwcIFXCIII7f5rueOsGI1Hqq1q','olia',NULL,NULL,1,99),(100,'myfood@gmail.com','$2b$12$sfhleusiqCAaosgpEdZpzuLZs7khTyMlKRPzCcxnostqOyhUYrHDm','myfoodbank',NULL,NULL,2,100),(101,'myfood@gmail.com','$2b$12$kCM.ETQwU2St/EqYQEgu8uQyaMmNpvlyaPB5q3Bl3EXMFaFWi3s6O','myfoodbank',NULL,NULL,2,101),(102,'SJfood@mail.ru','$2b$12$UgURRfbOhZYUoz0YqgWk4OhjsAJ/b5RQOSVFLx5DdUA3CDk55A3Za','SJ foodbank',NULL,NULL,2,102),(103,'SJfood@mail.ru','$2b$12$xAq9wqNn/xDu3.o0Kbi6K.w036j6ncOMs1aoAkIYFchmrJZIvuBSO','SJ foodbank',NULL,NULL,2,103),(104,'name@name.com','$2b$12$8xYIiNp5ghf0LVQRUWrYnOY25f60yJcibm1yWSkIIOw83BMS/gIpK','myname',NULL,NULL,1,104),(105,'nana@nana.com','$2b$12$i3CVr5bqNybN/yrwUHv.L.tsMWJXN3ddLOj7mMa4Ej20F8Qo3YaDe','nanana',NULL,NULL,2,105),(106,'mama1@mama.com','$2b$12$5z2yj2WWLoFyCueIdpgKAeF148kaMRgVw6Y5B2eRQA.IlPjZAt1j2','mama',NULL,NULL,1,106),(107,'mybanl@a.com','$2b$12$MEEAJyB1APabkRNW02dmA.2LiY8h05C8Dybro6ZaA653ayvPWSpqS','mybank',NULL,NULL,2,107),(108,'cafe@a.com','$2b$12$UKeYPuJP7fQyXjy/.wqwiulTmLC7nPACPUNsHy4umOja1MD7gE2qW','cafe',NULL,NULL,1,108),(109,'rita123@mail.ru','$2b$12$uPM4rjOWhJRrinw8H2jb9uZZlMeO731yZLORv29ZxYx7i7te0GPM.','mamamia',NULL,NULL,1,109),(110,'oooooooo@o.com','$2b$12$0nML1U.mcJfUEVeQxW0Lue1KdMI9RiCKOUp.YgfqnBrcMgtP7VMgC','oooooo',NULL,NULL,2,110),(111,'cody@gmail.com','$2b$12$rg3WApC7zwR5jL6y6SZfJ.Oiopd5wxvGSLSF1JrZYP7Fo1Dc1W7pO','cody',NULL,NULL,1,111),(112,'noodles@gmail.com','$2b$12$0Cddb2bKbTx4qcXFLt1rQuDj2ARBhqfNHNenoaRGHH1R5blNoy2vq','noodles',NULL,NULL,2,112),(113,'noodles@gmail.com','$2b$12$ABXGOWw.fjARvWUNHfHyKeYyMqDC44f6yu0QsYPVvhYTnaaKK5n4m','noodles',NULL,NULL,2,113),(114,'noodles@gmail.com','$2b$12$JZU0bzJREilOk.5D2GsrYeP/oK3tc69BgJwVBC6IcoQROHwP6RKGO','noodles',NULL,NULL,2,114),(115,'cody_noodles@gmail.com','$2b$12$I9dd8pF6g8ampWFUohRdzeTaA5OgJFoLzYbYYB1nkYTgYC/wODP8e','Cody noodles',NULL,NULL,1,115),(116,'fancy@gmail.com','$2b$12$RorTd/zkBtKlA4UmseDqa.OA6K5uye2wJiIDBdBcIbqxgp5BKKQdu','fancy_food',NULL,NULL,2,116),(117,'pitas@gmail.com','$2b$12$oWFqGRWwkO2HjaBpauWf..Y/N8r3gv0xrFwY.a59KRpUzhjP3gqmm','pitas',NULL,NULL,1,117),(118,'collectors@gmail.com','$2b$12$V11XZ6//29oixSECZEG.QOFHcnOf3zBX7Fy3tBAL5b4G23VSwUsXm','collectors',NULL,NULL,2,118);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-29 20:08:07
