SELECT name, person_count
    FROM people
    JOIN (
        SELECT person_id, COUNT(person_id) AS person_count
            FROM crew
            GROUP BY person_id
            ORDER BY person_count DESC
            LIMIT 20
        ) AS p_count
    ON people.person_id = p_count.person_id;
