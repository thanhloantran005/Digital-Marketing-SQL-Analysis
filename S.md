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

For the Dating app category Age range of 55-64 gave the highest average rating of 3.5 and 25-34 gave the lowest average rating of 2.4
***

## 5. Which App has the most helpful reviews?
````sql
Select app_name, avg(num_helpful_votes) AS avg_helpful_votes From App
Group By app_name
Order BY avg_helpful_votes Desc;
````
**Answer:**

<img width="166" height="171" alt="Screenshot 2025-08-21 at 1 31 04 PM" src="https://github.com/user-attachments/assets/3cf4e979-9a7c-4f2a-90a4-583eb81f73b0" />

The Bumble app has the most helpful reviews with average votes of 725 and the MX player app has the least helpful reviews with average votes of 528

## 6. Which countries give the highest ratings?
````sql
Select user_country, Avg(rating) as avg_ratings FROM App
Group By user_country
Order By avg_ratings Desc
Limit 4;
````
**Answer:**

<img width="200" height="95" alt="Screenshot 2025-08-21 at 1 37 47 PM" src="https://github.com/user-attachments/assets/f8f4fa5e-d580-4206-bcca-2377b6c258c1" />

Thailand, France, and Brazil give the highest ratings
***

## 7. What types of devices does each age group have the most of?
````sql
With Base As (Select
CASE
	When user_age < 18 THEN 'Under 18'
    When user_age BETWEEN 18 and 24 THEN '18-24'
	When user_age BETWEEN 25 and 34 THEN '25-34'
	When user_age BETWEEN 35 and 44 THEN '35-44'
    When user_age BETWEEN 45 and 54 THEN '45-54'
    When user_age BETWEEN 55 and 64 THEN '55-64'
    Else '65+'
END AS age_group, device_type,
Count(device_type) as num_device_type
From App
Group by age_group, device_type
Order by num_device_type Desc), 

base2 as (Select
age_group, num_device_type, device_type,
Row_Number() OVER(Partition BY age_group ORDER BY num_device_type Desc) As Popularity 
FROM base)

Select age_group, num_device_type, device_type
From base2
Where Popularity = '1';
````
**Answer:**

<img width="256" height="142" alt="Screenshot 2025-08-21 at 2 04 32 PM" src="https://github.com/user-attachments/assets/0d40b062-2c4b-4016-a0b4-c3d7cb23810d" />

The Window phone is the most popular device type. It is used widely by all age ranges.
***

## 8. Do ratings differ by device type (Android vs. iPad vs. Windows)?

````sql
Select device_type, avg(rating) as avg_ratings From APP
Where app_name = 'Netflix'
Group by device_type;
````
**Answer:**

<img width="213" height="110" alt="Screenshot 2025-08-21 at 2 06 36 PM" src="https://github.com/user-attachments/assets/9957b446-7edb-478c-b2fc-9899c2480fab" />

IOS has the highest avg rating and Androids have the lowest avg ratings
***





























