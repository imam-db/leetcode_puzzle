# Write your MySQL query statement below

WITH src as 
(
SELECT CASE WHEN t.num = LEAD(t.num) OVER(ORDER BY id)
    AND t.num = LEAD(t.num,2) OVER(ORDER BY id)
    THEN t.num
    ELSE NULL END as ConsecutiveNums 
FROM Logs t 
)
SELECT DISTINCT src.ConsecutiveNums 
FROM src 
WHERE src.ConsecutiveNums IS NOT NULL
