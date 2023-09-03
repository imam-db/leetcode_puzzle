# Write your MySQL query statement below

WITH cte AS
(
    SELECT person_name,
        SUM(weight) OVER(ORDER BY turn) AS accumulative
    FROM Queue
)
SELECT person_name
FROM cte
WHERE accumulative <= 1000
ORDER BY accumulative DESC
LIMIT 1
