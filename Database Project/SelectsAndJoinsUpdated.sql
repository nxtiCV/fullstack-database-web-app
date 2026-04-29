use car_rental;

-- SELECT STATEMENTS:
SELECT *
FROM RentalLocation;

SELECT *
FROM Vehicle;

SELECT *
FROM VehicleStatus;

SELECT *
FROM VehicleType;

SELECT *
FROM Maintenance;

SELECT *
FROM MaintenanceStatus;

SELECT *
FROM  Reservation;

SELECT * 
FROM ReservationStatus;

SELECT * 
FROM Rental;

SELECT *
FROM RentalStatus;

SELECT * 
FROM Customer;

SELECT *
FROM DriverLicense;

-- Join Vehicle with Vehicle Type, Vehicle Status, and Rental Location
SELECT v.VehicleID, v.LicensePlateNumber, v.RentalPerDay, v.Make, v.Model, v.Year,
vs.Availability, 
rl.Name,
vt.TypeName 
FROM Vehicle v
JOIN VehicleStatus vs
ON v.StatusID = vs.StatusID
JOIN RentalLocation rl
ON v.LocationID = rl.LocationID
JOIN VehicleType vt
ON v.TypeID = vt.TypeID
ORDER BY VehicleID;
 
-- JOIN Reservation with ReservationStatus, Customer, Rental Location, Vehicle Type — 
SELECT r.ReservationID, r.EntryDate, r.StartDate, r.EndDate, r.TotalCost, 
rs.ReservationStatusName, 
rl.Name,
c.FirstName, c.LastName, c.EmailAddress, c.PhoneNumber, c.State,
vt.TypeName 
FROM Reservation r 
JOIN ReservationStatus rs
ON r.ReservationStatusID = rs.ReservationStatusID
JOIN RentalLocation rl
ON r.LocationID = rl.LocationID
JOIN Customer c
ON r.CustomerID = c.CustomerID
JOIN VehicleType vt
ON r.TypeID = vt.TypeID
ORDER BY ReservationID;

-- JOIN rental table with Customer, Vehicle, Rental Status, and reservation
SELECT r.RentalEntryDate, r.RentalStartDate, r.RentalEndDate, r.TotalCost, r.RentalID, 
c.CustomerID, c.FirstName, c.LastName, 
v.VehicleID, v.Make, v.Model, v.Year, v.LicensePlateNumber,    
rs.RentalStatusID, rs.RentalStatusName  AS RentalStatus,
res.ReservationID, res.EntryDate AS ReservationEntryDate
FROM Rental r
JOIN Customer c
ON r.CustomerID = c.CustomerID
JOIN Vehicle v
ON r.VehicleID  = v.VehicleID
JOIN RentalStatus rs
ON r.RentalStatusID = rs.RentalStatusID
LEFT JOIN Reservation res
ON r.ReservationID = res.ReservationID
ORDER BY r.RentalID;

-- JOIN Maintenance with Vehicle and MaintenanceStatus — 
SELECT m.MaintenanceID, m.EntryDate, m.StartDate, m.EndDate, m.ServiceDescription, m.Cost,
v.Make, v.Model, v.Year, v.LicensePlateNumber, 
ms.MaintenanceStatusName
FROM Maintenance m
JOIN Vehicle v
ON m.VehicleID = v.VehicleID
JOIN MaintenanceStatus ms
ON ms.MaintenanceStatusID = m.MaintenanceStatusID
ORDER BY MaintenanceID;

-- JOIN customer and drivers license
SELECT c.CustomerID, c.FirstName, c.LastName, c.EmailAddress, c.PhoneNumber, c.Street, c.City, c.State,
d.DriverLicenseNumber, d.ExpirationDate
FROM Customer c
JOIN  DriverLicense d
ON c.LicenseID = d.LicenseID
ORDER BY CustomerID;

