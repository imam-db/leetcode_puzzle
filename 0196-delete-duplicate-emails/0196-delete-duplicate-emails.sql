# Write your MySQL query statement below
DELETE
FROM Person
WHERE Id
NOT IN
(
    SELECT p.Id
    FROM
    (
        SELECT Email, MIN(Id) AS Id
        FROM Person
        GROUP BY Email
    ) AS p
)