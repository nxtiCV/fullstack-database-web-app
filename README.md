# Vehicle Rental Management System

## Overview
This project is a modular full-stack web application built using Flask and MySQL that simulates a vehicle rental management system. The system follows a layered architecture separating database logic, query handling, and application routing, with multiple test scripts used to validate functionality.

---

## Tech Stack
- Python
- Flask
- MySQL
- HTML/CSS
- SQL

---

## Project Structure

- `app.py` → Main Flask application (routes and web logic)
- `db.py` → Database connection and configuration
- `queries.py` → SQL query functions and database operations
- `templates/` → HTML templates for frontend rendering
- `test_*.py` → Test scripts for validating system components

---

## Database Design

This project includes a fully designed relational database for a vehicle rental system, created using MySQL Workbench.

- `car_rental_final_model.mwb` → ER diagram and database design model  
- `car_rental_forward_engineer_script.sql` → Generated schema creation script  
- `CarRentalDatabaseExportFINAL.sql` → Full database export including schema and data  
- `InsertQueries.sql` → Data insertion scripts for populating tables  
- `SelectsAndJoinsUpdated.sql` → Complex SQL queries using joins and filtering  

The database follows normalization principles and supports multi-entity relationships across customers, vehicles, rentals, and reservations.

---

## Key Features
- Modular backend architecture separating application logic and database operations
- MySQL relational database integration
- Dynamic web pages using Flask templates
- Data management for customers, vehicles, rentals, and reservations
- Structured database queries for multi-entity relationships
- Test scripts for verifying core system functionality

---

## Testing

The project includes multiple test scripts to validate system components:

- Customer operations
- Vehicle management
- Rental processing
- Reservation system
- Database connectivity

Run tests individually:

```bash
python test_customer.py
python test_vehicle.py
python test_reservation.py
python test_rental.py
```

---

## How to Run
1. Install dependencies:
```
pip install flask mysql-connector-python
```
2. Configure the database:
- Open db.py
- Update MySQL username, password, and database name
- Import the provided SQL schema into MySQL

3. Run the application:
```
python app.py
```

4. Open in browser:
```
http://localhost:5000
```
---

## My Contributions
This project was developed in a team of 3.
- Designed and implemented database schema and relational structure
- Developed SQL query layer (queries.py) for backend operations
- Built Flask routing and application logic (app.py)
- Contributed to system testing and validation scripts

---

## Learning Outcomes
- Modular backend system design
- Database integration with Flask and MySQL
- Separation of concerns in application architecture
- Writing and executing test scripts for validation
- Managing relational data across multiple entities
