with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
    orders_id,
    shipping_fee,
    shipping_fee_1,
    logCost,
    cast(ship_cost as FLOAT64) as ship_cost,
    shipping_fee - shipping_fee_1 as diff

    from source

)

select * from renamed
