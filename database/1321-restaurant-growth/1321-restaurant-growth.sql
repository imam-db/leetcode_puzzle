# Write your MySQL query statement below

WITH cte AS
(
    SELECT visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
final_cte AS
(
    SELECT visited_on,
        DATE_ADD(MIN(visited_on) OVER(ORDER BY visited_on), INTERVAL 6 DAY) AS mindate,
        SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
        ROUND(SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7,2) AS average_amount
    FROM cte
)
SELECT visited_on,
    amount,
    average_amount
FROM final_cte
WHERE visited_on >= mindate