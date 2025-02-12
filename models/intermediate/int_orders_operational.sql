SELECT
    a.orders_id,
    date_date,
    revenue,
    purchase_cost,
    shipping_fee,
    margin,
    logCost,
    ship_cost,
    quantity,
    round(margin + shipping_fee - logCost - ship_cost,2) as operational_margin
FROM {{ ref('int_orders_margin') }} a
left JOIN {{ ref('stg_raw__ship') }} b ON a.orders_id = b.orders_id
order by 1