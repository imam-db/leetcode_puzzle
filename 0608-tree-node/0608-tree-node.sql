# Write your MySQL query statement below

SELECT t1.id,
    CASE WHEN COUNT(t1.p_id) = 0 THEN 'Root'
          WHEN COUNT(t1.p_id) > 0 AND COUNT(t2.p_id) > 0 THEN 'Inner'
          WHEN COUNT(t1.p_id) > 0 AND COUNT(t2.p_id) = 0 THEN 'Leaf' END AS type
FROM Tree AS t1
LEFT JOIN Tree AS t2
ON t1.id = t2.p_id
GROUP BY t1.id