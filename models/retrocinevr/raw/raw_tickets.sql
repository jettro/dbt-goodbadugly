with tickets as (

    select * from {{source('retrocinevr','tickets')}}

)

select * from tickets