WITH
    CTE_A AS (
        SELECT
            'Order'.Id AS order_id,
            CustomerId,
            strftime('%Y-%m-%d', OrderDate) AS new_date,
            ProductId
        FROM
            'Order'
        JOIN
            OrderDetail ON OrderDetail.OrderId = 'Order'.Id
        WHERE
            new_date = '2014-12-25'
    ),

    CTE_B AS (
        SELECT
            order_id,
            ProductId
        FROM
            Customer
        JOIN
            CTE_A ON CTE_A.CustomerId = Customer.Id
        WHERE
            CompanyName = 'Queen Cozinha'
    ),

    CTE_C AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY ProductId ASC) row_num,
            ProductName
        FROM
            CTE_B
        JOIN
            Product ON Product.Id = CTE_B.ProductId
    ),

    CTE_D AS (
        SELECT
            row_num,
            ProductName
        FROM
            CTE_C
        WHERE
            row_num = 1

        UNION

        SELECT
            CTE_C.row_num,
            CTE_D.ProductName || ', ' || CTE_C.ProductName
        FROM
            CTE_C
        JOIN
            CTE_D ON CTE_D.row_num + 1 = CTE_C.row_num
    )

SELECT
    ProductName
FROM
    CTE_D
ORDER BY
    row_num DESC
LIMIT 1;
