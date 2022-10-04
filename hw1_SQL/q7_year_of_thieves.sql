SELECT 
    COUNT(DISTINCT title_id) 
FROM titles 
WHERE 
    titles.premiered = (
        SELECT premiered 
        FROM titles 
        WHERE 
            titles.title_id = (
                SELECT 
                    DISTINCT title_id 
                FROM akas 
                WHERE title = 'Army of Thieves' 
            ) 
    );
