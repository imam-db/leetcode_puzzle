# Write your MySQL query statement below

WITH count_product AS
(
	SELECT COUNT(DISTINCT product_key) AS total
	FROM Product
)
SELECT customer_id
FROM Customer
WHERE product_key IN
			(
				SELECT product_key
				FROM Product
			)
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT total FROM count_product)
