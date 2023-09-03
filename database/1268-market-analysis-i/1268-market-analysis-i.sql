# Write your MySQL query statement below

WITH order_2019 AS
(
    SELECT buyer_id,
        COUNT(order_id) AS total_order
    FROM Orders
    WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY buyer_id
)

SELECT u.user_id AS buyer_id,
    u.join_date,
    COALESCE(o.total_order,0) AS orders_in_2019 
FROM Users AS u
LEFT JOIN order_2019 AS o
ON u.user_id = o.buyer_id