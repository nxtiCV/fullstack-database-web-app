use car_rental;

-- DRIVER LICENSE
INSERT INTO DriverLicense (DriverLicenseNumber, StateIssued, ExpirationDate)
VALUES
('199923452', 'NY', '2030-04-30'),
('189002893', 'NY', '2027-04-30'),
('220098445', 'NJ', '2026-04-30'),
('673389000', 'CT', '2029-04-30'),
('146722987', 'PA', '2027-07-30'),
('228119283', 'PA', '2027-05-30'),
('400012342', 'NY', '2028-04-30'),
('337848422', 'NJ', '2031-04-30'),
('691029946', 'NJ', '2032-05-30'),
('901100200', 'CT', '2026-05-30'),
('200933673', 'PA', '2029-05-30'),
('762201983', 'NY', '2030-05-30');


-- CUSTOMER
INSERT INTO Customer (FirstName, LastName, PhoneNumber, EmailAddress, LicenseID, Street, City, State)
VALUES
('John', 'Smith', '(347)746-1099', 'jsmith@gmail.com', 1, '123 Cherry St.', 'Stonebridge', 'NY'),
('Ava', 'Louise', '(646)389-2910', 'itsava111@yahoo.com', 2, '211 Maple Grove', 'Raventown', 'NY'),
('Chris', 'Halloway', '(347)110-8972', 'chrish123@gmail.com', 3, '33 Lantern Rd.', 'Louisville', 'NJ'),
('Jenna', 'Finch', '(917)424-5570', 'jennafinch@aol.com', 4, '101 Apple Lane', 'Newport', 'CT'),
('Leah', 'Pierce', '(646)992-1072', 'pierceleah@aol.com', 5, '174 Blackbird Blvd.', 'Lexington', 'PA'),
('Lauren', 'Whitaker', '(312)555-2355', 'lauren.whitaker@aol.com', 6, '225 Maple Drive', 'Westmont', 'PA'),
('Marcus', 'Delmont', '(503)873-3392', 'marcus2000@gmail.com', 7, '2214 Ridgeview Pt.', 'Fairlake', 'NY'),
('James', 'McAllister', '(914)326-0012', 'james._122@yahoo.com', 8, '729 Carroway St.', 'Havenford', 'NJ'),
('Nia', 'Fontaine', '(678)123-4567', 'niafontaine.123@hotmail.com', 9, '4220 Horizon Blvd.', 'Louisville', 'NJ'),
('Andre', 'Costa', '(914)772-3234', 'costa.a@outlook.com', 10, '123 Parkvale Lane', 'Glenville', 'CT'),
('Kendall', 'Ramos', '(347)723-4586', 'kramos111@outlook.com', 11, '223 Seabrooke St.', 'Lexington', 'PA'),
('Gavin', 'Kim', '(646)923-6335', 'kim_gavin@hotmail.com', 12, '1224 Terrance Lane', 'Brookville', 'NY');

-- RENTAL LOCATIONS
INSERT INTO RentalLocation (Name, Street, City, State, PhoneNumber, EmailAddress)
VALUES
('Drive Away Rentals', '1233 New Port Rd.', 'Brookstead', 'NY', '(718)224-2340', 'driveawayrentals@gmail.com'),
('Quick Wheels Rentals', '234 Hawthorne Springs', 'Carroway', 'NJ', '(646)244-1028', 'quickwheelsrentals@aol.com'),
('RentRite Autos', '8211 Cypress Dr.', 'New Haven', 'NJ', '(917)345-9923', 'rentriteautos@gmail.com'),
('Prime Drive Rentals', '1023 Maplewood Rd.', 'Westbrooke', 'PA', '(718)567-2331', 'primedriverentals@yahoo.com');


-- VEHICLE STATUS
INSERT INTO VehicleStatus (Availability)
VALUES
('maintenance'),
('available'),
('rented');

-- VEHICLE TYPE
INSERT INTO VehicleType (TypeName)
VALUES
('Sedan'),
('SUV'),
('Coupe'),
('Van'),
('Compact'),
('Crossover'),
('Minivan'),
('Pickup'),
('Convertible');

