# Write your MySQL query statement below

SELECT e.employee_Id
FROM Employees AS e
WHERE e.salary < 30000 
AND e.manager_id NOT IN
(
    SELECT e2.employee_id
    FROM Employees AS e2
)
ORDER BY employee_id