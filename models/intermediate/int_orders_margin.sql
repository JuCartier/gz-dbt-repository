SELECT
    a.orders_id,
    date_date,
    round(sum(revenue),2) as revenue,
    round(sum(quantity),2) as quantity,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(margin),2) as margin
FROM {{ ref('int_sales_margin') }} a
left JOIN {{ ref('stg_raw__ship') }} b ON a.orders_id = b.orders_id
group by 1,2