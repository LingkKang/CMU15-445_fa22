SELECT 
    decades, 
    ROUND(AVG(rating), 2) AS avg_rating, 
    MAX(rating), 
    MIN(rating), 
    COUNT(decades) 
FROM ratings 
JOIN (
    SELECT 
        title_id, 
        CAST(CAST(ROUND(premiered / 10) * 10 AS INT) AS TEXT) || 's' AS decades 
    FROM titles 
    WHERE premiered IS NOT NULL 
) AS title_with_decades 
ON title_with_decades.title_id = ratings.title_id 
GROUP BY decades 
ORDER BY 
    avg_rating DESC, 
    decades ASC;
