from db import get_connection

# get all locations and their vehicles
def get_rental_locations():
    sql= '''
    SELECT * FROM RentalLocation 
    ORDER BY LocationID;
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    rental_locations = cursor.fetchall()
    cursor.close()
    connection.close()
    return rental_locations

def get_vehicles_by_location(LocationID):
    sql='''
    SELECT v.LicensePlateNumber, v.RentalPerDay, v.Make, v.Model, v.Year,
    vs.Availability, 
    vt.TypeName
    FROM Vehicle v
    JOIN VehicleStatus vs
    ON v.StatusID = vs.StatusID
    JOIN VehicleType vt
    ON v.TypeID = vt.TypeID
    '''
    sql = sql + 'WHERE LocationID ='+str(LocationID)
    print(sql)
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    vehicles = cursor.fetchall()
    cursor.close()
    connection.close()
    return vehicles

# get all vehicles and their location
def get_vehicle():
    sql= '''
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
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    vehicle = cursor.fetchall()
    cursor.close()
    connection.close()
    return vehicle


# get all customers and their license info
def get_customers():
    sql= '''
    SELECT c.CustomerID, c.FirstName, c.LastName, c.EmailAddress, c.PhoneNumber, c.Street, c.City, c.State,
    d.DriverLicenseNumber, d.ExpirationDate
    FROM Customer c
    JOIN  DriverLicense d
    ON c.LicenseID = d.LicenseID
    ORDER BY CustomerID;
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    customers = cursor.fetchall()
    cursor.close()
    connection.close()
    return customers

# get all rentals and their customer info, status, and vehicle info, and reservation
def get_rental():
    sql= '''
        SELECT
      r.RentalEntryDate, r.RentalStartDate, r.RentalEndDate, r.TotalCost, r.RentalID, 
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
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    rental = cursor.fetchall()
    cursor.close()
    connection.close()
    return rental

# get all maintenance records and their status and the vehicle
def get_maintenance():
    sql= '''
    SELECT m.MaintenanceID, m.EntryDate, m.StartDate, m.EndDate, m.ServiceDescription, m.Cost,
    v.Make, v.Model, v.Year, v.LicensePlateNumber, 
    ms.MaintenanceStatusName
    FROM Maintenance m
    JOIN Vehicle v
    ON m.VehicleID = v.VehicleID
    JOIN MaintenanceStatus ms
    ON ms.MaintenanceStatusID = m.MaintenanceStatusID
    ORDER BY MaintenanceID;
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    maintenance = cursor.fetchall()
    cursor.close()
    connection.close()
    return maintenance

# get all reservation records and their status and customer
def get_reservation():
    sql= '''
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
    '''
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute(sql)
    reservation = cursor.fetchall()
    cursor.close()
    connection.close()
    return reservation


