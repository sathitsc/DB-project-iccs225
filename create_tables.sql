

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255) NOT NULL
);


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


CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255)
);


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

CREATE TABLE SecurityLogs (
    LogID SERIAL PRIMARY KEY,          -- Unique identifier for each log
    EventTime TIMESTAMP DEFAULT NOW(), -- Automatically logs the time of the event
    EventType VARCHAR(100),            -- Type of event (e.g., 'SALE_REGISTERED', 'STATUS_UPDATE')
    TableName VARCHAR(100),            -- Name of the affected table (e.g., 'Vehicles', 'SalesTransactions')
    RecordID INT,                      -- ID of the affected record (e.g., VehicleID or BranchID)
    PerformedBy INT,                   -- StaffID
    Details TEXT                       
);
