# Write your MySQL query statement below
SELECT
	CASE WHEN MOD(id,2) = 1 AND lead(id) OVER() IS NOT NULL THEN id+1
		WHEN MOD(id,2) = 1 AND lead(id) OVER() IS NULL THEN id
		WHEN MOD(id,2) = 0 THEN id-1 END AS id, student
FROM seat
ORDER BY id