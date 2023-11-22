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
        (num_tickets < 4) as small_ticket,
        (num_tickets > 3 and num_tickets < 10) as medium_ticket,
        (num_tickets > 9 and num_tickets < 100) as large_ticket,
        (num_tickets > 99) as extreme_ticket,
        _etl_loaded_at

    from tickets
)

select * from staged order by booking_date desc, ticket_id desc