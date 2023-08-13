WITH cte AS
(
    SELECT s.id, 
            s.visit_date, 
            s.people,
            s.id - ROW_NUMBER() OVER(ORDER BY visit_date) AS grp
    FROM Stadium AS s
        WHERE s.people >= 100
),
cte_final AS
(
    SELECT id,
        visit_date,
        people,
        COUNT(*) OVER(PARTITION BY grp) AS cnt
    FROM cte
)
SELECT id,
    visit_date,
    people
FROM cte_final
WHERE cnt >= 3
ORDER BY visit_date

