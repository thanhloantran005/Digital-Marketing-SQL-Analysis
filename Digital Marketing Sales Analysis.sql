SELECT * FROM marketing;

-- 1- Overall ROMI It is calculated ( Total earning (Revenue) - Marketing cost ) / Marketing cost )
SELECT 
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent),2) AS overall_romi
FROM marketing;

-- 2- ROMI by campaigns
SELECT 
campaign_name,
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent) * 100,2) AS romi
FROM marketing
GROUP BY campaign_name
ORDER BY romi DESC;

-- 3- Performance of the campaign depending on the date - on which date did we spend the most money on advertising, when we got the biggest revenue when conversion rates were high and low? What were the average order values?
SELECT 
c_date,
SUM(mark_spent) AS total_spent,
SUM(revenue) AS total_revenue,
ROUND((SUM(Leads) - SUM(clicks))/SUM(clicks),2) AS Conversion_1,
ROUND((SUM(Orders) - SUM(leads))/SUM(leads),2) AS Conversion_2,
AVG(orders) AS Avg_orders
FROM marketing
GROUP BY c_date;

-- 4- When buyers are more active? What is the average revenue on weekdays and weekends?
SELECT 
CASE
WHEN DAYOFWEEK(c_date) in (1,7) THEN 'Weekend'
ELSE 'Weekday' 
END AS day_type, 

ROUND(AVG(revenue),2) AS avg_revenue,
ROUND(AVG(orders),2) AS avg_orders
FROM marketing
GROUP BY day_type;

-- 5- Which types of campaigns work best - social, banner, influencer, or a search?
SELECT 
category,
SUM(impressions) AS total_impressions
FROM marketing
GROUP BY category;

-- 6- Which geo locations are better for targeting - tier 1 or tier 2 cities?
SELECT
CASE
WHEN LOWER(campaign_name) LIKE '%tier1' THEN 'tier1'
WHEN LOWER(campaign_name) LIKE '%tier2' THEN 'tier2'
ELSE 'Other'
END AS tier,
SUM(revenue) AS revenue
FROM marketing
GROUP BY tier;







