with

tickets as (
    select * from {{ ref('stg_tickets') }}
),

grouped_tickets as (
    select
        formatted_booking_date as booking_date,
        sum(small_ticket::int) as small_groups_count,
        sum(medium_ticket::int) as medium_groups_count,
        sum(large_ticket::int) as large_groups_count,
        sum(extreme_ticket::int) as extreme_groups_count
    from tickets

    group by formatted_booking_date
)

select * from grouped_tickets