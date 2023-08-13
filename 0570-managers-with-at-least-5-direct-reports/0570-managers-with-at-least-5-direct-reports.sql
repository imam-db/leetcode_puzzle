# Write your MySQL query statement below

SELECT e2.name
FROM Employee AS e1
INNER JOIN Employee AS e2
    ON e1.managerId = e2.id
GROUP BY e2.id
HAVING COUNT(DISTINCT e1.id) >= 5