# Write your MySQL query statement below
WITH users AS
(
    SELECT a.Users_id
    FROM users AS a
    WHERE a.Banned = 'No'
)

SELECT t.Request_at AS Day
, ROUND(AVG(CASE WHEN Status LIKE '%cancel%' THEN 1 ELSE 0 END),2) AS 'Cancellation Rate'
FROM trips AS t
WHERE t.Client_Id IN (SELECT Users_id FROM users)
AND t.Driver_id IN (SELECT Users_id FROM users)
AND t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.Request_at