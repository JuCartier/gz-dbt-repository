SELECT 
    DATE_TRUNC(date_date, MONTH) as month_start,
    round(SUM(ads_margin),2) as ads_margin,
    round(SUM(average_basket),2) as average_basket,
    round(SUM(operational_margin),2) as operational_margin,
    SUM(ads_impression) as ads_impression,
    SUM(ads_click) as ads_click,
    SUM(quantity) as quantity,
    round(SUM(revenue),2) as revenue,
    round(SUM(purchase_cost),2) as purchase_cost,
    round(SUM(margin),2) as margin,
    SUM(shipping_fee) as shipping_fee,
    SUM(logcost) as logcost,
    SUM(ship_cost) as ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY 1
ORDER BY 1 DESC