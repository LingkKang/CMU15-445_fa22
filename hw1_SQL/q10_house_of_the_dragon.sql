WITH 
    dragon_titles AS (
        SELECT 
            title 
        FROM 
            titles 
        JOIN 
            akas ON titles.title_id = akas.title_id 
        WHERE 
            type = "tvSeries" AND 
            primary_title = "House of the Dragon" 
        GROUP BY title 
        ORDER BY title 
    ),

    dragon_and_rows AS (
        SELECT 
            ROW_NUMBER() OVER () AS num, 
            title 
        FROM dragon_titles 
    ), 

    final AS (
        SELECT 
            num, 
            title 
        from 
            dragon_and_rows 
        WHERE num = 1 

        UNION 

        SELECT 
            dragon_and_rows.num, 
            final.title || ", " || dragon_and_rows.title 
        FROM 
            dragon_and_rows 
        JOIN 
            final ON dragon_and_rows.num = final.num + 1 
    )

SELECT 
    title 
FROM 
    final 
ORDER BY num DESC 
LIMIT 1;
