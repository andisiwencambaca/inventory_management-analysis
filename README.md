# Inventory Management Analysis
This project analyses an inventory management dataset using SQL and Tableau. The goal is to evaluate stock health, supplier performance, and inventory value distribution to identify potential restocking risks and procurement inefficiencies.

## Data Sources:
The data source comes from the [ZoomCharts FP20 Analytics April 2025 Challenge](https://zoomcharts.com/en/microsoft-power-bi-custom-visuals/challenges/fp20-analytics-april-2025).

## Tools & Technologies Used: 
1. Python via Jupyter Notebook, libraries: pandas, matplotlib.pyplot, seaborn 
2. SQL (PostgreSQL via DBeaver) 
3. Tableau

## Methodology:  
- Data Gathering: I downloaded the dataset from the provided link and copied and pasted the brief into a Word processor.
- Data Loading: I created a database, inventory_management, then used DBeaver's import data function to import the csv file containing the data into a table called inventory.
- Data Cleaning: The dataset was already in a clean state. I found this out during the EDA process.
- Analysis: For the actual analysis to gain business insight, I used SQL.

## Analysis and Metrics:

<ins>Stock Analysis & Inventory Levels</ins>
- Product category with the highest total stock quantity and inventory value
- Percentage of products currently below their reorder point
- Minimum order quantities required to restock products below the reorder point
- Total number of products
   
<ins>Supplier & Restocking Performance</ins>
- Average supplier lead time across all products
- Average time since the last restock for products currently out of stock
- Monthly restocking trends to identify potential seasonality

<ins>Cost & Pricing Analysis</ins>
- Top 5 most expensive products by unit price
- Total monetary value of inventory currently held in stock
- Distribution of inventory value across product categories
  
## Results and Recommendations: 
<ins>Inventory Distribution</ins>: Inventory levels vary significantly across product categories, with certain categories holding an extreme share of total stock and inventory value. This indicates that a large portion of working capital is concentrated in a limited number of product segments.

<ins>Recommendation</ins>
1. Regularly monitor inventory value by category to identify overstocked segments.
2. Consider adjusting reorder thresholds or procurement strategies for categories holding excessive inventory value.

<ins>Products Below Reorder Point</ins>: A portion, about 5%, of products currently fall below their defined reorder point, indicating potential stockout risk. These products require immediate attention to maintain service levels and prevent supply interruptions.

<ins>Recommendation</ins>
1. Prioritise restocking for categories with the highest number of products below their reorder point.
2. Implement automated alerts when stock levels approach reorder thresholds.

<ins>Restocking Requirements</ins>: The analysis of restocking requirements shows the number of products that need replenishment and the total units required to restore inventory levels while respecting supplier minimum order quantities. This metric highlights the operational impact of supplier constraints such as minimum order quantities, which can lead to ordering more units than strictly required to meet the reorder point.

<ins>Recommendation</ins>
1. Review supplier minimum order quantities for high-frequency products.
2. Where possible, negotiate lower minimum orders or consolidate purchases across categories.

<ins>Supplier Lead Time Performance</ins>: Supplier lead times vary across suppliers, affecting how quickly products can be restocked after stock shortages. Longer lead times increase the risk of stockouts, especially for high-demand products.

<ins>Recommendation</ins>
1. Prioritise suppliers with shorter and more consistent lead times for critical products.
2. Adjust reorder points for products supplied by vendors with longer lead times.

<ins>Restocking Patterns</ins>: Monthly restocking analysis reveals periods with higher replenishment activity (May, July, and October), which may indicate seasonal demand patterns or procurement cycles. Understanding these patterns can help the organisation anticipate supply needs and optimise procurement planning.

<ins>Recommendation</ins>
1. Increase stock buffers ahead of high restocking periods if demand volatility is expected.

<ins>Pricing and Inventory Value</ins>:  The analysis of product prices highlights the most expensive items in the inventory. High-value products contribute significantly to the total inventory value even if they represent a small portion of total stock units. These items require careful monitoring due to their financial impact.

<ins>Recommendation</ins>
1. Implement tighter reorder controls for expensive products.

## Assumptions & Limitations:
1. Because the data does not contain daily sales, calculating metrics like the turnover ratio.
2. To answer the question about the average time since the last restock, I had to use `current_date - last_restock_date` because there is no other related date column in the dataset.

## Dashboard
[Dashboard](https://public.tableau.com/views/InventoryProcurementOverviewZoomCharts/inventorydashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
