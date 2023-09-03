# Write your MySQL query statement below

WITH cte AS
(
    SELECT d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rank_salary
    FROM Employee AS e
    INNER JOIN Department AS d
    ON e.departmentId = d.id
)
SELECT Department,
    Employee,
    Salary
FROM cte
WHERE rank_salary = 1
