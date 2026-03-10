# inventory_management-analysis
The complete code (Python and SQL) used for analysing inventory management data, including the Tableau dashboard.


 
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

 

## Recommendations: Suggest specific, actionable next steps or business actions based on your insights.

## Assumptions & Limitations: Outline any assumptions made or gaps in the data/analysis.

## Dashboard
[Dashboard](https://public.tableau.com/views/InventoryProcurementOverviewZoomCharts/inventorydashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
