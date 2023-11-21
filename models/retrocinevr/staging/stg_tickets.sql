with
tickets as (
    select * from {{ ref("raw_tickets")}}
),

staged as (
    select
        id as ticket_id,
        movie_id,
        customer_id,
        cinema_id,
        booking_date,
        TO_DATE(booking_date, 'YYYYMMDD') as formatted_booking_date,
        show_time,
        ticket_price,
        num_tickets,
        _etl_loaded_at

    from tickets
)

select * from staged order by booking_date desc, ticket_id desc