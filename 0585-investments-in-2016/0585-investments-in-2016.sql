# Write your MySQL query statement below

WITH cte AS
(
    SELECT tiv_2015, 
            tiv_2016,
            lat, 
            lon,
            COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_count,
            COUNT(*) OVER(PARTITION BY lat, lon) AS location_count
    FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) AS TIV_2016
FROM cte
WHERE tiv_count > 1 
    AND location_count = 1;

