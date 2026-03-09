select
	country,
	sum(stock_quantity) as total_stock
from
	inventory
group by
	country