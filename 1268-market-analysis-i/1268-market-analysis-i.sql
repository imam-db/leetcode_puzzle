# Write your MySQL query statement below

WITH order_2019 AS
(
    SELECT *
    FROM Orders
    WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
)

SELECT u.user_id AS buyer_id,
    u.join_date,
    COUNT(DISTINCT o.order_id) AS orders_in_2019
FROM Users AS u
LEFT JOIN order_2019 AS o
ON u.user_id = o.buyer_id
GROUP BY u.user_id