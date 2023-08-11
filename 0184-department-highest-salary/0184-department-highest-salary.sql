# Write your MySQL query statement below

WITH max_salary AS
(
    SELECT DepartmentId, MAX(Salary) AS Salary
    FROM Employee AS e
    GROUP BY DepartmentId
)
SELECT d.Name AS Department, 
    e.Name AS Employee, 
    ms.Salary
FROM max_salary AS ms
INNER JOIN Employee AS e
    ON ms.DepartmentId = e.DepartmentId
    AND ms.Salary = e.Salary
INNER JOIN Department AS d
    ON d.Id = ms.DepartmentId
