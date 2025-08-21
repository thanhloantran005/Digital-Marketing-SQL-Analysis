# 🎯 Multilingual App Mini Case Study

## 1. Which apps have the highest and lowest average ratings?
````sql

SELECT app_name, AVG(rating) AS avg_rating FROM App
Group By app_name
Order By avg_rating Desc;
````
**Answer:**

<img width="206" height="169" alt="Screenshot 2025-08-21 at 1 22 22 PM" src="https://github.com/user-attachments/assets/e5e65fb0-3cea-44be-80bc-466735f11940" />

Snapchat has the highest rating of 3.3 and Tinder has the lowest rating of 2.7
***
