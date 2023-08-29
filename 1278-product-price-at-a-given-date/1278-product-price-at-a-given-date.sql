# Write your MySQL query statement below

WITH cte AS
(
    SELECT product_id,
        new_price,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS num
    FROM Products AS p
    WHERE p.change_date <= '2019-08-16'
), 
price_before AS
(
    SELECT product_id,
        new_price AS price
    FROM cte
    WHERE num = 1
)
SELECT p.product_id,
    COALESCE(pb.price,10) AS price
FROM Products AS p
LEFT JOIN price_before AS pb
ON p.product_id = pb.product_id
GROUP BY p.product_id
