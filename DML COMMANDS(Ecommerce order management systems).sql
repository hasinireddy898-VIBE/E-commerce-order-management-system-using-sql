-- DML OPERATIONS
USE Ecommerce_Order_Management;
 -- 1.  INSERT CUSTOMERS
  
INSERT INTO Customer
(Name, Email, Phone, Address)
VALUES
('Teju', 'teju@gmail.com', '9876543210', 'Rajahmundry'),
('Hasini', 'hasini@gmail.com', '9876543211', 'Kakinada'),
('Bhargavi', 'bhargavi@gmail.com', '9876543212', 'Vijayawada'),
('Nandini', 'nandini@gmail.com', '9876543213', 'Visakhapatnam'),
('Ananya', 'ananya@gmail.com', '9876543214', 'Hyderabad');


  -- 2. INSERT ADDRESSES

INSERT INTO Address
(Customer_ID, City, State, Postal_Code)
VALUES
(1, 'Rajahmundry', 'Andhra Pradesh', '533101'),
(2, 'Kakinada', 'Andhra Pradesh', '533001'),
(3, 'Vijayawada', 'Andhra Pradesh', '520001'),
(4, 'Visakhapatnam', 'Andhra Pradesh', '530001'),
(5, 'Hyderabad', 'Telangana', '500001');

  -- 3. INSERT CATEGORIES
 

INSERT INTO Category
(Category_Name, Description)
VALUES
('Electronics', 'Electronic gadgets and devices'),
('Fashion', 'Clothing and accessories'),
('Books', 'Educational and general books'),
('Home Appliances', 'Appliances for home use');



 -- 4.  INSERT PRODUCTS
 

INSERT INTO Product
(Category_ID, Product_Name, Price, Stock_Qty)
VALUES
(1, 'Wireless Headphones', 1999.00, 50),
(1, 'Smart Watch', 2999.00, 30),
(2, 'Cotton Kurti', 899.00, 40),
(3, 'Python Programming Book', 599.00, 25),
(4, 'Electric Kettle', 1299.00, 20);



  -- 5. INSERT ORDERS
   

INSERT INTO Orders
(Customer_ID, Order_Date, Total_Amount, Status)
VALUES
(1, '2026-09-01', 3998.00, 'Confirmed'),
(2, '2026-09-02', 899.00, 'Shipped'),
(3, '2026-09-03', 599.00, 'Delivered'),
(4, '2026-09-04', 1299.00, 'Pending');



 -- 6.  INSERT ORDER ITEMS
   

INSERT INTO Order_Item
(Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
(1, 1, 2, 1999.00),
(2, 3, 1, 899.00),
(3, 4, 1, 599.00),
(4, 5, 1, 1299.00);



 -- 6.   INSERT PAYMENTS


INSERT INTO Payment
(Order_ID, Method, Amount, Payment_Date, Status)
VALUES
(1, 'UPI', 3998.00, '2026-09-01', 'Completed'),
(2, 'Card', 899.00, '2026-09-02', 'Completed'),
(3, 'Net Banking', 599.00, '2026-09-03', 'Completed'),
(4, 'Cash on Delivery', 1299.00, '2026-09-04', 'Pending');



  -- 7. INSERT SHIPMENTS
  

INSERT INTO Shipment
(Order_ID, Carrier, Tracking_No, Ship_Date, Status)
VALUES
(1, 'BlueDart', 'BD10001', '2026-09-02', 'Shipped'),
(2, 'DTDC', 'DT10002', '2026-09-03', 'Shipped'),
(3, 'Delhivery', 'DL10003', '2026-09-04', 'Delivered');


   -- DML - UPDATE
   


/* Update product stock */

UPDATE Product
SET Stock_Qty = Stock_Qty - 2
WHERE Product_ID = 1;


/* Update order status */

UPDATE Orders
SET Status = 'Shipped'
WHERE Order_ID = 1;


/* Update payment status */

UPDATE Payment
SET Status = 'Completed'
WHERE Order_ID = 4;



   --  DML - DELETE
   


/* Delete an address */

DELETE FROM Address
WHERE Address_ID = 5;


