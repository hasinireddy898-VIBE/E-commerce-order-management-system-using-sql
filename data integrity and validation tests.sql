
   --  DATA INTEGRITY & VALIDATION TESTS
  
/* Test 1: Duplicate Email
   Expected: ERROR because Email is UNIQUE
*/

INSERT INTO Customer
(Name, Email, Phone, Address)
VALUES
('Test User', 'teju@gmail.com', '9999999999', 'Kakinada');


/* Test 2: Invalid Customer_ID
   Expected: ERROR because of FOREIGN KEY
*/

INSERT INTO Orders
(Customer_ID, Order_Date, Total_Amount, Status)
VALUES
(999, '2026-09-18', 500.00, 'Pending');


/* Test 3: Negative Product Price
   Expected: ERROR because of CHECK
*/

INSERT INTO Product
(Category_ID, Product_Name, Price, Stock_Qty)
VALUES
(1, 'Test Product', -500.00, 10);


/* Test 4: Negative Stock
   Expected: ERROR because of CHECK
*/

INSERT INTO Product
(Category_ID, Product_Name, Price, Stock_Qty)
VALUES
(1, 'Test Product 2', 500.00, -10);


/* Test 5: Zero Quantity
   Expected: ERROR because Quantity > 0
*/

INSERT INTO Order_Item
(Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
(1, 1, 0, 1999.00);
-- DISPLAYING ALL TABLES 
SHOW TABLES;


/* View table structures */

DESC Customer;

DESC Address;

DESC Category;

DESC Product;

DESC Orders;

DESC Order_Item;

DESC Payment;

DESC Shipment;



