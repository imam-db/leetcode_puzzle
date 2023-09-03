# Write your MySQL query statement below
SELECT wa.id
FROM Weather AS wa
INNER JOIN Weather AS wb
    ON wa.Temperature > wb.Temperature
    AND DATEDIFF(wa.recordDate, wb.recordDate) = 1