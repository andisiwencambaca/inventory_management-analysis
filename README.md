# inventory_management-analysis
The complete code (Python and SQL) used for analysing inventory management data, including the Tableau dashboard.

## Dashboard
[Dashboard](https://public.tableau.com/views/InventoryProcurementOverviewZoomCharts/inventorydashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
 
### Table of Contents: Helps readers navigate the document easily.

## Problem Statement:
Efficient inventory management is crucial for balancing supply and demand while minimising costs. The goal is to uncover actionable insights that enhance inventory operations and decision-making.

## Data Sources:
The data source comes from the [ZoomCharts FP20 Analytics April 2025 Challenge](https://zoomcharts.com/en/microsoft-power-bi-custom-visuals/challenges/fp20-analytics-april-2025).

## Tools & Technologies Used: 
1. Python via Jupyter Notebook, libraries: pandas, matplotlib.pyplot, seaborn 
2. SQL (PostgreSQL via DBeaver) 
3. Tableau

## Methodology:  
- Data Gathering: I downloaded the dataset from the provided link and copy-pasted the brief into a Word processor.
- Data Loading: I created a database, inventory_management, then used DBeaver import data function to import the csv file containing the data into a table called inventory.
- Data Cleaning: The dataset was already in a clean state. I found this out during the EDA process.
- Analysis: For the actual analysis to gain business insight, I used SQL.

## Analysis:
This section outlines the analytical questions explored in the project along with the SQL queries used to derive the metrics displayed in the dashboard.

<ins>Stock Analysis & Inventory Levels</ins>
1. Which product category has the highest total stock quantity across all products, and what is the inventory cost for each?
   
     ```
       select
	        category,
	        sum(stock_quantity) as total_stock_quantity,
	        round(sum(stock_quantity * unit_price)::numeric, 2) as category_value
       from inventory
       where status = 'In Stock'
       group by category
      order by total_stock_quantity desc
     ```

3. How many products currently have stock quantities below their reorder point?
   
   ```
   SELECT
    COUNT(*) FILTER (WHERE stock_quantity < reorder_point) * 100.0
    / COUNT(*) AS pct_products_below_reorder
   FROM inventory;
   ```

5. What minimum order quantity is required for a company to restock all products below the reorder point?
   
     ```
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
     ```

<ins>Supplier & Restocking Performance</ins>
1. What is the average time since the last restock for products marked as "Out of Stock"?
   
    ```
        select
	      round(AVG(current_date - last_restock_date)) as avg_days_since_last_restock
       from
	     inventory
       where
	     status = 'Out of Stock'
    ```
  
3. What is the overall average lead time?
   
    ```
    SELECT round(AVG(lead_time_days)) AS avg_lt
    FROM inventory
    ```
    
5. Identify the months when the highest number of products were restocked - are there any seasonal trends?
   
   ```
   SELECT 
        EXTRACT(MONTH FROM last_restock_date) AS month_num,
        to_char(last_restock_date, 'Month') AS month_name,
        count(product_id) AS monthly_quantity
   FROM inventory
   GROUP BY month_num, month_name
   ORDER BY month_num;
   ```

<ins>Cost & Pricing Analysis</ins>
1. Identify the top 5 most expensive products (by unit price) and their categories.
   
   ```
   select product_id, unit_price
   from inventory
   order by unit_price desc,product_name
   limit 5
   ```

3. What is the total value of all current stock?
   
   ```
   select round(sum(stock_quantity * unit_price)::numeric,2) as inventory_value
   from inventory
   where  (status = 'In Stock' AND stock_quantity > 0)
    OR
    (status = 'Out of Stock' AND stock_quantity = 0)
   ```

<ins>Geographical Insights</ins>
1. Which country has the most stocked items?
   
   ```
   select
	    country,
	    sum(stock_quantity) as total_stock
   from
	inventory
   group by country
   ```
  
## Results and Recommendations: 
Total Inventory Value

Result:
The total value of inventory currently held across all products is 1B.

Recommendation:
Tracking this value over time can help detect overstocking and guide
procurement decisions toward categories with faster turnover.
 

## Recommendations: Suggest specific, actionable next steps or business actions based on your insights.

## Assumptions & Limitations: Outline any assumptions made or gaps in the data/analysis.

## Visualizations/Screenshots:
