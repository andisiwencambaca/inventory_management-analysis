-- What minimum order quantity is required for a company to restock all products below the reorder point?
SELECT
    category,
    COUNT(*) AS products_to_restock,
    SUM(reorder_point - stock_quantity) AS total_shortage,
    SUM(
        CASE
            WHEN min_order_quantity > (reorder_point - stock_quantity)
            THEN min_order_quantity
            ELSE (reorder_point - stock_quantity)
        END
    ) AS units_to_order -- how many units must we actually order?
FROM inventory
WHERE stock_quantity < reorder_point
GROUP BY category
ORDER BY units_to_order DESC;