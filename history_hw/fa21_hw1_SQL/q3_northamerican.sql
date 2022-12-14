SELECT
    Id,
    ShipCountry,
    IIF(
        ShipCountry = 'USA' OR 
        ShipCountry = 'Mexico' OR 
        ShipCountry = 'Canada',
        'NorthAmerica',
        'OtherPlace'
    ) place
FROM
    'Order'
WHERE
    Id >= 15445
ORDER BY
    Id ASC
LIMIT
    20;