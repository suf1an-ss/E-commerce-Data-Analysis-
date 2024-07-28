# E-commerce Data Analysis Project

## Overview
This project analyzes e-commerce sales data to uncover insights and trends. I've used PostgreSQL for data management and Tableau for visualization.
The dataset contains various details about each order placed in the e-commerce store. This includes the date of the order, customer information, product details, and financial figures like sales, profit, and shipping costs. By examining this data, we can answer important questions such as:
- What are the monthly sales trends?
- Which products are the best sellers?
- What are the characteristics of our customers?
- Which payment methods are most popular?

## Files in the Repository
- [Tableau](https://github.com/suf1an-ss/E-commerce-Data-Analysis-/blob/main/E-Commerce%20DASBOARD.twb): Tableau workbook containing the visualizations.
- [Dataset](https://github.com/suf1an-ss/E-commerce-Data-Analysis-/blob/main/E-commerce%20Dataset.csv): The raw dataset used for analysis.
- [SQL](https://github.com/suf1an-ss/E-commerce-Data-Analysis-/blob/main/E-commerce%20query.sql): SQL script to create the table and import data into PostgreSQL.
- [README](README.md): Documentation for the project.

## Data Source
The dataset includes information on orders, customers, products, and transactions:
- **Order_Date**: Date of the order
- **Customer_Id**: Unique customer identifier
- **Gender**: Gender of the customer
- **Device_Type**: Device used to place the order
- **Customer_Login_type**: Login type of the customer
- **Product_Category**: Category of the product
- **Product**: Specific product
- **Sales**: Sales amount
- **Quantity**: Quantity of product sold
- **Discount**: Discount applied
- **Profit**: Profit from the sale
- **Shipping_Cost**: Shipping cost
- **Order_Priority**: Priority of the order
- **Payment_method**: Method of payment

## Setting Up the Project

### 1. Import Data to PostgreSQL
1. Install PostgreSQL and create a new database.
2. Use the following command to create a table and import the CSV file:
    ```sql
    CREATE TABLE e_commerce_data (
        Order_Date DATE,
        Aging NUMERIC(5, 1),
        Customer_Id VARCHAR(255),
        Gender VARCHAR(255),
        Device_Type VARCHAR(255),
        Customer_Login_type VARCHAR(255),
        Product_Category VARCHAR(255),
        Product VARCHAR(255),
        Sales NUMERIC(10, 2),
        Quantity INT,
        Discount NUMERIC(5, 2),
        Profit NUMERIC(10, 2),
        Shipping_Cost NUMERIC(10, 2),
        Order_Priority VARCHAR(255),
        Payment_method VARCHAR(255)
    );

    COPY e_commerce_data FROM 'path_to_your_file/E-commerce Dataset.csv' CSV HEADER;
    ```
3. Use view statement to aggregated and filter the table. It helps sorting data chart wise for Tableau

### 2. Connect Tableau to PostgreSQL
1. Open Tableau and connect to the PostgreSQL database.
2. Import E-Commerce Data to the table.

## Using the Tableau Dashboard
- **Sales Trends**: Analyze monthly sales trends.
- **Top Products**: Identify top-selling products.
- **Top Products Category **: Identify top-selling products Category.
- **Customer Segmentation**: Understand customer demographics.
- **Payment Methods**: See the most used payment methods.


## Conclusion
This project, conducted as a solo effort, provides valuable insights into e-commerce sales data, helping businesses make informed decisions based on customer behavior and sales trends.

## License
This project is licensed under the MIT License.

## Acknowledgements
Special Thanks to the dataset providers.
