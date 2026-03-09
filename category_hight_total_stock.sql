-- Which product category has the highest total stock quantity across all products?

select
	category,
	sum(stock_quantity) as total_stock_quantity,
	round(sum(stock_quantity * unit_price)::numeric, 2) as category_value
from
	inventory
where
	status = 'In Stock'
group by
	category
order by
	total_stock_quantity desc