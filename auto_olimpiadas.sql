CREATE DATABASE  IF NOT EXISTS `olimpiadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `olimpiadas`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: olimpiadas
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `arbitragem`
--

DROP TABLE IF EXISTS `arbitragem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitragem` (
  `num_passaporte_arbitro` varchar(50) NOT NULL,
  `id_esporte` int NOT NULL,
  PRIMARY KEY (`num_passaporte_arbitro`,`id_esporte`),
  KEY `FK_Arbitragem_Esportes` (`id_esporte`),
  CONSTRAINT `FK_Arbitragem_Arbitro` FOREIGN KEY (`num_passaporte_arbitro`) REFERENCES `arbitro` (`num_passaporte_arbitro`),
  CONSTRAINT `FK_Arbitragem_Esportes` FOREIGN KEY (`id_esporte`) REFERENCES `esportes` (`id_esportes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitragem`
--

LOCK TABLES `arbitragem` WRITE;
/*!40000 ALTER TABLE `arbitragem` DISABLE KEYS */;
INSERT INTO `arbitragem` VALUES ('ARBITRO001',1),('ARBITRO006',1),('ARBITRO002',2),('ARBITRO007',2),('ARBITRO003',3),('ARBITRO008',3),('ARBITRO004',4),('ARBITRO009',4),('ARBITRO005',5),('ARBITRO010',5);
/*!40000 ALTER TABLE `arbitragem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `num_passaporte_arbitro` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `nacionalidade` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`num_passaporte_arbitro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES ('ARBITRO001','M','Brasil','1980-05-15','Carlos Silva'),('ARBITRO002','F','Argentina','1985-08-20','Maria Gonzalez'),('ARBITRO003','M','Estados Unidos','1978-11-30','John Smith'),('ARBITRO004','F','França','1990-02-14','Sophie Martin'),('ARBITRO005','M','Alemanha','1983-06-25','Hans Müller'),('ARBITRO006','F','Japão','1987-09-12','Yuki Tanaka'),('ARBITRO007','M','Austrália','1982-01-23','Michael Brown'),('ARBITRO008','F','China','1991-04-18','Li Wei'),('ARBITRO009','M','Itália','1975-07-07','Giuseppe Rossi'),('ARBITRO010','F','Canadá','1984-12-03','Emily Clark');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atleta`
--

