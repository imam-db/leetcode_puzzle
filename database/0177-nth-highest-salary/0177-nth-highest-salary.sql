CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH distinct_salary AS
      (
        SELECT DISTINCT e.salary
        FROM Employee AS e
      ),
      final_query AS
      (
        SELECT salary,
              ROW_NUMBER() OVER(ORDER BY salary DESC) AS number_salary
        FROM distinct_salary
      )
      SELECT salary
      FROM final_query
      WHERE number_salary = N
      
  );
END