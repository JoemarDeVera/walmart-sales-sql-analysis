SELECT 
    branch,
    gender,
    product_line,
    SUM(total) AS total_revenue
FROM sales
GROUP BY branch, gender, product_line
ORDER BY branch, gender, total_sales DESC;