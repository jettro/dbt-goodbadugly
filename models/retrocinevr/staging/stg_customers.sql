with
customers as (
    select * from {{ ref("raw_customers")}}
),

staged as (
    select
        id as customer_id,
        first_name,
        last_name,
        email
    from customers
)

select * from staged