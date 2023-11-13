with cinemas as (

    select * from {{source('retrocinevr','cinemas')}}

)

select * from cinemas