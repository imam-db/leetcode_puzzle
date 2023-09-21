# Write your MySQL query statement below

WITH cte AS
(
SELECT e.employee_id
FROM Employees AS e
WHERE e.employee_id NOT IN
(
    SELECT s.employee_id
    FROM Salaries AS s
)
UNION
SELECT s.employee_id
FROM Salaries AS s
WHERE s.employee_id NOT IN
(
    SELECT e.employee_id
    FROM Employees AS e
)
)
SELECT employee_id
FROM cte
ORDER BY employee_id
