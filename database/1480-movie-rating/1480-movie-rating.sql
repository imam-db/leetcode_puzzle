# Write your MySQL query statement below

WITH cte1 AS
(
    SELECT u.name,
        COUNT(u.user_id) AS total
    FROM MovieRating AS mr
    INNER JOIN Users AS u
    ON mr.user_id = u.user_id
    -- WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY u.user_id
    ORDER BY COUNT(u.user_id) DESC, 
        u.name
    LIMIT 1
),
cte2 AS
(
    SELECT m.title
    FROM MovieRating AS mr
    INNER JOIN Movies AS m
    ON mr.movie_id = m.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id
    ORDER BY AVG(mr.rating) DESC, 
        m.title
    LIMIT 1
)
SELECT name AS results
FROM cte1
UNION ALL
SELECT title AS results
FROM cte2