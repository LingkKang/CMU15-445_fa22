SELECT 
    primary_title, 
    votes 
FROM titles 
JOIN (
    SELECT 
        DISTINCT ratings.title_id, 
        votes 
    FROM ratings 
    JOIN (
        SELECT crew.title_id 
        FROM crew 
        WHERE person_id = (
            SELECT person_id 
            FROM people 
            WHERE 
                born = 1962 AND 
                name LIKE '%Cruise%' 
        )
    ) AS Cruise_title 
    ON 
        ratings.title_id = Cruise_title.title_id 
    ORDER BY votes DESC 
    LIMIT 10 
) AS Cruise_movie 
ON 
    Cruise_movie.title_id = titles.title_id;
