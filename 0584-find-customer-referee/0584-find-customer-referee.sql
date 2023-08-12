# Write your MySQL query statement below

SELECT c.name
FROM Customer AS c
WHERE c.referee_id <> 2 OR referee_id IS NULL