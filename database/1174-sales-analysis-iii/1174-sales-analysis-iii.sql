# Write your MySQL query statement below

SELECT DISTINCT s.product_id,
    p.product_name
FROM Sales AS s
INNER JOIN Product AS p
ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND s.product_id NOT IN
(
SELECT s.product_id
FROM Sales AS s
WHERE s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)