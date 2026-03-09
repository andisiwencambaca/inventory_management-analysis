-- Identify the top 5 most expensive products (by unit price) and their categories.
select product_id, unit_price
from inventory
order by unit_price desc,product_name
limit 5