select round(sum(stock_quantity * unit_price)::numeric,2) as inventory_value
from inventory
where  (status = 'In Stock' AND stock_quantity > 0)
    OR
    (status = 'Out of Stock' AND stock_quantity = 0)


