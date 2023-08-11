# Write your MySQL query statement below

WITH cte AS
(
    SELECT a.player_id,
        MIN(event_date) AS first_login,
        DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS next_day
    FROM Activity AS a
    GROUP BY a.player_id
)
SELECT ROUND(COUNT(DISTINCT a.player_id)/ COUNT(DISTINCT cte.player_id), 2) AS fraction
FROM cte
LEFT JOIN Activity AS a
    ON cte.player_id = a.player_id
    AND cte.next_day = a.event_date
