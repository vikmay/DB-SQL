SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object('file_name', f.file_name, 'url', f.url) AS poster,
    json_build_object('id', p.id, 'first_name', p.first_name, 'last_name', p.last_name, 'photo', json_build_object('file_name', pf.file_name, 'url', pf.url)) AS director,
    ARRAY_AGG(json_build_object('id', c.id, 'first_name', cp.first_name, 'last_name', cp.last_name, 'photo', json_build_object('file_name', cpf.file_name, 'url', cpf.url))) AS actors,
    ARRAY_AGG(json_build_object('id', g.id, 'name', g.name)) AS genres
FROM
    movies m
    JOIN persons p ON m.director_id = p.id
    JOIN files f ON m.poster_file_id = f.id
    JOIN characters c ON m.id = c.movie_id
    JOIN persons cp ON c.actor_id = cp.id
    JOIN files cpf ON cp.primary_photo_file_id = cpf.id
    JOIN movie_genres mg ON m.id = mg.movie_id
    JOIN genres g ON mg.genre_id = g.id
    LEFT JOIN person_photos pp ON p.id = pp.person_id
    LEFT JOIN files pf ON pp.file_id = pf.id
WHERE
    m.id = 1
GROUP BY