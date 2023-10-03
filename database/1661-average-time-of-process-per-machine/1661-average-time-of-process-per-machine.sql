# Write your MySQL query statement below

WITH act_start AS
(
    SELECT machine_id,
        process_id,
        timestamp
    FROM Activity
    WHERE activity_type = 'start'

),
act_end AS
(
    SELECT machine_id,
        process_id,
        timestamp
    FROM Activity
    WHERE activity_type = 'end'
)
SELECT aend.machine_id,
    ROUND(SUM(aend.timestamp - astart.timestamp) / COUNT(*), 3) AS processing_time
FROM act_end AS aend
INNER JOIN act_start AS astart
ON aend.machine_id = astart.machine_id
AND aend.process_id = astart.process_id
GROUP BY aend.machine_id