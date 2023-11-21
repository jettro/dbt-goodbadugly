with

movies as (

    select * from {{ ref('stg_movies') }}
),

rentals as (
    select * from {{ ref('stg_rentals') }}
),

tickets as (
    select * from {{ ref('stg_tickets')}}
),

rental_summary as (
    select
        movie_id,
        count(rental_id) as rental_count,
        sum(rental_fee) as total_rental_fee
    from rentals

    group by 1
),

tickets_summary as (
    select
        movie_id,
        sum(num_tickets) as ticket_count,
        sum(ticket_price*num_tickets) as total_ticket_fee
    from tickets

    group by 1
),

grouped_rentals as (
    select
        movies.*,
        rental_summary.rental_count,
        rental_summary.total_rental_fee,
        tickets_summary.ticket_count,
        tickets_summary.total_ticket_fee,
        coalesce(rental_summary.rental_count, 0) + coalesce(tickets_summary.ticket_count, 0) as total_times_watched,
        coalesce(rental_summary.total_rental_fee, 0) + coalesce(tickets_summary.total_ticket_fee, 0) as total_fee
    from movies
    left join rental_summary on movies.movie_id = rental_summary.movie_id
    left join tickets_summary on movies.movie_id = tickets_summary.movie_id
)

select * from grouped_rentals order by total_fee desc
