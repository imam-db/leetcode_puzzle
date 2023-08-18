# Write your MySQL query statement below

WITH minsale AS
(
    SELECT product_id,
        MIN(year) AS minyear
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id,
        s.year AS first_year,
        s.quantity,
        s.price
FROM Sales AS s
INNER JOIN minsale AS ms
ON s.product_id = ms.product_id
AND s.year = ms.minyear