DROP TABLE IF EXISTS `atleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atleta` (
  `num_passaporte_atleta` varchar(50) NOT NULL,
  `tipo_sanguineo` varchar(3) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  `id_con` int NOT NULL,
  PRIMARY KEY (`num_passaporte_atleta`),
  KEY `FK_Atleta_CON` (`id_con`),
  CONSTRAINT `FK_Atleta_CON` FOREIGN KEY (`id_con`) REFERENCES `comite_olimpico_nacional` (`id_con`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atleta`
--

LOCK TABLES `atleta` WRITE;
/*!40000 ALTER TABLE `atleta` DISABLE KEYS */;
INSERT INTO `atleta` VALUES ('ATLETA001','A+',1.85,'Pedro Souza','1990-03-10','M',80.50,'Brasil',1),('ATLETA002','B-',1.70,'Ana Torres','1992-07-15','F',60.00,'Argentina',2),('ATLETA003','O+',1.78,'Michael Johnson','1988-09-20','M',75.00,'Estados Unidos',3),('ATLETA004','AB+',1.60,'Marie Dubois','1994-11-25','F',55.00,'França',4),('ATLETA005','A-',1.90,'Johann Schmidt','1985-05-30','M',90.00,'Alemanha',5),('ATLETA006','O-',1.65,'Yuki Nakamura','1991-08-08','F',50.00,'Japão',6),('ATLETA007','B+',1.82,'Mark Thompson','1987-12-12','M',85.00,'Austrália',7),('ATLETA008','A+',1.75,'Liu Wei','1993-01-18','F',57.00,'China',8),('ATLETA009','AB-',1.80,'Giovanni Bianchi','1982-02-28','M',78.00,'Itália',9),('ATLETA010','B+',1.68,'Emily White','1986-06-06','F',62.00,'Canadá',10);
/*!40000 ALTER TABLE `atleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comite_olimpico_internacional`
--

DROP TABLE IF EXISTS `comite_olimpico_internacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comite_olimpico_internacional` (
  `id_coi` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_coi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite_olimpico_internacional`
--

LOCK TABLES `comite_olimpico_internacional` WRITE;
/*!40000 ALTER TABLE `comite_olimpico_internacional` DISABLE KEYS */;
INSERT INTO `comite_olimpico_internacional` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `comite_olimpico_internacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comite_olimpico_nacional`
--

DROP TABLE IF EXISTS `comite_olimpico_nacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comite_olimpico_nacional` (
  `id_con` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_coi` int NOT NULL,
  PRIMARY KEY (`id_con`),
  KEY `FK_CON_COIN` (`id_coi`),
  CONSTRAINT `FK_CON_COIN` FOREIGN KEY (`id_coi`) REFERENCES `comite_olimpico_internacional` (`id_coi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite_olimpico_nacional`
--

LOCK TABLES `comite_olimpico_nacional` WRITE;
/*!40000 ALTER TABLE `comite_olimpico_nacional` DISABLE KEYS */;
INSERT INTO `comite_olimpico_nacional` VALUES (1,'Comitê Olímpico Brasileiro',1),(2,'Comité Olímpico Argentino',2),(3,'United States Olympic & Paralympic Committee',3),(4,'Comité National Olympique et Sportif Français',4),(5,'Deutscher Olympischer Sportbund',5),(6,'Japanese Olympic Committee',6),(7,'Australian Olympic Committee',7),(8,'Chinese Olympic Committee',8),(9,'Comitato Olimpico Nazionale Italiano',9),(10,'Canadian Olympic Committee',10);
/*!40000 ALTER TABLE `comite_olimpico_nacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competicao`
--

DROP TABLE IF EXISTS `competicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competicao` (
  `id_modalidade` int NOT NULL,
  `num_passaporte_atleta` varchar(50) NOT NULL,
  `indice_olimpico` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_modalidade`,`num_passaporte_atleta`),
  KEY `FK_Competicao_Atleta` (`num_passaporte_atleta`),
  CONSTRAINT `FK_Competicao_Atleta` FOREIGN KEY (`num_passaporte_atleta`) REFERENCES `atleta` (`num_passaporte_atleta`),
  CONSTRAINT `FK_Competicao_Modalidades` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competicao`
--

LOCK TABLES `competicao` WRITE;
/*!40000 ALTER TABLE `competicao` DISABLE KEYS */;
INSERT INTO `competicao` VALUES (1,'ATLETA001',98.50),(1,'ATLETA006',88.40),(2,'ATLETA002',95.30),(2,'ATLETA007',91.00),(3,'ATLETA003',92.70),(3,'ATLETA008',93.80),(4,'ATLETA004',90.20),(4,'ATLETA009',89.60),(5,'ATLETA005',94.10),(5,'ATLETA010',97.30);
/*!40000 ALTER TABLE `competicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalacao`
--

DROP TABLE IF EXISTS `escalacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escalacao` (
  `id_evento` int NOT NULL,
  `num_passaporte_arbitro` varchar(50) NOT NULL,
  PRIMARY KEY (`id_evento`,`num_passaporte_arbitro`),
  KEY `FK_Escalacao_Arbitro` (`num_passaporte_arbitro`),
  CONSTRAINT `FK_Escalacao_Arbitro` FOREIGN KEY (`num_passaporte_arbitro`) REFERENCES `arbitro` (`num_passaporte_arbitro`),
  CONSTRAINT `FK_Escalacao_Evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalacao`
--

LOCK TABLES `escalacao` WRITE;
/*!40000 ALTER TABLE `escalacao` DISABLE KEYS */;
INSERT INTO `escalacao` VALUES (1,'ARBITRO001'),(1,'ARBITRO002'),(2,'ARBITRO003'),(2,'ARBITRO004'),(3,'ARBITRO005'),(3,'ARBITRO006'),(4,'ARBITRO007'),(4,'ARBITRO008'),(5,'ARBITRO009'),(5,'ARBITRO010');
/*!40000 ALTER TABLE `escalacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esportes`
--

DROP TABLE IF EXISTS `esportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esportes` (
  `id_esportes` int NOT NULL AUTO_INCREMENT,
  `generos` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `id_coi` int NOT NULL,
  PRIMARY KEY (`id_esportes`),
  KEY `FK_Esportes_COIN` (`id_coi`),
  CONSTRAINT `FK_Esportes_COIN` FOREIGN KEY (`id_coi`) REFERENCES `comite_olimpico_internacional` (`id_coi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esportes`
--

LOCK TABLES `esportes` WRITE;
/*!40000 ALTER TABLE `esportes` DISABLE KEYS */;
INSERT INTO `esportes` VALUES (1,'Masculino','Futebol',1),(2,'Feminino','Basquete',1),(3,'Masculino','Natação',2),(4,'Feminino','Atletismo',2),(5,'Masculino','Tênis',3),(6,'Feminino','Vôlei',3),(7,'Masculino','Boxe',4),(8,'Feminino','Ginástica',4),(9,'Masculino','Ciclismo',5),(10,'Feminino','Hóquei',5);
/*!40000 ALTER TABLE `esportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `id_estadio` int NOT NULL AUTO_INCREMENT,
  `capacidade` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `local` varchar(100) NOT NULL,
  `id_coi` int NOT NULL,
  PRIMARY KEY (`id_estadio`),
  KEY `FK_Estadio_COIN` (`id_coi`),
  CONSTRAINT `FK_Estadio_COIN` FOREIGN KEY (`id_coi`) REFERENCES `comite_olimpico_internacional` (`id_coi`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES (1,50000,'Estádio Maracanã','Rio de Janeiro, Brasil',1),(2,18000,'Estádio Monumental','Buenos Aires, Argentina',2),(3,20000,'Estádio do Cowboy','Dallas, Estados Unidos',3),(4,30000,'Estádio de Marseille','Marseille, França',4),(5,40000,'Estádio Allianz Arena','Munique, Alemanha',5),(6,25000,'Estádio Nacional de Tóquio','Tóquio, Japão',6),(7,35000,'Estádio de Sydney','Sydney, Austrália',7),(8,22000,'Estádio Nacional de Pequim','Pequim, China',8),(9,28000,'Estádio Olímpico de Roma','Roma, Itália',9),(10,32000,'Estádio Olímpico de Montreal','Montreal, Canadá',10);
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `local` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `id_modalidade` int NOT NULL,
  `id_estadio` int NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `FK_Evento_Modalidades` (`id_modalidade`),
  KEY `FK_Evento_Estadio` (`id_estadio`),
  CONSTRAINT `FK_Evento_Estadio` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`),
  CONSTRAINT `FK_Evento_Modalidades` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Estádio Maracanã','2024-08-01','08:00:00','12:00:00',1,1),(2,'Estádio Monumental','2024-08-02','09:30:00','13:30:00',2,2),(3,'Estádio do Cowboy','2024-08-03','10:00:00','14:00:00',3,3),(4,'Estádio de Marseille','2024-08-04','11:30:00','15:30:00',4,4),(5,'Estádio Allianz Arena','2024-08-05','12:00:00','16:00:00',5,5),(6,'Estádio Nacional de Tóquio','2024-08-06','13:30:00','17:30:00',1,6),(7,'Estádio de Sydney','2024-08-07','14:00:00','18:00:00',2,7),(8,'Estádio Nacional de Pequim','2024-08-08','15:30:00','19:30:00',3,8),(9,'Estádio Olímpico de Roma','2024-08-09','16:00:00','20:00:00',4,9),(10,'Estádio Olímpico de Montreal','2024-08-10','17:30:00','21:30:00',5,10);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `num_assento` varchar(10) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `setor` varchar(50) DEFAULT NULL,
  `id_evento` int NOT NULL,
  `num_passaporte_torcedor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ingresso`),
  KEY `FK_Ingresso_Evento` (`id_evento`),
  KEY `FK_Ingresso_Torcedor` (`num_passaporte_torcedor`),
  CONSTRAINT `FK_Ingresso_Evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  CONSTRAINT `FK_Ingresso_Torcedor` FOREIGN KEY (`num_passaporte_torcedor`) REFERENCES `torcedor` (`num_passaporte_torcedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,'A001',100.00,'Setor A',1,'TORCEDOR001'),(2,'B002',75.00,'Setor B',2,'TORCEDOR002'),(3,'C003',50.00,'Setor C',3,'TORCEDOR003'),(4,'D004',80.00,'Setor D',4,'TORCEDOR004'),(5,'E005',120.00,'Setor E',5,'TORCEDOR005'),(6,'F006',90.00,'Setor F',6,'TORCEDOR006'),(7,'G007',60.00,'Setor G',7,'TORCEDOR007'),(8,'H008',110.00,'Setor H',8,'TORCEDOR008'),(9,'I009',70.00,'Setor I',9,'TORCEDOR009'),(10,'J010',95.00,'Setor J',10,'TORCEDOR010');
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  `indicador` varchar(50) DEFAULT NULL,
  `id_esporte` int NOT NULL,
  PRIMARY KEY (`id_modalidade`),
  KEY `FK_Modalidades_Esportes` (`id_esporte`),
  CONSTRAINT `FK_Modalidades_Esportes` FOREIGN KEY (`id_esporte`) REFERENCES `esportes` (`id_esportes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
INSERT INTO `modalidades` VALUES (1,'Individual','Salto em Distância','F','Qualificação',1),(2,'Equipe','Basquete','M','Eliminatórias',2),(3,'Individual','Natação 100m Livre','M','Final',3),(4,'Equipe','Revezamento 4x100m','F','Final',4),(5,'Individual','Tênis de Mesa','M','Semifinal',5),(6,'Equipe','Vôlei de Praia','F','Final',6),(7,'Individual','Boxe Peso Médio','M','Quartas de Final',7),(8,'Equipe','Ginástica Artística','F','Final',8),(9,'Individual','Ciclismo de Estrada','M','Final',9),(10,'Equipe','Hóquei sobre Grama','F','Final',10);
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torcedor`
--

DROP TABLE IF EXISTS `torcedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torcedor` (
  `num_passaporte_torcedor` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `num_cartao` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_passaporte_torcedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torcedor`
--

LOCK TABLES `torcedor` WRITE;
/*!40000 ALTER TABLE `torcedor` DISABLE KEYS */;
INSERT INTO `torcedor` VALUES ('TORCEDOR001','João Silva','1234 5678 9012 3456','Rua A, 123','Brasil'),('TORCEDOR002','Maria Gonzalez','9876 5432 1098 7654','Calle B, 456','Argentina'),('TORCEDOR003','John Smith','2468 1357 8024 6790','123 Main Street','Estados Unidos'),('TORCEDOR004','Marie Dupont','8642 9753 0218 4630','Rue C, 789','França'),('TORCEDOR005','Hans Müller','3156 8974 0263 5147','Am Hauptstrasse 1','Alemanha'),('TORCEDOR006','Yuki Tanaka','6498 7512 3056 1842','Tokyo Street, 456','Japão'),('TORCEDOR007','Emily Johnson','4627 1593 8047 2369','Sydney Road, 789','Austrália'),('TORCEDOR008','Wei Liu','3712 9054 6281 7349','Beijing Street, 123','China'),('TORCEDOR009','Giovanni Rossi','9283 0475 1639 2584','Piazza Duomo, 456','Itália'),('TORCEDOR010','Emma White','5469 3128 7405 9638','Maple Street, 789','Canadá');
/*!40000 ALTER TABLE `torcedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31  9:13:29
