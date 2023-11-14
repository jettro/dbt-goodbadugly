with
movies as (
    select * from {{ ref("raw_movies")}}
),

staged as (
    select
        id as movie_id,
        replace(title, '"', '') as title,
        replace(synopsis, '"', '') as synopsis,
        VR_version_date,
        rating,
        replace(cover_image, '"', '') as cover_image

    from movies
)

select * from staged