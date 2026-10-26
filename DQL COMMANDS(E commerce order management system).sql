
  --  DQL - BASIC SELECT QUERIES
  


/* Display all customers */

SELECT *
FROM Customer;


/* Display all products */

SELECT *
FROM Product;


/* Display all orders */

SELECT *
FROM Orders;


/* Display products costing more than 1000 */

SELECT
    Product_ID,
    Product_Name,
    Price
FROM Product
WHERE Price > 1000;


/* Display products with low stock */

SELECT
    Product_ID,
    Product_Name,
    Stock_Qty
FROM Product
WHERE Stock_Qty < 30;


/* Display pending shipments */

SELECT *
FROM Shipment
WHERE Status <> 'Delivered';



   -- DQL - CUSTOMER ORDER HISTORY
   

SELECT
    c.Customer_ID,
    c.Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
WHERE c.Customer_ID = 1
ORDER BY o.Order_Date DESC;

   --  DQL - COMPLETE ORDER DETAILS
 

SELECT
    o.Order_ID,
    c.Name AS Customer_Name,
    p.Product_Name,
    oi.Quantity,
    oi.Unit_Price,
    (oi.Quantity * oi.Unit_Price) AS Line_Total,
    o.Status
FROM Orders o
JOIN Customer c
    ON o.Customer_ID = c.Customer_ID
JOIN Order_Item oi
    ON o.Order_ID = oi.Order_ID
JOIN Product p
    ON oi.Product_ID = p.Product_ID;


