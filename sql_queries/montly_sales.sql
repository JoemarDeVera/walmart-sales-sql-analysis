SELECT
    branch,
    month_name AS month,
    SUM(total) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(total) - SUM(cogs) AS gross_profit
FROM sales
GROUP BY branch, month_name, MONTH(date)
ORDER BY branch, MONTH(date);