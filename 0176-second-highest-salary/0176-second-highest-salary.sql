# Write your MySQL query statement below

WITH distinct_salary AS
(
SELECT Salary, ROW_NUMBER() OVER(ORDER BY Salary DESC) AS nomer
FROM Employee
GROUP BY Salary 
)

SELECT (SELECT Salary AS SecondHighestSalary
FROM distinct_salary
WHERE nomer = 2) AS SecondHighestSalary

