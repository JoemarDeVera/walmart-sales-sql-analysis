-- ------- Feature Engineering----------------------------
 
 -- This query selects the transaction time and categorizes it into 'Morning',
-- 'Afternoon', or 'Evening' based on the time range, creating a new column.
 
 SELECT
    time,
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sales;
 
 -- Adding column to sales table named time_of_day
ALTER TABLE sales
ADD COLUMN time_of_day VARCHAR(10);

-- Updating table to fill the null values in time_of_day column
UPDATE sales
SET time_of_day =
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END;
    
    
 -- Day_name
 SELECT
     date,
     DAYNAME(date) 
     AS name_of_day
     FROM sales;

-- added a column, named day_name which determines the day using date column
ALTER TABLE sales 
ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


-- Month_name
SELECT
    date,
    MONTHNAME(date)
    as month_name
    FROM sales;
    
-- added a column, named month_name which determines the month using the date column
ALTER TABLE sales
ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);