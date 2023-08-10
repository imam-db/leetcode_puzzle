# Write your MySQL query statement below

WITH cte AS
(
        SELECT e.id,
                e.salary,
                DENSE_RANK() OVER(ORDER BY salary DESC) AS num_salary
        FROM Employee AS e
),
rank2 AS
(
        SELECT 2 AS num_base
)
SELECT salary AS SecondHighestSalary
FROM rank2
LEFT JOIN cte
ON rank2.num_base = cte.num_salary
LIMIT 1;
