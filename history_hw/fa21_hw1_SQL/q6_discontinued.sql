WITH 
    CTE_A AS (
        SELECT
            'Order'.Id,
            CustomerId,
            ProductId,
            MIN(OrderDate)
        FROM
            'Order'
        JOIN
            OrderDetail ON 'Order'.Id = OrderDetail.OrderId
        -- WHERE
            -- ProductId % 8 = 1
        GROUP BY
            ProductId
)

SELECT
    ProductName,
    CompanyName,
    ContactName
FROM
    Customer
JOIN
    CTE_A ON Customer.Id = CTE_A.CustomerId
JOIN
    Product ON Product.Id = CTE_A.ProductId
WHERE
    Discontinued != 0
ORDER BY
    ProductName ASC;
