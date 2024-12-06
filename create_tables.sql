
-- Recreate Branches table
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255) NOT NULL
);

-- Recreate Vehicles table
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Brand VARCHAR(100),
    ModelName VARCHAR(100),
    Color VARCHAR(50),
    Year INT,
    Mileage INT,
    Price DECIMAL(10, 2),
    Status VARCHAR(50),
    DateSold DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Recreate Staff table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

-- Recreate Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255)
);

-- Recreate SalesTransactions table
CREATE TABLE SalesTransactions (
    VehicleID INT,
    SaleDate DATE,
    BranchID INT,
    CustomerID INT,
    StaffID INT,
    PRIMARY KEY (VehicleID, SaleDate),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Recreate SecurityLogs table
CREATE TABLE SecurityLogs (
    LogID SERIAL PRIMARY KEY,
    EventTime TIMESTAMP DEFAULT NOW(),
    EventType VARCHAR(100),
    TableName VARCHAR(100),
    RecordID INT,
    PerformedBy INT, -- StaffID only
    Details TEXT
);

