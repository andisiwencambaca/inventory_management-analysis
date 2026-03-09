-- What is the average time since the last restock for products marked as "Out of Stock"?
select
	round(AVG(current_date - last_restock_date)) as avg_days_since_last_restock
from
	inventory
where
	status = 'Out of Stock'