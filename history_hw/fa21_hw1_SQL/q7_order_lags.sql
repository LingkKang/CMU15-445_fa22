WITH 
    CTE_A AS (
        SELECT
            Id,
            OrderDate,
            LAG(OrderDate, 1, OrderDate) OVER (
                ORDER BY OrderDate
            ) previous_date
        FROM
            'Order'
        WHERE
            CustomerId LIKE 'BLONP'
        LIMIT 10
)

SELECT 
    Id,
    OrderDate,
    previous_date,
    ROUND(julianday(OrderDate) - julianday(previous_date), 2)
FROM
    CTE_A
ORDER BY
    OrderDate;
