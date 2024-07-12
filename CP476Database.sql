-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: cp476
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `producttable`
--

DROP TABLE IF EXISTS `producttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttable` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int DEFAULT NULL,
  `Status` char(1) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`Price`),
  KEY `SupplierID` (`Description`),
  KEY `fk_supplier_idx` (`SupplierID`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `suppliertable` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=3375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttable`
--

LOCK TABLES `producttable` WRITE;
/*!40000 ALTER TABLE `producttable` DISABLE KEYS */;
INSERT INTO `producttable` VALUES (1234,'TV','Plate TV',599.30,5,'B',8672),(1234,'TV','Plate TV',699.70,5,'B',7084),(1234,'TV','Plate TV',799.90,20,'C',9144),(1234,'TV','Plate TV',1499.99,5,'A',7671),(1516,'Mouse','Wireless Mouse',49.40,50,'B',9794),(1516,'Mouse','Wireless Mouse',69.50,20,'A',7807),(1516,'Mouse','Wireless Mouse',69.90,25,'C',2345),(1516,'Mouse','Wireless Mouse',99.50,30,'A',3579),(2591,'Camera','Instant Camera',179.50,30,'C',8642),(2591,'Camera','Digital Camera',449.40,50,'A',3592),(2591,'Camera','Digital Camera',499.90,10,'B',9512),(2591,'Camera','Camera',799.90,50,'B',7890),(3034,'Telephone','Home Telephone',59.50,20,'A',8655),(3034,'Telephone','Home telephone',99.90,25,'A',8765),(3034,'Telephone','Home Telephone',169.99,15,'A',8692),(3034,'Telephone','Cordless Phone',299.99,40,'A',3456),(3374,'Laptop','Refurbished Laptop',1099.10,20,'A',6954),(3374,'Laptop','Laptop',1369.90,15,'A',4567),(3374,'Laptop','Laptop',1399.20,10,'B',1357),(3374,'Laptop','MacBook Pro',1799.90,30,'A',9876);
/*!40000 ALTER TABLE `producttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliertable`
--

DROP TABLE IF EXISTS `suppliertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliertable` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(255) NOT NULL,
  `ContactName` varchar(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=9877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliertable`
--

LOCK TABLES `suppliertable` WRITE;
/*!40000 ALTER TABLE `suppliertable` DISABLE KEYS */;
INSERT INTO `suppliertable` VALUES (1357,'Sharp','123 Tokyo St','80-4745-3107','support@sharp.co.jp'),(2345,'MSI','789 Mofan St','943-299-465','support@msi.tw'),(3456,'Panasonic','246 Osaka St','443-887-9967','support@panasonic.co.jp'),(3579,'RedPark Ltd.','789 Park Ave','604-683-2555','info@redpark.ca'),(3592,'IBM','456 New York St','201-335-9423','support@ibm.com'),(4567,'Qualcomm','456 San Diego St','44-7700-087231','info@qualcomm.co.uk'),(6954,'Apple','246 Cupertino St','202-918-2132','support@apple.com'),(7084,'Acer','135 Taipei St','905-926-031','support@acer.tw'),(7671,'LG Electronics','789 Busan St','668-286-5378','support@lge.kr'),(7807,'Intel','2200 Mission College Blvd','408-646-7611','support@intel.com'),(7890,'Samsung','456 Seoul St','909-763-4442','support@samsung.com'),(8642,'Xerox Inc.','456 High St','505-398-8414','info@xrx.com'),(8655,'Dell','246 Austin St','505-351-3181','support@dell.com'),(8672,'AMD','246 Santa Clara St','312-866-2043','support@amd.com'),(8692,'Microsoft','123 Redmond St','505-549-0420','support@microsoft.com'),(8765,'Philips','789 Amsterdam St','61-483-898-670','support@philips.au'),(9144,'Fujitsu','456 Tokyo St','03-3556-7890','support@fujitsu.co.jp'),(9512,'Acme Corporation','123 Main St','205-288-8591','info@acme-corp.com'),(9794,'Amazon','246 Seattle St','555-343-8950','support@amazon.com'),(9876,'Toshiba','246 Osaka St','90-6378-0835','support@toshiba.co.jp');
/*!40000 ALTER TABLE `suppliertable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-05 18:03:13
