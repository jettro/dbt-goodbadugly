with rentals as (

    select * from {{source('retrocinevr','rentals')}}

)

select * from rentals