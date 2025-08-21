# 🎯 Multilingual App Mini Case Study

## 1. Which apps have the highest and lowest average ratings?
````sql

SELECT app_name, AVG(rating) AS avg_rating FROM App
Group By app_name
Order By avg_rating Desc;
````
**Answer:**

