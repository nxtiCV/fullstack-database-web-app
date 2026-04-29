-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: car_rental
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `LicenseID` int NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `EmailAddress_UNIQUE` (`EmailAddress`),
  UNIQUE KEY `LicenseID_UNIQUE` (`LicenseID`),
  KEY `Customer_to_DriverLicense_idx` (`LicenseID`) /*!80000 INVISIBLE */,
  CONSTRAINT `Customer_to_DriverLicense` FOREIGN KEY (`LicenseID`) REFERENCES `driverlicense` (`LicenseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Smith','(347)746-1099','jsmith@gmail.com',1,'123 Cherry St.','Stonebridge','NY'),(2,'Ava','Louise','(646)389-2910','itsava111@yahoo.com',2,'211 Maple Grove','Raventown','NY'),(3,'Chris','Halloway','(347)110-8972','chrish123@gmail.com',3,'33 Lantern Rd.','Louisville','NJ'),(4,'Jenna','Finch','(917)424-5570','jennafinch@aol.com',4,'101 Apple Lane','Newport','CT'),(5,'Leah','Pierce','(646)992-1072','pierceleah@aol.com',5,'174 Blackbird Blvd.','Lexington','PA'),(6,'Lauren','Whitaker','(312)555-2355','lauren.whitaker@aol.com',6,'225 Maple Drive','Westmont','PA'),(7,'Marcus','Delmont','(503)873-3392','marcus2000@gmail.com',7,'2214 Ridgeview Pt.','Fairlake','NY'),(8,'James','McAllister','(914)326-0012','james._122@yahoo.com',8,'729 Carroway St.','Havenford','NJ'),(9,'Nia','Fontaine','(678)123-4567','niafontaine.123@hotmail.com',9,'4220 Horizon Blvd.','Louisville','NJ'),(10,'Andre','Costa','(914)772-3234','costa.a@outlook.com',10,'123 Parkvale Lane','Glenville','CT'),(11,'Kendall','Ramos','(347)723-4586','kramos111@outlook.com',11,'223 Seabrooke St.','Lexington','PA'),(12,'Gavin','Kim','(646)923-6335','kim_gavin@hotmail.com',12,'1224 Terrance Lane','Brookville','NY');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverlicense`
--

DROP TABLE IF EXISTS `driverlicense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driverlicense` (
  `LicenseID` int NOT NULL AUTO_INCREMENT,
  `DriverLicenseNumber` varchar(50) NOT NULL,
  `StateIssued` varchar(50) NOT NULL,
  `ExpirationDate` date NOT NULL,
  PRIMARY KEY (`LicenseID`),
  UNIQUE KEY `DriverLicenseNumber_UNIQUE` (`DriverLicenseNumber`),
  UNIQUE KEY `LicenseID_UNIQUE` (`LicenseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverlicense`
--

LOCK TABLES `driverlicense` WRITE;
/*!40000 ALTER TABLE `driverlicense` DISABLE KEYS */;
INSERT INTO `driverlicense` VALUES (1,'199923452','NY','2030-04-30'),(2,'189002893','NY','2027-04-30'),(3,'220098445','NJ','2026-04-30'),(4,'673389000','CT','2029-04-30'),(5,'146722987','PA','2027-07-30'),(6,'228119283','PA','2027-05-30'),(7,'400012342','NY','2028-04-30'),(8,'337848422','NJ','2031-04-30'),(9,'691029946','NJ','2032-05-30'),(10,'901100200','CT','2026-05-30'),(11,'200933673','PA','2029-05-30'),(12,'762201983','NY','2030-05-30');
/*!40000 ALTER TABLE `driverlicense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `MaintenanceID` int NOT NULL AUTO_INCREMENT,
  `EntryDate` varchar(45) NOT NULL,
  `StartDate` varchar(45) NOT NULL,
  `EndDate` varchar(45) NOT NULL,
  `ServiceDescription` varchar(45) NOT NULL,
  `Cost` varchar(45) NOT NULL,
  `VehicleID` int NOT NULL,
  `MaintenanceStatusID` int NOT NULL,
  PRIMARY KEY (`MaintenanceID`),
  KEY `fk_Maintenance_to_Vehicle_idx` (`VehicleID`),
  KEY `fk_Maintenance_to_MaintenanceStatus_idx` (`MaintenanceStatusID`),
  CONSTRAINT `fk_Maintenance_to_MaintenanceStatus` FOREIGN KEY (`MaintenanceStatusID`) REFERENCES `maintenancestatus` (`MaintenanceStatusID`),
  CONSTRAINT `fk_Maintenance_to_Vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'2025-05-01','2025-05-01','2025-05-02','Brake Replacement','220.00',10,3),(2,'2025-05-03','2025-05-04','2025-05-04','Oil Change','75.00',12,3),(3,'2025-05-06','2025-05-07','2025-05-08','Tire Rotation','50.00',9,2),(4,'2025-05-08','2025-05-10','2025-05-11','Battery Replacement','180.00',8,1),(5,'2025-05-10','2025-05-11','2025-05-13','Engine Tune-Up','300.00',6,2),(6,'2025-05-11','2025-05-12','2025-05-13','AC Repair','250.00',5,4),(7,'2025-05-12','2025-05-13','2025-05-15','Transmission Service','600.00',3,3);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancestatus`
--

DROP TABLE IF EXISTS `maintenancestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancestatus` (
  `MaintenanceStatusID` int NOT NULL AUTO_INCREMENT,
  `MaintenanceStatusName` varchar(45) NOT NULL,
  PRIMARY KEY (`MaintenanceStatusID`),
  UNIQUE KEY `MaintenanceStatusName_UNIQUE` (`MaintenanceStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancestatus`
--

LOCK TABLES `maintenancestatus` WRITE;
/*!40000 ALTER TABLE `maintenancestatus` DISABLE KEYS */;
INSERT INTO `maintenancestatus` VALUES (6,'Awaiting Parts'),(4,'Cancelled'),(3,'Completed'),(5,'Delayed'),(7,'Finished'),(2,'In Progress'),(1,'Scheduled');
/*!40000 ALTER TABLE `maintenancestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `RentalID` int NOT NULL AUTO_INCREMENT,
  `RentalEntryDate` date NOT NULL,
  `RentalStartDate` date NOT NULL,
  `RentalEndDate` date NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `RentalStatusID` int NOT NULL,
  `VehicleID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `ReservationID` int DEFAULT NULL,
  PRIMARY KEY (`RentalID`),
  KEY `RentalStatusID_idx` (`RentalStatusID`),
  KEY `Rental_to_Vehicle_idx` (`VehicleID`),
  KEY `Rental_to_Customer_idx` (`CustomerID`),
  KEY `fk_Rental_to_Reservation_idx` (`ReservationID`),
  CONSTRAINT `fk_Rental_to_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  CONSTRAINT `Rental_to_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `Rental_to_RentalStatus` FOREIGN KEY (`RentalStatusID`) REFERENCES `rentalstatus` (`RentalStatusID`),
  CONSTRAINT `Rental_to_Vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'2025-04-25','2025-04-27','2025-05-01',152.00,1,1,1,1),(2,'2025-04-20','2025-04-22','2025-04-30',352.00,2,5,2,NULL),(3,'2025-04-15','2025-04-17','2025-04-21',240.00,3,9,3,3),(4,'2025-04-18','2025-04-20','2025-04-23',123.00,2,7,4,NULL),(5,'2025-04-10','2025-04-12','2025-04-16',164.00,3,2,5,5),(6,'2025-04-22','2025-04-24','2025-04-28',248.00,1,14,6,NULL),(7,'2025-04-24','2025-04-26','2025-04-30',180.00,2,6,7,2),(8,'2025-04-26','2025-04-28','2025-05-02',220.00,1,10,8,NULL),(9,'2025-04-27','2025-04-29','2025-05-03',110.00,2,12,9,6),(10,'2025-04-15','2025-04-17','2025-04-20',186.00,3,13,10,NULL);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentallocation`
--

DROP TABLE IF EXISTS `rentallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentallocation` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `EmailAddress_UNIQUE` (`EmailAddress`),
  UNIQUE KEY `LocationID_UNIQUE` (`LocationID`),
  UNIQUE KEY `Street_UNIQUE` (`Street`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentallocation`
--

LOCK TABLES `rentallocation` WRITE;
/*!40000 ALTER TABLE `rentallocation` DISABLE KEYS */;
INSERT INTO `rentallocation` VALUES (1,'Drive Away Rentals','1233 New Port Rd.','Brookstead','NY','(718)224-2340','driveawayrentals@gmail.com'),(2,'Quick Wheels Rentals','234 Hawthorne Springs','Carroway','NJ','(646)244-1028','quickwheelsrentals@aol.com'),(3,'RentRite Autos','8211 Cypress Dr.','New Haven','NJ','(917)345-9923','rentriteautos@gmail.com'),(4,'Prime Drive Rentals','1023 Maplewood Rd.','Westbrooke','PA','(718)567-2331','primedriverentals@yahoo.com');
/*!40000 ALTER TABLE `rentallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalstatus`
--

DROP TABLE IF EXISTS `rentalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentalstatus` (
  `RentalStatusID` int NOT NULL AUTO_INCREMENT,
  `RentalStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`RentalStatusID`),
  UNIQUE KEY `RentalStatusName_UNIQUE` (`RentalStatusName`),
  UNIQUE KEY `RentalStatusID_UNIQUE` (`RentalStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalstatus`
--

LOCK TABLES `rentalstatus` WRITE;
/*!40000 ALTER TABLE `rentalstatus` DISABLE KEYS */;
INSERT INTO `rentalstatus` VALUES (1,'active'),(3,'cancelled'),(2,'completed');
/*!40000 ALTER TABLE `rentalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `EntryDate` date NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `ReservationStatusID` int NOT NULL,
  `LocationID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `TypeID` int NOT NULL,
  PRIMARY KEY (`ReservationID`),
  UNIQUE KEY `ReservationID_UNIQUE` (`ReservationID`),
  KEY `fk_Reservation_to_ReservationStatus_idx` (`ReservationStatusID`),
  KEY `fk_Reservation_to_RentalLocation_idx` (`LocationID`),
  KEY `fk_Reservation_to_Customer_idx` (`CustomerID`),
  KEY `fk_Reservation_to_VehicleType_idx` (`TypeID`),
  CONSTRAINT `fk_Reservation_to_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `fk_Reservation_to_RentalLocation` FOREIGN KEY (`LocationID`) REFERENCES `rentallocation` (`LocationID`),
  CONSTRAINT `fk_Reservation_to_ReservationStatus` FOREIGN KEY (`ReservationStatusID`) REFERENCES `reservationstatus` (`ReservationStatusID`),
  CONSTRAINT `fk_Reservation_to_VehicleType` FOREIGN KEY (`TypeID`) REFERENCES `vehicletype` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2025-04-25','2025-05-01','2025-05-05',199.99,1,1,1,1),(2,'2025-04-28','2025-05-02','2025-05-06',219.99,2,2,2,2),(3,'2025-05-01','2025-05-05','2025-05-09',239.99,3,3,3,3),(4,'2025-05-02','2025-05-06','2025-05-10',259.99,1,4,4,4),(5,'2025-05-03','2025-05-07','2025-05-11',279.99,2,2,5,1),(6,'2025-05-04','2025-05-08','2025-05-12',299.99,1,1,6,2),(7,'2025-05-05','2025-05-09','2025-05-13',319.99,4,3,7,3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationstatus`
--

DROP TABLE IF EXISTS `reservationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationstatus` (
  `ReservationStatusID` int NOT NULL AUTO_INCREMENT,
  `ReservationStatusName` varchar(45) NOT NULL,
  PRIMARY KEY (`ReservationStatusID`),
  UNIQUE KEY `ReservationStatusID_UNIQUE` (`ReservationStatusID`),
  UNIQUE KEY `ReservationStatusName_UNIQUE` (`ReservationStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationstatus`
--

LOCK TABLES `reservationstatus` WRITE;
/*!40000 ALTER TABLE `reservationstatus` DISABLE KEYS */;
INSERT INTO `reservationstatus` VALUES (3,'Cancelled'),(6,'Checked Out'),(4,'Completed'),(1,'Confirmed'),(7,'Delayed'),(5,'No Show'),(2,'Pending');
/*!40000 ALTER TABLE `reservationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `VehicleID` int NOT NULL AUTO_INCREMENT,
  `LicensePlateNumber` varchar(20) NOT NULL,
  `RentalPerDay` decimal(10,2) NOT NULL,
  `StatusID` int NOT NULL,
  `LocationID` int NOT NULL,
  `TypeID` int NOT NULL,
  `Make` varchar(45) NOT NULL,
  `Model` varchar(45) NOT NULL,
  `Year` varchar(45) NOT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE KEY `LicensePlateNumber_UNIQUE` (`LicensePlateNumber`),
  UNIQUE KEY `VehicleID_UNIQUE` (`VehicleID`),
  KEY `Vehicle_to_VehicleStatus_idx` (`StatusID`),
  KEY `Vehicle_to_RentalLocation_idx` (`LocationID`),
  KEY `Vehicle_to_VehicleType_idx` (`TypeID`),
  CONSTRAINT `Vehicle_to_RentalLocation` FOREIGN KEY (`LocationID`) REFERENCES `rentallocation` (`LocationID`),
  CONSTRAINT `Vehicle_to_VehicleStatus` FOREIGN KEY (`StatusID`) REFERENCES `vehiclestatus` (`StatusID`),
  CONSTRAINT `Vehicle_to_VehicleType` FOREIGN KEY (`TypeID`) REFERENCES `vehicletype` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'JTZ-4892',38.00,2,1,1,'Honda','Civic','2024'),(2,'HLP-9072',44.00,1,2,1,'Toyota','Corolla','2025'),(3,'MRL-7128',75.00,1,3,2,'Nissan','Pathfinder','2014'),(4,'CKV-1234',82.00,3,4,3,'Ford','Mustang GT','2025'),(5,'TXS-0012',34.00,2,1,4,'Ford','Transit 350 HD','2022'),(6,'NJD-9150',55.00,2,4,1,'Nissan','Altima','2023'),(7,'AWS-0008',72.00,2,4,2,'Toyota','RAV4 XLE','2021'),(8,'NAO-1234',60.00,3,1,1,'Honda','Accord Sport','2020'),(9,'KXS-9180',91.00,2,3,5,'Mazda','Mazda3 Hatchback','2025'),(10,'POA-3211',55.00,2,2,6,'Subaru','Outback Premium AWD','2022'),(11,'AJR-2250',32.00,1,4,7,'Toyota','Sienna XLE AWD','2023'),(12,'ALP-2110',43.00,1,2,5,'Ford','Fiesta SE','2019'),(13,'LMN-1519',110.00,3,3,2,'Tesla','Model Y Long Range','2023'),(14,'JJK-1010',62.00,2,1,8,'Chevrolet','Silverado 1500 LTZ','2022'),(15,'LMO-2665',98.00,2,2,9,'Mazda','MX-5 Miata RF','2021'),(16,'DQR-5432',47.00,1,3,1,'Hyundai','Elantra SEL','2023'),(17,'GHT-7781',85.00,2,1,2,'Jeep','Grand Cherokee L','2024'),(18,'ZXC-3321',78.00,3,2,3,'Chevrolet','Camaro LT','2021'),(19,'BBQ-1290',59.00,1,4,7,'Chrysler','Pacifica Touring L','2022'),(20,'HYT-5622',50.00,3,3,6,'Ford','EcoSport SE','2023');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiclestatus`
--

DROP TABLE IF EXISTS `vehiclestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiclestatus` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `Availability` varchar(20) NOT NULL,
  PRIMARY KEY (`StatusID`),
  UNIQUE KEY `Availability_UNIQUE` (`Availability`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclestatus`
--

LOCK TABLES `vehiclestatus` WRITE;
/*!40000 ALTER TABLE `vehiclestatus` DISABLE KEYS */;
INSERT INTO `vehiclestatus` VALUES (2,'available'),(1,'maintenance'),(3,'rented');
/*!40000 ALTER TABLE `vehiclestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletype` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`TypeID`),
  UNIQUE KEY `TypeID_UNIQUE` (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (1,'Sedan'),(2,'SUV'),(3,'Coupe'),(4,'Van'),(5,'Compact'),(6,'Crossover'),(7,'Minivan'),(8,'Pickup'),(9,'Convertible');
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'car_rental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12  1:33:56
