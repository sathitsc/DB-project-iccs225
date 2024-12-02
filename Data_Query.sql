-- View all branches (dealerships)
SELECT * FROM Branches;

-- View all vehicles and their branches
SELECT v.VehicleID, v.Brand, v.ModelName, b.BranchName
FROM Vehicles v
JOIN Branches b ON v.BranchID = b.BranchID;

-- View all Customers Information
SELECT * FROM customers

-- View all Staff Information
SELECT * FROM staff

-- Check all sales transactions with customer and staff details
SELECT st.VehicleID, st.SaleDate, c.FirstName AS Customer, s.FirstName AS Staff, b.BranchName
FROM SalesTransactions st
JOIN Customers c ON st.CustomerID = c.CustomerID
JOIN Staff s ON st.StaffID = s.StaffID
JOIN Branches b ON st.BranchID = b.BranchID;

-- Function to register a sale transaction
CREATE OR REPLACE FUNCTION RegisterSale(
    vehicle_id INT,
    sale_date DATE,
    customer_id INT,
    staff_id INT
) RETURNS VOID AS $$
DECLARE
    branch_id INT;
BEGIN
    -- Get the BranchID of the vehicle
    SELECT BranchID INTO branch_id FROM Vehicles WHERE VehicleID = vehicle_id;

    -- Update the Vehicle status and sale date
    UPDATE Vehicles
    SET Status = 'Sold', DateSold = sale_date
    WHERE VehicleID = vehicle_id;

    -- Insert into SalesTransactions
    INSERT INTO SalesTransactions (VehicleID, SaleDate, BranchID, CustomerID, StaffID)
    VALUES (vehicle_id, sale_date, branch_id, customer_id, staff_id);
END;
$$ LANGUAGE plpgsql;

-- Trigger to Prevent Sale of an already Sold Vehicle
CREATE OR REPLACE FUNCTION PreventDuplicateSales()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT Status FROM Vehicles WHERE VehicleID = NEW.VehicleID) = 'Sold' THEN
        RAISE EXCEPTION 'This vehicle has already been sold.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER BeforeSaleInsert
BEFORE INSERT ON SalesTransactions
FOR EACH ROW
EXECUTE FUNCTION PreventDuplicateSales();

-- Customer Purchase History
CREATE OR REPLACE FUNCTION GetCustomerHistory(customer_id INT) RETURNS TABLE (
    VehicleID INT,
    Brand VARCHAR,
    ModelName VARCHAR,
    Year INT,
    SaleDate DATE,
    Price DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT v.VehicleID, v.Brand, v.ModelName, v.Year, st.SaleDate, v.Price
    FROM SalesTransactions st
    JOIN Vehicles v ON st.VehicleID = v.VehicleID
    WHERE st.CustomerID = customer_id;
END;
$$ LANGUAGE plpgsql;