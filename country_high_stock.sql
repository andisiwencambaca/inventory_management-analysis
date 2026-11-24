select country, sum(stock_quantity) as total_stock
from inventory
where status = 'In Stock'
group by country
