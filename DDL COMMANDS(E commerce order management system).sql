CREATE DATABASE Ecommerce_Order_Management;
USE Ecommerce_Order_Management;

-- 1. Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255)
);
-- 2. Address Table
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Postal_Code VARCHAR(10) NOT NULL,

    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- 3. Category Table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255)
);
-- 4. Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_ID INT NOT NULL,
    Product_Name VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock_Qty INT NOT NULL DEFAULT 0,

    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CHECK (Price >= 0),
    CHECK (Stock_Qty >= 0)
);
  -- 5. ORDERS TABLE
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL DEFAULT 0,

    Status ENUM(
        'Pending',
        'Confirmed',
        'Packed',
        'Shipped',
        'Delivered',
        'Cancelled'
    ) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CHECK (Total_Amount >= 0)
);
   -- 6.ORDER ITEM TABLE
  CREATE TABLE Order_Item (
    Order_Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CHECK (Quantity > 0),
    CHECK (Unit_Price >= 0),

    UNIQUE (Order_ID, Product_ID)
);
   -- 6.PAYMENT TABLE
   CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL UNIQUE,

    Method ENUM(
        'UPI',
        'Card',
        'Cash on Delivery',
        'Net Banking'
    ) NOT NULL,

    Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,

    Status ENUM(
        'Pending',
        'Completed',
        'Failed',
        'Refunded'
    ) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CHECK (Amount >= 0)
);
  -- 6. SHIPMENT TABLE
CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL UNIQUE,
    Carrier VARCHAR(100) NOT NULL,
    Tracking_No VARCHAR(100) UNIQUE,
    Ship_Date DATE,

    Status ENUM(
        'Pending',
        'Packed',
        'Shipped',
        'Delivered'
    ) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