-- VEHICLE
INSERT INTO Vehicle (Make, Model, Year, LicensePlateNumber, RentalPerDay, LocationID, StatusID, TypeID)
VALUES
('Honda', 'Civic', '2024', 'JTZ-4892', 38.00, 1, 2, 1),
('Toyota', 'Corolla', '2025', 'HLP-9072', 44.00, 2, 1, 1),
('Nissan', 'Pathfinder', '2014', 'MRL-7128', 75.00, 3, 1, 2),
('Ford', 'Mustang GT', '2025', 'CKV-1234', 82.00, 4, 3, 3),
('Ford', 'Transit 350 HD', '2022', 'TXS-0012', 34.00, 1, 2, 4),
('Nissan', 'Altima', '2023', 'NJD-9150', 55.00, 4, 2, 1),
('Toyota', 'RAV4 XLE', '2021', 'AWS-0008', 72.00, 4, 2, 2),
('Honda', 'Accord Sport', '2020', 'NAO-1234', 60.00, 1, 3, 1),
('Mazda', 'Mazda3 Hatchback', '2025', 'KXS-9180', 91.00, 3, 2, 5),
('Subaru', 'Outback Premium AWD', '2022', 'POA-3211', 55.00, 2, 2, 6),
('Toyota', 'Sienna XLE AWD', '2023', 'AJR-2250', 32.00, 4, 1, 7),
('Ford', 'Fiesta SE', '2019', 'ALP-2110', 43.00, 2, 1, 5),
('Tesla', 'Model Y Long Range', '2023', 'LMN-1519', 110.00, 3, 3, 2),
('Chevrolet', 'Silverado 1500 LTZ', '2022',  'JJK-1010', 62.00, 1, 2, 8),
('Mazda', 'MX-5 Miata RF', '2021', 'LMO-2665', 98.00, 2, 2, 9),
('Hyundai', 'Elantra SEL', 2023, 'DQR-5432', 47.00, 3, 1, 1),
('Jeep', 'Grand Cherokee L', 2024, 'GHT-7781', 85.00, 1, 2, 2),
('Chevrolet', 'Camaro LT', 2021, 'ZXC-3321', 78.00, 2, 3, 3),
('Chrysler', 'Pacifica Touring L', 2022, 'BBQ-1290', 59.00, 4, 1, 7),
('Ford', 'EcoSport SE', 2023, 'HYT-5622', 50.00, 3, 3, 6);

-- MAINTENANCE STATUS
INSERT INTO MaintenanceStatus (MaintenanceStatusName)
VALUES
('Scheduled'),
('In Progress'),
('Completed'),
('Cancelled'),
('Delayed'),
('Awaiting Parts'),
('Finished');

-- MAINTENANCE
INSERT INTO Maintenance (EntryDate, StartDate, EndDate, ServiceDescription, Cost, VehicleID, MaintenanceStatusID)
VALUES
('2025-05-01', '2025-05-01', '2025-05-02', 'Brake Replacement', 220.00, 10, 3),
('2025-05-03', '2025-05-04', '2025-05-04', 'Oil Change', 75.00, 12, 3),
('2025-05-06', '2025-05-07', '2025-05-08', 'Tire Rotation', 50.00, 9, 2),
('2025-05-08', '2025-05-10', '2025-05-11', 'Battery Replacement', 180.00, 8, 1),
('2025-05-10', '2025-05-11', '2025-05-13', 'Engine Tune-Up', 300.00, 6, 2),
('2025-05-11', '2025-05-12', '2025-05-13', 'AC Repair', 250.00, 5, 4),
('2025-05-12', '2025-05-13', '2025-05-15', 'Transmission Service', 600.00, 3, 3);

-- RESERVATION STATUS
INSERT INTO ReservationStatus (ReservationStatusName)
VALUES 
('Confirmed'),
('Pending'),
('Cancelled'),
('Completed'),
('No Show'),
('Checked Out'),
('Delayed');

-- RESERVATION 
INSERT INTO  Reservation (EntryDate, StartDate, EndDate, TotalCost, TypeID, LocationID, CustomerID, ReservationStatusID)
VALUES
('2025-04-25', '2025-05-01', '2025-05-05', 199.99, 1, 1, 1, 1),
('2025-04-28', '2025-05-02', '2025-05-06', 219.99, 2, 2, 2, 2),
('2025-05-01', '2025-05-05', '2025-05-09', 239.99, 3, 3, 3, 3),
('2025-05-02', '2025-05-06', '2025-05-10', 259.99, 4, 4, 4, 1),
('2025-05-03', '2025-05-07', '2025-05-11', 279.99, 1, 2, 5, 2),
('2025-05-04', '2025-05-08', '2025-05-12', 299.99, 2, 1, 6, 1),
('2025-05-05', '2025-05-09', '2025-05-13', 319.99, 3, 3, 7, 4);


-- RENTAL STATUS
INSERT INTO RentalStatus (RentalStatusName)
VALUES
('active'),
('completed'),
('cancelled');

-- RENTAL
INSERT INTO Rental (RentalEntryDate, RentalStartDate, RentalEndDate, TotalCost, RentalStatusID, ReservationID, CustomerID, VehicleID)
VALUES
('2025-04-25', '2025-04-27', '2025-05-01', 152.00, 1, 1, 1, 1),
('2025-04-20', '2025-04-22', '2025-04-30', 352.00, 2, NULL, 2, 5),
('2025-04-15', '2025-04-17', '2025-04-21', 240.00, 3, 3, 3, 9),
('2025-04-18', '2025-04-20', '2025-04-23', 123.00, 2, NULL, 4, 7),
('2025-04-10', '2025-04-12', '2025-04-16', 164.00, 3, 5, 5, 2),
('2025-04-22', '2025-04-24', '2025-04-28', 248.00, 1, NULL, 6, 14),
('2025-04-24', '2025-04-26', '2025-04-30', 180.00, 2, 2, 7, 6),
('2025-04-26', '2025-04-28', '2025-05-02', 220.00, 1, NULL, 8, 10),
('2025-04-27', '2025-04-29', '2025-05-03', 110.00, 2, 6, 9, 12),
('2025-04-15', '2025-04-17', '2025-04-20', 186.00, 3, NULL, 10, 13);

