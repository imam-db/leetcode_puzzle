# Write your MySQL query statement below

SELECT u.user_id AS buyer_id,
    u.join_date,
    COUNT(DISTINCT o.order_id) AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o
ON u.user_id = o.buyer_id
AND o.order_date BETWEEN  '2019-01-01' AND '2019-12-31'
GROUP BY u.user_id