with
movies as (
    select * from {{ ref("raw_movies")}}
),

staged as (
    select
        id as movie_id,
        title,
        synopsis,
        VR_version_date,
        rating,
        cover_image

    from movies
)

select * from staged