# Write your MySQL query statement below

WITH cte AS
(
    SELECT s.student_id,
        s.student_name,
        su.subject_name
    FROM Students AS s
    JOIN Subjects AS su
    
)
SELECT s.student_id,
    s.student_name,
    s.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM cte AS s
LEFT JOIN Examinations AS e
    ON s.student_id = e.student_id
    AND s.subject_name = e.subject_name
GROUP BY s.student_id,
    s.subject_name
ORDER BY s.student_id,
    s.subject_name