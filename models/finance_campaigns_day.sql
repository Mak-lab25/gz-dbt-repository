SELECT
c.*, 
f.nb_transactions,
f.average_basket,
f.revenue,
ROUND((total_operational_margin-ads_cost),2) AS ads_margin
FROM {{ ref("int_campaigns_day") }} AS c
JOIN {{ ref("finance_days") }} AS f 
USING(date_date)

