SELECT 
    CONCAT('Branch ', branch, ' – ', city) AS branch_city,
    product_line,
    SUM(total) AS total_revenue
FROM sales
GROUP BY branch, city, product_line
ORDER BY branch, total_revenue DESC;