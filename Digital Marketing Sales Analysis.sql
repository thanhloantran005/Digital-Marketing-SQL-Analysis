# Digital Marketing SQL Mini Case Study

## 📌 Solution

### 1. Overall ROMI It is calculated ( Total earning (Revenue) - Marketing cost ) / Marketing cost )

````sql
SELECT 
ROUND((SUM(revenue) - SUM(mark_spent))/SUM(mark_spent),2) AS overall_romi
FROM marketing;
````
**Answer:**
  

<img width="141" alt="image" src="https://user-images.githubusercontent.com/81607668/128624690-edfb1c8e-2a46-4bd9-a699-d2e678d42664.png">

There are 554 unique users in the dataset.

***

