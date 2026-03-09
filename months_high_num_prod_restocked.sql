-- Identify the months when the HIGHEST NUMBER OF PRODUCTS were restocked - are there any seasonal trends?
SELECT 
    EXTRACT(MONTH FROM last_restock_date) AS month_num,
    to_char(last_restock_date, 'Month') AS month_name,
    count(product_id) AS monthly_quantity
FROM inventory
GROUP BY month_num, month_name
ORDER BY month_num;