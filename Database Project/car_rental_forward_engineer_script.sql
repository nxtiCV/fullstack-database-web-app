-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_rental
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `car_rental` ;

-- -----------------------------------------------------
-- Schema car_rental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_rental` DEFAULT CHARACTER SET utf8 ;
USE `car_rental` ;

-- -----------------------------------------------------
-- Table `car_rental`.`DriverLicense`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`DriverLicense` (
  `LicenseID` INT NOT NULL AUTO_INCREMENT,
  `DriverLicenseNumber` VARCHAR(50) NOT NULL,
  `StateIssued` VARCHAR(50) NOT NULL,
  `ExpirationDate` DATE NOT NULL,
  PRIMARY KEY (`LicenseID`),
  UNIQUE INDEX `DriverLicenseNumber_UNIQUE` (`DriverLicenseNumber` ASC) VISIBLE,
  UNIQUE INDEX `LicenseID_UNIQUE` (`LicenseID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  `LicenseID` INT NOT NULL,
  `Street` VARCHAR(100) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `Customer_to_DriverLicense_idx` (`LicenseID` ASC) INVISIBLE,
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  UNIQUE INDEX `PhoneNumber_UNIQUE` (`PhoneNumber` ASC) VISIBLE,
  UNIQUE INDEX `EmailAddress_UNIQUE` (`EmailAddress` ASC) VISIBLE,
  UNIQUE INDEX `LicenseID_UNIQUE` (`LicenseID` ASC) VISIBLE,
  CONSTRAINT `Customer_to_DriverLicense`
    FOREIGN KEY (`LicenseID`)
    REFERENCES `car_rental`.`DriverLicense` (`LicenseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`RentalLocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`RentalLocation` (
  `LocationID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Street` VARCHAR(100) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE INDEX `PhoneNumber_UNIQUE` (`PhoneNumber` ASC) VISIBLE,
  UNIQUE INDEX `EmailAddress_UNIQUE` (`EmailAddress` ASC) VISIBLE,
  UNIQUE INDEX `LocationID_UNIQUE` (`LocationID` ASC) VISIBLE,
  UNIQUE INDEX `Street_UNIQUE` (`Street` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`VehicleStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`VehicleStatus` (
  `StatusID` INT NOT NULL AUTO_INCREMENT,
  `Availability` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`StatusID`),
  UNIQUE INDEX `Availability_UNIQUE` (`Availability` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`VehicleType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`VehicleType` (
  `TypeID` INT NOT NULL AUTO_INCREMENT,
  `TypeName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`TypeID`),
  UNIQUE INDEX `TypeID_UNIQUE` (`TypeID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`Vehicle` (
  `VehicleID` INT NOT NULL AUTO_INCREMENT,
  `LicensePlateNumber` VARCHAR(20) NOT NULL,
  `RentalPerDay` DECIMAL(10,2) NOT NULL,
  `StatusID` INT NOT NULL,
  `LocationID` INT NOT NULL,
  `TypeID` INT NOT NULL,
  `Make` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VehicleID`),
  UNIQUE INDEX `LicensePlateNumber_UNIQUE` (`LicensePlateNumber` ASC) VISIBLE,
  INDEX `Vehicle_to_VehicleStatus_idx` (`StatusID` ASC) VISIBLE,
  INDEX `Vehicle_to_RentalLocation_idx` (`LocationID` ASC) VISIBLE,
  INDEX `Vehicle_to_VehicleType_idx` (`TypeID` ASC) VISIBLE,
  UNIQUE INDEX `VehicleID_UNIQUE` (`VehicleID` ASC) VISIBLE,
  CONSTRAINT `Vehicle_to_VehicleStatus`
    FOREIGN KEY (`StatusID`)
    REFERENCES `car_rental`.`VehicleStatus` (`StatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Vehicle_to_RentalLocation`
    FOREIGN KEY (`LocationID`)
    REFERENCES `car_rental`.`RentalLocation` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Vehicle_to_VehicleType`
    FOREIGN KEY (`TypeID`)
    REFERENCES `car_rental`.`VehicleType` (`TypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`RentalStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`RentalStatus` (
  `RentalStatusID` INT NOT NULL AUTO_INCREMENT,
  `RentalStatusName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RentalStatusID`),
  UNIQUE INDEX `RentalStatusName_UNIQUE` (`RentalStatusName` ASC) VISIBLE,
  UNIQUE INDEX `RentalStatusID_UNIQUE` (`RentalStatusID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`ReservationStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`ReservationStatus` (
  `ReservationStatusID` INT NOT NULL AUTO_INCREMENT,
  `ReservationStatusName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ReservationStatusID`),
  UNIQUE INDEX `ReservationStatusID_UNIQUE` (`ReservationStatusID` ASC) VISIBLE,
  UNIQUE INDEX `ReservationStatusName_UNIQUE` (`ReservationStatusName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`Reservation` (
  `ReservationID` INT NOT NULL AUTO_INCREMENT,
  `EntryDate` DATE NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `ReservationStatusID` INT NOT NULL,
  `LocationID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TypeID` INT NOT NULL,
  PRIMARY KEY (`ReservationID`),
  UNIQUE INDEX `ReservationID_UNIQUE` (`ReservationID` ASC) VISIBLE,
  INDEX `fk_Reservation_to_ReservationStatus_idx` (`ReservationStatusID` ASC) VISIBLE,
  INDEX `fk_Reservation_to_RentalLocation_idx` (`LocationID` ASC) VISIBLE,
  INDEX `fk_Reservation_to_Customer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Reservation_to_VehicleType_idx` (`TypeID` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_to_ReservationStatus`
    FOREIGN KEY (`ReservationStatusID`)
    REFERENCES `car_rental`.`ReservationStatus` (`ReservationStatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_to_RentalLocation`
    FOREIGN KEY (`LocationID`)
    REFERENCES `car_rental`.`RentalLocation` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_to_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `car_rental`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_to_VehicleType`
    FOREIGN KEY (`TypeID`)
    REFERENCES `car_rental`.`VehicleType` (`TypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`Rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`Rental` (
  `RentalID` INT NOT NULL AUTO_INCREMENT,
  `RentalEntryDate` DATE NOT NULL,
  `RentalStartDate` DATE NOT NULL,
  `RentalEndDate` DATE NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `RentalStatusID` INT NOT NULL,
  `VehicleID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `ReservationID` INT NULL,
  PRIMARY KEY (`RentalID`),
  INDEX `RentalStatusID_idx` (`RentalStatusID` ASC) VISIBLE,
  INDEX `Rental_to_Vehicle_idx` (`VehicleID` ASC) VISIBLE,
  INDEX `Rental_to_Customer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Rental_to_Reservation_idx` (`ReservationID` ASC) VISIBLE,
  CONSTRAINT `Rental_to_RentalStatus`
    FOREIGN KEY (`RentalStatusID`)
    REFERENCES `car_rental`.`RentalStatus` (`RentalStatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rental_to_Vehicle`
    FOREIGN KEY (`VehicleID`)
    REFERENCES `car_rental`.`Vehicle` (`VehicleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rental_to_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `car_rental`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rental_to_Reservation`
    FOREIGN KEY (`ReservationID`)
    REFERENCES `car_rental`.`Reservation` (`ReservationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`MaintenanceStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`MaintenanceStatus` (
  `MaintenanceStatusID` INT NOT NULL AUTO_INCREMENT,
  `MaintenanceStatusName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MaintenanceStatusID`),
  UNIQUE INDEX `MaintenanceStatusName_UNIQUE` (`MaintenanceStatusName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_rental`.`Maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_rental`.`Maintenance` (
  `MaintenanceID` INT NOT NULL AUTO_INCREMENT,
  `EntryDate` VARCHAR(45) NOT NULL,
  `StartDate` VARCHAR(45) NOT NULL,
  `EndDate` VARCHAR(45) NOT NULL,
  `ServiceDescription` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `VehicleID` INT NOT NULL,
  `MaintenanceStatusID` INT NOT NULL,
  PRIMARY KEY (`MaintenanceID`),
  INDEX `fk_Maintenance_to_Vehicle_idx` (`VehicleID` ASC) VISIBLE,
  INDEX `fk_Maintenance_to_MaintenanceStatus_idx` (`MaintenanceStatusID` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance_to_Vehicle`
    FOREIGN KEY (`VehicleID`)
    REFERENCES `car_rental`.`Vehicle` (`VehicleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maintenance_to_MaintenanceStatus`
    FOREIGN KEY (`MaintenanceStatusID`)
    REFERENCES `car_rental`.`MaintenanceStatus` (`MaintenanceStatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
