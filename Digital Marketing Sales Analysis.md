# Digital Marketing SQL Mini Case Study

### 1. Overall ROMI It is calculated ( Total earning (Revenue) - Marketing cost ) / Marketing cost )

````sql
SELECT 
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent),2) AS overall_romi
FROM marketing;
````
**Answer:**

<img width="141" alt="image" src="https://user-images.githubusercontent.com/81607668/128624690-edfb1c8e-2a46-4bd9-a699-d2e678d42664.png">

The overall romi is 0.4
***

### 2. Find the ROMI by campaigns

````sql
SELECT 
campaign_name,
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent) * 100,2) AS romi
FROM marketing
GROUP BY campaign_name
ORDER BY romi DESC;
````
**Answer:**

<img width="165" height="182" alt="Screenshot 2025-08-21 at 2 26 15 PM" src="https://github.com/user-attachments/assets/51ec33b6-252d-4cd3-ad43-ee72ce28c0cb" />

The youtube blogger campaign has the highest romi of 277.32
***


### 2. Find the ROMI by campaigns

````sql
SELECT 
campaign_name,
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent) * 100,2) AS romi
FROM marketing
GROUP BY campaign_name
ORDER BY romi DESC;
````
**Answer:**

<img width="165" height="182" alt="Screenshot 2025-08-21 at 2 26 15 PM" src="https://github.com/user-attachments/assets/51ec33b6-252d-4cd3-ad43-ee72ce28c0cb" />

The youtube blogger campaign has the highest romi of 277.32
***


### 3. Performance of the campaign depending on the date - on which date did we spend the most money on advertising, when we got the biggest revenue when conversion rates were high and low? What were the average order values?
````sql
SELECT 
c_date,
SUM(mark_spent) AS total_spent,
SUM(revenue) AS total_revenue,
ROUND((SUM(Leads) - SUM(clicks))/SUM(clicks),2) AS Conversion_1,
ROUND((SUM(Orders) - SUM(leads))/SUM(leads),2) AS Conversion_2,
AVG(orders) AS Avg_orders
FROM marketing
GROUP BY c_date;
````
**Answer:**

<img width="481" height="179" alt="Screenshot 2025-08-21 at 2 28 15 PM" src="https://github.com/user-attachments/assets/a231b42d-41a0-4235-8d76-13c4016405ff" />

The highest revenue occurerd on 2021-02-20 with $5,261,521 with 93 avg orders. 

***

### 4. When buyers are more active? What is the average revenue on weekdays and weekends?

````sql
SELECT 
CASE
WHEN DAYOFWEEK(c_date) in (1,7) THEN 'Weekend'
ELSE 'Weekday' 
END AS day_type, 

ROUND(AVG(revenue),2) AS avg_revenue,
ROUND(AVG(orders),2) AS avg_orders
FROM marketing
GROUP BY day_type;
````
**Answer:**

<img width="205" height="64" alt="Screenshot 2025-08-21 at 2 30 59 PM" src="https://github.com/user-attachments/assets/1f546aaa-b0ef-4e57-ab0a-829ae96e9795" />

Buyers are more active on weekdays with avg orders of 26. The average revenue is 141,914 on Weekdays and 132,593 on Weekends. 

***

### 5. Which types of campaigns work best - social, banner, influencer, or a search?

````sql
SELECT 
category,
SUM(impressions) AS total_impressions
FROM marketing
GROUP BY category
Order by total_impressions Desc;
````
**Answer:**

<img width="161" height="94" alt="Screenshot 2025-08-21 at 2 34 11 PM" src="https://github.com/user-attachments/assets/f5c745df-1263-4d3c-8a63-a68d06a69c23" />

Media Campaigns work best with the highest number of impressions. 
***

### 6. Which geo locations are better for targeting - tier 1 or tier 2 cities?

````sql
SELECT
CASE
WHEN LOWER(campaign_name) LIKE '%tier1' THEN 'tier1'
WHEN LOWER(campaign_name) LIKE '%tier2' THEN 'tier2'
ELSE 'Other'
END AS tier,
SUM(revenue) AS revenue
FROM marketing
GROUP BY tier;
````
**Answer:**

<img width="108" height="76" alt="Screenshot 2025-08-21 at 2 35 09 PM" src="https://github.com/user-attachments/assets/561cb6b9-5aae-45a3-b46a-6fab095431e4" />

Tier 2 cities
***





















