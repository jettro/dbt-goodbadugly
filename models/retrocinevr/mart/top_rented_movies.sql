with

movies as (

    select * from {{ ref('stg_movies') }}
),

rentals as (
    select * from {{ ref('stg_rentals') }}
),

rental_summary as (
    select
        movie_id,
        count(rental_id) as rental_count,
        sum(rental_fee) as total_rental_fee
    from rentals

    group by 1
),

grouped_rentals as (
    select
        movies.*,
        rental_summary.rental_count,
        rental_summary.total_rental_fee
    from movies
    left join rental_summary on movies.movie_id = rental_summary.movie_id
)

select * from grouped_rentals
