--Creating table
CREATE TABLE e_commerce_data (
    Order_Date DATE,
	Order_time TIME,
    Aging NUMERIC(5, 1),
    Customer_Id VARCHAR(50),
    Gender VARCHAR(10),
    Device_Type VARCHAR(50),
    Customer_Login_type VARCHAR(50),
    Product_Category VARCHAR(100),
    Product VARCHAR(100),
    Sales NUMERIC(10, 2),
    Quantity INT,
    Discount NUMERIC(5, 2),
    Profit NUMERIC(10, 2),
    Shipping_Cost NUMERIC(10, 2),
    Order_Priority VARCHAR(50),
    Payment_method VARCHAR(50)
);
--importing data
COPY e_commerce_data FROM 'C:\Program Files\PostgreSQL\16\data\Data copy\E-commerce Dataset.csv' CSV HEADER;
/* Got error related time column 
solution is that you need to change time format in csv file to HH:MM:SS*/

--Looking into data
Select * from e_commerce_data;

--changing column name for better understanding
ALTER TABLE e_commerce_data 
RENAME COLUMN ship_date TO Shipping_time;

--TOTAL SALES BY MONTH
CREATE VIEW total_sales_by_month AS
SELECT
    TO_CHAR(Order_Date, 'YYYY-MM') AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM
    e_commerce_data
GROUP BY
    TO_CHAR(Order_Date, 'YYYY-MM')
ORDER BY
    Month;
SELECT * FROM total_sales_by_month;

--TOTAL SALES BY PRODUCT CATEGORY
CREATE VIEW sales_by_category AS
SELECT
    Product_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM
    e_commerce_data
GROUP BY
    Product_Category
ORDER BY
    Total_Sales DESC;
SELECT * FROM sales_by_category;

--SALES BY GENDER
CREATE VIEW sales_by_gender AS
SELECT
    Gender,
    COUNT(DISTINCT Customer_Id) AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM
    e_commerce_data
GROUP BY
    Gender;
SELECT * FROM sales_by_gender;

--TOP 10 PRODUCTS 
CREATE VIEW top_10_products AS
SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM
    e_commerce_data
GROUP BY
    Product
ORDER BY
    Total_Sales DESC
LIMIT 10;
SELECT * FROM top_10_products;

--MOST USED PAYMENT METHOD
CREATE VIEW most_used_payment_method AS
SELECT
    payment_method,
    COUNT(DISTINCT Customer_Id) AS Total_Customers
FROM
    e_commerce_data
GROUP BY
    payment_method;
SELECT * FROM most_used_payment_method;

--Quantity sold by month
CREATE VIEW quantity_sold_by_month AS
SELECT
    DATE_TRUNC('month', Order_Date) AS Month,
    SUM(Quantity) AS Total_Quantity
FROM
    e_commerce_data
GROUP BY
    DATE_TRUNC('month', Order_Date)
ORDER BY
    Month;
SELECT * FROM quantity_sold_by_month;