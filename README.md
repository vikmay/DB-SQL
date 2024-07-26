# DB-SQL

erDiagram
USERS {
INT id PK
VARCHAR username
VARCHAR first_name
VARCHAR last_name
VARCHAR email
VARCHAR password
INT avatar_file_id FK
TIMESTAMP created_at
TIMESTAMP updated_at
}
FILES {
INT id PK
VARCHAR file_name
VARCHAR mime_type
VARCHAR key
VARCHAR url
TIMESTAMP created_at
TIMESTAMP updated_at
}
MOVIES {
INT id PK
VARCHAR title
TEXT description
NUMERIC budget
DATE release_date
INT duration
INT director_id FK
INT country_id FK
INT poster_file_id FK
TIMESTAMP created_at
TIMESTAMP updated_at
}
GENRES {
INT id PK
VARCHAR name
}
MOVIE_GENRES {
INT movie_id PK FK
INT genre_id PK FK
}
CHARACTERS {
INT id PK
VARCHAR name
TEXT description
VARCHAR role
INT movie_id FK
INT actor_id FK
TIMESTAMP created_at
TIMESTAMP updated_at
}
PERSONS {
INT id PK
VARCHAR first_name
VARCHAR last_name
TEXT biography
DATE date_of_birth
VARCHAR gender
INT country_id FK
INT primary_photo_file_id FK
TIMESTAMP created_at
TIMESTAMP updated_at
}
PERSON_PHOTOS {
INT person_id PK FK
INT file_id PK FK
}
FAVORITE_MOVIES {
INT user_id PK FK
INT movie_id PK FK
}
USERS ||--o{ FILES : "has avatar"
MOVIES ||--o{ FILES : "has poster"
MOVIES ||--o{ GENRES : "has genres"
MOVIES ||--o{ CHARACTERS : "has characters"
MOVIES ||--o{ PERSONS : "directed by"
PERSONS ||--o{ FILES : "has primary photo"
PERSONS ||--o{ PERSON_PHOTOS : "has photos"
FAVORITE_MOVIES ||--o{ USERS : "favorites"
FAVORITE_MOVIES ||--o{ MOVIES : "favorites"
