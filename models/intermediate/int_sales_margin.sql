WITH sales_data AS (
    SELECT
        a.orders_id,
        a.date_date,
        a.quantity,
        a.revenue,
        b.purchase_price,
        (b.purchase_price * a.quantity) AS purchase_cost
    FROM {{ ref('stg_raw__sales') }} AS a
    LEFT JOIN {{ ref('stg_raw__product') }} AS b
    USING (products_id)
)
SELECT
    orders_id,
    {{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent,
    date_date,
    quantity,
    purchase_price,
    revenue,
    purchase_cost,
    ROUND((revenue - purchase_cost), 2) AS margin
FROM sales_data












