SELECT 
    branch,
    ROUND(AVG(rating), 2) AS average_rating
FROM sales
GROUP BY branch
ORDER BY average_rating DESC;