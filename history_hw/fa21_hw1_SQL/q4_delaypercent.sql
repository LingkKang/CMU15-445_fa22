WITH 
    late_count AS (
        SELECT
            ShipVia,
            COUNT(ShipVia) AS late_time
        FROM
            'Order'
        WHERE
            ShippedDate > RequiredDate
        GROUP BY
            ShipVia
    ),

    total_count AS (
        SELECT
            ShipVia,
            COUNT(ShipVia) AS total_time
        FROM
            'Order'
        GROUP BY
            ShipVia
    ),

    in_one_sheet AS (
        SELECT
            ShipVia,
            late_time,
            total_time
        FROM
            late_count
        Natural JOIN
            total_count
    )

SELECT 
    CompanyName,
    ROUND(CAST(late_time AS REAL) * 100 / total_time, 2) AS ratio
FROM
    in_one_sheet
JOIN 
    Shipper ON Shipper.Id = ShipVia
ORDER BY
    ratio DESC;
