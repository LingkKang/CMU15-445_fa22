WITH 
    movies_and_actors_1955 AS (
        SELECT 
            people.person_id, 
            people.name, 
            titles.title_id 
        FROM 
            people 
        JOIN 
            titles ON titles.title_id = crew.title_id 
        JOIN 
            crew ON crew.person_id = people.person_id 
        WHERE 
            people.born = 1955 AND 
            titles.type = "movie" 
    ), 

    actor_ratings AS (
        SELECT 
            movies_and_actors_1955.name,
            ROUND(AVG(rating), 2) AS actor_rating
        FROM
            ratings
        JOIN 
            movies_and_actors_1955 ON movies_and_actors_1955.title_id = ratings.title_id
        GROUP BY 
            movies_and_actors_1955.person_id
        ORDER BY 
            actor_rating ASC,
            name DESC
    )

SELECT 
    name, 
    actor_rating
FROM (
    SELECT 
        name, 
        actor_rating, 
        NTILE (10) OVER () tile
    FROM 
        actor_ratings
)
WHERE 
    tile = 9
ORDER BY 
    actor_rating DESC,
    name ASC;
