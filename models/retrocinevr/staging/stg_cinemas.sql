with
cinemas as (
    select * from {{ ref("raw_cinemas")}}
),

staged as (
    select
        id as cinema_id,
        name,
        location,
        total_seats
    from cinemas
)

select * from staged