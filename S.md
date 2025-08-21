# 🎯 Multilingual App Mini Case Study

## 1. Which apps have the highest and lowest average ratings?
````sql

SELECT app_name, AVG(rating) AS avg_rating FROM App
Group By app_name
Order By avg_rating Desc;
````
**Answer:**

<img width="206" height="169" alt="Screenshot 2025-08-21 at 1 22 22 PM" src="https://github.com/user-attachments/assets/e5e65fb0-3cea-44be-80bc-466735f11940" />

Snapchat has the highest average rating of 3.3 and Tinder has the lowest average rating of 2.7
***

## 2. Which app category has the highest and lowest average ratings?
````sql
SELECT app_category, AVG(rating) AS avg_rating FROM App
Group By app_category
Order By avg_rating Desc;
````
**Answer:**

<img width="251" height="169" alt="Screenshot 2025-08-21 at 1 24 13 PM" src="https://github.com/user-attachments/assets/91f94188-06ac-4aa2-9324-7ef5753d7bef" />

Health & Fitness has the highest average rating of 3.25 and Travel & Local has the lowest average rating of 2.8
***

## 3. What is the average rating by age group?
````sql
Select
CASE
	When user_age < 18 THEN 'Under 18'
    When user_age BETWEEN 18 and 24 THEN '18-24'
	When user_age BETWEEN 25 and 34 THEN '25-34'
	When user_age BETWEEN 35 and 44 THEN '35-44'
    When user_age BETWEEN 45 and 54 THEN '45-54'
    When user_age BETWEEN 55 and 64 THEN '55-64'
    Else '65+'
END AS age_group,
AVG(rating) AS avg_rating
FROM App
GROUP BY age_group
ORDER BY avg_rating DESC;
````
**Answer:**
<img width="189" height="141" alt="Screenshot 2025-08-21 at 1 26 09 PM" src="https://github.com/user-attachments/assets/59064111-0d73-4aaf-b930-92d82ec8aaef" />

Age range of 55-64 gave the highest average rating of 3.1 and 35-44 gave the lowest average rating of 2.96
***

## 4. What where the ratings of the Dating app category by age group?
````sql
Select 
CASE
	When user_age < 18 THEN 'Under 18'
    When user_age BETWEEN 18 and 24 THEN '18-24'
	When user_age BETWEEN 25 and 34 THEN '25-34'
	When user_age BETWEEN 35 and 44 THEN '35-44'
    When user_age BETWEEN 45 and 54 THEN '45-54'
    When user_age BETWEEN 55 and 64 THEN '55-64'
    Else '65+'
END AS age_group, app_category, AVG(rating) AS avg_rating FROM App
Where app_category = 'Dating'
Group By age_group
Order By Avg_rating Asc;
````
**Answer:**
<img width="268" height="140" alt="Screenshot 2025-08-21 at 1 28 28 PM" src="https://github.com/user-attachments/assets/80d7595a-4eb9-41f0-871d-bfaed19936e2" />

For the Dating app category Age range of 55-64 gavethe highest average rating of 3.5 and 25-34 gave the lowest average rating of 2.4
***





























