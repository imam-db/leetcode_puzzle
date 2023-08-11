# Write your MySQL query statement below

WITH cte AS
(
SELECT e1.Id, 
        e1.Name, 
        e1.Salary, 
        e2.Salary AS salary_manager
FROM Employee AS e1
LEFT JOIN Employee AS e2
ON e1.ManagerId = e2.Id
)
SELECT cte.Name AS Employee
FROM cte
WHERE cte.salary_manager IS NOT NULL
AND cte.Salary > cte.salary_manager;