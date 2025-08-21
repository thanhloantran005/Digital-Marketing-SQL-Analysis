# 🎯 Multilingual App Mini Case Study

## 1. Which apps have the highest and lowest average ratings?
````sql

SELECT app_name, AVG(rating) AS avg_rating FROM App
Group By app_name
Order By avg_rating Desc;
````
**Answer:**
<img width="213" height="112" alt="image" src="https://github.com/user-attachments/assets/7f6b1af9-cc6b-4556-85b5-d9cb13b5b5b0" />

