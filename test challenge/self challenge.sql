create database marketing; -- creating database

use marketing; -- select database to use

-- creating a table to use
CREATE TABLE marketing_campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    platform VARCHAR(50),
    impressions INT DEFAULT 0,
    clicks INT DEFAULT 0,
    budget_usd DECIMAL(10 , 2 )
);


-- insert data to our table
INSERT INTO marketing_campaigns (campaign_id, campaign_name, platform, impressions, clicks, budget_usd) VALUES
(1, 'Summer Sale', 'Facebook', 12000, 950, 500.00),
(2, 'Winter Launch', 'Instagram', 15000, 1200, 650.00),
(3, 'Flash Promo', 'Twitter', 8000, 400, 300.00),
(4, 'Holiday Boost', 'Google Ads', 22000, 1800, 1000.00),
(5, 'Back to School', 'LinkedIn', 5000, 450, 250.00),
(6, 'Black Friday Deal', 'Facebook', 30000, 2800, 1500.00),
(7, 'Cyber Monday', 'Twitter', 25000, 2000, 1300.00),
(8, 'Brand Awareness', 'Instagram', 17000, 850, 700.00),
(9, 'End Year Offer', 'Google Ads', 18000, 1400, 900.00),
(10, 'Spring Sale', 'Facebook', 11000, 700, 480.00),
(11, 'New Product Teaser', 'LinkedIn', 4500, 350, 230.00),
(12, 'Influencer Collab', 'Instagram', 12500, 1000, 520.00),
(13, 'Referral Boost', 'Twitter', 7600, 600, 360.00),
(14, 'App Launch', 'Google Ads', 20000, 1500, 950.00),
(15, 'SEO Push', 'LinkedIn', 3900, 320, 210.00),
(16, 'Limited Time Sale', 'Facebook', 16000, 1000, 600.00),
(17, 'Corporate Branding', 'Instagram', 14500, 900, 580.00),
(18, 'Newsletter Signups', 'Twitter', 6700, 450, 290.00),
(19, 'Customer Retarget', 'Google Ads', 21000, 1700, 990.00),
(20, 'Ebook Download', 'LinkedIn', 4300, 300, 200.00);


select * from marketing_campaigns;

-- sum of budget used per platform
SELECT 
    platform, SUM(budget_usd) AS sum_budget_per_platform
FROM
    marketing_campaigns
GROUP BY platform
ORDER BY sum_budget_per_platform DESC;
-- observation: Google Ads has max sum of budget of 3840 and linkdin has minimum of 890 dollars


-- platform with the highest imprressions
SELECT 
    platform, MAX(impressions) AS max_impressions
FROM
    marketing_campaigns
GROUP BY platform;
-- facebook has highest number of impressions of 30000

-- filtering campaigns with budget below average budget
SELECT 
    *
FROM
    marketing_campaigns
WHERE
    budget_usd >= (SELECT 
            AVG(budget_usd)
        FROM
            marketing_campaigns);
            
-- Retrieve the top 5 campaigns with the highest number of clicks.
SELECT 
    campaign_name, clicks
FROM
    marketing_campaigns
ORDER BY clicks DESC
LIMIT 5;
 -- black friday Deal has highest number of clicks of 2800
 
 -- List each campaign along with its conversion rate (clicks ÷ impressions), rounded to 2 decimal places.
SELECT 
    campaign_name,
    ROUND((clicks / impressions), 2) AS conversion_rate
FROM
    marketing_campaigns
ORDER BY conversion_rate DESC;
-- back to school, black Friday Deal has the highest number of conversion_rate of 0.09


-- Assign a rank to each campaign based on descending budget.
select campaign_name, 
rank() over(order by budget_usd desc) as rank_budget
from marketing_campaigns;
-- black Friday ranks Number one

-- List campaigns that have more clicks than their platform's average clicks.
SELECT campaign_name, platform, clicks
 FROM marketing_campaigns mc
 WHERE clicks >(
SELECT 
     AVG(clicks) AS avg_clicks
FROM
    marketing_campaigns
    WHERE platform = mc.platform);


 -- Find budgets that are shared by more than one campaign.
SELECT 
    budget_usd, COUNT(*) AS count
FROM
    marketing_campaigns
GROUP BY budget_usd
HAVING COUNT(*) > 1;
-- no shared budget


-- Group campaigns by budget ranges (e.g., <500, 500–1000, >1000) and count how many fall into each.

select * from marketing_campaigns;
SELECT 
    CASE
        WHEN budget_usd < 500 THEN 'Low'
        WHEN budget_usd BETWEEN 500 AND 1000 THEN 'Medium'
        ELSE 'High'
    END AS budget_category,
    COUNT(*) AS number_of_campaigns
FROM
    marketing_campaigns
GROUP BY budget_category;


-- Retrieve the campaign that achieved the highest number of clicks per dollar spent.
SELECT 
    campaign_name,
    clicks,
    budget_usd,
    ROUND(clicks / budget_usd) clicks_per_dollar
FROM
    marketing_campaigns
ORDER BY clicks_per_dollar DESC
LIMIT 1;
-- highest clicks per dollar is 2

-- Identify the platform that generates the most average clicks across its campaigns.
SELECT 
    platform, round(AVG(clicks)) AS avg_clicks
FROM
    marketing_campaigns
GROUP BY platform
ORDER BY avg_clicks DESC
LIMIT 1;

-- Show what percentage of the total budget each platform consumes.
SELECT 
    platform,
    ROUND(SUM(budget_usd) * 100 / (SELECT 
                    SUM(budget_usd)
                FROM
                    marketing_campaigns),
            2) AS percent_of_budget
FROM
    marketing_campaigns
GROUP BY platform;

-- List campaigns whose impressions exceed the average for their platform.
SELECT 
    campaign_name, platform,impressions
FROM
    marketing_campaigns mc
WHERE
    impressions > (SELECT 
            AVG(impressions) AS avg_impressions
        FROM
            marketing_campaigns
        WHERE
            platform = mc.platform);


-- Show a running total of budgets as campaigns are ordered by their ID.
select *, 
sum(budget_usd) over(order by campaign_id) as budget_running_total
  FROM
            marketing_campaigns;

-- Find the campaign with the second highest budget using LIMIT 
SELECT 
    campaign_name, budget_usd
FROM
    marketing_campaigns
ORDER BY budget_usd DESC
LIMIT 1 OFFSET 1;
