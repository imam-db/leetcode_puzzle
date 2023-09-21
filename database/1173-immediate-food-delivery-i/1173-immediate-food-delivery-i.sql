# Write your MySQL query statement below

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100,2) AS immediate_percentage
FROM Delivery AS d
