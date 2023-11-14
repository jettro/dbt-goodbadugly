with

customers as (

    select * from {{ ref('stg_customers') }}
),

rentals as (
    select * from {{ ref('stg_rentals') }}
),

rental_summary as (
    select
        customer_id,
        count(rental_id) as rental_count,
        sum(rental_fee) as total_rental_fee
    from rentals

    group by 1
),

grouped_rentals as (
    select
        customers.customer_id,
        customers.email,
        customers.first_name || ' ' || customers.last_name as customer_name,
        rental_summary.rental_count,
        rental_summary.total_rental_fee
    from customers
    left join rental_summary on customers.customer_id = rental_summary.customer_id
)

select * from grouped_rentals
