-- Inserting data into Branches table
INSERT INTO Branches (BranchID, BranchName) VALUES
(1, 'Berlin Used Car Dealership'),
(2, 'Munich Used Car Dealership'),
(3, 'Frankfurt Used Car Dealership');

-- Inserting data into Vehicles table
INSERT INTO Vehicles (VehicleID, Brand, ModelName, Color, Year, Mileage, Price, Status, DateSold, BranchID) VALUES
(101, 'BMW', '320i', 'Black', 2022, 15000, 35000.00, 'Available', NULL, 1),
(102, 'BMW', 'X5', 'White', 2020, 22000, 45000.00, 'Sold', '2024-11-25', 2),
(103, 'BMW', 'M3', 'Red', 2023, 5000, 75000.00, 'Sold', '2024-11-28', 3),
(104, 'Audi', 'A4', 'Blue', 2021, 18000, 38000.00, 'Available', NULL, 1),
(105, 'Audi', 'Q5', 'Gray', 2022, 12000, 50000.00, 'Sold', '2024-11-22', 2),
(106, 'Mercedes', 'C220', 'Silver', 2023, 8000, 60000.00, 'Available', NULL, 3),
(107, 'Porsche', '911', 'Yellow', 2022, 10000, 90000.00, 'Available', NULL, 1);

-- Inserting data into Staff table
INSERT INTO Staff (StaffID, FirstName, LastName, BranchID) VALUES
(201, 'Harry', 'Potter', 1),
(202, 'Jane', 'Smith', 2),
(203, 'Carlos', 'Gomez', 3);

-- Inserting data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
(301, 'Michael', 'Jordan', 'michael.jordan@example.com'),
(302, 'Sarah', 'Williams', 'sarah.williams@example.com'),
(303, 'David', 'Beckham', 'david.beckham@example.com');

-- Inserting data into SalesTransactions table
INSERT INTO SalesTransactions (VehicleID, SaleDate, BranchID, CustomerID, StaffID) VALUES
(102, '2024-11-25', 2, 301, 202),
(103, '2024-11-28', 3, 302, 203),
(105, '2024-11-22', 2, 303, 202);
