-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: fullstack_ultimate
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cli` varchar(40) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `endereco_cli` varchar(50) DEFAULT NULL,
  `cidade_cli` varchar(30) DEFAULT NULL,
  `cep_cli` varchar(20) DEFAULT NULL,
  `uf_cli` varchar(2) DEFAULT NULL,
  `produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Diego Ribeiro','11962441455','Rua Petrobrás','São Paulo','09974-370','SP','Fogão Brastemp Preto 6 Bocas de Vidro'),(3,'Sabrina Geova','220202020','Rua Nova','Rio de Janeiro','09917-400','RJ','Máquina de Lavar Brastemp Advanced 12Kg');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `motivo` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `mensagem` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_comentarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Diego Teste','ego_brecht@hotmail.com','OlÃ¡','DÃºvidas'),(2,'Diego dos Santos Ribeiro','ego_brecht91@hotmail.com','Vc estÃ¡ aÃ­?','DÃºvidas'),(4,'olÃ¡ sÃ£o Ã¡Ã¡Ã¡','a@a','vocÃª','ReclamaÃ§Ã£o');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) DEFAULT NULL,
  `id_produtos` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `id_cli` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `num_pedido` (`num_pedido`),
  KEY `id_produtos` (`id_produtos`),
  KEY `id_cli` (`id_cli`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,5,1,1),(2,2,10,1,2);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cli` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `prazo_entrega` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`num_pedido`),
  KEY `id_cli` (`id_cli`),
  KEY `id_vendedor` (`id_vendedor`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,3,2,'10 dias'),(2,1,2,'15 dias');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produtos` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(200) DEFAULT NULL,
  `descricao` varchar(400) DEFAULT NULL,
  `preco` varchar(50) DEFAULT NULL,
  `preco_final` varchar(50) DEFAULT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_produtos`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'geladeira','Geladeira Grost Brastemp Side Inverse 375L','3.389,00','2.899,00','geladeira.jpg'),(2,'geladeira','Geladeira Brastemp Side Porta Dupla 540L','6.389,00','5.019,00','geladeria 2.jpg'),(3,'geladeira','Geladeira Brastemp 540L 2P Suporte para Água','7.389,00','6.019,00','geladeira 3.jpg'),(4,'fogao','Fogao 4 bocas Eletrolux com Mesa de Vidro','1.299,00','1.059,00','fogao 2.jpg'),(5,'fogao','Fogão Brastemp Preto 6 Bocas de Vidro','3.389,00','3.000,00','Fogao 22.jpg'),(6,'microondas','Microondas 25L Espelhado Eletrolux 220V','509,00','450,00','microondas.jpg'),(7,'microondas','Microondas Tabajara 20L Cromado Automático','320,00','290,00','microondas 2.jpg'),(8,'microondas','Microondas Philco 25L Branco Espelhado','320,00','290,00','microondas33.jpg'),(9,'lavaroupas','Lava e Seca Roupas Samsung Ecobubble 15kg','4.150,00','3.900,00','Lavaroupas.jpg'),(10,'lavaroupas','Máquina de Lavar Brastemp Advanced 12Kg','2.509,00','2.100,00','lava roupas 2.jpg'),(11,'lavaloucas','Lava Louças Brastemp - 14 Serviços','4.100,00','3.690,00','lava loucas.jpg'),(12,'lavaloucas','Lava Louças Brastemp 10 Serviços - 220V','3.690,00','3.290,00','lava loucas 2.jpg');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vend` varchar(40) DEFAULT NULL,
  `salario_vend` float DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Flávia Prado',4500),(2,'Sanches',10000);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fullstack_ultimate'
--

--
-- Dumping routines for database 'fullstack_ultimate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 12:30:04
