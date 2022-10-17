WITH 
    Id_and_Exp AS (
        SELECT
            OrderId,
            SUM(ROUND(UnitPrice * Quantity, 2)) AS Order_Exp
        FROM
            OrderDetail
        GROUP BY
            OrderId
        -- ORDER BY
        --     Order_Exp DESC
    ),

    Exp_and_Cust AS (
        SELECT
            CustomerId,
            SUM(Order_Exp) AS Comp_Exp
        FROM
            Id_and_Exp
        JOIN
            'Order' ON 'Order'.Id = Id_and_Exp.OrderId
        GROUP BY
            CustomerId
        ORDER BY
            Comp_Exp DESC
    ),

    Quartile AS (
        SELECT
            CustomerId,
            Comp_Exp,
            NTILE(10) OVER (ORDER BY Comp_Exp) Tile
        FROM
            Exp_and_Cust
    )

SELECT
    IFNULL(CompanyName, 'MISSING_NAME') CompanyName,
    CustomerId,
    Comp_Exp
FROM
    Quartile
JOIN
    Customer ON Customer.Id = Quartile.CustomerId
WHERE
    Tile = 1
ORDER BY
    Comp_Exp DESC;
