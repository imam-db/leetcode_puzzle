# Write your MySQL query statement below

WITH distinct_salary AS
(
        SELECT Salary, 
                ROW_NUMBER() OVER(ORDER BY Salary DESC) AS ranking_salary
        FROM Employee
        GROUP BY Salary 
)
SELECT
(
SELECT Salary AS SecondHighestSalary
FROM distinct_salary
WHERE ranking_salary = 2
) AS SecondHighestSalary;
