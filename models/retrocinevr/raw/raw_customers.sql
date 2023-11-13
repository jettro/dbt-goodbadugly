with customers as (

    select * from {{source('retrocinevr','customers')}}

)

select * from customers