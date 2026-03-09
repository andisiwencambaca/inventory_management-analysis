-- How many products currently have stock quantities below their reorder point?
SELECT
    COUNT(*) FILTER (WHERE stock_quantity < reorder_point) * 100.0
    / COUNT(*) AS pct_products_below_reorder
FROM inventory;
