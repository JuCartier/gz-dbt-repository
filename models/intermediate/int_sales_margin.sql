SELECT
    orders_id,
    date_date,
    revenue,
    quantity,
    round(quantity * purchase_price,2) as purchase_cost,
    round(revenue - quantity * purchase_price,2) as margin
FROM {{ ref('stg_raw__sales') }} a
JOIN {{ ref('stg_raw__product') }} b ON a.products_id = b.products_id
