SELECT 
    DISTINCT name 
FROM people 
JOIN (
    -- get the list of colleagues' id 
    SELECT 
        DISTINCT crew.person_id 
    FROM crew 
    WHERE 
        (
            category = 'actor' OR 
            category = 'actress' 
        ) AND 
        crew.title_id IN (
            -- get all the movie title id of Kidman 
            SELECT 
                DISTINCT title_id 
            FROM crew 
            WHERE 
                crew.person_id = (
                    -- get the person id of Kidman 
                    SELECT people.person_id 
                    FROM people 
                    WHERE 
                        name = 'Nicole Kidman' AND 
                        born = 1967
                )
        )
) AS list 
ON 
    people.person_id = list.person_id 
ORDER BY name ASC;
