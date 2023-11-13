with
rentals as (
    select * from {{ ref("raw_rentals")}}
),

staged as (
    select
        id as rental_id,
        movie_id,
        customer_id,
        rental_date,
        TO_DATE(rental_date, 'YYYYMMDD') as formatted_rental_date,
        rental_fee,
        _etl_loaded_at

    from rentals
)

select * from staged