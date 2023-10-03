# Write your MySQL query statement below
WITH cte AS
(
    SELECT DISTINCT v.customer_id,
        v.visit_id,
        CASE WHEN t.transaction_id IS NULL THEN 1 ELSE 0 END AS num_notrans
    FROM Visits AS v
    LEFT JOIN Transactions AS t
    ON v.visit_id = t.visit_id
)
SELECT customer_id,
    SUM(num_notrans) AS count_no_trans
FROM cte
WHERE num_notrans = 1
GROUP BY customer_id

-- WHERE v.customer_id = 54
-- GROUP BY v.customer_id
