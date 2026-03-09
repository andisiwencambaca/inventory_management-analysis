-- Which supplier has the highest average lead time for restocking?
WITH avg_lead_time AS (
    SELECT AVG(lead_time_days) AS avg_lt
    FROM inventory
)
SELECT
    supplier_id,
    round(AVG(lead_time_days)) AS avg_supplier_lead_time,
    ROUND(
        (a.avg_lt - AVG(lead_time_days)) / a.avg_lt * 100
    ) AS pct_faster_than_avg
FROM inventory
CROSS JOIN avg_lead_time a
GROUP BY supplier_id, a.avg_lt
ORDER BY pct_faster_than_avg DESC;