with movies as (

    select * from {{source('retrocinevr','movies')}}

)

select * from movies