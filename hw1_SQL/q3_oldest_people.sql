SELECT name, born
    FROM people
    WHERE
        born >= 1900 AND
        died IS NULL
    ORDER BY
        born ASC,
        name ASC
    LIMIT 20;
