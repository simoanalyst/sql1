-- Write a query to find the salesperson with the highest total sales in each region.
SELECT region, salesperson, total_sales
FROM (
    SELECT 
        region,
        salesperson,
        SUM(sale_amount) AS total_sales,
        RANK() OVER (PARTITION BY region ORDER BY SUM(sale_amount) DESC) AS rnk
    FROM sales
    GROUP BY region, salesperson
) ranked_sales
WHERE rnk = 1;

-- Second Highest Single Sale Per Region
select salesperson, region, sale_amount, sale_date
from (
select salesperson, region, sale_amount, sale_date, 
dense_rank()over(partition by region order by sale_amount desc) as drk
from sales) desire
where drk = 2;

--  Running Total of Sales per Salesperson (by Date)
select salesperson, region sale_date, sale_amount,
sum(sale_amount) over(partition by salesperson order by sale_date ) as runing_total
from sales;

-- Days Between Each Sale per Salesperson
SELECT 
    salesperson,
    sale_date,
    sale_amount,
    LAG(sale_date) OVER (PARTITION BY salesperson ORDER BY sale_date) AS previous_sale_date,
    DATEDIFF(sale_date, LAG(sale_date) OVER (PARTITION BY salesperson ORDER BY sale_date)) AS days_since_last_sale
FROM sales
ORDER BY salesperson, sale_date;

-- Salespeople Who Outperformed Their Region Average
WITH region_avg AS (
    SELECT region, AVG(sale_amount) AS avg_amount
    FROM sales
    GROUP BY region
)
SELECT 
    s.sale_id,
    s.salesperson,
    s.region,
    s.sale_amount,
    s.sale_date,
    ra.avg_amount AS avg_per_region
FROM sales s
JOIN region_avg ra ON s.region = ra.region
WHERE s.sale_amount > ra.avg_amount;

-- Median Sale Amount by Region
WITH ranked_sales AS (
  SELECT 
    region,
    sale_amount,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY sale_amount) AS rn,
    COUNT(*) OVER (PARTITION BY region) AS cnt
  FROM sales
)
SELECT 
  region,
  AVG(sale_amount) AS median_sale
FROM ranked_sales
WHERE rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2))
GROUP BY region;
