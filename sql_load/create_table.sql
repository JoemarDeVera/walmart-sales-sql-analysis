CREATE TABLE IF NOT EXISTS sales(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT NOT NULL,
total DECIMAL(12, 4) NOT NULL,
date DATETIME NOT NULL, 
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
gross_margin_pct FLOAT, 
gross_income DECIMAL(12, 4) NOT NULL,
rating FLOAT
);

-- Select sales to make sure the table is created.
SELECT * FROM sales;

-- Run this to copy the file path it shows and put the walmart csv file.
SHOW VARIABLES LIKE 'secure_file_priv';

-- This command loads data from the 'walmartsalesdata.csv' file into the 'sales' table.
-- It skips the first row (header) and uses a temporary variable '@date' to correctly
-- parse and format the date column from MM/DD/YYYY using STR_TO_DATE before insertion.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/walmartsalesdata.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    invoice_id, branch, city, customer_type, gender, product_line,
    unit_price, quantity, VAT, total, @date, time,
    payment_method, cogs, gross_margin_pct, gross_income, rating
)
SET
    date = STR_TO_DATE(SUBSTRING_INDEX(@date, ' ', 1), '%m/%d/%Y');
