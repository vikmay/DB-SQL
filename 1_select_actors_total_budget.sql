SELECT
    p.id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM
    characters c
    JOIN persons p ON c.actor_id = p.id
    JOIN movies m ON c.movie_id = m.id
GROUP BY
    p.id, p.first_name, p.last_name;