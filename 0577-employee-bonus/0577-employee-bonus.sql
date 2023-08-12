# Write your MySQL query statement below

SELECT e.name, null AS bonus
FROM Employee AS e
WHERE NOT EXISTS
(
    SELECT 1
    FROM Bonus AS b
    WHERE b.empId = e.empId
)
UNION ALL
SELECT e.name, b.bonus
FROM Employee AS e
INNER JOIN Bonus AS b
ON e.empId = b.empId
WHERE b.bonus < 1000
    
