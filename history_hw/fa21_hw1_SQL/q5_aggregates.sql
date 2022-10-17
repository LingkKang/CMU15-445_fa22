SELECT
    CategoryName,
    COUNT(CategoryId) AS cat_count,
    ROUND(AVG(UnitPrice), 2) AS avg_price,
    MIN(UnitPrice) AS min_price,
    MAX(UnitPrice) AS max_price,
    SUM(UnitsOnOrder) AS total
FROM Product
JOIN
    Category ON Category.Id = CategoryId
GROUP BY
    CategoryId
HAVING
    cat_count > 10
ORDER BY
    CategoryId;
