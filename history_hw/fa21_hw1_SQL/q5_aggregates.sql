SELECT
    CategoryName,
    COUNT(CategoryId) AS cat_count,
    ROUND(AVG(UnitPrice), 2) AS avg_price,
    MIN(UnitPrice) AS min_price,
    MAX(UnitPrice) AS max_price
FROM Product
JOIN
    Category ON Category.Id = CategoryId
GROUP BY
    CategoryId;
