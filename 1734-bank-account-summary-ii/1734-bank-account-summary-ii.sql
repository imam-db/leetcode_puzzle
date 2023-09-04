# Write your MySQL query statement below

SELECT u.name,
    SUM(amount) AS balance
FROM Users AS u
INNER JOIN Transactions AS t
ON u.account = t.account
GROUP BY u.account
HAVING SUM(amount) > 10000