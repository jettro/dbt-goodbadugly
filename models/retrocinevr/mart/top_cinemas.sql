with

cinemas as (

    select * from {{ ref('stg_cinemas') }}
),

tickets as (
    select * from {{ ref('stg_tickets') }}
),

tickets_summary as (
    select
        cinema_id,
        sum(num_tickets) as ticket_count,
        sum(ticket_price*num_tickets) as total_ticket_fee
    from tickets

    group by 1
),

grouped_cinemas as (
    select
        cinemas.*,
        tickets_summary.ticket_count,
        tickets_summary.total_ticket_fee
    from cinemas
    left join tickets_summary on cinemas.cinema_id = tickets_summary.cinema_id
)

select * from grouped_cinemas order by total_ticket_fee desc

