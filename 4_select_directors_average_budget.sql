SELECT
    p.id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    AVG(m.budget) AS average_budget
FROM
    movies m
    JOIN persons p ON m.director_id = p.id
GROUP BY
    p.id, p.first_name, p.last_name;