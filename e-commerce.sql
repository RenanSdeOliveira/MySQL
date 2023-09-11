CREATE DATABASE  IF NOT EXISTS `e-commerce` /*!40100 DEFAULT CHARACTER SET ascii */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e-commerce`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
-- ------------------------------------------------------
-- Server version	8.1.0

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
  `idCliente` int NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em estoque`
--

DROP TABLE IF EXISTS `em estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `em estoque` (
  `Estoque_idEstoque` int NOT NULL,
  `Produto_idProduto3` int NOT NULL,
  KEY `Produto_idProduto3_idx` (`Produto_idProduto3`),
  KEY `Estoque_idEstoque_idx` (`Estoque_idEstoque`),
  CONSTRAINT `Estoque_idEstoque` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `Produto_idProduto3` FOREIGN KEY (`Produto_idProduto3`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em estoque`
--

LOCK TABLES `em estoque` WRITE;
/*!40000 ALTER TABLE `em estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `em estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `Cliente_idCliente_idx` (`Cliente_idCliente`),
  CONSTRAINT `Cliente_idCliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_fornecedor`
--

DROP TABLE IF EXISTS `produto_has_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_has_fornecedor` (
  `Produto_idProduto2` int NOT NULL,
  `Fornecedor_idFornecedor` int NOT NULL,
  KEY `Produto_idProduto2_idx` (`Produto_idProduto2`),
  KEY `Fornecedor_idFornecedor_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `Fornecedor_idFornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `Produto_idProduto2` FOREIGN KEY (`Produto_idProduto2`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_fornecedor`
--

LOCK TABLES `produto_has_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_has_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_has_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_pedido`
--

DROP TABLE IF EXISTS `produto_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_has_pedido` (
  `Produto_idProduto1` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Pedido_Cliente_idCliente` int NOT NULL,
  KEY `Produto_idProduto_idx` (`Produto_idProduto1`),
  KEY `Pedido_idPedido_idx` (`Pedido_idPedido`),
  KEY `Pedido_Cliente_idCliente_idx` (`Pedido_Cliente_idCliente`),
  CONSTRAINT `Pedido_Cliente_idCliente` FOREIGN KEY (`Pedido_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `Pedido_idPedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `Produto_idProduto1` FOREIGN KEY (`Produto_idProduto1`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_pedido`
--

LOCK TABLES `produto_has_pedido` WRITE;
/*!40000 ALTER TABLE `produto_has_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro - vendedor`
--

DROP TABLE IF EXISTS `terceiro - vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro - vendedor` (
  `idTerceiro - Vendedor` int NOT NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro - vendedor`
--

LOCK TABLES `terceiro - vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro - vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `terceiro - vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro - vendedor_has_produto`
--

DROP TABLE IF EXISTS `terceiro - vendedor_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro - vendedor_has_produto` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  KEY `Terceiro - Vendedor_idTerceiro - Vendedor_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor`),
  KEY `Produto_idProduto_idx` (`Produto_idProduto`),
  CONSTRAINT `Produto_idProduto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `Terceiro - Vendedor_idTerceiro - Vendedor` FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`) REFERENCES `terceiro - vendedor` (`idTerceiro - Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro - vendedor_has_produto`
--

LOCK TABLES `terceiro - vendedor_has_produto` WRITE;
/*!40000 ALTER TABLE `terceiro - vendedor_has_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `terceiro - vendedor_has_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 23:21:45
