select date_date,
count(orders_id) as nb_transactions,
round(sum(revenue),2) as revenue,
round(sum(margin),2) as margin,
round(avg(revenue),2) as average_basket,
round(sum(operational_margin),2) as operational_margin,
ROUND(SUM(purchase_cost),0) AS purchase_cost,
ROUND(SUM(shipping_fee),0) AS shipping_fee,
ROUND(SUM(logCost),0) AS logcost,
ROUND(SUM(ship_cost),0) AS ship_cost,
SUM(quantity) AS quantity
FROM {{ ref('int_orders_operational') }}
group by 1
order by 1 desc
