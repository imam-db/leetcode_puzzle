# Write your MySQL query statement below

SELECT id,
    SUM(num) AS num
FROM
(
    SELECT requester_id AS id,
        COUNT(*) AS num
    FROM RequestAccepted AS ra
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id,
        COUNT(*) AS total
    FROM RequestAccepted AS ra
    GROUP BY accepter_id
) AS id_num
GROUP BY id
ORDER BY num DESC
LIMIT 1
