with

movies as (

    select * from {{ ref('stg_movies') }}
),

tickets as (
    select * from {{ ref('stg_tickets') }}
),

tickets_summary as (
    select
        movie_id,
        count(ticket_id) as ticket_count,
        sum(ticket_price) as total_ticket_fee
    from tickets

    group by 1
),

grouped_tickets as (
    select
        movies.*,
        tickets_summary.ticket_count,
        tickets_summary.total_ticket_fee
    from movies
    left join tickets_summary on movies.movie_id = tickets_summary.movie_id
)

select * from grouped_tickets order by ticket_count desc

