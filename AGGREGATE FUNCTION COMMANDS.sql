-- AGGREGATE SQL STATEMENTS
 


/* Total number of customers */

SELECT COUNT(*) AS Total_Customers
FROM Customer;


/* Total number of orders */

SELECT COUNT(*) AS Total_Orders
FROM Orders;


/* Total sales */

SELECT
    SUM(Total_Amount) AS Total_Sales
FROM Orders
WHERE Status <> 'Cancelled';


/* Average order value */

SELECT
    AVG(Total_Amount) AS Average_Order_Value
FROM Orders;


/* Highest order value */

SELECT
    MAX(Total_Amount) AS Highest_Order_Value
FROM Orders;


/* Lowest order value */

SELECT
    MIN(Total_Amount) AS Lowest_Order_Value
FROM Orders;


/* Sales by order status */

SELECT
    Status,
    COUNT(*) AS Number_of_Orders,
    SUM(Total_Amount) AS Total_Sales
FROM Orders
GROUP BY Status;



  --  10. PRODUCT-WISE SALES
 

SELECT
    p.Product_Name,
    SUM(oi.Quantity) AS Total_Quantity_Sold,
    SUM(oi.Quantity * oi.Unit_Price) AS Total_Revenue
FROM Product p
JOIN Order_Item oi
    ON p.Product_ID = oi.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name;


   -- 11. CATEGORY-WISE SALES


SELECT
    c.Category_Name,
    SUM(oi.Quantity * oi.Unit_Price) AS Category_Revenue
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
JOIN Order_Item oi
    ON p.Product_ID = oi.Product_ID
GROUP BY
    c.Category_ID,
    c.Category_Name;



   -- 12. HAVING CLAUSE
  

SELECT
    c.Category_Name,
    SUM(oi.Quantity * oi.Unit_Price) AS Revenue
FROM Category c
JOIN Product p
    ON c.Category_ID = p.Category_ID
JOIN Order_Item oi
    ON p.Product_ID = oi.Product_ID
GROUP BY
    c.Category_ID,
    c.Category_Name
HAVING Revenue > 1000;

