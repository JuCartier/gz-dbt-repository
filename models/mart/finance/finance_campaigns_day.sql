SELECT date_date,
round(operational_margin - ads_cost,2) as ads_margin,
average_basket,
operational_margin,
ads_impression,
ads_click,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
logcost,
ship_cost
FROM {{ ref('finance_days') }}
LEFT JOIN {{ ref('int_campaigns_day') }}
USING(date_date)
order by 1 desc
