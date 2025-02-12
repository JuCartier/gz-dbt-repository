SELECT
    a.orders_id,
    date_date,
    margin,
    revenue,
    purchase_cost,
    shipping_fee,
    logCost,
    ship_cost,
    quantity,
    round(margin + shipping_fee - logCost - cast(ship_cost as FLOAT64),2) as Operational_margin
FROM {{ ref('int_orders_margin') }} a
left JOIN {{ ref('stg_raw__ship') }} b ON a.orders_id = b.orders_id
