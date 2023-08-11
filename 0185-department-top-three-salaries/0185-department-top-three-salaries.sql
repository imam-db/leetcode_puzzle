# Write your MySQL query statement below
SELECT d.Name AS Department, 
    e.Name AS Employee, 
    emp.Salary
FROM
(
    SELECT DepartmentId, 
            Salary, 
            ROW_NUMBER() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) AS maxsalary
    FROM Employee AS e
    GROUP BY DepartmentId, Salary
) AS emp
INNER JOIN Employee AS e
    ON e.DepartmentId = emp.DepartmentId
    AND e.Salary = emp.Salary
INNER JOIN Department AS d
    ON d.Id = emp.DepartmentId
WHERE emp.maxsalary BETWEEN 1 AND 3
